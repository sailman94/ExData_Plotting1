df <- read.table("C:/Users/cramer/Desktop/Coursera/Assignment1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
dfsubset <- rbind(subset(df, df$Date == "1/2/2007"), subset(df, df$Date == "2/2/2007"))
DateTime <- paste(dfsubset$Date, dfsubset$Time, sep = " ")
workingdata <- cbind(DateTime, dfsubset[,3:9])
workingdata$DateTime <- strptime(workingdata$DateTime, format="%d/%m/%Y %H:%M:%S")
png(file = "plot3.png", width = 480, height = 480)
par(mfrow = c(1, 1),  mar = c(5.1, 4.1, 4.1, 2.1))
plot(workingdata$DateTime, workingdata$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
lines(workingdata$DateTime, workingdata$Sub_metering_1)
lines(workingdata$DateTime, workingdata$Sub_metering_2, col = "red")
lines(workingdata$DateTime, workingdata$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1), col= c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
