Return-Path: <linux-arm-msm+bounces-29449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B295E262
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Aug 2024 09:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB01281E74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Aug 2024 07:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1695450A80;
	Sun, 25 Aug 2024 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YzWp4HGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC51801;
	Sun, 25 Aug 2024 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724570683; cv=none; b=LYRdJbrw8031Aqtr89DKX0PwzgX3ZtjFjYXzjYdxZxvubzxKdHxwXKpSrIjvZggEh+lwUAsx/B332905VBh2ZcPTKf42Wr7r/lgFsb5u6m/WZOw3BP3kxgy3MzNBWKOPvwEAG47Hvvttbe6wq+okVrrSEhiUHHyZU5izy/9WVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724570683; c=relaxed/simple;
	bh=XS0MxfMA8aJLVnkTb3Bae/I1bANDoeKJiCKxbvzpHHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOUyldP8MdYoxLfoRI7ql/oucr33t7fydJE7IKjrW+hVVrkff16I0LV/p0H66eMScjfgW0qnyWCfYGrjtZkTiyNsPiu2Bfy+Y1xEiSBxJVTSJRUGcHZTCeHh0n3XAyT9DRxO6QYjvaK8t8NROYFrN1c1DGaz22FKCWoPSr3tPbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YzWp4HGm; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=GkeY4nW3vlCL/lRCei213Af711k/56MGA61cWokigp8=;
	t=1724570680; x=1725002680; b=YzWp4HGmD/c/j0DzcABDtQdhF+iVY1MhZHXm+IDwUVSI3JT
	+nHs6AXZ874jWiPU/p8CoJeTKBWYECdA5bFs055KqHs5sqF5UpFna1BJF+8FJzP5h2+scoKOkNosN
	vF5EWNTxnYxQQvly9u2osZA80b7OiRkKG00TA/2gcTBlYcoRECohf/Md5Bn7wqWr1/aHMmF7DpyGi
	Fe66Osr2ZlpltOML74Pj6WpdzOoD1CaEzpw2Ur5U/JGhJPoCpc9v9IgjRyqnMxnCtk+WQFWjosW5L
	LHsaPRPWxMJD8IBpYpT3gnO1GHpoYUjUYkuGJ+8xNNmwRYkbJkCJLOfE6/Ri0CCw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1si7bz-0005uc-6Q; Sun, 25 Aug 2024 09:24:31 +0200
Message-ID: <48b20ca3-37f5-4d9c-b36f-1d05a2ee4f5c@leemhuis.info>
Date: Sun, 25 Aug 2024 09:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
To: bartosz.golaszewski@linaro.org, andersson@kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>
Cc: brgl@bgdev.pl, konrad.dybcio@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com,
 quic_gurus@quicinc.com, luzmaximilian@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, srinivas.kandagatla@linaro.org, arnd@arndb.de,
 quic_eberman@quicinc.com, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
 ahalaney@redhat.com, quic_djaggi@quicinc.com, regressions@lists.linux.dev
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724570680;44f1ad5b;
X-HE-SMSGID: 1si7bz-0005uc-6Q

Lo! Thx for your report!

On 25.08.24 08:51, Rudraksha Gupta wrote:
> 
> Found a regression with a platform that has the msm8960 SoC. Was hoping
> to code up a fix myself, but I'm not adept in ARM architecture or the
> Linux kernel, so I'm just reporting it here. Reverting this commit seems
> to fix it as well. Please let me know if there is anything else I should
> provide for this regression report.
> 
> #regzbot introduced 449d0d84bcd8246b508d07995326d13c54488b8c

FWIW, that is 449d0d84bcd824 ("firmware: qcom: scm: smc: switch to using
the SCM allocator") [v6.11-rc1] which was authored by Bartosz
Golaszewski and commited by Bjorn Andersson.
 
> Error: https://pastebin.com/SDRENUGk

Better include the exact problem you face in your report so
that search engines can do their magic; makes it also easier
to handle for everyone.

Furthermore two quick questions:

[    0.000000] Linux version 6.10.0-rc1-msm8960+ (a@fpx-l-AMER03105) (Ubuntu clang version 16.0.6 (15), Ubuntu LLD 16.0.6) #17 SMP Sat

Is that a vanilla kernel or one close to it? That "msm8960+" sounds
somewhat suspicious. 

And does the problem still happen with latest mainline? Cconsider
retrying with -rc5, which should be out in the next 24h.

And FWIW, here is the afaics relevant part of the problem: 

[    0.047411] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.051541] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.060470] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.066411] 8<--- cut here ---
[    0.071896] Unable to handle kernel NULL pointer dereference at virtual address 00000090 when read
[    0.074743] [00000090] *pgd=00000000
[    0.083675] Internal error: Oops: 5 [#1] SMP ARM
[    0.087283] Modules linked in:
[    0.091833] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.10.0-rc1-msm8960+ #17
[    0.094673] Hardware name: Generic DT based system
[    0.101804] PC is at qcom_scm_get_tzmem_pool+0x1c/0x24
[    0.106443] LR is at __scm_smc_call+0x30/0x2d4
[    0.111511] pc : [<c089176c>]    lr : [<c0893fb0>]    psr: 60000013
[    0.115896] sp : f0815d78  ip : f0815e98  fp : f0815d78
[    0.121995] r10: 00000002  r9 : f0815e18  r8 : 00000001
[    0.127150] r7 : c1106694  r6 : f0815e30  r5 : c126ff4c  r4 : 00000001
[    0.132308] r3 : f0815e18  r2 : 00000002  r1 : f0815e30  r0 : 00000000
[    0.138839] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    0.145288] Control: 10c5787d  Table: 8000406a  DAC: 00000051
[    0.152413] Register r0 information: NULL pointer
[    0.158083] Register r1 information: 2-page vmalloc region starting at 0xf0814000 allocated at copy_process+0x16c/0xddc
[    0.162735] Register r2 information: non-paged memory
[    0.173205] Register r3 information: 2-page vmalloc region starting at 0xf0814000 allocated at copy_process+0x16c/0xddc
[    0.178373] Register r4 information: non-paged memory
[    0.188845] Register r5 information: non-slab/vmalloc memory
[    0.194002] Register r6 information: 2-page vmalloc region starting at 0xf0814000 allocated at copy_process+0x16c/0xddc
[    0.199682] Register r7 information: non-slab/vmalloc memory
[    0.210069] Register r8 information: non-paged memory
[    0.215911] Register r9 information: 2-page vmalloc region starting at 0xf0814000 allocated at copy_process+0x16c/0xddc
[    0.220819] Register r10 information: non-paged memory
[    0.231292] Register r11 information: 2-page vmalloc region starting at 0xf0814000 allocated at copy_process+0x16c/0xddc
[    0.236460] Register r12 information: 2-page vmalloc region starting at 0xf0814000 allocated at copy_process+0x16c/0xddc
[    0.247372] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    0.258105] Stack: (0xf0815d78 to 0xf0816000)
[    0.264034] 5d60:                                                       f0815e08 c0893fb0
[    0.268257] 5d80: f0815d9c c01953fc c1118278 c1124508 00000037 00000000 c1118278 f0815da8
[    0.276334] 5da0: c125875c 00000800 00000036 00000000 039ab58a 00000000 c2000030 c0a5cee4
[    0.284411] 5dc0: f0815dd8 c01953fc c1118278 c1124508 00000037 00000000 c1118278 00000000
[    0.292489] 5de0: f0815e18 c01953fc dedf13d9 00000001 c126ff4c 00000000 c1106694 00000001
[    0.300564] 5e00: f0815ef0 00000000 f0815eb0 c0893658 00000001 c0195934 f0815e78 c0195934
[    0.308641] 5e20: f0815e48 00000000 f0815ebf f0815e4c 00000006 00000001 00000001 00000000
[    0.316718] 5e40: 02000601 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.324794] 5e60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.332873] 5e80: 00000000 00000000 00000000 00000000 00000002 00000000 f0815ebf dedf13d9
[    0.340950] 5ea0: 00000000 f0815ee0 00000000 00000000 f0815ed0 c0891aa0 f0815ec8 00a8fbe0
[    0.349027] 5ec0: f0815ef8 c0b8c08f 00000001 00000000 f0815f68 c0891980 00000001 c01012a0
[    0.357103] 5ee0: 00000001 00000001 00000002 00000000 00000001 00000000 801012a0 00000000
[    0.365180] 5f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.373258] 5f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.381335] 5f40: 00000002 00000000 dedf13d9 c1509100 00000001 c1568000 00000000 00000000
[    0.389411] 5f60: 00000000 00000000 f0815f80 c100bf5c c1509100 00000001 c1568000 00000000
[    0.397489] 5f80: f0815f98 c1001538 00000000 c0a8b56c 00000000 00000000 f0815fa8 c0a8b58c
[    0.405565] 5fa0: 00000000 00000000 00000000 c010014c 00000000 00000000 00000000 00000000
[    0.413643] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.421718] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    0.429788] Call trace:
[    0.429813]  qcom_scm_get_tzmem_pool from __scm_smc_call+0x30/0x2d4
[    0.440444]  __scm_smc_call from __get_convention+0xac/0x128
[    0.446370]  __get_convention from qcom_scm_call_atomic+0x24/0x90
[    0.452214]  qcom_scm_call_atomic from qcom_scm_set_boot_addr+0xe4/0x100
[    0.458142]  qcom_scm_set_boot_addr from qcom_smp_prepare_cpus+0x1c/0x94
[    0.464849]  qcom_smp_prepare_cpus from kernel_init_freeable+0xcc/0x140
[    0.471462]  kernel_init_freeable from kernel_init+0x20/0x144
[    0.477734]  kernel_init from ret_from_fork+0x14/0x28
[    0.483571] Exception stack(0xf0815fb0 to 0xf0815ff8)
[    0.488561] 5fa0:                                     00000000 00000000 00000000 00000000
[    0.493554] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.501628] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.509710] Code: e28dd004 e30f0f50 e34c0126 e5900000 (e5900090)
[    0.516140] ---[ end trace 0000000000000000 ]---
[    0.522249] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.526890] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

> Defconfig: https://pastebin.com/CRDjC39a
> 
> Platform:
> https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)

Ciao, Thorsten

P.S.:

#regzbot title: firmware: qcom: scm: smc: msm8960 SoC fails to boot

