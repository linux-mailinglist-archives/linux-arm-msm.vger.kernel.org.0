Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6678215609
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 13:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgGFLDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 07:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbgGFLD3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 07:03:29 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFC7C061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 04:03:29 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h22so37590628lji.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=dJOoGefz57DaQizOn40gSk42uMJzSXdv0XUjOjwso8w=;
        b=WzyymKU3k9AASoHQcdTZdMnplRPotDs8uxxWJHFc6Flnkbf6NFg78peAyPELWalHn/
         DHRdfclt7zrfp/UGrA0aJkRrLNcOMd7ty/Eczr8f0cyNJ+Av4ThgsU0cT7PTu3KIdEoH
         UDfWPkTNjDwvdkPpfxji7nPz+vcWVftHWjgJJXor1n72nli0dWQabzQ/nBWr1gCgi6G1
         9jDEeIi/lmN1Pd8bvwB6gAgGe9y+lkq9p+UwsSLLR5WiuJIds9Lfq96fweAmoxuAU4PE
         r9RCeN5JbGgfHoRoYxgb6TMzO8fFGRIvWS6Ls6tZsGbQdkNYbazm/Lrv066LGJX/jEjP
         nWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=dJOoGefz57DaQizOn40gSk42uMJzSXdv0XUjOjwso8w=;
        b=VL9nAKCR2a/Z+1YW1yuvjfNXjCrSz81BQSh9UcyAAP0QvxPQGXAsUIq94/9OGOJVUh
         b+10D5ze+LFfNNGPR3BssN7t9v3BEWKirhVjI2F+ZgA/gxQLJDNS5WsLygl8XANKvvyk
         YJtg2lhp0ua5EKDlIbrw6ypW5ORSysuZsZXhoRx/lpqK8WoiJAvvpa7KNM74Wr+AJnO7
         8/Dx9caeu6C7wtmHBWKcpKr1rSdDPNv6lUyC9N30IQIl9JhsC6zcb9+EyzPrVxI3xddd
         tgkTH3XplkwAV3Im8B4MHaJk5ZI8sjAoSTX2i76qTMFbjVdxASw2ISdYH8tyNZsXm/Ha
         CUIA==
X-Gm-Message-State: AOAM53150PFtea66pEIWtue+BZ7gkc5klfH/cSwPkBlSh6gbiP+Qdy0D
        Hk5F3etKLLKr6ZHVX+cJwoo2aOlan0bwWv/jwe1d5Q==
X-Google-Smtp-Source: ABdhPJz2+jMGpdrgo/15hvPjeNV/XflW/4l5Oov/YAJQSgf3S+7RBZhbsozCARaSvlm1nM3TOIP/KJF0UzJJ/nLVHQA=
X-Received: by 2002:a2e:7401:: with SMTP id p1mr3554097ljc.366.1594033407701;
 Mon, 06 Jul 2020 04:03:27 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 6 Jul 2020 16:33:16 +0530
Message-ID: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
Subject: [qemu] boot failed: Unable to handle kernel NULL pointer dereference
 at virtual address 0000000000000000
To:     linux-serial@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     vkoul@kernel.org, jslaby@suse.com, linux-arm-msm@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        ldewangan@nvidia.com, thierry.reding@gmail.com,
        Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While booting qemu_arm64 and qemu_arm with Linux version 5.8.0-rc3-next-20200706
the kernel panic noticed due to kernel NULL pointer dereference.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 5680d14d59bddc8bcbc5badf00dbbd4374858497
  git describe: next-20200706
  make_kernelversion: 5.8.0-rc3
  kernel-config:
https://builds.tuxbuild.com/Glr-Ql1wbp3qN3cnHogyNA/kernel.config

qemu arm64 boot crash log,

[    0.972053] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[    0.975301] Mem abort info:
[    0.976316]   ESR = 0x96000004
[    0.977378]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.979363]   SET = 0, FnV = 0
[    0.980458]   EA = 0, S1PTW = 0
[    0.981583] Data abort info:
[    0.982634]   ISV = 0, ISS = 0x00000004
[    0.984213]   CM = 0, WnR = 0
[    0.985260] [0000000000000000] user address but active_mm is swapper
[    0.987600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.989557] Modules linked in:
[    0.990671] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
5.8.0-rc3-next-20200706 #1
[    0.993711] Hardware name: linux,dummy-virt (DT)
[    0.995708] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
[    0.998168] pc : pl011_dma_probe+0x90/0x360
[    1.000015] lr : pl011_dma_probe+0x84/0x360
[    1.001827] sp : ffff800011f4b880
[    1.003294] x29: ffff800011f4b880 x28: ffff0000fada5800
[    1.005562] x27: ffff800011e057d8 x26: 0000000000020002
[    1.007884] x25: ffff8000110c0ed0 x24: ffff8000110c0b70
[    1.010164] x23: 0000000000000000 x22: ffff0000faca8000
[    1.012438] x21: ffff0000faee6000 x20: 0000000000000000
[    1.014724] x19: ffff0000faee7480 x18: 0000000000000002
[    1.016977] x17: 0000000000001400 x16: 0000000000001c00
[    1.019270] x15: 0000000000000001 x14: 000000000003a051
[    1.021544] x13: ffff000000000000 x12: 0000000000000010
[    1.023805] x11: 0000000000000004 x10: 0101010101010101
[    1.026091] x9 : fffffffffffffffc x8 : 7f7f7f7f7f7f7f7f
[    1.028354] x7 : fefefeff646c606d x6 : 0a0c0c1680808080
[    1.030645] x5 : 00000000160c0c0a x4 : 0000000000000000
[    1.032887] x3 : ffff800011de1878 x2 : 0000000000000000
[    1.035179] x1 : 5d22d5f0b315de00 x0 : 0000000000000000
[    1.037439] Call trace:
[    1.038640]  pl011_dma_probe+0x90/0x360
[    1.040281]  pl011_startup+0x268/0x2f0
[    1.041935]  uart_startup.part.0+0x124/0x2d8
[    1.043777]  uart_port_activate+0x60/0x98
[    1.045483]  tty_port_open+0x90/0x248
[    1.047163]  uart_open+0x1c/0x30
[    1.048568]  tty_open+0xf4/0x478
[    1.049973]  chrdev_open+0xa4/0x1a0
[    1.051491]  do_dentry_open+0x12c/0x398
[    1.053156]  vfs_open+0x2c/0x38
[    1.054551]  path_openat+0x86c/0xdf0
[    1.056103]  do_filp_open+0x78/0x100
[    1.057651]  do_sys_openat2+0x1e4/0x2a0
[    1.059410]  do_sys_open+0x58/0xa0
[    1.060866]  console_on_rootfs+0x24/0x68
[    1.062577]  kernel_init_freeable+0x1f4/0x254
[    1.064450]  kernel_init+0x14/0x110
[    1.065972]  ret_from_fork+0x10/0x34
[    1.067504] Code: 97fcf14c aa0003f4 b140041f 54000488 (f9400280)
[    1.070107] ---[ end trace 8001204d6659f3e5 ]---
[    1.072104] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    1.074875] SMP: stopping secondary CPUs
[    1.076613] Kernel Offset: disabled
[    1.078123] CPU features: 0x240002,20002004
[    1.079916] Memory Limit: none
[    1.081255] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

Full test log,
https://lkft.validation.linaro.org/scheduler/job/1542193#L510

qemu command,
/usr/bin/qemu-system-aarch64 -cpu host -machine virt-2.10,accel=kvm
-nographic -net nic,model=virtio,macaddr=BA:DD:AD:CC:09:05 -net tap -m
2048 -monitor none -kernel /kernel/Image --append "console=ttyAMA0
root=/dev/vda rw" -hda
/rootfs/rpb-console-image-lkft-juno-20200521172852-2689.rootfs.ext4 -m
4096 -smp 4 -nographic -drive
format=qcow2,file=lava-guest.qcow2,media=disk,if=virtio,id=lavatest

-- 
Linaro LKFT
https://lkft.linaro.org
