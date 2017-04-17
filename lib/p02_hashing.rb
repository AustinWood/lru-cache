class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    length = self.length
    hashed_arr = self.map{ |el| el.hash }
    new_arr = []
    hashed_arr.each_with_index do |el, i|
      new_arr << el * (i + 1)
    end
    new_arr << 123
    length + new_arr.inject(:+) + new_arr.inject(:*)
  end
end

class String
  def hash
    ord_arr = self.chars.map { |char| char.ord }
    ord_arr.hash
  end
end

class Hash
  def hash
    keys = self.keys
    vals = self.values
    keys.sort.hash + vals.sort.hash
  end
end
