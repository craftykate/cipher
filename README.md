# Cipher Program

## Overview 

I wrote this little cipher program for my kids. The program takes a phrase and a number to shift the letters by and turns the phrase into a code. It can also turn codes back into English phrases!

Here's what it looks like in action:

```
Do you want to encode or decode a phrase?
1. Encode (type 1)
2. Decode (type 2)
```

We type in `1` to encode a phrase.

```
What is the phrase you'd like to encode?
```

We type in: `This is a secret code!`

```
Pick a number 1-25
```

We type in: `14`

```
Your encoded phrase is below. Give the code (and the cipher number!)
to your fellow spy to decode the phrase...

Gwvh gw o hsfqsg srcq!
```

To turn "Gwvh gw o hsfqsg srcq!" back into English go through the program again but enter number 2 to decode. 

## How it works

- It takes each letter and shifts it forward by the number given (in our case above, 14). 

- Then it reverses each word (not the whole phrase). This is so that if someone tries to intercept the coded phrase and shift the letters, they won't come up with real words and might be thrown off! Haha. 

- In order not to be obvious that the words were reversed it keeps punctuation at the end of each word. So, if our phrase was "cats!" and our number was 5, we would end up with "xyfh!", not "!xyfh". That would be way too obvious that our words were reversed if the exclamation came first!

- If a word was capitalized (say, "Cats!") the first letter of our **reversed** word will be capitalized. Instead of "xyfH!" we will have "Xyfh!". Again, hide it even further that we reversed our words. 

The program gives you the option to encode or decode a phrase. If we encode "This is a secret code!" with the shift number of 14, we will get "Gwvh gw o hsfqsg srcq!". And if we choose the option to decode it, enter our phrase of "Gwvh gw o hsfqsg srcq!" and the number 14 we end up back with "This is a secret code!"

A fun little program and neat exercise in Ruby. 

