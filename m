Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19333DEF43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 15:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236319AbhHCNsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 09:48:39 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:50731 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234324AbhHCNsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 09:48:38 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 8D247C170F
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 13:44:30 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6A74CC0003;
        Tue,  3 Aug 2021 13:44:08 +0000 (UTC)
Message-ID: <a7ff4a6e65d12b35719831bdf50ce1e9ae21027b.camel@bootlin.com>
Subject: Re: MHI driver issue with Sierra Wireless AirPrime EM919X
From:   Thomas Perrot <thomas.perrot@bootlin.com>
To:     bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Tue, 03 Aug 2021 15:44:07 +0200
In-Reply-To: <680ccb5730cc1724bbadb2b21638b696@codeaurora.org>
References: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
         <CAMZdPi-qydatnYYLPY9pZ_4XNZOKB+GBVw2M5rqD1WuVEQLwOg@mail.gmail.com>
         <4a9b0d64f1d7ead1f183b2ad0af32379e64d9b82.camel@bootlin.com>
         <CAMZdPi-22FjHwUqQ-K2huaHV_9zDrZShi74w7LCUiMjf-Ss_OQ@mail.gmail.com>
         <680ccb5730cc1724bbadb2b21638b696@codeaurora.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-3Ss3EvOvm+Ax7ISQgua3"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--=-3Ss3EvOvm+Ax7ISQgua3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, 2021-08-02 at 11:14 -0700, Bhaumik Bhatt wrote:
> On 2021-08-02 09:33 AM, Loic Poulain wrote:
> > > > On Fri, 30 Jul 2021 at 19:52, Thomas Perrot <
> > > > thomas.perrot@bootlin.com> wrote:
> > > > >=20
> > > > > Hello,
> > > > >=20
> > > > > I=E2=80=99m trying to use the MHI driver with a Sierra Wireless
> > > > > AirPrime
> > > > > EM919X
> > > > > connected to an NXP i.MX6DL through a PCIe gen2 bus, on 5.13.6,
> > > > > but
> > > > > the
> > > > > device initialisation fails, as follows:
> > > > >=20
> > > > > [=C2=A0=C2=A0=C2=A0 3.029401] mhi-pci-generic 0000:01:00.0: BAR 0=
: assigned
> > > > > [mem
> > > > > 0x01100000-0x01100fff 64bit]
> > > > > [=C2=A0=C2=A0=C2=A0 3.041095] mhi-pci-generic 0000:01:00.0: enabl=
ing device
> > > > > (0140 ->
> > > > > 0142)
> > > > > [=C2=A0=C2=A0=C2=A0 3.118299] mhi mhi0: Requested to power ON
> > > > > [=C2=A0=C2=A0 11.370361] mhi mhi0: Power on setup success
> > > > > [=C2=A0=C2=A0 11.372503] mhi mhi0: Wait for device to enter SBL o=
r
> > > > > Mission mode
> > > > > [=C2=A0=C2=A0 15.664068] mhi-pci-generic 0000:01:00.0: failed to =
suspend
> > > > > device:
> > > > > -16
> > > > > [=C2=A0=C2=A0 22.619948] mhi-pci-generic 0000:01:00.0: refused to=
 change
> > > > > power
> > > > > state from D3hot to D0
> > > > > [=C2=A0=C2=A0 57.289998] mhi-pci-generic 0000:01:00.0: can't chan=
ge power
> > > > > state
> > > > > from D3hot to D0 (config space inaccessible)
> > > > > [=C2=A0=C2=A0 73.769675] mhi-pci-generic 0000:01:00.0: can't chan=
ge power
> > > > > state
> > > > > from D3cold to D0 (config space inaccessible)
> > > > > [=C2=A0=C2=A0 73.780188] mhi-pci-generic 0000:01:00.0: can't chan=
ge power
> > > > > state
> > > > > from D3hot to D0 (config space inaccessible)
> > > > > [=C2=A0=C2=A0 73.836150] PC is at mhi_pci_read_reg+0xc/0x14
> > > > > [=C2=A0=C2=A0 73.840642] LR is at mhi_get_mhi_state+0x2c/0x5c
> > > > > [=C2=A0=C2=A0 74.121120] [<c05dcaf4>] (mhi_pci_read_reg) from
> > > > > [<c05d754c>]
> > > > > (mhi_get_mhi_state+0x2c/0x5c)
> > > > > [=C2=A0=C2=A0 74.129529] [<c05d754c>] (mhi_get_mhi_state) from
> > > > > [<c05da440>]
> > > > > (mhi_pm_resume+0x38/0x298)
> > > > > [=C2=A0=C2=A0 74.137754] [<c05da440>] (mhi_pm_resume) from [<c05d=
cbd0>]
> > > > > (mhi_pci_runtime_resume+0x70/0xe0)
> > > > > [=C2=A0=C2=A0 74.146326] [<c05dcbd0>] (mhi_pci_runtime_resume) fr=
om
> > > > > [<c0604da0>]
> > > > > (pci_pm_runtime_resume+0x84/0xa0)
> > > > >=20
> > > > > Do you have any idea where the issue might come from?
> > > > >=20
> > > > > MHI seems to enter in READY state and waiting to enter in SBL
> > > > > or
> > > > > Mission mode when the issue occurs, the host can start MHI
> > > > > initialization by programming MMIO registers and sets the
> > > > > device into
> > > > > MHI_M0 state.
> > > >=20
> > > > runtime-pm is only enabled when the device is in mission mode, so
> > > > the
> > > > device has likely been successfully initialized, It is just that
> > > > there
> > > > is no info message indicating initialization completion and we
> > > > should
> > > > probably add that. I think maybe about some PCIe suspend/resume
> > > > issues, could you try disabling runtime-pm for that device? or
> > > > simply
> > > > comment `pm_runtime_allow` call?
> > >=20
> > > Thanks for your help, I disabled the power management, I obtains
> > > the
> > > following trace:
> > >=20
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 5.13.6 (arm-oe-linux-gnue=
abi-gcc (GCC)
> > > 9.2.0, GNU ld (GNU Binutils) 2.32.0.20190204) #1 SMP Mon Aug 2=20
> > > 14:27:03
> > > UTC 2021
> > > [=C2=A0=C2=A0=C2=A0 0.000000] CPU: ARMv7 Processor [412fc09a] revisio=
n 10 (ARMv7),
> > > cr=3D10c5387d
> > > [=C2=A0=C2=A0=C2=A0 0.000000] CPU: PIPT / VIPT nonaliasing data cache=
, VIPT
> > > aliasing
> > > instruction cache
> > > [=C2=A0=C2=A0=C2=A0 0.000000] OF: fdt: Machine model: i.MX6 Duallite =
module
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Memory policy: Data cache writealloc
> > > [=C2=A0=C2=A0=C2=A0 0.000000] cma: Reserved 64 MiB at 0x4c000000
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:
> > > [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 [mem 0x0=
000000010000000-
> > > 0x000000003fffffff]
> > > [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 HighMem=C2=A0 [mem 0x000000=
0040000000-
> > > 0x000000004fffffff]
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges
> > > [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x=
0000000010000000-
> > > 0x000000004fffffff]
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem 0x00000000100=
00000-
> > > 0x000000004fffffff]
> > > [=C2=A0=C2=A0=C2=A0 0.000000] On node 0 totalpages: 262144
> > > [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal zone: 1536 pages use=
d for memmap
> > > [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal zone: 0 pages reserv=
ed
> > > [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal zone: 196608 pages, =
LIFO batch:63
> > > [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 HighMem zone: 65536 pages, =
LIFO batch:15
> > > [=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 20 pages/cpu s52396 r8=
192 d21332=20
> > > u81920
> > > [=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: s52396 r8192 d21332 u81920 =
alloc=3D20*4096
> > > [=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: [0] 0 [0] 1
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping on=
.=C2=A0 Total
> > > pages:
> > > 260608
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line: console=3Dttymxc3,=
115200n8=20
> > > loglevel=3D8
> > > root=3D/dev/nfs ip=3D10.0.0.2:255.255.255.0
> > > nfsroot=3D10.0.0.1:/var/lib/nfsboot,v4,tcp
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Dentry cache hash table entries: 131072=
 (order: 7,
> > > 524288 bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 65536 (=
order: 6,
> > > 262144
> > > bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.000000] mem auto-init: stack:off, heap alloc:of=
f, heap
> > > free:off
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Memory: 945728K/1048576K available (133=
12K kernel
> > > code,
> > > 1910K rwdata, 4228K rodata, 1024K init, 6621K bss, 37312K reserved,
> > > 65536K cma-reserved, 196608K highmem)
> > > [=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObj=
ects=3D0, CPUs=3D2,
> > > Nodes=3D1
> > > [=C2=A0=C2=A0=C2=A0 0.000000] trace event string verifier disabled
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Running RCU self tests
> > > [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Hierarchical RCU implementation.
> > > [=C2=A0=C2=A0=C2=A0 0.000000] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU event =
tracing is enabled.
> > > [=C2=A0=C2=A0=C2=A0 0.000000] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU lockde=
p checking is enabled.
> > > [=C2=A0=C2=A0=C2=A0 0.000000] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU restri=
cting CPUs from NR_CPUS=3D4 to
> > > nr_cpu_ids=3D2.
> > > [=C2=A0=C2=A0=C2=A0 0.000000] rcu: RCU calculated value of scheduler-=
enlistment
> > > delay
> > > is 10 jiffies.
> > > [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting geometry for rcu_fanout_=
leaf=3D16,
> > > nr_cpu_ids=3D2
> > > [=C2=A0=C2=A0=C2=A0 0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated =
irqs: 16
> > > [=C2=A0=C2=A0=C2=A0 0.000000] L2C-310 erratum 769419 enabled
> > > [=C2=A0=C2=A0=C2=A0 0.000000] L2C-310 enabling early BRESP for Cortex=
-A9
> > > [=C2=A0=C2=A0=C2=A0 0.000000] L2C-310 full line of zeros enabled for =
Cortex-A9
> > > [=C2=A0=C2=A0=C2=A0 0.000000] L2C-310 ID prefetch enabled, offset 16 =
lines
> > > [=C2=A0=C2=A0=C2=A0 0.000000] L2C-310 dynamic clock gating enabled, s=
tandby mode
> > > enabled
> > > [=C2=A0=C2=A0=C2=A0 0.000000] L2C-310 cache controller enabled, 16 wa=
ys, 512 kB
> > > [=C2=A0=C2=A0=C2=A0 0.000000] L2C-310: CACHE_ID 0x410000c8, AUX_CTRL =
0x76450001
> > > [=C2=A0=C2=A0=C2=A0 0.000000] random: get_random_bytes called from
> > > start_kernel+0x364/0x58c with crng_init=3D0
> > > [=C2=A0=C2=A0=C2=A0 0.000000] Switching to timer-based delay loop, re=
solution
> > > 333ns
> > > [=C2=A0=C2=A0=C2=A0 0.000001] sched_clock: 32 bits at 3000kHz, resolu=
tion 333ns,
> > > wraps
> > > every 715827882841ns
> > > [=C2=A0=C2=A0=C2=A0 0.000033] clocksource: mxc_timer1: mask: 0xffffff=
ff
> > > max_cycles:
> > > 0xffffffff, max_idle_ns: 637086815595 ns
> > > [=C2=A0=C2=A0=C2=A0 0.001600] Console: colour dummy device 80x30
> > > [=C2=A0=C2=A0=C2=A0 0.001663] Lock dependency validator: Copyright (c=
) 2006 Red
> > > Hat,
> > > Inc., Ingo Molnar
> > > [=C2=A0=C2=A0=C2=A0 0.001685] ... MAX_LOCKDEP_SUBCLASSES:=C2=A0 8
> > > [=C2=A0=C2=A0=C2=A0 0.001703] ... MAX_LOCK_DEPTH:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 48
> > > [=C2=A0=C2=A0=C2=A0 0.001721] ... MAX_LOCKDEP_KEYS:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 8192
> > > [=C2=A0=C2=A0=C2=A0 0.001742] ... CLASSHASH_SIZE:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096
> > > [=C2=A0=C2=A0=C2=A0 0.001760] ... MAX_LOCKDEP_ENTRIES:=C2=A0=C2=A0=C2=
=A0=C2=A0 32768
> > > [=C2=A0=C2=A0=C2=A0 0.001777] ... MAX_LOCKDEP_CHAINS:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 65536
> > > [=C2=A0=C2=A0=C2=A0 0.001795] ... CHAINHASH_SIZE:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32768
> > > [=C2=A0=C2=A0=C2=A0 0.001812]=C2=A0 memory used by lock dependency in=
fo: 4061 kB
> > > [=C2=A0=C2=A0=C2=A0 0.001831]=C2=A0 memory used for stack traces: 211=
2 kB
> > > [=C2=A0=C2=A0=C2=A0 0.001849]=C2=A0 per task-struct memory footprint:=
 1536 bytes
> > > [=C2=A0=C2=A0=C2=A0 0.001979] Calibrating delay loop (skipped), value=
 calculated
> > > using
> > > timer frequency.. 6.00 BogoMIPS (lpj=3D30000)
> > > [=C2=A0=C2=A0=C2=A0 0.002020] pid_max: default: 32768 minimum: 301
> > > [=C2=A0=C2=A0=C2=A0 0.002324] Mount-cache hash table entries: 2048 (o=
rder: 1, 8192
> > > bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.002375] Mountpoint-cache hash table entries: 20=
48 (order: 1,
> > > 8192 bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.006205] CPU: Testing write buffer coherency: ok
> > > [=C2=A0=C2=A0=C2=A0 0.006386] CPU0: Spectre v2: using BPIALL workarou=
nd
> > > [=C2=A0=C2=A0=C2=A0 0.007450] CPU0: thread -1, cpu 0, socket 0, mpidr=
 80000000
> > > [=C2=A0=C2=A0=C2=A0 0.010927] Setting up static identity map for 0x10=
100000 -
> > > 0x10100078
> > > [=C2=A0=C2=A0=C2=A0 0.011749] rcu: Hierarchical SRCU implementation.
> > > [=C2=A0=C2=A0=C2=A0 0.013800] smp: Bringing up secondary CPUs ...
> > > [=C2=A0=C2=A0=C2=A0 0.017275] CPU1: thread -1, cpu 1, socket 0, mpidr=
 80000001
> > > [=C2=A0=C2=A0=C2=A0 0.017300] CPU1: Spectre v2: using BPIALL workarou=
nd
> > > [=C2=A0=C2=A0=C2=A0 0.018621] smp: Brought up 1 node, 2 CPUs
> > > [=C2=A0=C2=A0=C2=A0 0.018660] SMP: Total of 2 processors activated (1=
2.00
> > > BogoMIPS).
> > > [=C2=A0=C2=A0=C2=A0 0.018691] CPU: All CPU(s) started in SVC mode.
> > > [=C2=A0=C2=A0=C2=A0 0.022001] devtmpfs: initialized
> > > [=C2=A0=C2=A0=C2=A0 0.061678] VFP support v0.3: implementor 41 archit=
ecture 3 part
> > > 30
> > > variant 9 rev 4
> > > [=C2=A0=C2=A0=C2=A0 0.064662] clocksource: jiffies: mask: 0xffffffff =
max_cycles:
> > > 0xffffffff, max_idle_ns: 19112604462750000 ns
> > > [=C2=A0=C2=A0=C2=A0 0.064755] futex hash table entries: 512 (order: 3=
, 32768
> > > bytes,
> > > linear)
> > > [=C2=A0=C2=A0=C2=A0 0.068750] pinctrl core: initialized pinctrl subsy=
stem
> > > [=C2=A0=C2=A0=C2=A0 0.075244] NET: Registered protocol family 16
> > > [=C2=A0=C2=A0=C2=A0 0.102637] DMA: preallocated 256 KiB pool for atom=
ic coherent
> > > allocations
> > > [=C2=A0=C2=A0=C2=A0 0.108783] thermal_sys: Registered thermal governo=
r 'step_wise'
> > > [=C2=A0=C2=A0=C2=A0 0.109361] cpuidle: using governor menu
> > > [=C2=A0=C2=A0=C2=A0 0.109609] NET: Registered protocol family 42
> > > [=C2=A0=C2=A0=C2=A0 0.110336] CPU identified as i.MX6DL, silicon rev =
1.3
> > > [=C2=A0=C2=A0=C2=A0 0.157666] vdd1p1: supplied by regulator-dummy
> > > [=C2=A0=C2=A0=C2=A0 0.160738] vdd3p0: supplied by regulator-dummy
> > > [=C2=A0=C2=A0=C2=A0 0.163009] vdd2p5: supplied by regulator-dummy
> > > [=C2=A0=C2=A0=C2=A0 0.166539] vddpu: supplied by regulator-dummy
> > > [=C2=A0=C2=A0=C2=A0 0.204081] platform 2400000.ipu: Fixing up cyclic =
dependency
> > > with
> > > 20e0000.iomuxc-gpr:ipu1_csi1_mux
> > > [=C2=A0=C2=A0=C2=A0 0.204560] platform 2400000.ipu: Fixing up cyclic =
dependency
> > > with
> > > 20e0000.iomuxc-gpr:ipu1_csi0_mux
> > > [=C2=A0=C2=A0=C2=A0 0.216152] No ATAGs?
> > > [=C2=A0=C2=A0=C2=A0 0.216575] hw-breakpoint: found 5 (+1 reserved) br=
eakpoint and
> > > 1
> > > watchpoint registers.
> > > [=C2=A0=C2=A0=C2=A0 0.216689] hw-breakpoint: maximum watchpoint size =
is 4 bytes.
> > > [=C2=A0=C2=A0=C2=A0 0.218287] debugfs: Directory 'dummy-iomuxc-gpr@20=
e0000' with
> > > parent 'regmap' already present!
> > > [=C2=A0=C2=A0=C2=A0 0.219892] imx6dl-pinctrl 20e0000.pinctrl: initial=
ized IMX
> > > pinctrl
> > > driver
> > > [=C2=A0=C2=A0=C2=A0 0.336589] mxs-dma 110000.dma-apbh: initialized
> > > [=C2=A0=C2=A0=C2=A0 0.366282] vgaarb: loaded
> > > [=C2=A0=C2=A0=C2=A0 0.368879] SCSI subsystem initialized
> > > [=C2=A0=C2=A0=C2=A0 0.369795] libata version 3.00 loaded.
> > > [=C2=A0=C2=A0=C2=A0 0.371044] usbcore: registered new interface drive=
r usbfs
> > > [=C2=A0=C2=A0=C2=A0 0.371350] usbcore: registered new interface drive=
r hub
> > > [=C2=A0=C2=A0=C2=A0 0.371534] usbcore: registered new device driver u=
sb
> > > [=C2=A0=C2=A0=C2=A0 0.372134] usb_phy_generic usbphynop1: supply vcc =
not found,
> > > using
> > > dummy regulator
> > > [=C2=A0=C2=A0=C2=A0 0.373424] usb_phy_generic usbphynop2: supply vcc =
not found,
> > > using
> > > dummy regulator
> > > [=C2=A0=C2=A0=C2=A0 0.380083] i2c i2c-1: IMX I2C adapter registered
> > > [=C2=A0=C2=A0=C2=A0 0.381434] pps_core: LinuxPPS API ver. 1 registere=
d
> > > [=C2=A0=C2=A0=C2=A0 0.381470] pps_core: Software ver. 5.3.6 - Copyrig=
ht 2005-2007
> > > Rodolfo Giometti <giometti@linux.it>
> > > [=C2=A0=C2=A0=C2=A0 0.381551] PTP clock support registered
> > > [=C2=A0=C2=A0=C2=A0 0.386332] Bluetooth: Core ver 2.22
> > > [=C2=A0=C2=A0=C2=A0 0.386506] NET: Registered protocol family 31
> > > [=C2=A0=C2=A0=C2=A0 0.386535] Bluetooth: HCI device and connection ma=
nager=20
> > > initialized
> > > [=C2=A0=C2=A0=C2=A0 0.386695] Bluetooth: HCI socket layer initialized
> > > [=C2=A0=C2=A0=C2=A0 0.386748] Bluetooth: L2CAP socket layer initializ=
ed
> > > [=C2=A0=C2=A0=C2=A0 0.386945] Bluetooth: SCO socket layer initialized
> > > [=C2=A0=C2=A0=C2=A0 0.391017] clocksource: Switched to clocksource mx=
c_timer1
> > > [=C2=A0=C2=A0=C2=A0 0.763351] VFS: Disk quotas dquot_6.6.0
> > > [=C2=A0=C2=A0=C2=A0 0.763583] VFS: Dquot-cache hash table entries: 10=
24 (order 0,=20
> > > 4096
> > > bytes)
> > > [=C2=A0=C2=A0=C2=A0 0.800699] NET: Registered protocol family 2
> > > [=C2=A0=C2=A0=C2=A0 0.801465] IP idents hash table entries: 16384 (or=
der: 5,
> > > 131072
> > > bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.805081] tcp_listen_portaddr_hash hash table ent=
ries: 512=20
> > > (order:
> > > 2, 22528 bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.805228] TCP established hash table entries: 819=
2 (order: 3,
> > > 32768 bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.805411] TCP bind hash table entries: 8192 (orde=
r: 6, 327680
> > > bytes, linear)
> > > [=C2=A0=C2=A0=C2=A0 0.806559] TCP: Hash tables configured (establishe=
d 8192 bind
> > > 8192)
> > > [=C2=A0=C2=A0=C2=A0 0.807250] UDP hash table entries: 512 (order: 3, =
49152 bytes,
> > > linear)
> > > [=C2=A0=C2=A0=C2=A0 0.807475] UDP-Lite hash table entries: 512 (order=
: 3, 49152=20
> > > bytes,
> > > linear)
> > > [=C2=A0=C2=A0=C2=A0 0.808140] NET: Registered protocol family 1
> > > [=C2=A0=C2=A0=C2=A0 0.811976] RPC: Registered named UNIX socket trans=
port module.
> > > [=C2=A0=C2=A0=C2=A0 0.812100] RPC: Registered udp transport module.
> > > [=C2=A0=C2=A0=C2=A0 0.812129] RPC: Registered tcp transport module.
> > > [=C2=A0=C2=A0=C2=A0 0.812155] RPC: Registered tcp NFSv4.1 backchannel=
 transport
> > > module.
> > > [=C2=A0=C2=A0=C2=A0 0.814412] PCI: CLS 0 bytes, default 64
> > > [=C2=A0=C2=A0=C2=A0 0.815722] armv7-pmu pmu: hw perfevents: no interr=
upt-affinity
> > > property, guessing.
> > > [=C2=A0=C2=A0=C2=A0 1.395389] hw perfevents: enabled with armv7_corte=
x_a9 PMU
> > > driver,
> > > 7 counters available
> > > [=C2=A0=C2=A0=C2=A0 1.401550] Initialise system trusted keyrings
> > > [=C2=A0=C2=A0=C2=A0 1.402567] workingset: timestamp_bits=3D30 max_ord=
er=3D18
> > > bucket_order=3D0
> > > [=C2=A0=C2=A0=C2=A0 1.431576] NFS: Registering the id_resolver key ty=
pe
> > > [=C2=A0=C2=A0=C2=A0 1.431773] Key type id_resolver registered
> > > [=C2=A0=C2=A0=C2=A0 1.431892] Key type id_legacy registered
> > > [=C2=A0=C2=A0=C2=A0 1.432131] jffs2: version 2.2. (NAND) =C2=A9 2001-=
2006 Red Hat, Inc.
> > > [=C2=A0=C2=A0=C2=A0 1.434360] fuse: init (API version 7.34)
> > > [=C2=A0=C2=A0=C2=A0 1.538869] Key type asymmetric registered
> > > [=C2=A0=C2=A0=C2=A0 1.539043] Asymmetric key parser 'x509' registered
> > > [=C2=A0=C2=A0=C2=A0 1.539425] bounce: pool size: 64 pages
> > > [=C2=A0=C2=A0=C2=A0 1.539666] io scheduler mq-deadline registered
> > > [=C2=A0=C2=A0=C2=A0 1.539706] io scheduler kyber registered
> > > [=C2=A0=C2=A0=C2=A0 1.546350] imx6q-pcie 1ffc000.pcie: host bridge=
=20
> > > /soc/pcie@1ffc000
> > > ranges:
> > > [=C2=A0=C2=A0=C2=A0 1.546683] imx6q-pcie 1ffc000.pcie:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 IO
> > > 0x0001f80000..0x0001f8ffff -> 0x0000000000
> > > [=C2=A0=C2=A0=C2=A0 1.546998] imx6q-pcie 1ffc000.pcie:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 MEM
> > > 0x0001000000..0x0001efffff -> 0x0001000000
> > > [=C2=A0=C2=A0=C2=A0 1.561233] imx-sdma 20ec000.sdma: Direct firmware =
load for
> > > imx/sdma/sdma-imx6q.bin failed with error -2
> > > [=C2=A0=C2=A0=C2=A0 1.561380] imx-sdma 20ec000.sdma: Falling back to =
sysfs
> > > fallback
> > > for: imx/sdma/sdma-imx6q.bin
> > > [=C2=A0=C2=A0=C2=A0 1.576583] pfuze100-regulator 1-0008: Full layer: =
2, Metal
> > > layer:=20
> > > 1
> > > [=C2=A0=C2=A0=C2=A0 1.577276] pfuze100-regulator 1-0008: FAB: 0, FIN:=
 0
> > > [=C2=A0=C2=A0=C2=A0 1.577316] pfuze100-regulator 1-0008: pfuze100 fou=
nd.
> > > [=C2=A0=C2=A0=C2=A0 1.608012] 21f0000.serial: ttymxc3 at MMIO 0x21f00=
00 (irq =3D 72,
> > > base_baud =3D 5000000) is a IMX
> > > [=C2=A0=C2=A0=C2=A0 1.662256] imx6q-pcie 1ffc000.pcie: iATU unroll: d=
isabled
> > > [=C2=A0=C2=A0=C2=A0 1.662287] imx6q-pcie 1ffc000.pcie: Detected iATU =
regions: 4
> > > outbound, 4 inbound
> > > [=C2=A0=C2=A0=C2=A0 1.962914] imx6q-pcie 1ffc000.pcie: Link up
> > > [=C2=A0=C2=A0=C2=A0 2.061645] imx6q-pcie 1ffc000.pcie: Link up
> > > [=C2=A0=C2=A0=C2=A0 2.061667] imx6q-pcie 1ffc000.pcie: Link up, Gen2
> > > [=C2=A0=C2=A0=C2=A0 2.061687] imx6q-pcie 1ffc000.pcie: Link up
> > > [=C2=A0=C2=A0=C2=A0 2.062985] imx6q-pcie 1ffc000.pcie: PCI host bridg=
e to bus
> > > 0000:00
> > > [=C2=A0=C2=A0=C2=A0 2.063019] pci_bus 0000:00: root bus resource [bus=
 00-ff]
> > > [=C2=A0=C2=A0=C2=A0 2.063044] pci_bus 0000:00: root bus resource [io=
=C2=A0 0x0000-
> > > 0xffff]
> > > [=C2=A0=C2=A0=C2=A0 2.063067] pci_bus 0000:00: root bus resource [mem=
 0x01000000-
> > > 0x01efffff]
> > > [=C2=A0=C2=A0=C2=A0 2.063496] pci 0000:00:00.0: [16c3:abcd] type 01 c=
lass 0x060400
> > > [=C2=A0=C2=A0=C2=A0 2.063572] pci 0000:00:00.0: reg 0x10: [mem 0x0000=
0000-
> > > 0x000fffff]
> > > [=C2=A0=C2=A0=C2=A0 2.063637] pci 0000:00:00.0: reg 0x38: [mem 0x0000=
0000-
> > > 0x0000ffff
> > > pref]
> > > [=C2=A0=C2=A0=C2=A0 2.063745] pci 0000:00:00.0: Limiting cfg_size to =
512
> > > [=C2=A0=C2=A0=C2=A0 2.064120] pci 0000:00:00.0: supports D1
> > > [=C2=A0=C2=A0=C2=A0 2.064138] pci 0000:00:00.0: PME# supported from D=
0 D1 D3hot=20
> > > D3cold
> > > [=C2=A0=C2=A0=C2=A0 2.068753] PCI: bus0: Fast back to back transfers =
disabled
> > > [=C2=A0=C2=A0=C2=A0 2.069419] pci 0000:01:00.0: [17cb:0306] type 00 c=
lass 0xff0000
> > > [=C2=A0=C2=A0=C2=A0 2.069550] pci 0000:01:00.0: reg 0x10: [mem 0x0000=
0000-
> > > 0x00000fff
> > > 64bit]
> > > [=C2=A0=C2=A0=C2=A0 2.069633] pci 0000:01:00.0: reg 0x18: [mem 0x0000=
0000-
> > > 0x00000fff
> > > 64bit]
> > > [=C2=A0=C2=A0=C2=A0 2.070265] pci 0000:01:00.0: PME# supported from D=
0 D3hot
> > > D3cold
> > > [=C2=A0=C2=A0=C2=A0 2.070437] pci 0000:01:00.0: 4.000 Gb/s available =
PCIe
> > > bandwidth,
> > > limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 31.506
> > > Gb/s with 16.0 GT/s PCIe x2 link)
> > > [=C2=A0=C2=A0=C2=A0 2.074462] PCI: bus1: Fast back to back transfers =
disabled
> > > [=C2=A0=C2=A0=C2=A0 2.076179] printk: console [ttymxc3] enabled
> > > [=C2=A0=C2=A0=C2=A0 2.079173] pci 0000:00:00.0: BAR 0: assigned [mem =
0x01000000-
> > > 0x010fffff]
> > > [=C2=A0=C2=A0=C2=A0 2.702298] pci 0000:00:00.0: BAR 8: assigned [mem =
0x01100000-
> > > 0x011fffff]
> > > [=C2=A0=C2=A0=C2=A0 2.709133] pci 0000:00:00.0: BAR 6: assigned [mem =
0x01200000-
> > > 0x0120ffff pref]
> > > [=C2=A0=C2=A0=C2=A0 2.716589] pci 0000:01:00.0: BAR 0: assigned [mem =
0x01100000-
> > > 0x01100fff 64bit]
> > > [=C2=A0=C2=A0=C2=A0 2.724097] pci 0000:01:00.0: BAR 2: assigned [mem =
0x01101000-
> > > 0x01101fff 64bit]
> > > [=C2=A0=C2=A0=C2=A0 2.725446] etnaviv etnaviv: bound 130000.gpu (ops =
gpu_ops)
> > > [=C2=A0=C2=A0=C2=A0 2.731578] pci 0000:00:00.0: PCI bridge to [bus 01=
-ff]
> > > [=C2=A0=C2=A0=C2=A0 2.738177] etnaviv etnaviv: bound 134000.gpu (ops =
gpu_ops)
> > > [=C2=A0=C2=A0=C2=A0 2.742511] pci 0000:00:00.0:=C2=A0=C2=A0 bridge wi=
ndow [mem 0x01100000-
> > > 0x011fffff]
> > > [=C2=A0=C2=A0=C2=A0 2.748092] etnaviv-gpu 130000.gpu: model: GC880, r=
evision: 5106
> > > [=C2=A0=C2=A0=C2=A0 2.755855] mhi-pci-generic 0000:01:00.0: MHI PCI d=
evice found:
> > > qcom-sdx55m
> > > [=C2=A0=C2=A0=C2=A0 2.768315] mhi-pci-generic 0000:01:00.0: BAR 0: as=
signed [mem
> > > 0x01100000-0x01100fff 64bit]
> > > [=C2=A0=C2=A0=C2=A0 2.769015] etnaviv-gpu 134000.gpu: model: GC320, r=
evision: 5007
> > > [=C2=A0=C2=A0=C2=A0 2.776912] mhi-pci-generic 0000:01:00.0: enabling =
device (0140
> > > ->
> > > 0142)
> > > [=C2=A0=C2=A0=C2=A0 2.786483] [drm] Initialized etnaviv 1.3.0 2015121=
4 for etnaviv
> > > on
> > > minor 0
> > > [=C2=A0=C2=A0=C2=A0 2.801751] mhi mhi0: Requested to power ON
> > > [=C2=A0=C2=A0=C2=A0 2.808489] mhi mhi0: Power on setup success
> > > [=C2=A0=C2=A0=C2=A0 2.810346] imx-drm display-subsystem: bound imx-ip=
uv3-crtc.2
> > > (ops
> > > ipu_crtc_ops)
> > > [=C2=A0=C2=A0=C2=A0 2.821931] imx-drm display-subsystem: bound imx-ip=
uv3-crtc.3
> > > (ops
> > > ipu_crtc_ops)
> > > [=C2=A0=C2=A0=C2=A0 2.831489] [drm] Initialized imx-drm 1.0.0 2012050=
7 for
> > > display-
> > > subsystem on minor 1
> > > [=C2=A0=C2=A0=C2=A0 2.839891] imx-ipuv3 2400000.ipu: IPUv3H probed
> > > [=C2=A0=C2=A0=C2=A0 2.891577] brd: module loaded
> > > [=C2=A0=C2=A0=C2=A0 2.939853] loop: module loaded
> > > [=C2=A0=C2=A0=C2=A0 2.951691] spi@0 enforce active low on chipselect =
handle
> > > [=C2=A0=C2=A0=C2=A0 2.957268] spi@1 enforce active low on chipselect =
handle
> > > [=C2=A0=C2=A0=C2=A0 2.972776] spi@0 enforce active low on chipselect =
handle
> > > [=C2=A0=C2=A0=C2=A0 2.978398] spi@1 enforce active low on chipselect =
handle
> > > [=C2=A0=C2=A0=C2=A0 2.994315] libphy: Fixed MDIO Bus: probed
> > > [=C2=A0=C2=A0=C2=A0 3.000604] CAN device driver interface
> > > [=C2=A0=C2=A0=C2=A0 3.010081] pps pps0: new PPS source ptp0
> > > [=C2=A0=C2=A0=C2=A0 3.028687] libphy: fec_enet_mii_bus: probed
> > > [=C2=A0=C2=A0=C2=A0 3.036072] fec 2188000.ethernet eth0: registered P=
HC device 0
> > > [=C2=A0=C2=A0=C2=A0 3.044184] PPP generic driver version 2.4.2
> > > [=C2=A0=C2=A0=C2=A0 3.049501] PPP BSD Compression module registered
> > > [=C2=A0=C2=A0=C2=A0 3.054353] PPP Deflate Compression module register=
ed
> > > [=C2=A0=C2=A0=C2=A0 3.059991] usbcore: registered new interface drive=
r r8152
> > > [=C2=A0=C2=A0=C2=A0 3.065701] usbcore: registered new interface drive=
r lan78xx
> > > [=C2=A0=C2=A0=C2=A0 3.071583] usbcore: registered new interface drive=
r cdc_ether
> > > [=C2=A0=C2=A0=C2=A0 3.077562] usbcore: registered new interface drive=
r cdc_eem
> > > [=C2=A0=C2=A0=C2=A0 3.083500] usbcore: registered new interface drive=
r smsc95xx
> > > [=C2=A0=C2=A0=C2=A0 3.089413] usbcore: registered new interface drive=
r net1080
> > > [=C2=A0=C2=A0=C2=A0 3.095293] usbcore: registered new interface drive=
r cdc_subset
> > > [=C2=A0=C2=A0=C2=A0 3.101424] usbcore: registered new interface drive=
r zaurus
> > > [=C2=A0=C2=A0=C2=A0 3.107144] usbcore: registered new interface drive=
r MOSCHIP
> > > usb-
> > > ethernet driver
> > > [=C2=A0=C2=A0=C2=A0 3.114840] usbcore: registered new interface drive=
r sierra_net
> > > [=C2=A0=C2=A0=C2=A0 3.121028] usbcore: registered new interface drive=
r cdc_ncm
> > > [=C2=A0=C2=A0=C2=A0 3.126862] usbcore: registered new interface drive=
r qmi_wwan
> > > [=C2=A0=C2=A0=C2=A0 3.132835] usbcore: registered new interface drive=
r cdc_mbim
> > > [=C2=A0=C2=A0=C2=A0 3.138607] ehci_hcd: USB 2.0 'Enhanced' Host Contr=
oller (EHCI)
> > > Driver
> > > [=C2=A0=C2=A0=C2=A0 3.145209] ehci-pci: EHCI PCI platform driver
> > > [=C2=A0=C2=A0=C2=A0 3.149951] usbcore: registered new interface drive=
r cdc_wdm
> > > [=C2=A0=C2=A0=C2=A0 3.155907] usbcore: registered new interface drive=
r usb-storage
> > > [=C2=A0=C2=A0=C2=A0 3.162458] usbcore: registered new interface drive=
r
> > > usbserial_generic
> > > [=C2=A0=C2=A0=C2=A0 3.169462] usbserial: USB Serial support registere=
d for generic
> > > [=C2=A0=C2=A0=C2=A0 3.175898] usbcore: registered new interface drive=
r ftdi_sio
> > > [=C2=A0=C2=A0=C2=A0 3.181889] usbserial: USB Serial support registere=
d for FTDI
> > > USB
> > > Serial Device
> > > [=C2=A0=C2=A0=C2=A0 3.189345] usbcore: registered new interface drive=
r option
> > > [=C2=A0=C2=A0=C2=A0 3.195086] usbserial: USB Serial support registere=
d for GSM
> > > modem
> > > (1-port)
> > > [=C2=A0=C2=A0=C2=A0 3.202258] usbcore: registered new interface drive=
r qcserial
> > > [=C2=A0=C2=A0=C2=A0 3.208119] usbserial: USB Serial support registere=
d for
> > > Qualcomm
> > > USB modem
> > > [=C2=A0=C2=A0=C2=A0 3.233880] snvs_rtc 20cc000.snvs:snvs-rtc-lp: regi=
stered as
> > > rtc0
> > > [=C2=A0=C2=A0=C2=A0 3.240101] snvs_rtc 20cc000.snvs:snvs-rtc-lp: sett=
ing system
> > > clock
> > > to 1970-01-01T00:00:00 UTC (0)
> > > [=C2=A0=C2=A0=C2=A0 3.249753] i2c /dev entries driver
> > > [=C2=A0=C2=A0=C2=A0 3.268851] sdhci: Secure Digital Host Controller I=
nterface
> > > driver
> > > [=C2=A0=C2=A0=C2=A0 3.275192] sdhci: Copyright(c) Pierre Ossman
> > > [=C2=A0=C2=A0=C2=A0 3.279581] sdhci-pltfm: SDHCI platform and OF driv=
er helper
> > > [=C2=A0=C2=A0=C2=A0 3.289992] caam 2100000.crypto: Entropy delay =3D =
3200
> > > [=C2=A0=C2=A0=C2=A0 3.331171] mmc1: SDHCI controller on 2194000.mmc [=
2194000.mmc]
> > > using ADMA
> > > [=C2=A0=C2=A0=C2=A0 3.338991] mmc2: SDHCI controller on 2198000.mmc [=
2198000.mmc]
> > > using ADMA
> > > [=C2=A0=C2=A0=C2=A0 3.356018] caam 2100000.crypto: Instantiated RNG4 =
SH0
> > > [=C2=A0=C2=A0=C2=A0 3.416778] caam 2100000.crypto: Instantiated RNG4 =
SH1
> > > [=C2=A0=C2=A0=C2=A0 3.422116] caam 2100000.crypto: device ID =3D 0x0a=
16010000000100=20
> > > (Era
> > > 4)
> > > [=C2=A0=C2=A0=C2=A0 3.428768] caam 2100000.crypto: job rings =3D 2, q=
i =3D 0
> > > [=C2=A0=C2=A0=C2=A0 3.453774] mmc3: SDHCI controller on 219c000.mmc [=
219c000.mmc]
> > > using ADMA
> > > [=C2=A0=C2=A0=C2=A0 3.462624] mmc2: new DDR MMC card at address 0001
> > > [=C2=A0=C2=A0=C2=A0 3.473278] mmcblk2: mmc2:0001 00016G 14.6 GiB
> > > [=C2=A0=C2=A0=C2=A0 3.480232] mmcblk2boot0: mmc2:0001 00016G 4.00 MiB
> > > [=C2=A0=C2=A0=C2=A0 3.481917] caam algorithms registered in /proc/cry=
pto
> > > [=C2=A0=C2=A0=C2=A0 3.487898] mmcblk2boot1: mmc2:0001 00016G 4.00 MiB
> > > [=C2=A0=C2=A0=C2=A0 3.498687] caam 2100000.crypto: registering rng-ca=
am
> > > [=C2=A0=C2=A0=C2=A0 3.499061] mmcblk2rpmb: mmc2:0001 00016G 4.00 MiB,=
 chardev
> > > (244:0)
> > > [=C2=A0=C2=A0=C2=A0 3.524714] usbcore: registered new interface drive=
r usbhid
> > > [=C2=A0=C2=A0=C2=A0 3.530329] usbhid: USB HID core driver
> > > [=C2=A0=C2=A0=C2=A0 3.543229] Initializing XFRM netlink socket
> > > [=C2=A0=C2=A0=C2=A0 3.549810] NET: Registered protocol family 10
> > > [=C2=A0=C2=A0=C2=A0 3.551444] mmc3: new DDR MMC card at address 0001
> > > [=C2=A0=C2=A0=C2=A0 3.563454] Segment Routing with IPv6
> > > [=C2=A0=C2=A0=C2=A0 3.568381] sit: IPv6, IPv4 and MPLS over IPv4 tunn=
eling driver
> > > [=C2=A0=C2=A0=C2=A0 3.572261] mmcblk3: mmc3:0001 E0004G 3.64 GiB
> > > [=C2=A0=C2=A0=C2=A0 3.577406] NET: Registered protocol family 17
> > > [=C2=A0=C2=A0=C2=A0 3.579848] mmcblk3boot0: mmc3:0001 E0004G 4.00 MiB
> > > [=C2=A0=C2=A0=C2=A0 3.583595] NET: Registered protocol family 15
> > > [=C2=A0=C2=A0=C2=A0 3.589477] mmcblk3boot1: mmc3:0001 E0004G 4.00 MiB
> > > [=C2=A0=C2=A0=C2=A0 3.593057] can: controller area network core
> > > [=C2=A0=C2=A0=C2=A0 3.593470] NET: Registered protocol family 29
> > > [=C2=A0=C2=A0=C2=A0 3.603122] mmcblk3rpmb: mmc3:0001 E0004G 4.00 MiB,=
 chardev
> > > (244:1)
> > > [=C2=A0=C2=A0=C2=A0 3.607179] can: raw protocol
> > > [=C2=A0=C2=A0=C2=A0 3.617067] can: broadcast manager protocol
> > > [=C2=A0=C2=A0=C2=A0 3.621569] can: netlink gateway - max_hops=3D1
> > > [=C2=A0=C2=A0=C2=A0 3.624307]=C2=A0 mmcblk3: p1 p2
> > > [=C2=A0=C2=A0=C2=A0 3.626619] Key type dns_resolver registered
> > > [=C2=A0=C2=A0=C2=A0 3.633579] random: fast init done
> > > [=C2=A0=C2=A0=C2=A0 3.643820] Registering SWP/SWPB emulation handler
> > > [=C2=A0=C2=A0=C2=A0 3.649438] Loading compiled-in X.509 certificates
> > > [=C2=A0=C2=A0=C2=A0 3.748476] random: crng init done
> > > [=C2=A0=C2=A0=C2=A0 3.821484] vddarm: supplied by SW1AB
> > > [=C2=A0=C2=A0=C2=A0 3.828699] vddsoc: supplied by SW1C
> > > [=C2=A0=C2=A0=C2=A0 4.431354] mhi mhi0: Wait for device to enter SBL =
or Mission
> > > mode
> > > [=C2=A0=C2=A0=C2=A0 4.453212] mxs_phy 20c9000.usbphy: Data pin can't =
make good
> > > contact.
> > > [=C2=A0=C2=A0=C2=A0 4.469544] ci_hdrc ci_hdrc.1: EHCI Host Controller
> > > [=C2=A0=C2=A0=C2=A0 4.475134] ci_hdrc ci_hdrc.1: new USB bus register=
ed, assigned
> > > bus
> > > number 1
> > > [=C2=A0=C2=A0=C2=A0 4.511146] ci_hdrc ci_hdrc.1: USB 2.0 started, EHC=
I 1.00
> > > [=C2=A0=C2=A0=C2=A0 4.518600] usb usb1: New USB device found, idVendo=
r=3D1d6b,
> > > idProduct=3D0002, bcdDevice=3D 5.13
> > > [=C2=A0=C2=A0=C2=A0 4.527211] usb usb1: New USB device strings: Mfr=
=3D3, Product=3D2,
> > > SerialNumber=3D1
> > > [=C2=A0=C2=A0=C2=A0 4.534557] usb usb1: Product: EHCI Host Controller
> > > [=C2=A0=C2=A0=C2=A0 4.539469] usb usb1: Manufacturer: Linux 5.13.6 eh=
ci_hcd
> > > [=C2=A0=C2=A0=C2=A0 4.544979] usb usb1: SerialNumber: ci_hdrc.1
> > > [=C2=A0=C2=A0=C2=A0 4.556250] hub 1-0:1.0: USB hub found
> > > [=C2=A0=C2=A0=C2=A0 4.560622] hub 1-0:1.0: 1 port detected
> > > [=C2=A0=C2=A0=C2=A0 4.590745] imx_thermal 20c8000.anatop:tempmon: Ind=
ustrial CPU
> > > temperature grade - max:105C critical:100C passive:95C
> > > [=C2=A0=C2=A0=C2=A0 4.861299] usb 1-1: new high-speed USB device numb=
er 2 using
> > > ci_hdrc
> > > [=C2=A0=C2=A0=C2=A0 5.064624] usb 1-1: New USB device found, idVendor=
=3D04b4,
> > > idProduct=3Dbd30, bcdDevice=3D 1.00
> > > [=C2=A0=C2=A0=C2=A0 5.073441] usb 1-1: New USB device strings: Mfr=3D=
0, Product=3D0,
> > > SerialNumber=3D0
> > > [=C2=A0=C2=A0=C2=A0 5.087382] hub 1-1:1.0: USB hub found
> > > [=C2=A0=C2=A0=C2=A0 5.091740] hub 1-1:1.0: 2 ports detected
> > > [=C2=A0=C2=A0=C2=A0 5.511390] usb 1-1.1: new high-speed USB device nu=
mber 3 using
> > > ci_hdrc
> > > [=C2=A0=C2=A0=C2=A0 5.664449] usb 1-1.1: New USB device found, idVend=
or=3D04b4,
> > > idProduct=3Dbd29, bcdDevice=3D 0.01
> > > [=C2=A0=C2=A0=C2=A0 5.673182] usb 1-1.1: New USB device strings: Mfr=
=3D1, Product=3D2,
> > > SerialNumber=3D3
> > > [=C2=A0=C2=A0=C2=A0 5.680706] usb 1-1.1: Product: Remote Download Wir=
eless Adapter
> > > [=C2=A0=C2=A0=C2=A0 5.687033] usb 1-1.1: Manufacturer: Cypress Semico=
nductor Corp.
> > > [=C2=A0=C2=A0=C2=A0 5.693268] usb 1-1.1: SerialNumber: 000000000001
> > > [=C2=A0=C2=A0=C2=A0 5.801394] usb 1-1.2: new high-speed USB device nu=
mber 4 using
> > > ci_hdrc
> > > [=C2=A0=C2=A0=C2=A0 5.955345] usb 1-1.2: New USB device found, idVend=
or=3D04b4,
> > > idProduct=3D640c, bcdDevice=3D 1.12
> > > [=C2=A0=C2=A0=C2=A0 5.964169] usb 1-1.2: New USB device strings: Mfr=
=3D1, Product=3D2,
> > > SerialNumber=3D3
> > > [=C2=A0=C2=A0=C2=A0 5.971823] usb 1-1.2: Product: BCM2045A0
> > > [=C2=A0=C2=A0=C2=A0 5.975900] usb 1-1.2: Manufacturer: Cypress Semico=
nductor Corp.
> > > [=C2=A0=C2=A0=C2=A0 5.982131] usb 1-1.2: SerialNumber: C0EE408051DF
> > > [=C2=A0=C2=A0 11.355278] mhi-pci-generic 0000:01:00.0: failed to powe=
r up MHI
> > > controller
> > > [=C2=A0=C2=A0 11.388118] mhi-pci-generic: probe of 0000:01:00.0 faile=
d with
> > > error
> > > -110
> >=20
> > Did you build MHI as builtin? maybe it's just a timeout issue, would
> > you be able to increase the timeout_ms value of the
> > mhi_controller_config in pci_generic from 8000ms to something like
> > 20000ms, just to be sure, I saw some modems taking a long to boot...
> >=20
> > Regards,
> > Loic
>=20
> As Loic suggested, I would just increase the timeout to 30 or 60
> seconds=20
> to
> be sure.
>=20

Thanks to both of you, to increase the timeout to 24000ms, in addition
to disabling the power management seems to correct the issue.

> You could also monitor changes in debugfs which can tell you what the
> registers read and get states at an interval of every second if you'd
> like.
>=20
> watch -n 1 cat /sys/kernel/debug/mhi/mhi0/states
> watch -n 1 cat /sys/kernel/debug/mhi/mhi0/regdump
>=20

root@target:~# cat /sys/kernel/debug/mhi/mhi0/states
PM state: M0 Device: Active MHI state: M0 EE: MISSION MODE wake: false
M0: 1 M2: 0 M3: 0 device wake: 0 pending packets: 0
root@target:~# cat /sys/kernel/debug/mhi/mhi0/regdump
Host PM state: M0 Device state: M0 EE: MISSION MODE
Device EE: MISSION MODE state: M0
MHI_REGLEN: 0x100
MHI_VER: 0x1000000
MHI_CFG: 0x2040080
MHI_CTRL: 0x200
MHI_STATUS: 0x201
MHI_WAKE_DB: 0x0
BHI_EXECENV: 0x2
BHI_STATUS: 0x0
BHI_ERRCODE: 0x0
BHI_ERRDBG1: 0x0
BHI_ERRDBG2: 0x0
BHI_ERRDBG3: 0x0

> You could start this after you load the kernel module to get most out
> of
> the debug rather than building as Y, just build as M as Loic
> suggested.

Really, thanks for helping and advising.

Best regards,
Thomas

>=20
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora=20
> Forum,
> a Linux Foundation Collaborative Project

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-3Ss3EvOvm+Ax7ISQgua3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmEJSCcACgkQn8ALBXH+
Cu2ehgv7BmzysWLAVVYvDCXiNL8kFWU+CV+i4Msscp65mtZlhhTIhAPEx26eOSL3
56VUJTLi/QJtlnB+VXRcEiXlMxfcbXrvWfn7d5OOKq6HOjl7GeklW9lXqCxGzZCG
PVC4Trj/GzlCSiv37CJL3lhZMdJdopUKS4PZh3FSJ1uVjcjqgiuLx7ZdrvrNlpNd
h/UAA7w+vPy+l7iY+eUJeXZnqprzMAu77DxrPKqXrbBQNYkPOVaAQEJ6qCiJRnI/
ON2VaXAHyUeds5dOGv5AflDJhhYKrKu97ksuabp2hsoA5UIXMN5pD8Bogao5qysz
Tzw0Gy1Zdc/QLbXWh84q2zrRwjBsEnlgWVsEdiedxRenDUXFCVkeghnrPW+M0uBU
hk0fLh3jZKsJkQVIvWv1Sgcfa0L96FkeYlSsEJJn4lrWlsgGjieb0CDcs1OzcqSq
pOA1URr1n49quKbhBxPWQO8YbTy7tKYYImy3kkA3/rFGnW+XRAUKzXYIZaVh7yp/
9AAZVtMr
=taS2
-----END PGP SIGNATURE-----

--=-3Ss3EvOvm+Ax7ISQgua3--

