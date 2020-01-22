$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  all_directors = []
  directors_count = 0 
  
  while directors_count < source.length do 
    all_directors << source[directors_count][:name]
    directors_count += 1
  end
  
  all_directors
end

def total_gross(source)
  collection_of_director_grosses = {}
  directors = []
  directors_count = 0
  
  directors = list_of_directors(source)  #names only
  
  while directors_count < directors.length do
    collection_of_director_grosses[directors[directors_count]] = gross_for_director(source[directors[directors_count]])
    directors_count += 1
  end 
end


