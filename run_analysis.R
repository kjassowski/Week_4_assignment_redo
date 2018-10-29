Library(dplyr)

##This code will read the train data

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

##This next code will read the data from the test file

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <-read.table("./UCI HAR Dataset/test/subject_test.txt")

##Next, we need to run code to read the data description and activity labels.  
variable_names <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI Har Dataset/activity_labels.txt")

	##If we then run variable_names and activity_names, then we get a list of over 500 different unorganized 
	variable and activity names. This will need to be organized after the data is merged 

##The next step is to merge the two data sets together
X_final <- rbind(X_train, X_test)
Y_final <- rbind(Y_train, Y_test)
Subject_final <- rbind(Subject_train, Subject_test)

##Extracting the mean from each measurement 
MeanStd_selected <- variable_names[grep("mean|std",variable_names[,2]),]
X_total <- X_final[,MeanStd_selected[,1]] 
##Appropriately labels the data set with descripl,[kmm,.tive variable names.
colnames(X_total) <- variable_names[Mean_selected[,1],2]

##Use descriptive activity names to name the activities in the data set
final_activity_labels <- merge(activity_labels, Y_final, by = 1)
X_total_activity <- cbind(final_activity_labels[,2], X_total)


##Labeled the first column as activities

colnames(X_total_activity)[1] <-  "activities"

##From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

colnames(Subject_final) <- "subject"
X_total_activity_subject <- cbind(Subject_final, X_total_activity)
total_mean <- X_total_activity_subject %>% group_by(activities, subject) %>% summarize_each(funs(mean))

write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
