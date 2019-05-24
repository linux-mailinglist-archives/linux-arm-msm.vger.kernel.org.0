Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8742986B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 15:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391124AbfEXNCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 09:02:10 -0400
Received: from onstation.org ([52.200.56.107]:54248 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391045AbfEXNCK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 09:02:10 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B68C73E88C;
        Fri, 24 May 2019 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1558702928;
        bh=z0jLt5GmPMP9SlehCoH5XOtq6l1p49diMIagJEvp4Qk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=smAVCUCykCHg++Dm5V8KlqfT5bsIWumj7ZrBGCUTy1m2iBlT5OcjhX8UojJtSkArp
         oO1iKMD08rTaMxV65tpG71BGKZI74eEZXsPUcu8XJmKDy+Un1OI9m7V5vCceJ9SDAz
         +SeCUTfxNxkazFQxBs6dIPwU4/AU/YhAZhx6naOQ=
Date:   Fri, 24 May 2019 09:02:08 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     ulf.hansson@linaro.org, faiz_abbas@ti.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhci: queue work after sdhci_defer_done()
Message-ID: <20190524130208.GA16322@basecamp>
References: <20190524111053.12228-1-masneyb@onstation.org>
 <70782901-a9ac-5647-1abe-89c86a44a01b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70782901-a9ac-5647-1abe-89c86a44a01b@intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 24, 2019 at 03:17:13PM +0300, Adrian Hunter wrote:
> On 24/05/19 2:10 PM, Brian Masney wrote:
> > WiFi stopped working on the LG Nexus 5 phone and the issue was bisected
> > to the commit c07a48c26519 ("mmc: sdhci: Remove finish_tasklet") that
> > moved from using a tasklet to a work queue. That patch also changed
> > sdhci_irq() to return IRQ_WAKE_THREAD instead of finishing the work when
> > sdhci_defer_done() is true. Change it to queue work to the complete work
> > queue if sdhci_defer_done() is true so that the functionality is
> > equilivent to what was there when the finish_tasklet was present. This
> > corrects the WiFi breakage on the Nexus 5 phone.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > Fixes: c07a48c26519 ("mmc: sdhci: Remove finish_tasklet")
> > ---
> > See 'sdhci@f98a4900' in qcom-msm8974-lge-nexus5-hammerhead.dts for
> > details about how the WiFi is wired into sdhci on this platform.
> > 
> > bisect log:
> > 
> >  git bisect start
> >  # bad: [4dde821e4296e156d133b98ddc4c45861935a4fb] Merge tag 'xfs-5.2-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
> >  git bisect bad 4dde821e4296e156d133b98ddc4c45861935a4fb
> >  # good: [e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd] Linux 5.1
> >  git bisect good e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd
> >  # bad: [8c79f4cd441b27df6cadd11b70a50e06b3b3a2bf] Merge tag 'docs-5.2' of git://git.lwn.net/linux
> >  git bisect bad 8c79f4cd441b27df6cadd11b70a50e06b3b3a2bf
> >  # bad: [67a242223958d628f0ba33283668e3ddd192d057] Merge tag 'for-5.2/block-20190507' of git://git.kernel.dk/linux-block
> >  git bisect bad 67a242223958d628f0ba33283668e3ddd192d057
> >  # good: [8ff468c29e9a9c3afe9152c10c7b141343270bf3] Merge branch 'x86-fpu-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> >  git bisect good 8ff468c29e9a9c3afe9152c10c7b141343270bf3
> >  # good: [e2a5be107f52cefb9010ccae6f569c3ddaa954cc] staging: kpc2000: kpc_spi: Fix build error for {read,write}q
> >  git bisect good e2a5be107f52cefb9010ccae6f569c3ddaa954cc
> >  # bad: [cf482a49af564a3044de3178ea28f10ad5921b38] Merge tag 'driver-core-5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
> >  git bisect bad cf482a49af564a3044de3178ea28f10ad5921b38
> >  # good: [9f2e3a53f7ec9ef55e9d01bc29a6285d291c151e] Merge tag 'for-5.2-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> >  git bisect good 9f2e3a53f7ec9ef55e9d01bc29a6285d291c151e
> >  # good: [b4b52b881cf08e13d110eac811d4becc0775abbf] Merge tag 'Wimplicit-fallthrough-5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux
> >  git bisect good b4b52b881cf08e13d110eac811d4becc0775abbf
> >  # bad: [d5f758f2df8015b8dcf47b6403cc192e4cef734d] mmc: meson-gx: disable HS400
> >  git bisect bad d5f758f2df8015b8dcf47b6403cc192e4cef734d
> >  # good: [b3fb9d64b497b890f7b779a9f0b40b5cc269ea18] mmc: mmci: define get_dctrl_cfg for legacy variant
> >  git bisect good b3fb9d64b497b890f7b779a9f0b40b5cc269ea18
> >  # good: [ade024f130f742725da9219624b01666f04bc4a6] memstick: jmb38x_ms: remove set but not used variable 'data'
> >  git bisect good ade024f130f742725da9219624b01666f04bc4a6
> >  # bad: [42c38d4a1bc41e78dedbf73b0fb35e44007789bb] mmc: core: Fix warning and undefined behavior in mmc voltage handling
> >  git bisect bad 42c38d4a1bc41e78dedbf73b0fb35e44007789bb
> >  # good: [19d2f695f4e82794df7465b029c02b104d1b9903] mmc: sdhci: Call mmc_request_done() from IRQ handler if possible
> >  git bisect good 19d2f695f4e82794df7465b029c02b104d1b9903
> >  # bad: [71c733c4e1aeb83e8221e89caeec893d51f88b7b] mmc: tegra: add sdhci tegra suspend and resume
> >  git bisect bad 71c733c4e1aeb83e8221e89caeec893d51f88b7b
> >  # bad: [c07a48c2651965e84d35cf193dfc0e5f7892d612] mmc: sdhci: Remove finish_tasklet
> >  git bisect bad c07a48c2651965e84d35cf193dfc0e5f7892d612
> >  # first bad commit: [c07a48c2651965e84d35cf193dfc0e5f7892d612] mmc: sdhci: Remove finish_tasklet
> > 
> >  drivers/mmc/host/sdhci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > index 97158344b862..3563c3bc57c9 100644
> > --- a/drivers/mmc/host/sdhci.c
> > +++ b/drivers/mmc/host/sdhci.c
> > @@ -3115,7 +3115,7 @@ static irqreturn_t sdhci_irq(int irq, void *dev_id)
> >  			continue;
> >  
> >  		if (sdhci_defer_done(host, mrq)) {
> > -			result = IRQ_WAKE_THREAD;
> > +			queue_work(host->complete_wq, &host->complete_work);
> 
> The IRQ thread has a lot less latency than the work queue, which is why it
> is done that way.
> 
> I am not sure why you say this change is equivalent to what was there
> before, nor why it fixes your problem.
> 
> Can you explain some more?

What I meant by the equivalent change was that tasklet_schedule() used
to be called in this situation rather than returning IRQ_WAKE_THREAD.

I'm honestly not sure exactly what's going on yet. Without the patch I
sent out, wlan0 is not detected on the phone. Perhaps there is a subtle
race condition somewhere that is exposed with the reduction in latency
since I assume tasklet_schedule() is more expensive than doing the
processing in the bottom half?

I'll do some more digging and see if I can find more information. I sent
this out to get a discussion started.

Brian
