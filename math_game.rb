# require "player.rb"
class Math_game

  def initialize
    puts "Player 1: Enter your name"
    @player_one = Player.new(gets.chomp)
    puts "Player 2: Enter your name"
    @player_two = Player.new(gets.chomp)
    @solution= 0
    @answer = 0
  end

  def generate_question(player)
    num1=rand(1..20)
    num2=rand(1..20)
    puts "#{player.name}: What does #{num1} plus #{num2} equal?"
    @solution = num1+num2
  end

  def update_score(player)
    if @answer.to_i === @solution.to_i
      puts "#{player.name}: YES! you are correct."
    else
      player.score -= 1 
      puts "#{player.name}: Seriously? No"
    end
  end

  def switch_to_player(player)
    self.generate_question(player)
    @answer = gets.chomp
    self.update_score(player)
  end

  def play

    while @player_one.score>0 && @player_two.score>0      
    self.switch_to_player(@player_one)
    self.switch_to_player(@player_two)
    
    if @player_one.score === 0 && @player_two.score != 0
      puts "#{@player_two.name} wins with a score of #{@player_two.score}/3 "
      puts "-----GAME OVER-----"
      puts "Good Bye !"

    elsif @player_two.score === 0 && @player_one.score != 0
      puts "#{@player_one.name} wins with a score of #{@player_one.score}/3 "
      puts "-----GAME OVER-----"
      puts "Good Bye !"

    elsif @player_one.score === 0 && @player_two.score === 0
      puts "--- Tie ---"
      puts "-----GAME OVER-----"
      puts "Good Bye !"

    else
      puts "#{@player_one.name}: #{@player_one.score}/3 vs #{@player_two.name}: #{@player_two.score}/3 "
      puts "----- NEW TURN -----"

    end
    end

  end

end