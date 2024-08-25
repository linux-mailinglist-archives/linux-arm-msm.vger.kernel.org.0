Return-Path: <linux-arm-msm+bounces-29450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A343C95E555
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Aug 2024 22:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54862283E28
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Aug 2024 20:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CEC15B0EE;
	Sun, 25 Aug 2024 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhES6bsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B4E3CF5E;
	Sun, 25 Aug 2024 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724618453; cv=none; b=Fw1h0orE4Quhie9YJnqz6ZSHBfZGPHSa/hbb+R0GDuSzWGnGpaYpzsw6QaktLys38gvHeFXxhklPhudrrKHlm9It6uckDB7HGLf9bLEslEft5yKXxFMjncbdEF/2rFy8eDTx48lyDekDJ3WgYzGwfDatFCTQ9HypLxk9qBAHIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724618453; c=relaxed/simple;
	bh=amKYQTvl4+mlU6E5LDBeL3PM5/I6xKgiZKAmZDjYMN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMYU5QqTAI5XvJLCNKZaWaCFUk4B3+uXse5MoZmw4efbfxqndINiccsd4BILiHVI/YBMxksmTmBhG3QYQGprq0B0osMfMEqNXSac2pERVitj5OBgVepqAQmvIrHA4obUW1XtkN+2w43b4vAinAsYcCeKWFfp4fJQfZA351KAQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhES6bsT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so3036975b3a.3;
        Sun, 25 Aug 2024 13:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724618451; x=1725223251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCxFsqDg7k3l7ydum74j0hdDk9tuXyaerQ42M+BRL58=;
        b=FhES6bsTRdKcSa9USgi6nqmhudtDXXEVTh3cYNrR/cBJA7TmU22pokEKSCey478gbw
         uy1TIxgO6yORs1Tc9CG6LiVtRoY7cScSOTzW7Js6FhdqQXOm+Bp+J9lvJsGkQRbKpr0I
         /5SEttjrZwrupvIfFpyKA/bIo7B2P9Vwvp8fp1Rp8p/6XI6dMKMpbzNk2/oiUG92OU0+
         /XYbuWJhTyN9L428EtdUkE8bgDecpcOUXQtLavej98MQMKI1UXXIef170ozBPFDGGhZg
         K6niawKSmXlFH3UMCVRJKAp6KIK5T81BmUGHVVsf9g57PAhgN+wAapCghaN2JK1VVimX
         6P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724618451; x=1725223251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCxFsqDg7k3l7ydum74j0hdDk9tuXyaerQ42M+BRL58=;
        b=Itngxk5wp69unVCqQkNvnF+xqSRTVwcrDdyO4QyMlHMBssfGdosjQfkKB1x13uAs3U
         vIT+0rvfRi0jB5YdveIHY2Rr4X7zgpmhn4tv4MZFT7MNi2ONbA2khLcqMw19PEh/m9to
         /B1jwFL97K3CMZFdzlzC/Nr8i4FBHPaJYvNhxsUVzip2EDWzTTq6Ooj3O1XILgvGpMbh
         07Lck4xVw1hD2j8HTbFpaCGQszl6kdSRS5K1QIeEIkToCxjYdcM367bS4N+ZTof+FEeZ
         Kd9Cs1/r/3uQHnJNcRyowqcslgCc28WHzIm7cSQUWxG9rlJ6p+RzQSLDceceLOv476Dk
         MZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVggdWdR2qc1GJ+cWFGwS6hbQbfje+4RxuG/MCdFHRzmrqqKcjmFdrERwlo6n6wygh+lEVzC+TVWODe+wnhBA==@vger.kernel.org, AJvYcCVo4G0J97Zz2UTF7PE50P93uIR3bCrXvvfuKOkU/nK3vOOvRniOsI2xrvQjDv6daDzcyC1WVnf8dz+SAvb9@vger.kernel.org, AJvYcCXr58mlhIBtiLsYW1/qGelD5bmkDVYL3RAineFVZ+T/rcdI7bPO6g1OSK+zlH/BgwJlNIsr9PW2Rmdm@vger.kernel.org
X-Gm-Message-State: AOJu0YzvroZOExSkd2PQwkvhifkH3SgfwejfeO+J3NuXpSuNBtW3p0J3
	jDDzRsr0w3hPnwQXm+toFk1u1zqX0sNhLU0bi0VXiEVncatY6BGl
X-Google-Smtp-Source: AGHT+IFmOycEBGCMIqit9LrTg0UZlM/2egXWU32zBsDamnu33ZS7zF7tSygwm3lsMpaiA2G3029/4g==
X-Received: by 2002:a05:6a00:1a8e:b0:710:4d08:e094 with SMTP id d2e1a72fcca58-7144573cd07mr8910315b3a.2.1724618450935;
        Sun, 25 Aug 2024 13:40:50 -0700 (PDT)
Received: from ?IPV6:2601:644:8501:8a10:d6be:d9ff:fe52:7e82? ([2601:644:8501:8a10:d6be:d9ff:fe52:7e82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acc3968sm5633169a12.38.2024.08.25.13.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 13:40:50 -0700 (PDT)
Message-ID: <dede22a9-e432-46e6-b4fc-ce67f6439710@gmail.com>
Date: Sun, 25 Aug 2024 13:40:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 bartosz.golaszewski@linaro.org, andersson@kernel.org
Cc: brgl@bgdev.pl, konrad.dybcio@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com,
 quic_gurus@quicinc.com, luzmaximilian@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, srinivas.kandagatla@linaro.org, arnd@arndb.de,
 quic_eberman@quicinc.com, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
 ahalaney@redhat.com, quic_djaggi@quicinc.com
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <48b20ca3-37f5-4d9c-b36f-1d05a2ee4f5c@leemhuis.info>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <48b20ca3-37f5-4d9c-b36f-1d05a2ee4f5c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Lo! Thx for your report!

Thanks for reading my report!


> Better include the exact problem you face in your report so
> that search engines can do their magic; makes it also easier
> to handle for everyone.

Ack. Some communities like to keep their messages tidy, so I assumed 
that was the case here as well.


> Furthermore two quick questions:
>
> [    0.000000] Linux version 6.10.0-rc1-msm8960+ (a@fpx-l-AMER03105) (Ubuntu clang version 16.0.6 (15), Ubuntu LLD 16.0.6) #17 SMP Sat
>
> Is that a vanilla kernel or one close to it? That "msm8960+" sounds
> somewhat suspicious.

It's vanilla. I use this script to build Linux and busybox and then 
flash it to my phone: 
https://codeberg.org/LogicalErzor/mainline_builder/src/branch/master/samsung/expressatt/build.sh

The msm8960 is defined as a localversion in the defconfig pastebin (I 
should've named it config instead). Not sure where the + came from though


> And does the problem still happen with latest mainline? Cconsider
> retrying with -rc5, which should be out in the next 24h.

Yes, -rc5's commit is 5be63fc19fcaa4c236b307420483578a56986a37 and I'm 
still encountering it. Pasted below

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.11.0-rc5-msm8960 (a@fpx-l-AMER03105) 
(Ubuntu clang version 16.0.6 (15), Ubuntu LLD 16.0.6) #19 SMP Sun Aug 25 
15:55:46 EDT 2024
[    0.000000] CPU: ARMv7 Processor [511f04d4] revision 4 (ARMv7), 
cr=10c5787d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction 
cache
[    0.000000] OF: fdt: Machine model: Samsung Galaxy Express SGH-I437
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x16440000 (options 
'115200n8')
[    0.000000] printk: legacy bootconsole [msm_serial_dm0] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080200000-0x00000000afffffff]
[    0.000000]   HighMem  [mem 0x00000000b0000000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x0000000088cfffff]
[    0.000000]   node   0: [mem 0x0000000090000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000080200000-0x00000000bfffffff]
[    0.000000] On node 0, zone Normal: 512 pages in unavailable ranges
[    0.000000] On node 0, zone Normal: 768 pages in unavailable ranges
[    0.000000] percpu: Embedded 19 pages/cpu s45144 r8192 d24488 u77824
[    0.000000] Kernel command line: earlycon clk_ignore_unused 
PMOS_NO_OUTPUT_REDIRECT console=ttyMSM0,115200
[    0.000000] Unknown kernel command line parameters 
"PMOS_NO_OUTPUT_REDIRECT", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 
bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 232192
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] ftrace: allocating 38226 entries in 75 pages
[    0.000000] ftrace: allocated 75 pages with 4 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=2.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] RCU Tasks Rude: Setting shift to 1 and lim to 1 
rcu_task_cb_adjust=1.
[    0.000000] RCU Tasks Trace: Setting shift to 1 and lim to 1 
rcu_task_cb_adjust=1.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on 
contention.
[    0.000000] clocksource: dg_timer: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 283149695806 ns
[    0.000003] sched_clock: 32 bits at 7MHz, resolution 148ns, wraps 
every 318145725365ns
[    0.009533] Switching to timer-based delay loop, resolution 148ns
[    0.017921] Console: colour dummy device 80x30
[    0.023312] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 13.50 BogoMIPS (lpj=67500)
[    0.027574] CPU: Testing write buffer coherency: ok
[    0.037857] pid_max: default: 32768 minimum: 301
[    0.042568] LSM: initializing lsm=capability
[    0.047412] Mount-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.051538] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.060533] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.066438] 8<--- cut here ---
[    0.071897] Unable to handle kernel NULL pointer dereference at 
virtual address 00000090 when read
[    0.074743] [00000090] *pgd=00000000
[    0.083672] Internal error: Oops: 5 [#1] SMP ARM
[    0.087285] Modules linked in:
[    0.091836] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.11.0-rc5-msm8960 #19
[    0.094677] Hardware name: Generic DT based system
[    0.102149] PC is at qcom_scm_get_tzmem_pool+0x1c/0x24
[    0.106958] LR is at __scm_smc_call+0x30/0x2d4
[    0.112026] pc : [<c08986c0>]    lr : [<c089b1e4>]    psr: 60000013
[    0.116413] sp : f0815d78  ip : f0815e98  fp : f0815d78
[    0.122511] r10: 00000002  r9 : f0815e18  r8 : 00000001
[    0.127666] r7 : c1106694  r6 : f0815e30  r5 : c1270040  r4 : 00000001
[    0.132825] r3 : f0815e18  r2 : 00000002  r1 : f0815e30  r0 : 00000000
[    0.139355] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  
Segment none
[    0.145804] Control: 10c5787d  Table: 8000406a  DAC: 00000051
[    0.152930] Register r0 information: NULL pointer
[    0.158599] Register r1 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdec
[    0.163251] Register r2 information: non-paged memory
[    0.173722] Register r3 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdec
[    0.178889] Register r4 information: non-paged memory
[    0.189361] Register r5 information: non-slab/vmalloc memory
[    0.194518] Register r6 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdec
[    0.200197] Register r7 information: non-slab/vmalloc memory
[    0.210586] Register r8 information: non-paged memory
[    0.216428] Register r9 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdec
[    0.221336] Register r10 information: non-paged memory
[    0.231809] Register r11 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdec
[    0.236974] Register r12 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdec
[    0.247889] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    0.258620] Stack: (0xf0815d78 to 0xf0816000)
[    0.264550] 5d60: f0815e08 c089b1e4
[    0.268773] 5d80: f0815d9c c0193d54 c1117d70 c1124000 00000036 
00000000 c1117d70 f0815da8
[    0.276849] 5da0: c12589bc 00000800 00000035 00000000 039ba92c 
00000000 c2000030 c0a6f3a4
[    0.284927] 5dc0: f0815dd8 c0193d54 c1117d70 c1124000 00000036 
00000000 c1117d70 00000000
[    0.293004] 5de0: f0815e18 c0193d54 e37f60fb 00000001 c1270040 
00000000 c1106694 00000001
[    0.301080] 5e00: f0815ef0 00000000 f0815eb0 c089a830 00000001 
c019428c f0815e78 c019428c
[    0.309157] 5e20: f0815e48 00000000 f0815ebf f0815e4c 00000006 
00000001 00000001 00000000
[    0.317234] 5e40: 02000601 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.325310] 5e60: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.333387] 5e80: 00000000 00000000 00000000 00000000 00000002 
00000000 f0815ebf e37f60fb
[    0.341465] 5ea0: 00000000 f0815ee0 00000000 00000000 f0815ed0 
c08989f4 f0815ec8 00aa2034
[    0.349543] 5ec0: f0815ef8 c0b8d77f 00000001 00000000 f0815f68 
c08988d4 00000001 c01012a0
[    0.357618] 5ee0: 00000001 00000001 00000002 00000000 00000001 
00000000 801012a0 00000000
[    0.365695] 5f00: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.373771] 5f20: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.381851] 5f40: 00000002 00000000 e37f60fb c14ff100 00000001 
c1568000 00000000 00000000
[    0.389927] 5f60: 00000000 00000000 f0815f80 c100bf08 c14ff100 
00000001 c1568000 00000000
[    0.398005] 5f80: f0815f98 c1001538 00000000 c0a9dc8c 00000000 
00000000 f0815fa8 c0a9dcac
[    0.406082] 5fa0: 00000000 00000000 00000000 c010014c 00000000 
00000000 00000000 00000000
[    0.414158] 5fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.422234] 5fe0: 00000000 00000000 00000000 00000000 00000013 
00000000 00000000 00000000
[    0.430303] Call trace:
[    0.430329]  qcom_scm_get_tzmem_pool from __scm_smc_call+0x30/0x2d4
[    0.440957]  __scm_smc_call from __get_convention+0xac/0x128
[    0.446885]  __get_convention from qcom_scm_call_atomic+0x24/0x90
[    0.452730]  qcom_scm_call_atomic from qcom_scm_set_boot_addr+0xe4/0x100
[    0.458658]  qcom_scm_set_boot_addr from qcom_smp_prepare_cpus+0x1c/0x94
[    0.465362]  qcom_smp_prepare_cpus from kernel_init_freeable+0xcc/0x140
[    0.471978]  kernel_init_freeable from kernel_init+0x20/0x144
[    0.478251]  kernel_init from ret_from_fork+0x14/0x28
[    0.484086] Exception stack(0xf0815fb0 to 0xf0815ff8)
[    0.489076] 5fa0:                                     00000000 
00000000 00000000 00000000
[    0.494068] 5fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.502143] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.510226] Code: e28dd004 e3000044 e34c0127 e5900000 (e5900090)
[    0.516655] ---[ end trace 0000000000000000 ]---
[    0.522765] Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b
[    0.527408] ---[ end Kernel panic - not syncing: Attempted to kill 
init! exitcode=0x0000000b ]---


Thanks,

Rudraksha


