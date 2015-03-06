plot1<-function(){
  #This script creates a 400x400 PNG file called plot1.png.  The graph that is created is a replicate
  #of the plot required for the Exploratory Data Analysis class on Coursera.
  #
  #Author: thefstop
  #Date: 3/5/15
  #  
  
  #Read the source file.  This script assumes the source file is 
  #located in the user's working directory.
  infile<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
  
  #Convert the Date column to an actual "Date" type
  infile$Date<-as.Date(infile$Date, "%d/%m/%Y")
  
  #Select only the desired data
  subdata<-subset(infile, Date == "2007-02-01" | Date == "2007-02-02")
  
  #Construct the required plot
  png(filename="plot1.png", width = 480, height = 480) 
  hist(subdata$Global_active_power, col = "red", xlab= "Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
} 
