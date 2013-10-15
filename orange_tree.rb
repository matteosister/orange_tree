# Make an OrangeTree class. It should have a height method
# which returns its height, and a one_year_passes method,
# which, when called, ages the tree one year. Each year the tree
# grows taller (however much you think an orange tree should
# grow in a year), and after some number of years (again, your
# call) the tree should die. For the first few years, it
# should not produce fruit, but after a while it should,
# and I guess that older trees produce more each year than
# younger trees... whatever you think makes most sense. And,
# of course, you should be able to count_the_oranges
# (which returns the number of oranges on the tree),
# and pick_an_orange (which reduces the @orange_count by one
# and returns a string telling you how delicious the orange
# was, or else it just tells you that there are no more
# oranges to pick this year). Make sure that any oranges
# you don't pick one year fall off before the next year.

class OrangeTree
  attr_reader :age, :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
  end

  def alive?
    @age < 10
  end

  def one_year_passes
    @age += 1
    @height += 2
    @fruits = @age ** 2 if @age >= 3
  end

  def count_the_oranges
    @fruits
  end

  def pick_an_orange
    if @fruits > 0 and alive?
      @fruits -= 1
      'here is a juicy orange!'
    else
      'No more juice! :('
    end
  end
end
