class Round
  attr_reader :the_deck
  def initialize(the_deck)
    @the_deck = the_deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    num = @turns.count
    @the_deck.cards[num]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @number_correct += 1 if new_turn.correct?
    return new_turn
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end.count
  end

  def percent_correct
    return ((@number_correct.to_f / @turns.count)) * 100
  end

  def percent_correct_by_category(category)
    return ((number_correct_by_category(category).to_f / @the_deck.cards_in_category(category).count)) * 100
  end

  def start
    puts "Welcome! You're playing with #{@the_deck.count} cards."
    puts "-------------------------------------------------"
    puts "This is card number #{@the_deck.cards[0..0].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def correct_answer
    puts "Correct!"
  end

  def incorrect_answer
    puts "Incorrect."
  end

  def start_turn_2
    puts "This is card number #{@the_deck.cards[0..1].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def start_turn_3
    puts "This is card number #{@the_deck.cards[0..2].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def start_turn_4
    puts "This is card number #{@the_deck.cards[0..3].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def start_turn_5
    puts "This is card number #{@the_deck.cards[0..4].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def start_turn_6
    puts "This is card number #{@the_deck.cards[0..5].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def start_turn_7
    puts "This is card number #{@the_deck.cards[0..6].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def start_turn_8
    puts "This is card number #{@the_deck.cards[0..7].count} out of 8."
    puts "Question: #{current_card.question}"
  end

  def end_game
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{@turns.count} for a total score of #{percent_correct.to_i}%"
    puts "Geography - #{percent_correct_by_category(:Geography).to_i}% correct"
    puts "STEM - #{percent_correct_by_category(:STEM).to_i}% correct"
    puts "Movies - #{percent_correct_by_category(:Movies).to_i}% correct"
  end
end
