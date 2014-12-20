#loading Samsung data from the files in working directory
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")


#Next few rows will contains steps to fulfill requirement 1 and 4, that is to merge them and rename the columns.
#1. Merges the 3 training sets and the 3 test sets to create one big data set (I'm using rbind and cbind).
#4. Appropriately labels the data set with descriptive variable names (i.e. change the column names from V1,V2 etc.)
subjectSet <- rbind(subject_test, subject_train)
names(subjectSet) = "subject"

xSet <- rbind(x_test, x_train)
names(xSet) = features[,2]

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
xSet <- xSet[,grep("-(mean|std)\\(\\)", features[, 2])]

ySet <- rbind(y_test, y_train)
names(ySet) = "activity"

#3. Uses descriptive activity names to name the activities in the data set
ySet[, 1] <- activity_labels[ySet[, 1], 2]

fullSet <- cbind(subjectSet, ySet, xSet)


#changing the activity and subject column variables to factor, for aggregating mean purpose
fullSet$subject <- as.factor(fullSet$subject)
fullSet$activity <- as.factor(fullSet$activity)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject, I'm using AGGREGATE function to get the mean
tidySet = aggregate(. ~subject+activity, fullSet, mean)
#sort them by subject and activity for a cleaner look
tidySet <- tidySet[order(tidySet$subject,tidySet$activity),]

#create a txt file from dataset
write.table(tidySet, "tidy_dataset.txt", row.name=FALSE)
