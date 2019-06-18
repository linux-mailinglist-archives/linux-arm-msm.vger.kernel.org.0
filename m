Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006764ABDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbfFRUck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:32:40 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:15496 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729961AbfFRUck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560889953;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-ID:Subject:Cc:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=GYxPDkIBWMmZpQrR1hQV9i2H5oL8Wzwhf1wrFdpICTs=;
        b=mbyxHCYRMRG+X67whuBALx5rl2lVcKrKCr6bfEEMWhkoH1XK/ZCUfXpPYnBTcdKImZ
        Du9cSPQYAiXnC5TmQQJ9aklr37s5Wilfzczpbnwe8cfBKpIYgmSMZvsCuRuRy/N2/BCJ
        xaihqvR51070EG43AGpXRt+liuKmXu02OlL4tpoMsuixc9KdQnxCKZmtFznTlwOfJZgS
        HpPCHrj07SVtFO5Gck24HwFleyr+3kbdvVFIk77jvIhFrdVROa6BPR6mYM+PZYRzNntI
        aMmsorPqf10GCzJ5ALPWnp+pSBuMvijz37zIReg1tkzEjyg5PB/OuprYjYGbdxsWatrQ
        tolQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267EpF+OQRc4obSF5+Rx3E="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.24 AUTH)
        with ESMTPSA id m0a13fv5IKQU3QC
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Jun 2019 22:26:30 +0200 (CEST)
Date:   Tue, 18 Jun 2019 22:26:23 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Coresight causes synchronous external abort on msm8916
Message-ID: <20190618202623.GA53651@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
It works surprisingly well, but the coresight devices seem to cause the
following crash shortly after userspace starts:

    Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
    Modules linked in:
    CPU: 0 PID: 32 Comm: kworker/0:1 Not tainted 5.2.0-rc5 #7
    Hardware name: Samsung Galaxy A5 (SM-A500FU) (DT)
    Workqueue: events amba_deferred_retry_func
    pstate: 60000005 (nZCv daif -PAN -UAO)
    pc : amba_device_try_add+0x104/0x2f0
    lr : amba_device_try_add+0xf0/0x2f0
    sp : ffff00001181bd40
    x29: ffff00001181bd40 x28: 0000000000000000 
    x27: ffff80007b258b38 x26: ffff000010f490a0 
    x25: 0000000000000000 x24: ffff000011b35000 
    x23: 0000000000000000 x22: ffff80007b316ed8 
    x21: 0000000000001000 x20: 0000000000000000 
    x19: ffff80007b316c00 x18: 0000000000000000 
    x17: 0000000000000000 x16: 0000000000000000 
    x15: 0000000000000000 x14: ffffffffffffffff 
    x13: 0000000000000000 x12: 0000000000000001 
    x11: 0000000000000000 x10: 0000000000000980 
    x9 : ffff00001181ba00 x8 : ffff80007b126a20 
    x7 : ffff80007a5e0500 x6 : ffff80007b126040 
    x5 : 0000000000000002 x4 : ffff80007db85ba0 
    x3 : 0000000000000000 x2 : ffff000011b35fe0 
    x1 : 0000000000000000 x0 : 0000000000000000 
    Call trace:
     amba_device_try_add+0x104/0x2f0
     amba_deferred_retry_func+0x48/0xc8
     process_one_work+0x1e0/0x320
     worker_thread+0x40/0x428
     kthread+0x120/0x128
     ret_from_fork+0x10/0x18
    Code: 35000ac0 d10082a2 52800001 8b020302 (b9400040) 
    ---[ end trace b664cbefc1cb2294 ]---

In this case I'm using a simple device tree similar to apq8016-sbc,
but it also happens using something as simple as msm8916-mtp.dts
on this particular device.
  (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)

I can avoid the crash and boot without any further problems by disabling
every coresight device defined in msm8916.dtsi, e.g.:

	tpiu@820000 { status = "disabled"; };
	funnel@821000 { status = "disabled"; };
	replicator@824000 { status = "disabled"; };
	etf@825000 { status = "disabled"; };
	etr@826000 { status = "disabled"; };
	funnel@841000 { status = "disabled"; };
	debug@850000 { status = "disabled"; };
	debug@852000 { status = "disabled"; };
	debug@854000 { status = "disabled"; };
	debug@856000 { status = "disabled"; };
	etm@85c000 { status = "disabled"; };
	etm@85d000 { status = "disabled"; };
	etm@85e000 { status = "disabled"; };
	etm@85f000 { status = "disabled"; };

I don't have any use for coresight at the moment,
but it seems somewhat odd to put this in the device specific dts.

Any idea what could be causing this crash?
I'm not sure if this is a device-specific issue or possibly some kind of
configuration problem.
  Or is this feature only working on development boards?

Thanks in advance!
Stephan

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dmesg-a5u-mtp-defconfig.log"
Content-Transfer-Encoding: 8bit

[18960] [18960] cmdline: earlycon=msm_serial_dm,0x78b0000 console=ttyMSM0,115200,n8 PMOS_NO_OUTPUT_REDIRECT androidboot.emmc=true androidboot.serialno=e77dc5c androidboot.baseband=msm
[18970] [18970] Updating device tree: start
[18970] [18970] smem ram ptable found: ver: 1 len: 5
[19040] [19040] Setting WLAN mac address in DT: 02:00:0E:77:DC:5C
[19060] [19060] Setting Bluetooth BD address in DT: 02:00:0E:77:DC:5D
[19070] [19070] Setting BT mac address in DT: 02:00:0E:77:DC:5D
[19070] [19070] Updating device tree: done
[19080] [19080] booting linux @ 0x80080000, ramdisk @ 0x82000000 (1207700), tags/device tree @ 0x81e00000
[19080] [19080] Jumping to kernel via monitor
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 5.2.0-rc5 (pmos@lambda) (gcc version 8.3.0 (Alpine 8.3.0)) #1 SMP PREEMPT Tue Jun 18 19:57:16 UTC 2019
[    0.000000] Machine model: Qualcomm Technologies, Inc. MSM 8916 MTP
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000078b0000 (options '')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 32 MiB at 0x00000000fe000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xfdbdd840-0xfdbdefff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
[    0.000000]   node   0: [mem 0x0000000089f00000-0x000000008e9fffff]
[    0.000000]   node   0: [mem 0x000000008eb00000-0x00000000ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv65535.65535 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 23 pages/cpu s56728 r8192 d29288 u94208
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM errata 826319, 827319, 824069, 819472
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 499712
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: earlycon=msm_serial_dm,0x78b0000 console=ttyMSM0,115200,n8 PMOS_NO_OUTPUT_REDIRECT androidboot.emmc=true androidboot.serialno=e77dc5c androidboot.baseband=msm
[    0.000000] Memory: 1939312K/2031616K available (11196K kernel code, 1764K rwdata, 5892K rodata, 1408K init, 446K bss, 59536K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] random: get_random_bytes called from start_kernel+0x2c4/0x46c with crng_init=0
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000005] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.011466] Console: colour dummy device 80x25
[    0.018839] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=76800)
[    0.023278] pid_max: default: 32768 minimum: 301
[    0.033683] LSM: Security Framework initializing
[    0.039427] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.043448] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.049964] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.057055] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.064212] *** VALIDATE proc ***
[    0.070967] *** VALIDATE cgroup1 ***
[    0.074037] *** VALIDATE cgroup2 ***
[    0.101791] ASID allocator initialised with 32768 entries
[    0.109789] rcu: Hierarchical SRCU implementation.
[    0.121978] EFI services will not be available.
[    0.130005] smp: Bringing up secondary CPUs ...
[    0.162122] psci: failed to boot CPU1 (-95)
[    0.162140] CPU1: failed to boot: -95
[    0.194193] psci: failed to boot CPU2 (-95)
[    0.194211] CPU2: failed to boot: -95
[    0.226267] psci: failed to boot CPU3 (-95)
[    0.226284] CPU3: failed to boot: -95
[    0.229301] smp: Brought up 1 node, 1 CPU
[    0.233086] SMP: Total of 1 processors activated.
[    0.237059] CPU features: detected: 32-bit EL0 Support
[    0.241770] CPU features: detected: CRC32 instructions
[    0.247380] CPU: All CPU(s) started at EL1
[    0.251916] alternatives: patching kernel code
[    0.257056] devtmpfs: initialized
[    0.273206] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.273258] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.283323] pinctrl core: initialized pinctrl subsystem
[    0.289814] DMI not present or invalid.
[    0.293562] NET: Registered protocol family 16
[    0.297381] audit: initializing netlink subsys (disabled)
[    0.303381] audit: type=2000 audit(0.248:1): state=initialized audit_enabled=0 res=1
[    0.310982] cpuidle: using governor menu
[    0.315067] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.319841] DMA: preallocated 256 KiB pool for atomic allocations
[    0.327189] Serial: AMBA PL011 UART driver
[    0.359850] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.359878] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.365655] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.372307] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.388634] cryptd: max_cpu_qlen set to 1000
[    0.399970] ACPI: Interpreter disabled.
[    0.403296] vgaarb: loaded
[    0.403584] SCSI subsystem initialized
[    0.407418] usbcore: registered new interface driver usbfs
[    0.409149] usbcore: registered new interface driver hub
[    0.414699] usbcore: registered new device driver usb
[    0.420720] pps_core: LinuxPPS API ver. 1 registered
[    0.425009] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.430059] PTP clock support registered
[    0.439262] EDAC MC: Ver: 3.0.0
[    0.451299] FPGA manager framework
[    0.451400] Advanced Linux Sound Architecture Driver Initialized.
[    0.454333] clocksource: Switched to clocksource arch_sys_counter
[    0.460002] VFS: Disk quotas dquot_6.6.0
[    0.465892] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.469877] *** VALIDATE hugetlbfs ***
[    0.476682] pnp: PnP ACPI: disabled
[    0.487418] NET: Registered protocol family 2
[    0.487878] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes)
[    0.490877] TCP established hash table entries: 16384 (order: 5, 131072 bytes)
[    0.498798] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    0.505981] TCP: Hash tables configured (established 16384 bind 16384)
[    0.512323] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    0.518857] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    0.525133] NET: Registered protocol family 1
[    0.543814] RPC: Registered named UNIX socket transport module.
[    0.543834] RPC: Registered udp transport module.
[    0.548566] RPC: Registered tcp transport module.
[    0.553396] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.558091] PCI: CLS 0 bytes, default 64
[    0.564683] Unpacking initramfs...
[    0.631203] Freeing initrd memory: 1176K
[    0.631778] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters available
[    0.634453] kvm [1]: HYP mode not available
[    0.645045] Initialise system trusted keyrings
[    0.646406] workingset: timestamp_bits=44 max_order=19 bucket_order=0
[    0.658748] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.663576] NFS: Registering the id_resolver key type
[    0.663612] Key type id_resolver registered
[    0.668633] Key type id_legacy registered
[    0.672596] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.676920] 9p: Installing v9fs 9p2000 file system support
[    0.685214] Key type asymmetric registered
[    0.688846] Asymmetric key parser 'x509' registered
[    0.692963] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.697709] io scheduler mq-deadline registered
[    0.705328] io scheduler kyber registered
[    0.722626] EINJ: ACPI disabled.
[    0.734917] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.737260] SuperH (H)SCI(F) driver initialized
[    0.740711] msm_serial 78b0000.serial: msm_serial: detected port #0
[    0.744556] msm_serial 78b0000.serial: uartclk = 7372800
[    0.750814] 78b0000.serial: ttyMSM0 at MMIO 0x78b0000 (irq = 9, base_baud = 460800)à[    0.764791] printk: console [ttyMSM0] enabled
[    0.764791] printk: console [ttyMSM0] enabled
[    0.768126] printk: bootconsole [msm_serial_dm0] disabled
[    0.768126] printk: bootconsole [msm_serial_dm0] disabled
[    0.778200] msm_serial: driver initialized
[    0.784186] qcom-iommu 1ef0000.iommu: iommu sec: pgtable size: 94208
[    0.800909] loop: module loaded
[    0.804820] spmi spmi-0: PMIC arbiter version v2 (0x20010000)
[    0.814277] libphy: Fixed MDIO Bus: probed
[    0.814662] tun: Universal TUN/TAP device driver, 1.6
[    0.818244] thunder_xcv, ver 1.0
[    0.822479] thunder_bgx, ver 1.0
[    0.825715] nicpf, ver 1.0
[    0.829638] hclge is initializing
[    0.831440] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    0.834805] hns3: Copyright (c) 2017 Huawei Corporation.
[    0.841983] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    0.847390] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.853076] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.0-k
[    0.858850] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.865831] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2.4.0-k
[    0.871352] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.879712] sky2: driver version 1.30
[    0.885837] VFIO - User Level meta-driver version: 0.3
[    0.894674] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.894697] ehci-pci: EHCI PCI platform driver
[    0.900480] ehci-platform: EHCI generic platform driver
[    0.904998] ehci-orion: EHCI orion driver
[    0.910083] ehci-exynos: EHCI EXYNOS driver
[    0.914238] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.918153] ohci-pci: OHCI PCI platform driver
[    0.924419] ohci-platform: OHCI generic platform driver
[    0.928942] ohci-exynos: OHCI EXYNOS driver
[    0.934497] usbcore: registered new interface driver usb-storage
[    0.941123] i2c /dev entries driver
[    0.951088] psci: Invalid PSCI power state 0x40000002
[    0.951108] CPUidle arm: CPU 0 failed to init idle CPU ops
[    0.955381] sdhci: Secure Digital Host Controller Interface driver
[    0.960544] sdhci: Copyright(c) Pierre Ossman
[    0.967053] Synopsys Designware Multimedia Card Interface Driver
[    0.971934] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.978523] ledtrig-cpu: registered to indicate activity on CPUs
[    0.983924] usbcore: registered new interface driver usbhid
[    0.988798] usbhid: USB HID core driver
[    0.997269] NET: Registered protocol family 17
[    0.998051] 9pnet: Installing 9P2000 support
[    1.002510] Key type dns_resolver registered
[    1.007446] registered taskstats version 1
[    1.011129] Loading compiled-in X.509 certificates
[    1.027786] hctosys: unable to open rtc device (rtc0)
[    1.028423] ALSA device[    1.036041] Freeing unused kernel memory: 1408K
^@[    1.045287] s1: supplied by regulator-dummy
[    1.045487] s2: supplied by regulator-dummy
[    1.048358] Run /init as init process
[    1.052619] s3: supplied by regulator-dummy
[    1.061741] s4: supplied by regulator-dummy
[    1.061932] l1: supplied by regulator-dummy
[    1.066598] l2: supplied by regulator-dummy
[    1.069038] l3: supplied by regulator-dummy
[    1.078237] l4: supplied by regulator-dummy
[    1.078517] l5: supplied by regulator-dummy
[    1.081544] l6: supplied by regulator-dummy
[    1.087446] l7: supplied by regulator-dummy
[    1.089908] l8: supplied by regulator-dummy
[    1.095744] l9: supplied by regulator-dummy
[    1.098228] l10: supplied by regulator-dummy
[    1.104094] l11: supplied by regulator-dummy
[    1.108396] l12: supplied by regulator-dummy
[    1.112690] l13: supplied by regulator-dummy
[    1.116981] l14: supplied by regulator-dummy
[    1.121242] l15: supplied by regulator-dummy
### postmarketOS initramfs ###
[    1.130967] l16: supplied by regulator-dummy
[    1.131208] l17: supplied by regulator-dummy
[    1.136988] l18: supplied by regulator-dummy
Trying to mount subpartitions for 10 seconds...
[    5.426552] Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
[    5.426574] Modules linked in:
[    5.433000] CPU: 0 PID: 32 Comm: kworker/0:1 Not tainted 5.2.0-rc5 #1
[    5.435952] Hardware name: Qualcomm Technologies, Inc. MSM 8916 MTP (DT)
[    5.442470] Workqueue: events amba_deferred_retry_func
[    5.449233] pstate: 60000005 (nZCv daif -PAN -UAO)
[    5.454181] pc : amba_device_try_add+0x104/0x2f0
[    5.458954] lr : amba_device_try_add+0xf0/0x2f0
[    5.463726] sp : ffff0000118abd40
[    5.467978] x29: ffff0000118abd40 x28: 0000000000000000 
[    5.471453] x27: ffff80007b340138 x26: ffff000010fa2a20 
[    5.476835] x25: 0000000000000000 x24: ffff000011875000 
[    5.482130] x23: 0000000000000000 x22: ffff80007b3f8ed8 
[    5.487425] x21: 0000000000001000 x20: 0000000000000000 
[    5.492719] x19: ffff80007b3f8c00 x18: 0000000000000000 
[    5.498015] x17: 0000000000000000 x16: 0000000000000000 
[    5.503309] x15: 0000000000000000 x14: 0000000000000000 
[    5.508605] x13: 0000000000000000 x12: 0000000000000001 
[    5.513901] x11: 0000000000000000 x10: 0000000000000980 
[    5.519195] x9 : ffff0000118aba00 x8 : ffff80007b226a20 
[    5.524491] x7 : ffff80007aa6b200 x6 : ffff80007b226040 
[    5.529786] x5 : 0000000000000002 x4 : ffff80007db8bde0 
[    5.535080] x3 : 0000000000000000 x2 : ffff000011875fe0 
[    5.540376] x1 : 0000000000000000 x0 : 0000000000000000 
[    5.545671] Call trace:
[    5.550966]  amba_device_try_add+0x104/0x2f0
[    5.553138]  amba_deferred_retry_func+0x48/0xc8
[    5.557652]  process_one_work+0x1e0/0x320
[    5.561906]  worker_thread+0x40/0x428
[    5.566071]  kthread+0x120/0x128
[    5.569718]  ret_from_fork+0x10/0x18
[    5.573017] Code: 35000ac0 d10082a2 52800001 8b020302 (b9400040) 
[    5.576577] ---[ end trace 7d3712547e71a08a ]---

--uAKRQypu60I7Lcqm--
