
# download the data

setInternet2(use = TRUE)
zip.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zip.file <- 'dataset.zip'
download.file(zip.url, destfile = zip.file)
unzip(zip.file)

# read in the data into R

train = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
test = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

# Appropriately labels the data set with descriptive variable names
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#Combine train and test data together using rbind
combinedData = rbind(train, test)

# Extracts only the measurements on the mean and standard deviation for each measurement
MeanSTDcols <- grep(".*Mean.*|.*Std.*", features[,2])
# First reduce the features table to what we want 
features <- features[MeanSTDcols,] 
# Now add the last two columns (subject and activity) 
MeanSTDcols <- c(MeanSTDcols, 562, 563) 
# Filter combinedData to just the mean and STD columns
combinedData <- combinedData[,MeanSTDcols] 
# Add the column names (features) to combinedData 
colnames(combinedData) <- c(features$V2, "Activity", "Subject") 
colnames(combinedData) <- tolower(colnames(combinedData)) 
 
# 3.Uses descriptive activity names to name the activities in the data set: replace activity with meaningful descriptions 
currentActivity = 1 
for (currentActivityLabel in activityLabels$V2) { 
combinedData$activity <- gsub(currentActivity, currentActivityLabel, combinedData$activity) 
currentActivity <- currentActivity + 1 
 } 

# Convert Activity and subject to factor variables
combinedData$activity <- as.factor(combinedData$activity) 
combinedData$subject <- as.factor(combinedData$subject) 

 
tidydata = aggregate(combinedData, by=list(activity = combinedData$activity, subject=combinedData$subject), mean) 
# Remove the subject and activity column, since a mean of those has no use 
tidydata[,90] = NULL 
tidydata[,89] = NULL 

#create a comma delimited text file - called tidydata
write.table(tidydata, "tidydata.txt", sep=",", row.name=FALSE ) 

