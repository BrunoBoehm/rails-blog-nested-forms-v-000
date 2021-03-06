class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  # def tag_attributes=(attributes)
  # 	attributes.each do |attribute|
  # 		self.tags << Tag.find_or_create_by(name: attribute) unless attribute.blank?
  # 	end
  # end
end
