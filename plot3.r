plot3<-function(){
  
  #This script creates a 400x400 PNG file called plot3.png.  The graph that is created is a replicate
  #of the plot required for the Exploratory Data Analysis class on Coursera.
  #
  #Author: thefstop
  #Date: 3/5/15
  #  
  
  #Load required dependency
  library(lubridate)
  #Read the source file.  This script assumes the source file is 
  #located in the user's working directory.
  infile<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
  #Convert the Date column to an actual "Date" type
  infile$Date<-as.Date(infile$Date, "%d/%m/%Y")
  #Select only the desired data
  subdata<-subset(infile, Date == "2007-02-01" | Date == "2007-02-02")
  #Remove large file from memory
  remove(infile)
  #Create new column that contains the date and time
  subdata<-mutate(subdata, TimeDate = ymd_hms(paste(Date,Time)))
  
  #Construct the required plot
  png(filename="plot3.png", width = 480, height = 480) 
  with(subdata, plot(TimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  with(subdata, points(TimeDate, Sub_metering_2, col = "red", type="l"))
  with(subdata, points(TimeDate, Sub_metering_3, col = "blue", type="l"))
  legend("topright", lty= 1, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
 
} 
