require 'pry'
# Write your code here.
def dictionary
	substitutes = {"hello" => "hi", "to" => 2, "two" => 2, "too" => 2, "for" => 4, "four" => 4, "be" => "b", "you" => "u", "at" => "@", "and" => "&"}
end

def word_substituter(tweet) 		# takes in a string of a tweet as an argument
	word_sub = dictionary.keys 		# dictionary hash variable to compare words in tweet against keys in hash (grab keys of hash to compare words in tweet with `.keys` method)
	tweet.split.map do |word| 		# shortens that string based on the allowed substitutes (Convert the tweet to array to iterate over every word in tweet and compare to hash keys)
		if word_sub.include?(word.downcase)		# If any matches, replace word in tweet with substitute from hash
			word = dictionary[word.downcase]
		else word
		end
	end.join(" ")	# convert back to string to return shortened tweet at end of method
end

def bulk_tweet_shortener(bulk_tweets)	# takes in an array of tweet, siterates over them, shortens them, and `puts` out the results to the screen. 
 	bulk_tweets.map { |tweet| puts word_substituter(tweet) }	# method that shortens tweets and `puts` result of word_substituter
end

def selective_tweet_shortener(tweet) 	# only does substitutions if tweet is longer than 140 characters
	if tweet.length > 140			# count length of string
		word_substituter(tweet)		# If greater than 140 characters, shorten with word_substituter
	else tweet 					 	# If the tweet is 140 characters or shorter, just return the original tweet
	end
end

def shortened_tweet_truncator(tweet) 	# truncates tweet to 140 characters with (...) if still too long after substitution (E.g. "Random Passage satisfies the craving for those details that ...")
	mod_tweet = selective_tweet_shortener(tweet)	# only does substitutions if tweet is longer than 140 characters
	if mod_tweet.length > 140				# if still longer than 140 characters
		mod_tweet[0..136]<<"..."
	else mod_tweet
	end	
end