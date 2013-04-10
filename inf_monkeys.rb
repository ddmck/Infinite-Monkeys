#sample = "The quick brown fox jumps over the lazy dog"

sample = "aa"

def stringGen(sample)
  counter = 0
  result = "" 
	until counter == sample.length
		result << letterSelect()
    counter += 1
	end
  return result
end

def letterSelect()
  letters = ("a".."z").to_a
  letters << " "
  return letters[rand(letters.length)]
end

def roboTyper(sample)
  attempts = 0
  attempt = stringGen(sample)
  until sample.downcase == attempt
    attempt = stringGen(sample)
    attempts += 1
  end
  return attempts
end

def aveTime(cycles, sample)
  counter = 0
  times = []
  until counter == cycles
    times << roboTyper(sample)
    counter += 1
  end
  return times, arrayAve(times)
end

def arrayAve(values)
  total = 0
  values.each { |x| total += x}
  return total/values.length
end

def stdDev(times, ave)
  arr = []
  times.each { |x| arr << (x - ave)**2 }
  return Math.sqrt(arrayAve(arr))
end

times, ave = aveTime(1000, sample)

print times, "\n"
puts "#{ave} +/- #{stdDev(times, ave)}"
