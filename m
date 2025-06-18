Return-Path: <linux-arm-msm+bounces-61696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95EADE57A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 10:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50C6B188C635
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 08:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9241A274FC2;
	Wed, 18 Jun 2025 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNrGdRwL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C135963;
	Wed, 18 Jun 2025 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235127; cv=none; b=JFNvCPVRbwXogIfdPIisKmZphcc6T7AtvAlHLwxmY9wYUNsU99Rdxxe/teu+JBjA81FKKW+H4Ie2YkCDtE09d35Mrkh9uscqczDsiBfH/YGsdvqK0Rf34b1lFtmHq4FrSlpyA7Fni5aB8JNd7Mt8YDF/QrhcIFBnmcwKLErlH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235127; c=relaxed/simple;
	bh=CfnRxmufD9BFa5b8W1bL5FF2qtdnavYecQUsRTtCjJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOIgPPKVdNjQuEG6Ln1gOgScVX/5JmITod08eHlNRFQ0TNego9jo5kDZA7IjEx6cxQ42d9cVmLIw1fMnRpTXOGRDYKy7pHn6+nxm8uUmkEQ6lJ4sGJvqim4WdqQ0BULRsk6WKns8F18GmQs68aNo3rjJG9tidgArLjioIN+z+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNrGdRwL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF5EC4CEE7;
	Wed, 18 Jun 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750235126;
	bh=CfnRxmufD9BFa5b8W1bL5FF2qtdnavYecQUsRTtCjJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nNrGdRwLhZ7NP0P6VyZegnph1FkmFymqeTegErJcd+OoajPMd/mZfGF07/mEir47S
	 +M4+0S5SJAih9ojrKXszbdqmHYJvFveMJPfx9CcA0dYNJt9GrVl1fQnGhV8XS3w1D5
	 DhXdcJI8NMWKG+cj/6ekw4l5Lwk5tSHaJ74EM3FbgMoL9qv5eab3ISECnU8JzEUS8P
	 Y0NIQyLxOtJsC0GlZcXIcDrIFfGUPkvf8tUDHclnMOYb33O7avMkkCDZjnGghLpObV
	 B6Z0fBjFuQRr8DHI/RdwKyRkmg4n3LhpRH+H47fkQTzKIblTgwFmvQ1VB9zpRT+dwo
	 E/5hB09Ftoymw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRo6n-000000007yV-2JUI;
	Wed, 18 Jun 2025 10:25:25 +0200
Date: Wed, 18 Jun 2025 10:25:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Chris Lew <chris.lew@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
Message-ID: <aFJ39fpIkEpqtZiM@hovoldconsulting.com>
References: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
 <aFJwfXsnxiCEWL1u@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFJwfXsnxiCEWL1u@hovoldconsulting.com>

On Wed, Jun 18, 2025 at 09:53:34AM +0200, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 02:05:42PM -0700, Chris Lew wrote:
> > The call to qrtr_endpoint_register() was moved before
> > mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> > callback can occur before the qrtr endpoint is registered.
> > 
> > Now the reverse can happen where qrtr will try to send a packet
> > before the channels are prepared. The correct sequence needs to be
> > prepare the mhi channel, register the qrtr endpoint, queue buffers for
> > receiving dl transfers.
> > 
> > Since qrtr will not use mhi_prepare_for_transfer_autoqueue(), qrtr must
> > do the buffer management and requeue the buffers in the dl_callback.
> > Sizing of the buffers will be inherited from the mhi controller
> > settings.
> > 
> > Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
> > Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> Thanks for the update. I believe this one should have a stable tag as
> well as it fixes a critical boot failure on Qualcomm platforms that we
> hit frequently with the in-kernel pd-mapper.
> 
> And it indeed fixes the crash:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

While it fixes the registration race and NULL-deref, something else is
not right with the patch.

On resume from suspend I now get a bunch of mhi errors for the ath12k
wifi:

[   25.843963] mhi mhi1: Requested to power ON
[   25.848766] mhi mhi1: Power on setup success
[   25.939124] mhi mhi1: Wait for device to enter SBL or Mission mode
[   26.325393] mhi mhi1: Error recycling buffer for chan:21
[   26.331193] mhi mhi1: Error recycling buffer for chan:21
[   26.336798] mhi mhi1: Error recycling buffer for chan:21
[   26.342390] mhi mhi1: Error recycling buffer for chan:21
[   26.347994] mhi mhi1: Error recycling buffer for chan:21
[   26.353609] mhi mhi1: Error recycling buffer for chan:21
[   26.359207] mhi mhi1: Error recycling buffer for chan:21
...

and after that there's a warning at shutdown when tearing down mhi:

[   36.384573] WARNING: CPU: 5 PID: 109 at mm/slub.c:4753 free_large_kmalloc+0x13c/0x160
[   36.552152] CPU: 5 UID: 0 PID: 109 Comm: kworker/u52:0 Not tainted 6.16.0-rc2 #10 PREEMPT
[   36.560724] Hardware name: Qualcomm CRD, BIOS 6.0.241007.BOOT.MXF.2.4-00534.1-HAMOA-1 10/ 7/2024
[   36.569835] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
[   36.575648] pstate: 21400005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   36.582882] pc : free_large_kmalloc+0x13c/0x160
[   36.587610] lr : kfree+0x208/0x32c
[   36.591166] sp : ffff80008107b900
[   36.594636] x29: ffff80008107b900 x28: 0000000000000000 x27: ffff800082b9d690
[   36.602045] x26: ffff800082f681e0 x25: ffff800082f681e8 x24: 00000000ffffffff
[   36.609454] x23: ffff00080406cd80 x22: 0000000000000001 x21: ffff0008023f2000
[   36.616863] x20: 05a2dd88f4602478 x19: fffffdffe008fc80 x18: 00000000000c8dc0
[   36.624272] x17: 0000000000000028 x16: ffffdd893588f02c x15: ffffdd8936a28928
[   36.631681] x14: ffffdd8936af16e8 x13: 0000000000008000 x12: 0000000000000000
[   36.639097] x11: ffffdd893709c968 x10: 0000000000000001 x9 : ffff0008099c95c0
[   36.646505] x8 : 0000001000000000 x7 : ffff0008099c95c0 x6 : 00000008823f2000
[   36.653915] x5 : ffffdd8937417f60 x4 : 0000000000000020 x3 : ffff000801c2d7e0
[   36.661324] x2 : 0bfffe0000000000 x1 : ffff0008023f2000 x0 : 00000000000000ff
[   36.668733] Call trace:
[   36.671307]  free_large_kmalloc+0x13c/0x160 (P)
[   36.676036]  kfree+0x208/0x32c
[   36.679241]  mhi_reset_chan+0x1d4/0x2e4 [mhi]
[   36.683786]  mhi_driver_remove+0x1bc/0x1fc [mhi]
[   36.688597]  device_remove+0x70/0x80
[   36.692341]  device_release_driver_internal+0x1e4/0x240
[   36.697778]  device_release_driver+0x18/0x24
[   36.702233]  bus_remove_device+0xd0/0x148
[   36.706424]  device_del+0x148/0x374
[   36.710077]  mhi_destroy_device+0xb0/0x13c [mhi]
[   36.714888]  device_for_each_child+0x60/0xbc
[   36.719344]  mhi_pm_disable_transition+0x154/0x510 [mhi]
[   36.724875]  mhi_pm_st_worker+0x2dc/0xb18 [mhi]
[   36.729594]  process_one_work+0x20c/0x610
[   36.733788]  worker_thread+0x244/0x388
[   36.737711]  kthread+0x150/0x220
[   36.741093]  ret_from_fork+0x10/0x20

Johan

