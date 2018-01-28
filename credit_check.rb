class CreditCheck

  def initialize(card_number)
    @card_number = card_number
    @valid = nil
  end

  def convert_to_integers_and_reverse
    @card_number.to_i.digits
  end

  def multiply_every_other_digit_by_2
    card = convert_to_integers_and_reverse.map.with_index do |digit,index|
      if index % 2 == 0
        digit
      else
        digit * 2
      end
    end
  end

  def convert_string_to_integer(element)
    element.to_s.chars.map do |string|
      string.to_i
    end
  end

  def sum_digits_over_ten
    card = []
    multiply_every_other_digit_by_2.each do |element|
      if element > 9
        card << convert_string_to_integer(element).reduce(:+)
      else
        card << element
      end
    end
    card
  end

  def sum_of_all_digits
    sum_digits_over_ten.reduce(:+)
  end

  def validate_card
    if sum_of_all_digits % 10 == 0
      @valid = true
      puts "The number is valid!"
    else
      @valid = false
      puts "The number is invalid!"
    end
  end
end

credit_check = CreditCheck.new("5541808923795240")
credit_check = CreditCheck.new("4024007136512380")
credit_check = CreditCheck.new("6011797668867828")
credit_check = CreditCheck.new("5541801923795240")
credit_check = CreditCheck.new("4024007106512380")
credit_check = CreditCheck.new("6011797668868728")
credit_check.validate_card
