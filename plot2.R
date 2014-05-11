# Get data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "household_power_consumption.zip", method = "curl")

# Read data
classes <- c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", colClasses = classes)

# Select relevant data
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Convert date format
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

# Create plot
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Save plot and close device
dev.copy(png, file = "plot2.png", width = 480, height = 480, bg = "transparent") # Copy my plot to a PNG file
dev.off() # Close PNG device