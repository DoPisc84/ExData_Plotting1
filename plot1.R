# Get data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "household_power_consumption.zip", method = "curl")

# Read data
classes <- c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", colClasses = classes)

# Select relevant data
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Create plot
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

# Save plot and close device
dev.copy(png, file = "plot1.png", width = 480, height = 480, bg = "transparent") # Copy my plot to a PNG file
dev.off() # Close PNG device