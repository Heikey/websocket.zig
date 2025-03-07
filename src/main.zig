const std = @import("std");
const net = std.net;

pub fn main() !void {
    const address = try net.Address.parseIp4("127.0.0.1", 8686);
    const server = try address.listen(.{ .reuse_port = true });

    var buffer = [_]u8{0} ** 1024;

    while (true) {
        const connection = try server.accept();
        const size = try connection.stream.read(&buffer);
    }
}
