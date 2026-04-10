# run_analysis.R

if (!file.exists("UCI HAR Dataset")) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, "dataset.zip")
  unzip("dataset.zip")
}

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

data <- cbind(subject, y, X)

colnames(data)[1:2] <- c("Subject", "Activity")
colnames(data)[3:ncol(data)] <- features$V2

mean_std <- grep("mean\\(\\)|std\\(\\)", colnames(data))
data <- data[, c(1, 2, mean_std)]

data$Activity <- factor(data$Activity, labels = activity_labels$V2)

names(data) <- gsub("\\(\\)", "", names(data))
names(data) <- gsub("-", "_", names(data))
names(data) <- tolower(names(data))

tidy_data <- aggregate(. ~ subject + activity, data, mean)

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)