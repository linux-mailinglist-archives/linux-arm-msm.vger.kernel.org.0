Return-Path: <linux-arm-msm+bounces-65432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D381AB08A20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEF4816E0A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC539298991;
	Thu, 17 Jul 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="V+SgF9fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EFC25A2BF;
	Thu, 17 Jul 2025 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746477; cv=pass; b=qc3IfbB8qYUfk9eh6GJKFW6z+zKCTF1GsKP9P2QgGEd/2DqwMD2HyGK9RUrnpDOmOjpHdDfFmyzrbHXC0S4odAasD9Oty0SU1GpUE6FaQuhp4VJWDkeMjA11Siwjzmd7Oxl0NXgRy/U0DqKn0G6DecUcRaUv3SsaNOPLbekXB3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746477; c=relaxed/simple;
	bh=A4CRDg685F//yYSrUqQqky7GIERfvNnc+RXZM8ub2WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btRYnJDsAtghh1jNL2xJR4d1BQPD1I85BP3D/gzSaoDfbPoy7Nhw/Ya3Q6yWwl3Ly1JgJnjDWkHlWABYy+3LxaZJD/bDqYlt+ktK38/qlEKq5MOD1YTHfHJeyQJA7NHHM3FgTKJ/lFm8U7vRRR18jgd33ALZsUG73vNMZlZY7LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=V+SgF9fa; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752746413; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gyH7vgth8vulqMfuV5YoGupIPpiiF7jggaEJL9a7pjty+8Kc7L4A4ut4x9GUrVolCWEYuB68SE/QjYnbEoYMT1JVc4/xsM0TJXyQRCDf3UntNiFTm2venzGA/scJEnGqBRXhZiGRziICsXI2C7cijO4iysobc8JxCl5M/zJc1Oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752746413; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xpwbIUfT7hBxYMkztCja+P7WoxLnSe5t8Pwu1UKpAmI=; 
	b=SlUPz9aULDX45/5EAU753bUQv861ddfnMirls6u3IaMlAKVJavy8L24l+iWEd2e4ylMKc8vrkbdd5ONws59xIr7/TA6nPXkPuxYho75UfGy1KszrQP3LHQpqlBQRnvYFVPxfebMm06LIPGgnasbfwwl1IatI0KuAfAc/AJJAI3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752746413;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xpwbIUfT7hBxYMkztCja+P7WoxLnSe5t8Pwu1UKpAmI=;
	b=V+SgF9fa1ejoDakrmkZfYz09Ke+r7FB6tQd9qTu3a8etLJJyLl9Yr3JjzsbWacGu
	UtYAfmcXUaDDZIYMmyjLSyBycFAKlGmX3iYt4wkIxCAARd8m5IuZPiUC0w+T0zwPyIL
	q2QRs7CpmamJxuNMya/K+/i3ZIUNbcEBxI2cNHHo=
Received: by mx.zohomail.com with SMTPS id 1752746411436245.64031892164712;
	Thu, 17 Jul 2025 03:00:11 -0700 (PDT)
Message-ID: <9c9d0302-bbb8-468f-8be5-5a3e0015528f@collabora.com>
Date: Thu, 17 Jul 2025 15:00:14 +0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] bus: mhi: host: keep bhi buffer through suspend
 cycle
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>,
 Matthew Leung <quic_mattleun@quicinc.com>,
 Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Kunwu Chan <chentao@kylinos.cn>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yan Zhen <yanzhen@vivo.com>, Sujeev Dias <sdias@codeaurora.org>,
 Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, stable@vger.kernel.org
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
 <20250715132509.2643305-2-usama.anjum@collabora.com>
 <2025071604-scandal-outpost-eb22@gregkh>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <2025071604-scandal-outpost-eb22@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Greg,

On 7/16/25 2:34 PM, Greg Kroah-Hartman wrote:
> On Tue, Jul 15, 2025 at 06:25:07PM +0500, Muhammad Usama Anjum wrote:
>> When there is memory pressure, at resume time dma_alloc_coherent()
>> returns error which in turn fails the loading of firmware and hence
>> the driver crashes:
>>
>> kernel: kworker/u33:5: page allocation failure: order:7,
>> mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
>> kernel: CPU: 1 UID: 0 PID: 7693 Comm: kworker/u33:5 Not tainted 6.11.11-valve17-1-neptune-611-g027868a0ac03 #1 3843143b92e9da0fa2d3d5f21f51beaed15c7d59
>> kernel: Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
>> kernel: Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
>> kernel: Call Trace:
>> kernel:  <TASK>
>> kernel:  dump_stack_lvl+0x4e/0x70
>> kernel:  warn_alloc+0x164/0x190
>> kernel:  ? srso_return_thunk+0x5/0x5f
>> kernel:  ? __alloc_pages_direct_compact+0xaf/0x360
>> kernel:  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
>> kernel:  __alloc_pages_noprof+0x321/0x350
>> kernel:  __dma_direct_alloc_pages.isra.0+0x14a/0x290
>> kernel:  dma_direct_alloc+0x70/0x270
>> kernel:  mhi_fw_load_handler+0x126/0x340 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
>> kernel:  mhi_pm_st_worker+0x5e8/0xac0 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
>> kernel:  ? srso_return_thunk+0x5/0x5f
>> kernel:  process_one_work+0x17e/0x330
>> kernel:  worker_thread+0x2ce/0x3f0
>> kernel:  ? __pfx_worker_thread+0x10/0x10
>> kernel:  kthread+0xd2/0x100
>> kernel:  ? __pfx_kthread+0x10/0x10
>> kernel:  ret_from_fork+0x34/0x50
>> kernel:  ? __pfx_kthread+0x10/0x10
>> kernel:  ret_from_fork_asm+0x1a/0x30
>> kernel:  </TASK>
>> kernel: Mem-Info:
>> kernel: active_anon:513809 inactive_anon:152 isolated_anon:0
>>     active_file:359315 inactive_file:2487001 isolated_file:0
>>     unevictable:637 dirty:19 writeback:0
>>     slab_reclaimable:160391 slab_unreclaimable:39729
>>     mapped:175836 shmem:51039 pagetables:4415
>>     sec_pagetables:0 bounce:0
>>     kernel_misc_reclaimable:0
>>     free:125666 free_pcp:0 free_cma:0
> 
> This is not a "crash", it is a warning that your huge memory allocation
> did not succeed.  Properly handle this issue (and if you know it's going
> to happen, turn the warning off in your allocation), and you should be
> fine.
Yes, the system is fine. But wifi/sound drivers fail to reinitialize.

> 
>> In above example, if we sum all the consumed memory, it comes out
>> to be 15.5GB and free memory is ~ 500MB from a total of 16GB RAM.
>> Even though memory is present. But all of the dma memory has been
>> exhausted or fragmented.
> 
> What caused that to happen?
Excessive use of the page cache occurs when user-space applications open
and consume large amounts of file system memory, even if those files are
no longer being actively read. I haven't found any documentation on limiting
the size of the page cache or preventing it from occupying DMA-capable
memory—perhaps the MM developers can provide more insight.

I can reproduce this issue by running stress tests that create and
sequentially read files. On a system with 16GB of RAM, the page cache can
easily grow to 10–12GB. Since the kernel manages the page cache, it's unclear
why it doesn't reclaim inactive cache more aggressively.

> 
>> Fix it by allocating it only once and then reuse the same allocated
>> memory. As we'll allocate this memory only once, this memory will stay
>> allocated.
> 
> As others said, no, don't consume memory for no good reason, that just
> means that other devices will fail more frequently.  If all
> devices/drivers did this, you wouldn't have memory to work either.
Makes sense.

> 
> thanks,
> 
> greg k-h


