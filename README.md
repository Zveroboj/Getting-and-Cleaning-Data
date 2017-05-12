# Getting-and-Cleaning-Data
Peer-graded Assignment: Getting and Cleaning Data Course Project

### run_analysis.R
Use the following steps to analyse data:
1. Read the following files:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
2. Combine the foolowing files using rbind() under the full_data name
- 'train/X_train.txt': Training set.
- 'test/X_test.txt': Test set.
3. Use 'features.txt' to assign names to the full_data.
4. Combine the following files using rbind() under the subject name
- subject_train.txt
- subject_test.txt
5. Combine the following activity code files using rbind() under the code name
- y_test.txt
- y_train.tx"
6. Merge activity_labels.txt with code by V1 and assign it mergeID name
7. Using cbind combine subject, mergeID and data to combine subjects, activity labels and data 
8. Create a subset containing only fields with the words "mean" and "std"
9. Create tidy names
10. Uding aggregate() create a separate table summarizing means for Activities and Subjects

Finally, write the table write.table(data,  "name.txt", row.names=F, col.names=T)
