`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Jacobo De Bruyn
// Create Date: 01.02.2019 14:36:51
// Module Name: NOTs
//////////////////////////////////////////////////////////////////////////////////


module NOTs #(parameter k=1)(O,I);
    input[k-1:0] I;
    output [k-1:0] O;
    assign O=~I;
endmodule