class Task < ApplicationRecord
    validates :content,presence: true,lengh:{maximum: 10}
    validates :status,presence: true,lengh:{maximum: 10}
end
