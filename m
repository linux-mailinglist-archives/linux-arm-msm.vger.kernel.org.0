Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5271D0972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 09:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgEMHEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 03:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbgEMHEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 03:04:11 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F179BC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 00:04:10 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b190so1843784pfg.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z1F2s/+f+lw9uO7rQ55VG5I1nlicDx+n8EcbwlW6GEY=;
        b=cY9kffmcGW07Z5UEg2E491/shdagnh+lsIJV/FzgCG2qF5NAAQMIOJJ8UQLJt6Utm8
         HOviAhzLo5bTShXUfI8T8WaD3YeSy4E2I6KUTmSTp+i5JLTWz9wLY4Lc80KTvBE4isoJ
         xNBk1KN5zz9eRGwlBpAFn1uhwoavUYpNp/fb+EWka8AKuG8XlKJ7x+ycXIJSLK54Feho
         YCdxChR2fIWNL2xIfYp0tsiPvMj78Yh4hcgpG1b7TB3sfa8P8oehtN5C3hJqxoxh9oxl
         ZOkNTRFTqaUxPV2wipBjVcsvShi2+aFzGWhGW/FAWRJHUTsNQtVpucSgEzYj8AudW52I
         oJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z1F2s/+f+lw9uO7rQ55VG5I1nlicDx+n8EcbwlW6GEY=;
        b=NwG8jF7x4nR/2ZlErnsRkeL+MdRJ1apIYXqdyvBvMQDwxtmGUIroSqA+gI4q8laH7q
         +MAjwsZ+STCzqa5xVsB7tiOnZ0aaex+Twnf+eCCKdUSi7h5C+IEMKS2IEYoQQN4e3d14
         RUCmebb37A9OQv16DQUnxU4BUT5xmlX7kIow+OfmpYW4FRmIWX/ragADB0b9rUYZoqZ9
         6Wq0/vLiSAa/JJctJ8Lmy8bsxLBy3DSlN60ec4Kij2zmLt7KNFBkhgpnPWqJz2RaaGL3
         TNlVY3AA34GNVDMZpX/LkEl2lgVtTtj6sZoGXDiROwU7z8U7N6SD8+eP7ZGjEYidAHfb
         oqvQ==
X-Gm-Message-State: AGi0PuboRElVn5xsMidMedhI1rUYWVbeW9esN8JuUD5qgcSt7O8VcrVq
        L1YG2a8qzEQMyaAfgFREg8Yt
X-Google-Smtp-Source: APiQypL6xJQlrhvV3Y3+lPYNU7n5DCbP8jl8IH33zTYY2mG0swMjDBMjF6OdQlplq3rFwPPKyOf0VQ==
X-Received: by 2002:a63:ed50:: with SMTP id m16mr24321664pgk.271.1589353450263;
        Wed, 13 May 2020 00:04:10 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:30b:c888:d8ce:4edd:4c38:4a1b])
        by smtp.gmail.com with ESMTPSA id g14sm13652430pfh.49.2020.05.13.00.04.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 00:04:09 -0700 (PDT)
Date:   Wed, 13 May 2020 12:34:03 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1 3/5] bus: mhi: core: Skip handling BHI irq if MHI reg
 access is not allowed
Message-ID: <20200513070402.GA26866@Mani-XPS-13-9360>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
 <1589248989-23824-4-git-send-email-hemantk@codeaurora.org>
 <20200512065349.GE4928@Mani-XPS-13-9360>
 <5e9a15ed-4bad-744a-af07-b28c3bcc47c4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e9a15ed-4bad-744a-af07-b28c3bcc47c4@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 12, 2020 at 05:28:45PM -0700, Hemant Kumar wrote:
> Hi Mani,
> 
> On 5/11/20 11:53 PM, Manivannan Sadhasivam wrote:
> > On Mon, May 11, 2020 at 07:03:07PM -0700, Hemant Kumar wrote:
> > > Driver continues handling of BHI interrupt even if MHI register access
> > > is not allowed. By doing so it calls the status call back and performs
> > > early notification for the MHI client. This is not needed when MHI
> > > register access is not allowed. Hence skip the handling in this case and
> > > return. Also add debug log to print device state, local EE and device EE
> > > when reg access is valid.
> > > 
> > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > > Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > ---
> > >   drivers/bus/mhi/core/main.c | 21 ++++++++++++++-------
> > >   1 file changed, 14 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index 9ec9b36..467c0ba 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -369,22 +369,29 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
> > >   	return IRQ_HANDLED;
> > >   }
> > > -irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
> > > +irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
> > >   {
> > > -	struct mhi_controller *mhi_cntrl = dev;
> > > +	struct mhi_controller *mhi_cntrl = priv;
> > > +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > >   	enum mhi_state state = MHI_STATE_MAX;
> > >   	enum mhi_pm_state pm_state = 0;
> > >   	enum mhi_ee_type ee = 0;
> > >   	write_lock_irq(&mhi_cntrl->pm_lock);
> > > -	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> > > -		state = mhi_get_mhi_state(mhi_cntrl);
> > > -		ee = mhi_cntrl->ee;
> > > -		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> > > +	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> > > +		write_unlock_irq(&mhi_cntrl->pm_lock);
> > 
> > write_lock is only used for protecting 'mhi_cntrl->ee' but here we are not
> > updating it if reg access is not valid. So there is no reason to hold this lock.
> Original code is using write_lock to protect pm_state as well as
> mhi_cntrl->ee. This patch is keeping the lock same as original code. Just if
> condition logic is negated here due to that write_unlock_irq is added under
> if condition.

'mhi_cntrl->pm_state' is not always protected by 'pm_lock' and that too
write_lock is used here but 'pm_state' is not modified. So as like in most of
the places, locks are abused here as well.

I think after 5.8, you should really think about fixing the usage of locks
throughout the MHI stack.

So I'll take this patch as it is.

Thanks,
Mani

> > 
> > > +		goto exit_intvec;
> > >   	}
> > > +	state = mhi_get_mhi_state(mhi_cntrl);
> > > +	ee = mhi_cntrl->ee;
> > > +	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> > 
> > But it is needed here.
> > 
> > Thanks,
> > Mani
> > 
> > > +	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
> > > +		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
> > > +		TO_MHI_STATE_STR(state));
> > > +
> > >   	if (state == MHI_STATE_SYS_ERR) {
> > > -		dev_dbg(&mhi_cntrl->mhi_dev->dev, "System error detected\n");
> > > +		dev_dbg(dev, "System error detected\n");
> > >   		pm_state = mhi_tryset_pm_state(mhi_cntrl,
> > >   					       MHI_PM_SYS_ERR_DETECT);
> > >   	}
> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
