# Mengimpor dataset
dataset = read.csv('Pengunjung_mall.csv')
dataset = dataset[4:5]

# Menggunakan metode elbow untuk menemukan angka cluster yang optimal
set.seed(6)
wcss = vector()
for (i in 1:10){
  wcss[i] = sum(kmeans(dataset, i)$withinss)
}
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Menjalankan K-Means Clustering
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster

# Visualisasi hasil clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = 'Klusters pelanggan',
         xlab = 'Pendapatan tahunan',
         ylab = 'Rating pengeluaran')