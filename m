Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906513DDEF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 20:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhHBSO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 14:14:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64048 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhHBSO4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 14:14:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627928086; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iqEE3h+r62h4Zt8hdlkfi1pDB1YGpXK2hzs70AVHhME=;
 b=CaS/XN8o0JiTZtCQSingyG/4M2tLPVMCViHpXkE3KTzIbgBalC4hlp+AemoD0RI9OpXaQUyE
 IKZlMtTHYj61xXQitEpo1nN0eh28M3XmUKNTcp/ycZteVRQt9P2RUicK+XNDyNZCwa350MQz
 vzbT13rYdKim5lpB6R+7dB81qpM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6108360296a66e66b2360547 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 18:14:26
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6222C433F1; Mon,  2 Aug 2021 18:14:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44204C433D3;
        Mon,  2 Aug 2021 18:14:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 02 Aug 2021 11:14:24 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: MHI driver issue with Sierra Wireless AirPrime EM919X
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi-22FjHwUqQ-K2huaHV_9zDrZShi74w7LCUiMjf-Ss_OQ@mail.gmail.com>
References: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
 <CAMZdPi-qydatnYYLPY9pZ_4XNZOKB+GBVw2M5rqD1WuVEQLwOg@mail.gmail.com>
 <4a9b0d64f1d7ead1f183b2ad0af32379e64d9b82.camel@bootlin.com>
 <CAMZdPi-22FjHwUqQ-K2huaHV_9zDrZShi74w7LCUiMjf-Ss_OQ@mail.gmail.com>
Message-ID: <680ccb5730cc1724bbadb2b21638b696@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-02 09:33 AM, Loic Poulain wrote:
>> > On Fri, 30 Jul 2021 at 19:52, Thomas Perrot <
>> > thomas.perrot@bootlin.com> wrote:
>> > >
>> > > Hello,
>> > >
>> > > I’m trying to use the MHI driver with a Sierra Wireless AirPrime
>> > > EM919X
>> > > connected to an NXP i.MX6DL through a PCIe gen2 bus, on 5.13.6, but
>> > > the
>> > > device initialisation fails, as follows:
>> > >
>> > > [    3.029401] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
>> > > 0x01100000-0x01100fff 64bit]
>> > > [    3.041095] mhi-pci-generic 0000:01:00.0: enabling device (0140 ->
>> > > 0142)
>> > > [    3.118299] mhi mhi0: Requested to power ON
>> > > [   11.370361] mhi mhi0: Power on setup success
>> > > [   11.372503] mhi mhi0: Wait for device to enter SBL or Mission mode
>> > > [   15.664068] mhi-pci-generic 0000:01:00.0: failed to suspend
>> > > device:
>> > > -16
>> > > [   22.619948] mhi-pci-generic 0000:01:00.0: refused to change power
>> > > state from D3hot to D0
>> > > [   57.289998] mhi-pci-generic 0000:01:00.0: can't change power state
>> > > from D3hot to D0 (config space inaccessible)
>> > > [   73.769675] mhi-pci-generic 0000:01:00.0: can't change power state
>> > > from D3cold to D0 (config space inaccessible)
>> > > [   73.780188] mhi-pci-generic 0000:01:00.0: can't change power state
>> > > from D3hot to D0 (config space inaccessible)
>> > > [   73.836150] PC is at mhi_pci_read_reg+0xc/0x14
>> > > [   73.840642] LR is at mhi_get_mhi_state+0x2c/0x5c
>> > > [   74.121120] [<c05dcaf4>] (mhi_pci_read_reg) from [<c05d754c>]
>> > > (mhi_get_mhi_state+0x2c/0x5c)
>> > > [   74.129529] [<c05d754c>] (mhi_get_mhi_state) from [<c05da440>]
>> > > (mhi_pm_resume+0x38/0x298)
>> > > [   74.137754] [<c05da440>] (mhi_pm_resume) from [<c05dcbd0>]
>> > > (mhi_pci_runtime_resume+0x70/0xe0)
>> > > [   74.146326] [<c05dcbd0>] (mhi_pci_runtime_resume) from
>> > > [<c0604da0>]
>> > > (pci_pm_runtime_resume+0x84/0xa0)
>> > >
>> > > Do you have any idea where the issue might come from?
>> > >
>> > > MHI seems to enter in READY state and waiting to enter in SBL or
>> > > Mission mode when the issue occurs, the host can start MHI
>> > > initialization by programming MMIO registers and sets the device into
>> > > MHI_M0 state.
>> >
>> > runtime-pm is only enabled when the device is in mission mode, so the
>> > device has likely been successfully initialized, It is just that there
>> > is no info message indicating initialization completion and we should
>> > probably add that. I think maybe about some PCIe suspend/resume
>> > issues, could you try disabling runtime-pm for that device? or simply
>> > comment `pm_runtime_allow` call?
>> 
>> Thanks for your help, I disabled the power management, I obtains the
>> following trace:
>> 
>> [    0.000000] Booting Linux on physical CPU 0x0
>> [    0.000000] Linux version 5.13.6 (arm-oe-linux-gnueabi-gcc (GCC)
>> 9.2.0, GNU ld (GNU Binutils) 2.32.0.20190204) #1 SMP Mon Aug 2 
>> 14:27:03
>> UTC 2021
>> [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7),
>> cr=10c5387d
>> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
>> instruction cache
>> [    0.000000] OF: fdt: Machine model: i.MX6 Duallite module
>> [    0.000000] Memory policy: Data cache writealloc
>> [    0.000000] cma: Reserved 64 MiB at 0x4c000000
>> [    0.000000] Zone ranges:
>> [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
>> [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
>> [    0.000000] Movable zone start for each node
>> [    0.000000] Early memory node ranges
>> [    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
>> [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-
>> 0x000000004fffffff]
>> [    0.000000] On node 0 totalpages: 262144
>> [    0.000000]   Normal zone: 1536 pages used for memmap
>> [    0.000000]   Normal zone: 0 pages reserved
>> [    0.000000]   Normal zone: 196608 pages, LIFO batch:63
>> [    0.000000]   HighMem zone: 65536 pages, LIFO batch:15
>> [    0.000000] percpu: Embedded 20 pages/cpu s52396 r8192 d21332 
>> u81920
>> [    0.000000] pcpu-alloc: s52396 r8192 d21332 u81920 alloc=20*4096
>> [    0.000000] pcpu-alloc: [0] 0 [0] 1
>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
>> 260608
>> [    0.000000] Kernel command line: console=ttymxc3,115200n8 
>> loglevel=8
>> root=/dev/nfs ip=10.0.0.2:255.255.255.0
>> nfsroot=10.0.0.1:/var/lib/nfsboot,v4,tcp
>> [    0.000000] Dentry cache hash table entries: 131072 (order: 7,
>> 524288 bytes, linear)
>> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
>> bytes, linear)
>> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
>> [    0.000000] Memory: 945728K/1048576K available (13312K kernel code,
>> 1910K rwdata, 4228K rodata, 1024K init, 6621K bss, 37312K reserved,
>> 65536K cma-reserved, 196608K highmem)
>> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2,
>> Nodes=1
>> [    0.000000] trace event string verifier disabled
>> [    0.000000] Running RCU self tests
>> [    0.000000] rcu: Hierarchical RCU implementation.
>> [    0.000000] rcu:     RCU event tracing is enabled.
>> [    0.000000] rcu:     RCU lockdep checking is enabled.
>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=4 to
>> nr_cpu_ids=2.
>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
>> is 10 jiffies.
>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16,
>> nr_cpu_ids=2
>> [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
>> [    0.000000] L2C-310 erratum 769419 enabled
>> [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
>> [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
>> [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
>> [    0.000000] L2C-310 dynamic clock gating enabled, standby mode
>> enabled
>> [    0.000000] L2C-310 cache controller enabled, 16 ways, 512 kB
>> [    0.000000] L2C-310: CACHE_ID 0x410000c8, AUX_CTRL 0x76450001
>> [    0.000000] random: get_random_bytes called from
>> start_kernel+0x364/0x58c with crng_init=0
>> [    0.000000] Switching to timer-based delay loop, resolution 333ns
>> [    0.000001] sched_clock: 32 bits at 3000kHz, resolution 333ns, 
>> wraps
>> every 715827882841ns
>> [    0.000033] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
>> 0xffffffff, max_idle_ns: 637086815595 ns
>> [    0.001600] Console: colour dummy device 80x30
>> [    0.001663] Lock dependency validator: Copyright (c) 2006 Red Hat,
>> Inc., Ingo Molnar
>> [    0.001685] ... MAX_LOCKDEP_SUBCLASSES:  8
>> [    0.001703] ... MAX_LOCK_DEPTH:          48
>> [    0.001721] ... MAX_LOCKDEP_KEYS:        8192
>> [    0.001742] ... CLASSHASH_SIZE:          4096
>> [    0.001760] ... MAX_LOCKDEP_ENTRIES:     32768
>> [    0.001777] ... MAX_LOCKDEP_CHAINS:      65536
>> [    0.001795] ... CHAINHASH_SIZE:          32768
>> [    0.001812]  memory used by lock dependency info: 4061 kB
>> [    0.001831]  memory used for stack traces: 2112 kB
>> [    0.001849]  per task-struct memory footprint: 1536 bytes
>> [    0.001979] Calibrating delay loop (skipped), value calculated 
>> using
>> timer frequency.. 6.00 BogoMIPS (lpj=30000)
>> [    0.002020] pid_max: default: 32768 minimum: 301
>> [    0.002324] Mount-cache hash table entries: 2048 (order: 1, 8192
>> bytes, linear)
>> [    0.002375] Mountpoint-cache hash table entries: 2048 (order: 1,
>> 8192 bytes, linear)
>> [    0.006205] CPU: Testing write buffer coherency: ok
>> [    0.006386] CPU0: Spectre v2: using BPIALL workaround
>> [    0.007450] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
>> [    0.010927] Setting up static identity map for 0x10100000 -
>> 0x10100078
>> [    0.011749] rcu: Hierarchical SRCU implementation.
>> [    0.013800] smp: Bringing up secondary CPUs ...
>> [    0.017275] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
>> [    0.017300] CPU1: Spectre v2: using BPIALL workaround
>> [    0.018621] smp: Brought up 1 node, 2 CPUs
>> [    0.018660] SMP: Total of 2 processors activated (12.00 BogoMIPS).
>> [    0.018691] CPU: All CPU(s) started in SVC mode.
>> [    0.022001] devtmpfs: initialized
>> [    0.061678] VFP support v0.3: implementor 41 architecture 3 part 30
>> variant 9 rev 4
>> [    0.064662] clocksource: jiffies: mask: 0xffffffff max_cycles:
>> 0xffffffff, max_idle_ns: 19112604462750000 ns
>> [    0.064755] futex hash table entries: 512 (order: 3, 32768 bytes,
>> linear)
>> [    0.068750] pinctrl core: initialized pinctrl subsystem
>> [    0.075244] NET: Registered protocol family 16
>> [    0.102637] DMA: preallocated 256 KiB pool for atomic coherent
>> allocations
>> [    0.108783] thermal_sys: Registered thermal governor 'step_wise'
>> [    0.109361] cpuidle: using governor menu
>> [    0.109609] NET: Registered protocol family 42
>> [    0.110336] CPU identified as i.MX6DL, silicon rev 1.3
>> [    0.157666] vdd1p1: supplied by regulator-dummy
>> [    0.160738] vdd3p0: supplied by regulator-dummy
>> [    0.163009] vdd2p5: supplied by regulator-dummy
>> [    0.166539] vddpu: supplied by regulator-dummy
>> [    0.204081] platform 2400000.ipu: Fixing up cyclic dependency with
>> 20e0000.iomuxc-gpr:ipu1_csi1_mux
>> [    0.204560] platform 2400000.ipu: Fixing up cyclic dependency with
>> 20e0000.iomuxc-gpr:ipu1_csi0_mux
>> [    0.216152] No ATAGs?
>> [    0.216575] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
>> watchpoint registers.
>> [    0.216689] hw-breakpoint: maximum watchpoint size is 4 bytes.
>> [    0.218287] debugfs: Directory 'dummy-iomuxc-gpr@20e0000' with
>> parent 'regmap' already present!
>> [    0.219892] imx6dl-pinctrl 20e0000.pinctrl: initialized IMX pinctrl
>> driver
>> [    0.336589] mxs-dma 110000.dma-apbh: initialized
>> [    0.366282] vgaarb: loaded
>> [    0.368879] SCSI subsystem initialized
>> [    0.369795] libata version 3.00 loaded.
>> [    0.371044] usbcore: registered new interface driver usbfs
>> [    0.371350] usbcore: registered new interface driver hub
>> [    0.371534] usbcore: registered new device driver usb
>> [    0.372134] usb_phy_generic usbphynop1: supply vcc not found, using
>> dummy regulator
>> [    0.373424] usb_phy_generic usbphynop2: supply vcc not found, using
>> dummy regulator
>> [    0.380083] i2c i2c-1: IMX I2C adapter registered
>> [    0.381434] pps_core: LinuxPPS API ver. 1 registered
>> [    0.381470] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
>> Rodolfo Giometti <giometti@linux.it>
>> [    0.381551] PTP clock support registered
>> [    0.386332] Bluetooth: Core ver 2.22
>> [    0.386506] NET: Registered protocol family 31
>> [    0.386535] Bluetooth: HCI device and connection manager 
>> initialized
>> [    0.386695] Bluetooth: HCI socket layer initialized
>> [    0.386748] Bluetooth: L2CAP socket layer initialized
>> [    0.386945] Bluetooth: SCO socket layer initialized
>> [    0.391017] clocksource: Switched to clocksource mxc_timer1
>> [    0.763351] VFS: Disk quotas dquot_6.6.0
>> [    0.763583] VFS: Dquot-cache hash table entries: 1024 (order 0, 
>> 4096
>> bytes)
>> [    0.800699] NET: Registered protocol family 2
>> [    0.801465] IP idents hash table entries: 16384 (order: 5, 131072
>> bytes, linear)
>> [    0.805081] tcp_listen_portaddr_hash hash table entries: 512 
>> (order:
>> 2, 22528 bytes, linear)
>> [    0.805228] TCP established hash table entries: 8192 (order: 3,
>> 32768 bytes, linear)
>> [    0.805411] TCP bind hash table entries: 8192 (order: 6, 327680
>> bytes, linear)
>> [    0.806559] TCP: Hash tables configured (established 8192 bind 
>> 8192)
>> [    0.807250] UDP hash table entries: 512 (order: 3, 49152 bytes,
>> linear)
>> [    0.807475] UDP-Lite hash table entries: 512 (order: 3, 49152 
>> bytes,
>> linear)
>> [    0.808140] NET: Registered protocol family 1
>> [    0.811976] RPC: Registered named UNIX socket transport module.
>> [    0.812100] RPC: Registered udp transport module.
>> [    0.812129] RPC: Registered tcp transport module.
>> [    0.812155] RPC: Registered tcp NFSv4.1 backchannel transport
>> module.
>> [    0.814412] PCI: CLS 0 bytes, default 64
>> [    0.815722] armv7-pmu pmu: hw perfevents: no interrupt-affinity
>> property, guessing.
>> [    1.395389] hw perfevents: enabled with armv7_cortex_a9 PMU driver,
>> 7 counters available
>> [    1.401550] Initialise system trusted keyrings
>> [    1.402567] workingset: timestamp_bits=30 max_order=18
>> bucket_order=0
>> [    1.431576] NFS: Registering the id_resolver key type
>> [    1.431773] Key type id_resolver registered
>> [    1.431892] Key type id_legacy registered
>> [    1.432131] jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
>> [    1.434360] fuse: init (API version 7.34)
>> [    1.538869] Key type asymmetric registered
>> [    1.539043] Asymmetric key parser 'x509' registered
>> [    1.539425] bounce: pool size: 64 pages
>> [    1.539666] io scheduler mq-deadline registered
>> [    1.539706] io scheduler kyber registered
>> [    1.546350] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000
>> ranges:
>> [    1.546683] imx6q-pcie 1ffc000.pcie:       IO
>> 0x0001f80000..0x0001f8ffff -> 0x0000000000
>> [    1.546998] imx6q-pcie 1ffc000.pcie:      MEM
>> 0x0001000000..0x0001efffff -> 0x0001000000
>> [    1.561233] imx-sdma 20ec000.sdma: Direct firmware load for
>> imx/sdma/sdma-imx6q.bin failed with error -2
>> [    1.561380] imx-sdma 20ec000.sdma: Falling back to sysfs fallback
>> for: imx/sdma/sdma-imx6q.bin
>> [    1.576583] pfuze100-regulator 1-0008: Full layer: 2, Metal layer: 
>> 1
>> [    1.577276] pfuze100-regulator 1-0008: FAB: 0, FIN: 0
>> [    1.577316] pfuze100-regulator 1-0008: pfuze100 found.
>> [    1.608012] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq = 72,
>> base_baud = 5000000) is a IMX
>> [    1.662256] imx6q-pcie 1ffc000.pcie: iATU unroll: disabled
>> [    1.662287] imx6q-pcie 1ffc000.pcie: Detected iATU regions: 4
>> outbound, 4 inbound
>> [    1.962914] imx6q-pcie 1ffc000.pcie: Link up
>> [    2.061645] imx6q-pcie 1ffc000.pcie: Link up
>> [    2.061667] imx6q-pcie 1ffc000.pcie: Link up, Gen2
>> [    2.061687] imx6q-pcie 1ffc000.pcie: Link up
>> [    2.062985] imx6q-pcie 1ffc000.pcie: PCI host bridge to bus 0000:00
>> [    2.063019] pci_bus 0000:00: root bus resource [bus 00-ff]
>> [    2.063044] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
>> [    2.063067] pci_bus 0000:00: root bus resource [mem 0x01000000-
>> 0x01efffff]
>> [    2.063496] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
>> [    2.063572] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
>> [    2.063637] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff
>> pref]
>> [    2.063745] pci 0000:00:00.0: Limiting cfg_size to 512
>> [    2.064120] pci 0000:00:00.0: supports D1
>> [    2.064138] pci 0000:00:00.0: PME# supported from D0 D1 D3hot 
>> D3cold
>> [    2.068753] PCI: bus0: Fast back to back transfers disabled
>> [    2.069419] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
>> [    2.069550] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff
>> 64bit]
>> [    2.069633] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff
>> 64bit]
>> [    2.070265] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
>> [    2.070437] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
>> limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 31.506
>> Gb/s with 16.0 GT/s PCIe x2 link)
>> [    2.074462] PCI: bus1: Fast back to back transfers disabled
>> [    2.076179] printk: console [ttymxc3] enabled
>> [    2.079173] pci 0000:00:00.0: BAR 0: assigned [mem 0x01000000-
>> 0x010fffff]
>> [    2.702298] pci 0000:00:00.0: BAR 8: assigned [mem 0x01100000-
>> 0x011fffff]
>> [    2.709133] pci 0000:00:00.0: BAR 6: assigned [mem 0x01200000-
>> 0x0120ffff pref]
>> [    2.716589] pci 0000:01:00.0: BAR 0: assigned [mem 0x01100000-
>> 0x01100fff 64bit]
>> [    2.724097] pci 0000:01:00.0: BAR 2: assigned [mem 0x01101000-
>> 0x01101fff 64bit]
>> [    2.725446] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
>> [    2.731578] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
>> [    2.738177] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
>> [    2.742511] pci 0000:00:00.0:   bridge window [mem 0x01100000-
>> 0x011fffff]
>> [    2.748092] etnaviv-gpu 130000.gpu: model: GC880, revision: 5106
>> [    2.755855] mhi-pci-generic 0000:01:00.0: MHI PCI device found:
>> qcom-sdx55m
>> [    2.768315] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
>> 0x01100000-0x01100fff 64bit]
>> [    2.769015] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
>> [    2.776912] mhi-pci-generic 0000:01:00.0: enabling device (0140 ->
>> 0142)
>> [    2.786483] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on
>> minor 0
>> [    2.801751] mhi mhi0: Requested to power ON
>> [    2.808489] mhi mhi0: Power on setup success
>> [    2.810346] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
>> ipu_crtc_ops)
>> [    2.821931] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
>> ipu_crtc_ops)
>> [    2.831489] [drm] Initialized imx-drm 1.0.0 20120507 for display-
>> subsystem on minor 1
>> [    2.839891] imx-ipuv3 2400000.ipu: IPUv3H probed
>> [    2.891577] brd: module loaded
>> [    2.939853] loop: module loaded
>> [    2.951691] spi@0 enforce active low on chipselect handle
>> [    2.957268] spi@1 enforce active low on chipselect handle
>> [    2.972776] spi@0 enforce active low on chipselect handle
>> [    2.978398] spi@1 enforce active low on chipselect handle
>> [    2.994315] libphy: Fixed MDIO Bus: probed
>> [    3.000604] CAN device driver interface
>> [    3.010081] pps pps0: new PPS source ptp0
>> [    3.028687] libphy: fec_enet_mii_bus: probed
>> [    3.036072] fec 2188000.ethernet eth0: registered PHC device 0
>> [    3.044184] PPP generic driver version 2.4.2
>> [    3.049501] PPP BSD Compression module registered
>> [    3.054353] PPP Deflate Compression module registered
>> [    3.059991] usbcore: registered new interface driver r8152
>> [    3.065701] usbcore: registered new interface driver lan78xx
>> [    3.071583] usbcore: registered new interface driver cdc_ether
>> [    3.077562] usbcore: registered new interface driver cdc_eem
>> [    3.083500] usbcore: registered new interface driver smsc95xx
>> [    3.089413] usbcore: registered new interface driver net1080
>> [    3.095293] usbcore: registered new interface driver cdc_subset
>> [    3.101424] usbcore: registered new interface driver zaurus
>> [    3.107144] usbcore: registered new interface driver MOSCHIP usb-
>> ethernet driver
>> [    3.114840] usbcore: registered new interface driver sierra_net
>> [    3.121028] usbcore: registered new interface driver cdc_ncm
>> [    3.126862] usbcore: registered new interface driver qmi_wwan
>> [    3.132835] usbcore: registered new interface driver cdc_mbim
>> [    3.138607] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)
>> Driver
>> [    3.145209] ehci-pci: EHCI PCI platform driver
>> [    3.149951] usbcore: registered new interface driver cdc_wdm
>> [    3.155907] usbcore: registered new interface driver usb-storage
>> [    3.162458] usbcore: registered new interface driver
>> usbserial_generic
>> [    3.169462] usbserial: USB Serial support registered for generic
>> [    3.175898] usbcore: registered new interface driver ftdi_sio
>> [    3.181889] usbserial: USB Serial support registered for FTDI USB
>> Serial Device
>> [    3.189345] usbcore: registered new interface driver option
>> [    3.195086] usbserial: USB Serial support registered for GSM modem
>> (1-port)
>> [    3.202258] usbcore: registered new interface driver qcserial
>> [    3.208119] usbserial: USB Serial support registered for Qualcomm
>> USB modem
>> [    3.233880] snvs_rtc 20cc000.snvs:snvs-rtc-lp: registered as rtc0
>> [    3.240101] snvs_rtc 20cc000.snvs:snvs-rtc-lp: setting system clock
>> to 1970-01-01T00:00:00 UTC (0)
>> [    3.249753] i2c /dev entries driver
>> [    3.268851] sdhci: Secure Digital Host Controller Interface driver
>> [    3.275192] sdhci: Copyright(c) Pierre Ossman
>> [    3.279581] sdhci-pltfm: SDHCI platform and OF driver helper
>> [    3.289992] caam 2100000.crypto: Entropy delay = 3200
>> [    3.331171] mmc1: SDHCI controller on 2194000.mmc [2194000.mmc]
>> using ADMA
>> [    3.338991] mmc2: SDHCI controller on 2198000.mmc [2198000.mmc]
>> using ADMA
>> [    3.356018] caam 2100000.crypto: Instantiated RNG4 SH0
>> [    3.416778] caam 2100000.crypto: Instantiated RNG4 SH1
>> [    3.422116] caam 2100000.crypto: device ID = 0x0a16010000000100 
>> (Era
>> 4)
>> [    3.428768] caam 2100000.crypto: job rings = 2, qi = 0
>> [    3.453774] mmc3: SDHCI controller on 219c000.mmc [219c000.mmc]
>> using ADMA
>> [    3.462624] mmc2: new DDR MMC card at address 0001
>> [    3.473278] mmcblk2: mmc2:0001 00016G 14.6 GiB
>> [    3.480232] mmcblk2boot0: mmc2:0001 00016G 4.00 MiB
>> [    3.481917] caam algorithms registered in /proc/crypto
>> [    3.487898] mmcblk2boot1: mmc2:0001 00016G 4.00 MiB
>> [    3.498687] caam 2100000.crypto: registering rng-caam
>> [    3.499061] mmcblk2rpmb: mmc2:0001 00016G 4.00 MiB, chardev (244:0)
>> [    3.524714] usbcore: registered new interface driver usbhid
>> [    3.530329] usbhid: USB HID core driver
>> [    3.543229] Initializing XFRM netlink socket
>> [    3.549810] NET: Registered protocol family 10
>> [    3.551444] mmc3: new DDR MMC card at address 0001
>> [    3.563454] Segment Routing with IPv6
>> [    3.568381] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>> [    3.572261] mmcblk3: mmc3:0001 E0004G 3.64 GiB
>> [    3.577406] NET: Registered protocol family 17
>> [    3.579848] mmcblk3boot0: mmc3:0001 E0004G 4.00 MiB
>> [    3.583595] NET: Registered protocol family 15
>> [    3.589477] mmcblk3boot1: mmc3:0001 E0004G 4.00 MiB
>> [    3.593057] can: controller area network core
>> [    3.593470] NET: Registered protocol family 29
>> [    3.603122] mmcblk3rpmb: mmc3:0001 E0004G 4.00 MiB, chardev (244:1)
>> [    3.607179] can: raw protocol
>> [    3.617067] can: broadcast manager protocol
>> [    3.621569] can: netlink gateway - max_hops=1
>> [    3.624307]  mmcblk3: p1 p2
>> [    3.626619] Key type dns_resolver registered
>> [    3.633579] random: fast init done
>> [    3.643820] Registering SWP/SWPB emulation handler
>> [    3.649438] Loading compiled-in X.509 certificates
>> [    3.748476] random: crng init done
>> [    3.821484] vddarm: supplied by SW1AB
>> [    3.828699] vddsoc: supplied by SW1C
>> [    4.431354] mhi mhi0: Wait for device to enter SBL or Mission mode
>> [    4.453212] mxs_phy 20c9000.usbphy: Data pin can't make good
>> contact.
>> [    4.469544] ci_hdrc ci_hdrc.1: EHCI Host Controller
>> [    4.475134] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus
>> number 1
>> [    4.511146] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
>> [    4.518600] usb usb1: New USB device found, idVendor=1d6b,
>> idProduct=0002, bcdDevice= 5.13
>> [    4.527211] usb usb1: New USB device strings: Mfr=3, Product=2,
>> SerialNumber=1
>> [    4.534557] usb usb1: Product: EHCI Host Controller
>> [    4.539469] usb usb1: Manufacturer: Linux 5.13.6 ehci_hcd
>> [    4.544979] usb usb1: SerialNumber: ci_hdrc.1
>> [    4.556250] hub 1-0:1.0: USB hub found
>> [    4.560622] hub 1-0:1.0: 1 port detected
>> [    4.590745] imx_thermal 20c8000.anatop:tempmon: Industrial CPU
>> temperature grade - max:105C critical:100C passive:95C
>> [    4.861299] usb 1-1: new high-speed USB device number 2 using
>> ci_hdrc
>> [    5.064624] usb 1-1: New USB device found, idVendor=04b4,
>> idProduct=bd30, bcdDevice= 1.00
>> [    5.073441] usb 1-1: New USB device strings: Mfr=0, Product=0,
>> SerialNumber=0
>> [    5.087382] hub 1-1:1.0: USB hub found
>> [    5.091740] hub 1-1:1.0: 2 ports detected
>> [    5.511390] usb 1-1.1: new high-speed USB device number 3 using
>> ci_hdrc
>> [    5.664449] usb 1-1.1: New USB device found, idVendor=04b4,
>> idProduct=bd29, bcdDevice= 0.01
>> [    5.673182] usb 1-1.1: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=3
>> [    5.680706] usb 1-1.1: Product: Remote Download Wireless Adapter
>> [    5.687033] usb 1-1.1: Manufacturer: Cypress Semiconductor Corp.
>> [    5.693268] usb 1-1.1: SerialNumber: 000000000001
>> [    5.801394] usb 1-1.2: new high-speed USB device number 4 using
>> ci_hdrc
>> [    5.955345] usb 1-1.2: New USB device found, idVendor=04b4,
>> idProduct=640c, bcdDevice= 1.12
>> [    5.964169] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=3
>> [    5.971823] usb 1-1.2: Product: BCM2045A0
>> [    5.975900] usb 1-1.2: Manufacturer: Cypress Semiconductor Corp.
>> [    5.982131] usb 1-1.2: SerialNumber: C0EE408051DF
>> [   11.355278] mhi-pci-generic 0000:01:00.0: failed to power up MHI
>> controller
>> [   11.388118] mhi-pci-generic: probe of 0000:01:00.0 failed with 
>> error
>> -110
> 
> Did you build MHI as builtin? maybe it's just a timeout issue, would
> you be able to increase the timeout_ms value of the
> mhi_controller_config in pci_generic from 8000ms to something like
> 20000ms, just to be sure, I saw some modems taking a long to boot...
> 
> Regards,
> Loic

As Loic suggested, I would just increase the timeout to 30 or 60 seconds 
to
be sure.

You could also monitor changes in debugfs which can tell you what the
registers read and get states at an interval of every second if you'd 
like.

watch -n 1 cat /sys/kernel/debug/mhi/mhi0/states
watch -n 1 cat /sys/kernel/debug/mhi/mhi0/regdump

You could start this after you load the kernel module to get most out of
the debug rather than building as Y, just build as M as Loic suggested.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
