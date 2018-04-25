##Edward L. May 
##Exploratory Data Analysis 
##Course Assignment #1
##April 25, 2018
#Load the data:
#set the working directory to the location of the unzipped data
power <- read.table("household_power_consumption.txt",header = TRUE, 
                     skip=-1+grep("1/2/2007",readLines("household_power_consumption.txt")), 
                     nrows=(24*60*2), na.strings="?",sep=";")
power.header <- read.table("household_power_consumption.txt",header = TRUE, nrows=1, 
                     na.strings="?",sep=";")
names(power) <- names(power.header)
##reformat the dates to be a POSIXlt format in the last column of 'power'
power$date <- strptime(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")

#plot3:
png(filename="plot3.png")
plot(power$date,power$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
lines(power$date,power$Sub_metering_1,col="grey",type='l',lwd=1)
lines(power$date,power$Sub_metering_2,col="red",type='l',lwd=1)
lines(power$date,power$Sub_metering_3,col="blue",type='l',lwd=1)

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("grey","red","blue"), lty=c(1,1,1) , cex=0.8)
dev.off()

