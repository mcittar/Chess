class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, salary, title, boss = nil)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def set_employee
    @boss.employees << self
  end

end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, salary, title, boss = nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    bonus = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        bonus += employee.bonus(1)
      end
      bonus += employee.salary
    end

    bonus * multiplier
  end

end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", 1000000, "Founder")
  darren = Manager.new("Darren", 78000, "TA Manager", ned)
  shawna = Employee.new("Shawna", 12000, "TA", darren)
  david = Employee.new("David", 10000, "TA", darren)

  david.set_employee
  shawna.set_employee
  darren.set_employee

  puts ned.bonus(5) # => 500_000
  puts darren.bonus(4) # => 88_000
  puts david.bonus(3) # => 30_000
end
