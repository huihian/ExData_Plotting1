data<- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset to the relevant dates 
data1<- subset (data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#plot graph

hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()