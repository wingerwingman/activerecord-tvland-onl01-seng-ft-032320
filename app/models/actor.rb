class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name 
    name = "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    roles = []
    array_of_chars = self.characters.map {|c| c.name}
    array_of_shows = self.shows.map {|s| s.name}
    role = array_of_chars.concat array_of_shows 
    roles << role.join(" - ")
    roles
  end

end