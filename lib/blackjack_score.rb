# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'King', 'Queen', 'Jack']

def blackjack_score(hand)

  if (!hand.all? {|card| VALID_CARDS.include? card})
    raise ArgumentError
  end

  hand.map! { |card|
    if card.to_i >= 2 && card.to_i <= 10
      card
    elsif (card == "King" || card == "Queen" || card == "Jack")
      10
    elsif card == 1   #at first, turn every Ace into 11
      11
    end
  }

  score = hand.sum

  if hand.count(11) > 1
    score -= (10 * hand.count(11)-1)
  end

  if score > 21 && hand.count(11) >= 1
    score -= 10
  end
 puts score
  if score > 21
    raise ArgumentError
  end

  return score

end
