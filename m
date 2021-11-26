Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7324B45E6BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 05:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240350AbhKZENd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 23:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241959AbhKZELd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 23:11:33 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4848C07E5C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 19:01:50 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id o4so7485236pfp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 19:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BynVQIeiNIivT05KJS287cNnQbooVUGhheNqcoVB4w4=;
        b=iIt14tMtJniwQbZaAxQ3Est4t3Ff2ts/f/MX1Z156JA5MWVxigWssvjYU5EZJe36v6
         EfRA2YIb7gMLSJ9e8AUw2SkHewhVtX8Z9PuFsPqlvq119QeECz648sU5fJUEmeTIIFeR
         /hX6E5r/BI4+vcbNBJCBK60qwZOeAQz7zuLat9mjGDPJI4OYB8GoXr0enoVLuNXlJ8t4
         5ZpuZiKngvPQKsj4jlEsxGggQ8oex/vT8zIPqw2YucrnSFoEhV93a521klxipWNBZjuG
         1EHaioBjoG8MjVspsZokAmRuGgs4CRnS4WydA99kE72y8p8lwR3+wlH3gvl2lV111t8q
         UlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BynVQIeiNIivT05KJS287cNnQbooVUGhheNqcoVB4w4=;
        b=GHuLryx/1TuLj3M7NlEI7thgqOwtMltKrqJVL+PJydf7UzuMfQ6Pw9iOAGCWOEMFEV
         MYYLXVk3Oc+39QMu1VAdPtutBYXXSMpkYPWI6M4GhsZGhHmcZ3jt5qyiMwfmLjZOFEK6
         9JZEUzUzG5/RL7eFSKshFFBfKqtvFiA8PW+y/xuphWgAEiebdBuUarfMgdxf+NExkd/o
         GQKZ/Qpnpr3gJx9MEqaT++l7mUKoctiWeZ72zRosfB2HxZcvgo2p/96C4msA5BakongX
         dw/QBSc4UEBo5H2AjijBjhNYtPX3ysQ49cGRho2R9dCXifKYmbVUyeRl0ZD+LcHQ8+rf
         c1sw==
X-Gm-Message-State: AOAM533WLiw9lb4YtSK/YC3usiBGmNZYPYyr9zmp7gnDr5AIBpv4Efg1
        KXbsbGDfen/NDXyd7wgkVsAD
X-Google-Smtp-Source: ABdhPJzAB/unmK4+Mb/MfAf42HoI7g6onRWKtvspjP/fglbRciESFe8VcxE1LBEMAY1C7pt3p6LBqA==
X-Received: by 2002:a63:4745:: with SMTP id w5mr19143246pgk.320.1637895710318;
        Thu, 25 Nov 2021 19:01:50 -0800 (PST)
Received: from thinkpad ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id h186sm4731054pfg.59.2021.11.25.19.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 19:01:49 -0800 (PST)
Date:   Fri, 26 Nov 2021 08:31:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev, quic_jhugo@quicinc.com,
        hemantk@codeaurora.org, bbhatt@codeaurora.org
Cc:     aleksander@aleksander.es, loic.poulain@linaro.org,
        thomas.perrot@bootlin.com, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: Fix race while handling SYS_ERR at power up
Message-ID: <20211126030144.GC5859@thinkpad>
References: <20211124132221.44915-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124132221.44915-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 24, 2021 at 06:52:21PM +0530, Manivannan Sadhasivam wrote:
> Some devices tend to trigger SYS_ERR interrupt while the host handling
> SYS_ERR state of the device during power up. This creates a race
> condition and causes a failure in booting up the device.
> 
> The issue is seen on the Sierra Wireless EM9191 modem during SYS_ERR
> handling in mhi_async_power_up(). Once the host detects that the device
> is in SYS_ERR state, it issues MHI_RESET and waits for the device to
> process the reset request. During this time, the device triggers SYS_ERR
> interrupt to the host and host starts handling SYS_ERR execution.
> 
> So by the time the device has completed reset, host starts SYS_ERR
> handling. This causes the race condition and the modem fails to boot.
> 
> Hence, register the IRQ handler only after handling the SYS_ERR check
> to avoid getting spurious IRQs from the device.
> 
> Cc: stable@vger.kernel.org
> Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
> Reported-by: Aleksander Morgado <aleksander@aleksander.es>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Hemant, Bhaumik, Jeff: Can you please do the review again?

Thanks,
Mani

> ---
> 
> Changes in v4:
> 
> * Reverted the change that moved BHI_INTVEC as that was causing issue as
>   reported by Aleksander.
> 
> Changes in v3:
> 
> * Moved BHI_INTVEC setup after irq setup
> * Used interval_us as the delay for the polling API
> 
> Changes in v2:
> 
> * Switched to "mhi_poll_reg_field" for detecting MHI reset in device.
> 
>  drivers/bus/mhi/core/pm.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e3727155..21484a61bbed 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1038,7 +1038,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	enum mhi_ee_type current_ee;
>  	enum dev_st_transition next_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	u32 val;
> +	u32 interval_us = 25000; /* poll register field every 25 milliseconds */
>  	int ret;
>  
>  	dev_info(dev, "Requested to power ON\n");
> @@ -1055,10 +1055,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  
> -	ret = mhi_init_irq_setup(mhi_cntrl);
> -	if (ret)
> -		goto error_setup_irq;
> -
>  	/* Setup BHI INTVEC */
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> @@ -1072,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		dev_err(dev, "%s is not a valid EE for power on\n",
>  			TO_MHI_EXEC_STR(current_ee));
>  		ret = -EIO;
> -		goto error_async_power_up;
> +		goto error_setup_irq;
>  	}
>  
>  	state = mhi_get_mhi_state(mhi_cntrl);
> @@ -1081,20 +1077,12 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	if (state == MHI_STATE_SYS_ERR) {
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> -		ret = wait_event_timeout(mhi_cntrl->state_event,
> -				MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
> -					mhi_read_reg_field(mhi_cntrl,
> -							   mhi_cntrl->regs,
> -							   MHICTRL,
> -							   MHICTRL_RESET_MASK,
> -							   MHICTRL_RESET_SHIFT,
> -							   &val) ||
> -					!val,
> -				msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -		if (!ret) {
> -			ret = -EIO;
> +		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
> +				 interval_us);
> +		if (ret) {
>  			dev_info(dev, "Failed to reset MHI due to syserr state\n");
> -			goto error_async_power_up;
> +			goto error_setup_irq;
>  		}
>  
>  		/*
> @@ -1104,6 +1092,10 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>  	}
>  
> +	ret = mhi_init_irq_setup(mhi_cntrl);
> +	if (ret)
> +		goto error_setup_irq;
> +
>  	/* Transition to next state */
>  	next_state = MHI_IN_PBL(current_ee) ?
>  		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
> @@ -1116,9 +1108,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	return 0;
>  
> -error_async_power_up:
> -	mhi_deinit_free_irq(mhi_cntrl);
> -
>  error_setup_irq:
>  	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
> -- 
> 2.25.1
> 
