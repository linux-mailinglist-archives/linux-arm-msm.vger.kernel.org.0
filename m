Return-Path: <linux-arm-msm+bounces-31191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEA9700E5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 10:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9A3283EE0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 08:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B9814B94B;
	Sat,  7 Sep 2024 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK+8QHO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45C51B85DC;
	Sat,  7 Sep 2024 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725697729; cv=none; b=gNkQYnGmn8B3qoZvkc4gYXKIHwRhzVbjrChlbMqAL7sHegcx/L2jOXTbo73TW33KGV2HxnpAU9In8zNFAk1i7gGMatM7k42FBV4194NDGRclBrjveFHzY/1EuWaMnvIwKTUK3iUULl5IADsEv+fnvaeWtMjkRwoOB0Q8eY9IEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725697729; c=relaxed/simple;
	bh=wPbkfIwPLOV0MW2xQrEYs0lVwJi3rAosroYiYzxHsUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7jCUgR4GOs/1UgvTUM2LRFpYwTf6zeAKM4wtBarPwLcYCzAQ8IQWKN6mRLc/njA+rlCIC4yvA6uimQBo23ZbGTMp8sAq54KXs/vUhW6dmFgkQxGAY3A3oTMRQit/vUqQ1zua8GoqiJyKVKzqeyIh7clC/MzfFw21H1K+5A2cuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK+8QHO9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-205909af9b5so22517135ad.3;
        Sat, 07 Sep 2024 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725697727; x=1726302527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRci6lZocDkfiXfuNljK642xJixMM1VmW57dm231R6g=;
        b=FK+8QHO9Hdz0iC/43EYHuz5BIY0CuTplcAHndzznMyChhWEpNiaZH2YYTgcm4Ffd8v
         rURXIu+0rkd1/PMNplYsR+UbCpw7NdcGS2pi2vPWY2J+g3iktxX5tarm7yFUEHvywAQ0
         9teR50UkFnMIPKq8dCHrKum+i5kAJidWBs/lNY1C6O8SnbRC3PBSkagovgjD0XntEi1k
         kXvw4tn72mm1E474QKsj61Qqh0oo/Pin9wvbC9UhaW7kOBAQsTZFiYCPPhSaRGzmuH6Q
         C4PizpUGct4ZDDVC7G2/MPFyXy035bXPzfUswPPp0/e/YlB64AgXBZsSpCF1V7kA9rYc
         uI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725697727; x=1726302527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRci6lZocDkfiXfuNljK642xJixMM1VmW57dm231R6g=;
        b=EK5K+jnD35tACC8QUcaoz7LwqOJ+Tt/IQZ9QEW8hqoYPAMc2ITIvR7qWecNoX9W7jl
         zMu6rUvZKZiiHlw34OjoC+1+0pbWtGO/3Ds9H7KZVsLqdqrtgFaCBKBYfbOeQDUm2zEh
         vM0bdL8QAnK6SAr9o2u6hWBRu5yd7XYlMker1YI3Q6x3UBKyUEbNMZiH6oxicZ1J1xuz
         UVwlCZ9tMuaGNXrWT/0NIL+O0chzmUSr4YGjH8Gj8zdLL6IvExIrb4U9gJPF7ZPwtYWX
         7tKuulb/hWyEj1lpJmci7I7k/m72nVej/xyvLuSxy1usMGBOseDCxBJbSILLJYxkkOIY
         My3w==
X-Forwarded-Encrypted: i=1; AJvYcCUTXbAJ9tvFmqmQiZ3mQ+XcYeshQLrF7XXvPv+AlqzMpDjkc2vqo+AoSNMZ+6dPbJfa8d+Qzm7EtAPy@vger.kernel.org, AJvYcCV/j/Q+EHuqXbxeiS5nJvYL8xm84que+RuwlQUPqnpqdy4rBXXh9+a1RBTKTbckKw8aibOZIUbCOb8yRRLL@vger.kernel.org, AJvYcCVckgn9EgTX5HjrHE4CYAprNrcwg8tQFSIHC6RVDAptnVPYwTg4Nq0vmbZAeF8884JyKMdTcozEn/McKLBOKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPFOXMy5Q9u7sL2y5Z/NhJ7r6oBGQGuFrlIYYsfk/ccvMo2O+
	ImmFjqNoWAI1bG8AhpPaIZRY0K7bQJ5WAyZlpYPV5u3jDmnp4saM
X-Google-Smtp-Source: AGHT+IE3DWhZ42RAObg2bNYIGwyg0bLzVvemrIvMyawn9Z9eq1z7lpW1+/rfS1zV1yutlpY9F1HMHQ==
X-Received: by 2002:a17:902:db0d:b0:205:4885:235e with SMTP id d9443c01a7336-206f05b1527mr55758915ad.39.1725697726542;
        Sat, 07 Sep 2024 01:28:46 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:d6be:d9ff:fe52:7e82? ([2601:644:8502:9460:d6be:d9ff:fe52:7e82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20716200c41sm3071115ad.126.2024.09.07.01.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 01:28:46 -0700 (PDT)
Message-ID: <233ff5d0-ca8a-4526-8aac-c95e5f2de221@gmail.com>
Date: Sat, 7 Sep 2024 01:28:43 -0700
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
 <dede22a9-e432-46e6-b4fc-ce67f6439710@gmail.com>
 <d3f437d1-fcb5-411e-9b2f-4a6fbed8c888@leemhuis.info>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <d3f437d1-fcb5-411e-9b2f-4a6fbed8c888@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Hmm, from the outside it looks like nobody looked into below regression
> report (reminder: culprit authored by Bartosz Golaszewski and commited
> by Bjorn Andersson). Wonder why. Did it fall through the cracks or did I
> miss anything?
>
> Rudraksha Gupta: I assume the issue still happens?
Thanks for poking this. Wasn't sure how fast this is supposed to be 
reverted/patched. And yep! Pasted below:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.11.0-rc6-msm8960+ (user@localhost) 
(Alpine clang version 18.1.8, LLD 18.1.8) #2 SMP Sat Sep  7 01:22:22 PDT 
2024
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
[    0.000000] ftrace: allocating 38347 entries in 75 pages
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
[    0.000002] sched_clock: 32 bits at 7MHz, resolution 148ns, wraps 
every 318145725365ns
[    0.009532] Switching to timer-based delay loop, resolution 148ns
[    0.017997] Console: colour dummy device 80x30
[    0.023311] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 13.50 BogoMIPS (lpj=67500)
[    0.027572] CPU: Testing write buffer coherency: ok
[    0.037875] pid_max: default: 32768 minimum: 301
[    0.042565] LSM: initializing lsm=capability
[    0.047408] Mount-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.051555] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.060527] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.066424] 8<--- cut here ---
[    0.071895] Unable to handle kernel NULL pointer dereference at 
virtual address 00000090 when read
[    0.074743] [00000090] *pgd=00000000
[    0.083659] Internal error: Oops: 5 [#1] SMP ARM
[    0.087283] Modules linked in:
[    0.091834] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.11.0-rc6-msm8960+ #2
[    0.094674] Hardware name: Generic DT based system
[    0.102146] PC is at qcom_scm_get_tzmem_pool+0x1c/0x24
[    0.106956] LR is at __scm_smc_call+0x30/0x2d4
[    0.112025] pc : [<c08944b4>]    lr : [<c0896fd0>] psr: 60000013
[    0.116411] sp : f0815d78  ip : f0815e98  fp : f0815d78
[    0.122510] r10: 00000002  r9 : f0815e18  r8 : 00000001
[    0.127666] r7 : c1106694  r6 : f0815e30  r5 : c1270038  r4 : 00000001
[    0.132824] r3 : f0815e18  r2 : 00000002  r1 : f0815e30  r0 : 00000000
[    0.139354] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
Segment none
[    0.145803] Control: 10c5787d  Table: 8000406a  DAC: 00000051
[    0.152929] Register r0 information: NULL pointer
[    0.158597] Register r1 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdd8
[    0.163248] Register r2 information: non-paged memory
[    0.173721] Register r3 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdd8
[    0.178887] Register r4 information: non-paged memory
[    0.189361] Register r5 information: non-slab/vmalloc memory
[    0.194518] Register r6 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdd8
[    0.200197] Register r7 information: non-slab/vmalloc memory
[    0.210585] Register r8 information: non-paged memory
[    0.216427] Register r9 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdd8
[    0.221335] Register r10 information: non-paged memory
[    0.231807] Register r11 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdd8
[    0.236973] Register r12 information: 2-page vmalloc region starting 
at 0xf0814000 allocated at copy_process+0x16c/0xdd8
[    0.247888] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    0.258619] Stack: (0xf0815d78 to 0xf0816000)
[    0.264548] 
5d60:                                                       f0815e08 
c0896fd0
[    0.268771] 5d80: f0815d9c c0193bfc c1117d70 c1124000 00000036 
00000000 c1117d70 f0815da8
[    0.276848] 5da0: c12589bc 00000800 00000035 00000000 039b929b 
00000000 c2000030 c0a68a64
[    0.284925] 5dc0: f0815dd8 c0193bfc c1117d70 c1124000 00000036 
00000000 c1117d70 00000000
[    0.293002] 5de0: f0815e18 c0193bfc c078b204 00000001 c1270038 
00000000 c1106694 00000001
[    0.301078] 5e00: f0815ef0 00000000 f0815eb0 c0896624 00000001 
c0194138 f0815e78 c0194138
[    0.309155] 5e20: f0815e48 00000000 f0815ebf f0815e4c 00000006 
00000001 00000001 00000000
[    0.317232] 5e40: 02000601 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.325308] 5e60: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.333387] 5e80: 00000000 00000000 00000000 00000000 00000002 
00000000 f0815ebf c078b204
[    0.341464] 5ea0: 00000000 f0815ee0 00000000 00000000 f0815ed0 
c08947e8 f0815ec8 00a9b284
[    0.349541] 5ec0: f0815ef8 c0b8d6b7 00000001 00000000 f0815f68 
c08946c8 00000001 c01012a0
[    0.357618] 5ee0: 00000001 00000001 00000002 00000000 00000001 
00000000 801012a0 00000000
[    0.365693] 5f00: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.373771] 5f20: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.381848] 5f40: 00000002 00000000 c078b204 c14ff100 00000001 
c1568000 00000000 00000000
[    0.389926] 5f60: 00000000 00000000 f0815f80 c100be5c c14ff100 
00000001 c1568000 00000000
[    0.398003] 5f80: f0815f98 c1001538 00000000 c0a96fa8 00000000 
00000000 f0815fa8 c0a96fc8
[    0.406079] 5fa0: 00000000 00000000 00000000 c010014c 00000000 
00000000 00000000 00000000
[    0.414157] 5fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.422233] 5fe0: 00000000 00000000 00000000 00000000 00000013 
00000000 00000000 00000000
[    0.430303] Call trace:
[    0.430327]  qcom_scm_get_tzmem_pool from __scm_smc_call+0x30/0x2d4
[    0.440957]  __scm_smc_call from __get_convention+0xac/0x128
[    0.446885]  __get_convention from qcom_scm_call_atomic+0x24/0x90
[    0.452729]  qcom_scm_call_atomic from qcom_scm_set_boot_addr+0xe4/0x100
[    0.458658]  qcom_scm_set_boot_addr from qcom_smp_prepare_cpus+0x1c/0x94
[    0.465362]  qcom_smp_prepare_cpus from kernel_init_freeable+0xcc/0x140
[    0.471977]  kernel_init_freeable from kernel_init+0x20/0x144
[    0.478250]  kernel_init from ret_from_fork+0x14/0x28
[    0.484086] Exception stack(0xf0815fb0 to 0xf0815ff8)
[    0.489073] 5fa0:                                     00000000 
00000000 00000000 00000000
[    0.494068] 5fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.502143] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.510224] Code: e28dd004 e300003c e34c0127 e5900000 (e5900090)
[    0.516642] ---[ end trace 0000000000000000 ]---
[    0.522765] Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b
[    0.527406] ---[ end Kernel panic - not syncing: Attempted to kill 
init! exitcode=0x0000000b ]---


> /me considered bringing in Linus, but decided to wait a bit

Big fan of his and everyone's work! :)



