class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number_train, presence: true

  def count_wagon(type)
    x = 0
    self.wagons.each do |wagon|
        if wagon.type_wagon == type
        x += 1
        end
      end
      x
  end

  def count_wagon_seats(type)
    place_in_top = 0
    place_in_down = 0
    @arr_places = []

    self.wagons.each do |wagon|
      if wagon.type == type
        place_in_top += wagon.top_seats
        place_in_down += wagon.bottom_seats
      end
    end
    @arr_places << place_in_top
    @arr_places << place_in_down
    @arr_places
  end

  
  
end
