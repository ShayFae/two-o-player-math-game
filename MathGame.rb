class MathGame
  class Player 
    attr_accessor :life, :name
    def initialize(name)
      @life = 3
      @name = name
    end
  
    def minus_life 
      @life -= 1
    end
  end
  
  attr_accessor :player1, :player2, :turn

  def initialize
    @player1 = Player.new('Player One')
    @player2 = Player.new('Player Two')
    @turn = @player1
  end

  def start 
    while @player1.life > 0 &&  @player2.life > 0 
      random_question
      puts "#{@player1.name} has #{@player1.life} lives and #{@player2.name} has #{@player2.life} lives"
      if @player1.life === 0
        puts "#{@player1.name} ran out of lives"
        puts "GAME OVER #{@turn.name} is the WINNER!!!!"

      elsif @player2.life === 0
        puts "#{@player2.name} ran out of lives"
        puts "GAME OVER #{@turn.name} is the WINNER!!!!"
      end
   end
  end

  def random_question
    newQuestion = Question.new
    puts "What's #{newQuestion.num} + #{newQuestion.num2} ?"
    choice = gets.chomp.to_i
    if choice == newQuestion.num + newQuestion.num2
      puts "CORRECT!"
      if @turn == @player1
        @turn = @player2
      else
        @turn = @player1
      end
    else
      puts "WRONG!"
      @turn.minus_life
      if @turn == @player1
        @turn = @player2
      else
        @turn = @player1
      end
    end
  end

  class Question 
    attr_accessor :num, :num2, :answer
    def initialize
      @num = rand(1..20)
      @num2 = rand(1..20)
      @answer = @num + @num2
      puts @answer
    end
  end
end

MathGame.new.start

# Question.new.random_question