
`timescale 1ns/1ps

module tb_alu4;

    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] op;

    wire [3:0] result;
    wire carry;
    wire zero;

    integer errors;

    alu4 uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    task check;
        input [3:0] ta;
        input [3:0] tb;
        input [2:0] top;
        input [3:0] expected_result;
        input expected_carry;
        input expected_zero;

        begin
            a = ta;
            b = tb;
            op = top;
            #10;

            if ((result === expected_result) &&
                (carry === expected_carry) &&
                (zero === expected_zero)) begin

                $display("PASS: A=%d B=%d OP=%b RESULT=%d CARRY=%b ZERO=%b",
                    a, b, op, result, carry, zero);

            end else begin

                $display("FAIL: A=%d B=%d OP=%b RESULT=%d EXPECTED=%d CARRY=%b ZERO=%b",
                    a, b, op, result, expected_result, carry, zero);

                errors = errors + 1;
            end
        end
    endtask

    initial begin

        errors = 0;

        $display("==================================");
        $display("       4-BIT ALU TESTBENCH");
        $display("==================================");

        check(4'd5, 4'd3, 3'b000, 4'd8,  1'b0, 1'b0);

        check(4'd15, 4'd1, 3'b000, 4'd0, 1'b1, 1'b1);

        check(4'd5, 4'd3, 3'b001, 4'd2,  1'b1, 1'b0);

        check(4'd3, 4'd5, 3'b001, 4'd14, 1'b0, 1'b0);

        check(4'd12, 4'd10, 3'b010, 4'd8, 1'b0, 1'b0);

        check(4'd12, 4'd10, 3'b011, 4'd14, 1'b0, 1'b0);

        check(4'd12, 4'd10, 3'b100, 4'd6, 1'b0, 1'b0);

        check(4'd5, 4'd0, 3'b101, 4'd10, 1'b0, 1'b0);

        check(4'd12, 4'd10, 3'b110, 4'd7, 1'b0, 1'b0);

        check(4'd5, 4'd3, 3'b111, 4'd0, 1'b0, 1'b1);

        $display("----------------------------------");

        if (errors == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("TESTS FAILED: %0d errors", errors);

        $display("==================================");

        $finish;
    end

endmodule
