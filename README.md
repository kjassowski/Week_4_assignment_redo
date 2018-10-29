## Week_4_assignment

The purpose of this assignment was to demonstrate the ability to collect, work with, 
and clean a complex unorganized data set. 

This Run_analysis program is designed to take data from experiments that was carried out 
with a group of 30 volunteers within a certain agge bracket. Each person performed six 
different activities (Wwalking, walking upstairs, walking downstairs, sitting, standing, and laying) 
while they were wearing a smartphone (samsung Galaxy S II) on their wasit. The original dataset was
randomly partitioned into two sets, where 70% of the volunteers was selected for training data and 30#
were the test data. 

The first mission of this program was to merge the two datasets, testing and training subjects, into one data set.
This was achieved through reading the data into R, setting the variable names and activity labels, and then merging both
X_train/X_test and Y_train/Y_test. 

Then, only the mean and standard deviation was extracted from each measurement using grep, resulting in an X_total_activity. 
After this, descriptive activity names was used to name the activities in the data set, using colnames. Appropirate labels to the data
set with descriptive variable names was added using colnames as well. 

Finally, using the data that was achieved in step 4, a second, independently tidy data set containing hte average of each variable for 
each activity and each subject was created. This was created through cbind, colnmaes and finally, writing.table. 

