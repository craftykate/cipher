class Cipher

	def numpick
		puts "Pick a number 1-25"
		loop do
			num = gets.chomp.to_i
			if num.between?(1, 25)
				return num
			else
				puts "Oops, invalid option."
			end
		end
	end
	
	def initialize
		loop do
			puts
			puts "Do you want to encode or decode a phrase?"
			puts "1. Encode (type 1)"
			puts "2. Decode (type 2)"
			option = gets.chomp
			case option
				when '1'
					puts
					puts "What is the phrase you'd like to encode?"
					phrase = gets.chomp
					num = numpick
					encode(phrase,num)
					break
				when '2'
					puts
					puts "What is the phrase you'd like to decode?"
					phrase = gets.chomp
					num = numpick
					decode(phrase,num)
					break
				else
					puts "Oops, invalid option. Try again."
					puts
			end
		end
	end

	def encode(str, num)
		# Split string into an array of letters
		phrase = str.split("")
		# Answer array
		cipher = []
		# Step through each letter in the string
		phrase.each do |l|
			# If letter is a capital...
			if l.ord.between?(65,90) 
				# If letter is at the end of the alphabet...
				if l.ord >= (90 - num + 1)
					# Let cipher move to beginning of alphabet
					cipher << (l.ord - 26 + num).chr
				# Otherwise just move forward in alphabet
				else
					cipher << (l.ord + num).chr
				end
			# If letter is lowercase, follow same instructions as above
			elsif l.ord.between?(97,122)
				if l.ord >= (122 - num + 1)
					cipher << (l.ord - 26 + num).chr
				else
					cipher << (l.ord + num).chr
				end
			# If letter is a number
	  	elsif l.ord.between?(48,57) && num < 10
	  		if l.ord >= (57 - num + 1)
	  			cipher << (l.ord - 10 + num).chr
	  		else
	  			cipher << (l.ord + num).chr
	  		end
			# If letter isn't a letter or number at all (space, period, etc)
			else
				cipher << l
			end
		end
		# Turn ciphered phrase into a string (to separate on spaces later)
		phrase = cipher.join.to_s
		# Hold the final, ciphered phrase
		final_phrase = []
		# Go through each word in the ciphered phrase to reverse each word
		phrase.split.each do |word|
			# If first letter was capitalized, retain that info
			capitalized = false
			if word[0] == word[0].upcase
				capitalized = true
			end
			# If last character is not a letter or number...
			if !word[-1].ord.between?(65,90) && !word[-1].ord.between?(97,122) && !word[-1].ord.between?(48,57)
				# Store the punctuation...
				punc = word[-1]
				# And remove punctuation from word...
				word = word[0..-2]
				# Reverse the word, downcase it in case, then add punctuation back
				new_word = word.reverse.downcase + punc
			else 
				# Word didn't have punctuation, so just reverse it and downcase it
				new_word = word.reverse.downcase
			end
			# If word was capitalized...
			if capitalized == true
				# Capitalize first letter of reversed word
				new_word[0] = new_word[0].upcase
			end
			# Push the reversed, properly punctuated and properly capitalized word into final array
			final_phrase << new_word
		end
		puts "Your encoded phrase is below. Give the code (and the cipher number!)"
		puts "to your fellow spy to decode the phrase..."
		puts
		puts final_phrase.join(" ")
	end

	def decode(str, num)
		# Split string into an array of letters
		phrase = str.split("")
		# Answer array
		cipher = []
		# Step through each letter in the string
		phrase.each do |l|
			# If letter is a capital...
			if l.ord.between?(65,90) 
				# If letter is at the end of the alphabet...
				if l.ord <= (65 + num - 1)
					# Let cipher move to beginning of alphabet
					cipher << (l.ord + 26 - num).chr
				# Otherwise just move forward in alphabet
				else
					cipher << (l.ord - num).chr
				end
			# If letter is lowercase, follow same instructions as above
			elsif l.ord.between?(97,122)
				if l.ord <= (97 + num - 1)
					cipher << (l.ord + 26 - num).chr
				else
					cipher << (l.ord - num).chr
				end
			# If letter is a number
	  	elsif l.ord.between?(48,57) && num < 10
	  		if l.ord <= (48 + num - 1)
	  			cipher << (l.ord + 10 - num).chr
	  		else
	  			cipher << (l.ord - num).chr
	  		end
			# If letter isn't a letter or number at all (space, period, etc)
			else
				cipher << l
			end
		end
		# Turn ciphered phrase into a string (to separate on spaces later)
		phrase = cipher.join.to_s
		# Hold the final, ciphered phrase
		final_phrase = []
		# Go through each word in the ciphered phrase to reverse each word
		phrase.split.each do |word|
			# If first letter was capitalized, retain that info
			capitalized = false
			if word[0] == word[0].upcase
				capitalized = true
			end
			# If last character is not a letter or number...
			if !word[-1].ord.between?(65,90) && !word[-1].ord.between?(97,122) && !word[-1].ord.between?(48,57)
				# Store the punctuation...
				punc = word[-1]
				# And remove punctuation from word...
				word = word[0..-2]
				# Reverse the word, downcase it in case, then add punctuation back
				new_word = word.reverse.downcase + punc
			else 
				# Word didn't have punctuation, so just reverse it and downcase it
				new_word = word.reverse.downcase
			end
			# If word was capitalized...
			if capitalized == true
				# Capitalize first letter of reversed word
				new_word[0] = new_word[0].upcase
			end
			# Push the reversed, properly punctuated and properly capitalized word into final array
			final_phrase << new_word
		end
		puts final_phrase.join(" ")
	end

end

phrase = Cipher.new
