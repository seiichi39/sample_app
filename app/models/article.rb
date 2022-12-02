class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title,  presence: true, length: { maximum: 10 }
end
