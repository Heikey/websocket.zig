const std = @import("std");

pub fn build(b: *std.Build) void {

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "main",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(exe);

    var run_cmd = b.addRunArtifact(exe);
    const run_step = b.step("run", "run the exectuable.");
    run_step.dependOn(&run_cmd.step);


}
