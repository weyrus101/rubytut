puts "Введите числа через пробел"
numbers = STDIN.gets

numbers_a = numbers.split(" ") # Преобразовываем в массив
divider = numbers_a.size # Кол-во элементов (делитель)
result = 0

(0..(divider-1)).each do |i|
	result = result + numbers_a[i].to_f
end

result = result / divider

puts "Среднее арифметическое: #{result}"