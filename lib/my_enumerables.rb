module Enumerable
  # Your code goes here

  def my_each_with_index
    if block_given?
      idx = 0
      for my_val in self
        yield(my_val,idx)
        idx+= 1
      end
    end
    self
  end

  def my_select
    output_arr = []
    if block_given?
      self.my_each do |arr_value|
        output_arr.push(arr_value) if (yield(arr_value) == true)
      end
    end
    return output_arr
  end

  def my_all?
    if block_given?
      check_arr = self.my_select {|arr_elem| yield(arr_elem)}
    elsif self.length == 0
      return true
    else #if no block given
      return (self.my_select {|arr_elem| arr_elem.nil?}.length > 0 ) ? false : true
    end
    return check_arr.length == self.length 
  end

  def my_any?
    if block_given?
      check_arr = self.my_select {|arr_elem| yield(arr_elem)}
    else #if no block given
      return false
    end
    return check_arr.length > 0
  end




  #final end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for i in self
        yield(i)
      end
    end
    self
  end
end

