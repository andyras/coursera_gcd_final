# Script for Coursera "Getting and Cleaning Data" final project

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require(data.table)

if (!file.exists("UCI HAR Dataset.zip")) {
  download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip", method = "curl")
  unzip("UCI HAR Dataset.zip")
}

# Reading and merging data sets
# get column names first
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "name"), row.names = NULL)

trainData <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$name, row.names = NULL)
trainData$activity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity", row.names = NULL)


testData <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$name, row.names = NULL)
testData$activity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity", row.names = NULL)

data <- rbind(trainData, testData)