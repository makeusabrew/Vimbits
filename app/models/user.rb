class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates :password, length: { minimum: 3, maximum: 254 }
  validates :username, length: { minimum: 3, maximum: 40 }
  validates :email, length: { minimum: 3, maximum: 254 }
  validates :email, format: { with: /.+\@.+\..+/, message: 'Invalid email address.' }

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  attr_accessible :email, :password, :password_confirmation, :username
  has_many :bits
  acts_as_voter
end
