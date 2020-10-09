Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C249C288FE7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 19:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgJIRTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 13:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733199AbgJIRSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 13:18:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41364C0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 10:18:44 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k8so7421087pfk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B4B018iOmjRH9U0rvM1vFiDpxuXZ4GGFJ5yW0icLesU=;
        b=Z+PyMdjop/y0grk6bPHJ8CAMnCM4Tt93ry91JJcxoebdgHD1Wymz3kEJVG51D69o3N
         HOFVNYvb+Af1eG1264psM7M4Ek8otq4UTq5H0Lx2nlcVyxyizBKIJHAxn+7Qcwq/UKY4
         xyv4+ASbYkSmZdPU82EY7y0F+ZbN7/DxW9JwNhSfgKqv2HcyJAn1eZAPe2nQZv5ePKr2
         MukU9PifHa5I4bh8romqH4ibD7T3MJcMJO7deTpVAiqe6w3K+3RWLrIkQPx/6gogVUSZ
         lvf8XSMtC314b1Ti9BHFcKFuZIbgFlBnYqXKOAB/uANdyu3MuM8sUwMovy1PZZ+rL0jF
         5WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B4B018iOmjRH9U0rvM1vFiDpxuXZ4GGFJ5yW0icLesU=;
        b=mbyEzDiPqqZ5gMiMHtY7XI1mXSDDuJ93NsZaODJ//01vK7wQImLc7PWZfP9Yjq7Hxj
         XqNjN+833p4YMdAWaO4hoOvpGbiWfJcCDgL3TgYkIjhx/YolgEt/XdR8aGcIDsn7g4PF
         xklxbMbI3W/FKbIG0b1RnP7toYRFCYxW5ULfk8afECYOlQ1ec72rlxCXm+rGkeA6J1X/
         hWG8Y3tHXy9HQeQjHIDLB8jEDZCHWeVU6PSoRYX4qLKJVGjhVijnWBOPeXClSJvYpyV+
         37tXPeW37wKYg6+dhDA7dGAnM5voeWIE5NK8apPB9mD/gyYq7/nsj3quc5NqPk4TMf6l
         DWNA==
X-Gm-Message-State: AOAM530f0BHKlCLHQEhxYLd+rj8SvzmRpJeUv0jX01WU4+NQmypta/Hg
        qHfMcIpmhmGPQrUfzu4kxLDI
X-Google-Smtp-Source: ABdhPJyu5EYDyHQIUD6xjEISHgd+x5o3UdYP+DaESPHfmb1s666xvBKwTKr3rMm1PRvusC7drvImQQ==
X-Received: by 2002:aa7:87d9:0:b029:155:6486:ac68 with SMTP id i25-20020aa787d90000b02901556486ac68mr7703654pfo.30.1602263923447;
        Fri, 09 Oct 2020 10:18:43 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id h31sm11268405pgh.71.2020.10.09.10.18.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 10:18:42 -0700 (PDT)
Date:   Fri, 9 Oct 2020 22:48:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/10] bus: mhi: core: Mark device inactive soon after
 host issues a shutdown
Message-ID: <20201009171804.GK4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-11-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-11-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:35PM -0700, Bhaumik Bhatt wrote:
> Clients on the host may see the device in an active state for a short

Clients? Are you referring client drivers or controllers? Please don't mix
the conventions.

> period of time after the host detects a device error or power down.
> Prevent any further host activity which could lead to race conditions
> or multiple callbacks to the controller or any timeouts seen by
> clients attempting to push data as they must be notified of the host
> intent sooner rather than later. This also allows the host and device
> states to be in sync with one another and prevents unnecessary host
> operations.
> 

How the change of dev_state is visible to the so called "client"?

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c |  4 ++++
>  drivers/bus/mhi/core/pm.c   | 31 +++++++++++++++++++------------
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 1c8e332..5ec89e9 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -400,6 +400,10 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  
>  	 /* If device supports RDDM don't bother processing SYS error */
>  	if (mhi_cntrl->rddm_image) {
> +		/* host may be performing a device power down already */
> +		if (!mhi_is_active(mhi_cntrl))
> +			goto exit_intvec;
> +

Does this change belong to this patch?

Thanks,
Mani

>  		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
>  			/* prevent clients from queueing any more packets */
>  			write_lock_irq(&mhi_cntrl->pm_lock);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 16c04ab..4e2cb41 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -469,15 +469,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	prev_state = mhi_cntrl->pm_state;
>  	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
> -	if (cur_state == transition_state) {
> -		mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
> +	if (cur_state == MHI_PM_SYS_ERR_PROCESS)
>  		mhi_cntrl->dev_state = MHI_STATE_RESET;
> -	}
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
> -	/* Wake up threads waiting for state transition */
> -	wake_up_all(&mhi_cntrl->state_event);
> -
>  	if (cur_state != transition_state) {
>  		dev_err(dev, "Failed to transition to state: %s from: %s\n",
>  			to_mhi_pm_state_str(transition_state),
> @@ -486,6 +481,11 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  		return;
>  	}
>  
> +	mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
> +
> +	/* Wake up threads waiting for state transition */
> +	wake_up_all(&mhi_cntrl->state_event);
> +
>  	/* Trigger MHI RESET so that the device will not access host memory */
>  	if (MHI_REG_ACCESS_VALID(prev_state)) {
>  		u32 in_reset = -1;
> @@ -1051,22 +1051,29 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  	enum dev_st_transition next_state = DEV_ST_TRANSITION_DISABLE;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +	write_lock_irq(&mhi_cntrl->pm_lock);
> +
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
>  	if (!graceful) {
> -		mutex_lock(&mhi_cntrl->pm_mutex);
> -		write_lock_irq(&mhi_cntrl->pm_lock);
>  		cur_state = mhi_tryset_pm_state(mhi_cntrl,
>  						MHI_PM_LD_ERR_FATAL_DETECT);
> -		write_unlock_irq(&mhi_cntrl->pm_lock);
> -		mutex_unlock(&mhi_cntrl->pm_mutex);
> -		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT)
> +		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT) {
>  			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
>  				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
>  				to_mhi_pm_state_str(mhi_cntrl->pm_state));
> -		else
> +		} else {
>  			next_state = DEV_ST_TRANSITION_FATAL;
> +			wake_up_all(&mhi_cntrl->state_event);
> +		}
>  	}
>  
> +	/* mark device inactive to avoid any further host processing */
> +	mhi_cntrl->dev_state = MHI_STATE_RESET;
> +
> +	write_unlock_irq(&mhi_cntrl->pm_lock);
> +	mutex_unlock(&mhi_cntrl->pm_mutex);
> +
>  	mhi_queue_state_transition(mhi_cntrl, next_state);
>  
>  	/* Wait for shutdown to complete */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
