module anda(s, c, a, b);
input a, b;
output s, c;
xor(s,a,b);
and(c,a,b);
endmodule


module amar(s,c,a,b,c_in);
input a,b,c_in;
output s,c;
wire s1,c1,c2;
anda ab(s1,c1,a,b);
anda bc(s,c2,s1,c_in);
or(c,c1,c2);
endmodule

module ripple_carry_adder(q,c,a,b,c_in);
input [3:0] a,b;
input c_in;
output [3:0] q,c; 
amar w(q[0],c[0],a[0],b[0],c_in);
amar x(q[1],c[1],a[1],b[1],c[0]);
amar y(q[2],c[2],a[2],b[2],c[1]);
amar z(q[3],c[3],a[3],b[3],c[2]);
endmodule

module test;
wire [3:0] t_c, t_q;
reg [3:0] t_a,t_b;
reg t_c_in;
ripple_carry_adder an(.q(t_q), .c(t_c), .a(t_a), .b(t_b), .c_in(t_c_in));
initial begin

$monitor(t_q);

t_a = 4'b0100;
t_b = 4'b0000;
t_c_in = 1'b1;

#5
t_a = 4'b0101;
t_b = 4'b0101;
t_c_in = 1'b0;
#10
t_a = 4'b1110;
t_b = 4'b0000;
t_c_in = 1'b1;
end
endmodule
