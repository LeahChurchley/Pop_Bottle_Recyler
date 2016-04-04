@free_bottles_from_empties = 0
@free_bottles_from_caps = 0


@full_bottle_cost = 2

def initial_num_of_bottles(money_amt)
   money_amt / @full_bottle_cost
end

def free_num_of_bottles(empties, caps)
  new_free_bottles = (empties / 2 + caps / 4)
  @leftover_bottles = empties % 2 
  @leftover_caps = caps % 4
  new_empties = new_free_bottles + @leftover_bottles
  new_caps = new_free_bottles + @leftover_caps

  @free_bottles_from_empties += (empties / 2)
  @free_bottles_from_caps += (caps / 4)

  if new_empties < 2 && new_caps < 4
    return new_free_bottles
  else 
    return new_free_bottles + free_num_of_bottles(new_empties, new_caps)
  end

end


def ask_question
  loop do 
    puts "How much money would you like to invest in this bottle scam?"
    money_amt = gets.chomp.to_i

    n = initial_num_of_bottles(money_amt)

    puts "You purchased #{initial_num_of_bottles(money_amt)} bottles."
    puts "You get #{free_num_of_bottles(n, n)} free bottles. Good for you."
    puts "You have #{@leftover_bottles} leftover bottles and #{@leftover_caps} leftover caps."
    puts "You got #{@free_bottles_from_empties} free bottles from empty cans."
    puts "You got #{@free_bottles_from_caps} free bottles from caps."

    @free_bottles_from_empties = 0
    @free_bottles_from_caps = 0
  end
end

ask_question

