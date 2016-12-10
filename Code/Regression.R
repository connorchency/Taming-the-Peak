# load and process the data
data = read.csv("../Final_Data/final1213_reshaped.csv")
data = data[,-1]
data$Hour = as.factor(data$Hour)
data$Month = as.factor(data$Month)
data$WeekofYear = as.factor(data$WeekofYear)
data$DayofWeek = as.factor(data$DayofWeek)
data$Year = as.factor(data$Year)

# splitting training and testing data
train = data[which(data$Year == "2012"),]
test = data[which(data$Year == "2013"),]
train = na.omit(train)
test = na.omit(test)


# linear regression model
m = lm(Consumption ~ Income + Wind_Speed_MPH + Humidity + Temperature_F + Month + DayofWeek + Hour + WeekofYear, data = train)
summary(m)


# predicting
prediction <- predict(m, newdata = test)
# MSE
mean(abs(prediction - test$Comsumption))


# Add predicted value to dataframe
test$predicted = prediction


# Try model without weather data
m1 = lm(Consumption ~ Income + DayofWeek + Hour + WeekofYear, data = train)
summary(m1)
prediction1 <- predict(m1, newdata = test)
mean(sqrt((prediction1 - test$Consumption)^2))
test$predict2 = prediction1

#Write CSV file
write.csv(test, "../Final_Data/predicted_2013.csv")



