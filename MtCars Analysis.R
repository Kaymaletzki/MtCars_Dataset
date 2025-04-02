install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

data_mtcars <- mtcars

data_mtcars$am <- as.factor(data_mtcars$am)
data_mtcars$cyl <- as.factor(data_mtcars$cyl)
data_mtcars_line <- data_mtcars %>% mutate(index = row_number())
hp_by_cyl <- data_mtcars %>% group_by(cyl) %>% summarize(avg_hp = mean(hp))
bar_data_mtcars <- data_mtcars %>% group_by(cyl) %>% summarize(mpg = mean(mpg), disp = mean(disp), hp = mean(hp), wt = mean(wt)) %>% pivot_longer(cols = c("mpg", "disp", "hp", "wt"), names_to = "Measurement", values_to = "Average")

ggplot(data_mtcars, aes(x = wt, y = mpg, color = cyl)) + geom_point() + labs(title = "Weight vs. Miles Per Gallon", x = "Weight (1000 lbs)", y = "Miles Per Gallon")

ggplot(data_mtcars_line, aes(x = index, y = mpg)) + geom_line() + labs(title = "Miles Per Gallon by Index", x = "Index", y = "Miles Per Gallon")

ggplot(hp_by_cyl, aes(y = cyl, x = avg_hp)) + geom_bar(stat = 'identity') + labs(title = "Average HP by Cylinder Count", y = "Cylinder Count", x = "Average Horsepower")

ggplot(bar_data_mtcars, aes(x = cyl, fill = Measurement, y = Average)) + geom_bar(stat = "identity") + labs(title = "Average Measurements by Cylinder Count", x = "Cylinder Count", y = "Average Measurement")
