


# def kmeans func with dataframe, n-clusters and the Year we want to cluster
# return a dataframe with clusters label

km <- function(df,year,k){
  # filter the data by year
  df <- df %>% filter(Year==year)
  
  # remove label cols and scale it
  df_numeric <- df[,4:55] %>% scale()
  
<<<<<<< HEAD
  # dimensionality reduction(PCA)
  df_pca <- prcomp(df_numeric, scale. = TRUE)
  
  # Transform the data using the selected principal components
  # Since we have know the appropriate number, we set it to 5
=======
  # dimensionality reuction(PCA)
  df_pca <- prcomp(df_numeric, scale. = TRUE)
  
  # Transform the data using the selected principal components
  # Since we have know the approprate number, we set it to 5
>>>>>>> 7ac18dcebee71dca4d00bc0210188a96b724ac3a
  num_pcs <- 5
  pca_transformed_data <- predict(df_pca, newdata = df_numeric)[, 1:num_pcs]
  
  # Perform k-means clustering on the transformed data
  kmeans_result <- kmeans(pca_transformed_data, centers = k)
  
  # combine original df and cluster label
  df_clustered <- cbind(df, cluster = kmeans_result$cluster)
  
  # return clustered data
  return(df_clustered)
  
}