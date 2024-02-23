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
