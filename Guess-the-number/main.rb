if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts("Привет! Меня зовут Джек. Как я могу называть тебя?")
user = gets.chomp # запрос имени
puts("Хорошо, #{user}. Давай сыграем в игру \"Угадай-ка!\".\nЯ загадываю число от 1 до 16, у тебя 3 попытки, чтобы его отгадать.")
number = rand(1..16) # рандомное число (загаданное)
attempts = 4 # кол-во попыток
answer = nil # ответ пользователя

# Функция сравнивает введенный ответ с загаданным числом
def answer_false(answer, number)
	if answer > number
		(answer - number).abs <= 2 ? 
			puts(">> Тепло, но нужно меньше!") : 
			puts(">> Холодно, нужно меньше!")
	elsif answer < number
		(number - answer).abs <= 2 ? 
			puts(">> Тепло, но нужно больше!") : 
			puts(">> Холодно, нужно больше!")
	end
end

# Цикл выполняется, пока не закончатся попытки, либо не будет отгаданно число
while (number != answer) & (attempts != 0)
	attempts-=1
	answer = gets.to_i

	answer == number ? 
		puts("Совершенно верно! Мой число - #{number}. Ты отгадал его за #{3 - attempts} попыток!") : 
		answer_false(answer, number)
end

((attempts == 0) & (number != answer)) ? puts("Увы, ты проиграл. Моё число - #{number}.") : nil