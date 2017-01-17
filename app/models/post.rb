class Post < ActiveRecord::Base
	has_many :comments
	validates :title, presence: true
	validates :body, presence: true
	validates :title, length: {minimum: 2}
	validates :body, length: {minimum: 4}
end
