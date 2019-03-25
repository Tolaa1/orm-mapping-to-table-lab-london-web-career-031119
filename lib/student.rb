# class Student
#  attr_reader :id
# attr_accessor :name, :grade,
#   def initialize(name, grade, id=nil)
#     @id = id
#     @name = name
#     @grade = grade
#   end
#
# def self.create_table(name,grade)
#   student.new(name, grade)
#   sql = <<-SQL
#   CREATE TABLE (id INTEGER PRIMARY KEY,
#     name TEXT, grade INTEGER ) SQL
#     DB[:conn].execute(sql)
# end
# end
#
# def self.drop_table(name,grade)
#   sql = <<-SQL
#   DROP TABLE(id INTEGER PRIMARY KEY,
#   name TEXT, grade INTEGER)
#   SQL
#   DB[:conn].execute(sql, self.name, self.grade)
# end
#
# def save
#   sql = <<-SQL
# INSERT INTO students(name, grade )SQL
# DB [:conn].execute(sql,self.name, self.grade)
# end
#
# def self.create(name,grade)
#   Student.new(self, grade,id)
# end
#
# def self.create_table
#   sql <<- SQL(PRIMARY KEY,
#   INTEGER, id,name TEXT, grade INTEGER)
#   SQL
#   DB[:conn].execute(sql)
#   end





class Student
attr_accessor :name, :grade
attr_reader :id

def initialize(id=nil, name, grade)
  @id = id
  @name = name
  @grade = grade
end


def self.create_table
  sql =  <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
      )
  SQL
  DB[:conn].execute(sql)
  DB[:conn].execute(sql)
end

def self.drop_table
  sql = "DROP TABLE IF EXISTS students"
  DB[:conn].execute(sql)
  DB[:conn].execute(sql)
end


def save
  sql = <<-SQL
    INSERT INTO students (name, grade)
    VALUES (?, ?)
  SQL

  DB[:conn].execute(sql)
  @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students", name)[0][0]

end

def self.create(name:, grade:)
  student = Student.new(name, grade)
  student.save
  student
end

end
