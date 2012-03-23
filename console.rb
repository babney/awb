$LOAD_PATH << "."
require 'bundler'
Bundler.require
require 'model/game'
require 'model/player'

params = {}
params[:n_players] = 4
core_set = GameSet::load("./assets/core_1.2.yaml")
$g = Game.new(params[:n_players].to_i, core_set)

players = %w{foo bar baz qux}.map{|name| Player.new(name)}
player_ids = players.map{|p| p.join($g)}
$g.next_point!
players.each do |p|
  # TODO check arity
  p.answer(rand(9)) unless p.is_card_czar?
end