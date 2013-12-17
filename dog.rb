require 'mysql2'
require 'debugger'
class Dog
  
  attr_accessor :name, :color, :id 
  @@db = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "dogs")
 
  def initialize (name, color)
    @name = name
    @color = color
  end

  def insert 
    db.query("
      INSERT 
      INTO dogs (name, color)
      VALUES ('#{self.name}', '#{self.color}');
      ")
      
  end


  def self.find(id)
    db.query("
      SELECT *
      FROM dogs
      WHERE id = #{id}
      ")
  end

  def update
    db.query("
      UPDATE dogs
        SET name = '#{self.name}',
        color = '#{self.color}'
        WHERE id = #{self.id}
      ")
  end
  def delete
    db.query("
      DELETE FROM dogs
      WHERE id= '#{self.id};
      ")
  end
  def self.db
    @@db
  end

  def db
    @@db
  end


end
 
dog1 = Dog.new('awesome', 'lightbrown')
dog1.insert
dog1.update
debugger

dog1.delete
dog = Dog.find(1)
debugger
puts 'hi'
 
  # color, name, id
  # db
  # find_by_att
  # find
  # insert
  # update
  # delete/destroy
 
  # refactorings?
  # new_from_db?
  # saved?
  # save! (a smart method that knows the right thing to do)
  # unsaved?
  # mark_saved!
  # ==
  # inspect
  # reload
  # attributes