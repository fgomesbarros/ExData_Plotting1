### Data Science Specialization
### plot1.R
###

## Download and read the dataset file
#dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url = dataset_url, 
#              dest = "household_power_consumption.zip", 
#              method = "wget")
#unzip(zipfile = "household_power_consumption.zip")
epc  <- read.table(file = "household_power_consumption.txt", sep = ";", 
                   header = TRUE, as.is = TRUE)

## Convert Date variable to Date
epc$Date <- as.Date(epc$Date, "%d-%m-%Y")

## Select the observations corresponding to days 2007-02-01 and 2007-02-02.
epc <- epc[(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"), ]

## Convert Time variable to Time.
epc$Date <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")
