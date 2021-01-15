# require "pry"
# class Triangle

#   attr_reader :x, :y, :z
  
#   def initialize (x, y, z)
#     @x = x 
#     @y = y
#     @z = z
#   end

#   def kind 
#     validate_triangle
#     if x == y && x == z
#       return :equilateral
#     elsif x == y || x == z || y == z
#       return :isosceles
#     else
#       return :scalene
#     end 
#   end

#   def validate_triangle
#     real_triangle = [(x + y > z), (x + z > y), (y + z > x)]
#     [x,y,z].each {|side| 
#       real_triangle << false if side <= 0
#     raise TriangleError if real_triangle.include?(false)
#   }
#   end
# end 

# class TriangleError < StandardError
#   def message
#     "This is not a valid triangle."
#   end
# end


class Triangle
  attr_accessor :sides
  
  @sides = []
  
  def initialize (side1, side2, side3)
    @sides = [side1, side2, side3]
    @sides.sort!
  end
  
  def kind
    if @sides.any?{|side| side <= 0} || ((@sides[0] + @sides[1]) <= @sides[2])
      raise TriangleError
    elsif @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end
  
  class TriangleError < StandardError
    
  end
end



