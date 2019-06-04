# source: https://www.kaggle.com/mrpantherson/board-game-data/data
# data collected March 2017

library(tidyverse)

setwd("C:/Users/lauraho/Documents/R Code/Boardgames/BoardgamesData.csv")
df = read_csv("C:/Users/lauraho/Documents/R Code/Boardgames/BoardgamesData.csv")

# create miniatures column
df$miniature <- grepl("miniatures", df$category, ignore.case = TRUE)

summary(df$geek_rating)
sd(df$geek_rating)
hist(df$geek_rating)

summary(df$avg_rating)
sd(df$avg_rating)
hist(df$avg_rating)

# avg_rating has a normal distribution and geek_rating (bayesian average) doesnt
# since sample size is large, this probably isn't an issue
# try tests with both
no_minis <- df %>% filter(df$miniature == FALSE)
yes_minis <- df %>% filter(df$miniature == TRUE)

# first we check the difference in means of games with and without miniatures
mean(yes_minis$geek_rating) - mean(no_minis$geek_rating)
mean(yes_minis$avg_rating) - mean(no_minis$avg_rating)

# it looks like games with miniatures have a higher rating on average
# let's test to see if difference is statistically significant

# two sample t test with one tail of yes_minis > no_minis
t.test(yes_minis$geek_rating, no_minis$geek_rating, alternative = "greater")
t.test(yes_minis$avg_rating, no_minis$avg_rating, alternative = "greater")

# both methods of rating show that there is a significant difference
# boardgames with miniatures do indeed have higher ratings than those that don't

# kolmogorov-smirnov test (checks to see if two pops are from the same distribution)

# plots
# bayesian average
plot <- ggplot(data = df, aes(x = df$miniature, y = df$geek_rating))
plot + geom_violin(trim = FALSE)

# regular average
plot2 <- ggplot(data = df, aes(x = df$miniature, y = df$avg_rating))
plot2 + geom_violin(trim = FALSE)
