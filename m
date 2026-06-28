Return-Path: <linux-arm-msm+bounces-114804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bUpzJmSTQWoksQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 23:34:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB66D5036
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 23:34:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=smankusors.com header.s=hostingermail-a header.b=DRGjv59l;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114804-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114804-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=smankusors.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCEEB30094EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 21:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C7F37DEBF;
	Sun, 28 Jun 2026 21:34:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fennec.ash.relay.mailchannels.net (fennec.ash.relay.mailchannels.net [23.83.222.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E34F3112A5;
	Sun, 28 Jun 2026 21:34:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782682463; cv=none; b=nr1ETT9DcUCLpfMb5a8bqw9w+SXGhbhZw19O6ClHQOsqeXvu3eRiP1Dn5rf6wz6fFfUyGRZpfVwzlp4wokfD33lDeO3n11mvBZWHakwpn8E8NYx5csJ36nkkbOhOJewzLBfjwRsGajrDGsDRfGhBsaOW3wiLnBnfLxz8Ps+xcnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782682463; c=relaxed/simple;
	bh=ftzaO/0kKRUTtQT9Zw0WUsPZiLW9b7J3CSdYXaZhi+s=;
	h=Message-ID:MIME-Version:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=UkaPLar0IWDIypriekVdUObFE3rEkegfp/sf8Y6d0l5eIpL3gHHm6sT4wtTPYHYIv+867C92DfqVUssl/+pwtkgEIQ+nsXZvMAZyHusZxa3J3OCAYWljjXhXS926A9TErbVdo6xtkS4rhpJOooWn75qBnnbYRUORNaIIG2jaBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=DRGjv59l; arc=none smtp.client-ip=23.83.222.58
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F0B11381A79;
	Sun, 28 Jun 2026 18:07:27 +0000 (UTC)
Received: from fr-int-smtpout12.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.99.1.210])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6CF90380EBE;
	Sun, 28 Jun 2026 18:07:25 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Share-Stretch: 79d3553416ae5251_1782670047803_12563860
X-MC-Loop-Signature: 1782670047803:2529304705
X-MC-Ingress-Time: 1782670047802
Received: from fr-int-smtpout12.hostinger.io (fr-int-smtpout12.hostinger.io
 [148.222.54.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.1.210 (trex/7.1.5);
	Sun, 28 Jun 2026 18:07:27 +0000
Received: from [IPV6:2001:448a:c030:3ec5:e141:122a:a8ef:3b86] (unknown [IPv6:2001:448a:c030:3ec5:e141:122a:a8ef:3b86])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gpHS849yjz1xqs;
	Sun, 28 Jun 2026 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1782670043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3pZ5oPhkP9vU5CqRTcuBBv2KKbVQ2p6dlNIocwzGys=;
	b=DRGjv59lgnIlOWLGspQuKZG/xD88WhO41+HyHX0oQlHjtVCXE8D9xPGSDRlllEGXikgg5r
	9eYatEZPzcxjI3FrwrpRC+GEZVE+TDCkgK1N+faOaZzZ9MRtgYkDFTxWD0SMBClqupZqIA
	H4yZ6o/cm4Z1kSfxoHgYP1Zfz2DD+HVv4jul7cN6FA3P7jEmfTmqIbmP5Cq8F1pdegVOSd
	H4m19JkMmR8jTY3Aify24ua1H8Fun1ZGc+DvpohztQQJ9SDDthSEd9y7nMCdfA5PeEiFMs
	1nMKd7h+Zm1eYqbGUMMBIOpiHRXHh2tx76FruUis9t3oIZhS2VZUC+mcC2fvKw==
Message-ID: <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 28 Jun 2026 18:07:20 +0000 (UTC)
X-CM-Envelope: MS4xfMnMUDzyWZ9kT6/x0RikgWISa4wo6tY6SonRmRl9WFSeegop82rBIUroccnDfVLHKitqSetTrrG/6vgDVQzvn6MDEnqvDDQlHUk98mu3oe9ZBEd8Sk8C x2UjyzeaUlGRTOz/UU+hd74gd9Jik3ceEzvatAYMhTpMgd8xxTl9Oj3CAZY7XXhAy0jup4MhpwT7k7ju9Qa5MwGdLaq3BZ0dAmlQ2kBg/1HqODUmIhFZDj4H KxCiGKEvmkEhlYzpI05GzME2gAKfFsjpXEQ6cDFq0vy3X3mnD1Pt6xSArDTCUhJzDekEWckLIYPRVQmu4L0oaxwr+HWZnSuntNnxH3MwBGb8KuBHxhcDzRPp gvGKR1UiSOeCxKDUusHOOadjbr6y373dlISlYvRqm5eLiBs5ZpuLgF2Ih+pI//A0anGS++GNQsRIHXF9GUcD7lPHMYnmpMUmuhTVMebsUH7La8/P+kLcpn1k 6FBCI1/SCRZ8LH+EgLrMQuV7pSyJPmFWKFQebYY1FukgVPQgZ5VM3oEJkfOJRJBUPP4Hd/J8lR9yrRq2ToJeufzlcp1X6eqQTCMxKh4gGQ614BftRa/b34FI wwgmKdoaK0Pbr+mbGE/gzwmjEqROrcZ6eJp9CsaxhPhXSZuNH0J44n0L9nQNLGJtkSB0xK3SJ54LsgD15MurLW3u
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=6a4162db a=oKaQ5CoHEv9wptLToLHpSA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=CqCiEOEOAXGEPVoBDjUA:9 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114804-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.it:email,iscas.ac.cn:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6DB66D5036

On 6/24/2026 2:39 PM, Konrad Dybcio wrote:
> On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
>> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>>> The HFPLL enable helper waits for the lock bit but ignores the
>>>> regmap_read_poll_timeout() result. The polling condition is also
>>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>>> as the locked state.
>>>>
>>>> Wait for the lock bit to become set, return timeout errors from the
>>>> helper, and propagate those errors through clk_hfpll_enable() and
>>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>>
>>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>>> ---
>>>
>>> This looks good on the surface..
>>>
>>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>>
>>> Konrad
>>
>> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
>> Krait era, is that correct?
> 
> Seems that way - cpu, L2, and GPU, maybe others

nope, tested on Sony Xperia SP (MSM8960T), the phone hangs

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 7.1.0 (pmos@03766073382c) (Alpine clang 
version 22.1.8, LLD 22.1.8) #10 SMP Sun Jun 28 17:50:44 UTC 2026
[    0.000000] CPU: ARMv7 Processor [512f04d0] revision 0 (ARMv7), 
cr=10c5787d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction 
cache
[    0.000000] OF: fdt: Machine model: Sony Xperia SP
[    0.000000] random: crng init done
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x1a040000 (options 
'115200n8')
[    0.000000] printk: legacy bootconsole [msm_serial_dm0] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 64 MiB at 0xbc000000
[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory 
node in the DT
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080200000-0x00000000b01fffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x00000000b0200000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000080200000-0x00000000bfffffff]
[    0.000000] On node 0, zone DMA: 512 pages in unavailable ranges
[    0.000000] percpu: Embedded 20 pages/cpu s49932 r8192 d23796 u81920
[    0.000000] Kernel command line: console=ttyMSM0 earlycon earlyprintk 
fw_devlink=permissive 
pmos_boot_uuid=af65c02d-2fac-4fb9-ac5c-342f6ee9acdf pmos_root_uuid=02s
[    0.000000] Unknown kernel command line parameters "earlyprintk 
pmos_boot_uuid=af65c02d-2fac-4fb9-ac5c-342f6ee9acdf 
pmos_root_uuid=02b642f1-ec7b-4d1c-8212-ebdce18.
[    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 
540672 bytes
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 
bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 261632
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] ftrace: allocating 71217 entries in 209 pages
[    0.000000] ftrace: allocated 209 pages with 4 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=16 to 
nr_cpu_ids=2.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] RCU Tasks Rude: Setting shift to 1 and lim to 1 
rcu_task_cb_adjust=1 rcu_task_cpu_ids=2.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on 
contention.
[    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.000000] clocksource: dg_timer: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 283149695806 ns
[    0.000003] sched_clock: 32 bits at 7MHz, resolution 148ns, wraps 
every 318145725365ns
[    0.008509] Switching to timer-based delay loop, resolution 148ns
[    0.021062] Console: colour dummy device 80x30
[    0.022498] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 13.50 BogoMIPS (lpj=67500)
[    0.026739] CPU: Testing write buffer coherency: ok
[    0.037149] pid_max: default: 32768 minimum: 301
[    0.043671] LSM support for eBPF active
[    0.046794] Mount-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.050243] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.058084] VFS: Finished mounting rootfs on nullfs
[    0.067344] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.070197] qcom_scm: convention: smc legacy
[    0.079085] Setting up static identity map for 0x80500000 - 0x805000b0
[    0.083075] rcu: Hierarchical SRCU implementation.
[    0.086652] rcu:     Max phase no-delay instances is 1000.
[    0.091980] Timer migration: 1 hierarchy levels; 8 children per 
group; 1 crossnode level
[    0.107264] EFI services will not be available.
[    0.107803] smp: Bringing up secondary CPUs ...
[    0.113189] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.114181] smp: Brought up 1 node, 2 CPUs
[    0.121166] SMP: Total of 2 processors activated (27.00 BogoMIPS).
[    0.124946] CPU: All CPU(s) started in SVC mode.
[    0.131645] Memory: 914204K/1046528K available (24576K kernel code, 
3059K rwdata, 8308K rodata, 3072K init, 461K bss, 62808K reserved, 
65536K cma-reserved, 194560)
[    0.137540] devtmpfs: initialized
[    0.176746] VFP support v0.3: implementor 51 architecture 64 part 4d 
variant 2 rev 0
[    0.177699] posixtimers hash table entries: 1024 (order: 1, 8192 
bytes, linear)
[    0.183800] futex hash table entries: 512 (32768 bytes on 1 NUMA 
nodes, total 32 KiB, linear).
[    0.210792] DMI: not present or invalid.
[    0.212311] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.216112] DMA: preallocated 256 KiB pool for atomic coherent 
allocations
[    0.234714] thermal_sys: Registered thermal governor 'step_wise'
[    0.234948] cpuidle: using governor menu
[    0.241913] No ATAGs?
[    0.244049] hw-breakpoint: Failed to enable monitor mode on CPU 0.
[    0.262963] Serial: AMBA PL011 UART driver
[    0.285450] /soc/clock-controller@900000: Fixed dependency cycle(s) 
with /soc/clock-controller@28000000
[    0.286260] /soc/usb@12500000: Fixed dependency cycle(s) with 
/soc/usb@12500000/ulpi/phy
[    0.294023] /soc/usb@12500000/ulpi/phy: Fixed dependency cycle(s) 
with /soc/usb@12500000
[    0.302327] /soc/clock-controller@28000000: Fixed dependency cycle(s) 
with /soc/clock-controller@900000
[    0.329630] /soc/clock-controller@900000: Fixed dependency cycle(s) 
with /soc/clock-controller@28000000
[    0.351469] /soc/usb@12500000: Fixed dependency cycle(s) with 
/soc/usb@12500000/ulpi/phy
[    0.351769] /soc/usb@12500000/ulpi/phy: Fixed dependency cycle(s) 
with /soc/usb@12500000
[    0.369289] kprobes: kprobe jump-optimization is enabled. All kprobes 
are optimized if possible.
[    0.394747] raid6: using neon recovery algorithm
[    0.561191] raid6: int32x1  gen()    92 MB/s
[    0.733047] raid6: int32x2  gen()    99 MB/s
[    0.904827] raid6: int32x4  gen()   162 MB/s
[    1.076823] raid6: int32x8  gen()   205 MB/s
[    1.248860] raid6: neonx1   gen()   785 MB/s
[    1.420782] raid6: neonx2   gen()  1047 MB/s
[    1.592689] raid6: neonx4   gen()   907 MB/s
[    1.764529] raid6: neonx8   gen()   934 MB/s
[    1.764570] raid6: using algorithm neonx2 gen() 1047 MB/s
[    1.936416] raid6: .... xor() 630 MB/s, rmw enabled
[    1.954284] iommu: Default domain type: Translated
[    1.954336] iommu: DMA domain TLB invalidation policy: strict mode
[    1.960850] SCSI subsystem initialized
[    1.969167] usbcore: registered new interface driver usbfs
[    1.969334] usbcore: registered new interface driver hub
[    1.973637] usbcore: registered new device driver usb
[    1.983264] pps_core: LinuxPPS API ver. 1 registered
[    1.983977] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    1.989049] PTP clock support registered
[    1.998685] EDAC MC: Ver: 3.0.0
[    2.002983] scmi_core: SCMI protocol bus registered
[    2.010594] vgaarb: loaded
[    2.017546] clocksource: Switched to clocksource dg_timer
[    2.048670] NET: Registered PF_INET protocol family
[    2.048993] IP idents hash table entries: 16384 (order: 5, 131072 
bytes, linear)
[    2.054734] tcp_listen_portaddr_hash hash table entries: 512 (order: 
0, 4096 bytes, linear)
[    2.060149] Table-perturb hash table entries: 65536 (order: 6, 262144 
bytes, linear)
[    2.068274] TCP established hash table entries: 8192 (order: 3, 32768 
bytes, linear)
[    2.076241] TCP bind hash table entries: 8192 (order: 5, 131072 
bytes, linear)
[    2.084002] TCP: Hash tables configured (established 8192 bind 8192)
[    2.091130] UDP hash table entries: 512 (order: 3, 28672 bytes, linear)
[    2.097811] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    2.105019] RPC: Registered named UNIX socket transport module.
[    2.109698] RPC: Registered udp transport module.
[    2.115225] RPC: Registered tcp transport module.
[    2.120187] RPC: Registered tcp-with-tls transport module.
[    2.124774] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    2.130267] PCI: CLS 0 bytes, default 64
[    2.140192] Initialise system trusted keyrings
[    2.147886] Trying to unpack rootfs image as initramfs...
[    2.171410] workingset: timestamp_bits=14 (anon: 9) max_order=18 
bucket_order=4 (anon: 9)
[    2.195378] NFS: Registering the id_resolver key type
[    2.195508] Key type id_resolver registered
[    2.214561] Key type id_legacy registered
[    2.214759] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    2.217858] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver 
Registering...
[    2.227868] Key type asymmetric registered
[    2.231752] Asymmetric key parser 'x509' registered
[    2.235860] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 245)
[    2.268473] io scheduler mq-deadline registered
[    2.268570] io scheduler kyber registered
[    2.272081] io scheduler bfq registered
[    2.276199] xor: measuring software checksum speed
[    2.282001]    neon            :  1506 MB/sec
[    2.290889]    32regs          :   517 MB/sec
[    2.297519]    8regs           :   499 MB/sec
[    2.301990]    arm4regs        :   744 MB/sec
[    2.302054] xor: using function: neon (1506 MB/sec)
[    2.543901] ledtrig-cpu: registered to indicate activity on CPUs
[    2.679716] L2 @ Undefined rate. Forcing new rate

-- 
Thanks,
Antony K. S.

