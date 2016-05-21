require "yaml"
# require modules here

def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  result = {}
  result["get_meaning"] = {}
  result["get_emoticon"] = {}
  emoticons.each do |meaning, eng_jap|
    result["get_meaning"][eng_jap[1]] = meaning
    result["get_emoticon"][eng_jap[0]] = eng_jap[1]
  end
  result
end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  emoticons.each do |action, hash|
    if action == "get_emoticon"
      hash.each do |eng, jap|
        if eng == emoticon
          return jap
        end
      end
    end
  end
  "Sorry, that emoticon was not found"
  # code goes here
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  emoticons.each do |action, hash|
    if action == "get_meaning"
      hash.each do |jap, meaning|
        if jap == emoticon
          return meaning
        end
      end
    end
  end
  "Sorry, that emoticon was not found"
  # code goes here
end
