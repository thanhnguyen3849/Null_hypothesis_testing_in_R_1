# import the data
wb <-  read.csv(url( "https://raw.githubusercontent.com/thanhnguyen3849/Null_hypothesis_testing_in_R_1/main/WB_World_Population_Health.csv"))

#check the data
class(wb)
str(wb)
summary(wb)

#change data to numeric and factor only
wb <- wb %>% dplyr::mutate_if(is.character, as.factor)
wb <- wb  %>% dplyr::mutate_if(is.integer, as.numeric)
wb <- wb  %>% dplyr::mutate_if(is.logical, as.numeric)
str(wb)

#Compare LifeExpectancy mean with 70
#Imputing the data in LifeExpectancy
library(randomForest)
wb$cleanLE <- na.roughfix(wb$LifeExpectancy) #imputing the data
class(wb$cleanLE)
sum(is.na(wb$cleanLE))
#Density plot
library(car)
densityPlot(wb$cleanLE)
#one-tail t-test
t.test(wb$cleanLE, mu=70)
#calculate critical t
alpha <- 0.05
t_crit <- qt(1 - alpha/2, 212)
t_crit

#Compare t value with t crit and p value with alpha
