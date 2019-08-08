class Player
    attr_reader :name, :symbol

    def initialize
        @name = name
        @symbol = symbol
    end
end

class Board
    def initialize
        @state = ['','','','','','','','','','']
        @move = 0
    end

    def show_board
        p "#{@state[1]} | #{@state[2]} | #{@state[3]}"
        p "---|---|---"
        p "#{@state[4]} | #{@state[5]} | #{@state[6]}"
        p "---|---|---"
        p "#{@state[7]} | #{@state[8]} | #{@state[9]}"
    end

    def is_move_valid? current_position
        @state[current_position].is_a? Integer
    end

    def add_move(position,symbol)
        @state[position] = symbol
        is_move_valid? position
        @move += 1

        if win?
            1
        elsif draw?
            -1
        else 
            0
        end
    end

end
