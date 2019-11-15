class Message < ApplicationRecord
    validates :content, presence: true, length: { maximum: 255 }
    validates :title, presence: true, length: { macimum: 255 }
end
