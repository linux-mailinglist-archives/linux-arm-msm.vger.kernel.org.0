Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662AF3E0F42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 09:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbhHEHdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 03:33:37 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41865 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbhHEHdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 03:33:36 -0400
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0CB161C0010;
        Thu,  5 Aug 2021 07:33:20 +0000 (UTC)
Message-ID: <639726f6d1b4d72b0411d88aade8c3f6d6adc0de.camel@bootlin.com>
Subject: Re: MHI driver issue with Sierra Wireless AirPrime EM919X
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Thu, 05 Aug 2021 09:33:20 +0200
In-Reply-To: <8d913179b1ec02ec20f1eece830743f1f0ffc793.camel@bootlin.com>
References: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
         <CAMZdPi-qydatnYYLPY9pZ_4XNZOKB+GBVw2M5rqD1WuVEQLwOg@mail.gmail.com>
         <4a9b0d64f1d7ead1f183b2ad0af32379e64d9b82.camel@bootlin.com>
         <CAMZdPi-22FjHwUqQ-K2huaHV_9zDrZShi74w7LCUiMjf-Ss_OQ@mail.gmail.com>
         <680ccb5730cc1724bbadb2b21638b696@codeaurora.org>
         <a7ff4a6e65d12b35719831bdf50ce1e9ae21027b.camel@bootlin.com>
         <CAMZdPi_+j9jDhZH7CTHWV5Hzw0X+=OCwz9F7doZpF8VH1nSHtg@mail.gmail.com>
         <8d913179b1ec02ec20f1eece830743f1f0ffc793.camel@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-xQVu4pK8Txc7A5gpp5K5"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-xQVu4pK8Txc7A5gpp5K5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Moreover, it seems there is an issue between the rx_lock and pm_lock
locks, see below:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.13.6 (oe-user@oe-host) (arm-oe-linux-
gnueabi-gcc (GCC) 9.2.0, GNU ld (GNU Binutils) 2.32.0.20190204) #1 SMP
Wed Aug 4 12:39:25 UTC 2021
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7),
cr=3D10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Serma i.MX6 Duallite module on
TARGET Board
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 64 MiB at 0x4c000000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
[    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000010000000-
0x000000004fffffff]
[    0.000000] On node 0 totalpages: 262144
[    0.000000]   Normal zone: 1536 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 196608 pages, LIFO batch:63
[    0.000000]   HighMem zone: 65536 pages, LIFO batch:15
[    0.000000] percpu: Embedded 20 pages/cpu s51308 r8192 d22420 u81920
[    0.000000] pcpu-alloc: s51308 r8192 d22420 u81920 alloc=3D20*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
260608
[    0.000000] Kernel command line: console=3Dttymxc3,115200n8 loglevel=3D8
root=3D/dev/nfs ip=3D10.0.0.2:255.255.255.0
nfsroot=3D10.0.0.1:/var/lib/nfsboot,v4,tcp
[    0.000000] Dentry cache hash table entries: 131072 (order: 7,
524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 946768K/1048576K available (12288K kernel code,
1893K rwdata, 4056K rodata, 1024K init, 6620K bss, 36272K reserved,
65536K cma-reserved, 196608K highmem)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,
Nodes=3D1
[    0.000000] trace event string verifier disabled
[    0.000000] Running RCU self tests
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU lockdep checking is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D4 to
nr_cpu_ids=3D2.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
nr_cpu_ids=3D2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] L2C-310 erratum 769419 enabled
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9
[    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
[    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode
enabled
[    0.000000] L2C-310 cache controller enabled, 16 ways, 512 kB
[    0.000000] L2C-310: CACHE_ID 0x410000c8, AUX_CTRL 0x76450001
[    0.000000] random: get_random_bytes called from
start_kernel+0x364/0x58c with crng_init=3D0
[    0.000000] Switching to timer-based delay loop, resolution 333ns
[    0.000001] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps
every 715827882841ns
[    0.000034] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 637086815595 ns
[    0.001635] Console: colour dummy device 80x30
[    0.001696] Lock dependency validator: Copyright (c) 2006 Red Hat,
Inc., Ingo Molnar
[    0.001720] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.001738] ... MAX_LOCK_DEPTH:          48
[    0.001762] ... MAX_LOCKDEP_KEYS:        8192
[    0.001779] ... CLASSHASH_SIZE:          4096
[    0.001796] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.001815] ... MAX_LOCKDEP_CHAINS:      65536
[    0.001833] ... CHAINHASH_SIZE:          32768
[    0.001851]  memory used by lock dependency info: 4061 kB
[    0.001870]  memory used for stack traces: 2112 kB
[    0.001887]  per task-struct memory footprint: 1536 bytes
[    0.002021] Calibrating delay loop (skipped), value calculated using
timer frequency.. 6.00 BogoMIPS (lpj=3D30000)
[    0.002062] pid_max: default: 32768 minimum: 301
[    0.002377] Mount-cache hash table entries: 2048 (order: 1, 8192
bytes, linear)
[    0.002426] Mountpoint-cache hash table entries: 2048 (order: 1,
8192 bytes, linear)
[    0.006368] CPU: Testing write buffer coherency: ok
[    0.006548] CPU0: Spectre v2: using BPIALL workaround
[    0.007626] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.011092] Setting up static identity map for 0x10100000 -
0x10100078
[    0.011918] rcu: Hierarchical SRCU implementation.
[    0.013924] smp: Bringing up secondary CPUs ...
[    0.017376] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.017401] CPU1: Spectre v2: using BPIALL workaround
[    0.018719] smp: Brought up 1 node, 2 CPUs
[    0.018762] SMP: Total of 2 processors activated (12.00 BogoMIPS).
[    0.018794] CPU: All CPU(s) started in SVC mode.
[    0.022118] devtmpfs: initialized
[    0.062887] VFP support v0.3: implementor 41 architecture 3 part 30
variant 9 rev 4
[    0.065268] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.065362] futex hash table entries: 512 (order: 3, 32768 bytes,
linear)
[    0.069362] pinctrl core: initialized pinctrl subsystem
[    0.075413] NET: Registered protocol family 16
[    0.103227] DMA: preallocated 256 KiB pool for atomic coherent
allocations
[    0.108970] thermal_sys: Registered thermal governor 'step_wise'
[    0.109610] cpuidle: using governor menu
[    0.109793] NET: Registered protocol family 42
[    0.110540] CPU identified as i.MX6DL, silicon rev 1.3
[    0.155064] vdd1p1: supplied by regulator-dummy
[    0.157782] vdd3p0: supplied by regulator-dummy
[    0.159903] vdd2p5: supplied by regulator-dummy
[    0.163009] vddpu: supplied by regulator-dummy
[    0.196381] platform 2400000.ipu: Fixing up cyclic dependency with
20e0000.iomuxc-gpr:ipu1_csi1_mux
[    0.196822] platform 2400000.ipu: Fixing up cyclic dependency with
20e0000.iomuxc-gpr:ipu1_csi0_mux
[    0.206312] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
watchpoint registers.
[    0.206435] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.208022] debugfs: Directory 'dummy-iomuxc-gpr@20e0000' with
parent 'regmap' already present!
[    0.209615] imx6dl-pinctrl 20e0000.pinctrl: initialized IMX pinctrl
driver
[    0.321463] mxs-dma 110000.dma-apbh: initialized
[    0.345734] vgaarb: loaded
[    0.348280] SCSI subsystem initialized
[    0.349090] libata version 3.00 loaded.
[    0.350440] usbcore: registered new interface driver usbfs
[    0.350750] usbcore: registered new interface driver hub
[    0.350940] usbcore: registered new device driver usb
[    0.351521] usb_phy_generic usbphynop1: supply vcc not found, using
dummy regulator
[    0.352762] usb_phy_generic usbphynop2: supply vcc not found, using
dummy regulator
[    0.358219] i2c i2c-1: IMX I2C adapter registered
[    0.359174] pps_core: LinuxPPS API ver. 1 registered
[    0.359206] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.359289] PTP clock support registered
[    0.363205] Bluetooth: Core ver 2.22
[    0.363372] NET: Registered protocol family 31
[    0.363400] Bluetooth: HCI device and connection manager initialized
[    0.363561] Bluetooth: HCI socket layer initialized
[    0.363610] Bluetooth: L2CAP socket layer initialized
[    0.363842] Bluetooth: SCO socket layer initialized
[    0.367356] clocksource: Switched to clocksource mxc_timer1
[    1.009407] VFS: Disk quotas dquot_6.6.0
[    1.009626] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096
bytes)
[    1.038879] NET: Registered protocol family 2
[    1.039511] IP idents hash table entries: 16384 (order: 5, 131072
bytes, linear)
[    1.043205] tcp_listen_portaddr_hash hash table entries: 512 (order:
2, 22528 bytes, linear)
[    1.043350] TCP established hash table entries: 8192 (order: 3,
32768 bytes, linear)
[    1.043532] TCP bind hash table entries: 8192 (order: 6, 327680
bytes, linear)
[    1.044679] TCP: Hash tables configured (established 8192 bind 8192)
[    1.045375] UDP hash table entries: 512 (order: 3, 49152 bytes,
linear)
[    1.045604] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes,
linear)
[    1.046264] NET: Registered protocol family 1
[    1.049920] RPC: Registered named UNIX socket transport module.
[    1.050043] RPC: Registered udp transport module.
[    1.050077] RPC: Registered tcp transport module.
[    1.050102] RPC: Registered tcp NFSv4.1 backchannel transport
module.
[    1.052197] PCI: CLS 0 bytes, default 64
[    1.053508] armv7-pmu pmu: hw perfevents: no interrupt-affinity
property, guessing.
[    1.358621] hw perfevents: enabled with armv7_cortex_a9 PMU driver,
7 counters available
[    1.363318] Initialise system trusted keyrings
[    1.364270] workingset: timestamp_bits=3D30 max_order=3D18
bucket_order=3D0
[    1.393476] NFS: Registering the id_resolver key type
[    1.393668] Key type id_resolver registered
[    1.393790] Key type id_legacy registered
[    1.394023] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
[    1.396110] fuse: init (API version 7.34)
[    1.498473] Key type asymmetric registered
[    1.498644] Asymmetric key parser 'x509' registered
[    1.499014] bounce: pool size: 64 pages
[    1.499255] io scheduler mq-deadline registered
[    1.499295] io scheduler kyber registered
[    1.505396] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000
ranges:
[    1.505730] imx6q-pcie 1ffc000.pcie:       IO
0x0001f80000..0x0001f8ffff -> 0x0000000000
[    1.506037] imx6q-pcie 1ffc000.pcie:      MEM
0x0001000000..0x0001efffff -> 0x0001000000
[    1.517588] imx-sdma 20ec000.sdma: Direct firmware load for
imx/sdma/sdma-imx6q.bin failed with error -2
[    1.517730] imx-sdma 20ec000.sdma: Falling back to sysfs fallback
for: imx/sdma/sdma-imx6q.bin
[    1.533188] pfuze100-regulator 1-0008: Full layer: 2, Metal layer: 1
[    1.533853] pfuze100-regulator 1-0008: FAB: 0, FIN: 0
[    1.533892] pfuze100-regulator 1-0008: pfuze100 found.
[    1.562035] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq =3D 72,
base_baud =3D 5000000) is a IMX
[    1.627448] imx6q-pcie 1ffc000.pcie: iATU unroll: disabled
[    1.628969] printk: console [ttymxc3] enabled
[    1.632824] imx6q-pcie 1ffc000.pcie: Detected iATU regions: 4
outbound, 4 inbound
[    2.512050] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    2.518850] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    2.524480] etnaviv-gpu 130000.gpu: model: GC880, revision: 5106
[    2.531625] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    2.541006] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on
minor 0
[    2.558680] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
ipu_crtc_ops)
[    2.566741] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
ipu_crtc_ops)
[    2.576253] [drm] Initialized imx-drm 1.0.0 20120507 for display-
subsystem on minor 1
[    2.584747] imx-ipuv3 2400000.ipu: IPUv3H probed
[    2.607359] imx6q-pcie 1ffc000.pcie: Link up
[    2.632037] brd: module loaded
[    2.678367] loop: module loaded
[    2.689953] spi@0 enforce active low on chipselect handle
[    2.695527] spi@1 enforce active low on chipselect handle
[    2.709359] spi@0 enforce active low on chipselect handle
[    2.711787] imx6q-pcie 1ffc000.pcie: Link up
[    2.714926] spi@1 enforce active low on chipselect handle
[    2.719173] imx6q-pcie 1ffc000.pcie: Link up, Gen2
[    2.729458] imx6q-pcie 1ffc000.pcie: Link up
[    2.734868] imx6q-pcie 1ffc000.pcie: PCI host bridge to bus 0000:00
[    2.737535] libphy: Fixed MDIO Bus: probed
[    2.741283] pci_bus 0000:00: root bus resource [bus 00-ff]
[    2.747421] CAN device driver interface
[    2.750865] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    2.760087] pps pps0: new PPS source ptp0
[    2.760917] pci_bus 0000:00: root bus resource [mem 0x01000000-
0x01efffff]
[    2.772586] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
[    2.778871] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
[    2.785217] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff
pref]
[    2.792112] pci 0000:00:00.0: Limiting cfg_size to 512
[    2.797809] pci 0000:00:00.0: supports D1
[    2.801869] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
[    2.808830] libphy: fec_enet_mii_bus: probed
[    2.812851] PCI: bus0: Fast back to back transfers disabled
[    2.815108] fec 2188000.ethernet eth0: registered PHC device 0
[    2.819427] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
[    2.826937] PPP generic driver version 2.4.2
[    2.831159] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff
64bit]
[    2.836181] PPP BSD Compression module registered
[    2.842327] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff
64bit]
[    2.846923] PPP Deflate Compression module registered
[    2.854484] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    2.859311] usbcore: registered new interface driver r8152
[    2.865240] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 31.506
Gb/s with 16.0 GT/s PCIe x2 link)
[    2.870747] usbcore: registered new interface driver lan78xx
[    2.889621] PCI: bus1: Fast back to back transfers disabled
[    2.891726] usbcore: registered new interface driver cdc_ether
[    2.897033] pci 0000:00:00.0: BAR 0: assigned [mem 0x01000000-
0x010fffff]
[    2.903002] usbcore: registered new interface driver cdc_eem
[    2.909799] pci 0000:00:00.0: BAR 8: assigned [mem 0x01100000-
0x011fffff]
[    2.915622] usbcore: registered new interface driver smsc95xx
[    2.922300] pci 0000:00:00.0: BAR 6: assigned [mem 0x01200000-
0x0120ffff pref]
[    2.922345] pci 0000:01:00.0: BAR 0: assigned [mem 0x01100000-
0x01100fff 64bit]
[    2.928342] usbcore: registered new interface driver net1080
[    2.935440] pci 0000:01:00.0: BAR 2: assigned [mem 0x01101000-
0x01101fff 64bit]
[    2.942868] usbcore: registered new interface driver cdc_subset
[    2.948543] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    2.955953] usbcore: registered new interface driver zaurus
[    2.961857] pci 0000:00:00.0:   bridge window [mem 0x01100000-
0x011fffff]
[    2.967325] usbcore: registered new interface driver MOSCHIP usb-
ethernet driver
[    2.987458] usbcore: registered new interface driver sierra_net
[    2.993605] usbcore: registered new interface driver cdc_ncm
[    2.999648] usbcore: registered new interface driver qmi_wwan
[    3.005553] usbcore: registered new interface driver cdc_mbim
[    3.011447] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)
Driver
[    3.018125] ehci-pci: EHCI PCI platform driver
[    3.023155] usbcore: registered new interface driver cdc_wdm
[    3.029146] usbcore: registered new interface driver usb-storage
[    3.035516] usbcore: registered new interface driver
usbserial_generic
[    3.043055] usbserial: USB Serial support registered for generic
[    3.049456] usbcore: registered new interface driver ftdi_sio
[    3.055322] usbserial: USB Serial support registered for FTDI USB
Serial Device
[    3.062845] usbcore: registered new interface driver option
[    3.068648] usbserial: USB Serial support registered for GSM modem
(1-port)
[    3.075748] usbcore: registered new interface driver qcserial
[    3.081677] usbserial: USB Serial support registered for Qualcomm
USB modem
[    3.105095] snvs_rtc 20cc000.snvs:snvs-rtc-lp: registered as rtc0
[    3.111413] snvs_rtc 20cc000.snvs:snvs-rtc-lp: setting system clock
to 1970-01-01T00:00:00 UTC (0)
[    3.120977] i2c /dev entries driver
[    3.139495] sdhci: Secure Digital Host Controller Interface driver
[    3.145712] sdhci: Copyright(c) Pierre Ossman
[    3.150178] sdhci-pltfm: SDHCI platform and OF driver helper
[    3.163141] caam 2100000.crypto: Entropy delay =3D 3200
[    3.229113] caam 2100000.crypto: Instantiated RNG4 SH0
[    3.268077] mmc2: SDHCI controller on 2198000.mmc [2198000.mmc]
using ADMA
[    3.289872] caam 2100000.crypto: Instantiated RNG4 SH1
[    3.295167] caam 2100000.crypto: device ID =3D 0x0a16010000000100 (Era
4)
[    3.301906] caam 2100000.crypto: job rings =3D 2, qi =3D 0
[    3.330200] mmc3: SDHCI controller on 219c000.mmc [219c000.mmc]
using ADMA
[    3.364339] caam algorithms registered in /proc/crypto
[    3.370274] mmc1: SDHCI controller on 2194000.mmc [2194000.mmc]
using ADMA
[    3.376711] caam 2100000.crypto: registering rng-caam
[    3.390976] usbcore: registered new interface driver usbhid
[    3.396640] usbhid: USB HID core driver
[    3.401529] mmc2: new DDR MMC card at address 0001
[    3.409123] Initializing XFRM netlink socket
[    3.416054] mmcblk2: mmc2:0001 00016G 14.6 GiB=20
[    3.416086] NET: Registered protocol family 10
[    3.427610] mmcblk2boot0: mmc2:0001 00016G 4.00 MiB=20
[    3.431269] Segment Routing with IPv6
[    3.433898] mmcblk2boot1: mmc2:0001 00016G 4.00 MiB=20
[    3.437126] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    3.448528] mmcblk2rpmb: mmc2:0001 00016G 4.00 MiB, chardev (244:0)
[    3.451029] NET: Registered protocol family 17
[    3.460162] NET: Registered protocol family 15
[    3.464696] can: controller area network core
[    3.470190] mmc3: new DDR MMC card at address 0001
[    3.476039] NET: Registered protocol family 29
[    3.480723] can: raw protocol
[    3.484824] mmcblk3: mmc3:0001 E0004G 3.64 GiB=20
[    3.489908] can: broadcast manager protocol
[    3.494201] can: netlink gateway - max_hops=3D1
[    3.499758] mmcblk3boot0: mmc3:0001 E0004G 4.00 MiB=20
[    3.505507] random: fast init done
[    3.505810] mmcblk3boot1: mmc3:0001 E0004G 4.00 MiB=20
[    3.514778] Key type dns_resolver registered
[    3.524454] Registering SWP/SWPB emulation handler
[    3.530215] mmcblk3rpmb: mmc3:0001 E0004G 4.00 MiB, chardev (244:1)
[    3.539279] Loading compiled-in X.509 certificates
[    3.549746]  mmcblk3: p1 p2
[    3.627818] random: crng init done
[    3.720478] vddarm: supplied by SW1AB
[    3.727503] vddsoc: supplied by SW1C
[    4.349523] mxs_phy 20c9000.usbphy: Data pin can't make good
contact.
[    4.364623] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    4.370185] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus
number 1
[    4.407486] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    4.414851] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 5.13
[    4.423458] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    4.430798] usb usb1: Product: EHCI Host Controller
[    4.435708] usb usb1: Manufacturer: Linux 5.13.6 ehci_hcd
[    4.441210] usb usb1: SerialNumber: ci_hdrc.1
[    4.450386] hub 1-0:1.0: USB hub found
[    4.454604] hub 1-0:1.0: 1 port detected
[    4.479808] imx_thermal 20c8000.anatop:tempmon: Industrial CPU
temperature grade - max:105C critical:100C passive:95C
[    4.582733] Micrel KSZ9031 Gigabit PHY 2188000.ethernet-1:00:
attached PHY driver (mii_bus:phy_addr=3D2188000.ethernet-1:00, irq=3DPOLL)
[    4.747657] usb 1-1: new high-speed USB device number 2 using
ci_hdrc
[    4.950489] usb 1-1: New USB device found, idVendor=3D04b4,
idProduct=3Dbd30, bcdDevice=3D 1.00
[    4.959387] usb 1-1: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D0
[    4.971767] hub 1-1:1.0: USB hub found
[    4.975996] hub 1-1:1.0: 2 ports detected
[    5.397680] usb 1-1.1: new high-speed USB device number 3 using
ci_hdrc
[    5.550443] usb 1-1.1: New USB device found, idVendor=3D04b4,
idProduct=3Dbd29, bcdDevice=3D 0.01
[    5.559208] usb 1-1.1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[    5.566727] usb 1-1.1: Product: Remote Download Wireless Adapter
[    5.573060] usb 1-1.1: Manufacturer: Cypress Semiconductor Corp.
[    5.579277] usb 1-1.1: SerialNumber: 000000000001
[    5.687726] usb 1-1.2: new high-speed USB device number 4 using
ci_hdrc
[    5.840698] usb 1-1.2: New USB device found, idVendor=3D04b4,
idProduct=3D640c, bcdDevice=3D 1.12
[    5.849332] usb 1-1.2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[    5.856846] usb 1-1.2: Product: BCM2045A0
[    5.861094] usb 1-1.2: Manufacturer: Cypress Semiconductor Corp.
[    5.867165] usb 1-1.2: SerialNumber: C0EE408051DF
[    8.799792] fec 2188000.ethernet eth0: Link is Up - 100Mbps/Full -
flow control rx/tx
[    8.828023] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    8.857618] IP-Config: Guessing netmask 255.0.0.0
[    8.862403] IP-Config: Complete:
[    8.865676]      device=3Deth0, hwaddr=3D00:01:02:03:04:05,
ipaddr=3D10.0.0.2, mask=3D255.0.0.0, gw=3D255.255.255.255
[    8.876261]      host=3D10.0.0.2, domain=3D, nis-domain=3D(none)
[    8.881975]      bootserver=3D255.255.255.0, rootserver=3D10.0.0.1,
rootpath=3D
[    8.888497] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    8.910924] cfg80211: Loaded X.509 cert 'sforshee:
00b28ddf47aef9cea7'
[    8.918939] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[    8.927776] platform regulatory.0: Falling back to sysfs fallback
for: regulatory.db
[    9.014352] VFS: Mounted root (nfs4 filesystem) on device 0:18.
[    9.021901] devtmpfs: mounted
[    9.028430] Freeing unused kernel memory: 1024K
[    9.079029] Run /sbin/init as init process
[    9.083214]   with arguments:
[    9.086226]     /sbin/init
[    9.089351]   with environment:
[    9.092549]     HOME=3D/
[    9.094953]     TERM=3Dlinux
[   10.423144] udevd[193]: starting version 3.2.8
[   10.821462] udevd[194]: starting eudev-3.2.8
[   11.719211] mhi-pci-generic 0000:01:00.0: MHI PCI device found:
qcom-sdx55m
[   11.740529] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x01100000-0x01100fff 64bit]
[   11.766298] mhi-pci-generic 0000:01:00.0: enabling device (0140 ->
0142)
[   11.812237] mhi mhi0: Requested to power ON
[   11.949604] imx-sdma 20ec000.sdma: loaded firmware 3.5
[   12.564272] brcmfmac: brcmf_fw_alloc_request: using
brcm/brcmfmac4373 for chip BCM4373/0
[   12.609085] usbcore: registered new interface driver brcmfmac
[   13.390783] usb 1-1.1: USB disconnect, device number 3
[   13.502287] brcmfmac: brcmf_usb_dl_cmd: usb_submit_urb failed -19
[   13.827589] usb 1-1.1: new high-speed USB device number 5 using
ci_hdrc
[   13.980432] usb 1-1.1: New USB device found, idVendor=3D04b4,
idProduct=3D0bdc, bcdDevice=3D 0.01
[   13.989114] usb 1-1.1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[   13.996630] usb 1-1.1: Product: Cypress USB 802.11 Wireless Adapter
[   14.003184] usb 1-1.1: Manufacturer: Cypress Semiconductor Corp.
[   14.009408] usb 1-1.1: SerialNumber: 000000000001
[   14.025973] brcmfmac: brcmf_fw_alloc_request: using
brcm/brcmfmac4373 for chip BCM4373/0
[   14.044812] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4373/0
wl0: Dec 20 2020 19:46:31 version 13.10.246.247 (fb87df5 CY) FWID 01-
c041ac2e
[   14.330788] mhi mhi0: Power on setup success
[   14.336693] mhi mhi0: Wait for device to enter SBL or Mission mode
[   14.712993] usbcore: registered new interface driver btusb
[   38.522286] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   38.528000] Bluetooth: BNEP socket layer initialized
[   39.520580] usb_otg_vbus: disabling
[   39.524370] SW4: disabling
[   43.430052]=20
[   43.431589] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
[   43.437705] WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order
detected
[   43.444350] 5.13.6 #1 Not tainted
[   43.447687] -----------------------------------------------------
[   43.453796] ModemManager/439 [HC0[0]:SC0[2]:HE1:SE0] is trying to
acquire:
[   43.460703] c329ec44 (&mhiwwan->rx_lock){+.+.}-{2:2}, at:
mhi_wwan_rx_budget_inc+0x14/0x5c [mhi_wwan_ctrl]
[   43.470476]=20
[   43.470476] and this task is already holding:
[   43.476326] c2e8dd60 (&mhi_cntrl->pm_lock){.+--}-{2:2}, at:
mhi_reset_chan+0x58/0x254 [mhi]
[   43.484891] which would create a new lock dependency:
[   43.489959]  (&mhi_cntrl->pm_lock){.+--}-{2:2} -> (&mhiwwan-
>rx_lock){+.+.}-{2:2}
[   43.497538]=20
[   43.497538] but this new dependency connects a SOFTIRQ-irq-safe
lock:
[   43.505473]  (&mhi_cntrl->pm_lock){.+--}-{2:2}
[   43.505510]=20
[   43.505510] ... which became SOFTIRQ-irq-safe at:
[   43.516156]   _raw_write_lock_irq+0x54/0x6c
[   43.520380]   mhi_pm_m0_transition+0x18/0x224 [mhi]
[   43.525381]   mhi_process_ctrl_ev_ring+0xec/0x490 [mhi]
[   43.530716]   mhi_ctrl_ev_task+0x44/0x100 [mhi]
[   43.535352]   tasklet_action_common.constprop.0+0xd4/0xf0
[   43.540790]   __do_softirq+0xec/0x584
[   43.544484]   irq_exit+0x1a4/0x1dc
[   43.547912]   __handle_domain_irq+0x58/0xb4
[   43.552127]   gic_handle_irq+0x78/0x9c
[   43.555913]   __irq_svc+0x70/0x98
[   43.559255]   queue_work_on+0x3c/0x94
[   43.562947]   queue_work_on+0x3c/0x94
[   43.566635]   rpc_execute+0xa4/0x200
[   43.567375] regulator regulator.26: Failed to increase supply
voltage: -ETIMEDOUT
[   43.570243]   rpc_run_task+0x144/0x170
[   43.581495]   nfs4_run_open_task+0xf8/0x1c0
[   43.585715]   nfs4_do_open.constprop.0+0x244/0xbcc
[   43.590538]   nfs4_atomic_open+0x14/0x24
[   43.594487]   nfs4_file_open+0xd8/0x1f4
[   43.598351]   do_dentry_open+0x130/0x3e4
[   43.602312]   path_openat+0xba8/0xe48
[   43.606006]   do_filp_open+0x7c/0xf0
[   43.609610]   do_sys_openat2+0x2d4/0x3b4
[   43.613561]   do_sys_open+0x78/0xcc
[   43.617072]   ret_fast_syscall+0x0/0x2c
[   43.620933]   0xbed72978
[   43.623486]=20
[   43.623486] to a SOFTIRQ-irq-unsafe lock:
[   43.628990]  (&mhiwwan->rx_lock){+.+.}-{2:2}
[   43.629029]=20
[   43.629029] ... which became SOFTIRQ-irq-unsafe at:
[   43.639672] ...
[   43.639682]   _raw_spin_lock+0x40/0x50
[   43.645214]   mhi_wwan_ctrl_refill_work+0x24/0xe4 [mhi_wwan_ctrl]
[   43.651351]   mhi_wwan_ctrl_start+0x54/0x5c [mhi_wwan_ctrl]
[   43.656961]   wwan_port_fops_open+0xa4/0x12c
[   43.661269]   chrdev_open+0xa4/0x1a0
[   43.664880]   do_dentry_open+0x130/0x3e4
[   43.668833]   path_openat+0xba8/0xe48
[   43.672520]   do_filp_open+0x7c/0xf0
[   43.676122]   do_sys_openat2+0x2d4/0x3b4
[   43.680074]   do_sys_open+0x78/0xcc
[   43.683584]   ret_fast_syscall+0x0/0x2c
[   43.687359] cpu cpu0: failed to scale vddarm up: -110
[   43.687445]   0xbe91aba8
[   43.692509] cpufreq: __target_index: Failed to change cpu frequency:
-110
[   43.695042]=20
[   43.695042] other info that might help us debug this:
[   43.695042]=20
[   43.709851]  Possible interrupt unsafe locking scenario:
[   43.709851]=20
[   43.716653]        CPU0                    CPU1
[   43.721197]        ----                    ----
[   43.725739]   lock(&mhiwwan->rx_lock);
[   43.729522]                                local_irq_disable();
[   43.735456]                                lock(&mhi_cntrl-
>pm_lock);
[   43.741932]                                lock(&mhiwwan->rx_lock);
[   43.748230]   <Interrupt>
[   43.750863]     lock(&mhi_cntrl->pm_lock);
[   43.754991]=20
[   43.754991]  *** DEADLOCK ***
[   43.754991]=20
[   43.760925] 3 locks held by ModemManager/439:
[   43.765304]  #0: c2c37848 (&port->ops_lock){+.+.}-{3:3}, at:
wwan_port_fops_release+0x1c/0x68
[   43.773928]  #1: f0a82768 (&mhi_chan->mutex){+.+.}-{3:3}, at:
mhi_unprepare_channel+0x20/0xbc [mhi]
[   43.783185]  #2: c2e8dd60 (&mhi_cntrl->pm_lock){.+--}-{2:2}, at:
mhi_reset_chan+0x58/0x254 [mhi]
[   43.792140]=20
[   43.792140] the dependencies between SOFTIRQ-irq-safe lock and the
holding lock:
[   43.801097] -> (&mhi_cntrl->pm_lock){.+--}-{2:2} {
[   43.805956]    HARDIRQ-ON-R at:
[   43.809125]                     _raw_read_lock_bh+0x54/0x68
[   43.814731]                   =20
mhi_ready_state_transition+0x118/0x288 [mhi]
[   43.821902]                     mhi_fw_load_handler+0x448/0x65c
[mhi]
[   43.828453]                     mhi_pm_st_worker+0x3a4/0xae0 [mhi]
[   43.834739]                     process_one_work+0x2ac/0x7b8
[   43.840429]                     worker_thread+0x30/0x510
[   43.845767]                     kthread+0x154/0x17c
[   43.850684]                     ret_from_fork+0x14/0x38
[   43.855936]                     0x0
[   43.859445]    IN-SOFTIRQ-W at:
[   43.862612]                     _raw_write_lock_irq+0x54/0x6c
[   43.868388]                     mhi_pm_m0_transition+0x18/0x224
[mhi]
[   43.874951]                     mhi_process_ctrl_ev_ring+0xec/0x490
[mhi]
[   43.881846]                     mhi_ctrl_ev_task+0x44/0x100 [mhi]
[   43.888046]                   =20
tasklet_action_common.constprop.0+0xd4/0xf0
[   43.895044]                     __do_softirq+0xec/0x584
[   43.900297]                     irq_exit+0x1a4/0x1dc
[   43.905288]                     __handle_domain_irq+0x58/0xb4
[   43.911064]                     gic_handle_irq+0x78/0x9c
[   43.916409]                     __irq_svc+0x70/0x98
[   43.921312]                     queue_work_on+0x3c/0x94
[   43.926563]                     queue_work_on+0x3c/0x94
[   43.927356] cpu cpu0: failed to scale vddarm up: -110
[   43.931809]                     rpc_execute+0xa4/0x200
[   43.936873] cpufreq: __target_index: Failed to change cpu frequency:
-110
[   43.942012]                     rpc_run_task+0x144/0x170
[   43.942041]                     nfs4_run_open_task+0xf8/0x1c0
[   43.942066]                     nfs4_do_open.constprop.0+0x244/0xbcc
[   43.942091]                     nfs4_atomic_open+0x14/0x24
[   43.971788]                     nfs4_file_open+0xd8/0x1f4
[   43.977216]                     do_dentry_open+0x130/0x3e4
[   43.982740]                     path_openat+0xba8/0xe48
[   43.987997]                     do_filp_open+0x7c/0xf0
[   43.993162]                     do_sys_openat2+0x2d4/0x3b4
[   43.998679]                     do_sys_open+0x78/0xcc
[   44.003754]                     ret_fast_syscall+0x0/0x2c
[   44.009179]                     0xbed72978
[   44.013297]    IN-SOFTIRQ-R at:
[   44.016467]                     _raw_read_lock_bh+0x54/0x68
[   44.022069]                     mhi_pm_m0_transition+0x9c/0x224
[mhi]
[   44.028648]                     mhi_process_ctrl_ev_ring+0xec/0x490
[mhi]
[   44.035545]                     mhi_ctrl_ev_task+0x44/0x100 [mhi]
[   44.041748]                   =20
tasklet_action_common.constprop.0+0xd4/0xf0
[   44.048744]                     __do_softirq+0xec/0x584
[   44.053996]                     irq_exit+0x1a4/0x1dc
[   44.058986]                     __handle_domain_irq+0x58/0xb4
[   44.064762]                     gic_handle_irq+0x78/0x9c
[   44.070105]                     __irq_svc+0x70/0x98
[   44.075007]                     queue_work_on+0x3c/0x94
[   44.080260]                     queue_work_on+0x3c/0x94
[   44.085510]                     rpc_execute+0xa4/0x200
[   44.090684]                     rpc_run_task+0x144/0x170
[   44.096030]                     nfs4_run_open_task+0xf8/0x1c0
[   44.101806]                     nfs4_do_open.constprop.0+0x244/0xbcc
[   44.108189]                     nfs4_atomic_open+0x14/0x24
[   44.113702]                     nfs4_file_open+0xd8/0x1f4
[   44.119128]                     do_dentry_open+0x130/0x3e4
[   44.124647]                     path_openat+0xba8/0xe48
[   44.129900]                     do_filp_open+0x7c/0xf0
[   44.135066]                     do_sys_openat2+0x2d4/0x3b4
[   44.140580]                     do_sys_open+0x78/0xcc
[   44.145654]                     ret_fast_syscall+0x0/0x2c
[   44.151078]                     0xbed72978
[   44.155196]    INITIAL USE at:
[   44.158279]                    _raw_write_lock_irq+0x54/0x6c
[   44.163969]                    mhi_async_power_up+0xb0/0x3a4 [mhi]
[   44.170288]                    mhi_sync_power_up+0x20/0xf58 [mhi]
[   44.176488]                    mhi_pci_probe+0x38c/0x450
[mhi_pci_generic]
[   44.177354] cpu cpu0: failed to scale vddarm up: -110
[   44.183413]                    pci_device_probe+0x9c/0x124
[   44.188545] cpufreq: __target_index: Failed to change cpu frequency:
-110
[   44.193964]                    really_probe+0xec/0x390
[   44.205905]                    device_driver_attach+0x58/0x60
[   44.211681]                    __driver_attach+0x64/0xdc
[   44.217020]                    bus_for_each_dev+0x74/0xbc
[   44.222446]                    bus_add_driver+0x150/0x1dc
[   44.227874]                    driver_register+0x74/0x108
[   44.233300]                    do_one_initcall+0x84/0x3b4
[   44.238730]                    do_init_module+0x5c/0x23c
[   44.244080]                    load_module+0x2268/0x270c
[   44.249422]                    sys_finit_module+0xb4/0xf4
[   44.254850]                    ret_fast_syscall+0x0/0x2c
[   44.260187]                    0xbe8b3898
[   44.264217]    INITIAL READ USE at:
[   44.267732]                         _raw_read_lock_bh+0x54/0x68
[   44.273680]                       =20
mhi_ready_state_transition+0x118/0x288 [mhi]
[   44.281207]                         mhi_fw_load_handler+0x448/0x65c
[mhi]
[   44.288103]                         mhi_pm_st_worker+0x3a4/0xae0
[mhi]
[   44.294736]                         process_one_work+0x2ac/0x7b8
[   44.300775]                         worker_thread+0x30/0x510
[   44.306460]                         kthread+0x154/0x17c
[   44.311720]                         ret_from_fork+0x14/0x38
[   44.317319]                         0x0
[   44.321176]  }
[   44.322854]  ... key      at: [<bf00c388>]
__key.41977+0x0/0xffffcc78 [mhi]
[   44.329940]=20
[   44.329940] the dependencies between the lock to be acquired
[   44.329953]  and SOFTIRQ-irq-unsafe lock:
[   44.341177] -> (&mhiwwan->rx_lock){+.+.}-{2:2} {
[   44.345865]    HARDIRQ-ON-W at:
[   44.349032]                     _raw_spin_lock+0x40/0x50
[   44.354373]                     mhi_wwan_ctrl_refill_work+0x24/0xe4
[mhi_wwan_ctrl]
[   44.362073]                     mhi_wwan_ctrl_start+0x54/0x5c
[mhi_wwan_ctrl]
[   44.369245]                     wwan_port_fops_open+0xa4/0x12c
[   44.375114]                     chrdev_open+0xa4/0x1a0
[   44.380288]                     do_dentry_open+0x130/0x3e4
[   44.385809]                     path_openat+0xba8/0xe48
[   44.391063]                     do_filp_open+0x7c/0xf0
[   44.396228]                     do_sys_openat2+0x2d4/0x3b4
[   44.401743]                     do_sys_open+0x78/0xcc
[   44.406818]                     ret_fast_syscall+0x0/0x2c
[   44.412242]                     0xbe91aba8
[   44.416361]    SOFTIRQ-ON-W at:
[   44.419528]                     _raw_spin_lock+0x40/0x50
[   44.424868]                     mhi_wwan_ctrl_refill_work+0x24/0xe4
[mhi_wwan_ctrl]
[   44.427355] cpu cpu0: failed to scale vddarm up: -110
[   44.432563]                     mhi_wwan_ctrl_start+0x54/0x5c
[mhi_wwan_ctrl]
[   44.437697] cpufreq: __target_index: Failed to change cpu frequency:
-110
[   44.444763]                     wwan_port_fops_open+0xa4/0x12c
[   44.457400]                     chrdev_open+0xa4/0x1a0
[   44.462568]                     do_dentry_open+0x130/0x3e4
[   44.468088]                     path_openat+0xba8/0xe48
[   44.473343]                     do_filp_open+0x7c/0xf0
[   44.478508]                     do_sys_openat2+0x2d4/0x3b4
[   44.484025]                     do_sys_open+0x78/0xcc
[   44.489101]                     ret_fast_syscall+0x0/0x2c
[   44.494524]                     0xbe91aba8
[   44.498642]    INITIAL USE at:
[   44.501721]                    _raw_spin_lock+0x40/0x50
[   44.506975]                    mhi_wwan_ctrl_refill_work+0x24/0xe4
[mhi_wwan_ctrl]
[   44.514583]                    mhi_wwan_ctrl_start+0x54/0x5c
[mhi_wwan_ctrl]
[   44.521667]                    wwan_port_fops_open+0xa4/0x12c
[   44.527445]                    chrdev_open+0xa4/0x1a0
[   44.532526]                    do_dentry_open+0x130/0x3e4
[   44.537956]                    path_openat+0xba8/0xe48
[   44.543122]                    do_filp_open+0x7c/0xf0
[   44.548200]                    do_sys_openat2+0x2d4/0x3b4
[   44.553628]                    do_sys_open+0x78/0xcc
[   44.558617]                    ret_fast_syscall+0x0/0x2c
[   44.563955]                    0xbe91aba8
[   44.567984]  }
[   44.569665]  ... key      at: [<bf019310>]
__key.39142+0x0/0xffffecf0 [mhi_wwan_ctrl]
[   44.577539]  ... acquired at:
[   44.580522]    _raw_spin_lock+0x40/0x50
[   44.584384]    mhi_wwan_rx_budget_inc+0x14/0x5c [mhi_wwan_ctrl]
[   44.590341]    skb_release_head_state+0x50/0x94
[   44.594908]    skb_release_all+0xc/0x24
[   44.598769]    kfree_skb+0x70/0x1b8
[   44.602281]    mhi_reset_chan+0xfc/0x254 [mhi]
[   44.606866]    mhi_unprepare_channel+0xa0/0xbc [mhi]
[   44.611939]    mhi_unprepare_from_transfer+0x20/0x38 [mhi]
[   44.617531]    wwan_port_fops_release+0x50/0x68
[   44.622094]    __fput+0x7c/0x240
[   44.625352]    task_work_run+0x90/0xb8
[   44.629132]    do_work_pending+0x5b4/0x5e0
[   44.633254]    slow_work_pending+0xc/0x20
[   44.637289]    0x44d00c16
[   44.639929]=20
[   44.641435]=20
[   44.641435] stack backtrace:
[   44.645809] CPU: 0 PID: 439 Comm: ModemManager Not tainted 5.13.6 #1
[   44.652197] Hardware name: Freescale i.MX6 Quad/DualLite (Device
Tree)
[   44.658752] [<c0110d78>] (unwind_backtrace) from [<c010bda4>]
(show_stack+0x10/0x14)
[   44.666551] [<c010bda4>] (show_stack) from [<c0cb77a8>]
(dump_stack+0xdc/0x104)
[   44.673919] [<c0cb77a8>] (dump_stack) from [<c0184e60>]
(check_irq_usage+0x784/0x838)
[   44.677357] cpu cpu0: failed to scale vddarm up: -110
[   44.681805] [<c0184e60>] (check_irq_usage) from [<c0187970>]
(__lock_acquire+0x1600/0x3138)
[   44.686866] cpufreq: __target_index: Failed to change cpu frequency:
-110
[   44.695218] [<c0187970>] (__lock_acquire) from [<c0189eac>]
(lock_acquire+0x12c/0x3ec)
[   44.695255] [<c0189eac>] (lock_acquire) from [<c0ccd318>]
(_raw_spin_lock+0x40/0x50)
[   44.695290] [<c0ccd318>] (_raw_spin_lock) from [<bf0171b4>]
(mhi_wwan_rx_budget_inc+0x14/0x5c [mhi_wwan_ctrl])
[   44.727761] [<bf0171b4>] (mhi_wwan_rx_budget_inc [mhi_wwan_ctrl])
from [<c0947734>] (skb_release_head_state+0x50/0x94)
[   44.738516] [<c0947734>] (skb_release_head_state) from [<c0947784>]
(skb_release_all+0xc/0x24)
[   44.747168] [<c0947784>] (skb_release_all) from [<c0947824>]
(kfree_skb+0x70/0x1b8)
[   44.754863] [<c0947824>] (kfree_skb) from [<bf003d7c>]
(mhi_reset_chan+0xfc/0x254 [mhi])
[   44.763121] [<bf003d7c>] (mhi_reset_chan [mhi]) from [<bf003f74>]
(mhi_unprepare_channel+0xa0/0xbc [mhi])
[   44.772892] [<bf003f74>] (mhi_unprepare_channel [mhi]) from
[<bf004280>] (mhi_unprepare_from_transfer+0x20/0x38 [mhi])
[   44.783788] [<bf004280>] (mhi_unprepare_from_transfer [mhi]) from
[<c0804f5c>] (wwan_port_fops_release+0x50/0x68)
[   44.794189] [<c0804f5c>] (wwan_port_fops_release) from [<c02ba6a4>]
(__fput+0x7c/0x240)
[   44.802240] [<c02ba6a4>] (__fput) from [<c014a508>]
(task_work_run+0x90/0xb8)
[   44.809423] [<c014a508>] (task_work_run) from [<c010b86c>]
(do_work_pending+0x5b4/0x5e0)
[   44.817560] [<c010b86c>] (do_work_pending) from [<c01000b8>]
(slow_work_pending+0xc/0x20)
[   44.825775] Exception stack(0xc32d3fb0 to 0xc32d3ff8)
[   44.830856] 3fa0:                                     00000000
00000002 00000000 00000000
[   44.839063] 3fc0: 00000009 b6fce2c0 be91ac7c 00000006 01570890
b6fce2d0 00000000 01571008
[   44.847268] 3fe0: 00000006 be91abc8 44cfed29 44d00c16 80070030
00000009


NB. I'm using modem manager 1.16.8

Best regards,
Thomas

On Thu, 2021-08-05 at 09:18 +0200, Thomas Perrot wrote:
> Hello Loic,
>=20
> On Tue, 2021-08-03 at 17:02 +0200, Loic Poulain wrote:
> > Hi Thomas,
> >=20
> > > Thanks to both of you, to increase the timeout to 24000ms, in
> > > addition
> > > to disabling the power management seems to correct the issue.
> >=20
> > Would you be able to submit a fix patch for the timeout_ms (with CC
> > stable)?
> >=20
>=20
> Yes, I will able to submit a fix patch for the timeout_ms.
>=20
> Best regards,
> Thomas
>=20
> > I'm a bit worried about that PM issue, not sure why it does not work,
> > could you please double check you have this change:
> > "mhi: pci_generic: Fix inbound IPCR channel"
> >=20
> > Regards,
> > Loic
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-xQVu4pK8Txc7A5gpp5K5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmELlEAACgkQn8ALBXH+
Cu3qaAv/a+rakhye5qMRx0JQ8dGehiBRhAF7c3J5kJNYMXDBLwUFgCtwD11r8Uw/
EhBvdOsz0hQ5CORViiSkrZN9so8lM3/hYEymCavE8kaGMI2QMxQvgKmvG6xDDAJC
GOY+FFibMYbTxymrsHhEboi7v/FfugZ9U24NajJVFN86tqRg/f626af6m3VMB4hs
j9fSfRXfF9mUPEAZRQ9u1pj2L6KZNmGIsP0+iz5hzIF12VmQeSxviMQiFOAXjzo7
lvysAWuhGCKUCxjM1dXaNuj3Nf33BWHDJiMjdJecBCRsyc1B74Pv/G3qz/kvtpIJ
OPv+K2GZ0tXezLCituVWrYYdCF/EzZPL1GRKdSmqcvTiw08/eGm1oaCO6qYbo8ew
qlquAzNJesz12MHO+SCRKjNmLjYlBUkDTWlgg0/LF8OW2kVYlwT5VqEPBzp1fIGH
jkPdl/wmMT9g+zVWydtu1WL36OTIIYPO/P9lNTU2htw7aYbbv5yX/EtKUwJlEVNa
Ce/cd+3q
=TCkO
-----END PGP SIGNATURE-----

--=-xQVu4pK8Txc7A5gpp5K5--

