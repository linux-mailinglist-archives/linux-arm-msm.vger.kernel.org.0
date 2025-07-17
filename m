Return-Path: <linux-arm-msm+bounces-65449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91402B08BF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E32A918926FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B9A29ACF1;
	Thu, 17 Jul 2025 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wTqXlo+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2128C013;
	Thu, 17 Jul 2025 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753056; cv=none; b=eVl7/88Ao96A6n/pMtOUOgP9gQBqXAAuEfdpj9H958TIjSjgIHP6pr9jTFrZ3gVuuj4mjx7iuvlLGclq59EkXODXQTXJjvxv40xpibjZKnuOTBsl4mbHrKeCh8H67Z/XTgHRBPmO5jJZa3opXydalkztJ4CKIL6YuZxxWrlroiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753056; c=relaxed/simple;
	bh=x26YnKgFXiZTAWqxIvJAtnfbKzIx3/H/HKa+m9DMCJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9ukBaf5k8IFHjtzT7LJ0hKcOaDYtd9B9Gvkj8tktYu9uR3psKhhkkZeh+k50lvFPngBWuMte+JEMZ48BcwkkNlU2bm3j/4rotY4OhdOB14jmtPECjPvV11+4nwIPt0vqSJSleEUP8ASAp24s1o7Ff9UQ4N8pdAVl30/dv60tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wTqXlo+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A1DC4CEE3;
	Thu, 17 Jul 2025 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752753055;
	bh=x26YnKgFXiZTAWqxIvJAtnfbKzIx3/H/HKa+m9DMCJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wTqXlo+AEfo/4GihqL+0jf/USYAtbcf+mI+iLJAZAXq3jTjmEqMYtopDv1lnrkKYZ
	 udnPUN/j5Ex9AS2Zxf/TR6OlRz1Z0IKp3KuF64Xb+5L1W8WAfC7V4HD2G6SxTzAU12
	 16CLh5ba7oHf7esLyXOTn21iDUVn7o56F5cotRFE=
Date: Thu, 17 Jul 2025 13:50:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
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
Subject: Re: [PATCH v2 1/3] bus: mhi: host: keep bhi buffer through suspend
 cycle
Message-ID: <2025071722-panther-legwarmer-d2be@gregkh>
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
 <20250715132509.2643305-2-usama.anjum@collabora.com>
 <2025071604-scandal-outpost-eb22@gregkh>
 <9c9d0302-bbb8-468f-8be5-5a3e0015528f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c9d0302-bbb8-468f-8be5-5a3e0015528f@collabora.com>

On Thu, Jul 17, 2025 at 03:00:14PM +0500, Muhammad Usama Anjum wrote:
> Hi Greg,
> 
> On 7/16/25 2:34 PM, Greg Kroah-Hartman wrote:
> > On Tue, Jul 15, 2025 at 06:25:07PM +0500, Muhammad Usama Anjum wrote:
> >> When there is memory pressure, at resume time dma_alloc_coherent()
> >> returns error which in turn fails the loading of firmware and hence
> >> the driver crashes:
> >>
> >> kernel: kworker/u33:5: page allocation failure: order:7,
> >> mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> >> kernel: CPU: 1 UID: 0 PID: 7693 Comm: kworker/u33:5 Not tainted 6.11.11-valve17-1-neptune-611-g027868a0ac03 #1 3843143b92e9da0fa2d3d5f21f51beaed15c7d59
> >> kernel: Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> >> kernel: Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
> >> kernel: Call Trace:
> >> kernel:  <TASK>
> >> kernel:  dump_stack_lvl+0x4e/0x70
> >> kernel:  warn_alloc+0x164/0x190
> >> kernel:  ? srso_return_thunk+0x5/0x5f
> >> kernel:  ? __alloc_pages_direct_compact+0xaf/0x360
> >> kernel:  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
> >> kernel:  __alloc_pages_noprof+0x321/0x350
> >> kernel:  __dma_direct_alloc_pages.isra.0+0x14a/0x290
> >> kernel:  dma_direct_alloc+0x70/0x270
> >> kernel:  mhi_fw_load_handler+0x126/0x340 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
> >> kernel:  mhi_pm_st_worker+0x5e8/0xac0 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
> >> kernel:  ? srso_return_thunk+0x5/0x5f
> >> kernel:  process_one_work+0x17e/0x330
> >> kernel:  worker_thread+0x2ce/0x3f0
> >> kernel:  ? __pfx_worker_thread+0x10/0x10
> >> kernel:  kthread+0xd2/0x100
> >> kernel:  ? __pfx_kthread+0x10/0x10
> >> kernel:  ret_from_fork+0x34/0x50
> >> kernel:  ? __pfx_kthread+0x10/0x10
> >> kernel:  ret_from_fork_asm+0x1a/0x30
> >> kernel:  </TASK>
> >> kernel: Mem-Info:
> >> kernel: active_anon:513809 inactive_anon:152 isolated_anon:0
> >>     active_file:359315 inactive_file:2487001 isolated_file:0
> >>     unevictable:637 dirty:19 writeback:0
> >>     slab_reclaimable:160391 slab_unreclaimable:39729
> >>     mapped:175836 shmem:51039 pagetables:4415
> >>     sec_pagetables:0 bounce:0
> >>     kernel_misc_reclaimable:0
> >>     free:125666 free_pcp:0 free_cma:0
> > 
> > This is not a "crash", it is a warning that your huge memory allocation
> > did not succeed.  Properly handle this issue (and if you know it's going
> > to happen, turn the warning off in your allocation), and you should be
> > fine.
> Yes, the system is fine. But wifi/sound drivers fail to reinitialize.
> 
> > 
> >> In above example, if we sum all the consumed memory, it comes out
> >> to be 15.5GB and free memory is ~ 500MB from a total of 16GB RAM.
> >> Even though memory is present. But all of the dma memory has been
> >> exhausted or fragmented.
> > 
> > What caused that to happen?
> Excessive use of the page cache occurs when user-space applications open
> and consume large amounts of file system memory, even if those files are
> no longer being actively read. I haven't found any documentation on limiting
> the size of the page cache or preventing it from occupying DMA-capable
> memory—perhaps the MM developers can provide more insight.
> 
> I can reproduce this issue by running stress tests that create and
> sequentially read files. On a system with 16GB of RAM, the page cache can
> easily grow to 10–12GB. Since the kernel manages the page cache, it's unclear
> why it doesn't reclaim inactive cache more aggressively.

It should be reclaiming this, as it's just cache, not really used
memory.  I think something isn't tuned properly for your system, OR your
drivers are asking for way too much memory.  Either way, the correct
solution is NOT to have the drivers consume even more memory, that just
makes the overall system less useful.

good luck!

greg k-h

