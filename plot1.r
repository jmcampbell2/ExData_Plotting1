#plot1.r
#Author: Jennifer Campbell
#eda week 1 project
#draw histogram of Global Active Power

##Instructions:
#Construct the plot and save it to a PNG file with a width of 480 pixels and 
#a height of 480 pixels
#Your code file should include code for reading the data so that the plot can 
#be fully reproduced. You must also include the code that creates the PNG file

####

#Step 1: Read in data
hpcdat <- read.table("ExData_Plot_Project1/household_power_consumption.txt", sep=";", 
                    dec=".", na = "?", header = TRUE) 
                    
#Step 2: Subset data for desired date range
datesub <- hpcdat[hpcdat$Date %in% c("1/2/2007","2/2/2007"), ]

#Step 3: Convert date and time variables to a Date/Time using strptime() 
datetime <- paste(datesub$Date, datesub$Time)
datesub$DateTime  <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Step 4: Open graphics device
png(filename="ExData_Plot_Project1/plot1.png", width=480, height=480, 
                 units="px", bg="white")

#Step 5: Create plot
hist(datesub$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

#Step 6: Close graphics device
dev.off()