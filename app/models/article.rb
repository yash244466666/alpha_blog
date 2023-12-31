class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6, maximum: 500}
    validates :description, presence: true, length: {minimum: 10, maximum: 3000}
  
end