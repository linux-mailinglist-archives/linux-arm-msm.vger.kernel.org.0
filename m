Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8AB2A0768
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 15:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgJ3OHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 10:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgJ3OHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 10:07:05 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86C8C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:07:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so5396383pfd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yBqO9G7V3vPOOfA9ymAqZAROQYhKNVf/l8jgGHJborE=;
        b=PIR+UuD6KFQls7giuUI8Afy1DlrBj8v+prQYL1xkSz7JESNlAXMcVt+N99CwbU5MWc
         Z4CKmI6xVCNS+yl8qPIRNaJgTVJk5bufLlZXz6x6JLjor63fxzfiDFJG/M996j2P/2kF
         sgRdo0oEO1eJ+tzgod46GXKRzrhVs6Q8JFA6l9NDr/nFaG+RfvzHKLgGrYhTsGzwGXY5
         EZRW2Tlh1nI07YPDZV2BC7WRy6bhdLJj+JFhbkhhYLb9w8cslLa5XlMjkGCbsU+FQiKt
         PJeF/CGz3IrixC4f09gZP1sJHfL8kMpGQqdFPbvGVgvW5aLv9HhVIFBAIRn6v0PypCZE
         G/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yBqO9G7V3vPOOfA9ymAqZAROQYhKNVf/l8jgGHJborE=;
        b=t5BzBdlnWHvAST45v1zlYZ66CwibMiQAJfiJqTbJmJ/mNNMQRQdDen7ewjWHoc1MF1
         v/e8X8lobjiQ8TdPFyfkkTxG8nzkrYBmqxWTRNbdDV3o80CLNqpiGL4w87nRbRhl+1yx
         K/ywGqxWc1Ncibmrq4314qENeH9pBAZ3br3UkGXXo6ZGIr9uuLtDMgpZyiq0n54WzvyO
         t/+PU1EEdXgFlnTMw7CfXiWoS3C9tyC+hs4o3Hygg2iDQcyeUYwHMzMB6SPxfDA0Q79q
         CAoWgFiI/gkKoEBv/TBqJvKJHLdUx/11/JsZFJr2EpewJVanP4bPU7F5N85hl2qZg1Lb
         r0IA==
X-Gm-Message-State: AOAM532l3nq7xjfPu0TJe306DUQQPFzImg2jBhXKoC6krommu2nuNjTb
        zJLX4UIRc5oaLEMrCfhxXANHUVMV/e+u
X-Google-Smtp-Source: ABdhPJwhsO+ddq5CfClGURljpys5Ze5jAphielpoLf1Jt8SqWwKNtv92a8+57x+kNa2bjaikiPbPyw==
X-Received: by 2002:a62:3383:0:b029:160:bcd:370c with SMTP id z125-20020a6233830000b02901600bcd370cmr9630695pfz.56.1604066825064;
        Fri, 30 Oct 2020 07:07:05 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id j6sm5827888pgt.77.2020.10.30.07.07.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:07:04 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:36:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/12] bus: mhi: core: Separate system error and power
 down handling
Message-ID: <20201030140656.GL3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-11-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604031057-32820-11-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:10:55PM -0700, Bhaumik Bhatt wrote:
> Currently, there exist a set of if...else statements in the
> mhi_pm_disable_transition() function which make handling system
> error and disable transitions differently complex. To make that
> cleaner and facilitate differences in behavior, separate these
> two transitions for MHI host.
> 

And this results in a lot of duplicated code :/

Thanks,
Mani

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
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
