Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401DF2A0780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 15:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgJ3OKn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 10:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgJ3OKn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 10:10:43 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CE4C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:10:43 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so5407285pfd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8WKgP2U9O5DxyTOBMmTBKiiE8+mUg5br1oROOIP2BpQ=;
        b=QizDrzDHl2Y4166Y2fvVRLmGSFbU2yoTJDN4a3XTsr9eEO1RIESIQmqC+B0nbVB0DC
         HHfCUbFbLDx3/ioLa1+Yy9aKqdZNF0P6X48WvFY8sPSrafPs1OKhixCWIH1WA5+uZ7Us
         BX5qQN0ggRNtt6PPwm20ZXrmaL295+RkPI97CDzx9wYuPf4Qx73K4ioK0vEP8sDqehQs
         ggYBamgihdlwsWxXMVw5+ZHPdXgXpDy5jcUGeOQuHhTa9xTQEFPq40zrSTuLIx1h1Xaa
         vY3ne5Fpj8z7vaHd1Scw/M9a+JGefF4DM/2S+BcfGpFmzGSu1EDIXI8zsJzVp2typqF1
         FbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8WKgP2U9O5DxyTOBMmTBKiiE8+mUg5br1oROOIP2BpQ=;
        b=QyGmkgJD8cAMHw35of+9GoadvVPuTI7XMOK/AuL6aWEfsuSONszwYKucs+aKbgBqzS
         kzlgKEPMpqS8plXe5YM8ILo1K3vkhQqBLAG7EakW3eCQlvggAQIeDUW6NeFWmDr0DOrE
         qFhrMLZbJspMTQU3s0f2RRc7YC1z/bM5i3You/uTE5gsfCKgos9w1oO8Xv2G3/VEJV2e
         9CaTWC2AuXiRTYSvEcHZ3li09JjZb4HQCCP+AjMerQ7/gCB2cWWOk+RikiZTatJfltOC
         Ijh/5nhFwiGrNiQXLzMCsMUg67nYIngAp3cQumBRhehfzPYmOK1N91p44KN/91Meiybd
         BTyg==
X-Gm-Message-State: AOAM531TrnfUumKoe2aQ5UVo1+DrepOB3m3wXFof11TbHJccLv+FrjLB
        sWjDrBQ8mOLpk315qTW1BpQZ
X-Google-Smtp-Source: ABdhPJxSdgcrkg0jMaghQQDsDclIa7eH2WAO2njTKaKFYcEt8mM0bPzgSJ0zPzruDnz1VEmaFv79uA==
X-Received: by 2002:a63:3041:: with SMTP id w62mr2377061pgw.166.1604067042669;
        Fri, 30 Oct 2020 07:10:42 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id j1sm6242042pfa.96.2020.10.30.07.10.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:10:41 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:40:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/12] bus: mhi: core: Mark and maintain device states
 early on after power down
Message-ID: <20201030141035.GM3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-12-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604031057-32820-12-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:10:56PM -0700, Bhaumik Bhatt wrote:
> mhi_power_down() does not ensure that the PM state is moved to an
> inaccessible state soon enough as the system can encounter
> scheduling delays till mhi_pm_disable_transition() gets called.
> Additionally, if an MHI controller decides that the device is now
> inaccessible and issues a power down, the register inaccessible
> state is not maintained by moving from MHI_PM_LD_ERR_FATAL_DETECT
> to MHI_PM_SHUTDOWN_PROCESS. This can result in bus errors if a
> client driver attempted to read registers when powering down.
> Close these gaps and avoid any race conditions to prevent such
> activity.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 77 ++++++++++++++++++++---------------------------
>  1 file changed, 33 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 347ae7d..ffbf6f5 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -37,9 +37,10 @@
>   *     M0 -> FW_DL_ERR
>   *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
>   * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
> - * L2: SHUTDOWN_PROCESS -> DISABLE
> + * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
> + *     SHUTDOWN_PROCESS -> DISABLE
>   * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
> - *     LD_ERR_FATAL_DETECT -> SHUTDOWN_PROCESS
> + *     LD_ERR_FATAL_DETECT -> DISABLE
>   */
>  static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	/* L0 States */
> @@ -72,7 +73,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	{
>  		MHI_PM_M3,
>  		MHI_PM_M3_EXIT | MHI_PM_SYS_ERR_DETECT |
> -		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_LD_ERR_FATAL_DETECT
> +		MHI_PM_LD_ERR_FATAL_DETECT
>  	},
>  	{
>  		MHI_PM_M3_EXIT,
> @@ -103,7 +104,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	/* L3 States */
>  	{
>  		MHI_PM_LD_ERR_FATAL_DETECT,
> -		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_SHUTDOWN_PROCESS
> +		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
>  	},
>  };
>  
> @@ -445,10 +446,9 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  }
>  
>  /* Handle shutdown transitions */
> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
> -				      enum mhi_pm_state transition_state)
> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  {
> -	enum mhi_pm_state cur_state, prev_state;
> +	enum mhi_pm_state cur_state;
>  	struct mhi_event *mhi_event;
>  	struct mhi_cmd_ctxt *cmd_ctxt;
>  	struct mhi_cmd *mhi_cmd;
> @@ -456,33 +456,13 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	int ret, i;
>  
> -	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
> -		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> -		to_mhi_pm_state_str(transition_state));
> +	dev_dbg(dev, "Processing disable transition with PM state: %s\n",
> +		to_mhi_pm_state_str(mhi_cntrl->pm_state));
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
> -	write_lock_irq(&mhi_cntrl->pm_lock);
> -	prev_state = mhi_cntrl->pm_state;
> -	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
> -	if (cur_state == transition_state) {
> -		mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
> -		mhi_cntrl->dev_state = MHI_STATE_RESET;
> -	}
> -	write_unlock_irq(&mhi_cntrl->pm_lock);
> -
> -	/* Wake up threads waiting for state transition */
> -	wake_up_all(&mhi_cntrl->state_event);
> -
> -	if (cur_state != transition_state) {
> -		dev_err(dev, "Failed to transition to state: %s from: %s\n",
> -			to_mhi_pm_state_str(transition_state),
> -			to_mhi_pm_state_str(cur_state));
> -		mutex_unlock(&mhi_cntrl->pm_mutex);
> -		return;
> -	}
>  
>  	/* Trigger MHI RESET so that the device will not access host memory */
> -	if (MHI_REG_ACCESS_VALID(prev_state)) {
> +	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
>  		u32 in_reset = -1;
>  		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
>  
> @@ -785,8 +765,7 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_pm_sys_error_transition(mhi_cntrl);
>  			break;
>  		case DEV_ST_TRANSITION_DISABLE:
> -			mhi_pm_disable_transition
> -				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
> +			mhi_pm_disable_transition(mhi_cntrl);
>  			break;
>  		default:
>  			break;
> @@ -1153,23 +1132,33 @@ EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  
>  void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  {
> -	enum mhi_pm_state cur_state;
> +	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
> -	if (!graceful) {
> -		mutex_lock(&mhi_cntrl->pm_mutex);
> -		write_lock_irq(&mhi_cntrl->pm_lock);
> -		cur_state = mhi_tryset_pm_state(mhi_cntrl,
> -						MHI_PM_LD_ERR_FATAL_DETECT);
> -		write_unlock_irq(&mhi_cntrl->pm_lock);
> -		mutex_unlock(&mhi_cntrl->pm_mutex);
> -		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT)
> -			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
> -				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
> -				to_mhi_pm_state_str(mhi_cntrl->pm_state));
> +	transition_state = (graceful) ? MHI_PM_SHUTDOWN_PROCESS :
> +			   MHI_PM_LD_ERR_FATAL_DETECT;
> +
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +	write_lock_irq(&mhi_cntrl->pm_lock);
> +	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
> +	if (cur_state != transition_state) {
> +		dev_err(dev, "Failed to move to state: %s from: %s\n",
> +			to_mhi_pm_state_str(transition_state),
> +			to_mhi_pm_state_str(mhi_cntrl->pm_state));
> +		/* Force link down or error fatal detected state */
> +		mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
>  	}
>  
> +	/* mark device inactive to avoid any further host processing */
> +	mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
> +	mhi_cntrl->dev_state = MHI_STATE_RESET;
> +
> +	wake_up_all(&mhi_cntrl->state_event);
> +
> +	write_unlock_irq(&mhi_cntrl->pm_lock);
> +	mutex_unlock(&mhi_cntrl->pm_mutex);
> +
>  	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
>  
>  	/* Wait for shutdown to complete */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
