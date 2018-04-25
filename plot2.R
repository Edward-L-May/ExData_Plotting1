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

#plot2:
png(filename="plot2.png")
plot(power$date,power$Global_active_power,ylab="Global Active Power (kilowatts)",
     xlab="",type="l")
dev.off()


