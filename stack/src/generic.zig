const std = @import("std");
const expect = std.testing.expect;

pub fn main() !void {
    var buffer: [5]u8 = .{ 0, 0, 0, 0, 0 };
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();
    _ = try stdout.write("Please write a 4-digit integer number\n");
    _ = try stdin.readUntilDelimiter(&buffer, '\n');

    try stdout.print("Input: {s}\n", .{buffer});
    const n: u32 = try std.fmt.parseInt(u32, buffer[0 .. buffer.len - 1], 10);
    _ = n;
    // const twice_result = twice(n);
    // try stdout.print("Result: {d}\n", .{twice_result});
}

fn twice(comptime num: u32) u32 {
    return num * 2;
}

fn IntArray(comptime size: usize) type {
    return [size]i64;
}

fn fibonacci(index: u32) u32 {
    if (index < 2) return index;
    return fibonacci(index - 1) + fibonacci(index - 2);
}

fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

test "simple test" {
    _ = twice(5678);
}

test "fibonacci in a block" {
    const x = comptime blk: {
        const n1 = 5;
        const n2 = 2;
        const n3 = n1 + n2;
        try expect(fibonacci(n3) == 13);
        break :blk n3;
    };
    _ = x;
}

test "test max" {
    const n1 = max(u8, 4, 10);
    std.debug.print("Max n1: {d}\n", .{n1});
    const n2 = max(f64, 89.24, 64.001);
    std.debug.print("Max n2: {d}\n", .{n2});
    const n3 = max([]const u8, "kek", "lol");
    std.debug.print("Max n3: {s}\n", .{n3});
}
