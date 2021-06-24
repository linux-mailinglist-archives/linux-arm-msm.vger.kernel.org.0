Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E1A3B316F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbhFXOfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 10:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhFXOfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 10:35:12 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DDFC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:32:53 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h23so3594643pjv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mZ5KlgV4skhOj5gTvR4vLXaoA/Zt4yAkmCPckN2oA9U=;
        b=jSQ97apMr7ov5WqeLGxiO0pXS+bMBS/GvSn2PwaAOYrog2uDjJ1I0JAkOpnnyT5hkc
         PY1nhNURjmvNV9ELhnJGdomlVexunLflJXRTpPQ2s3i31sB2Ljg9p2sxShRAsgXmz1Ft
         yTKgHm907KXUCTa4XsGs79ehN/zcH4TZVpqvwtb4sK4MMpzDfmK3MBo54Ub8TDE5n1ga
         o4oKyDy50Wj084IPcuOTmTHXG/2cVaiuSfPYztfF7a2X/YSGFTlzPXKA2cxM5A7auD0r
         I8YsG44oi35bfquoFtt5KnUBLd9AWJ54bRNzyaDYZoMIKh1ohttigaJqJaiPe2ElHaFA
         ybmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mZ5KlgV4skhOj5gTvR4vLXaoA/Zt4yAkmCPckN2oA9U=;
        b=VProucstxOKLol3F74nl2XdiuEDePg6efY5ZWE821EfaoH8V01BphpNPHZvjwmxBPj
         TCN2JkuhfeN08ZJn5zQojVIHUGSIGGrfTbSiGbf9nvjFIMtaSZq2sIfz+mmRarpSOydT
         kW7H50sxVZB1wWMvMM6krxmgXxyQOGKHmYtVUbXmCfj6A3Fc2w44yiSTL4FdUvX/gh/G
         Fup+29RsTx7baimSAepaKF9EOHcO5IjoOenB+dAF0XbffCQCiqL3O/pskX3/dXwF4iA3
         BIKM0yU1B7up0EEhuKaX1tjlAa2uP2P79ciQBN4YMeeLgA7r9U4tYsT5hqgbqTeOJxrB
         zLhg==
X-Gm-Message-State: AOAM530VgLJUrpQzjdowmsWYh3AvOkTe5NK/KM9A6DL6+a0kRbPXbyqI
        x6Xf8ztEgGTt2vh203EaXXbh
X-Google-Smtp-Source: ABdhPJzPu3fz/B7ls96dBWmzLTmn8AkR+IlhW59m8sA93c4r/yWjj3nS79DYOZmEyQfzzCLwozDi7A==
X-Received: by 2002:a17:90a:7801:: with SMTP id w1mr5700676pjk.179.1624545172726;
        Thu, 24 Jun 2021 07:32:52 -0700 (PDT)
Received: from workstation ([120.138.12.173])
        by smtp.gmail.com with ESMTPSA id j13sm3166608pfh.145.2021.06.24.07.32.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jun 2021 07:32:52 -0700 (PDT)
Date:   Thu, 24 Jun 2021 20:02:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, stable@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/8] bus: mhi: core: Validate channel ID when processing
 command completions
Message-ID: <20210624143248.GC6108@workstation>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <20210621161616.77524-2-manivannan.sadhasivam@linaro.org>
 <YNSNtQxVaegArG2f@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNSNtQxVaegArG2f@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 03:50:45PM +0200, Greg KH wrote:
> On Mon, Jun 21, 2021 at 09:46:09PM +0530, Manivannan Sadhasivam wrote:
> > From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > 
> > MHI reads the channel ID from the event ring element sent by the
> > device which can be any value between 0 and 255. In order to
> > prevent any out of bound accesses, add a check against the maximum
> > number of channels supported by the controller and those channels
> > not configured yet so as to skip processing of that event ring
> > element.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
> > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > Link: https://lore.kernel.org/r/1619481538-4435-1-git-send-email-bbhatt@codeaurora.org
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/bus/mhi/core/main.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > index 22acde118bc3..ed07421c4870 100644
> > --- a/drivers/bus/mhi/core/main.c
> > +++ b/drivers/bus/mhi/core/main.c
> > @@ -773,11 +773,16 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
> >  	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
> >  
> >  	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
> > -	mhi_chan = &mhi_cntrl->mhi_chan[chan];
> > -	write_lock_bh(&mhi_chan->lock);
> > -	mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
> > -	complete(&mhi_chan->completion);
> > -	write_unlock_bh(&mhi_chan->lock);
> > +	WARN_ON(chan >= mhi_cntrl->max_chan);
> 
> What can ever trigger this WARN_ON()?  Do you mean to reboot a machine
> if panic-on-warn is set?
> 
> If this can actually happen, then check for it and recover properly,
> don't just blindly warn and then keep on going.
> 

We can't do much here other than warning the user and dropping the
command.

There is no recovery possible because, the device has sent the command
completion event on a wrong channel. It can't happen usually unless a
malcious device sits on the other end.

Thanks,
Mani

> thanks,
> 
> greg k-h
