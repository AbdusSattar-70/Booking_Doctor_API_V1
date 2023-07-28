class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: 'patient_id'
  before_save :downcase_role

  scope :doctors, -> { where(role: 'doctor') }
  scope :patients, -> { where(role: 'patient') }
  scope :admin_users, -> { where(role: 'admin') }

  validates :name, :email, :photo, :age, :role, :address, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 6 }
  # validates :qualification, :description, :experiences, :available_from, :available_to, :consultation_fee, :rating, :specialization, presence: true, if: :doctor?

  ROLES = %w[super_admin admin doctor patient general].freeze

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role = role_name
    end
  end

  def appointments
   case role
    when 'doctor'
      doctor_appointments
    when 'patient'
      patient_appointments
    else
      []
    end
  end

  def jwt_payload
    super
  end

  private

  def downcase_role
    self.role = role.downcase
  end

end
