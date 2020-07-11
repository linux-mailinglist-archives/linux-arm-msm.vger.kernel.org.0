Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F28B21C118
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgGKATv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgGKATu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:19:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AA0C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:19:50 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k4so2891162pld.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HDzvrarpxVRGS3YI1+S4nP9wbQ6Ps5r9/+5rFRMDjq8=;
        b=IFcve6QXslNsQGfmqE/73an1VOYWatTTYNa7djJPmdfkXnz7QzxDRDEI2T6lk6Ks/C
         IBanZ0JUbgxgrJMHP6i94mnr9vSWHuzmbrD6fi+0Hnt79o3IGBxVW5q4+IlIm9cDU07o
         vMuNSLlkuPSq9Lc6FtcCGeeOGMrDlt3808PiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HDzvrarpxVRGS3YI1+S4nP9wbQ6Ps5r9/+5rFRMDjq8=;
        b=GHwX9TQt9wHqn4z98apjjWkvFQv0q7/XZ3Iuc3axWbN3ofXa6hpazFGtoxMt4BEQjN
         8WVKmfdKXWukgBNCl5oim0Q2BUqtEZnXnitmt+5aaCm1CbBOfCh5p3ctF+8sWcgT+L+A
         pE3rTh5iBDV6tllRg/P4fxg0KzC+BgNlCroI+EC/6u4XzG4jH424bQLztCygcH/si0Ix
         rQznUqM046jAC5sUAc9hJPAyK72sXf9q2rR2sOg7KaIYDydPryj2d1APbGB/bhNoyEN1
         zF+6OM8cd0WuAxYtH56KSemIZRGt8uGcy0mAJHZ9EMXOM7QOBCG871Pg0aFrPzKjrLsS
         KQDA==
X-Gm-Message-State: AOAM531JJqX6ecx4WaZf6w27A10Xc8GfjY0pMKzRaF1stNdA0lxYHCpK
        R3bkXbZ6D9JTsq0jiucM4aOFGQ==
X-Google-Smtp-Source: ABdhPJxFi77cHPi83WHZfNgIrYij0DkRVw+EOToKQ4xd0iL5C9vBPKqGVc+Lj2WDLhV4UXjevvGZ5A==
X-Received: by 2002:a17:90a:4fa2:: with SMTP id q31mr8824190pjh.178.1594426790054;
        Fri, 10 Jul 2020 17:19:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id x10sm6863017pfp.80.2020.07.10.17.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 17:19:49 -0700 (PDT)
Date:   Fri, 10 Jul 2020 17:19:48 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1] mmc: sdhci-msm: Set IO pins in low power state during
 suspend
Message-ID: <20200711001948.GO3191083@google.com>
References: <1594213888-2780-1-git-send-email-vbadigan@codeaurora.org>
 <1594213888-2780-2-git-send-email-vbadigan@codeaurora.org>
 <20200710005233.GN3191083@google.com>
 <63323fe2-e3a3-030f-5275-01fa6b04e23b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63323fe2-e3a3-030f-5275-01fa6b04e23b@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 10, 2020 at 04:28:36PM +0530, Veerabhadrarao Badiganti wrote:
> Hi Mathias,
> 
> On 7/10/2020 6:22 AM, Matthias Kaehlcke wrote:
> > Hi,
> > 
> > On Wed, Jul 08, 2020 at 06:41:20PM +0530, Veerabhadrarao Badiganti wrote:
> > > Configure SDHC IO pins with low power configuration when the driver
> > > is in suspend state.
> > > 
> > > Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> > > ---
> > >   drivers/mmc/host/sdhci-msm.c | 17 +++++++++++++++++
> > >   1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > index 392d41d57a6e..efd2bae1430c 100644
> > > --- a/drivers/mmc/host/sdhci-msm.c
> > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > @@ -15,6 +15,7 @@
> > >   #include <linux/iopoll.h>
> > >   #include <linux/regulator/consumer.h>
> > >   #include <linux/interconnect.h>
> > > +#include <linux/pinctrl/consumer.h>
> > >   #include "sdhci-pltfm.h"
> > >   #include "cqhci.h"
> > > @@ -1352,6 +1353,19 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
> > >   		sdhci_msm_hs400(host, &mmc->ios);
> > >   }
> > > +static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
> > > +{
> > > +	struct platform_device *pdev = msm_host->pdev;
> > > +	int ret;
> > > +
> > > +	if (level)
> > > +		ret = pinctrl_pm_select_default_state(&pdev->dev);
> > > +	else
> > > +		ret = pinctrl_pm_select_sleep_state(&pdev->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> > >   {
> > >   	if (IS_ERR(mmc->supply.vmmc))
> > > @@ -1596,6 +1610,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
> > >   			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
> > >   					pwr_state & REQ_BUS_ON);
> > >   		if (!ret)
> > > +			ret = sdhci_msm_set_pincfg(msm_host,
> > > +					pwr_state & REQ_BUS_ON);
> > > +		if (!ret)
> > >   			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> > >   		else
> > >   			irq_ack |= CORE_PWRCTL_BUS_FAIL;
> > I happened to have a debug patch in my tree which logs when regulators
> > are enabled/disabled, with this patch I see the SD card regulator
> > toggling constantly after returning from the first system suspend.
> > 
> > I added more logs:
> > 
> > [ 1156.085819] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
> > [ 1156.248936] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
> > [ 1156.301989] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
> > [ 1156.462383] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
> > [ 1156.525988] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
> > [ 1156.670372] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
> > [ 1156.717935] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
> > [ 1156.878122] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
> > [ 1156.928134] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
> > 
> > This is on an SC7180 platform. It doesn't run an upstream kernel though,
> > but v5.4 with plenty of upstream patches.
> I have verified this on couple of sc7180 targets (on Chrome platform with
> Chrome kernel).
> But didn't see any issue. Its working as expected.

Did you test system suspend too? At least in the Chrome OS kernel tree system
suspend is not supported yet in the main branch, you'd need a pile of 30+
extra patches to get it to work. This is expected to change soon though :)

> Let me know if you are observing this issue constantly on multiple boards, I
> will share you
> a debug patch to check it further.

I currently have only one board with the SD card slot populated, I might
get another one next week.

The toggling occurs only when no SD card is inserted.
