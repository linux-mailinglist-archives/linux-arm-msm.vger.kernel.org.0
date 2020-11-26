Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898AB2C4FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 09:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388630AbgKZIGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 03:06:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:50612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388628AbgKZIGr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 03:06:47 -0500
Received: from [192.168.0.244] (14-202-152-139.tpgi.com.au [14.202.152.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA79A20857;
        Thu, 26 Nov 2020 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606378006;
        bh=QvcAG6G5SI/9brfJDN8hIKk7c4QE+TYMSqwnf1v6Jlo=;
        h=To:Cc:From:Subject:Date:From;
        b=mxUoHHQjrdZVAXO1LLn16ismb+LDi0R5dkD93JAPw4HlaELymjtL7FKoBlMkjxXKm
         398hYDP/7YFMRufPoIAsNMpFphtNoIrZPHAlOtqedripvS+TZ4XdOlB6anSCx1MgVo
         d9ONJnRiSYRG7q82pmf/pWeEnSm2980zX41u7yPg=
To:     absahu@codeaurora.org, sivaprak@codeaurora.org
Cc:     sricharan@codeaurora.org, linux-arm-msm@vger.kernel.org
From:   Greg Ungerer <gerg@kernel.org>
Subject: linux on the IPQ6018
Message-ID: <edd82b46-95ea-1f58-f0de-47c7d6746e49@kernel.org>
Date:   Thu, 26 Nov 2020 18:06:42 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Abhishek, Sivaprakash,

I see that you guys added support for the IPQ6018 CP01 board.
I am working with the Compex WPQ618 board - which is a variant of
that but am hitting problems.

I have tried a few different kernel versions (5.8, 5.9) but am now
concentrating on linux-5.10-rc5. If I build a defconfig with that,
and add a small root filesystem (working on other ARM64 targets) then
ultimately the boot hangs. Console output:


[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x51af8014]
[    0.000000] Linux version 5.10.0-rc5-00015-g127c501a03d5 (gerg@gumby) 
(aarch64-linux-musl-gcc (GCC) 8.3.0, GNU ld (GNU Binutils) 2.32) #11 SMP 
PREEMPT Thu Nov 26 12:11:08 AEST 2020
[    0.000000] Machine model: Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b1000 
(options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 32 MiB at 0x000000007e000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 
0x0000000040000000-0x000000007fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x7de05b00-0x7de07fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000484fffff]
[    0.000000]   node   0: [mem 0x0000000048700000-0x000000004a9fffff]
[    0.000000]   node   0: [mem 0x000000004d300000-0x000000007fffffff]
[    0.000000] Zeroed struct page in unavailable ranges: 256 pages
[    0.000000] Initmem setup node 0 [mem 
0x0000000040000000-0x000000007fffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 23 pages/cpu s56152 r8192 d29864 u94208
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 247040
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: console=ttyMSM0,115200n8 
earlycon=msm_serial_dm,0x78B1000
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 
1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 919192K/1004544K available (14080K kernel code, 
2796K rwdata, 7576K rodata, 7104K init, 517K bss, 52584K reserved, 
32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] random: get_random_bytes called from 
start_kernel+0x32c/0x4ec with crng_init=0
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 24.00MHz 
(virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff 
max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000005] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps 
every 4398046511097ns
[    0.011005] Console: colour dummy device 80x25
[    0.018824] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 48.00 BogoMIPS (lpj=96000)
[    0.023273] pid_max: default: 32768 minimum: 301
[    0.033681] LSM: Security Framework initializing
[    0.038339] Mount-cache hash table entries: 2048 (order: 2, 16384 
bytes, linear)
[    0.042891] Mountpoint-cache hash table entries: 2048 (order: 2, 
16384 bytes, linear)
[    0.051872] rcu: Hierarchical SRCU implementation.
[    0.059217] EFI services will not be available.
[    0.062915] smp: Bringing up secondary CPUs ...
[    0.067741] Detected VIPT I-cache on CPU1
[    0.067809] CPU1: Booted secondary processor 0x0000000001 [0x51af8014]
[    0.068479] Detected VIPT I-cache on CPU2
[    0.068522] CPU2: Booted secondary processor 0x0000000002 [0x51af8014]
[    0.069163] Detected VIPT I-cache on CPU3
[    0.069202] CPU3: Booted secondary processor 0x0000000003 [0x51af8014]
[    0.069288] smp: Brought up 1 node, 4 CPUs
[    0.103219] SMP: Total of 4 processors activated.
[    0.107292] CPU features: detected: 32-bit EL0 Support
[    0.112086] CPU features: detected: CRC32 instructions
[    0.117104] CPU features: detected: 32-bit EL1 Support
[    0.133016] CPU: All CPU(s) started at EL1
[    0.133075] alternatives: patching kernel code
[    0.137341] devtmpfs: initialized
[    0.143426] KASLR disabled due to lack of seed
[    0.144228] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.148200] futex hash table entries: 1024 (order: 4, 65536 bytes, 
linear)
[    0.159379] pinctrl core: initialized pinctrl subsystem
[    0.166130] DMI not present or invalid.
[    0.170512] NET: Registered protocol family 16
[    0.175725] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic 
allocations
[    0.178245] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for 
atomic allocations
[    0.185541] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for 
atomic allocations
[    0.193223] audit: initializing netlink subsys (disabled)
[    0.201030] audit: type=2000 audit(0.144:1): state=initialized 
audit_enabled=0 res=1
[    0.202094] thermal_sys: Registered thermal governor 'step_wise'
[    0.206341] thermal_sys: Registered thermal governor 'power_allocator'
[    0.214244] cpuidle: using governor menu
[    0.226689] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.230646] ASID allocator initialised with 65536 entries
[    0.238674] Serial: AMBA PL011 UART driver
[    0.254978] OF: /soc/pinctrl@1000000: (null) = 3 found 3
[    0.279387] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.279427] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.285229] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.291878] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.299845] cryptd: max_cpu_qlen set to 1000
[    0.307657] ACPI: Interpreter disabled.
[    0.310917] iommu: Default domain type: Translated
[    0.313207] vgaarb: loaded
[    0.318249] SCSI subsystem initialized
[    0.321084] usbcore: registered new interface driver usbfs
[    0.324455] usbcore: registered new interface driver hub
[    0.329935] usbcore: registered new device driver usb
[    0.335911] pps_core: LinuxPPS API ver. 1 registered
[    0.340289] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    0.345349] PTP clock support registered
[    0.354564] EDAC MC: Ver: 3.0.0
[    0.358984] qcom_scm: convention: smc arm 64
[    0.362470] FPGA manager framework
[    0.363612] qcom_rpm_smd_regulator 
rpm-glink:glink-channel:regulators: Supply for s2 (s2) resolved to itself
[    0.365813] Advanced Linux Sound Architecture Driver Initialized.
[    0.368949] s2: supplied by regulator-dummy
[    0.369139] qcom_rpm_smd_regulator 
rpm-glink:glink-channel:regulators: Supply for l2 (l2) resolved to itself
[    0.388929] l2: supplied by regulator-dummy
[    0.388933] clocksource: Switched to clocksource arch_sys_counter
[    0.389183] VFS: Disk quotas dquot_6.6.0
[    0.409221] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 
bytes)
[    0.413356] pnp: PnP ACPI: disabled
[    0.427525] NET: Registered protocol family 2
[    0.428032] tcp_listen_portaddr_hash hash table entries: 512 (order: 
1, 8192 bytes, linear)
[    0.430917] TCP established hash table entries: 8192 (order: 4, 65536 
bytes, linear)
[    0.439120] TCP bind hash table entries: 8192 (order: 5, 131072 
bytes, linear)
[    0.447161] TCP: Hash tables configured (established 8192 bind 8192)
[    0.454176] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.460609] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, 
linear)
[    0.467054] NET: Registered protocol family 1
[    0.474657] RPC: Registered named UNIX socket transport module.
[    0.478454] RPC: Registered udp transport module.
[    0.484198] RPC: Registered tcp transport module.
[    0.489030] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.493730] PCI: CLS 0 bytes, default 64
[    0.570463] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 
7 counters available
[    0.570738] kvm [1]: HYP mode not available
[   21.584922] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[   21.584959] rcu: 	0-...0: (9 GPs behind) 
idle=432/1/0x4000000000000000 softirq=17/18 fqs=2625
[   21.590002] 	(detected by 1, t=5253 jiffies, g=-1127, q=170)
[   84.604920] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:


No more output.

Any idea what might be wrong?

Can you build kernels from mainline that run on IPQ6018 targets
with no problems?

I have managed to build 5.8, 5.9 and even 5.10-rc5 working kernels.
If I strip down the kernel configuration to a more minimal setup - with
only Qualcomm SoC and a basic set of drivers I can get a boot to user
space.

But they do not run reliably. As soon as I load them up with a few
running processes they either lock up hard, CPU reset, or
occasionally oops with something like this:

Internal error: synchronous external abort: 96000010 [#1] SMP
Modules linked in:
CPU: 2 PID: 1243 Comm: modem Not tainted 5.10.0-rc5-00015-g127c501a03d5 #1
Hardware name: Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1 (DT)
pstate: 20000005 (nzCv daif -PAN -UAO -TCO BTYPE=--)
pc : copy_page_range+0x1f4/0xb90
lr : copy_page_range+0xb50/0xb90
sp : ffffffc011eebaa0
x29: ffffffc011eebaa0 x28: 0000007f93822000
x27: 0000007f93822000 x26: ffffff80092cb4d0
x25: 0000000000000000 x24: 0000000000000000
x23: ffffffc010a887c8 x22: ffffff800936ea00
x21: ffffff800936d880 x20: ffffff80092cb4d0
x19: ffffff800a5fcff0 x18: 0000000000000014
x17: 0000000032a519c8 x16: 00000000f706d472
x15: 0000000000000001 x14: 0000000000000002
x13: 0000000000032602 x12: 000000000000000b
x11: 0000000000000000 x10: 0000000000000000
x9 : ffffffc0109b9ae0 x8 : ffffffc010b4c2c0
x7 : 0000000000000008 x6 : 00000000fffffff4
x5 : ffffff800936ea64 x4 : 0000007f93822fff
x3 : 0000007f93822fff x2 : 0000007f93a00000
x1 : 0000000000000002 x0 : ffffff800a6004e0
Call trace:
  copy_page_range+0x1f4/0xb90
  dup_mm.isra.100+0x368/0x480
  copy_process+0x788/0x1568
  kernel_clone+0xe0/0x3d0
  __do_sys_clone+0x64/0x90
  __arm64_sys_clone+0x20/0x30
  el0_svc_common.constprop.3+0x8c/0x170
  do_el0_svc+0x24/0x90
  el0_sync_handler+0x118/0x168
  el0_sync+0x158/0x180
Code: d503201f 910803e0 a930fc1f f9403fe0 (f9400000)
---[ end trace 0232e313a3a0f1ea ]---
Kernel panic - not syncing: synchronous external abort: Fatal exception
SMP: stopping secondary CPUs
SMP: failed to stop secondary CPUs 0,2
Kernel Offset: disabled
CPU features: 0x0040002,60002004
Memory Limit: none
Rebooting in 5 seconds..
SMP: stopping secondary CPUs

Usually it is some type of abort if I do get an oops.

If I just let the system sit there idle with a shell and not much else
running it seems to be stable.

If I run the really ancient openwrt distro that qualcomm/compex supply
(based on linux-4.4) then this hardware seems to run fine. So I am not
suspecting a hardware problem with it yet.

Regards
Greg

