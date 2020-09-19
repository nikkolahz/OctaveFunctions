## Copyright (C) 2020 Salcedo
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} Lagrange (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Salcedo <Salcedo@DESKTOP-GM3V2IJ>
## Created: 2020-09-14

function L= Lagrange (f,t)
n = length(f);

i=1;
buffer=zeros(n);
factors = zeros(n);
while i<=n
  vi = zeros(1,n);
  vi(1,n) = f(i,1)*-1;
  vi(1,n-1) = 1;
  buffer(i,:) = vi;
  i = i+1;
end

j=1;
  while j<=n
    k=1;
   count =1;
   vj = zeros(1,n);
   token = zeros(1,n);
   product=1;
   while k<=n
      if(k~=j)
      
        if(count==1)
        token = buffer(k,:);
        vj=token;
        count =count+1;
    product = product*(f(j,1)-f(k,1));
      else
      token = buffer(k,:);
      vj=conv(vj,token);
      product = product*(f(j,1)-f(k,1));
       count = count+1; 
      endif
      end
     
      k = k+1;
    end
m = length(vj);
expanded(j,:) =vj(1,m-n+1:m);
alpha =f(j,t);
Lf(j,:) = vj(1,m-n+1:m)/product;
Lfi(j,:) = Lf(j,:)*alpha;

  j = j+1;   
  end

sum = zeros(1,n);
l=1;
while l<=n
  sum = sum+Lfi(l,:);
  
  l = l+1;
end
L = sum;
disp("\nThis is the Expanded polynomial:\n")
disp(expanded);
disp("\nThis are the Lagrange factors:\n");
disp(Lf);
disp("\nThis is the resulting Li = Lif(xi) \nNote: index 2 in Parameter is intended for f(xi) values:");
disp(Lfi);
disp("\n");
disp("Resulting polynomial:");
disp(L);
disp("\n use polyval([vector],xval) to get the prediction");


endfunction
