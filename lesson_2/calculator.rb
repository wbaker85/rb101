OPERATIONS = %w(add subtract multiply divide)

def valid_int?(str)
  str.match?(/^\d+$/)
end

def valid_float?(str)
  str.match?(/^\d*\.?\d*$/) && str.match?(/\d+/)
end

def user_number(prompt_msg)
  puts prompt_msg
  input = gets.chomp
  return input.to_f if valid_int?(input) || valid_float?(input)
  puts 'Invalid input!'
  user_integer(prompt_msg)
end

def user_operation
  puts "Enter the operation (#{OPERATIONS.join(', ')})"
  operation = gets.chomp
  found_op = OPERATIONS.find { |oper| oper.start_with?(operation) }
  return found_op if found_op
  puts 'Invalid operation'
  user_operation()
end

def calculate(num1, num2, operation)
  result =  case operation
            when 'add'
              num1 + num2
            when 'subtract'
              num1 - num2
            when 'multiply'
              num1 * num2
            when 'divide'
              if num2.zero?
                "Can't divide by 0"
              else
                num1.to_f / num2.to_f
              end
            end
  result
end

num1 = user_number('Enter the first number (integer or float)')
num2 = user_number('Enter the second number (integer or float)')
operation = user_operation()

p calculate(num1, num2, operation)
