Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C9E2B3CE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 07:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgKPGOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 01:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgKPGOd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 01:14:33 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484BAC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2020 22:14:32 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id t18so7922902plo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2020 22:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ry3fN92EHHX1LD2rBzx6c9CA9/xGEWIQ9u5LUGulEmw=;
        b=puP7aXdRTDJB81/WVp1ounZXgQBPPBhiWK0K99W3bblEv8WhG2u/YWsL4q0DKIfIyU
         ioQYp2B3F+ucSm63gyuARuDChjEx8FYy+bVJQF/0+lImYnBNHmOaQOXnWePza4p+HUPO
         KqnuT3RtcbfMwe9FXLj7ow8REXMjamk23L8HnaQCgm0K2oOsheXYbutfTA3sU3J7GXMN
         maGbaePzve6cgpC4ZJUAlsr0bOlAHv9oK7H8cAOcSksIgbQoN5Ys7Io09wikllbFaykz
         a+mz3EYhRcxKl5+7WNFVdEUU0fxV1luMaDqlqmvbhgKb+hM/mDFybyd2aX100cXaw3Cj
         WkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ry3fN92EHHX1LD2rBzx6c9CA9/xGEWIQ9u5LUGulEmw=;
        b=unOiwzl42tkmL9Vqlw178ANMvBCyWRXS0gPdQdexFV/UQWHUcoAP9qHn7MA0wiBT/4
         pg3Bk59xgTxzCQYrW7Yk6cMrmDVLJf/i8QbsVq6vgPObWOG9xpXH9mYX/CL/BQUfwRTd
         caPl91wq18ypI+2KojI7ELi0+puSwjXoHBN9eMGII7sW5eaMoG2bb8ezITam/BvzYqTu
         uumX3dIqdar+0SX7XV6tSuxXbY8HhTjtLmSpQ4ePejB+BGn7rYWpG+QZTyp1Y8ZYlKnk
         9TXZQBRP0QSZiCJXCgyRfj57XXceJHoaTtmKEr5deGofBDWrhBLstLk4+wKdQ9jXSfeE
         Y8BQ==
X-Gm-Message-State: AOAM532ZRq03ivll5fTj4jqEUJ3D8XJISFX0XfomA+fz7L1EHYS0CSmE
        t8CKfODMfgDxy5RzA0JChd/wLjldiaq3
X-Google-Smtp-Source: ABdhPJwNRacrsYd7Y0675KADIjDW72gVMLPdjRK4DVYoxcLBtTUAUa/GRD7WVYLd4/bnCVPkicyUpw==
X-Received: by 2002:a17:902:c383:b029:d6:991c:671b with SMTP id g3-20020a170902c383b02900d6991c671bmr11598626plg.51.1605507271749;
        Sun, 15 Nov 2020 22:14:31 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:9b0a:75fd:1290:bf5c:a350])
        by smtp.gmail.com with ESMTPSA id mt2sm17638172pjb.7.2020.11.15.22.14.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Nov 2020 22:14:31 -0800 (PST)
Date:   Mon, 16 Nov 2020 11:44:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/12] bus: mhi: core: Separate system error and power
 down handling
Message-ID: <20201116061423.GF3926@Mani-XPS-13-9360>
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
 <1604954851-23396-11-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604954851-23396-11-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 09, 2020 at 12:47:29PM -0800, Bhaumik Bhatt wrote:
> Currently, there exist a set of if...else statements in the
> mhi_pm_disable_transition() function which make handling system
> error and disable transitions differently complex. To make that
> cleaner and facilitate differences in behavior, separate these
> two transitions for MHI host.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 159 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 137 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 1d04e401..347ae7d 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -444,7 +444,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  	return ret;
>  }
>  
> -/* Handle SYS_ERR and Shutdown transitions */
> +/* Handle shutdown transitions */
>  static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  				      enum mhi_pm_state transition_state)
>  {
> @@ -460,10 +460,6 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  		to_mhi_pm_state_str(mhi_cntrl->pm_state),
>  		to_mhi_pm_state_str(transition_state));
>  
> -	/* We must notify MHI control driver so it can clean up first */
> -	if (transition_state == MHI_PM_SYS_ERR_PROCESS)
> -		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
> -
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	prev_state = mhi_cntrl->pm_state;
> @@ -502,11 +498,8 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  							    MHICTRL_RESET_SHIFT,
>  							    &in_reset) ||
>  					!in_reset, timeout);
> -		if ((!ret || in_reset) && cur_state == MHI_PM_SYS_ERR_PROCESS) {
> +		if (!ret || in_reset)
>  			dev_err(dev, "Device failed to exit MHI Reset state\n");
> -			mutex_unlock(&mhi_cntrl->pm_mutex);
> -			return;
> -		}
>  
>  		/*
>  		 * Device will clear BHI_INTVEC as a part of RESET processing,
> @@ -566,19 +559,142 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  		er_ctxt->wp = er_ctxt->rbase;
>  	}
>  
> -	if (cur_state == MHI_PM_SYS_ERR_PROCESS) {
> -		mhi_ready_state_transition(mhi_cntrl);
> -	} else {
> -		/* Move to disable state */
> -		write_lock_irq(&mhi_cntrl->pm_lock);
> -		cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
> -		write_unlock_irq(&mhi_cntrl->pm_lock);
> -		if (unlikely(cur_state != MHI_PM_DISABLE))
> -			dev_err(dev, "Error moving from PM state: %s to: %s\n",
> -				to_mhi_pm_state_str(cur_state),
> -				to_mhi_pm_state_str(MHI_PM_DISABLE));
> +	/* Move to disable state */
> +	write_lock_irq(&mhi_cntrl->pm_lock);
> +	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
> +	write_unlock_irq(&mhi_cntrl->pm_lock);
> +	if (unlikely(cur_state != MHI_PM_DISABLE))
> +		dev_err(dev, "Error moving from PM state: %s to: %s\n",
> +			to_mhi_pm_state_str(cur_state),
> +			to_mhi_pm_state_str(MHI_PM_DISABLE));
> +
> +	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
> +		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> +		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
> +
> +	mutex_unlock(&mhi_cntrl->pm_mutex);
> +}
> +
> +/* Handle system error transitions */
> +static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
> +{
> +	enum mhi_pm_state cur_state, prev_state;
> +	struct mhi_event *mhi_event;
> +	struct mhi_cmd_ctxt *cmd_ctxt;
> +	struct mhi_cmd *mhi_cmd;
> +	struct mhi_event_ctxt *er_ctxt;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	int ret, i;
> +
> +	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
> +		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> +		to_mhi_pm_state_str(MHI_PM_SYS_ERR_PROCESS));
> +
> +	/* We must notify MHI control driver so it can clean up first */
> +	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
> +
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +	write_lock_irq(&mhi_cntrl->pm_lock);
> +	prev_state = mhi_cntrl->pm_state;
> +	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
> +	write_unlock_irq(&mhi_cntrl->pm_lock);
> +
> +	if (cur_state != MHI_PM_SYS_ERR_PROCESS) {
> +		dev_err(dev, "Failed to transition from PM state: %s to: %s\n",
> +			to_mhi_pm_state_str(cur_state),
> +			to_mhi_pm_state_str(MHI_PM_SYS_ERR_PROCESS));
> +		goto exit_sys_error_transition;
> +	}
> +
> +	mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
> +	mhi_cntrl->dev_state = MHI_STATE_RESET;
> +
> +	/* Wake up threads waiting for state transition */
> +	wake_up_all(&mhi_cntrl->state_event);
> +
> +	/* Trigger MHI RESET so that the device will not access host memory */
> +	if (MHI_REG_ACCESS_VALID(prev_state)) {
> +		u32 in_reset = -1;
> +		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
> +
> +		dev_dbg(dev, "Triggering MHI Reset in device\n");
> +		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> +
> +		/* Wait for the reset bit to be cleared by the device */
> +		ret = wait_event_timeout(mhi_cntrl->state_event,
> +					 mhi_read_reg_field(mhi_cntrl,
> +							    mhi_cntrl->regs,
> +							    MHICTRL,
> +							    MHICTRL_RESET_MASK,
> +							    MHICTRL_RESET_SHIFT,
> +							    &in_reset) ||
> +					!in_reset, timeout);
> +		if (!ret || in_reset) {
> +			dev_err(dev, "Device failed to exit MHI Reset state\n");
> +			goto exit_sys_error_transition;
> +		}
> +
> +		/*
> +		 * Device will clear BHI_INTVEC as a part of RESET processing,
> +		 * hence re-program it
> +		 */
> +		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> +	}
> +
> +	dev_dbg(dev,
> +		"Waiting for all pending event ring processing to complete\n");
> +	mhi_event = mhi_cntrl->mhi_event;
> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
> +		if (mhi_event->offload_ev)
> +			continue;
> +		tasklet_kill(&mhi_event->task);
>  	}
>  
> +	/* Release lock and wait for all pending threads to complete */
> +	mutex_unlock(&mhi_cntrl->pm_mutex);
> +	dev_dbg(dev, "Waiting for all pending threads to complete\n");
> +	wake_up_all(&mhi_cntrl->state_event);
> +
> +	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> +	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
> +
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +
> +	WARN_ON(atomic_read(&mhi_cntrl->dev_wake));
> +	WARN_ON(atomic_read(&mhi_cntrl->pending_pkts));
> +
> +	/* Reset the ev rings and cmd rings */
> +	dev_dbg(dev, "Resetting EV CTXT and CMD CTXT\n");
> +	mhi_cmd = mhi_cntrl->mhi_cmd;
> +	cmd_ctxt = mhi_cntrl->mhi_ctxt->cmd_ctxt;
> +	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
> +		struct mhi_ring *ring = &mhi_cmd->ring;
> +
> +		ring->rp = ring->base;
> +		ring->wp = ring->base;
> +		cmd_ctxt->rp = cmd_ctxt->rbase;
> +		cmd_ctxt->wp = cmd_ctxt->rbase;
> +	}
> +
> +	mhi_event = mhi_cntrl->mhi_event;
> +	er_ctxt = mhi_cntrl->mhi_ctxt->er_ctxt;
> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
> +	     mhi_event++) {
> +		struct mhi_ring *ring = &mhi_event->ring;
> +
> +		/* Skip offload events */
> +		if (mhi_event->offload_ev)
> +			continue;
> +
> +		ring->rp = ring->base;
> +		ring->wp = ring->base;
> +		er_ctxt->rp = er_ctxt->rbase;
> +		er_ctxt->wp = er_ctxt->rbase;
> +	}
> +
> +	mhi_ready_state_transition(mhi_cntrl);
> +
> +exit_sys_error_transition:
>  	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
>  		to_mhi_pm_state_str(mhi_cntrl->pm_state),
>  		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
> @@ -666,8 +782,7 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_ready_state_transition(mhi_cntrl);
>  			break;
>  		case DEV_ST_TRANSITION_SYS_ERR:
> -			mhi_pm_disable_transition
> -				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
> +			mhi_pm_sys_error_transition(mhi_cntrl);
>  			break;
>  		case DEV_ST_TRANSITION_DISABLE:
>  			mhi_pm_disable_transition
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
