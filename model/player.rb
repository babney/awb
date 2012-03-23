class Player
	def initialize(name)
		@name = name
		@hand = []
	end

	def join(game)
		id = game.join(self)

		@game = game
		@id = id
	end

	def answer(anid)
		# submit answer and get rid of the card
		@game.current_point.answer[@id] = [@hand[anid]]
		@hand.slice!(anid)
	end
	
	def is_card_czar?
	  @id == game.current_point.card_czar
  end

	attr_accessor :name, :hand
	attr_reader :game
end