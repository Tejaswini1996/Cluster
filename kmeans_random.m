
n=10;

    for i=1:n

      x(i,1)=rand()*10;
      x(i,2)=rand()*10;
    end
    
    for i=1:n
     for j=1:n
      distance(i,j)=(sqrt((x(i,1)-x(j,1))^2 +(x(i,2)-x(j,2))^2 ));
     end
   end
    
  disp(distance);
   [C,I] = max(distance(:));
   disp(C);
   disp(I);
   

[I1,I2] = ind2sub(size(distance),I);

disp(I1);%column no. 
disp(I2);%row no.

a = (distance (I2,:));disp(a);
b=sort(a);
disp(b);

for i=1:n
    c(i)=find(a==b(i));
end
disp(c);



%divide into two clusters

cluster = zeros(n,2);
 k=1;
  p=1;

 
 
 cluster(1,1)= I1;
 cluster(1,2)= I2;


  
  for i=1:n
      if(i~=I1 && i~=I2)
          
         if ( distance(I1,i) > distance(I2,i) )  
         
             k=k+1; 
             cluster(k,1) = i;
         else 
           p=p+1;
           cluster(p,2) = i;
         end
      end        
  end
 disp(cluster);

cluster1=cluster(:,1);
disp( cluster1);


cluster2=cluster(:,2);
disp(cluster2);

%find intial centroid by calculating the mean of coordinates

cluster1_sum_x = 0;
cluster1_sum_y =  0;
cluster2_sum_x = 0;
cluster2_sum_y =  0;
j=1;

for i=1:n
   if(cluster1[i]~=0) { j++;} 

cluster1_size= j;
cluster2_size= n-j;

for i=1:n
    
   
   cluster1_sum_x= cluster1_sum_x + x(cluster1(i),1);
   cluster1_sum_y= cluster1_sum_y + x(cluster1(i),2);

   cluster2_sumx= cluster2_sum_x + x(cluster1(i),1);
   cluster2_sumy= cluster2_sum_y + x(cluster1(i),2);

end
  
  mean1_x = cluster1_sumx
  mean1_y    
   
  fprintf('mean1=%f \n', mean1);%mean for x coordinates
  fprintf('mean2=%f \n', mean2);%mean for y coordinates
   

       
     
  end


