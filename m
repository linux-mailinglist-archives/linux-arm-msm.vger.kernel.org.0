Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358D22A90F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 09:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgKFIGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 03:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgKFIGO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 03:06:14 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A8EC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 00:06:12 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id e7so575826pfn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qS7CqIL0iWOp7yrf0mdTJOAu8D0DMWNDCm6U/2JWWds=;
        b=PMhWbCpgW+tpRHJYe2IsNeYxmYLvxCH0reHZ6KmT8CVfzMsHn2a57NE8DGqMgodYsH
         15j3SPFfJYGE/gLepC3xZxR7mygSjQ0gxIegjqQShiWH8pKcXgvNd3bC0alnn4uEjrL0
         SBSVg60mzYSlfpHUypl9n6J1QG+8NyQCGzTjwjXEogzD6Bux9jNzLBPTzFC5Zt5w8K1C
         +8EBtxB6RJBJ0X6EC5sVAp5Nr3DRXspJYOET9yrpsEtc74GnAx7cT0SRWjGZ5GSBNIt3
         d/am9TiqLYv3L0qgsfE+UtZUHi4esVxgp2YxtFKa0BpPeA5tmR/8jY2l4p2aYQuuO4oF
         f8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qS7CqIL0iWOp7yrf0mdTJOAu8D0DMWNDCm6U/2JWWds=;
        b=Efs1+AB1cLUYp8l/xRS7bEQ+kCMXB+ilWKwz6DKCRUPcBFQSoMbC2E2Nu/Jf4xCWag
         JHZeYMrl5ZwhjgRz039R4WESpte6UAuEoyAIneM6pHdKBjO0stl1G1y1lreYoDOjuoxY
         4HyQNfPVKT996AyLFMM2wQm/eUItj7f7+Qi8qwA1OevNQ7vSKgO4v3zjBayFrcdz5f3T
         T6HewE76xKFj7NhU5C+m9Lu2ncihq/2qgwj1Um/r24cDmqEao3EVF5mr1C4Znc50CPcx
         1MempjxNglfbEGwa/tDJRPklfBkyylLbYPeJEm8kpIAKPJeX3QdmIQAkDgsK4SflmYzZ
         W0gg==
X-Gm-Message-State: AOAM533y0PrlYUPZaRM1hoxB/ByzzQj+gWi3P8WeK1ETIFJ1o6erwuwv
        tz2wah2T04GJfeUJLJHaWA4f
X-Google-Smtp-Source: ABdhPJyjW7oZl7LsL5U6Zw7jwCpqFPldt1WQC3L/aFckMH28fzN7T2z0KZ2dO2ofuwkJ11dTAAz4fA==
X-Received: by 2002:a17:90b:2342:: with SMTP id ms2mr1239856pjb.136.1604649971992;
        Fri, 06 Nov 2020 00:06:11 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id hz18sm1149606pjb.13.2020.11.06.00.06.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 00:06:11 -0800 (PST)
Date:   Fri, 6 Nov 2020 13:36:05 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v1 2/2] bus: mhi: core: Check for device supported event
 rings and channels
Message-ID: <20201106080605.GI3473@work>
References: <1603504843-38557-1-git-send-email-hemantk@codeaurora.org>
 <1603504843-38557-3-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603504843-38557-3-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 07:00:43PM -0700, Hemant Kumar wrote:
> It is possible that the device does not support the number of event
> rings and channels that the controller would like to use. Read the
> MHICFG to determine device-side support and if the controller requests
> more than the device supports, bailout without configuring device MMIO
> registers.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c     | 31 +++++++++++++++++++++++++++++++
>  drivers/bus/mhi/core/internal.h |  4 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 70fd6af..35a6b1d 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -488,6 +488,37 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  		{ 0, 0, 0 }
>  	};
>  
> +	/* range check b/w host and device supported ev rings and channels */
> +	ret = mhi_read_reg(mhi_cntrl, base, MHICFG, &val);
> +	if (ret) {
> +		dev_err(dev, "Unable to read MHICFG register\n");
> +		return -EIO;
> +	}
> +
> +	if (MHICFG_NHWER(val) < mhi_cntrl->hw_ev_rings) {
> +		dev_err(dev, "#HWEV ring: host requires %d dev supports %d\n",
> +			mhi_cntrl->hw_ev_rings, MHICFG_NHWER(val));

Can you please improve this error message? Something like, "Host
requires %d hw event rings but dev supports only %d".

Do this for below errors as well. With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +		return -EIO;
> +	}
> +
> +	if (MHICFG_NER(val) < mhi_cntrl->total_ev_rings) {
> +		dev_err(dev, "#EV ring: host requires %d dev supports %d\n",
> +			mhi_cntrl->total_ev_rings, MHICFG_NER(val));
> +		return -EIO;
> +	}
> +
> +	if (MHICFG_NHWCH(val) < mhi_cntrl->hw_chan) {
> +		dev_err(dev, "#HWCH: host requires %d dev supports %d\n",
> +			mhi_cntrl->hw_chan, MHICFG_NHWCH(val));
> +		return -EIO;
> +	}
> +
> +	if (MHICFG_NCH(val) < mhi_cntrl->max_chan) {
> +		dev_err(dev, "#CH: host requires %d dev supports %d\n",
> +			mhi_cntrl->max_chan, MHICFG_NCH(val));
> +		return -EIO;
> +	}
> +
>  	dev_dbg(dev, "Initializing MHI registers\n");
>  
>  	/* Read channel db offset */
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 3d8e480..9cbfa71 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -28,6 +28,10 @@ extern struct bus_type mhi_bus_type;
>  #define MHICFG_NHWCH_SHIFT (8)
>  #define MHICFG_NCH_MASK (0xFF)
>  #define MHICFG_NCH_SHIFT (0)
> +#define MHICFG_NHWER(n) (((n) & MHICFG_NHWER_MASK) >> MHICFG_NHWER_SHIFT)
> +#define MHICFG_NER(n) (((n) & MHICFG_NER_MASK) >> MHICFG_NER_SHIFT)
> +#define MHICFG_NHWCH(n) (((n) & MHICFG_NHWCH_MASK) >> MHICFG_NHWCH_SHIFT)
> +#define MHICFG_NCH(n) (((n) & MHICFG_NCH_MASK) >> MHICFG_NCH_SHIFT)
>  
>  #define CHDBOFF (0x18)
>  #define CHDBOFF_CHDBOFF_MASK (0xFFFFFFFF)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
