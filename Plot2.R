data<- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset to the relevant dates 
data1<- subset (data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create datetime
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

#plot graph

with(data1, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()