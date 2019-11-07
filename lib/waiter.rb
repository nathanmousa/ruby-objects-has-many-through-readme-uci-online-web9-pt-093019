class Waiter
  attr_accessor :name, :years_of_experience
  @@all = []

  def initialize(name, years_of_experience)
    @name, @years_of_experience = name, years_of_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{|meal_instance| meal_instance.waiter == self}
  end

  def best_tipper
    meal_with_best_tip = meals.max{|meal_instance_a, meal_instance_b| meal_instance_a.tip <=> meal_instance_b.tip}
    meal_with_best_tip.customer
  end
end