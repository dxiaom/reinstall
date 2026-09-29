#!/bin/ash
# shellcheck shell=dash
# trans.sh 共用此脚本：获取 gostc(客户端) 最新版下载地址
# 说明：使用官方国内镜像 alist.sian.one 下载，
#       与 https://alist.sian.one/direct/gostc/gostc-open/install.sh 保持一致

# 输出 goreleaser 的 target 后缀（与官方 install.sh 的 FILE_SUFFIX 保持一致）
get_arch_suffix() {
    case "$(uname -m)" in
    x86_64) echo amd64_v1 ;; # v1 兼容所有 amd64
    aarch64) echo arm64_v8.0 ;;
    armv7l) echo arm_7 ;;
    armv6l) echo arm_6 ;;
    armv5tel | armv5l | armv4l) echo arm_5 ;;
    i686 | i386) echo 386_sse2 ;;
    riscv64) echo riscv64_rva20u64 ;;
    s390x) echo s390x ;;
    mips64el) echo mips64le_hardfloat ;;
    mips64) echo mips64_hardfloat ;;
    mipsel) echo mipsle_hardfloat ;;
    mips) echo mips_hardfloat ;;
    *)
        echo "Unsupported architecture: $(uname -m)" >&2
        exit 1
        ;;
    esac
}

if ! arch_suffix=$(get_arch_suffix); then
    exit 1
fi

echo "https://alist.sian.one/direct/gostc/gostc-open/gostc_linux_${arch_suffix}.tar.gz"