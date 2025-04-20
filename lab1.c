#include <stdio.h>

#define M 4
#define N 4

void proccess(int m,int n, int matrix[M][N] ,int* res)
{
    for(int i = 0; i < m; i++)
    {
        for(int j = 0; j < n; j++)
        {
            if((i == j) || (i == (n - j - 1)))
            {
                *res += matrix[i][j];
            }
        }
    }
}


int main()
{
    int matrix[M][N] = {{1, 2, 3, 4},
                        {5, 6, 7, 8},
                        {9,10,11,12},
                        {13,14,15,16}};
    int res = 0; 
    
    proccess(M, N, matrix, &res);
    
    printf("%d", res);
    
    return 0;
    
}
