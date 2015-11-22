# Script for Coursera "Getting and Cleaning Data" final project

if (!file.exists("UCI HAR Dataset.zip")) {
  download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip", method = "curl")
  unzip("UCI HAR Dataset.zip")
}

