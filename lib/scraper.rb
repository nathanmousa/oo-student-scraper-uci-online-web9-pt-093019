require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index = Nokogiri::HTML(open(index_url))
    students = []
    
    index.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        link = student.attributes["href"].value
        name = student.css(".student-name").text
        location = student.css(".student-location").text
        student_hash = {
          :name => name,
          :location => location,
          :profile_url => link
        }
        students << student_hash
      end
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(index_url))
    profile.css(".social-icon-container a").each do |profile|
      link = profile.attributes["href"].value
      if link.include?("twitter")
        twitter = ""
      elsif link.include?("linkedin")
        linkedin = ""
      elsif link.include?("github")
        github = ""
      blog = ""
      binding.pry
    end
  end

end

