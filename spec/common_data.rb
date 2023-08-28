# common_data.rb

module CommonData
  def self.regular_user_params
    {
      user: {
        name: 'John Doe',
        role: 'regular',
        age: 30,
        email: 'john@example.com',
        address: { street: '123 Main St', city: 'New York', state: 'NY', zip_code: '10001' },
        photo: 'profile.jpg',
        password: 'secret_password',
        password_confirmation: 'secret_password'
      }
    }
  end

  def self.doctor_params
    {
      user: {
        name: 'Dr. Smith',
        role: 'doctor',
        age: 40,
        email: 'smith@example.com',
        address: { street: '456 Oak St', city: 'Los Angeles', state: 'CA', zip_code: '90001' },
        photo: 'doctor_profile.jpg',
        password: 'doctor_password',
        password_confirmation: 'doctor_password',
        qualification: 'MD',
        description: 'Experienced doctor',
        experiences: 10,
        available_from: '2023-08-10T09:00:00Z',
        available_to: '2023-08-10T17:00:00Z',
        consultation_fee: 100.0,
        rating: 4.5,
        specialization: 'Cardiology'
      }
    }
  end
end
