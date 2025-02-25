module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield element, index
      index += 1
    end
    self
  end

  def my_select
    result = []
    my_each do |element|
      result << element if yield element
    end
    result
  end

  def my_all?
    my_each do |element|
      return false unless yield element
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield element
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield element
    end
    true
  end

  def my_count
    count = 0
    my_each do |element|
      count += 1 if block_given? ? yield(element) : true
    end
    count
  end

  def my_map
    result = []
    my_each do |element|
      result << (block_given? ? yield(element) : element)
    end
    result
  end

  def my_inject(initial_value = nil)
    accumulator = initial_value.nil? ? first : initial_value
    my_each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield element
    end
  end
end
