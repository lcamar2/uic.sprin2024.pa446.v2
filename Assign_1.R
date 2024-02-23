# Checked the name of default branch after creating 
# the Assign_1 R script file by going to terminal 
# pane and typing git branch. The response from 
# command was "main"-denoting the branch.


#Load Packages
library(readr)
library(tidyverse)
library(ggplot2)


#Load data
Olympics <- read_csv("Olympics.csv")


#6a Calculate new variable, called '‘total.medals’, which is the sum of gold, silver, and
#bronze, and add it to the Olympic dataset.

Olympics=
  Olympics %>%
  mutate(total.medals = gold + silver + bronze)
Olympics

#6b For each country, how many gold medals has it won?
gold_by_country=
  Olympics %>%
  group_by(country) %>%
  summarize(total_gold = sum(gold, na.rm = TRUE))
gold_by_country


#6c For each year, how many total medals were given out?
medals_by_year=
  Olympics %>%
  group_by(year) %>%
  summarize(total_medals=sum(total.medals,na.rm = TRUE))
medals_by_year


#7a. Which countries had the largest delegation of athletes in 1992? 

delegation92=
  Olympics %>%
  filter(year == 1992) %>%
  group_by(country) %>%
  summarize(total_athletes = sum(athletes, na.rm = TRUE)) %>%
  arrange(desc(total_athletes)) %>%
  select(country, total_athletes)
delegation92

#7a.pt2 Create a tibble that contains only the variables country and athletes. 

delegation92=as_tibble(delegation92)

View(delegation92)

#7b. For the following five countries, plot the number of gold medals earned over time:
#United States, France, Germany, Russia, and China

#create the targeted data set for plot

five_countries =
  Olympics %>%
  filter(country %in% c("United States", "France", "Germany", "Russia", "China")) %>%
  group_by(country, year) %>%
  summarize(gold_medals = sum(gold, na.rm = TRUE))


plot=
  five_countries%>%
  ggplot(aes(x=year, y=gold_medals, color=country, group=country))+
  geom_line()+
  geom_point()+
  theme_minimal()+
  labs(title = "Gold Medals 1980-2014 by Country",
       x="Year",
       y="Number of Gold Medals")

plot



