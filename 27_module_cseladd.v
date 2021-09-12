module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire carry;
    wire ignore;
    wire [15:0] mid1, mid2;
    add16 lower(a[15:0], b[15:0], 1'b0, sum[15:0], carry);
    add16 higher1(a[31:16], b[31:16], 1'b0, mid1[15:0], ignore);
    add16 higher2(a[31:16], b[31:16], 1'b1, mid2[15:0], ignore);
    
    assign sum[31:16] = carry ? mid2 : mid1;
    
endmodule