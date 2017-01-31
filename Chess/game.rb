class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @current_player = player1
    @colors = { @player1 => :white, @player2 => :black }
  end

  def play
    until won?
      
    end
  end

  def won?
    @board.checkmate?(@colors[@current_player])
  end
end
