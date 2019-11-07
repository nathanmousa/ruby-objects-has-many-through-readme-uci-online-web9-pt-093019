class Waiter
  attr_accessor :name, :yrs_of_exp
  @@all = []

  def initialize(name, yrs_of_exp)
    @name = name
    @yrs_of_exp = yrs_of_exp
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    meal_with_best_tip = meals.max{|meal_instance_a, meal_instance_b| meal_instance_a.tip <=> meal_instance_b.tip}
    meal_with_best_tip.customer
  end
end