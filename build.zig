const std = @import("std");
const system = @import("system");

pub fn build(b: *std.Build) void {
  const target = b.standardTargetOptions(.{});
  const optimize = b.standardOptimizeOption(.{});

  // mem library
  const lib = b.addStaticLibrary(.{
    .name = "mem",
    .target = target,
    .optimize = optimize
  });

  system.add_defines(lib);

  lib.linkLibCpp();

  lib.addIncludePath(b.path("."));

  lib.addCSourceFiles(.{
    .files = &.{
      "mem/Memory.cpp"
    },
    .flags = &.{"-std=c++11"}
  });

  lib.installHeadersDirectory(b.path("mem"), "mem", .{ .include_extensions = &.{"hpp"} });

  b.installArtifact(lib);
}
