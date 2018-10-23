require "pry"
def nyc_pigeon_organizer(data)
names = []
chars = []
  data.each do |characteristics, values1|
    values1.each do |characteristics_in_depth, birds|
      birds.each do |bird|
        names << bird
        chars << characteristics
      end
    end
  end
  names = names.uniq
  chars = chars.uniq

#CREATING THE RIGHT LAYOUT
  
  first_level = []
  chars.each do |char|
    first_level << [char, []]
  end
  
  second_level = []
    names.each do |bird1|
      second_level << [bird1, first_level.to_h]
  end
  
  second_level = second_level.to_h
  
#NOW ONTO FILLING THE targets


  paths = []
  data.each do |characteristics, values1|
    values1.each do |characteristics_in_depth, birds|
      birds.each do |bird|
        paths << [bird, characteristics, characteristics_in_depth]
      end
    end
  end
  paths = paths.uniq
  
  
  paths.each do |path|
  second_level[path[0]][path[1]] = []
  second_level[path[0]][path[1]] << path[2].to_s
  end
  
    #why cant we add to an array without changing all of them
second_level
binding.pry
#second_level["Alex"][:color] 
end

def nyc_pigeon_organizer(data)
  organized_pigeons = {}
  
  data.each do |characteristics, values1|
    values1.each do |characteristics_in_depth, birds|
      birds.each do |bird|
        if organized_pigeons[bird]
          if organized_pigeons[bird][characteristics]
          organized_pigeons[bird][characteristics] << characteristics_in_depth.to_s
          else
          organized_pigeons[bird][characteristics] = [characteristics_in_depth.to_s]
          end
        else
        organized_pigeons[bird] = {characteristics => [characteristics_in_depth.to_s]}
        end
      end
    end
  end
  organized_pigeons
end