### Data Science Specialization
### Exploratory Data Analisys - Course Project 1
### plot2.R script

## Get and Clean Data

# Download and read the dataset file
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = dataset_url, 
              dest = "household_power_consumption.zip", 
              method = "wget")
unzip(zipfile = "household_power_consumption.zip")
epc <- read.table(file = "household_power_consumption.txt", sep = ";",
                  header = TRUE,
                  stringsAsFactors = FALSE)

# Select the observations corresponding to 2007-02-01 and 2007-02-02 days.
epc <- epc[(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"), ]

# Merge Date and Time variable, converting to PosicIt.
epc$Date <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")

# Remove Time variable. Date_Time variable stores all the information needed.
epc <- epc[, c(1,3:9)]
names(epc)[1] <- "Date_Time"

# Convert character variables to numeric.
for(i in 2:7) {
    epc[, i] <- as.numeric(epc[, i])
}

## Create the png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Plot Global active power and Date_Time variables
with(epc, plot(x = Date_Time, y = Global_active_power, type = "l",
               xlab = "", ylab = "Global Active Power (kilowatts)",))

## Turn off the device graphics
dev.off()