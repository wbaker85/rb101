def valid_float?(str)
  str.match?(/\d+/) && str.match?(/^\d*\.?\d*$/)
end

def valid_int?(str)
  str.match?(/^\d+$/)
end

def monthly_payment(amount, rate, duration)
  monthly_rate = rate / 12 / 100
  amount * (monthly_rate / (1 - (1 + monthly_rate)**(-duration)))
end

def user_amount
  puts 'Enter the loan amount ($123.12)'
  input = gets.chomp
  return input.to_f if valid_float?(input)
  puts 'Invalid input'
  user_amount
end

def user_duration
  puts 'Enter the duration in months (12)'
  input = gets.chomp
  return input.to_i if valid_int?(input)
  puts 'Invalid input'
  user_duration
end

def user_rate
  puts 'Enter the loan rate (4.5)'
  input = gets.chomp
  return input.to_f if valid_float?(input)
  puts 'Invalid input'
  user_rate
end

def do_one_calc
  amount = user_amount
  duration = user_duration
  apr = user_rate
  result = monthly_payment(amount, apr, duration)
  p "Your monthly payment is $#{format('%02.2f', result)}"
end

puts 'Welcome to calculator'

loop do
  do_one_calc
  puts 'Do another calculation?  Y to do another one, any other input to close.'
  break if gets.chomp.downcase != 'y'
end
