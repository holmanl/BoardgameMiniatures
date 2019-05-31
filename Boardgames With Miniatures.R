#source: https://www.kaggle.com/mrpantherson/board-game-data/data
#data collected March 2017?? -> double check

library(tidyverse)

setwd("C:/Users/lauraho/Documents/R Code/Boardgames/BoardgamesData.csv")
data = read_csv("C:/Users/lauraho/Documents/R Code/Boardgames/BoardgamesData.csv")

#create miniatures column
data$miniature <- grepl("miniatures", data$category, ignore.case = TRUE)

#bayesian average
plot <- ggplot(data = data, aes(x = data$miniature, y = data$geek_rating))
plot + geom_violin(trim = FALSE)

#regular average
plot2 <- ggplot(data = data, aes(x = data$miniature, y = data$avg_rating))
plot2 + geom_violin(trim = FALSE)
