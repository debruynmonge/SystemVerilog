`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jacobo De Bruyn Monge 
// Create Date: 01.02.2019 13:58:29
// Module Name: Adders
//////////////////////////////////////////////////////////////////////////////////

// Multiple adders conected
module Adders #(parameter k=1)(O,CarryOutAdder,CarryInAdder,A,B);
    input [k-1:0] A,B;
    input CarryInAdder;
    output CarryOutAdder;
    output [k-1:0] O;
    wire [k-1:0] CarryOut;
    
    generate
        genvar i;
        Adder Adder_0 (O[0],CarryOut[0],CarryInAdder,A[0],B[0]);
    
        for(i=1;i<k;i=i+1) begin
            Adder Adder_i (O[i],CarryOut[i],CarryOut[i-1],A[i],B[i]);
        end  
    endgenerate
    
    assign CarryOutAdder=CarryOut[k-1];

endmodule



// A basic adder
module Adder (O,CarryOut,CarryIn,A,B);
    input A,B,CarryIn;
    output CarryOut,O;
    
    assign CarryOut=(A&B)|(A&CarryIn)|(B&CarryIn);
    assign O=(A&~B&~CarryIn)|(~A&B&~CarryIn)|(~A&~B&CarryIn)|(A&B&CarryIn);


endmodule

