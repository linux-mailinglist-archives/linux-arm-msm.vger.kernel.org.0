Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0EC2CC16A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 19:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbfJDRNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 13:13:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39170 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfJDRNf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 13:13:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so8137800wrj.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8vcxWX+wvvZNPY5OSK0N46ZL5d1k6JzEgPcDCrRhEEI=;
        b=wavMgowMByCMzC0AZllh1XdmCLKISuQdbmnpRAg69dZuaeCr4YIpBMlOaUdLvsnPWO
         dMH9dGfrRMjw8OE/fLuCaEpOV89mR7/T4KwYA9TAh6REidmrCge78Zjn8vlxlFRe2EtH
         WxZjdCiihgLDn8CGE8A8hIaWH+yGSdjPsdq6Zfkt6k+Q014Vgj8bLgPkcv50j8E4Avpp
         2CohRq4Jm0hpxt95DIm7Nw6ps+iGcpkG7RrU6JnegiqbmEtO14lOmZofjpRcUg+DC42/
         JGPlTrekaWZ92kQZCKXdaeOsZOW09oqyKyVQm24iwcNLMIzi5zzYQexgychq6y6U9IjD
         6TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8vcxWX+wvvZNPY5OSK0N46ZL5d1k6JzEgPcDCrRhEEI=;
        b=CR4HG+dt67OwmMHt4SdRegVH/HdFMyCoStXgO9gIZ4Hxj7e45c68V//XVHEUnLVL9T
         8KZpZU/J8Rw8HAO/KGVdHsojrXlJ9demKlvcE7AYQ5459Mn7YQwLI5cEPQX9HZx8QXUs
         Ux0Wsvum5zzMEnlEMrs1LapFWDXfLXOEKbZLioyQNY86f3MxVeIHcsDquI3ESTyRP2kg
         CH1oitDmiiSmzGRk5jKFl8UP3rqFdSWTdJiMsUs6v2I27xrm5jd7jspZLDHDvfJIHIZh
         GKR2BRmygw/hihhQT/5WftS/I5YtTf67cFmbpbQP2FxVENhDpR06Q6rHGA5SQrjlSArR
         6neg==
X-Gm-Message-State: APjAAAUROq+ibmD1rFzTGWMwFf4U83R4lW9byNFEuchcuUacIcxVSouQ
        Y9U2LCr8Mhr0tXdzY5zdaYrm1x52XKp1sxrLGg+b0Q==
X-Google-Smtp-Source: APXvYqyeQoUzqt8hmCcS178zS/GfvHYw9DBaPF0IRZW1g5lk7iffNHii5rgJPjLX+C+fQ3TVjco40zwnLcIDZejMn5A=
X-Received: by 2002:adf:ea88:: with SMTP id s8mr13226315wrm.114.1570209208520;
 Fri, 04 Oct 2019 10:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190301192017.39770-1-dianders@chromium.org> <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
 <5dce2964-8761-e7d0-8963-f0f5cb2feb02@arm.com> <CAJ+vNU0Q1-d7YDbAAEMqEcWnniqo6jLdKBbcUTar5=hJ+AC8vQ@mail.gmail.com>
 <1f6f7eb0-e1dc-d5a8-fb38-44c5bd839894@arm.com> <CAJ+vNU1Nd2p-ot2Qkj6vD9yD6gcYM-vm+snNWyt0ChgSqe4tBg@mail.gmail.com>
 <5cf9ec03-f6fb-8227-4ec5-62445038f283@arm.com>
In-Reply-To: <5cf9ec03-f6fb-8227-4ec5-62445038f283@arm.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 4 Oct 2019 10:13:16 -0700
Message-ID: <CAJ+vNU28LrroW-XC4X2g3bdN171j0ieZenhYE1TrEM8yvKi=cQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
To:     Robin Murphy <robin.murphy@arm.com>,
        Tirumalesh Chalamarla <tchalamarla@caviumnetworks.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-msm@vger.kernel.org, evgreen@chromium.org,
        tfiga@chromium.org, Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 4, 2019 at 9:36 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 04/10/2019 16:23, Tim Harvey wrote:
> > On Thu, Oct 3, 2019 at 3:24 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> On 2019-10-03 9:51 pm, Tim Harvey wrote:
> >>> On Thu, Oct 3, 2019 at 1:42 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>>>
> >>>> Hi Tim,
> >>>>
> >>>> On 2019-10-03 7:27 pm, Tim Harvey wrote:
> >>>>> On Fri, Mar 1, 2019 at 11:21 AM Douglas Anderson <dianders@chromium.org> wrote:
> >>>>>>
> >>>>>> If you're bisecting why your peripherals stopped working, it's
> >>>>>> probably this CL.  Specifically if you see this in your dmesg:
> >>>>>>      Unexpected global fault, this could be serious
> >>>>>> ...then it's almost certainly this CL.
> >>>>>>
> >>>>>> Running your IOMMU-enabled peripherals with the IOMMU in bypass mode
> >>>>>> is insecure and effectively disables the protection they provide.
> >>>>>> There are few reasons to allow unmatched stream bypass, and even fewer
> >>>>>> good ones.
> >>>>>>
> >>>>>> This patch starts the transition over to make it much harder to run
> >>>>>> your system insecurely.  Expected steps:
> >>>>>>
> >>>>>> 1. By default disable bypass (so anyone insecure will notice) but make
> >>>>>>       it easy for someone to re-enable bypass with just a KConfig change.
> >>>>>>       That's this patch.
> >>>>>>
> >>>>>> 2. After people have had a little time to come to grips with the fact
> >>>>>>       that they need to set their IOMMUs properly and have had time to
> >>>>>>       dig into how to do this, the KConfig will be eliminated and bypass
> >>>>>>       will simply be disabled.  Folks who are truly upset and still
> >>>>>>       haven't fixed their system can either figure out how to add
> >>>>>>       'arm-smmu.disable_bypass=n' to their command line or revert the
> >>>>>>       patch in their own private kernel.  Of course these folks will be
> >>>>>>       less secure.
> >>>>>>
> >>>>>> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> >>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>>> ---
> >>>>>
> >>>>> Hi Doug / Robin,
> >>>>>
> >>>>> I ran into this breaking things on OcteonTx boards based on CN80XX
> >>>>> CPU. The IOMMU configuration is a bit beyond me and I'm hoping you can
> >>>>> offer some advice. The IOMMU here is cavium,smmu-v2 as defined in
> >>>>> https://github.com/Gateworks/dts-newport/blob/master/cn81xx-linux.dtsi
> >>>>>
> >>>>> Booting with 'arm-smmu.disable_bypass=n' does indeed work around the
> >>>>> breakage as the commit suggests.
> >>>>>
> >>>>> Any suggestions for a proper fix?
> >>>>
> >>>> Ah, you're using the old "mmu-masters" binding (and in a way which isn't
> >>>> well-defined - it's never been specified what the stream ID argument(s)
> >>>> would mean for a PCI host bridge, and Linux just ignores them). The
> >>>> ideal thing would be to update the DT to generic "iommu-map" properties
> >>>> - it's been a long time since I last played with a ThunderX, but I
> >>>> believe the SMMU stream IDs should just be the same as the ITS device
> >>>> IDs (which is how the "mmu-masters" mapping would have played out anyway).
> >>>>
> >>>> The arm-smmu driver support for the old binding has always relied on
> >>>> implicit bypass - there are technical reasons why we can't realistically
> >>>> support the full functionality offered to the generic bindings, but it
> >>>> would be possible to add some degree of workaround to prevent it
> >>>> interacting quite so poorly with disable_bypass, if necessary. Do you
> >>>> have deployed systems with DTs that can't be updated, but still might
> >>>> need to run new kernels?
> >>>>
> >>>
> >>> Robin,
> >>>
> >>> Thanks for the response. I don't care too much about supporting new
> >>> kernels with the current DT - I'm good with fixing this with a DT
> >>> change. Would you be able to give me an example? I would love to see
> >>> Cavium mainline an cn81xx dts/dtsi in arch/arm64/boot/dts to be used
> >>> as a base as the only thing we have to go off of currently is the
> >>> Cavium SDK which has fairly old kernel support.
> >>
> >> No promises (it's a late-night hack from my sofa), but try giving this a
> >> go...
> >>
> >> Robin.
> >>
> >> ----->8-----
> >> diff --git a/cn81xx-linux.dtsi b/cn81xx-linux.dtsi
> >> index 3b759d9575fe..dabc9047c674 100644
> >> --- a/cn81xx-linux.dtsi
> >> +++ b/cn81xx-linux.dtsi
> >> @@ -234,7 +234,7 @@
> >>                          clocks = <&sclk>;
> >>                  };
> >>
> >> -               smmu0@830000000000 {
> >> +               smmu: smmu0@830000000000 {
> >>                          compatible = "cavium,smmu-v2";
> >>                          reg = <0x8300 0x0 0x0 0x2000000>;
> >>                          #global-interrupts = <1>;
> >> @@ -249,23 +249,18 @@
> >>                                       <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>,
> >>                                       <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>,
> >>                                       <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>;
> >> -
> >> -                       mmu-masters = <&ecam0 0x100>,
> >> -                                     <&pem0  0x200>,
> >> -                                     <&pem1  0x300>,
> >> -                                     <&pem2  0x400>;
> >> -
> >> +                       #iommu-cells = <1>;
> >> +                       dma-coherent;
> >>                  };
> >>
> >>                  ecam0: pci@848000000000 {
> >>                          compatible = "pci-host-ecam-generic";
> >>                          device_type = "pci";
> >> -                       msi-parent = <&its>;
> >>                          msi-map = <0 &its 0 0x10000>;
> >> +                       iommu-map = <0 &smmu 0 0x10000>;
> >>                          bus-range = <0 31>;
> >>                          #size-cells = <2>;
> >>                          #address-cells = <3>;
> >> -                       #stream-id-cells = <1>;
> >>                          u-boot,dm-pre-reloc;
> >>                          dma-coherent;
> >>                          reg = <0x8480 0x00000000 0 0x02000000>;  /* Configuration space */
> >> @@ -399,12 +394,11 @@
> >>
> >>                          compatible = "cavium,pci-host-thunder-pem";
> >>                          device_type = "pci";
> >> -                       msi-parent = <&its>;
> >>                          msi-map = <0 &its 0 0x10000>;
> >> +                       iommu-map = <0 &smmu 0 0x10000>;
> >>                          bus-range = <0x1f 0x57>;
> >>                          #size-cells = <2>;
> >>                          #address-cells = <3>;
> >> -                       #stream-id-cells = <1>;
> >>                          dma-coherent;
> >>                          reg = <0x8800 0x1f000000 0x0 0x39000000>,  /* Configuration space */
> >>                                  <0x87e0 0xc0000000 0x0 0x01000000>; /* PEM space */
> >> @@ -424,12 +418,11 @@
> >>                  pem1: pci@87e0c1000000 {
> >>                          compatible = "cavium,pci-host-thunder-pem";
> >>                          device_type = "pci";
> >> -                       msi-parent = <&its>;
> >>                          msi-map = <0 &its 0 0x10000>;
> >> +                       iommu-map = <0 &smmu 0 0x10000>;
> >>                          bus-range = <0x57 0x8f>;
> >>                          #size-cells = <2>;
> >>                          #address-cells = <3>;
> >> -                       #stream-id-cells = <1>;
> >>                          dma-coherent;
> >>                          reg = <0x8840 0x57000000 0x0 0x39000000>,  /* Configuration space */
> >>                                  <0x87e0 0xc1000000 0x0 0x01000000>; /* PEM space */
> >> @@ -449,12 +442,11 @@
> >>                  pem2: pci@87e0c2000000 {
> >>                          compatible = "cavium,pci-host-thunder-pem";
> >>                          device_type = "pci";
> >> -                       msi-parent = <&its>;
> >>                          msi-map = <0 &its 0 0x10000>;
> >> +                       iommu-map = <0 &smmu 0 0x10000>;
> >>                          bus-range = <0x8f 0xc7>;
> >>                          #size-cells = <2>;
> >>                          #address-cells = <3>;
> >> -                       #stream-id-cells = <1>;
> >>                          dma-coherent;
> >>                          reg = <0x8880 0x8f000000 0x0 0x39000000>,  /* Configuration space */
> >>                                  <0x87e0 0xc2000000 0x0 0x01000000>; /* PEM space */
> >
> > Robin,
> >
> > No difference... still need 'arm-smmu.disable_bypass=n' to boot. Are
> > all four iommu-map props above supposed to be the same? Seems to me
> > they all point to the same thing which looks wrong.
>
> Hmm... :/
>
> Those mappings just set Stream ID == PCI RID (strictly each one should
> only need to cover the bus range assigned to that bridge, but it's not
> crucial) which is the same thing the driver assumes for the mmu-masters
> property, so either that's wrong and never could have worked anyway -
> have you tried VFIO on this platform? - or there are other devices also
> mastering through the SMMU that aren't described at all. Are you able to
> capture a boot log? The SMMU faults do encode information about the
> offending ID, and you can typically correlate their appearance
> reasonably well with endpoint drivers probing.
>

Robin,

VFIO is enabled in the kernel but I don't know anything about how to
test/use it:
$ grep VFIO .config
CONFIG_KVM_VFIO=y
CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PLATFORM is not set
# CONFIG_VFIO_MDEV is not set

I do have a boot console yet I'm not seeing any smmu faults at all.
Perhaps I've mis-diagnosed the issue completely. To be clear when I
boot with arm-smmu.disable_bypass=y the serial console appears to not
accept input in userspace and with arm-smmu.disable_bypass=n I'm fine.
I'm using a buildroot initramfs rootfs for simplicity. The system
isn't hung as I originally expected as the LED heartbeat trigger
continues blinking... I just can't get console to accept input.

Here's my kernel log:
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x430f0a22]
[    0.000000] Linux version 5.3.0 (tharvey@tharvey) (gcc version
6.2.0 (Cavium Inc. Version 2.1 build 97)) #389 SMP PREEMPT Fri Oct 4
10:02:29 PDT 2019
[    0.000000] Machine model: Gateworks Newport CN80XX GW6300
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 64 MiB at 0x000000003b000000
[    0.000000] NUMA: NODE_DATA [mem 0x3adf1840-0x3adf2fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000000500000-0x000000003effffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000500000-0x000000003effffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000500000-0x000000003effffff]
[    0.000000] On node 0 totalpages: 256768
[    0.000000]   DMA32 zone: 4012 pages used for memmap
[    0.000000]   DMA32 zone: 0 pages reserved
[    0.000000]   DMA32 zone: 256768 pages, LIFO batch:63
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS resident on physical CPU 0x0
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 23 pages/cpu s56728 r8192 d29288 u94208
[    0.000000] pcpu-alloc: s56728 r8192 d29288 u94208 alloc=23*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Cavium erratum 30115
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 252756
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: cma=64M coherent_pool=16M
net.ifnames=0 arm-smmu.disable_bypass=y debug
[    0.000000] Dentry cache hash table entries: 131072 (order: 8,
1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 911208K/1027072K available (11772K kernel code,
1792K rwdata, 6032K rodata, 9920K init, 450K bss, 50328K reserved,
65536K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=2.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: no VLPI support, direct LPI support
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000801080000000
[    0.000000] ITS [mem 0x801000020000-0x80100021ffff]
[    0.000000] ITS@0x0000801000020000: Devices Table too large, reduce
ids 21->19
[    0.000000] ITS@0x0000801000020000: allocated 524288 Devices
@39000000 (flat, esz 8, psz 64K, shr 1)
[    0.000000] GICv3: using LPI property table @0x0000000000530000
[    0.000000] GICv3: CPU0: using allocated LPI pending table
@0x0000000000540000
[    0.000000] random: get_random_bytes called from
start_kernel+0x300/0x4a0 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 100.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
[    0.000005] sched_clock: 56 bits at 100MHz, resolution 10ns, wraps
every 4398046511100ns
[    0.000477] Console: colour dummy device 80x25
[    0.001361] printk: console [tty0] enabled
[    0.001459] Calibrating delay loop (skipped), value calculated
using timer frequency.. 200.00 BogoMIPS (lpj=400000)
[    0.001496] pid_max: default: 32768 minimum: 301
[    0.001611] LSM: Security Framework initializing
[    0.001687] Mount-cache hash table entries: 2048 (order: 2, 16384
bytes, linear)
[    0.001718] Mountpoint-cache hash table entries: 2048 (order: 2,
16384 bytes, linear)
[    0.024071] ASID allocator initialised with 32768 entries
[    0.032063] rcu: Hierarchical SRCU implementation.
[    0.040139] Platform MSI: gic-its@801000020000 domain created
[    0.040236] PCI/MSI:
/interrupt-controller@801000000000/gic-its@801000020000 domain created
[    0.041180] EFI services will not be available.
[    0.048110] smp: Bringing up secondary CPUs ...
[    0.081524] Detected VIPT I-cache on CPU1
[    0.081548] GICv3: CPU1: found redistributor 1 region 0:0x0000801080020000
[    0.081562] GICv3: CPU1: using allocated LPI pending table
@0x0000000000550000
[    0.081599] CPU1: Booted secondary processor 0x0000000001 [0x430f0a22]
[    0.081746] smp: Brought up 1 node, 2 CPUs
[    0.081833] SMP: Total of 2 processors activated.
[    0.081856] CPU features: detected: Data cache clean to the PoU not
required for I/D coherence
[    0.081882] CPU features: detected: CRC32 instructions
[    0.100883] CPU: All CPU(s) started at EL2
[    0.100948] alternatives: patching kernel code
[    0.102458] devtmpfs: initialized
[    0.106577] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.106625] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.109108] pinctrl core: initialized pinctrl subsystem
[    0.110372] DMI not present or invalid.
[    0.110839] NET: Registered protocol family 16
[    0.111292] audit: initializing netlink subsys (disabled)
[    0.111501] audit: type=2000 audit(0.092:1): state=initialized
audit_enabled=0 res=1
[    0.112711] cpuidle: using governor menu
[    0.113050] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.118415] DMA: preallocated 16384 KiB pool for atomic allocations
[    0.119754] Serial: AMBA PL011 UART driver
[    0.122242] 87e028000000.serial: ttyAMA0 at MMIO 0x87e028000000
(irq = 7, base_baud = 0) is a PL011 rev3
[    0.682802] printk: console [ttyAMA0] enabled
[    0.687966] 87e029000000.serial: ttyAMA1 at MMIO 0x87e029000000
(irq = 8, base_baud = 0) is a PL011 rev3
[    0.698195] 87e02a000000.serial: ttyAMA2 at MMIO 0x87e02a000000
(irq = 9, base_baud = 0) is a PL011 rev3
[    0.708412] 87e02b000000.serial: ttyAMA3 at MMIO 0x87e02b000000
(irq = 10, base_baud = 0) is a PL011 rev3
[    0.735587] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.742336] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.749066] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.755790] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.765490] cryptd: max_cpu_qlen set to 1000
[    0.775075] ACPI: Interpreter disabled.
[    0.780532] vgaarb: loaded
[    0.783884] SCSI subsystem initialized
[    0.787855] libata version 3.00 loaded.
[    0.792032] usbcore: registered new interface driver usbfs
[    0.797607] usbcore: registered new interface driver hub
[    0.803015] usbcore: registered new device driver usb
[    0.808652] pps_core: LinuxPPS API ver. 1 registered
[    0.813669] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.822846] PTP clock support registered
[    0.826901] EDAC MC: Ver: 3.0.0
[    0.831097] FPGA manager framework
[    0.834610] Advanced Linux Sound Architecture Driver Initialized.
[    0.841585] clocksource: Switched to clocksource arch_sys_counter
[    0.847926] VFS: Disk quotas dquot_6.6.0
[    0.851952] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.859086] pnp: PnP ACPI: disabled
[    0.871006] thermal_sys: Registered thermal governor 'step_wise'
[    0.871011] thermal_sys: Registered thermal governor 'power_allocator'
[    0.877274] NET: Registered protocol family 2
[    0.888632] tcp_listen_portaddr_hash hash table entries: 512
(order: 1, 8192 bytes, linear)
[    0.897065] TCP established hash table entries: 8192 (order: 4,
65536 bytes, linear)
[    0.904943] TCP bind hash table entries: 8192 (order: 5, 131072
bytes, linear)
[    0.912315] TCP: Hash tables configured (established 8192 bind 8192)
[    0.918773] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.925449] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.932681] NET: Registered protocol family 1
[    0.937649] RPC: Registered named UNIX socket transport module.
[    0.943612] RPC: Registered udp transport module.
[    0.948338] RPC: Registered tcp transport module.
[    0.953057] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.959522] PCI: CLS 0 bytes, default 64
[    3.473305] hw perfevents: enabled with armv8_cavium_thunder PMU
driver, 7 counters available
[    3.482035] kvm [1]: IPA Size Limit: 48bits
[    3.487560] kvm [1]: GICv3: no GICV resource entry
[    3.492383] kvm [1]: disabling GICv2 emulation
[    3.496845] kvm [1]: GICv3 sysreg trapping enabled ([G0G1], reduced
performance)
[    3.504284] kvm [1]: GIC system register CPU interface enabled
[    3.510202] kvm [1]: vgic interrupt IRQ1
[    3.514276] kvm [1]: Hyp mode initialized successfully
[    3.575927] Initialise system trusted keyrings
[    3.580620] workingset: timestamp_bits=44 max_order=18 bucket_order=0
[    3.597305] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    3.604222] NFS: Registering the id_resolver key type
[    3.609341] Key type id_resolver registered
[    3.613562] Key type id_legacy registered
[    3.617602] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    3.624518] 9p: Installing v9fs 9p2000 file system support
[    3.652630] Key type asymmetric registered
[    3.656770] Asymmetric key parser 'x509' registered
[    3.661715] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 245)
[    3.669137] io scheduler mq-deadline registered
[    3.673682] io scheduler kyber registered
[    3.685223] pci-host-generic 848000000000.pci: host bridge
/soc@0/pci@848000000000 ranges:
[    3.693573] pci-host-generic 848000000000.pci:   MEM
0x801000000000..0x808fffffffff -> 0x801000000000
[    3.702910] pci-host-generic 848000000000.pci:   MEM
0x810000000000..0x817fffffffff -> 0x810000000000
[    3.712195] pci-host-generic 848000000000.pci:   MEM
0x868000000000..0x87e027ffffff -> 0x868000000000
[    3.721469] pci-host-generic 848000000000.pci:   MEM
0x87e02c000000..0x87e0bfffffff -> 0x87e02c000000
[    3.730745] pci-host-generic 848000000000.pci:   MEM
0x840000000000..0x840fffffffff -> 0x840000000000
[    3.740021] pci-host-generic 848000000000.pci:   MEM
0x843000000000..0x8431ffffffff -> 0x843000000000
[    3.749284] pci-host-generic 848000000000.pci:   MEM
0x87e0c6000000..0x87ffffffffff -> 0x87e0c6000000
[    3.758618] pci-host-generic 848000000000.pci: ECAM at [mem
0x848000000000-0x848001ffffff] for [bus 00-1f]
[    3.768473] pci-host-generic 848000000000.pci: PCI host bridge to bus 0000:00
[    3.775644] pci_bus 0000:00: root bus resource [bus 00-1f]
[    3.781154] pci_bus 0000:00: root bus resource [mem
0x801000000000-0x808fffffffff]
[    3.788750] pci_bus 0000:00: root bus resource [mem
0x810000000000-0x817fffffffff]
[    3.796345] pci_bus 0000:00: root bus resource [mem
0x868000000000-0x87e027ffffff]
[    3.803943] pci_bus 0000:00: root bus resource [mem
0x87e02c000000-0x87e0bfffffff]
[    3.811551] pci_bus 0000:00: root bus resource [mem
0x840000000000-0x840fffffffff]
[    3.819148] pci_bus 0000:00: root bus resource [mem
0x843000000000-0x8431ffffffff]
[    3.826741] pci_bus 0000:00: root bus resource [mem
0x87e0c6000000-0x87ffffffffff]
[    3.834416] pci 0000:00:01.0: [177d:a002] type 01 class 0x060400
[    3.840942] pci 0000:00:06.0: [177d:a00a] type 00 class 0x088000
[    3.847043] pci 0000:00:06.0: BAR 0: [mem
0x803000000000-0x8030007fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.858035] pci 0000:00:06.0: BAR 4: [mem
0x803000f00000-0x803000ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.869284] pci 0000:00:07.0: [177d:a00b] type 00 class 0x088000
[    3.875378] pci 0000:00:07.0: BAR 0: [mem
0x804000000000-0x8040007fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.886372] pci 0000:00:07.0: BAR 4: [mem
0x804000f00000-0x804000ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.897682] pci 0000:00:08.0: [177d:a00c] type 00 class 0x088000
[    3.903786] pci 0000:00:08.0: BAR 0: [mem
0x807000000000-0x8070000fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.914790] pci 0000:00:08.0: BAR 4: [mem
0x807000f00000-0x807000ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.926039] pci 0000:00:09.0: [177d:a002] type 01 class 0x060400
[    3.932382] pci 0000:00:0a.0: [177d:a002] type 01 class 0x060400
[    3.938716] pci 0000:00:0b.0: [177d:a04f] type 00 class 0x058000
[    3.944810] pci 0000:00:0b.0: BAR 0: [mem
0x808000000000-0x8080000fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.955806] pci 0000:00:0b.0: BAR 4: [mem
0x808000f00000-0x808000ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.967066] pci 0000:00:0c.0: [177d:a002] type 01 class 0x060400
[    3.973407] pci 0000:00:0d.0: [177d:a04e] type 00 class 0x0c8000
[    3.979505] pci 0000:00:0d.0: BAR 0: [mem
0x806000000000-0x8060007fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    3.990497] pci 0000:00:0d.0: BAR 4: [mem
0x806000f00000-0x806000ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.001772] pci 0000:00:0e.0: [177d:a015] type 00 class 0x088000
[    4.007869] pci 0000:00:0e.0: BAR 0: [mem
0x874000000000-0x874001ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.018863] pci 0000:00:0e.0: BAR 4: [mem
0x874010000000-0x8740100fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.030105] pci 0000:00:0f.0: [177d:a002] type 01 class 0x060400
[    4.036460] pci 0000:00:10.0: [177d:a055] type 00 class 0x0c0330
[    4.042560] pci 0000:00:10.0: BAR 0: [mem
0x868000000000-0x8680001fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.053554] pci 0000:00:10.0: BAR 4: [mem
0x868000200000-0x8680002fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.064800] pci 0000:00:11.0: [177d:a055] type 00 class 0x0c0330
[    4.070900] pci 0000:00:11.0: BAR 0: [mem
0x869000000000-0x8690001fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.081895] pci 0000:00:11.0: BAR 4: [mem
0x869000200000-0x8690002fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.093827] pci 0000:01:00.0: [177d:a001] type 00 class 0x088000
[    4.099927] pci 0000:01:00.0: BAR 0: [mem
0x87e0fc000000-0x87e0fc0fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.110924] pci 0000:01:00.0: BAR 4: [mem
0x87e0fcf00000-0x87e0fcffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.122149] pci 0000:01:00.1: [177d:a00e] type 00 class 0x088000
[    4.128249] pci 0000:01:00.1: BAR 0: [mem
0x87e006000000-0x87e0067fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.139243] pci 0000:01:00.1: BAR 4: [mem
0x87e006f00000-0x87e006ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.150448] pci 0000:01:01.3: [177d:a02b] type 00 class 0x0c8000
[    4.156545] pci 0000:01:01.3: BAR 0: [mem
0x87e005000000-0x87e0057fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.167762] pci 0000:01:01.4: [177d:a010] type 00 class 0x058000
[    4.173859] pci 0000:01:01.4: BAR 0: [mem
0x87e009000000-0x87e0097fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.184853] pci 0000:01:01.4: BAR 4: [mem
0x87e009f00000-0x87e009ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.196080] pci 0000:01:01.7: [177d:a035] type 00 class 0x088000
[    4.202177] pci 0000:01:01.7: BAR 0: [mem
0x87e001000000-0x87e0017fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.213170] pci 0000:01:01.7: BAR 2: [mem
0x800000000000-0x8000ffffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.224168] pci 0000:01:01.7: BAR 4: [mem
0x87e001f00000-0x87e001ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.235389] pci 0000:01:02.0: [177d:a056] type 00 class 0x088000
[    4.241490] pci 0000:01:02.0: BAR 0: [mem
0x87e0db000000-0x87e0db0fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.252484] pci 0000:01:02.0: BAR 4: [mem
0x87e0dbf00000-0x87e0dbffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.263704] pci 0000:01:06.0: [177d:a02e] type 00 class 0x058000
[    4.269801] pci 0000:01:06.0: BAR 0: [mem
0x87e050000000-0x87e0507fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.280795] pci 0000:01:06.0: BAR 4: [mem
0x87e050f00000-0x87e050ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.292017] pci 0000:01:07.0: [177d:a02f] type 00 class 0x058000
[    4.298116] pci 0000:01:07.0: BAR 0: [mem
0x87e058000000-0x87e0587fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.309110] pci 0000:01:07.0: BAR 4: [mem
0x87e058f00000-0x87e058ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.320327] pci 0000:01:07.4: [177d:a030] type 00 class 0x058000
[    4.326424] pci 0000:01:07.4: BAR 0: [mem
0x87e05c000000-0x87e05c7fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.337417] pci 0000:01:07.4: BAR 4: [mem
0x87e05cf00000-0x87e05cffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.348621] pci 0000:01:09.0: [177d:a012] type 00 class 0x0c8000
[    4.354725] pci 0000:01:09.0: BAR 0: [mem
0x87e0d0000000-0x87e0d07fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.365721] pci 0000:01:09.0: BAR 4: [mem
0x87e0d0f00000-0x87e0d0ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.376971] pci 0000:01:09.1: [177d:a012] type 00 class 0x0c8000
[    4.383069] pci 0000:01:09.1: BAR 0: [mem
0x87e0d1000000-0x87e0d17fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.394063] pci 0000:01:09.1: BAR 4: [mem
0x87e0d1f00000-0x87e0d1ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.405291] pci 0000:01:0a.0: [177d:a022] type 00 class 0x058000
[    4.411389] pci 0000:01:0a.0: BAR 0: [mem
0x87e088000000-0x87e0887fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.422384] pci 0000:01:0a.0: BAR 4: [mem
0x87e088f00000-0x87e088ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.433625] pci 0000:01:0c.0: [177d:a023] type 00 class 0x088000
[    4.439718] pci 0000:01:0c.0: BAR 0: [mem
0x87e0a8000000-0x87e0a87fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.450713] pci 0000:01:0c.0: BAR 4: [mem
0x87e0a8f00000-0x87e0a8ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.461937] pci 0000:01:0c.1: [177d:a023] type 00 class 0x088000
[    4.468035] pci 0000:01:0c.1: BAR 0: [mem
0x87e0a9000000-0x87e0a97fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.479030] pci 0000:01:0c.1: BAR 4: [mem
0x87e0a9f00000-0x87e0a9ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.490252] pci 0000:01:10.0: [177d:a026] type 00 class 0x028000
[    4.496349] pci 0000:01:10.0: BAR 0: [mem
0x87e0e0000000-0x87e0e03fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.507343] pci 0000:01:10.0: BAR 4: [mem
0x87e0e0400000-0x87e0e07fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.518577] pci 0000:01:12.0: [177d:a054] type 00 class 0x028000
[    4.524676] pci 0000:01:12.0: BAR 0: [mem
0x87e0e8000000-0x87e0e83fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.535671] pci 0000:01:12.0: BAR 4: [mem
0x87e0e8400000-0x87e0e87fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.547998] pci_bus 0000:01: busn_res: [bus 01-1f] end is updated to 01
[    4.554772] pci 0000:02:00.0: [177d:a018] type 00 class 0x120000
[    4.560871] pci 0000:02:00.0: BAR 0: [mem
0x87e040000000-0x87e0400fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    4.571866] pci 0000:02:00.0: VF BAR 0: [mem
0x840000800000-0x8400008fffff 64bit] (from Enhanced Allocation,
properties 0x4)
[    5.589648] pci 0000:02:00.0: VF(n) BAR0 space: [mem
0x840000800000-0x8400008fffff 64bit] (contains BAR0 for 1 VFs)
[    5.601442] pci_bus 0000:02: busn_res: [bus 02-1f] end is updated to 02
[    5.608217] pci 0000:03:00.0: [177d:a043] type 00 class 0x058000
[    5.614315] pci 0000:03:00.0: BAR 0: [mem
0x871000000000-0x8710000fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    5.625310] pci 0000:03:00.0: BAR 4: [mem
0x871000f00000-0x871000ffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    5.636300] pci 0000:03:00.0: VF BAR 0: [mem
0x871001000000-0x8710010fffff 64bit] (from Enhanced Allocation,
properties 0x4)
[    6.677613] pci 0000:03:00.0: VF(n) BAR0 space: [mem
0x871001000000-0x8710010fffff 64bit] (contains BAR0 for 1 VFs)
[    6.689409] pci_bus 0000:03: busn_res: [bus 03-1f] end is updated to 03
[    6.696185] pci 0000:04:00.0: [177d:a040] type 00 class 0x108000
[    6.702285] pci 0000:04:00.0: BAR 0: [mem
0x872000000000-0x87200fffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    6.713280] pci 0000:04:00.0: BAR 4: [mem
0x872010000000-0x8720100fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    6.724270] pci 0000:04:00.0: VF BAR 0: [mem
0x872020000000-0x8720200fffff 64bit] (from Enhanced Allocation,
properties 0x4)
[    6.735522] pci 0000:04:00.0: VF BAR 4: [mem
0x872030000000-0x8720300fffff 64bit] (from Enhanced Allocation,
properties 0x4)
[    7.765639] pci 0000:04:00.0: VF(n) BAR0 space: [mem
0x872020000000-0x872020ffffff 64bit] (contains BAR0 for 16 VFs)
[    7.776212] pci 0000:04:00.0: VF(n) BAR4 space: [mem
0x872030000000-0x872030ffffff 64bit] (contains BAR4 for 16 VFs)
[    7.788095] pci_bus 0000:04: busn_res: [bus 04-1f] end is updated to 04
[    7.794871] pci 0000:05:00.0: [177d:a01e] type 00 class 0x020000
[    7.800971] pci 0000:05:00.0: BAR 0: [mem
0x843000000000-0x84303fffffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    7.811966] pci 0000:05:00.0: BAR 4: [mem
0x843060000000-0x8430600fffff 64bit] (from Enhanced Allocation,
properties 0x0)
[    7.822957] pci 0000:05:00.0: VF BAR 0: [mem
0x8430a0000000-0x8430a01fffff 64bit] (from Enhanced Allocation,
properties 0x4)
[    7.834208] pci 0000:05:00.0: VF BAR 4: [mem
0x8430e0000000-0x8430e01fffff 64bit] (from Enhanced Allocation,
properties 0x4)
[    8.853611] pci 0000:05:00.0: VF(n) BAR0 space: [mem
0x8430a0000000-0x8430a0ffffff 64bit] (contains BAR0 for 8 VFs)
[    8.864095] pci 0000:05:00.0: VF(n) BAR4 space: [mem
0x8430e0000000-0x8430e0ffffff 64bit] (contains BAR4 for 8 VFs)
[    8.875884] pci_bus 0000:05: busn_res: [bus 05-1f] end is updated to 05
[    8.882619] pci 0000:00:01.0: PCI bridge to [bus 01]
[    8.887659] pci 0000:00:09.0: PCI bridge to [bus 02]
[    8.892659] pci 0000:00:0a.0: PCI bridge to [bus 03]
[    8.897658] pci 0000:00:0c.0: PCI bridge to [bus 04]
[    8.902660] pci 0000:00:0f.0: PCI bridge to [bus 05]
[    8.909932] EINJ: ACPI disabled.
[    8.924686] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    8.933841] SuperH (H)SCI(F) driver initialized
[    8.938871] msm_serial: driver initialized
[    8.944656] arm-smmu 830000000000.smmu0: probing hardware configuration...
[    8.951569] arm-smmu 830000000000.smmu0: SMMUv2 with:
[    8.956637] arm-smmu 830000000000.smmu0:     stage 1 translation
[    8.962400] arm-smmu 830000000000.smmu0:     stage 2 translation
[    8.968162] arm-smmu 830000000000.smmu0:     nested translation
[    8.973838] arm-smmu 830000000000.smmu0:     coherent table walk
[    8.979602] arm-smmu 830000000000.smmu0:     stream matching with
128 register groups
[    8.987198] arm-smmu 830000000000.smmu0:     64 context banks (0
stage-2 only)
[    8.994179] arm-smmu 830000000000.smmu0:     enabling workaround
for Cavium erratum 27704
[    9.002120] arm-smmu 830000000000.smmu0:     Supported page sizes: 0x62215000
[    9.009014] arm-smmu 830000000000.smmu0:     Stage-1: 48-bit VA -> 48-bit IPA
[    9.015907] arm-smmu 830000000000.smmu0:     Stage-2: 48-bit IPA -> 48-bit PA
[    9.031844] loop: module loaded
[    9.039648] mdio_thunder 0000:01:01.3: Adding to iommu group 0
[    9.045966] libphy: mdio_thunder: probed
[    9.052337] mdio_thunder 0000:01:01.3: Added bus at 87e005003800
[    9.058552] libphy: mdio_thunder: probed
[    9.064728] mdio_thunder 0000:01:01.3: Added bus at 87e005003880
[    9.071696] libphy: Fixed MDIO Bus: probed
[    9.076268] tun: Universal TUN/TAP device driver, 1.6
[    9.082220] thunder_xcv, ver 1.0
[    9.085782] thunder_xcv 0000:01:02.0: Adding to iommu group 1
[    9.091860] thunder_bgx, ver 1.0
[    9.095402] thunder_bgx 0000:01:10.0: Adding to iommu group 2
[    9.101351] thunder_bgx 0000:01:10.0: BGX0 LMAC0 mode: SGMII
[    9.127852] thunder_bgx 0000:01:12.0: Adding to iommu group 3
[    9.165602] thunder_bgx 0000:01:12.0: BGX2 QLM mode: RGMII
[    9.171607] nicpf, ver 1.0
[    9.174554] nicpf 0000:05:00.0: Adding to iommu group 4
[    9.285640] pci 0000:05:00.1: [177d:a034] type 00 class 0x020000
[    9.292018] pci 0000:05:00.2: [177d:a034] type 00 class 0x020000
[    9.298363] nicpf 0000:05:00.0: SRIOV enabled, number of VF available 2
[    9.305751] hclge is initializing
[    9.309075] hns3: Hisilicon Ethernet Network Driver for Hip08
Family - version
[    9.316324] hns3: Copyright (c) 2017 Huawei Corporation.
[    9.321789] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    9.327650] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    9.333699] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.0-k
[    9.340683] igb: Copyright (c) 2007-2014 Intel Corporation.
[    9.346371] igbvf: Intel(R) Gigabit Virtual Function Network Driver
- version 2.4.0-k
[    9.354226] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    9.360571] sky2: driver version 1.30
[    9.365100] VFIO - User Level meta-driver version: 0.3
[    9.372053] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    9.378632] ehci-pci: EHCI PCI platform driver
[    9.383198] ehci-platform: EHCI generic platform driver
[    9.388568] ehci-orion: EHCI orion driver
[    9.392705] ehci-exynos: EHCI EXYNOS driver
[    9.397006] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    9.403227] ohci-pci: OHCI PCI platform driver
[    9.407788] ohci-platform: OHCI generic platform driver
[    9.413159] ohci-exynos: OHCI EXYNOS driver
[    9.417722] xhci_hcd 0000:00:10.0: Adding to iommu group 5
[    9.423510] xhci_hcd 0000:00:10.0: xHCI Host Controller
[    9.428800] xhci_hcd 0000:00:10.0: new USB bus registered, assigned
bus number 1
[    9.436420] xhci_hcd 0000:00:10.0: hcc params 0x0220f665 hci
version 0x100 quirks 0x0000000000000010
[    9.445600] xhci_hcd 0000:00:10.0: cache line size of 64 is not supported
[    9.453538] hub 1-0:1.0: USB hub found
[    9.457361] hub 1-0:1.0: 1 port detected
[    9.461752] xhci_hcd 0000:00:10.0: xHCI Host Controller
[    9.467017] xhci_hcd 0000:00:10.0: new USB bus registered, assigned
bus number 2
[    9.474449] xhci_hcd 0000:00:10.0: Host supports USB 3.0 SuperSpeed
[    9.480827] usb usb2: We don't know the algorithms for LPM for this
host, disabling LPM.
[    9.489639] hub 2-0:1.0: USB hub found
[    9.493434] hub 2-0:1.0: 1 port detected
[    9.497982] xhci_hcd 0000:00:11.0: Adding to iommu group 6
[    9.503673] xhci_hcd 0000:00:11.0: xHCI Host Controller
[    9.508952] xhci_hcd 0000:00:11.0: new USB bus registered, assigned
bus number 3
[    9.516552] xhci_hcd 0000:00:11.0: hcc params 0x0220f665 hci
version 0x100 quirks 0x0000000000000010
[    9.525728] xhci_hcd 0000:00:11.0: cache line size of 64 is not supported
[    9.533613] hub 3-0:1.0: USB hub found
[    9.537406] hub 3-0:1.0: 1 port detected
[    9.541798] xhci_hcd 0000:00:11.0: xHCI Host Controller
[    9.547090] xhci_hcd 0000:00:11.0: new USB bus registered, assigned
bus number 4
[    9.554529] xhci_hcd 0000:00:11.0: Host supports USB 3.0 SuperSpeed
[    9.560884] usb usb4: We don't know the algorithms for LPM for this
host, disabling LPM.
[    9.569691] hub 4-0:1.0: USB hub found
[    9.573488] hub 4-0:1.0: 1 port detected
[    9.578415] usbcore: registered new interface driver usb-storage
[    9.587664] i2c /dev entries driver
[    9.596296] sdhci: Secure Digital Host Controller Interface driver
[    9.602514] sdhci: Copyright(c) Pierre Ossman
[    9.607362] Synopsys Designware Multimedia Card Interface Driver
[    9.614341] sdhci-pltfm: SDHCI platform and OF driver helper
[    9.621617] ledtrig-cpu: registered to indicate activity on CPUs
[    9.629351] usbcore: registered new interface driver usbhid
[    9.634955] usbhid: USB HID core driver
[    9.642878] NET: Registered protocol family 17
[    9.647581] 9pnet: Installing 9P2000 support
[    9.651932] Key type dns_resolver registered
[    9.657029] registered taskstats version 1
[    9.661169] Loading compiled-in X.509 certificates
[    9.668687] pcieport 0000:00:01.0: Adding to iommu group 7
[    9.674920] pcieport 0000:00:09.0: Adding to iommu group 8
[    9.680831] pcieport 0000:00:0a.0: Adding to iommu group 9
[    9.686785] pcieport 0000:00:0c.0: Adding to iommu group 10
[    9.692804] pcieport 0000:00:0f.0: Adding to iommu group 11
[    9.702958] irq: no irq domain found for gsc@20 !
[    9.707742] irq: no irq domain found for gsc@20 !
[    9.712484] irq: no irq domain found for gsc@20 !
[    9.717226] irq: no irq domain found for gsc@20 !
[    9.721967] irq: no irq domain found for gsc@20 !
[    9.726748] gpio-keys gpio_keys: Found button without gpio or irq
[    9.732884] gpio-keys: probe of gpio_keys failed with error -22
[    9.738873] hctosys: unable to open rtc device (rtc0)
[    9.744119] ALSA device list:
[    9.747118]   No soundcards found.
[    9.750679] uart-pl011 87e028000000.serial: no DMA platform data
[    9.761032] Freeing unused kernel memory: 9920K
[    9.765773] Run /init as init process
Starting logging: [    9.801825] usb 1-1: new high-speed USB device
number 2 using xhci_hcd
OK
Initializing random number genera[    9.826920] random: dd:
uninitialized urandom read (512 bytes read)
tor... done.
Starting network: OK

Welcome to Buildroot
buildroot[   10.024991] hub 1-1:1.0: USB hub found
[   10.028861] hub 1-1:1.0: 5 ports detected
[   10.089658] usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[   10.136980] hub 2-1:1.0: USB hub found
[   10.140859] hub 2-1:1.0: 5 ports detected
[   10.797616] usb 1-1.1: new full-speed USB device number 3 using xhci_hcd
[   10.993617] usb 1-1.2: new high-speed USB device number 4 using xhci_hcd
[   11.185617] usb 1-1.5: new high-speed USB device number 5 using xhci_hcd
^^^^ console not accepting input here yet board is 'not' hung (led
heartbeat continues, cpu watchdog doesn't trip)

If I boot with arm-smmu.disable_bypass=n the kernel log looks
'exactly' the same yet I can interact with the console just fine.

The above is 5.3 using arch/arm64/configs/defconfig only changing
INITRAMFS_SOURCE.

Tirumalesh do you have any ideas here? This is a board modeled after
the Cavium ref designs with a CN8020 SoC and I would assume you guys
have run into this as you have Cavium developers contributing
mainline. I'm using the cn81xx-linux.dtsi from the Cavium SDK 6.2.0 p3
which I believe is the latest which can be found here:
https://github.com/Gateworks/dts-newport/blob/master/cn81xx-linux.dtsi

Tim
