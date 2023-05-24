Code Book

In this code book is the description of the variables, the data, and all transformations or work that I performed to clean up the data

The first step in any sort of data analysis is accurately reading in the data needed for analysis.
The data for this work has different components in different files. Hence, each component is read in seperately and cleaned after which a bit of preprocessing is done to ensure that a tidy data is made available for further analysis.


The feature variable is the component in the features.txt file

The activity variable is the component in the activity_labels.txt file

The subject_test is the component in the subject_test.txt file

The x_test is the component in the X_test.txt file

The y_test is the component in the Y_test.txt file

The subject_train is the component in the subject_train.txt file

The x_train is the component in the train/X_train.txt file

The y_train is the component in the train/Y_train.txt file


Here is a detail of the preprocessings involved in this work.

The first step here is to match the labels in y_test. 
Next to this is combining the different components that make up the test data which includes subject, activity and the test data.

The same process is taken for the train data set.

At this point, merging of the train and test sets come next. This yields the tidy_set table.

As per the objective of this excercise, the features with mean and standard deviation for each measurement is selected and stored in a table called tidy_mean_std.

Finally, the data set with the average of each subject and activity on each feature is calculated and stored in tidy_avg
