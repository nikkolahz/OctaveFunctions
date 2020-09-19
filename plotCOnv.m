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
## @deftypefn {} {@var{retval} =} plotCOnv (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Salcedo <Salcedo@DESKTOP-GM3V2IJ>
## Created: 2020-09-17

function retval = plotCOnv (h,f,x,delta)
  subplot(3,1,3);
  plot(h(x),'g-');
  title("function h(t)");
  xlabel("time (t)");
  ylabel("h(t)");
  subplot(3,1,2);
  plot(f(x),'b-');
  title("function f(t)");
  xlabel("time (t)");
  ylabel("f(t)");
  y=@(t) conv(h(t),f(t));
  retval = y;
  subplot(3,1,1);
  plot(delta*y(x),'r-');
  title("y(t) = h(t)*f(t)");
  xlabel("time (t)");
  ylabel("h(t)");
  hold on;
  plot(f(x),'b--');
  plot(h(x),'g--');
  legend("y","f","h");
  hold off
endfunction
