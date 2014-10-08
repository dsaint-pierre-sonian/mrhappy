#!/usr/bin/env ruby 

require 'watir-webdriver'
 
@b = Watir::Browser.new :phantomjs

@b.goto("http://mrhappy.lets.qa")
@b.link(text: "login").click

def mrhappy_login
  puts "Enter your username."
  username = gets.chomp
  puts "Enter your password."
  password = gets.chomp
  @b.text_field(name: "username").set username
  @b.text_field(name: "password").set password
  @b.button(id: "btnsubmit").click
end

mrhappy_login

while @b.text.include? "Please try again"
   puts "Login failed. Please try again."
   mrhappy_login
end

@b.link(href: "?groupid=2").click

puts "On a scale of 1 to 5, how happy are you with the company?"
@company_happiness = gets.chomp
while @company_happiness.to_i > 5 || @company_happiness.to_i < 1
  puts "Please enter a valid integer between 1 and 5."
  @company_happiness = gets.chomp
end
@b.radio(name: "company_happy", value: @company_happiness).set

puts "On a scale of 1 to 5, how happy are you with your team?"
@team_happiness = gets.chomp
while @team_happiness.to_i > 5 || @team_happiness.to_i < 1
  puts "Please enter a valid integer between 1 and 5."
  @team_happiness = gets.chomp
end
@b.radio(name: "team_happy", value: @team_happiness).set

puts "What feels best right now?"
feels_best = gets.chomp
@b.text_field(name: "feelsbest").set feels_best

puts "What feels worst right now?"
feels_worst = gets.chomp
@b.text_field(name: "feelsworse").set feels_worst

puts "What would increase your happiness?"
increase_happiness = gets.chomp
@b.text_field(name: "increasehappiness").set increase_happiness

puts "Other comments"
other_comments = gets.chomp
@b.text_field(name: "othercomments").set other_comments

puts "Standup Notes (Daily, Guild, and Other)"
standup_notes = gets.chomp
@b.textarea(name: "standupnotes").set standup_notes

@b.button(name: "btnsubmit").click

@b.close

