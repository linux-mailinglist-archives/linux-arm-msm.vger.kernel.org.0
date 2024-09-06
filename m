Return-Path: <linux-arm-msm+bounces-31092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791496F1E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 12:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0D01F22DDC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3528F1C9EDB;
	Fri,  6 Sep 2024 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ROe8TcXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B01C9EB1;
	Fri,  6 Sep 2024 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725619819; cv=none; b=PXLbgeYoLwEpcU2IlcUFQGo8ZoZAa+SixkXIAB6lmeB8CSqlmxK70CQNckwQwEkUqWJAb7fLioaGp1eLOSkPfiZH2ssLEPxDSLTdxDQPiMRaKqJGaBlDc7wwo520dRGR8sCaTxUsUHXREDu5MRXzt+yckmNODzYzCuBO5ah8ZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725619819; c=relaxed/simple;
	bh=yFWudol8hmh8xJZdlau2MAMpwcvTVgUimopU980KP6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwPO7RFbgc2Lb8giyX4U+y+o6qF2svhFrskMs9CT9zLsARvKjh+D6dXU7CUx+Y1ec79A0KSD7aRNfVPIXsAndYk1YWTD+tJkuX81+oI4KYZIH/A78/pleDkUO/OWZQEZ+zdXjXGM7b2eENHnQLGfVjjCqpukzJdEwz3OYBlBOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ROe8TcXf; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=vlHrY8sYYQRLBu09odB7K05GVcRRiDq7ivu0HXNcHEU=;
	t=1725619814; x=1726051814; b=ROe8TcXfFFFJJJCpw3RpS8rImV3apCDYeu3FzIH4mQoU0ob
	frR77Of2ZvZ+X3gbPf0ebD1d+ojtsOhe8guuXQGgq/PpPhTWU17llIa9jZo0VO9q9xJa2avunCUuF
	zxee6RiLC9d5Kv8TwS/Rs/cR/SR+ZPleMRkHjf1qZ1TUtrN6ir1LuY6nVZIyWTBc618klLGCj43Sd
	hxvxvyE/DBmVN2ns7NiLJtSuAQUhbkJ6NE4vpZwKyqMw6ZLIQTF7Be0UTPrcA9J0e+EgUM1OcoriS
	kmu3lNRohVyL9roI5PjzKLwQMioaNL9OVC8WrSxMEnhvZOwA63SDqEac3CmGF7Lg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smWXW-0003w2-Gp; Fri, 06 Sep 2024 12:50:06 +0200
Message-ID: <d3f437d1-fcb5-411e-9b2f-4a6fbed8c888@leemhuis.info>
Date: Fri, 6 Sep 2024 12:50:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
To: Rudraksha Gupta <guptarud@gmail.com>, bartosz.golaszewski@linaro.org,
 andersson@kernel.org
Cc: brgl@bgdev.pl, konrad.dybcio@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com,
 quic_gurus@quicinc.com, luzmaximilian@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, srinivas.kandagatla@linaro.org, arnd@arndb.de,
 quic_eberman@quicinc.com, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
 ahalaney@redhat.com, quic_djaggi@quicinc.com
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <48b20ca3-37f5-4d9c-b36f-1d05a2ee4f5c@leemhuis.info>
 <dede22a9-e432-46e6-b4fc-ce67f6439710@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <dede22a9-e432-46e6-b4fc-ce67f6439710@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725619814;f177f6bd;
X-HE-SMSGID: 1smWXW-0003w2-Gp

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Hmm, from the outside it looks like nobody looked into below regression
report (reminder: culprit authored by Bartosz Golaszewski and commited
by Bjorn Andersson). Wonder why. Did it fall through the cracks or did I
miss anything?

Rudraksha Gupta: I assume the issue still happens?

/me considered bringing in Linus, but decided to wait a bit

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

On 25.08.24 22:40, Rudraksha Gupta wrote:
> [...]
>> Furthermore two quick questions:
>>
>> [    0.000000] Linux version 6.10.0-rc1-msm8960+ (a@fpx-l-AMER03105)
>> (Ubuntu clang version 16.0.6 (15), Ubuntu LLD 16.0.6) #17 SMP Sat
>>
>> Is that a vanilla kernel or one close to it? That "msm8960+" sounds
>> somewhat suspicious.
> 
> It's vanilla. I use this script to build Linux and busybox and then
> flash it to my phone: https://codeberg.org/LogicalErzor/
> mainline_builder/src/branch/master/samsung/expressatt/build.sh
> 
> The msm8960 is defined as a localversion in the defconfig pastebin (I
> should've named it config instead). Not sure where the + came from though
> 
>> And does the problem still happen with latest mainline? Cconsider
>> retrying with -rc5, which should be out in the next 24h.
> 
> Yes, -rc5's commit is 5be63fc19fcaa4c236b307420483578a56986a37 and I'm
> still encountering it. Pasted below
> 
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.11.0-rc5-msm8960 (a@fpx-l-AMER03105)
> (Ubuntu clang version 16.0.6 (15), Ubuntu LLD 16.0.6) #19 SMP Sun Aug 25
> 15:55:46 EDT 2024
> [    0.000000] CPU: ARMv7 Processor [511f04d4] revision 4 (ARMv7),
> cr=10c5787d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction
> cache
> [    0.000000] OF: fdt: Machine model: Samsung Galaxy Express SGH-I437
> [    0.000000] earlycon: msm_serial_dm0 at MMIO 0x16440000 (options
> '115200n8')
> [    0.000000] printk: legacy bootconsole [msm_serial_dm0] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000080200000-0x00000000afffffff]
> [    0.000000]   HighMem  [mem 0x00000000b0000000-0x00000000bfffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000080200000-0x0000000088cfffff]
> [    0.000000]   node   0: [mem 0x0000000090000000-0x00000000bfffffff]
> [    0.000000] Initmem setup node 0 [mem
> 0x0000000080200000-0x00000000bfffffff]
> [    0.000000] On node 0, zone Normal: 512 pages in unavailable ranges
> [    0.000000] On node 0, zone Normal: 768 pages in unavailable ranges
> [    0.000000] percpu: Embedded 19 pages/cpu s45144 r8192 d24488 u77824
> [    0.000000] Kernel command line: earlycon clk_ignore_unused
> PMOS_NO_OUTPUT_REDIRECT console=ttyMSM0,115200
> [    0.000000] Unknown kernel command line parameters
> "PMOS_NO_OUTPUT_REDIRECT", will be passed to user space.
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
> bytes, linear)
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 232192
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> [    0.000000] ftrace: allocating 38226 entries in 75 pages
> [    0.000000] ftrace: allocated 75 pages with 4 groups
> [    0.000000] trace event string verifier disabled
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu:     RCU event tracing is enabled.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=4 to
> nr_cpu_ids=2.
> [    0.000000]  Rude variant of Tasks RCU enabled.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> is 10 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
> [    0.000000] RCU Tasks Rude: Setting shift to 1 and lim to 1
> rcu_task_cb_adjust=1.
> [    0.000000] RCU Tasks Trace: Setting shift to 1 and lim to 1
> rcu_task_cb_adjust=1.
> [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
> contention.
> [    0.000000] clocksource: dg_timer: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 283149695806 ns
> [    0.000003] sched_clock: 32 bits at 7MHz, resolution 148ns, wraps
> every 318145725365ns
> [    0.009533] Switching to timer-based delay loop, resolution 148ns
> [    0.017921] Console: colour dummy device 80x30
> [    0.023312] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 13.50 BogoMIPS (lpj=67500)
> [    0.027574] CPU: Testing write buffer coherency: ok
> [    0.037857] pid_max: default: 32768 minimum: 301
> [    0.042568] LSM: initializing lsm=capability
> [    0.047412] Mount-cache hash table entries: 2048 (order: 1, 8192
> bytes, linear)
> [    0.051538] Mountpoint-cache hash table entries: 2048 (order: 1, 8192
> bytes, linear)
> [    0.060533] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.066438] 8<--- cut here ---
> [    0.071897] Unable to handle kernel NULL pointer dereference at
> virtual address 00000090 when read
> [    0.074743] [00000090] *pgd=00000000
> [    0.083672] Internal error: Oops: 5 [#1] SMP ARM
> [    0.087285] Modules linked in:
> [    0.091836] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-
> rc5-msm8960 #19
> [    0.094677] Hardware name: Generic DT based system
> [    0.102149] PC is at qcom_scm_get_tzmem_pool+0x1c/0x24
> [    0.106958] LR is at __scm_smc_call+0x30/0x2d4
> [    0.112026] pc : [<c08986c0>]    lr : [<c089b1e4>]    psr: 60000013
> [    0.116413] sp : f0815d78  ip : f0815e98  fp : f0815d78
> [    0.122511] r10: 00000002  r9 : f0815e18  r8 : 00000001
> [    0.127666] r7 : c1106694  r6 : f0815e30  r5 : c1270040  r4 : 00000001
> [    0.132825] r3 : f0815e18  r2 : 00000002  r1 : f0815e30  r0 : 00000000
> [    0.139355] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
> Segment none
> [    0.145804] Control: 10c5787d  Table: 8000406a  DAC: 00000051
> [    0.152930] Register r0 information: NULL pointer
> [    0.158599] Register r1 information: 2-page vmalloc region starting
> at 0xf0814000 allocated at copy_process+0x16c/0xdec
> [    0.163251] Register r2 information: non-paged memory
> [    0.173722] Register r3 information: 2-page vmalloc region starting
> at 0xf0814000 allocated at copy_process+0x16c/0xdec
> [    0.178889] Register r4 information: non-paged memory
> [    0.189361] Register r5 information: non-slab/vmalloc memory
> [    0.194518] Register r6 information: 2-page vmalloc region starting
> at 0xf0814000 allocated at copy_process+0x16c/0xdec
> [    0.200197] Register r7 information: non-slab/vmalloc memory
> [    0.210586] Register r8 information: non-paged memory
> [    0.216428] Register r9 information: 2-page vmalloc region starting
> at 0xf0814000 allocated at copy_process+0x16c/0xdec
> [    0.221336] Register r10 information: non-paged memory
> [    0.231809] Register r11 information: 2-page vmalloc region starting
> at 0xf0814000 allocated at copy_process+0x16c/0xdec
> [    0.236974] Register r12 information: 2-page vmalloc region starting
> at 0xf0814000 allocated at copy_process+0x16c/0xdec
> [    0.247889] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> [    0.258620] Stack: (0xf0815d78 to 0xf0816000)
> [    0.264550] 5d60: f0815e08 c089b1e4
> [    0.268773] 5d80: f0815d9c c0193d54 c1117d70 c1124000 00000036
> 00000000 c1117d70 f0815da8
> [    0.276849] 5da0: c12589bc 00000800 00000035 00000000 039ba92c
> 00000000 c2000030 c0a6f3a4
> [    0.284927] 5dc0: f0815dd8 c0193d54 c1117d70 c1124000 00000036
> 00000000 c1117d70 00000000
> [    0.293004] 5de0: f0815e18 c0193d54 e37f60fb 00000001 c1270040
> 00000000 c1106694 00000001
> [    0.301080] 5e00: f0815ef0 00000000 f0815eb0 c089a830 00000001
> c019428c f0815e78 c019428c
> [    0.309157] 5e20: f0815e48 00000000 f0815ebf f0815e4c 00000006
> 00000001 00000001 00000000
> [    0.317234] 5e40: 02000601 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    0.325310] 5e60: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    0.333387] 5e80: 00000000 00000000 00000000 00000000 00000002
> 00000000 f0815ebf e37f60fb
> [    0.341465] 5ea0: 00000000 f0815ee0 00000000 00000000 f0815ed0
> c08989f4 f0815ec8 00aa2034
> [    0.349543] 5ec0: f0815ef8 c0b8d77f 00000001 00000000 f0815f68
> c08988d4 00000001 c01012a0
> [    0.357618] 5ee0: 00000001 00000001 00000002 00000000 00000001
> 00000000 801012a0 00000000
> [    0.365695] 5f00: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    0.373771] 5f20: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    0.381851] 5f40: 00000002 00000000 e37f60fb c14ff100 00000001
> c1568000 00000000 00000000
> [    0.389927] 5f60: 00000000 00000000 f0815f80 c100bf08 c14ff100
> 00000001 c1568000 00000000
> [    0.398005] 5f80: f0815f98 c1001538 00000000 c0a9dc8c 00000000
> 00000000 f0815fa8 c0a9dcac
> [    0.406082] 5fa0: 00000000 00000000 00000000 c010014c 00000000
> 00000000 00000000 00000000
> [    0.414158] 5fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    0.422234] 5fe0: 00000000 00000000 00000000 00000000 00000013
> 00000000 00000000 00000000
> [    0.430303] Call trace:
> [    0.430329]  qcom_scm_get_tzmem_pool from __scm_smc_call+0x30/0x2d4
> [    0.440957]  __scm_smc_call from __get_convention+0xac/0x128
> [    0.446885]  __get_convention from qcom_scm_call_atomic+0x24/0x90
> [    0.452730]  qcom_scm_call_atomic from qcom_scm_set_boot_addr+0xe4/0x100
> [    0.458658]  qcom_scm_set_boot_addr from qcom_smp_prepare_cpus+0x1c/0x94
> [    0.465362]  qcom_smp_prepare_cpus from kernel_init_freeable+0xcc/0x140
> [    0.471978]  kernel_init_freeable from kernel_init+0x20/0x144
> [    0.478251]  kernel_init from ret_from_fork+0x14/0x28
> [    0.484086] Exception stack(0xf0815fb0 to 0xf0815ff8)
> [    0.489076] 5fa0:                                     00000000
> 00000000 00000000 00000000
> [    0.494068] 5fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    0.502143] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    0.510226] Code: e28dd004 e3000044 e34c0127 e5900000 (e5900090)
> [    0.516655] ---[ end trace 0000000000000000 ]---
> [    0.522765] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> [    0.527408] ---[ end Kernel panic - not syncing: Attempted to kill
> init! exitcode=0x0000000b ]---
> 
> 
> Thanks,
> 
> Rudraksha
> 
> 
> 

--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

