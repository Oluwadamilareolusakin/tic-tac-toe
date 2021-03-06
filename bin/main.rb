require_relative '../lib/game'


class Game
  def initialize
    puts 'Player 1, enter your name: '
    @player1 = Player.new(gets.chomp, 'X')
    puts 'Player 2 enter your name: '
    @player2 = Player.new(gets.chomp,'O')
    @board = Board.new
    @game_over = false
  end

  def play
    until @game_over
      @currentPlayer = @currentPlayer == @player1 ? @player2 : @player1
      
      valid_move = false
  
      until valid_move
        @board.show_board
        p "It's #{@currentPlayer.name}'s turn to play"
        p "Enter a number from 1-9, careful not to enter a number that has been entered before"
        position = gets.to_i
        valid_move = true if @board.is_move_valid? position
      end
  
      result = @board.add_move(position, @currentPlayer.symbol)
  
      if result == 1
        p "#{@currentPlayer.name} wins"
        @board.show_board
        @game_over = true
      elsif result == -1
        p "It's a draw yo!"
        @board.show_board
        @game_over = true

      end
    end
  end
end

game = Game.new
game.play