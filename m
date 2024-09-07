Return-Path: <linux-arm-msm+bounces-31192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB53B9700F7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 10:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B70284D3D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 08:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C11514B967;
	Sat,  7 Sep 2024 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m797u/fY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793F42067;
	Sat,  7 Sep 2024 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698691; cv=none; b=Z2NYgINFQMRG1JDXAy4vm9KJTwCEJRLISHM1pVhZEldJ91puxdSEWUJDxp3mM855fCvKOqxqWbzmKt6ex4Q4/HBoFHZiOnDRKipTM0UPZAZOK1TgzsPyNtcraPyHBZoohjKeAReIp1oBoZCbTIbhjqRrHKElJ16K47O4TPdn3nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698691; c=relaxed/simple;
	bh=PC8gYkb3mwPN2+LUdw8fDSBeVPnvRNxB4YOGHLPAuKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBp+6Urw2xg5MuwNGyWZUSrF0pG082AH2ZU1eAV7bRvEDwS3SiuO6S7h8O673jjQpo06myX4PAjeGYg7Ta9BE3FUdAuFPLJAkp9BCVf0+xDIjWduxikgP/VITD1Q1pXhAcvVeu0hRzqZKGrVgYunBZRHvtkAkB6y/obPX0GGKeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m797u/fY; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e03a5ed4d7so123042b6e.1;
        Sat, 07 Sep 2024 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725698685; x=1726303485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ediQ1Ll6rFWiNO3fOiag88D3d20B5fpk5xSGCcvd6Og=;
        b=m797u/fY5RZsTS9pYQ+UrkuYuhdRCR4KCjcnEBfh4COiGFSan0GIveGa8rUFW7QZAL
         /xAQULNpgUVcQo8tCwIEIHWpoXvdxUONEcAV5qBy+0z5hpIictme2csqiAIjFsnSdU/C
         vT0e6KscWrvx1yQr+Gj5ayTyl0y1LBt0mJv1CQ3sEfT+kXGSnksk6vY6zj9UB8fNFmba
         jgLarGcH5d3GZxAESnw88TZT+rNU5amYCglo8z8AaI8AnxXwOFWXgt6dWqDBABc/ZK7r
         z951kjrmfQq5vl36jUoX6sHfrIslMRxI2qRgz75P4GKp0wHnY3UHg/KwlzJyJVqrYwkw
         fisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725698685; x=1726303485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ediQ1Ll6rFWiNO3fOiag88D3d20B5fpk5xSGCcvd6Og=;
        b=UGAuDNcv2l6GrR6NRRKxOJiJK6S7fsiYsAnOFyG7lsw52AiAdYIuMTIdvmhX+QGX7P
         eSoGq0vMoG5j4xy+jceJrgIJi/sLLd9Mf586txwHULvsb1o7pzN+xd99SZSN2++5W++A
         Y0qIJWH1CO76DCgu2dOEdnF8Rb/0DYcdf20fEh40tyV/PVO1DX/LuU2e0B3toABCqsL4
         x1HX2X00CWwwF/5JdvGVw7iKLreciJTGYYdEzzE8swB+fbm7PTi+8MGYr7hVaP7zfl74
         lUqp3M6X5O1bmq1JLT69IxfeDqlknkvMGdpoptVySlvfWr9si1O6dfFg0wllw1Tm5E59
         gIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8aOyM4aGOGGdK4NTnbXeD73PXERv7OEIcdieA8zlW1fvPOJqPcVqXoDZxUgzg1fTSvL+LD8fj1EGe+j6epg==@vger.kernel.org, AJvYcCV85znvAzplw7vF/4gONI9/x4POVH/pfEYg5TFYBLGKpVU4H6sv6ScClps+Vepxj5y8MOntB4mhlSWg@vger.kernel.org, AJvYcCWoBi59TVoBzlg9GcIiOZbDTC5j+cT7HdkePpPby8Iz9dq7v7w5yslQP6ZcQKe+w2WzCL0MIkQyE3cjXpjP@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaR5XS86A3ff70ZAIXLOGdz965eE8E3gcPaXw6Eug/AJCtEnV
	qbKVN3BbfPqh5qdsaOcrPh3S7oNxBg72jwHfKDM2s/Yt/m1B3mr3
X-Google-Smtp-Source: AGHT+IENWwLkoLasrb7DreQXNDSc0oUZ02JBoKpBbSuYwa6JsOGsy3fmqut52TApXekk9w2SfS9VsA==
X-Received: by 2002:a05:6808:e82:b0:3da:e219:bf with SMTP id 5614622812f47-3e02a02dab8mr5917414b6e.43.1725698683914;
        Sat, 07 Sep 2024 01:44:43 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:d6be:d9ff:fe52:7e82? ([2601:644:8502:9460:d6be:d9ff:fe52:7e82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823cf3d16sm510327a12.21.2024.09.07.01.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 01:44:43 -0700 (PDT)
Message-ID: <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com>
Date: Sat, 7 Sep 2024 01:44:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: regressions@lists.linux.dev, brgl@bgdev.pl, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
 luzmaximilian@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 srinivas.kandagatla@linaro.org, arnd@arndb.de, quic_eberman@quicinc.com,
 elder@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
> happens. Can you confirm that the QCom SCM driver probed correctly?

Thanks for looking into this! Please let me know how I can help!


I've been building the driver into the kernel I believe. Here's the 
relevant line in the config:

$ rg -i "scm"
samsung/expressatt/linux.defconfig
1615:# CONFIG_ARM_SCMI_PROTOCOL is not set
1627:CONFIG_QCOM_SCM=y
1628:# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set


I've grepped smc for your convenience:

~ # dmesg | grep scm
[    0.066438] qcom_scm: convention: smc legacy
[    0.362543] bus: 'platform': add driver qcom_scm


Also here is the complete dmesg output:

~ # dmesg
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.11.0-rc6-msm8960+ (user@localhost) 
(Alpine clang version 18.1.8, LLD 18.1.8) #3 SMP Sat Sep  7 01:34:48 PDT 
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
[    0.000000] pcpu-alloc: s45144 r8192 d24488 u77824 alloc=19*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
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
[    0.000000] ftrace: allocating 38346 entries in 75 pages
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
[    0.018003] Console: colour dummy device 80x30
[    0.023310] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 13.50 BogoMIPS (lpj=67500)
[    0.027573] CPU: Testing write buffer coherency: ok
[    0.037880] pid_max: default: 32768 minimum: 301
[    0.042563] LSM: initializing lsm=capability
[    0.047407] Mount-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.051530] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.060517] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.066438] qcom_scm: convention: smc legacy
[    0.075252] Setting up static identity map for 0x80100000 - 0x80100060
[    0.076595] rcu: Hierarchical SRCU implementation.
[    0.082381] rcu:     Max phase no-delay instances is 1000.
[    0.087990] Timer migration: 1 hierarchy levels; 8 children per 
group; 1 crossnode level
[    0.093788] smp: Bringing up secondary CPUs ...
[    0.103141] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.103701] smp: Brought up 1 node, 2 CPUs
[    0.110480] SMP: Total of 2 processors activated (27.00 BogoMIPS).
[    0.114477] CPU: All CPU(s) started in SVC mode.
[    0.121426] Memory: 899636K/928768K available (10240K kernel code, 
1234K rwdata, 3768K rodata, 1024K init, 275K bss, 26820K reserved, 0K 
cma-reserved, 262144K highmem)
[    0.126474] devtmpfs: initialized
[    0.147501] device: 'platform': device_add
[    0.147613] PM: Adding info for No Bus:platform
[    0.147741] bus: 'platform': registered
[    0.147837] bus: 'auxiliary': registered
[    0.147932] bus: 'cpu': registered
[    0.147963] device: 'cpu': device_add
[    0.148086] PM: Adding info for No Bus:cpu
[    0.148284] bus: 'container': registered
[    0.148317] device: 'container': device_add
[    0.148394] PM: Adding info for No Bus:container
[    0.149956] VFP support v0.3: implementor 51 architecture 64 part 4d 
variant 1 rev 4
[    0.150154] bus: 'workqueue': registered
[    0.150185] device: 'workqueue': device_add
[    0.150279] PM: Adding info for No Bus:workqueue
[    0.150597] device: 'wakeup0': device_add
[    0.150752] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.156774] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.166851] pinctrl core: initialized pinctrl subsystem
[    0.173323] bus: 'gpio': registered
[    0.173352] bus: 'gpio': add driver gpio_stub_drv
[    0.173449] bus: 'platform': add driver gcc-msm8960
[    0.173533] bus: 'platform': add driver qcom-clk-rpm
[    0.173680] bus: 'genpd': registered
[    0.173778] bus: 'virtio': registered
[    0.173806] device class 'regulator': registering
[    0.173930] Registering platform device 'reg-dummy'. Parent at platform
[    0.173960] device: 'reg-dummy': device_add
[    0.174003] bus: 'platform': add device reg-dummy
[    0.174097] PM: Adding info for platform:reg-dummy
[    0.174169] bus: 'platform': add driver reg-dummy
[    0.174217] platform reg-dummy: probing driver reg-dummy asynchronously
[    0.175277] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.179255] DMA: preallocated 256 KiB pool for atomic coherent 
allocations
[    0.184049] platform reg-dummy: bus: 'platform': 
__driver_probe_device: matched device with driver reg-dummy
[    0.184123] platform reg-dummy: bus: 'platform': really_probe: 
probing driver reg-dummy with device
[    0.184203] reg-dummy reg-dummy: no default pinctrl state
[    0.184488] device: 'regulator.0': device_add
[    0.184862] PM: Adding info for No Bus:regulator.0
[    0.185173] reg-dummy reg-dummy: driver: 'reg-dummy': driver_bound: 
bound to device
[    0.185283] reg-dummy reg-dummy: bus: 'platform': really_probe: bound 
device to driver reg-dummy
[    0.185349] reg-dummy reg-dummy: driver reg-dummy async attach 
completed: 0
[    0.185392] audit: initializing netlink subsys (disabled)
[    0.191280] device class 'bdi': registering
[    0.191302] audit: type=2000 audit(0.140:1): state=initialized 
audit_enabled=0 res=1
[    0.191411] bus: 'platform': add driver ramoops
[    0.196278] device class 'gpio': registering
[    0.196354] device class 'pci_bus': registering
[    0.196493] bus: 'pci': registered
[    0.196602] bus: 'amba': registered
[    0.196630] device class 'tty': registering
[    0.196682] device class 'vtconsole': registering
[    0.196746] device: 'vtcon0': device_add
[    0.196868] PM: Adding info for No Bus:vtcon0
[    0.196920] device class 'iommu': registering
[    0.197045] bus: 'mipi-dsi': registered
[    0.197071] device class 'devlink': registering
[    0.197180] device class 'wakeup': registering
[    0.197268] bus: 'platform': add driver syscon
[    0.197422] bus: 'spi': registered
[    0.197446] device class 'spi_master': registering
[    0.197579] bus: 'spmi': registered
[    0.197690] bus: 'i2c': registered
[    0.197757] bus: 'i2c': add driver dummy
[    0.197848] thermal_sys: Registered thermal governor 'step_wise'
[    0.197867] device class 'thermal': registering
[    0.204263] cpuidle: using governor ladder
[    0.210008] cpuidle: using governor menu
[    0.213726] bus: 'platform': add driver qcom_hwspinlock
[    0.213810] device class 'rpmsg': registering
[    0.213932] bus: 'rpmsg': registered
[    0.214465] hw-breakpoint: Failed to enable monitor mode on CPU 0.
[    0.218205] bus: 'platform': add driver apq8064-pinctrl
[    0.218302] bus: 'platform': add driver msm8960-pinctrl
[    0.218483] device class 'dma': registering
[    0.218606] bus: 'platform': add driver qcom-smem
[    0.218770] bus: 'serial-base': registered
[    0.218802] bus: 'serial-base': add driver ctrl
[    0.218875] bus: 'serial-base': add driver port
[    0.218950] bus: 'platform': add driver qcom_rpm
[    0.219048] bus: 'platform': add driver qcom-smd
[    0.219637] device: 'cpu-pmu': device_add
[    0.219705] bus: 'platform': add device cpu-pmu
[    0.219800] PM: Adding info for platform:cpu-pmu
[    0.219952] /cpu-pmu Linked as a fwnode consumer to 
/soc/interrupt-controller@2000000
[    0.220056] platform cpu-pmu: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.220101] /cpu-pmu Dropping the fwnode link to 
/soc/interrupt-controller@2000000
[    0.220262] device: 'vsdcc-regulator': device_add
[    0.220326] bus: 'platform': add device vsdcc-regulator
[    0.220416] PM: Adding info for platform:vsdcc-regulator
[    0.220631] device: 'soc': device_add
[    0.220691] bus: 'platform': add device soc
[    0.220791] PM: Adding info for platform:soc
[    0.221007] /soc/timer@200a000 Linked as a fwnode consumer to 
/soc/interrupt-controller@2000000
[    0.221243] /soc/pinctrl@800000 Linked as a fwnode consumer to 
/soc/interrupt-controller@2000000
[    0.221846] /soc/clock-controller@900000 Linked as a fwnode consumer 
to /clocks/cxo_board
[    0.221922] /soc/clock-controller@900000 Linked as a fwnode consumer 
to /clocks/pxo_board
[    0.221993] /soc/clock-controller@900000 Linked as a fwnode consumer 
to /soc/clock-controller@28000000
[    0.222135] /soc/clock-controller@28000000 Linked as a fwnode 
consumer to /clocks/pxo_board
[    0.222205] /soc/clock-controller@28000000 Linked as a fwnode 
consumer to /soc/clock-controller@900000
[    0.222355] /soc/clock-controller@4000000 Linked as a fwnode consumer 
to /clocks/pxo_board
[    0.222425] /soc/clock-controller@4000000 Linked as a fwnode consumer 
to /soc/clock-controller@900000
[    0.222550] /soc/clock-controller@2011000 Linked as a fwnode consumer 
to /soc/clock-controller@900000
[    0.222624] /soc/clock-controller@2011000 Linked as a fwnode consumer 
to /clocks/pxo_board
[    0.222786] /soc/rpm@108000 Linked as a fwnode consumer to 
/soc/interrupt-controller@2000000
[    0.222965] /soc/rpm@108000/regulators Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/s4
[    0.223119] /soc/rpm@108000/regulators Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/l6
[    0.223262] /soc/rpm@108000/regulators Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/s8
[    0.223378] /soc/rpm@108000/regulators Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/s1
[    0.223511] /soc/rpm@108000/regulators Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/s7
[    0.225204] /soc/clock-controller@2088000 Linked as a fwnode consumer 
to /soc/clock-controller@900000
[    0.225281] /soc/clock-controller@2088000 Linked as a fwnode consumer 
to /clocks/pxo_board
[    0.225419] /soc/clock-controller@2098000 Linked as a fwnode consumer 
to /soc/clock-controller@900000
[    0.225493] /soc/clock-controller@2098000 Linked as a fwnode consumer 
to /clocks/pxo_board
[    0.225767] /soc/gsbi@16400000 Linked as a fwnode consumer to 
/soc/clock-controller@900000
[    0.225958] /soc/gsbi@16400000/serial@16440000 Linked as a fwnode 
consumer to /soc/interrupt-controller@2000000
[    0.226055] /soc/gsbi@16400000/serial@16440000 Linked as a fwnode 
consumer to /soc/clock-controller@900000
[    0.226275] /soc/ssbi@500000/pmic Linked as a fwnode consumer to 
/soc/pinctrl@800000
[    0.226426] /soc/ssbi@500000/pmic/pwrkey@1c Linked as a fwnode 
consumer to /soc/ssbi@500000/pmic
[    0.226691] /soc/ssbi@500000/pmic/rtc@11d Linked as a fwnode consumer 
to /soc/ssbi@500000/pmic
[    0.226934] /soc/ssbi@500000/pmic/xoadc@197 Linked as a fwnode 
consumer to /soc/ssbi@500000/pmic
[    0.227327] /soc/rng@1a500000 Linked as a fwnode consumer to 
/soc/clock-controller@900000
[    0.227487] /soc/mmc@12180000 Linked as a fwnode consumer to 
/soc/interrupt-controller@2000000
[    0.227573] /soc/mmc@12180000 Linked as a fwnode consumer to 
/soc/clock-controller@900000
[    0.227718] /soc/mmc@12180000 Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/l6
[    0.227823] /soc/mmc@12180000 Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/l7
[    0.227992] /soc/mmc@12400000 Linked as a fwnode consumer to 
/soc/interrupt-controller@2000000
[    0.228078] /soc/mmc@12400000 Linked as a fwnode consumer to 
/soc/clock-controller@900000
[    0.228223] /soc/mmc@12400000 Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/l5
[    0.228396] /soc/gsbi@16000000 Linked as a fwnode consumer to 
/soc/clock-controller@900000
[    0.228516] /soc/gsbi@16000000 Linked as a fwnode consumer to 
/soc/pinctrl@800000/spi1-default-state
[    0.228695] /soc/gsbi@16000000/spi@16080000 Linked as a fwnode 
consumer to /soc/interrupt-controller@2000000
[    0.228806] /soc/gsbi@16000000/spi@16080000 Linked as a fwnode 
consumer to /soc/pinctrl@800000
[    0.228888] /soc/gsbi@16000000/spi@16080000 Linked as a fwnode 
consumer to /soc/clock-controller@900000
[    0.229061] /soc/usb@12500000 Linked as a fwnode consumer to 
/soc/interrupt-controller@2000000
[    0.229146] /soc/usb@12500000 Linked as a fwnode consumer to 
/soc/clock-controller@900000
[    0.229308] /soc/usb@12500000 Linked as a fwnode consumer to 
/soc/usb@12500000/ulpi/phy
[    0.229477] /soc/usb@12500000/ulpi/phy Linked as a fwnode consumer to 
/clocks/sleep_clk
[    0.229570] /soc/usb@12500000/ulpi/phy Linked as a fwnode consumer to 
/clocks/cxo_board
[    0.229680] /soc/usb@12500000/ulpi/phy Linked as a fwnode consumer to 
/soc/usb@12500000
[    0.229802] /soc/usb@12500000/ulpi/phy Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/l3
[    0.229926] /soc/usb@12500000/ulpi/phy Linked as a fwnode consumer to 
/soc/rpm@108000/regulators/l4
[    0.230099] /soc/gsbi@16200000 Linked as a fwnode consumer to 
/soc/clock-controller@900000
[    0.230250] /soc/gsbi@16200000/i2c@16280000 Linked as a fwnode 
consumer to /soc/pinctrl@800000/i2c3-default-state
[    0.230345] /soc/gsbi@16200000/i2c@16280000 Linked as a fwnode 
consumer to /soc/pinctrl@800000/i2c3-sleep-state
[    0.230478] /soc/gsbi@16200000/i2c@16280000 Linked as a fwnode 
consumer to /soc/interrupt-controller@2000000
[    0.230577] /soc/gsbi@16200000/i2c@16280000 Linked as a fwnode 
consumer to /soc/clock-controller@900000
[    0.230733] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Linked as 
a fwnode consumer to /soc/pinctrl@800000
[    0.230875] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Linked as 
a fwnode consumer to /soc/rpm@108000/regulators/lvs6
[    0.231002] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Linked as 
a fwnode consumer to /soc/rpm@108000/regulators/l17
[    0.231131] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Linked as 
a fwnode consumer to /soc/pinctrl@800000/touchscreen-int-state
[    0.231252] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.231305] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.231394] platform soc: Not linking /clocks/pxo_board - might never 
become dev
[    0.231439] platform soc: Not linking /clocks/cxo_board - might never 
become dev
[    0.231490] platform soc: Not linking /clocks/pxo_board - might never 
become dev
[    0.231542] platform soc: Not linking /clocks/pxo_board - might never 
become dev
[    0.231591] platform soc: Not linking /clocks/pxo_board - might never 
become dev
[    0.231643] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.231840] platform soc: Not linking /clocks/pxo_board - might never 
become dev
[    0.231894] platform soc: Not linking /clocks/pxo_board - might never 
become dev
[    0.231971] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.232121] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.232180] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.232254] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.232318] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.232383] platform soc: Not linking /clocks/cxo_board - might never 
become dev
[    0.232426] platform soc: Not linking /clocks/sleep_clk - might never 
become dev
[    0.232491] platform soc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.232758] device: '200a000.timer': device_add
[    0.232821] bus: 'platform': add device 200a000.timer
[    0.232912] PM: Adding info for platform:200a000.timer
[    0.233008] platform 200a000.timer: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.233053] /soc/timer@200a000 Dropping the fwnode link to 
/soc/interrupt-controller@2000000
[    0.233318] device: '800000.pinctrl': device_add
[    0.233377] bus: 'platform': add device 800000.pinctrl
[    0.233468] PM: Adding info for platform:800000.pinctrl
[    0.233603] platform 800000.pinctrl: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.233648] /soc/pinctrl@800000 Dropping the fwnode link to 
/soc/interrupt-controller@2000000
[    0.233777] platform 800000.pinctrl: bus: 'platform': 
__driver_probe_device: matched device with driver msm8960-pinctrl
[    0.233816] platform 800000.pinctrl: bus: 'platform': really_probe: 
probing driver msm8960-pinctrl with device
[    0.233863] msm8960-pinctrl 800000.pinctrl: no pinctrl handle
[    0.234672] gpiochip_find_base_unlocked: found new base at 512
[    0.234913] gpio gpiochip0: (800000.pinctrl): created GPIO range 
0->151 ==> 800000.pinctrl PIN 0->151
[    0.235029] device: 'gpiochip0': device_add
[    0.235094] bus: 'gpio': add device gpiochip0
[    0.235185] PM: Adding info for gpio:gpiochip0
[    0.235633] gpio gpiochip0: (800000.pinctrl): added GPIO chardev (254:0)
[    0.235682] device: 'gpiochip512': device_add
[    0.235813] PM: Adding info for No Bus:gpiochip512
[    0.235870] gpio gpiochip0: registered GPIOs 512 to 663 on 800000.pinctrl
[    0.235906] msm8960-pinctrl 800000.pinctrl: driver: 
'msm8960-pinctrl': driver_bound: bound to device
[    0.235941] /soc/gsbi@16200000/i2c@16280000 Linked as a fwnode 
consumer to /soc/pinctrl@800000
[    0.236008] /soc/gsbi@16200000/i2c@16280000 Dropping the fwnode link 
to /soc/pinctrl@800000/i2c3-default-state
[    0.236092] /soc/gsbi@16200000/i2c@16280000 Dropping the fwnode link 
to /soc/pinctrl@800000/i2c3-sleep-state
[    0.236176] /soc/gsbi@16000000 Linked as a fwnode consumer to 
/soc/pinctrl@800000
[    0.236232] /soc/gsbi@16000000 Dropping the fwnode link to 
/soc/pinctrl@800000/spi1-default-state
[    0.236322] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Dropping 
the fwnode link to /soc/pinctrl@800000/touchscreen-int-state
[    0.236505] msm8960-pinctrl 800000.pinctrl: bus: 'platform': 
really_probe: bound device to driver msm8960-pinctrl
[    0.236698] device: '900000.clock-controller': device_add
[    0.236759] bus: 'platform': add device 900000.clock-controller
[    0.236852] PM: Adding info for platform:900000.clock-controller
[    0.236978] ----- cycle: start -----
[    0.236999] /soc/clock-controller@28000000: cycle: depends on 
/soc/clock-controller@900000
[    0.237062] /soc/clock-controller@900000: cycle: depends on 
/soc/clock-controller@28000000
[    0.237117] ----- cycle: end -----
[    0.237139] platform 900000.clock-controller: Fixed dependency 
cycle(s) with /soc/clock-controller@28000000
[    0.237223] platform 900000.clock-controller: Not linking 
/clocks/pxo_board - might never become dev
[    0.237266] /soc/clock-controller@900000 Dropping the fwnode link to 
/clocks/pxo_board
[    0.237330] platform 900000.clock-controller: Not linking 
/clocks/cxo_board - might never become dev
[    0.237371] /soc/clock-controller@900000 Dropping the fwnode link to 
/clocks/cxo_board
[    0.237442] platform 900000.clock-controller: bus: 'platform': 
__driver_probe_device: matched device with driver gcc-msm8960
[    0.237480] platform 900000.clock-controller: bus: 'platform': 
really_probe: probing driver gcc-msm8960 with device
[    0.237523] gcc-msm8960 900000.clock-controller: no pinctrl handle
[    0.242428] Registering platform device 'qcom-tsens'. Parent at 
900000.clock-controller
[    0.242462] device: 'qcom-tsens': device_add
[    0.242510] bus: 'platform': add device qcom-tsens
[    0.242614] PM: Adding info for platform:qcom-tsens
[    0.242713] gcc-msm8960 900000.clock-controller: driver: 
'gcc-msm8960': driver_bound: bound to device
[    0.242742] /soc/clock-controller@900000 Dropping the fwnode link to 
/soc/clock-controller@28000000
[    0.242920] gcc-msm8960 900000.clock-controller: bus: 'platform': 
really_probe: bound device to driver gcc-msm8960
[    0.243095] device: '28000000.clock-controller': device_add
[    0.243157] bus: 'platform': add device 28000000.clock-controller
[    0.243247] PM: Adding info for platform:28000000.clock-controller
[    0.243348] device: 
'platform:900000.clock-controller--platform:28000000.clock-controller': 
device_add
[    0.243527] platform 28000000.clock-controller: Linked as a sync 
state only consumer to 900000.clock-controller
[    0.243554] /soc/clock-controller@28000000 Dropping the fwnode link 
to /soc/clock-controller@900000
[    0.243623] platform 28000000.clock-controller: Not linking 
/clocks/pxo_board - might never become dev
[    0.243664] /soc/clock-controller@28000000 Dropping the fwnode link 
to /clocks/pxo_board
[    0.243904] device: '4000000.clock-controller': device_add
[    0.243965] bus: 'platform': add device 4000000.clock-controller
[    0.244056] PM: Adding info for platform:4000000.clock-controller
[    0.244157] device: 
'platform:900000.clock-controller--platform:4000000.clock-controller': 
device_add
[    0.244328] devices_kset: Moving 4000000.clock-controller to end of list
[    0.244354] PM: Moving platform:4000000.clock-controller to end of list
[    0.244381] platform 4000000.clock-controller: Linked as a consumer 
to 900000.clock-controller
[    0.244406] /soc/clock-controller@4000000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.244588] platform 4000000.clock-controller: Not linking 
/clocks/pxo_board - might never become dev
[    0.244631] /soc/clock-controller@4000000 Dropping the fwnode link to 
/clocks/pxo_board
[    0.244873] device: '2011000.clock-controller': device_add
[    0.244934] bus: 'platform': add device 2011000.clock-controller
[    0.245025] PM: Adding info for platform:2011000.clock-controller
[    0.245121] platform 2011000.clock-controller: Not linking 
/clocks/pxo_board - might never become dev
[    0.245165] /soc/clock-controller@2011000 Dropping the fwnode link to 
/clocks/pxo_board
[    0.245241] device: 
'platform:900000.clock-controller--platform:2011000.clock-controller': 
device_add
[    0.245403] devices_kset: Moving 2011000.clock-controller to end of list
[    0.245428] PM: Moving platform:2011000.clock-controller to end of list
[    0.245453] platform 2011000.clock-controller: Linked as a consumer 
to 900000.clock-controller
[    0.245477] /soc/clock-controller@2011000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.245731] device: '108000.rpm': device_add
[    0.245790] bus: 'platform': add device 108000.rpm
[    0.245891] PM: Adding info for platform:108000.rpm
[    0.246111] platform 108000.rpm: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.246157] /soc/rpm@108000 Dropping the fwnode link to 
/soc/interrupt-controller@2000000
[    0.246408] platform 108000.rpm: bus: 'platform': 
__driver_probe_device: matched device with driver qcom_rpm
[    0.246445] platform 108000.rpm: bus: 'platform': really_probe: 
probing driver qcom_rpm with device
[    0.246489] qcom_rpm 108000.rpm: no pinctrl handle
[    0.247264] qcom_rpm 108000.rpm: RPM firmware 3.0.16844036
[    0.247622] device: '108000.rpm:regulators': device_add
[    0.247686] bus: 'platform': add device 108000.rpm:regulators
[    0.247780] PM: Adding info for platform:108000.rpm:regulators
[    0.247988] ----- cycle: start -----
[    0.248012] /soc/rpm@108000/regulators/s7: cycle: child of 
/soc/rpm@108000/regulators
[    0.248097] /soc/rpm@108000/regulators: cycle: depends on 
/soc/rpm@108000/regulators/s7
[    0.248181] ----- cycle: end -----
[    0.248202] platform 108000.rpm:regulators: Fixed dependency cycle(s) 
with /soc/rpm@108000/regulators/s7
[    0.251638] ----- cycle: start -----
[    0.251658] /soc/rpm@108000/regulators/s1: cycle: child of 
/soc/rpm@108000/regulators
[    0.251742] /soc/rpm@108000/regulators: cycle: depends on 
/soc/rpm@108000/regulators/s1
[    0.251826] ----- cycle: end -----
[    0.251846] platform 108000.rpm:regulators: Fixed dependency cycle(s) 
with /soc/rpm@108000/regulators/s1
[    0.261264] ----- cycle: start -----
[    0.261286] /soc/rpm@108000/regulators/s8: cycle: child of 
/soc/rpm@108000/regulators
[    0.261372] /soc/rpm@108000/regulators: cycle: depends on 
/soc/rpm@108000/regulators/s8
[    0.261455] ----- cycle: end -----
[    0.261476] platform 108000.rpm:regulators: Fixed dependency cycle(s) 
with /soc/rpm@108000/regulators/s8
[    0.270540] ----- cycle: start -----
[    0.270561] /soc/rpm@108000/regulators/l6: cycle: child of 
/soc/rpm@108000/regulators
[    0.270646] /soc/rpm@108000/regulators: cycle: depends on 
/soc/rpm@108000/regulators/l6
[    0.270729] ----- cycle: end -----
[    0.270750] platform 108000.rpm:regulators: Fixed dependency cycle(s) 
with /soc/rpm@108000/regulators/l6
[    0.280003] ----- cycle: start -----
[    0.280025] /soc/rpm@108000/regulators/s4: cycle: child of 
/soc/rpm@108000/regulators
[    0.280111] /soc/rpm@108000/regulators: cycle: depends on 
/soc/rpm@108000/regulators/s4
[    0.280195] ----- cycle: end -----
[    0.280215] platform 108000.rpm:regulators: Fixed dependency cycle(s) 
with /soc/rpm@108000/regulators/s4
[    0.289464] qcom_rpm 108000.rpm: driver: 'qcom_rpm': driver_bound: 
bound to device
[    0.289567] qcom_rpm 108000.rpm: bus: 'platform': really_probe: bound 
device to driver qcom_rpm
[    0.289799] device: '2088000.clock-controller': device_add
[    0.289871] bus: 'platform': add device 2088000.clock-controller
[    0.289963] PM: Adding info for platform:2088000.clock-controller
[    0.290152] platform 2088000.clock-controller: Not linking 
/clocks/pxo_board - might never become dev
[    0.290197] /soc/clock-controller@2088000 Dropping the fwnode link to 
/clocks/pxo_board
[    0.290274] device: 
'platform:900000.clock-controller--platform:2088000.clock-controller': 
device_add
[    0.290446] devices_kset: Moving 2088000.clock-controller to end of list
[    0.290471] PM: Moving platform:2088000.clock-controller to end of list
[    0.290497] platform 2088000.clock-controller: Linked as a consumer 
to 900000.clock-controller
[    0.290521] /soc/clock-controller@2088000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.290825] device: '2098000.clock-controller': device_add
[    0.290885] bus: 'platform': add device 2098000.clock-controller
[    0.290989] PM: Adding info for platform:2098000.clock-controller
[    0.291079] platform 2098000.clock-controller: Not linking 
/clocks/pxo_board - might never become dev
[    0.291123] /soc/clock-controller@2098000 Dropping the fwnode link to 
/clocks/pxo_board
[    0.291200] device: 
'platform:900000.clock-controller--platform:2098000.clock-controller': 
device_add
[    0.291371] devices_kset: Moving 2098000.clock-controller to end of list
[    0.291396] PM: Moving platform:2098000.clock-controller to end of list
[    0.291422] platform 2098000.clock-controller: Linked as a consumer 
to 900000.clock-controller
[    0.291446] /soc/clock-controller@2098000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.291743] device: '2089000.power-manager': device_add
[    0.291805] bus: 'platform': add device 2089000.power-manager
[    0.291895] PM: Adding info for platform:2089000.power-manager
[    0.292232] device: '2099000.power-manager': device_add
[    0.292292] bus: 'platform': add device 2099000.power-manager
[    0.292383] PM: Adding info for platform:2099000.power-manager
[    0.292672] device: '16400000.gsbi': device_add
[    0.292732] bus: 'platform': add device 16400000.gsbi
[    0.292832] PM: Adding info for platform:16400000.gsbi
[    0.292938] device: 
'platform:900000.clock-controller--platform:16400000.gsbi': device_add
[    0.293097] devices_kset: Moving 16400000.gsbi to end of list
[    0.293121] PM: Moving platform:16400000.gsbi to end of list
[    0.293147] platform 16400000.gsbi: Linked as a consumer to 
900000.clock-controller
[    0.293171] /soc/gsbi@16400000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.293241] platform 16400000.gsbi: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.293463] device: '500000.ssbi': device_add
[    0.293522] bus: 'platform': add device 500000.ssbi
[    0.293613] PM: Adding info for platform:500000.ssbi
[    0.293775] device: 'platform:800000.pinctrl--platform:500000.ssbi': 
device_add
[    0.293932] platform 500000.ssbi: Linked as a sync state only 
consumer to 800000.pinctrl
[    0.294206] device: '1a500000.rng': device_add
[    0.294265] bus: 'platform': add device 1a500000.rng
[    0.294366] PM: Adding info for platform:1a500000.rng
[    0.294463] device: 
'platform:900000.clock-controller--platform:1a500000.rng': device_add
[    0.294620] devices_kset: Moving 1a500000.rng to end of list
[    0.294644] PM: Moving platform:1a500000.rng to end of list
[    0.294670] platform 1a500000.rng: Linked as a consumer to 
900000.clock-controller
[    0.294694] /soc/rng@1a500000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.294894] device: '12180000.mmc': device_add
[    0.294958] bus: 'amba': add device 12180000.mmc
[    0.295055] PM: Adding info for amba:12180000.mmc
[    0.295190] device: 
'platform:900000.clock-controller--amba:12180000.mmc': device_add
[    0.295355] devices_kset: Moving 12180000.mmc to end of list
[    0.295381] PM: Moving amba:12180000.mmc to end of list
[    0.295406] amba 12180000.mmc: Linked as a consumer to 
900000.clock-controller
[    0.295430] /soc/mmc@12180000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.295495] amba 12180000.mmc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.295537] /soc/mmc@12180000 Dropping the fwnode link to 
/soc/interrupt-controller@2000000
[    0.295695] device: '12400000.mmc': device_add
[    0.295755] bus: 'amba': add device 12400000.mmc
[    0.295848] PM: Adding info for amba:12400000.mmc
[    0.295965] device: 
'platform:900000.clock-controller--amba:12400000.mmc': device_add
[    0.296121] devices_kset: Moving 12400000.mmc to end of list
[    0.296145] PM: Moving amba:12400000.mmc to end of list
[    0.296170] amba 12400000.mmc: Linked as a consumer to 
900000.clock-controller
[    0.296194] /soc/mmc@12400000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.296259] amba 12400000.mmc: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.296301] /soc/mmc@12400000 Dropping the fwnode link to 
/soc/interrupt-controller@2000000
[    0.296494] device: '1a400000.syscon': device_add
[    0.296553] bus: 'platform': add device 1a400000.syscon
[    0.296643] PM: Adding info for platform:1a400000.syscon
[    0.296914] device: '16000000.gsbi': device_add
[    0.296973] bus: 'platform': add device 16000000.gsbi
[    0.297073] PM: Adding info for platform:16000000.gsbi
[    0.297180] device: 
'platform:800000.pinctrl--platform:16000000.gsbi': device_add
[    0.297339] devices_kset: Moving 16000000.gsbi to end of list
[    0.297364] PM: Moving platform:16000000.gsbi to end of list
[    0.297389] platform 16000000.gsbi: Linked as a consumer to 
800000.pinctrl
[    0.297412] /soc/gsbi@16000000 Dropping the fwnode link to 
/soc/pinctrl@800000
[    0.297491] device: 
'platform:900000.clock-controller--platform:16000000.gsbi': device_add
[    0.297652] devices_kset: Moving 16000000.gsbi to end of list
[    0.297676] PM: Moving platform:16000000.gsbi to end of list
[    0.297702] platform 16000000.gsbi: Linked as a consumer to 
900000.clock-controller
[    0.297725] /soc/gsbi@16000000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.297798] platform 16000000.gsbi: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.298093] device: '12500000.usb': device_add
[    0.298163] bus: 'platform': add device 12500000.usb
[    0.298262] PM: Adding info for platform:12500000.usb
[    0.298379] ----- cycle: start -----
[    0.298400] /soc/usb@12500000/ulpi/phy: cycle: depends on 
/soc/usb@12500000
[    0.298485] ----- cycle: start -----
[    0.298504] /soc/usb@12500000/ulpi/phy: cycle: child of /soc/usb@12500000
[    0.298577] /soc/usb@12500000: cycle: depends on 
/soc/usb@12500000/ulpi/phy
[    0.298650] ----- cycle: end -----
[    0.298671] platform 12500000.usb: Fixed dependency cycle(s) with 
/soc/usb@12500000/ulpi/phy
[    0.298786] device: 
'platform:900000.clock-controller--platform:12500000.usb': device_add
[    0.298945] devices_kset: Moving 12500000.usb to end of list
[    0.298970] PM: Moving platform:12500000.usb to end of list
[    0.298995] platform 12500000.usb: Linked as a consumer to 
900000.clock-controller
[    0.299019] /soc/usb@12500000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.299084] platform 12500000.usb: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.299126] /soc/usb@12500000 Dropping the fwnode link to 
/soc/interrupt-controller@2000000
[    0.299204] platform 12500000.usb: Not linking /clocks/cxo_board - 
might never become dev
[    0.299248] platform 12500000.usb: Not linking /clocks/sleep_clk - 
might never become dev
[    0.299480] device: '16200000.gsbi': device_add
[    0.299551] bus: 'platform': add device 16200000.gsbi
[    0.299643] PM: Adding info for platform:16200000.gsbi
[    0.299754] device: 
'platform:900000.clock-controller--platform:16200000.gsbi': device_add
[    0.299913] devices_kset: Moving 16200000.gsbi to end of list
[    0.299938] PM: Moving platform:16200000.gsbi to end of list
[    0.299963] platform 16200000.gsbi: Linked as a consumer to 
900000.clock-controller
[    0.299987] /soc/gsbi@16200000 Dropping the fwnode link to 
/soc/clock-controller@900000
[    0.300069] device: 
'platform:800000.pinctrl--platform:16200000.gsbi': device_add
[    0.300351] platform 16200000.gsbi: Linked as a sync state only 
consumer to 800000.pinctrl
[    0.300386] platform 16200000.gsbi: Not linking 
/soc/interrupt-controller@2000000 - might never become dev
[    0.300540] device: 'iio-hwmon': device_add
[    0.300600] bus: 'platform': add device iio-hwmon
[    0.300691] PM: Adding info for platform:iio-hwmon
[    0.300797] /iio-hwmon Linked as a fwnode consumer to 
/soc/ssbi@500000/pmic/xoadc@197
[    0.301106] device: 'gpio-keys': device_add
[    0.301166] bus: 'platform': add device gpio-keys
[    0.301257] PM: Adding info for platform:gpio-keys
[    0.301362] /gpio-keys Linked as a fwnode consumer to 
/soc/pinctrl@800000/gpio-keys-active-state
[    0.301465] /gpio-keys/key-home Linked as a fwnode consumer to 
/soc/pinctrl@800000
[    0.301599] /gpio-keys/key-volume-up Linked as a fwnode consumer to 
/soc/pinctrl@800000
[    0.301716] /gpio-keys/key-volume-down Linked as a fwnode consumer to 
/soc/pinctrl@800000
[    0.301835] device: 'platform:800000.pinctrl--platform:gpio-keys': 
device_add
[    0.301991] devices_kset: Moving gpio-keys to end of list
[    0.302015] PM: Moving platform:gpio-keys to end of list
[    0.302040] platform gpio-keys: Linked as a consumer to 800000.pinctrl
[    0.302063] /gpio-keys Dropping the fwnode link to 
/soc/pinctrl@800000/gpio-keys-active-state
[    0.302537] device: 'cpu0': device_add
[    0.302602] bus: 'cpu': add device cpu0
[    0.302681] PM: Adding info for cpu:cpu0
[    0.302830] device: 'cpu1': device_add
[    0.302891] bus: 'cpu': add device cpu1
[    0.302968] PM: Adding info for cpu:cpu1
[    0.311042] device: 'writeback': device_add
[    0.311107] bus: 'workqueue': add device writeback
[    0.311201] PM: Adding info for workqueue:writeback
[    0.312769] device class 'block': registering
[    0.328404] device: 'blkcg_punt_bio': device_add
[    0.328498] bus: 'workqueue': add device blkcg_punt_bio
[    0.328666] PM: Adding info for workqueue:blkcg_punt_bio
[    0.329207] bus: 'aprbus': registered
[    0.329265] bus: 'rpmsg': add driver qcom,apr
[    0.329441] bus: 'platform': add driver reg-fixed-voltage
[    0.329555] platform vsdcc-regulator: probing driver 
reg-fixed-voltage asynchronously
[    0.329993] bus: 'platform': add driver gpio-regulator
[    0.330302] bus: 'platform': add driver qcom_rpm_reg
[    0.330562] platform 108000.rpm:regulators: probing driver 
qcom_rpm_reg asynchronously
[    0.330903] device class 'misc': registering
[    0.331009] iommu: Default domain type: Translated
[    0.331079] iommu: DMA domain TLB invalidation policy: strict mode
[    0.334851] bus: 'dp-aux': registered
[    0.335569] bus: 'platform': add driver pm8xxx-core
[    0.336335] bus: 'dax': registered
[    0.336576] device class 'mdio_bus': registering
[    0.336800] bus: 'mdio_bus': registered
[    0.336862] bus: 'mdio_bus': add driver Generic Clause 45 PHY
[    0.337015] bus: 'mdio_bus': add driver Generic PHY
[    0.337368] bus: 'ulpi': registered
[    0.337703] bus: 'usb': registered
[    0.337767] device class 'usbmisc': registering
[    0.337873] bus: 'usb': add driver usbfs
[    0.338033] usbcore: registered new interface driver usbfs
[    0.340826] bus: 'usb': add driver hub
[    0.340984] usbcore: registered new interface driver hub
[    0.346304] bus: 'usb': add driver usb
[    0.346441] usbcore: registered new device driver usb
[    0.351759] device class 'udc': registering
[    0.352003] bus: 'gadget': registered
[    0.352050] device class 'usb_role': registering
[    0.352276] bus: 'serio': registered
[    0.352323] device class 'input': registering
[    0.352464] device class 'rtc': registering
[    0.352589] bus: 'platform': add driver i2c-gpio
[    0.352895] device class 'rc': registering
[    0.353012] device class 'pps': registering
[    0.353104] pps_core: LinuxPPS API ver. 1 registered
[    0.356522] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    0.361243] platform vsdcc-regulator: bus: 'platform': 
__driver_probe_device: matched device with driver reg-fixed-voltage
[    0.361528] platform vsdcc-regulator: bus: 'platform': really_probe: 
probing driver reg-fixed-voltage with device
[    0.361578] reg-fixed-voltage vsdcc-regulator: no pinctrl handle
[    0.361575] device class 'power_supply': registering
[    0.361669] device class 'hwmon': registering
[    0.361783] reg-fixed-voltage vsdcc-regulator: using DT 
'/vsdcc-regulator' for '(default)' GPIO lookup
[    0.361847] of_get_named_gpiod_flags: can't parse 'gpios' property of 
node '/vsdcc-regulator[0]'
[    0.361907] of_get_named_gpiod_flags: can't parse 'gpio' property of 
node '/vsdcc-regulator[0]'
[    0.361953] reg-fixed-voltage vsdcc-regulator: using lookup tables 
for GPIO lookup
[    0.361980] reg-fixed-voltage vsdcc-regulator: No GPIO consumer 
(default) found
[    0.362005] bus: 'mmc': registered
[    0.362051] device: 'regulator.1': device_add
[    0.362049] device class 'mmc_host': registering
[    0.362337] PM: Adding info for No Bus:regulator.1
[    0.362385] bus: 'sdio': registered
[    0.362434] device class 'leds': registering
[    0.362530] reg-fixed-voltage vsdcc-regulator: driver: 
'reg-fixed-voltage': driver_bound: bound to device
[    0.362543] bus: 'platform': add driver qcom_scm
[    0.362653] reg-fixed-voltage vsdcc-regulator: bus: 'platform': 
really_probe: bound device to driver reg-fixed-voltage
[    0.362693] reg-fixed-voltage vsdcc-regulator: driver 
reg-fixed-voltage async attach completed: 0
[    0.362735] platform 108000.rpm:regulators: bus: 'platform': 
__driver_probe_device: matched device with driver qcom_rpm_reg
[    0.362774] platform 108000.rpm:regulators: bus: 'platform': 
really_probe: probing driver qcom_rpm_reg with device
[    0.362819] qcom_rpm_reg 108000.rpm:regulators: no pinctrl handle
[    0.363217] device class 'remoteproc': registering
[    0.363441] s1: Bringing 0uV into 1225000-1225000uV
[    0.363500] bus: 'nvmem': registered
[    0.370668] bus: 'nvmem-layout': registered
[    0.370716] device class 'mux': registering
[    0.370882] device class 'net': registering
[    0.371114] device: 'lo': device_add
[    0.372085] PM: Adding info for No Bus:lo
[    0.373634] device: 'vga_arbiter': device_add
[    0.373834] PM: Adding info for No Bus:vga_arbiter
[    0.374269] vgaarb: loaded
[    0.375762] device: 'regulator.2': device_add
[    0.375764] clocksource: Switched to clocksource dg_timer
[    0.377253] device class 'mem': registering
[    0.378165] PM: Adding info for No Bus:regulator.2
[    0.378356] device: 'mem': device_add
[    0.378494] s2: Bringing 0uV into 1300000-1300000uV
[    0.378575] PM: Adding info for No Bus:mem
[    0.383485] device: 'regulator.3': device_add
[    0.383678] PM: Adding info for No Bus:regulator.3
[    0.383765] device: 'null': device_add
[    0.383946] PM: Adding info for No Bus:null
[    0.384218] s3: Bringing 0uV into 500000-500000uV
[    0.384332] device: 'port': device_add
[    0.388048] device: 'regulator.4': device_add
[    0.388203] PM: Adding info for No Bus:port
[    0.396224] device: 'zero': device_add
[    0.396537] PM: Adding info for No Bus:zero
[    0.396939] device: 'full': device_add
[    0.397260] PM: Adding info for No Bus:full
[    0.397664] device: 'random': device_add
[    0.397970] PM: Adding info for No Bus:random
[    0.398366] device: 'urandom': device_add
[    0.398672] PM: Adding info for No Bus:urandom
[    0.399075] device: 'kmsg': device_add
[    0.399379] PM: Adding info for No Bus:kmsg
[    0.399810] device: 'tty': device_add
[    0.400154] PM: Adding info for No Bus:tty
[    0.400560] device: 'console': device_add
[    0.400886] PM: Adding info for No Bus:console
[    0.401287] device: 'tty0': device_add
[    0.401614] PM: Adding info for No Bus:tty0
[    0.402005] device class 'vc': registering
[    0.402118] device: 'vcs': device_add
[    0.402466] PM: Adding info for No Bus:vcs
[    0.402902] device: 'vcsu': device_add
[    0.403210] PM: Adding info for No Bus:vcsu
[    0.403603] device: 'vcsa': device_add
[    0.403909] PM: Adding info for No Bus:vcsa
[    0.404322] device: 'vcs1': device_add
[    0.404634] PM: Adding info for No Bus:vcs1
[    0.405037] device: 'vcsu1': device_add
[    0.405447] PM: Adding info for No Bus:vcsu1
[    0.405961] device: 'vcsa1': device_add
[    0.406188] PM: Adding info for No Bus:regulator.4
[    0.406203] PM: Adding info for No Bus:vcsa1
[    0.406601] device: 'tty1': device_add
[    0.406745] s4: Bringing 0uV into 1800000-1800000uV
[    0.406781] PM: Adding info for No Bus:tty1
[    0.407171] device: 'tty2': device_add
[    0.407347] PM: Adding info for No Bus:tty2
[    0.407723] device: 'tty3': device_add
[    0.407917] PM: Adding info for No Bus:tty3
[    0.408297] device: 'tty4': device_add
[    0.408473] PM: Adding info for No Bus:tty4
[    0.408846] device: 'tty5': device_add
[    0.409022] PM: Adding info for No Bus:tty5
[    0.409398] device: 'tty6': device_add
[    0.409577] PM: Adding info for No Bus:tty6
[    0.409966] device: 'tty7': device_add
[    0.410143] PM: Adding info for No Bus:tty7
[    0.410521] device: 'tty8': device_add
[    0.410697] PM: Adding info for No Bus:tty8
[    0.411094] device: 'tty9': device_add
[    0.411269] PM: Adding info for No Bus:tty9
[    0.411645] device: 'tty10': device_add
[    0.411835] PM: Adding info for No Bus:tty10
[    0.412228] device: 'tty11': device_add
[    0.412422] PM: Adding info for No Bus:tty11
[    0.412625] device: 'regulator.5': device_add
[    0.412817] PM: Adding info for No Bus:regulator.5
[    0.412816] device: 'tty12': device_add
[    0.412988] PM: Adding info for No Bus:tty12
[    0.413114] s7: Bringing 0uV into 1150000-1150000uV
[    0.413207] device: 'regulator.6': device_add
[    0.413386] PM: Adding info for No Bus:regulator.6
[    0.413435] device: 'tty13': device_add
[    0.413614] PM: Adding info for No Bus:tty13
[    0.413998] device: 'tty14': device_add
[    0.414162] s8: Bringing 0uV into 2050000-2050000uV
[    0.414194] PM: Adding info for No Bus:tty14
[    0.417258] device: 'tty15': device_add
[    0.417435] PM: Adding info for No Bus:tty15
[    0.417818] device: 'tty16': device_add
[    0.417994] PM: Adding info for No Bus:tty16
[    0.418372] device: 'tty17': device_add
[    0.418548] PM: Adding info for No Bus:tty17
[    0.418927] device: 'tty18': device_add
[    0.419120] PM: Adding info for No Bus:tty18
[    0.419498] device: 'tty19': device_add
[    0.419674] PM: Adding info for No Bus:tty19
[    0.420054] device: 'tty20': device_add
[    0.420232] PM: Adding info for No Bus:tty20
[    0.420612] device: 'tty21': device_add
[    0.420789] PM: Adding info for No Bus:tty21
[    0.421204] device: 'tty22': device_add
[    0.421396] PM: Adding info for No Bus:tty22
[    0.421785] device: 'tty23': device_add
[    0.421964] PM: Adding info for No Bus:tty23
[    0.422341] device: 'tty24': device_add
[    0.422518] PM: Adding info for No Bus:tty24
[    0.422901] device: 'tty25': device_add
[    0.423077] PM: Adding info for No Bus:tty25
[    0.423455] device: 'tty26': device_add
[    0.423646] PM: Adding info for No Bus:tty26
[    0.424027] device: 'tty27': device_add
[    0.424204] PM: Adding info for No Bus:tty27
[    0.424602] device: 'tty28': device_add
[    0.424780] PM: Adding info for No Bus:tty28
[    0.425185] device: 'tty29': device_add
[    0.425361] PM: Adding info for No Bus:tty29
[    0.425756] device: 'tty30': device_add
[    0.426039] PM: Adding info for No Bus:tty30
[    0.426424] device: 'tty31': device_add
[    0.426602] PM: Adding info for No Bus:tty31
[    0.427029] device: 'tty32': device_add
[    0.427206] PM: Adding info for No Bus:tty32
[    0.427402] device: 'regulator.7': device_add
[    0.427595] PM: Adding info for No Bus:regulator.7
[    0.427603] device: 'tty33': device_add
[    0.427797] PM: Adding info for No Bus:tty33
[    0.428034] l1: Bringing 0uV into 1050000-1050000uV
[    0.428189] device: 'tty34': device_add
[    0.428369] PM: Adding info for No Bus:tty34
[    0.428776] device: 'tty35': device_add
[    0.428955] PM: Adding info for No Bus:tty35
[    0.429338] device: 'tty36': device_add
[    0.429517] PM: Adding info for No Bus:tty36
[    0.429893] device: 'tty37': device_add
[    0.430088] PM: Adding info for No Bus:tty37
[    0.430470] device: 'tty38': device_add
[    0.430647] PM: Adding info for No Bus:tty38
[    0.431038] device: 'tty39': device_add
[    0.431215] PM: Adding info for No Bus:tty39
[    0.431597] device: 'tty40': device_add
[    0.431774] PM: Adding info for No Bus:tty40
[    0.432155] device: 'tty41': device_add
[    0.432346] PM: Adding info for No Bus:tty41
[    0.432579] device: 'regulator.8': device_add
[    0.432728] device: 'tty42': device_add
[    0.432762] PM: Adding info for No Bus:regulator.8
[    0.432908] PM: Adding info for No Bus:tty42
[    0.433082] l2: Bringing 0uV into 1200000-1200000uV
[    0.433157] device: 'regulator.9': device_add
[    0.433302] device: 'tty43': device_add
[    0.433345] PM: Adding info for No Bus:regulator.9
[    0.433497] PM: Adding info for No Bus:tty43
[    0.433776] l3: Bringing 0uV into 3075000-3075000uV
[    0.433934] device: 'tty44': device_add
[    0.436886] device: 'regulator.10': device_add
[    0.437095] PM: Adding info for No Bus:tty44
[    0.437399] PM: Adding info for No Bus:regulator.10
[    0.437511] device: 'tty45': device_add
[    0.437706] PM: Adding info for No Bus:tty45
[    0.438097] device: 'tty46': device_add
[    0.438199] l4: Bringing 0uV into 1800000-1800000uV
[    0.438275] PM: Adding info for No Bus:tty46
[    0.441904] device: 'tty47': device_add
[    0.442085] PM: Adding info for No Bus:tty47
[    0.442489] device: 'tty48': device_add
[    0.442666] PM: Adding info for No Bus:tty48
[    0.443049] device: 'tty49': device_add
[    0.443242] PM: Adding info for No Bus:tty49
[    0.443621] device: 'tty50': device_add
[    0.443797] PM: Adding info for No Bus:tty50
[    0.444178] device: 'tty51': device_add
[    0.444354] PM: Adding info for No Bus:tty51
[    0.444734] device: 'tty52': device_add
[    0.444910] PM: Adding info for No Bus:tty52
[    0.445303] device: 'tty53': device_add
[    0.445482] PM: Adding info for No Bus:tty53
[    0.445976] device: 'tty54': device_add
[    0.446154] PM: Adding info for No Bus:tty54
[    0.446537] device: 'tty55': device_add
[    0.446714] PM: Adding info for No Bus:tty55
[    0.447096] device: 'tty56': device_add
[    0.447289] PM: Adding info for No Bus:tty56
[    0.447673] device: 'tty57': device_add
[    0.447851] PM: Adding info for No Bus:tty57
[    0.448232] device: 'tty58': device_add
[    0.448411] PM: Adding info for No Bus:tty58
[    0.448790] device: 'tty59': device_add
[    0.448966] PM: Adding info for No Bus:tty59
[    0.449388] device: 'tty60': device_add
[    0.449581] PM: Adding info for No Bus:tty60
[    0.450037] device: 'tty61': device_add
[    0.450214] PM: Adding info for No Bus:tty61
[    0.450592] device: 'tty62': device_add
[    0.450768] PM: Adding info for No Bus:tty62
[    0.451149] device: 'tty63': device_add
[    0.451326] PM: Adding info for No Bus:tty63
[    0.452236] device: 'hw_random': device_add
[    0.452484] PM: Adding info for No Bus:hw_random
[    0.453331] NET: Registered PF_INET protocol family
[    0.453942] IP idents hash table entries: 16384 (order: 5, 131072 
bytes, linear)
[    0.459444] device: 'regulator.11': device_add
[    0.459656] PM: Adding info for No Bus:regulator.11
[    0.460011] l5: Bringing 0uV into 2950000-2950000uV
[    0.462481] tcp_listen_portaddr_hash hash table entries: 512 (order: 
1, 10240 bytes, linear)
[    0.464617] device: 'regulator.12': device_add
[    0.469258] Table-perturb hash table entries: 65536 (order: 6, 262144 
bytes, linear)
[    0.469388] PM: Adding info for No Bus:regulator.12
[    0.477873] TCP established hash table entries: 8192 (order: 3, 32768 
bytes, linear)
[    0.478429] l6: Bringing 0uV into 2950000-2950000uV
[    0.485581] TCP bind hash table entries: 8192 (order: 6, 327680 
bytes, linear)
[    0.493182] device: 'regulator.13': device_add
[    0.497843] PM: Adding info for No Bus:regulator.13
[    0.498290] TCP: Hash tables configured (established 8192 bind 8192)
[    0.498729] l7: Bringing 0uV into 1850000-1850000uV
[    0.504978] UDP hash table entries: 512 (order: 2, 24576 bytes, linear)
[    0.515973] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes, 
linear)
[    0.522763] PCI: CLS 0 bytes, default 64
[    0.528454] device: 'regulator.14': device_add
[    0.529717] PM: Adding info for No Bus:regulator.14
[    0.530089] l8: Bringing 0uV into 3000000-3000000uV
[    0.530496] bus: 'clocksource': registered
[    0.533424] device: 'clocksource': device_add
[    0.533451] device: 'regulator.15': device_add
[    0.533774] PM: Adding info for No Bus:regulator.15
[    0.534431] l9: Bringing 0uV into 2850000-2850000uV
[    0.538099] device: 'regulator.16': device_add
[    0.538529] PM: Adding info for No Bus:regulator.16
[    0.539165] l10: Bringing 0uV into 3000000-3000000uV
[    0.542811] device: 'regulator.17': device_add
[    0.543262] PM: Adding info for No Bus:regulator.17
[    0.543909] l11: Bringing 0uV into 2800000-2800000uV
[    0.548146] device: 'regulator.18': device_add
[    0.548592] PM: Adding info for No Bus:regulator.18
[    0.549251] l12: Bringing 0uV into 1200000-1200000uV
[    0.550043] Trying to unpack rootfs image as initramfs...
[    0.552843] device: 'regulator.19': device_add
[    0.558288] PM: Adding info for No Bus:regulator.19
[    0.558811] l14: Bringing 0uV into 1800000-1800000uV
[    0.563002] device: 'regulator.20': device_add
[    0.563435] PM: Adding info for No Bus:regulator.20
[    0.564060] l15: Bringing 0uV into 1800000-1800000uV
[    0.568107] device: 'regulator.21': device_add
[    0.568555] PM: Adding info for No Bus:regulator.21
[    0.569194] l16: Bringing 0uV into 2800000-2800000uV
[    0.572886] device: 'regulator.22': device_add
[    0.573313] PM: Adding info for No Bus:regulator.22
[    0.573951] l17: Bringing 0uV into 3300000-3300000uV
[    0.577883] device: 'regulator.23': device_add
[    0.578321] PM: Adding info for No Bus:regulator.23
[    0.578964] l18: Bringing 0uV into 1200000-1200000uV
[    0.582665] device: 'regulator.24': device_add
[    0.583090] PM: Adding info for No Bus:regulator.24
[    0.583614] l21: Bringing 0uV into 1900000-1900000uV
[    0.587692] device: 'regulator.25': device_add
[    0.588144] PM: Adding info for No Bus:regulator.25
[    0.588677] l22: Bringing 0uV into 2750000-2750000uV
[    0.592479] device: 'regulator.26': device_add
[    0.592909] PM: Adding info for No Bus:regulator.26
[    0.593695] l23: Bringing 0uV into 1800000-1800000uV
[    0.597738] PM: Adding info for No Bus:clocksource
[    0.597791] device: 'clocksource0': device_add
[    0.597877] bus: 'clocksource': add device clocksource0
[    0.597993] PM: Adding info for clocksource:clocksource0
[    0.598126] bus: 'platform': add driver alarmtimer
[    0.598375] bus: 'clockevents': registered
[    0.598412] device: 'clockevents': device_add
[    0.598537] PM: Adding info for No Bus:clockevents
[    0.598581] device: 'clockevent0': device_add
[    0.598633] bus: 'clockevents': add device clockevent0
[    0.598711] PM: Adding info for clockevents:clockevent0
[    0.598800] device: 'clockevent1': device_add
[    0.598864] bus: 'clockevents': add device clockevent1
[    0.598943] PM: Adding info for clockevents:clockevent1
[    0.599023] device: 'broadcast': device_add
[    0.599075] bus: 'clockevents': add device broadcast
[    0.599150] PM: Adding info for clockevents:broadcast
[    0.599514] bus: 'event_source': registered
[    0.599548] device: 'breakpoint': device_add
[    0.599600] bus: 'event_source': add device breakpoint
[    0.599692] PM: Adding info for event_source:breakpoint
[    0.599758] device: 'tracepoint': device_add
[    0.599811] bus: 'event_source': add device tracepoint
[    0.599909] PM: Adding info for event_source:tracepoint
[    0.599977] device: 'software': device_add
[    0.600029] bus: 'event_source': add device software
[    0.600117] PM: Adding info for event_source:software
[    0.600177] Initialise system trusted keyrings
[    0.602658] device: 'regulator.27': device_add
[    0.602860] PM: Adding info for No Bus:regulator.27
[    0.603299] l24: Bringing 0uV into 750000-750000uV
[    0.606625] device: 'regulator.28': device_add
[    0.606837] PM: Adding info for No Bus:regulator.28
[    0.607515] l25: Bringing 0uV into 1225000-1225000uV
[    0.611343] workingset: timestamp_bits=14 max_order=18 bucket_order=4
[    0.616516] zbud: loaded
[    0.623452] Key type asymmetric registered
[    0.625084] Asymmetric key parser 'x509' registered
[    0.629316] bounce: pool size: 64 pages
[    0.634107] device: 'regulator.29': device_add
[    0.634331] PM: Adding info for No Bus:regulator.29
[    0.634756] device: 'regulator.30': device_add
[    0.634933] PM: Adding info for No Bus:regulator.30
[    0.635590] device: 'regulator.31': device_add
[    0.635785] PM: Adding info for No Bus:regulator.31
[    0.636360] device: 'regulator.32': device_add
[    0.636536] PM: Adding info for No Bus:regulator.32
[    0.636977] device: 'regulator.33': device_add
[    0.637161] PM: Adding info for No Bus:regulator.33
[    0.637652] device: 'regulator.34': device_add
[    0.637818] PM: Adding info for No Bus:regulator.34
[    0.638342] device: 'regulator.35': device_add
[    0.638508] PM: Adding info for No Bus:regulator.35
[    0.639005] device: 'regulator.36': device_add
[    0.639181] PM: Adding info for No Bus:regulator.36
[    0.639718] device: 'regulator.37': device_add
[    0.639889] PM: Adding info for No Bus:regulator.37
[    0.640420] device: 'regulator.38': device_add
[    0.640596] PM: Adding info for No Bus:regulator.38
[    0.641128] device: 'regulator.39': device_add
[    0.641293] PM: Adding info for No Bus:regulator.39
[    0.641832] device: 'regulator.40': device_add
[    0.642006] PM: Adding info for No Bus:regulator.40
[    0.642474] device: 'regulator.41': device_add
[    0.642631] PM: Adding info for No Bus:regulator.41
[    0.643235] device: 'regulator.42': device_add
[    0.643414] PM: Adding info for No Bus:regulator.42
[    0.644076] ncp: Bringing 0uV into 1800000-1800000uV
[    0.644161] device: 'regulator.43': device_add
[    0.644345] PM: Adding info for No Bus:regulator.43
[    0.644718] qcom_rpm_reg 108000.rpm:regulators: driver: 
'qcom_rpm_reg': driver_bound: bound to device
[    0.644752] /soc/rpm@108000/regulators Dropping the fwnode link to 
/soc/rpm@108000/regulators/s7
[    0.644841] /soc/rpm@108000/regulators Dropping the fwnode link to 
/soc/rpm@108000/regulators/s1
[    0.644927] /soc/rpm@108000/regulators Dropping the fwnode link to 
/soc/rpm@108000/regulators/s8
[    0.645012] /soc/rpm@108000/regulators Dropping the fwnode link to 
/soc/rpm@108000/regulators/l6
[    0.645098] /soc/rpm@108000/regulators Dropping the fwnode link to 
/soc/rpm@108000/regulators/s4
[    0.645221] /soc/usb@12500000/ulpi/phy Linked as a fwnode consumer to 
/soc/rpm@108000/regulators
[    0.645309] /soc/usb@12500000/ulpi/phy Dropping the fwnode link to 
/soc/rpm@108000/regulators/l3
[    0.645411] /soc/usb@12500000/ulpi/phy Dropping the fwnode link to 
/soc/rpm@108000/regulators/l4
[    0.645515] /soc/mmc@12400000 Linked as a fwnode consumer to 
/soc/rpm@108000/regulators
[    0.645581] /soc/mmc@12400000 Dropping the fwnode link to 
/soc/rpm@108000/regulators/l5
[    0.645662] /soc/mmc@12180000 Linked as a fwnode consumer to 
/soc/rpm@108000/regulators
[    0.645727] /soc/mmc@12180000 Dropping the fwnode link to 
/soc/rpm@108000/regulators/l6
[    0.645903] /soc/mmc@12180000 Dropping the fwnode link to 
/soc/rpm@108000/regulators/l7
[    0.646019] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Linked as 
a fwnode consumer to /soc/rpm@108000/regulators
[    0.646109] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Dropping 
the fwnode link to /soc/rpm@108000/regulators/l17
[    0.646246] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Dropping 
the fwnode link to /soc/rpm@108000/regulators/lvs6
[    0.646393] device: 
'platform:108000.rpm:regulators--platform:16200000.gsbi': device_add
[    0.646577] platform 16200000.gsbi: Linked as a sync state only 
consumer to 108000.rpm:regulators
[    0.646631] device: 
'platform:108000.rpm:regulators--amba:12180000.mmc': device_add
[    0.646799] devices_kset: Moving 12180000.mmc to end of list
[    0.646825] PM: Moving amba:12180000.mmc to end of list
[    0.646851] amba 12180000.mmc: Linked as a consumer to 
108000.rpm:regulators
[    0.646875] /soc/mmc@12180000 Dropping the fwnode link to 
/soc/rpm@108000/regulators
[    0.646964] device: 
'platform:108000.rpm:regulators--amba:12400000.mmc': device_add
[    0.647125] devices_kset: Moving 12400000.mmc to end of list
[    0.647150] PM: Moving amba:12400000.mmc to end of list
[    0.647175] amba 12400000.mmc: Linked as a consumer to 
108000.rpm:regulators
[    0.647199] /soc/mmc@12400000 Dropping the fwnode link to 
/soc/rpm@108000/regulators
[    0.647292] device: 
'platform:108000.rpm:regulators--platform:12500000.usb': device_add
[    0.647472] platform 12500000.usb: Linked as a sync state only 
consumer to 108000.rpm:regulators
[    0.647593] qcom_rpm_reg 108000.rpm:regulators: bus: 'platform': 
really_probe: bound device to driver qcom_rpm_reg
[    0.647636] qcom_rpm_reg 108000.rpm:regulators: driver qcom_rpm_reg 
async attach completed: 0
[    0.647874] io scheduler bfq registered
[    0.658700] bus: 'platform': add driver qcom-ebi2
[    0.658956] bus: 'platform': add driver simple-pm-bus
[    0.659031] platform soc: bus: 'platform': __driver_probe_device: 
matched device with driver simple-pm-bus
[    0.659073] platform soc: bus: 'platform': really_probe: probing 
driver simple-pm-bus with device
[    0.659122] simple-pm-bus soc: no pinctrl handle
[    0.659221] simple-pm-bus soc: driver: 'simple-pm-bus': driver_bound: 
bound to device
[    0.659258] /soc/gsbi@16200000/i2c@16280000 Linked as a fwnode 
consumer to /soc
[    0.659320] /soc/gsbi@16200000/i2c@16280000 Dropping the fwnode link 
to /soc/interrupt-controller@2000000
[    0.659387] /soc/gsbi@16000000/spi@16080000 Linked as a fwnode 
consumer to /soc
[    0.659444] /soc/gsbi@16000000/spi@16080000 Dropping the fwnode link 
to /soc/interrupt-controller@2000000
[    0.659510] /soc/gsbi@16400000/serial@16440000 Linked as a fwnode 
consumer to /soc
[    0.659567] /soc/gsbi@16400000/serial@16440000 Dropping the fwnode 
link to /soc/interrupt-controller@2000000
[    0.659750] device: 'platform:soc--platform:16400000.gsbi': device_add
[    0.659937] platform 16400000.gsbi: Linked as a sync state only 
consumer to soc
[    0.659987] device: 'platform:soc--platform:16000000.gsbi': device_add
[    0.660144] platform 16000000.gsbi: Linked as a sync state only 
consumer to soc
[    0.660192] device: 'platform:soc--platform:16200000.gsbi': device_add
[    0.660349] platform 16200000.gsbi: Linked as a sync state only 
consumer to soc
[    0.660448] simple-pm-bus soc: bus: 'platform': really_probe: bound 
device to driver simple-pm-bus
[    0.660642] device class 'phy': registering
[    0.660756] bus: 'ulpi': add driver qcom_usb_hs_phy
[    0.660849] bus: 'ulpi': add driver qcom_usb_hsic_phy
[    0.660938] bus: 'platform': add driver qcom-ssbi-gpio
[    0.661183] bus: 'platform': add driver qcom-ssbi-mpp
[    0.661489] bus: 'platform': add driver of_fixed_factor_clk
[    0.661665] bus: 'platform': add driver of_fixed_clk
[    0.661825] bus: 'platform': add driver gpio-clk
[    0.662000] bus: 'platform': add driver mmcc-msm8960
[    0.662080] platform 4000000.clock-controller: bus: 'platform': 
__driver_probe_device: matched device with driver mmcc-msm8960
[    0.662121] platform 4000000.clock-controller: bus: 'platform': 
really_probe: probing driver mmcc-msm8960 with device
[    0.662166] mmcc-msm8960 4000000.clock-controller: no pinctrl handle
[    0.675714] mmcc-msm8960 4000000.clock-controller: driver: 
'mmcc-msm8960': driver_bound: bound to device
[    0.675986] mmcc-msm8960 4000000.clock-controller: bus: 'platform': 
really_probe: bound device to driver mmcc-msm8960
[    0.676167] bus: 'platform': add driver bam-dma-engine
[    0.676383] bus: 'platform': add driver gsbi
[    0.676483] platform 16400000.gsbi: bus: 'platform': 
__driver_probe_device: matched device with driver gsbi
[    0.676524] platform 16400000.gsbi: bus: 'platform': really_probe: 
probing driver gsbi with device
[    0.676569] gsbi 16400000.gsbi: no pinctrl handle
[    0.676936] gsbi 16400000.gsbi: GSBI port protocol: 6 crci: 0
[    0.677483] device: '16440000.serial': device_add
[    0.677552] bus: 'platform': add device 16440000.serial
[    0.677655] PM: Adding info for platform:16440000.serial
[    0.677780] device: 'platform:soc--platform:16440000.serial': device_add
[    0.677962] devices_kset: Moving 16440000.serial to end of list
[    0.677988] PM: Moving platform:16440000.serial to end of list
[    0.678016] platform 16440000.serial: Linked as a consumer to soc
[    0.678042] /soc/gsbi@16400000/serial@16440000 Dropping the fwnode 
link to /soc
[    0.678130] device: 
'platform:900000.clock-controller--platform:16440000.serial': device_add
[    0.678297] devices_kset: Moving 16440000.serial to end of list
[    0.678321] PM: Moving platform:16440000.serial to end of list
[    0.678347] platform 16440000.serial: Linked as a consumer to 
900000.clock-controller
[    0.678371] /soc/gsbi@16400000/serial@16440000 Dropping the fwnode 
link to /soc/clock-controller@900000
[    0.678689] gsbi 16400000.gsbi: driver: 'gsbi': driver_bound: bound 
to device
[    0.678746] gsbi 16400000.gsbi: Dropping the link to soc
[    0.678772] device: 'platform:soc--platform:16400000.gsbi': 
device_unregister
[    0.679024] gsbi 16400000.gsbi: bus: 'platform': really_probe: bound 
device to driver gsbi
[    0.679083] platform 16000000.gsbi: bus: 'platform': 
__driver_probe_device: matched device with driver gsbi
[    0.679124] platform 16000000.gsbi: bus: 'platform': really_probe: 
probing driver gsbi with device
[    0.679442] gsbi 16000000.gsbi: no init pinctrl state
[    0.679530] gsbi 16000000.gsbi: no sleep pinctrl state
[    0.679557] gsbi 16000000.gsbi: no idle pinctrl state
[    0.679685] gsbi 16000000.gsbi: GSBI port protocol: 3 crci: 0
[    0.681860] device: '16080000.spi': device_add
[    0.681926] bus: 'platform': add device 16080000.spi
[    0.682021] PM: Adding info for platform:16080000.spi
[    0.682132] device: 'platform:soc--platform:16080000.spi': device_add
[    0.682302] devices_kset: Moving 16080000.spi to end of list
[    0.682328] PM: Moving platform:16080000.spi to end of list
[    0.682355] platform 16080000.spi: Linked as a consumer to soc
[    0.682378] /soc/gsbi@16000000/spi@16080000 Dropping the fwnode link 
to /soc
[    0.682474] device: 
'platform:900000.clock-controller--platform:16080000.spi': device_add
[    0.682644] devices_kset: Moving 16080000.spi to end of list
[    0.682669] PM: Moving platform:16080000.spi to end of list
[    0.682696] platform 16080000.spi: Linked as a consumer to 
900000.clock-controller
[    0.682721] /soc/gsbi@16000000/spi@16080000 Dropping the fwnode link 
to /soc/clock-controller@900000
[    0.682816] device: 'platform:800000.pinctrl--platform:16080000.spi': 
device_add
[    0.682981] devices_kset: Moving 16080000.spi to end of list
[    0.683006] PM: Moving platform:16080000.spi to end of list
[    0.683032] platform 16080000.spi: Linked as a consumer to 800000.pinctrl
[    0.683056] /soc/gsbi@16000000/spi@16080000 Dropping the fwnode link 
to /soc/pinctrl@800000
[    0.683293] gsbi 16000000.gsbi: driver: 'gsbi': driver_bound: bound 
to device
[    0.683349] gsbi 16000000.gsbi: Dropping the link to soc
[    0.683375] device: 'platform:soc--platform:16000000.gsbi': 
device_unregister
[    0.683592] gsbi 16000000.gsbi: bus: 'platform': really_probe: bound 
device to driver gsbi
[    0.683645] platform 16200000.gsbi: bus: 'platform': 
__driver_probe_device: matched device with driver gsbi
[    0.683684] platform 16200000.gsbi: bus: 'platform': really_probe: 
probing driver gsbi with device
[    0.683730] gsbi 16200000.gsbi: no pinctrl handle
[    0.683855] gsbi 16200000.gsbi: GSBI port protocol: 2 crci: 0
[    0.687660] device: '16280000.i2c': device_add
[    0.687727] bus: 'platform': add device 16280000.i2c
[    0.687823] PM: Adding info for platform:16280000.i2c
[    0.687939] device: 'platform:soc--platform:16280000.i2c': device_add
[    0.688112] devices_kset: Moving 16280000.i2c to end of list
[    0.688137] PM: Moving platform:16280000.i2c to end of list
[    0.688164] platform 16280000.i2c: Linked as a consumer to soc
[    0.688187] /soc/gsbi@16200000/i2c@16280000 Dropping the fwnode link 
to /soc
[    0.688270] device: 'platform:800000.pinctrl--platform:16280000.i2c': 
device_add
[    0.688432] devices_kset: Moving 16280000.i2c to end of list
[    0.688456] PM: Moving platform:16280000.i2c to end of list
[    0.688482] platform 16280000.i2c: Linked as a consumer to 800000.pinctrl
[    0.688507] /soc/gsbi@16200000/i2c@16280000 Dropping the fwnode link 
to /soc/pinctrl@800000
[    0.688601] device: 
'platform:900000.clock-controller--platform:16280000.i2c': device_add
[    0.688764] devices_kset: Moving 16280000.i2c to end of list
[    0.688789] PM: Moving platform:16280000.i2c to end of list
[    0.688815] platform 16280000.i2c: Linked as a consumer to 
900000.clock-controller
[    0.688839] /soc/gsbi@16200000/i2c@16280000 Dropping the fwnode link 
to /soc/clock-controller@900000
[    0.688935] device: 
'platform:108000.rpm:regulators--platform:16280000.i2c': device_add
[    0.689104] platform 16280000.i2c: Linked as a sync state only 
consumer to 108000.rpm:regulators
[    0.689308] gsbi 16200000.gsbi: driver: 'gsbi': driver_bound: bound 
to device
[    0.689365] gsbi 16200000.gsbi: Dropping the link to 800000.pinctrl
[    0.689391] device: 
'platform:800000.pinctrl--platform:16200000.gsbi': device_unregister
[    0.689562] gsbi 16200000.gsbi: Dropping the link to 
108000.rpm:regulators
[    0.689590] device: 
'platform:108000.rpm:regulators--platform:16200000.gsbi': device_unregister
[    0.689755] gsbi 16200000.gsbi: Dropping the link to soc
[    0.689781] device: 'platform:soc--platform:16200000.gsbi': 
device_unregister
[    0.690000] gsbi 16200000.gsbi: bus: 'platform': really_probe: bound 
device to driver gsbi
[    0.690138] bus: 'platform': add driver qcom_smp2p
[    0.690358] bus: 'platform': add driver qcom-smsm
[    0.690548] bus: 'rpmsg': add driver qcom_wcnss_ctrl
[    0.690644] bus: 'platform': add driver qcom-spmi-regulator
[    0.691375] device: 'ptmx': device_add
[    0.691484] PM: Adding info for No Bus:ptmx
[    0.692836] bus: 'platform': add driver msm_serial
[    0.693032] platform 16440000.serial: bus: 'platform': 
__driver_probe_device: matched device with driver msm_serial
[    0.693081] platform 16440000.serial: bus: 'platform': really_probe: 
probing driver msm_serial with device
[    0.693133] msm_serial 16440000.serial: no pinctrl handle
[    0.693233] msm_serial 16440000.serial: msm_serial: detected port #0
[    0.693441] msm_serial 16440000.serial: uartclk = 1862068
[    0.699699] device: '16440000.serial:0': device_add
[    0.699758] bus: 'serial-base': add device 16440000.serial:0
[    0.699859] PM: Adding info for serial-base:16440000.serial:0
[    0.699933] serial-base 16440000.serial:0: bus: 'serial-base': 
__driver_probe_device: matched device with driver ctrl
[    0.699971] serial-base 16440000.serial:0: bus: 'serial-base': 
really_probe: probing driver ctrl with device
[    0.700016] ctrl 16440000.serial:0: no default pinctrl state
[    0.700076] ctrl 16440000.serial:0: driver: 'ctrl': driver_bound: 
bound to device
[    0.700141] ctrl 16440000.serial:0: bus: 'serial-base': really_probe: 
bound device to driver ctrl
[    0.700207] device: '16440000.serial:0.0': device_add
[    0.700255] bus: 'serial-base': add device 16440000.serial:0.0
[    0.700335] PM: Adding info for serial-base:16440000.serial:0.0
[    0.700412] serial-base 16440000.serial:0.0: bus: 'serial-base': 
__driver_probe_device: matched device with driver port
[    0.700450] serial-base 16440000.serial:0.0: bus: 'serial-base': 
really_probe: probing driver port with device
[    0.700493] port 16440000.serial:0.0: no default pinctrl state
[    0.700553] port 16440000.serial:0.0: driver: 'port': driver_bound: 
bound to device
[    0.700613] port 16440000.serial:0.0: bus: 'serial-base': 
really_probe: bound device to driver port
[    0.700711] 16440000.serial: ttyMSM0 at MMIO 0x16440000 (irq = 29, 
base_baud = 116379) is a MSM
[    0.704692] msm_serial: console setup on port #0
[    0.704919] printk: legacy console [ttyMSM0] enabled
[    0.713405] printk: legacy bootconsole [msm_serial_dm0] disabled
[    0.725534] device: 'ttyMSM0': device_add
[    0.725748] PM: Adding info for No Bus:ttyMSM0
[    0.726434] msm_serial 16440000.serial: driver: 'msm_serial': 
driver_bound: bound to device
[    0.726577] msm_serial 16440000.serial: bus: 'platform': 
really_probe: bound device to driver msm_serial
[    0.726680] msm_serial: driver initialized
[    0.730386] bus: 'platform': add driver msm_iommu
[    0.730612] device class 'drm': registering
[    0.730780] bus: 'platform': add driver msm_mdp
[    0.731004] bus: 'platform': add driver msm_dpu
[    0.731804] bus: 'platform': add driver msm_dsi_phy
[    0.732137] bus: 'platform': add driver msm_dsi
[    0.732352] bus: 'platform': add driver msm_hdmi_phy
[    0.732651] bus: 'platform': add driver hdmi_msm
[    0.732992] bus: 'platform': add driver adreno
[    0.733260] bus: 'platform': add driver mdp4
[    0.733456] bus: 'platform': add driver msm-mdss
[    0.734227] bus: 'platform': add driver msm
[    0.734620] device class 'devcoredump': registering
[    0.734863] device: 'ram0': device_add
[    0.735086] PM: Adding info for No Bus:ram0
[    0.736225] device: '1:0': device_add
[    0.736390] PM: Adding info for No Bus:1:0
[    0.736922] device: 'ram1': device_add
[    0.737128] PM: Adding info for No Bus:ram1
[    0.737984] device: '1:1': device_add
[    0.738132] PM: Adding info for No Bus:1:1
[    0.738563] device: 'ram2': device_add
[    0.738762] PM: Adding info for No Bus:ram2
[    0.739480] device: '1:2': device_add
[    0.739626] PM: Adding info for No Bus:1:2
[    0.740091] device: 'ram3': device_add
[    0.740286] PM: Adding info for No Bus:ram3
[    0.740958] device: '1:3': device_add
[    0.741104] PM: Adding info for No Bus:1:3
[    0.741527] device: 'ram4': device_add
[    0.741724] PM: Adding info for No Bus:ram4
[    0.742500] device: '1:4': device_add
[    0.742655] PM: Adding info for No Bus:1:4
[    0.743083] device: 'ram5': device_add
[    0.743268] PM: Adding info for No Bus:ram5
[    0.743978] device: '1:5': device_add
[    0.744135] PM: Adding info for No Bus:1:5
[    0.744580] device: 'ram6': device_add
[    0.744768] PM: Adding info for No Bus:ram6
[    0.745496] device: '1:6': device_add
[    0.745655] PM: Adding info for No Bus:1:6
[    0.746231] device: 'ram7': device_add
[    0.746423] PM: Adding info for No Bus:ram7
[    0.747187] device: '1:7': device_add
[    0.747346] PM: Adding info for No Bus:1:7
[    0.747783] device: 'ram8': device_add
[    0.747971] PM: Adding info for No Bus:ram8
[    0.748677] device: '1:8': device_add
[    0.748835] PM: Adding info for No Bus:1:8
[    0.749291] device: 'ram9': device_add
[    0.749481] PM: Adding info for No Bus:ram9
[    0.750187] device: '1:9': device_add
[    0.750346] PM: Adding info for No Bus:1:9
[    0.750774] device: 'ram10': device_add
[    0.750960] PM: Adding info for No Bus:ram10
[    0.751714] device: '1:10': device_add
[    0.751872] PM: Adding info for No Bus:1:10
[    0.752317] device: 'ram11': device_add
[    0.752502] PM: Adding info for No Bus:ram11
[    0.753216] device: '1:11': device_add
[    0.753374] PM: Adding info for No Bus:1:11
[    0.753829] device: 'ram12': device_add
[    0.754033] PM: Adding info for No Bus:ram12
[    0.754769] device: '1:12': device_add
[    0.754931] PM: Adding info for No Bus:1:12
[    0.755371] device: 'ram13': device_add
[    0.755558] PM: Adding info for No Bus:ram13
[    0.756445] device: '1:13': device_add
[    0.756605] PM: Adding info for No Bus:1:13
[    0.757058] device: 'ram14': device_add
[    0.757247] PM: Adding info for No Bus:ram14
[    0.757936] device: '1:14': device_add
[    0.758094] PM: Adding info for No Bus:1:14
[    0.758543] device: 'ram15': device_add
[    0.758732] PM: Adding info for No Bus:ram15
[    0.759457] device: '1:15': device_add
[    0.759614] PM: Adding info for No Bus:1:15
[    0.759974] brd: module loaded
[    0.760043] device: 'loop-control': device_add
[    0.760150] PM: Adding info for No Bus:loop-control
[    0.760981] device: 'loop0': device_add
[    0.761189] PM: Adding info for No Bus:loop0
[    0.762532] device: '7:0': device_add
[    0.762688] PM: Adding info for No Bus:7:0
[    0.763079] device: 'loop1': device_add
[    0.763291] PM: Adding info for No Bus:loop1
[    0.764538] device: '7:1': device_add
[    0.764690] PM: Adding info for No Bus:7:1
[    0.765084] device: 'loop2': device_add
[    0.765295] PM: Adding info for No Bus:loop2
[    0.766778] device: '7:2': device_add
[    0.766941] PM: Adding info for No Bus:7:2
[    0.767327] device: 'loop3': device_add
[    0.767519] PM: Adding info for No Bus:loop3
[    0.768800] device: '7:3': device_add
[    0.768973] PM: Adding info for No Bus:7:3
[    0.769390] device: 'loop4': device_add
[    0.769598] PM: Adding info for No Bus:loop4
[    0.770920] device: '7:4': device_add
[    0.771081] PM: Adding info for No Bus:7:4
[    0.771474] device: 'loop5': device_add
[    0.771666] PM: Adding info for No Bus:loop5
[    0.772914] device: '7:5': device_add
[    0.773069] PM: Adding info for No Bus:7:5
[    0.773483] device: 'loop6': device_add
[    0.773693] PM: Adding info for No Bus:loop6
[    0.775046] device: '7:6': device_add
[    0.775197] PM: Adding info for No Bus:7:6
[    0.775582] device: 'loop7': device_add
[    0.775790] PM: Adding info for No Bus:loop7
[    0.782537] Freeing initrd memory: 720K
[    0.783920] device: '7:7': device_add
[    0.784094] PM: Adding info for No Bus:7:7
[    0.784280] loop: module loaded
[    0.785273] bus: 'platform': add driver ssbi
[    0.785432] platform 500000.ssbi: bus: 'platform': 
__driver_probe_device: matched device with driver ssbi
[    0.785478] platform 500000.ssbi: bus: 'platform': really_probe: 
probing driver ssbi with device
[    0.785540] ssbi 500000.ssbi: no pinctrl handle
[    0.785685] ssbi 500000.ssbi: SSBI controller type: 'pmic-arbiter'
[    0.788595] device: '500000.ssbi:pmic': device_add
[    0.788661] bus: 'platform': add device 500000.ssbi:pmic
[    0.788760] PM: Adding info for platform:500000.ssbi:pmic
[    0.788965] device: 
'platform:800000.pinctrl--platform:500000.ssbi:pmic': device_add
[    0.789138] devices_kset: Moving 500000.ssbi:pmic to end of list
[    0.789165] PM: Moving platform:500000.ssbi:pmic to end of list
[    0.789193] platform 500000.ssbi:pmic: Linked as a consumer to 
800000.pinctrl
[    0.789218] /soc/ssbi@500000/pmic Dropping the fwnode link to 
/soc/pinctrl@800000
[    0.789448] platform 500000.ssbi:pmic: bus: 'platform': 
__driver_probe_device: matched device with driver pm8xxx-core
[    0.789487] platform 500000.ssbi:pmic: bus: 'platform': really_probe: 
probing driver pm8xxx-core with device
[    0.789532] pm8xxx-core 500000.ssbi:pmic: no pinctrl handle
[    0.789891] pm8xxx_probe: PMIC revision 1: F4
[    0.794616] pm8xxx_probe: PMIC revision 2: 06
[    0.799400] device: '500000.ssbi:pmic:pwrkey@1c': device_add
[    0.799464] bus: 'platform': add device 500000.ssbi:pmic:pwrkey@1c
[    0.799575] PM: Adding info for platform:500000.ssbi:pmic:pwrkey@1c
[    0.799697] device: 
'platform:500000.ssbi:pmic--platform:500000.ssbi:pmic:pwrkey@1c': device_add
[    0.799870] devices_kset: Moving 500000.ssbi:pmic:pwrkey@1c to end of 
list
[    0.799895] PM: Moving platform:500000.ssbi:pmic:pwrkey@1c to end of list
[    0.799922] platform 500000.ssbi:pmic:pwrkey@1c: Linked as a consumer 
to 500000.ssbi:pmic
[    0.799948] /soc/ssbi@500000/pmic/pwrkey@1c Dropping the fwnode link 
to /soc/ssbi@500000/pmic
[    0.800511] device: '500000.ssbi:pmic:mpps@50': device_add
[    0.800576] bus: 'platform': add device 500000.ssbi:pmic:mpps@50
[    0.800683] PM: Adding info for platform:500000.ssbi:pmic:mpps@50
[    0.800930] platform 500000.ssbi:pmic:mpps@50: bus: 'platform': 
__driver_probe_device: matched device with driver qcom-ssbi-mpp
[    0.800969] platform 500000.ssbi:pmic:mpps@50: bus: 'platform': 
really_probe: probing driver qcom-ssbi-mpp with device
[    0.801014] qcom-ssbi-mpp 500000.ssbi:pmic:mpps@50: no pinctrl handle
[    0.801451] gpiochip_find_base_unlocked: found new base at 664
[    0.801531] gpio gpiochip1: (500000.ssbi:pmic:mpps@50): created GPIO 
range 0->11 ==> 500000.ssbi:pmic:mpps@50 PIN 0->11
[    0.801641] device: 'gpiochip1': device_add
[    0.801705] bus: 'gpio': add device gpiochip1
[    0.801795] PM: Adding info for gpio:gpiochip1
[    0.802197] gpio gpiochip1: (500000.ssbi:pmic:mpps@50): added GPIO 
chardev (254:1)
[    0.802243] device: 'gpiochip664': device_add
[    0.802381] PM: Adding info for No Bus:gpiochip664
[    0.802439] gpio gpiochip1: registered GPIOs 664 to 675 on 
500000.ssbi:pmic:mpps@50
[    0.802476] gpio gpiochip1: (500000.ssbi:pmic:mpps@50): created GPIO 
range 0->11 ==> 500000.ssbi:pmic:mpps@50 PIN 0->11
[    0.802514] qcom-ssbi-mpp 500000.ssbi:pmic:mpps@50: driver: 
'qcom-ssbi-mpp': driver_bound: bound to device
[    0.802639] qcom-ssbi-mpp 500000.ssbi:pmic:mpps@50: bus: 'platform': 
really_probe: bound device to driver qcom-ssbi-mpp
[    0.802784] device: '500000.ssbi:pmic:rtc@11d': device_add
[    0.802846] bus: 'platform': add device 500000.ssbi:pmic:rtc@11d
[    0.802941] PM: Adding info for platform:500000.ssbi:pmic:rtc@11d
[    0.803061] device: 
'platform:500000.ssbi:pmic--platform:500000.ssbi:pmic:rtc@11d': device_add
[    0.803226] devices_kset: Moving 500000.ssbi:pmic:rtc@11d to end of list
[    0.803252] PM: Moving platform:500000.ssbi:pmic:rtc@11d to end of list
[    0.803278] platform 500000.ssbi:pmic:rtc@11d: Linked as a consumer 
to 500000.ssbi:pmic
[    0.803303] /soc/ssbi@500000/pmic/rtc@11d Dropping the fwnode link to 
/soc/ssbi@500000/pmic
[    0.803792] device: '500000.ssbi:pmic:gpio@150': device_add
[    0.803866] bus: 'platform': add device 500000.ssbi:pmic:gpio@150
[    0.803962] PM: Adding info for platform:500000.ssbi:pmic:gpio@150
[    0.804200] platform 500000.ssbi:pmic:gpio@150: bus: 'platform': 
__driver_probe_device: matched device with driver qcom-ssbi-gpio
[    0.804240] platform 500000.ssbi:pmic:gpio@150: bus: 'platform': 
really_probe: probing driver qcom-ssbi-gpio with device
[    0.804285] qcom-ssbi-gpio 500000.ssbi:pmic:gpio@150: no pinctrl handle
[    0.808866] gpiochip_find_base_unlocked: found new base at 676
[    0.808944] gpio gpiochip2: (500000.ssbi:pmic:gpio@150): created GPIO 
range 0->43 ==> 500000.ssbi:pmic:gpio@150 PIN 0->43
[    0.809048] device: 'gpiochip2': device_add
[    0.809111] bus: 'gpio': add device gpiochip2
[    0.809190] PM: Adding info for gpio:gpiochip2
[    0.809579] gpio gpiochip2: (500000.ssbi:pmic:gpio@150): added GPIO 
chardev (254:2)
[    0.809623] device: 'gpiochip676': device_add
[    0.809755] PM: Adding info for No Bus:gpiochip676
[    0.809812] gpio gpiochip2: registered GPIOs 676 to 719 on 
500000.ssbi:pmic:gpio@150
[    0.809849] qcom-ssbi-gpio 500000.ssbi:pmic:gpio@150: driver: 
'qcom-ssbi-gpio': driver_bound: bound to device
[    0.809968] qcom-ssbi-gpio 500000.ssbi:pmic:gpio@150: bus: 
'platform': really_probe: bound device to driver qcom-ssbi-gpio
[    0.810114] device: '500000.ssbi:pmic:xoadc@197': device_add
[    0.810186] bus: 'platform': add device 500000.ssbi:pmic:xoadc@197
[    0.810284] PM: Adding info for platform:500000.ssbi:pmic:xoadc@197
[    0.810449] device: 
'platform:500000.ssbi:pmic:xoadc@197--platform:iio-hwmon': device_add
[    0.810621] devices_kset: Moving iio-hwmon to end of list
[    0.810646] PM: Moving platform:iio-hwmon to end of list
[    0.810673] platform iio-hwmon: Linked as a consumer to 
500000.ssbi:pmic:xoadc@197
[    0.810697] /iio-hwmon Dropping the fwnode link to 
/soc/ssbi@500000/pmic/xoadc@197
[    0.810799] device: 
'platform:500000.ssbi:pmic--platform:500000.ssbi:pmic:xoadc@197': device_add
[    0.810966] devices_kset: Moving 500000.ssbi:pmic:xoadc@197 to end of 
list
[    0.810991] PM: Moving platform:500000.ssbi:pmic:xoadc@197 to end of list
[    0.811014] devices_kset: Moving iio-hwmon to end of list
[    0.811036] PM: Moving platform:iio-hwmon to end of list
[    0.811062] platform 500000.ssbi:pmic:xoadc@197: Linked as a consumer 
to 500000.ssbi:pmic
[    0.811087] /soc/ssbi@500000/pmic/xoadc@197 Dropping the fwnode link 
to /soc/ssbi@500000/pmic
[    0.811514] pm8xxx-core 500000.ssbi:pmic: driver: 'pm8xxx-core': 
driver_bound: bound to device
[    0.811645] pm8xxx-core 500000.ssbi:pmic: bus: 'platform': 
really_probe: bound device to driver pm8xxx-core
[    0.811699] ssbi 500000.ssbi: driver: 'ssbi': driver_bound: bound to 
device
[    0.811749] ssbi 500000.ssbi: Dropping the link to 800000.pinctrl
[    0.811775] device: 'platform:800000.pinctrl--platform:500000.ssbi': 
device_unregister
[    0.812023] ssbi 500000.ssbi: bus: 'platform': really_probe: bound 
device to driver ssbi
[    0.812197] bus: 'spmi': add driver pmic-spmi
[    0.812283] device class 'mtd': registering
[    0.812382] device: 'mtd-0': device_add
[    0.812542] PM: Adding info for No Bus:mtd-0
[    0.812737] bus: 'platform': add driver spi_qup
[    0.812947] platform 16080000.spi: bus: 'platform': 
__driver_probe_device: matched device with driver spi_qup
[    0.812993] platform 16080000.spi: bus: 'platform': really_probe: 
probing driver spi_qup with device
[    0.813051] spi_qup 16080000.spi: no pinctrl handle
[    0.813523] spi_qup 16080000.spi: IN:block:16, fifo:64, OUT:block:16, 
fifo:64
[    0.813756] spi_master spi0: using DT 
'/soc/gsbi@16000000/spi@16080000' for 'cs' GPIO lookup
[    0.813861] of_get_named_gpiod_flags: parsed 'cs-gpios' property of 
node '/soc/gsbi@16000000/spi@16080000[0]' - status (0)
[    0.813966] gpio gpiochip0: Persistence not supported for GPIO 8
[    0.814030] device: 'spi0': device_add
[    0.814339] PM: Adding info for No Bus:spi0
[    0.815000] spi_qup 16080000.spi: driver: 'spi_qup': driver_bound: 
bound to device
[    0.815123] spi_qup 16080000.spi: bus: 'platform': really_probe: 
bound device to driver spi_qup
[    0.815284] bus: 'platform': add driver spmi_pmic_arb
[    0.815645] device: 'dummy0': device_add
[    0.816223] PM: Adding info for No Bus:dummy0
[    0.817121] bus: 'mdio_bus': add driver Asix Electronics AX88772A
[    0.817236] bus: 'mdio_bus': add driver Asix Electronics AX88772C
[    0.817328] bus: 'mdio_bus': add driver Asix Electronics AX88796B
[    0.817430] Registering platform device 'Fixed MDIO bus.0'. Parent at 
platform
[    0.817459] device: 'Fixed MDIO bus.0': device_add
[    0.817509] bus: 'platform': add device Fixed MDIO bus.0
[    0.817610] PM: Adding info for platform:Fixed MDIO bus.0
[    0.817766] device: 'fixed-0': device_add
[    0.818604] PM: Adding info for No Bus:fixed-0
[    0.818667] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    0.818697] mdio_bus fixed-0: No GPIO consumer reset found
[    0.818743] bus: 'usb': add driver ax88179_178a
[    0.818852] usbcore: registered new interface driver ax88179_178a
[    0.819682] bus: 'usb': add driver cdc_ether
[    0.819774] usbcore: registered new interface driver cdc_ether
[    0.825755] bus: 'usb': add driver net1080
[    0.826013] usbcore: registered new interface driver net1080
[    0.831486] bus: 'usb': add driver cdc_subset
[    0.831580] usbcore: registered new interface driver cdc_subset
[    0.837420] bus: 'usb': add driver cdc_ncm
[    0.837517] usbcore: registered new interface driver cdc_ncm
[    0.842944] bus: 'usb': add driver r8153_ecm
[    0.843046] usbcore: registered new interface driver r8153_ecm
[    0.848993] device class 'usbmon': registering
[    0.849114] device: 'usbmon0': device_add
[    0.849249] PM: Adding info for No Bus:usbmon0
[    0.849713] bus: 'pci': add driver ehci-pci
[    0.849844] bus: 'pci': add driver xhci_hcd
[    0.849968] bus: 'usb': add driver cdc_acm
[    0.850062] usbcore: registered new interface driver cdc_acm
[    0.854477] cdc_acm: USB Abstract Control Model driver for USB modems 
and ISDN adapters
[    0.860494] bus: 'usb-serial': registered
[    0.860563] bus: 'platform': add driver ci_hdrc
[    0.860732] bus: 'platform': add driver chipidea-usb2
[    0.861023] bus: 'platform': add driver msm_hsusb
[    0.861148] platform 12500000.usb: bus: 'platform': 
__driver_probe_device: matched device with driver msm_hsusb
[    0.861193] platform 12500000.usb: bus: 'platform': really_probe: 
probing driver msm_hsusb with device
[    0.861248] msm_hsusb 12500000.usb: no pinctrl handle
[    0.874029] Registering platform device 'ci_hdrc.0'. Parent at 
12500000.usb
[    0.874059] device: 'ci_hdrc.0': device_add
[    0.874115] bus: 'platform': add device ci_hdrc.0
[    0.874216] PM: Adding info for platform:ci_hdrc.0
[    0.874390] platform ci_hdrc.0: bus: 'platform': 
__driver_probe_device: matched device with driver ci_hdrc
[    0.874429] platform ci_hdrc.0: bus: 'platform': really_probe: 
probing driver ci_hdrc with device
[    0.881850] device: 'ci_hdrc.0.ulpi': device_add
[    0.881945] bus: 'ulpi': add device ci_hdrc.0.ulpi
[    0.882046] PM: Adding info for ulpi:ci_hdrc.0.ulpi
[    0.882183] ulpi ci_hdrc.0.ulpi: bus: 'ulpi': __driver_probe_device: 
matched device with driver qcom_usb_hs_phy
[    0.882225] ulpi ci_hdrc.0.ulpi: bus: 'ulpi': really_probe: probing 
driver qcom_usb_hs_phy with device
[    0.882274] qcom_usb_hs_phy ci_hdrc.0.ulpi: no pinctrl handle
[    0.882557] device: 'regulator:regulator.11--ulpi:ci_hdrc.0.ulpi': 
device_add
[    0.882735] devices_kset: Moving ci_hdrc.0.ulpi to end of list
[    0.882762] PM: Moving ulpi:ci_hdrc.0.ulpi to end of list
[    0.882789] qcom_usb_hs_phy ci_hdrc.0.ulpi: Linked as a consumer to 
regulator.11
[    0.882977] device: 'regulator:regulator.10--ulpi:ci_hdrc.0.ulpi': 
device_add
[    0.883142] devices_kset: Moving ci_hdrc.0.ulpi to end of list
[    0.883167] PM: Moving ulpi:ci_hdrc.0.ulpi to end of list
[    0.883193] qcom_usb_hs_phy ci_hdrc.0.ulpi: Linked as a consumer to 
regulator.10
[    0.883345] device: 'phy-ci_hdrc.0.ulpi.0': device_add
[    0.883485] PM: Adding info for No Bus:phy-ci_hdrc.0.ulpi.0
[    0.883627] qcom_usb_hs_phy ci_hdrc.0.ulpi: driver: 
'qcom_usb_hs_phy': driver_bound: bound to device
[    0.883742] qcom_usb_hs_phy ci_hdrc.0.ulpi: bus: 'ulpi': 
really_probe: bound device to driver qcom_usb_hs_phy
[    0.884242] device: 'ci_hdrc.0': device_add
[    0.884434] PM: Adding info for No Bus:ci_hdrc.0
[    0.884537] device: 'gadget.0': device_add
[    0.884590] bus: 'gadget': add device gadget.0
[    0.884671] PM: Adding info for gadget:gadget.0
[    0.885613] ci_hdrc ci_hdrc.0: driver: 'ci_hdrc': driver_bound: bound 
to device
[    0.885702] ci_hdrc ci_hdrc.0: bus: 'platform': really_probe: bound 
device to driver ci_hdrc
[    0.885917] msm_hsusb 12500000.usb: driver: 'msm_hsusb': 
driver_bound: bound to device
[    0.885948] /soc/usb@12500000 Dropping the fwnode link to 
/soc/usb@12500000/ulpi/phy
[    0.886070] msm_hsusb 12500000.usb: Dropping the link to 
108000.rpm:regulators
[    0.886097] device: 
'platform:108000.rpm:regulators--platform:12500000.usb': device_unregister
[    0.886353] msm_hsusb 12500000.usb: bus: 'platform': really_probe: 
bound device to driver msm_hsusb
[    0.886546] bus: 'platform': add driver npcm_udc
[    0.886825] bus: 'platform': add driver usbmisc_imx
[    0.887313] bus: 'platform': add driver imx_usb
[    0.887772] bus: 'platform': add driver tegra-usb
[    0.888261] device: 'mice': device_add
[    0.888380] PM: Adding info for No Bus:mice
[    0.888922] device: 'psaux': device_add
[    0.889044] PM: Adding info for No Bus:psaux
[    0.889358] mousedev: PS/2 mouse device common for all mice
[    0.889436] bus: 'platform': add driver pm8xxx-keypad
[    0.889694] bus: 'i2c': add driver tm2-touchkey
[    0.889785] bus: 'i2c': add driver elan_i2c
[    0.889923] bus: 'serio': add driver psmouse
[    0.890054] bus: 'i2c': add driver atmel_mxt_ts
[    0.890157] bus: 'platform': add driver pm8xxx-pwrkey
[    0.890346] platform 500000.ssbi:pmic:pwrkey@1c: bus: 'platform': 
__driver_probe_device: matched device with driver pm8xxx-pwrkey
[    0.890390] platform 500000.ssbi:pmic:pwrkey@1c: bus: 'platform': 
really_probe: probing driver pm8xxx-pwrkey with device
[    0.890449] pm8xxx-pwrkey 500000.ssbi:pmic:pwrkey@1c: no pinctrl handle
[    0.891067] device: 'input0': device_add
[    0.891302] PM: Adding info for No Bus:input0
[    0.891416] input: pmic8xxx_pwrkey as 
/devices/platform/soc/500000.ssbi/500000.ssbi:pmic/500000.ssbi:pmic:pwrkey@1c/input/input0
[    0.893798] device: 'event0': device_add
[    0.893914] PM: Adding info for No Bus:event0
[    0.894425] device: 'wakeup1': device_add
[    0.894601] pm8xxx-pwrkey 500000.ssbi:pmic:pwrkey@1c: driver: 
'pm8xxx-pwrkey': driver_bound: bound to device
[    0.894721] pm8xxx-pwrkey 500000.ssbi:pmic:pwrkey@1c: bus: 
'platform': really_probe: bound device to driver pm8xxx-pwrkey
[    0.894844] device: 'uinput': device_add
[    0.894945] PM: Adding info for No Bus:uinput
[    0.895307] bus: 'platform': add driver rtc-pm8xxx
[    0.895587] platform 500000.ssbi:pmic:rtc@11d: bus: 'platform': 
__driver_probe_device: matched device with driver rtc-pm8xxx
[    0.895628] platform 500000.ssbi:pmic:rtc@11d: bus: 'platform': 
really_probe: probing driver rtc-pm8xxx with device
[    0.895675] rtc-pm8xxx 500000.ssbi:pmic:rtc@11d: no pinctrl handle
[    0.896200] device: 'wakeup2': device_add
[    0.896634] device: 'rtc0': device_add
[    0.896813] PM: Adding info for No Bus:rtc0
[    0.897161] Registering platform device 'alarmtimer.0.auto'. Parent 
at rtc0
[    0.897190] device: 'alarmtimer.0.auto': device_add
[    0.897235] bus: 'platform': add device alarmtimer.0.auto
[    0.897333] PM: Adding info for platform:alarmtimer.0.auto
[    0.897431] platform alarmtimer.0.auto: bus: 'platform': 
__driver_probe_device: matched device with driver alarmtimer
[    0.897471] platform alarmtimer.0.auto: bus: 'platform': 
really_probe: probing driver alarmtimer with device
[    0.897516] alarmtimer alarmtimer.0.auto: no default pinctrl state
[    0.897574] alarmtimer alarmtimer.0.auto: driver: 'alarmtimer': 
driver_bound: bound to device
[    0.897638] alarmtimer alarmtimer.0.auto: bus: 'platform': 
really_probe: bound device to driver alarmtimer
[    0.897783] device: 'wakeup3': device_add
[    0.897978] rtc-pm8xxx 500000.ssbi:pmic:rtc@11d: registered as rtc0
[    0.905629] rtc-pm8xxx 500000.ssbi:pmic:rtc@11d: setting system clock 
to 1970-01-01T00:00:00 UTC (0)
[    0.911672] rtc-pm8xxx 500000.ssbi:pmic:rtc@11d: driver: 
'rtc-pm8xxx': driver_bound: bound to device
[    0.911793] rtc-pm8xxx 500000.ssbi:pmic:rtc@11d: bus: 'platform': 
really_probe: bound device to driver rtc-pm8xxx
[    0.911902] i2c_dev: i2c /dev entries driver
[    0.920993] device class 'i2c-dev': registering
[    0.921084] bus: 'platform': add driver i2c_qup
[    0.921293] platform 16280000.i2c: bus: 'platform': 
__driver_probe_device: matched device with driver i2c_qup
[    0.921337] platform 16280000.i2c: bus: 'platform': really_probe: 
probing driver i2c_qup with device
[    0.921621] i2c_qup 16280000.i2c: no init pinctrl state
[    0.921688] i2c_qup 16280000.i2c: no idle pinctrl state
[    0.921789] i2c_qup 16280000.i2c: using default clock-frequency 100000
[    0.925550] device: 'i2c-0': device_add
[    0.925629] bus: 'i2c': add device i2c-0
[    0.925709] PM: Adding info for i2c:i2c-0
[    0.925764] device: 'i2c-0': device_add
[    0.925997] PM: Adding info for No Bus:i2c-0
[    0.926544] device: '0-004a': device_add
[    0.926619] bus: 'i2c': add device 0-004a
[    0.926698] PM: Adding info for i2c:0-004a
[    0.926818] device: 'platform:108000.rpm:regulators--i2c:0-004a': 
device_add
[    0.926988] devices_kset: Moving 0-004a to end of list
[    0.927013] PM: Moving i2c:0-004a to end of list
[    0.927039] i2c 0-004a: Linked as a consumer to 108000.rpm:regulators
[    0.927064] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Dropping 
the fwnode link to /soc/rpm@108000/regulators
[    0.927183] device: 'platform:800000.pinctrl--i2c:0-004a': device_add
[    0.927341] devices_kset: Moving 0-004a to end of list
[    0.927366] PM: Moving i2c:0-004a to end of list
[    0.927392] i2c 0-004a: Linked as a consumer to 800000.pinctrl
[    0.927415] /soc/gsbi@16200000/i2c@16280000/touchscreen@4a Dropping 
the fwnode link to /soc/pinctrl@800000
[    0.927543] i2c 0-004a: bus: 'i2c': __driver_probe_device: matched 
device with driver atmel_mxt_ts
[    0.927584] i2c 0-004a: bus: 'i2c': really_probe: probing driver 
atmel_mxt_ts with device
[    0.927714] atmel_mxt_ts 0-004a: no init pinctrl state
[    0.927758] atmel_mxt_ts 0-004a: no sleep pinctrl state
[    0.927784] atmel_mxt_ts 0-004a: no idle pinctrl state
[    0.928266] device: 'regulator:regulator.39--i2c:0-004a': device_add
[    0.928437] devices_kset: Moving 0-004a to end of list
[    0.928462] PM: Moving i2c:0-004a to end of list
[    0.928487] atmel_mxt_ts 0-004a: Linked as a consumer to regulator.39
[    0.928675] device: 'regulator:regulator.23--i2c:0-004a': device_add
[    0.928834] devices_kset: Moving 0-004a to end of list
[    0.928859] PM: Moving i2c:0-004a to end of list
[    0.928885] atmel_mxt_ts 0-004a: Linked as a consumer to regulator.23
[    0.928916] atmel_mxt_ts 0-004a: using DT 
'/soc/gsbi@16200000/i2c@16280000/touchscreen@4a' for 'reset' GPIO lookup
[    0.929011] of_get_named_gpiod_flags: can't parse 'reset-gpios' 
property of node '/soc/gsbi@16200000/i2c@16280000/touchscreen@4a[0]'
[    0.929102] of_get_named_gpiod_flags: can't parse 'reset-gpio' 
property of node '/soc/gsbi@16200000/i2c@16280000/touchscreen@4a[0]'
[    0.929180] atmel_mxt_ts 0-004a: using lookup tables for GPIO lookup
[    0.929206] atmel_mxt_ts 0-004a: No GPIO consumer reset found
[    0.929234] atmel_mxt_ts 0-004a: using DT 
'/soc/gsbi@16200000/i2c@16280000/touchscreen@4a' for 'wake' GPIO lookup
[    0.929321] of_get_named_gpiod_flags: can't parse 'wake-gpios' 
property of node '/soc/gsbi@16200000/i2c@16280000/touchscreen@4a[0]'
[    0.929410] of_get_named_gpiod_flags: can't parse 'wake-gpio' 
property of node '/soc/gsbi@16200000/i2c@16280000/touchscreen@4a[0]'
[    0.929486] atmel_mxt_ts 0-004a: using lookup tables for GPIO lookup
[    0.929510] atmel_mxt_ts 0-004a: No GPIO consumer wake found
[    1.011982] atmel_mxt_ts 0-004a: Family: 130 Variant: 26 Firmware 
V1.1.AA Objects: 22
[    1.012907] atmel_mxt_ts 0-004a: Enabling RETRIGEN workaround
[    1.040718] atmel_mxt_ts 0-004a: driver: 'atmel_mxt_ts': 
driver_bound: bound to device
[    1.040856] atmel_mxt_ts 0-004a: bus: 'i2c': really_probe: bound 
device to driver atmel_mxt_ts
[    1.040926] i2c_qup 16280000.i2c: driver: 'i2c_qup': driver_bound: 
bound to device
[    1.040978] i2c_qup 16280000.i2c: Dropping the link to 
108000.rpm:regulators
[    1.041005] device: 
'platform:108000.rpm:regulators--platform:16280000.i2c': device_unregister
[    1.041291] i2c_qup 16280000.i2c: bus: 'platform': really_probe: 
bound device to driver i2c_qup
[    1.041460] bus: 'platform': add driver i2c-arb-gpio-challenge
[    1.041708] bus: 'platform': add driver i2c-demux-pinctrl
[    1.041925] bus: 'platform': add driver i2c-mux-gpio
[    1.042141] bus: 'platform': add driver i2c-mux-gpmux
[    1.042377] bus: 'platform': add driver i2c-mux-pinctrl
[    1.042590] bus: 'platform': add driver i2c-mux-reg
[    1.042804] bus: 'platform': add driver msm-restart
[    1.043026] bus: 'platform': add driver syscon-reboot-mode
[    1.043297] device-mapper: uevent: version 1.0.3
[    1.043431] device: 'device-mapper': device_add
[    1.043549] PM: Adding info for No Bus:device-mapper
[    1.044154] atmel_mxt_ts 0-004a: Direct firmware load for 
maxtouch.cfg failed with error -2
[    1.044194] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) 
initialised: dm-devel@lists.linux.dev
[    1.051850] atmel_mxt_ts 0-004a: Touchscreen size X479Y799
[    1.064232] device: 'input1': device_add
[    1.064486] PM: Adding info for No Bus:input1
[    1.064627] input: Atmel maXTouch Touchscreen as 
/devices/platform/soc/16200000.gsbi/16280000.i2c/i2c-0/0-004a/input/input1
[    1.066419] bus: 'platform': add driver qcom-cpufreq-nvmem
[    1.069660] device: 'mouse0': device_add
[    1.069723] Registering platform device 'qcom-cpufreq-nvmem'. Parent 
at platform
[    1.069772] PM: Adding info for No Bus:mouse0
[    1.069772] device: 'qcom-cpufreq-nvmem': device_add
[    1.069882] bus: 'platform': add device qcom-cpufreq-nvmem
[    1.070130] PM: Adding info for platform:qcom-cpufreq-nvmem
[    1.070246] device: 'event1': device_add
[    1.070356] PM: Adding info for No Bus:event1
[    1.070440] platform qcom-cpufreq-nvmem: bus: 'platform': 
__driver_probe_device: matched device with driver qcom-cpufreq-nvmem
[    1.070512] platform qcom-cpufreq-nvmem: bus: 'platform': 
really_probe: probing driver qcom-cpufreq-nvmem with device
[    1.070598] qcom-cpufreq-nvmem qcom-cpufreq-nvmem: no default pinctrl 
state
[    1.070708] qcom-cpufreq-nvmem qcom-cpufreq-nvmem: probe with driver 
qcom-cpufreq-nvmem failed with error -2
[    1.080743] bus: 'platform': add driver pwrseq_simple
[    1.081163] bus: 'platform': add driver pwrseq_emmc
[    1.081669] bus: 'mmc_rpmb': registered
[    1.081738] bus: 'mmc': add driver mmcblk
[    1.081891] bus: 'amba': add driver mmci-pl18x
[    1.081979] amba 12180000.mmc: probing driver mmci-pl18x asynchronously
[    1.082086] amba 12400000.mmc: probing driver mmci-pl18x asynchronously
[    1.082220] sdhci: Secure Digital Host Controller Interface driver
[    1.090722] sdhci: Copyright(c) Pierre Ossman
[    1.095964] amba 12180000.mmc: bus: 'amba': __driver_probe_device: 
matched device with driver mmci-pl18x
[    1.096575] amba 12180000.mmc: bus: 'amba': really_probe: probing 
driver mmci-pl18x with device
[    1.096623] mmci-pl18x 12180000.mmc: no pinctrl handle
[    1.096667] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.097078] device: 'wakeup4': device_add
[    1.101027] bus: 'platform': add driver sdhci_msm
[    1.101216] mmci-pl18x 12180000.mmc: using DT '/soc/mmc@12180000' for 
'cd' GPIO lookup
[    1.101339] of_get_named_gpiod_flags: can't parse 'cd-gpios' property 
of node '/soc/mmc@12180000[0]'
[    1.101435] of_get_named_gpiod_flags: can't parse 'cd-gpio' property 
of node '/soc/mmc@12180000[0]'
[    1.101526] mmci-pl18x 12180000.mmc: using lookup tables for GPIO lookup
[    1.101553] mmci-pl18x 12180000.mmc: No GPIO consumer cd found
[    1.101588] mmci-pl18x 12180000.mmc: using DT '/soc/mmc@12180000' for 
'wp' GPIO lookup
[    1.101671] of_get_named_gpiod_flags: can't parse 'wp-gpios' property 
of node '/soc/mmc@12180000[0]'
[    1.101735] bus: 'i2c': add driver lm3530-led
[    1.101736] of_get_named_gpiod_flags: can't parse 'wp-gpio' property 
of node '/soc/mmc@12180000[0]'
[    1.101789] mmci-pl18x 12180000.mmc: using lookup tables for GPIO lookup
[    1.101814] mmci-pl18x 12180000.mmc: No GPIO consumer wp found
[    1.101926] bus: 'virtio': add driver virtio_crypto
[    1.102196] device: 'regulator:regulator.13--amba:12180000.mmc': 
device_add
[    1.102237] bus: 'hid': registered
[    1.102286] device class 'hidraw': registering
[    1.102380] hid: raw HID events driver (C) Jiri Kosina
[    1.102386] devices_kset: Moving 12180000.mmc to end of list
[    1.102406] PM: Moving amba:12180000.mmc to end of list
[    1.106861] mmci-pl18x 12180000.mmc: Linked as a consumer to regulator.13
[    1.106919] device: 'uhid': device_add
[    1.107048] device: 'regulator:regulator.14--amba:12180000.mmc': 
device_add
[    1.107171] PM: Adding info for No Bus:uhid
[    1.107326] devices_kset: Moving 12180000.mmc to end of list
[    1.107339] amba 12400000.mmc: bus: 'amba': __driver_probe_device: 
matched device with driver mmci-pl18x
[    1.107352] PM: Moving amba:12180000.mmc to end of list
[    1.107374] mmci-pl18x 12180000.mmc: Linked as a consumer to regulator.14
[    1.107425] amba 12400000.mmc: bus: 'amba': really_probe: probing 
driver mmci-pl18x with device
[    1.107542] mmci-pl18x 12400000.mmc: no pinctrl handle
[    1.108244] mmci-pl18x 12180000.mmc: mmc1: PL180 manf 51 rev0 at 
0x12180000 irq 38,0 (pio)
[    1.108447] device: 'wakeup5': device_add
[    1.111680] device: 'mmc1': device_add
[    1.111959] PM: Adding info for No Bus:mmc1
[    1.112322] mmci-pl18x 12400000.mmc: using DT '/soc/mmc@12400000' for 
'wp' GPIO lookup
[    1.112490] of_get_named_gpiod_flags: can't parse 'wp-gpios' property 
of node '/soc/mmc@12400000[0]'
[    1.112620] of_get_named_gpiod_flags: can't parse 'wp-gpio' property 
of node '/soc/mmc@12400000[0]'
[    1.112722] mmci-pl18x 12400000.mmc: using lookup tables for GPIO lookup
[    1.112767] mmci-pl18x 12400000.mmc: No GPIO consumer wp found
[    1.113533] device: 'regulator:regulator.12--amba:12400000.mmc': 
device_add
[    1.113876] devices_kset: Moving 12400000.mmc to end of list
[    1.113920] PM: Moving amba:12400000.mmc to end of list
[    1.113968] mmci-pl18x 12400000.mmc: Linked as a consumer to regulator.12
[    1.114918] bus: 'hid': add driver hid-generic
[    1.115179] bus: 'usb': add driver usbhid
[    1.115349] usbcore: registered new interface driver usbhid
[    1.120093] usbhid: USB HID core driver
[    1.120393] mmci-pl18x 12400000.mmc: mmc0: PL180 manf 51 rev0 at 
0x12400000 irq 39,0 (pio)
[    1.125455] bus: 'platform': add driver rproc-virtio
[    1.129358] device: 'mmc0': device_add
[    1.129549] PM: Adding info for No Bus:mmc0
[    1.129753] bus: 'platform': add driver qcom-wcnss-pil
[    1.130410] device class 'extcon': registering
[    1.130541] bus: 'platform': add driver extcon-pm8941-misc
[    1.130952] bus: 'platform': add driver armv7-pmu
[    1.131071] platform cpu-pmu: bus: 'platform': __driver_probe_device: 
matched device with driver armv7-pmu
[    1.131141] platform cpu-pmu: bus: 'platform': really_probe: probing 
driver armv7-pmu with device
[    1.131224] armv7-pmu cpu-pmu: no pinctrl handle
[    1.132273] device: 'armv7_krait': device_add
[    1.132382] bus: 'event_source': add device armv7_krait
[    1.132573] PM: Adding info for event_source:armv7_krait
[    1.132710] hw perfevents: enabled with armv7_krait PMU driver, 5 
counters available
[    1.137695] armv7-pmu cpu-pmu: driver: 'armv7-pmu': driver_bound: 
bound to device
[    1.137882] armv7-pmu cpu-pmu: bus: 'platform': really_probe: bound 
device to driver armv7-pmu
[    1.139104] bus: 'platform': add driver qcom,qfprom
[    1.141501] Key type dns_resolver registered
[    1.143700] mmci-pl18x 12180000.mmc: driver: 'mmci-pl18x': 
driver_bound: bound to device
[    1.145518] mmci-pl18x 12180000.mmc: bus: 'amba': really_probe: bound 
device to driver mmci-pl18x
[    1.145561] mmci-pl18x 12180000.mmc: driver mmci-pl18x async attach 
completed: 0
[    1.145778] Registering SWP/SWPB emulation handler
[    1.155963] mmci-pl18x 12400000.mmc: driver: 'mmci-pl18x': 
driver_bound: bound to device
[    1.156088] mmci-pl18x 12400000.mmc: bus: 'amba': really_probe: bound 
device to driver mmci-pl18x
[    1.156129] mmci-pl18x 12400000.mmc: driver mmci-pl18x async attach 
completed: 0
[    1.191022] device: 'cpu_dma_latency': device_add
[    1.191244] PM: Adding info for No Bus:cpu_dma_latency
[    1.192080] Loading compiled-in X.509 certificates
[    1.226363] mmc0: new high speed MMC card at address 0001
[    1.226513] device: 'mmc0:0001': device_add
[    1.226747] bus: 'mmc': add device mmc0:0001
[    1.226846] PM: Adding info for mmc:mmc0:0001
[    1.226933] mmc mmc0:0001: bus: 'mmc': __driver_probe_device: matched 
device with driver mmcblk
[    1.226975] mmc mmc0:0001: bus: 'mmc': really_probe: probing driver 
mmcblk with device
[    1.227029] mmcblk mmc0:0001: no default pinctrl state
[    1.227895] mmcblk0: mmc0:0001 SEM08G 7.28 GiB
[    1.230784] device: 'mmcblk0': device_add
[    1.231039] PM: Adding info for No Bus:mmcblk0
[    1.232213] device: '179:0': device_add
[    1.232390] PM: Adding info for No Bus:179:0
[    1.237013] Alternate GPT is invalid, using primary GPT.
[    1.237243]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 
p15 p16 p17 p18 p19 p20 p21 p22 p23 p24
[    1.241490] device: 'mmcblk0p1': device_add
[    1.241662] PM: Adding info for No Bus:mmcblk0p1
[    1.241978] device: 'mmcblk0p2': device_add
[    1.242126] PM: Adding info for No Bus:mmcblk0p2
[    1.242429] device: 'mmcblk0p3': device_add
[    1.242585] PM: Adding info for No Bus:mmcblk0p3
[    1.242854] device: 'mmcblk0p4': device_add
[    1.243007] PM: Adding info for No Bus:mmcblk0p4
[    1.243274] device: 'mmcblk0p5': device_add
[    1.243431] PM: Adding info for No Bus:mmcblk0p5
[    1.243694] device: 'mmcblk0p6': device_add
[    1.243839] PM: Adding info for No Bus:mmcblk0p6
[    1.244110] device: 'mmcblk0p7': device_add
[    1.244267] PM: Adding info for No Bus:mmcblk0p7
[    1.244530] device: 'mmcblk0p8': device_add
[    1.244675] PM: Adding info for No Bus:mmcblk0p8
[    1.244942] device: 'mmcblk0p9': device_add
[    1.245094] PM: Adding info for No Bus:mmcblk0p9
[    1.245353] device: 'mmcblk0p10': device_add
[    1.245495] PM: Adding info for No Bus:mmcblk0p10
[    1.245749] device: 'mmcblk0p11': device_add
[    1.246005] PM: Adding info for No Bus:mmcblk0p11
[    1.246275] device: 'mmcblk0p12': device_add
[    1.246417] PM: Adding info for No Bus:mmcblk0p12
[    1.246668] device: 'mmcblk0p13': device_add
[    1.246814] PM: Adding info for No Bus:mmcblk0p13
[    1.247084] device: 'mmcblk0p14': device_add
[    1.247238] PM: Adding info for No Bus:mmcblk0p14
[    1.247496] device: 'mmcblk0p15': device_add
[    1.247640] PM: Adding info for No Bus:mmcblk0p15
[    1.247899] device: 'mmcblk0p16': device_add
[    1.248054] PM: Adding info for No Bus:mmcblk0p16
[    1.248311] device: 'mmcblk0p17': device_add
[    1.248453] PM: Adding info for No Bus:mmcblk0p17
[    1.248705] device: 'mmcblk0p18': device_add
[    1.248860] PM: Adding info for No Bus:mmcblk0p18
[    1.249119] device: 'mmcblk0p19': device_add
[    1.249262] PM: Adding info for No Bus:mmcblk0p19
[    1.249567] device: 'mmcblk0p20': device_add
[    1.249721] PM: Adding info for No Bus:mmcblk0p20
[    1.249991] device: 'mmcblk0p21': device_add
[    1.250135] PM: Adding info for No Bus:mmcblk0p21
[    1.250399] device: 'mmcblk0p22': device_add
[    1.250554] PM: Adding info for No Bus:mmcblk0p22
[    1.250825] device: 'mmcblk0p23': device_add
[    1.250969] PM: Adding info for No Bus:mmcblk0p23
[    1.251227] device: 'mmcblk0p24': device_add
[    1.251374] PM: Adding info for No Bus:mmcblk0p24
[    1.252798] mmcblk0boot0: mmc0:0001 SEM08G 2.00 MiB
[    1.252865] device: 'mmcblk0boot0': device_add
[    1.253126] PM: Adding info for No Bus:mmcblk0boot0
[    1.254256] device: '179:32': device_add
[    1.254432] PM: Adding info for No Bus:179:32
[    1.254986] mmcblk0boot1: mmc0:0001 SEM08G 2.00 MiB
[    1.256702] device: 'mmcblk0boot1': device_add
[    1.256931] PM: Adding info for No Bus:mmcblk0boot1
[    1.258077] device: '179:64': device_add
[    1.258232] PM: Adding info for No Bus:179:64
[    1.258413] device: 'mmcblk0rpmb': device_add
[    1.258473] bus: 'mmc_rpmb': add device mmcblk0rpmb
[    1.258557] PM: Adding info for mmc_rpmb:mmcblk0rpmb
[    1.258836] mmcblk0rpmb: mmc0:0001 SEM08G 128 KiB, chardev (248:0)
[    1.261432] mmcblk mmc0:0001: driver: 'mmcblk': driver_bound: bound 
to device
[    1.261507] mmcblk mmc0:0001: bus: 'mmc': really_probe: bound device 
to driver mmcblk
[    1.302601] bus: 'platform': add driver gpio-keys
[    1.302930] platform gpio-keys: bus: 'platform': 
__driver_probe_device: matched device with driver gpio-keys
[    1.303007] platform gpio-keys: bus: 'platform': really_probe: 
probing driver gpio-keys with device
[    1.303475] mmc1: host does not support reading read-only switch, 
assuming write-enable
[    1.303594] gpio-keys gpio-keys: no init pinctrl state
[    1.303699] gpio-keys gpio-keys: no sleep pinctrl state
[    1.303746] gpio-keys gpio-keys: no idle pinctrl state
[    1.304185] gpio-keys gpio-keys: using DT '/gpio-keys/key-home' for 
'(default)' GPIO lookup
[    1.304364] of_get_named_gpiod_flags: parsed 'gpios' property of node 
'/gpio-keys/key-home[0]' - status (0)
[    1.304523] gpio gpiochip0: Persistence not supported for GPIO 40
[    1.305008] gpio-keys gpio-keys: using DT '/gpio-keys/key-volume-up' 
for '(default)' GPIO lookup
[    1.305167] of_get_named_gpiod_flags: parsed 'gpios' property of node 
'/gpio-keys/key-volume-up[0]' - status (0)
[    1.305314] gpio gpiochip0: Persistence not supported for GPIO 50
[    1.305575] mmc1: new high speed SDHC card at address 5048
[    1.305750] gpio-keys gpio-keys: using DT 
'/gpio-keys/key-volume-down' for '(default)' GPIO lookup
[    1.310386] of_get_named_gpiod_flags: parsed 'gpios' property of node 
'/gpio-keys/key-volume-down[0]' - status (0)
[    1.310499] device: 'mmc1:5048': device_add
[    1.310533] gpio gpiochip0: Persistence not supported for GPIO 81
[    1.310681] bus: 'mmc': add device mmc1:5048
[    1.310786] PM: Adding info for mmc:mmc1:5048
[    1.310868] mmc mmc1:5048: bus: 'mmc': __driver_probe_device: matched 
device with driver mmcblk
[    1.310905] mmc mmc1:5048: bus: 'mmc': really_probe: probing driver 
mmcblk with device
[    1.310947] mmcblk mmc1:5048: no default pinctrl state
[    1.310972] device: 'input2': device_add
[    1.311423] PM: Adding info for No Bus:input2
[    1.311635] input: gpio-keys as /devices/platform/gpio-keys/input/input2
[    1.311883] mmcblk1: mmc1:5048 SD16G 14.5 GiB
[    1.316129] device: 'event2': device_add
[    1.322724] device: 'mmcblk1': device_add
[    1.323061] PM: Adding info for No Bus:event2
[    1.323079] PM: Adding info for No Bus:mmcblk1
[    1.323691] device: 'wakeup6': device_add
[    1.324120] gpio-keys gpio-keys: driver: 'gpio-keys': driver_bound: 
bound to device
[    1.324376] gpio-keys gpio-keys: bus: 'platform': really_probe: bound 
device to driver gpio-keys
[    1.324469] device: '179:96': device_add
[    1.324694] PM: Adding info for No Bus:179:96
[    1.324703] Extended deferred probe timeout by 10 secs
[    1.325205] bus: 'amba': add driver amba-proxy
[    1.325389] Extended deferred probe timeout by 10 secs
[    1.325435] clk: Not disabling unused clocks
[    1.326203]  mmcblk1: p1
[    1.327130] PM: genpd: Disabling unused power domains
[    1.331354] device: 'mmcblk1p1': device_add
[    1.333967] PM: Adding info for No Bus:mmcblk1p1
[    1.334396] mmcblk mmc1:5048: driver: 'mmcblk': driver_bound: bound 
to device
[    1.334500] mmcblk mmc1:5048: bus: 'mmc': really_probe: bound device 
to driver mmcblk
[    1.344991] Freeing unused kernel image (initmem) memory: 1024K
[    1.345471] Run /init as init process
[    1.349922]   with arguments:
[    1.349959]     /init
[    1.349994]     PMOS_NO_OUTPUT_REDIRECT
[    1.350030]   with environment:
[    1.350062]     HOME=/
[    1.350096]     TERM=linux
[   11.436203] platform iio-hwmon: Relaxing link with 
500000.ssbi:pmic:xoadc@197



