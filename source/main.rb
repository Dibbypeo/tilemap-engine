require "gosu"

# The tilemap.
WORLD = {
    0 => [1, 1, 1, 1, 1, 1],
    1 => [1, 0, 0, 1, 0, 1],
    2 => [1, 0, 2, 1, 0, 1],
    3 => [1, 0, 0, 0, 0, 1],
    4 => [1, 0, 0, 0, 0, 1],
    5 => [1, 1, 1, 1, 1, 1]
}

class Game < Gosu::Window
    def initialize(world)
        super 240, 240 # This value can be changed to change the size of the window.
        self.caption = "Test"

        @player = nil
        @world = world.transform_values(&:dup)

        @world.each do |key, array|
            array.each_with_index do |number, index|
                if number == 2
                    @player = [key, index]
                end
            end
        end

    end

    def update
    end

    def draw
        WORLD.each do |key, array|
            array.each_with_index do |number, index|
                if number == 1
                    Gosu.draw_rect(40*index, 40*key, 40, 40, Gosu::Color::RED) # Renders all tiles with the number 1 within WORLD hash's arrays as red squares.
                end
            end
        end
        @world.each do |key, array|
            array.each_with_index do |number, index|
                if number == 2
                    Gosu.draw_rect(40*index, 40*key, 40, 40, Gosu::Color::GREEN) # Renders the player as a green square.
                end
            end
        end
    end
end

Game.new(WORLD).show # Creates a new ruby object with the hash WORLD and renders the window.
