Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635B6323A21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 11:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbhBXKEs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 05:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234634AbhBXKER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 05:04:17 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12CCC06178A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:03:33 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id c19so976171pjq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FKSNprw/L09tSANIOkghSJOw63VZoNfomthws840MQg=;
        b=ivyCZ0fX7sZa9GM6tF9eEPbOIDEPQqIUNiih1xOFYNh+3g4OvB0F2rc7u1Cxv2FGQo
         cbdeluE8/54qOEeUWnojgEFdlAFCz6Sg7qC8KgYQtLzTt9yKFQu+oWD+rJ3T8B8MuZAK
         5wNvVI1roc+SnKqTcvRrLSmfB8PF+RpJOFSCR7QAiXtILGzeezXpLzhsiupO8YMoTYX8
         AQ3Ko3xC9op1zvzwtk3yZc/erspp+8V8uHWuWekjeiuPXIeDWOzI9jzNlHeYVr367xMC
         S9JQnR0aAL+ioYVjQCQcYT8F13EOgigs+ZNbChQen1No12bvDu8Pz2YQSrXf3ZkpGnp6
         n8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FKSNprw/L09tSANIOkghSJOw63VZoNfomthws840MQg=;
        b=NVqBCh6mc1+N2O0qpwGQwvoB86MFpA9NtzLWtiwjobzYbCAJ3wA4Ze5zpDaN39Zaic
         j3xOibpmTykdsPrPNf1OqE0GLs+yxD+WiW5ctxT/vE2F/N2UnLEGhoxgO0IupS005IRB
         wtnzGpIZCnc1NlvmtUaIQcuwbDnOCCRmkkuOTZoi1d+srn/TVV2SneqUyQuQpnq4VdZN
         UQK8ru2htEU4Fk+WLI2lHllNKduEAUBJiHObd3mE38wasFQxAbjrX5yQ3gQjqmPOegyh
         lmTRTwosju66ssC5i2x6cf79RhOGRqthH3kmCAx9+obo5cIJD99f6FIdG29KqWKA6Mjx
         8Urg==
X-Gm-Message-State: AOAM533KXt7gq9Qn0oHo4HDy//SFuF51oyNkqYEkeOjcH+lMiab4orsV
        FHMhcWumaHvqttr3ZWtu1IHx
X-Google-Smtp-Source: ABdhPJzCyY4KkdOfd1og91GcYZs9YCTS1jQMEhOhBnJQFynV2SFTHsDqIjc2a37Xj89MiuOR5ntJCw==
X-Received: by 2002:a17:90a:de5:: with SMTP id 92mr3597234pjv.191.1614161013194;
        Wed, 24 Feb 2021 02:03:33 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id h18sm2137786pfo.112.2021.02.24.02.03.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 02:03:32 -0800 (PST)
Date:   Wed, 24 Feb 2021 15:33:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v6 3/8] bus: mhi: core: Improvements to the channel
 handling state machine
Message-ID: <20210224100329.GS27945@work>
References: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
 <1612470486-10440-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612470486-10440-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 04, 2021 at 12:28:01PM -0800, Bhaumik Bhatt wrote:
> Improve the channel handling state machine such that all commands
> go through a common function and validation process to ensure
> that the state machine is not violated in any way and adheres to
> the MHI specification. Assert device wake before sending the
> channel update commands instead of a wake toggle to ensure we
> fail if device is in a bad state. Also update print messages to
> use client device to accurately represent the channel being
> updated.
> 

This patch is doing atleast 3 things and that is not acceptable. Please
split this patch and send.

Thanks,
Mani

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c     |   6 ++
>  drivers/bus/mhi/core/internal.h |  12 +++
>  drivers/bus/mhi/core/main.c     | 172 ++++++++++++++++++++++------------------
>  3 files changed, 114 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 03c5786..482b365 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -54,6 +54,12 @@ const char * const mhi_state_str[MHI_STATE_MAX] = {
>  	[MHI_STATE_SYS_ERR] = "SYS_ERR",
>  };
>  
> +const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
> +	[MHI_CH_STATE_TYPE_RESET] = "RESET",
> +	[MHI_CH_STATE_TYPE_STOP] = "STOP",
> +	[MHI_CH_STATE_TYPE_START] = "START",
> +};
> +
>  static const char * const mhi_pm_state_str[] = {
>  	[MHI_PM_STATE_DISABLE] = "DISABLE",
>  	[MHI_PM_STATE_POR] = "POR",
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 6f80ec3..7e3aac1 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -369,6 +369,18 @@ enum mhi_ch_state {
>  	MHI_CH_STATE_ERROR = 0x5,
>  };
>  
> +enum mhi_ch_state_type {
> +	MHI_CH_STATE_TYPE_RESET,
> +	MHI_CH_STATE_TYPE_STOP,
> +	MHI_CH_STATE_TYPE_START,
> +	MHI_CH_STATE_TYPE_MAX,
> +};
> +
> +extern const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX];
> +#define TO_CH_STATE_TYPE_STR(state) (((state) >= MHI_CH_STATE_TYPE_MAX) ? \
> +				     "INVALID_STATE" : \
> +				     mhi_ch_state_type_str[(state)])
> +
>  #define MHI_INVALID_BRSTMODE(mode) (mode != MHI_DB_BRST_DISABLE && \
>  				    mode != MHI_DB_BRST_ENABLE)
>  
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index d068188..2f6fdb2 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1188,56 +1188,114 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
>  	return 0;
>  }
>  
> -static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
> -				    struct mhi_chan *mhi_chan)
> +static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
> +				    struct mhi_chan *mhi_chan,
> +				    enum mhi_ch_state_type to_state)
>  {
> -	int ret;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct device *dev = &mhi_chan->mhi_dev->dev;
> +	enum mhi_cmd_type cmd = MHI_CMD_NOP;
> +	int ret = -EIO;
> +
> +	dev_dbg(dev, "%d: Updating channel state to: %s\n", mhi_chan->chan,
> +		TO_CH_STATE_TYPE_STR(to_state));
> +
> +	switch (to_state) {
> +	case MHI_CH_STATE_TYPE_RESET:
> +		write_lock_irq(&mhi_chan->lock);
> +		if (mhi_chan->ch_state != MHI_CH_STATE_STOP &&
> +		    mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
> +		    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
> +			write_unlock_irq(&mhi_chan->lock);
> +			return -EINVAL;
> +		}
> +		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> +		write_unlock_irq(&mhi_chan->lock);
>  
> -	dev_dbg(dev, "Entered: unprepare channel:%d\n", mhi_chan->chan);
> +		cmd = MHI_CMD_RESET_CHAN;
> +		break;
> +	case MHI_CH_STATE_TYPE_STOP:
> +		if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
> +			return -EINVAL;
>  
> -	/* no more processing events for this channel */
> -	mutex_lock(&mhi_chan->mutex);
> -	write_lock_irq(&mhi_chan->lock);
> -	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
> -	    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
> -		write_unlock_irq(&mhi_chan->lock);
> -		mutex_unlock(&mhi_chan->mutex);
> -		return;
> +		cmd = MHI_CMD_STOP_CHAN;
> +		break;
> +	case MHI_CH_STATE_TYPE_START:
> +		if (mhi_chan->ch_state != MHI_CH_STATE_STOP &&
> +		    mhi_chan->ch_state != MHI_CH_STATE_DISABLED)
> +			return -EINVAL;
> +
> +		cmd = MHI_CMD_START_CHAN;
> +		break;
> +	default:
> +		dev_err(dev, "%d: Channel state update to %s not allowed\n",
> +			mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> +		return -EINVAL;
>  	}
>  
> -	mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> -	write_unlock_irq(&mhi_chan->lock);
> +	/* bring host and device out of suspended states */
> +	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
> +	if (ret)
> +		return ret;
> +	mhi_cntrl->runtime_get(mhi_cntrl);
>  
>  	reinit_completion(&mhi_chan->completion);
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> -		goto error_invalid_state;
> +	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
> +	if (ret) {
> +		dev_err(dev, "%d: Failed to send %s channel command\n",
> +			mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> +		goto exit_channel_update;
>  	}
>  
> -	mhi_cntrl->wake_toggle(mhi_cntrl);
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> +	ret = wait_for_completion_timeout(&mhi_chan->completion,
> +				       msecs_to_jiffies(mhi_cntrl->timeout_ms));
> +	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS) {
> +		dev_err(dev,
> +			"%d: Failed to receive %s channel command completion\n",
> +			mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> +		ret = -EIO;
> +		goto exit_channel_update;
> +	}
>  
> -	mhi_cntrl->runtime_get(mhi_cntrl);
> +	ret = 0;
> +
> +	if (to_state != MHI_CH_STATE_TYPE_RESET) {
> +		write_lock_irq(&mhi_chan->lock);
> +		mhi_chan->ch_state = (to_state == MHI_CH_STATE_TYPE_START) ?
> +				      MHI_CH_STATE_ENABLED : MHI_CH_STATE_STOP;
> +		write_unlock_irq(&mhi_chan->lock);
> +	}
> +
> +	dev_dbg(dev, "%d: Channel state change to %s successful\n",
> +		mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> +
> +exit_channel_update:
>  	mhi_cntrl->runtime_put(mhi_cntrl);
> -	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, MHI_CMD_RESET_CHAN);
> -	if (ret)
> -		goto error_invalid_state;
> +	mhi_device_put(mhi_cntrl->mhi_dev);
>  
> -	/* even if it fails we will still reset */
> -	ret = wait_for_completion_timeout(&mhi_chan->completion,
> -				msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS)
> -		dev_err(dev,
> -			"Failed to receive cmd completion, still resetting\n");
> +	return ret;
> +}
> +
> +static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
> +				    struct mhi_chan *mhi_chan)
> +{
> +	int ret;
> +	struct device *dev = &mhi_chan->mhi_dev->dev;
> +
> +	mutex_lock(&mhi_chan->mutex);
> +
> +	/* no more processing events for this channel */
> +	ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
> +				       MHI_CH_STATE_TYPE_RESET);
> +	if (ret)
> +		dev_err(dev, "%d: Failed to reset channel, still resetting\n",
> +			mhi_chan->chan);
>  
> -error_invalid_state:
>  	if (!mhi_chan->offload_ch) {
>  		mhi_reset_chan(mhi_cntrl, mhi_chan);
>  		mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
>  	}
> -	dev_dbg(dev, "chan:%d successfully resetted\n", mhi_chan->chan);
> +	dev_dbg(dev, "%d: successfully reset\n", mhi_chan->chan);
> +
>  	mutex_unlock(&mhi_chan->mutex);
>  }
>  
> @@ -1245,28 +1303,16 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  			struct mhi_chan *mhi_chan)
>  {
>  	int ret = 0;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -
> -	dev_dbg(dev, "Preparing channel: %d\n", mhi_chan->chan);
> +	struct device *dev = &mhi_chan->mhi_dev->dev;
>  
>  	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
> -		dev_err(dev,
> -			"Current EE: %s Required EE Mask: 0x%x for chan: %s\n",
> -			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask,
> -			mhi_chan->name);
> +		dev_err(dev, "Current EE: %s Required EE Mask: 0x%x\n",
> +			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask);
>  		return -ENOTCONN;
>  	}
>  
>  	mutex_lock(&mhi_chan->mutex);
>  
> -	/* If channel is not in disable state, do not allow it to start */
> -	if (mhi_chan->ch_state != MHI_CH_STATE_DISABLED) {
> -		ret = -EIO;
> -		dev_dbg(dev, "channel: %d is not in disabled state\n",
> -			mhi_chan->chan);
> -		goto error_init_chan;
> -	}
> -
>  	/* Check of client manages channel context for offload channels */
>  	if (!mhi_chan->offload_ch) {
>  		ret = mhi_init_chan_ctxt(mhi_cntrl, mhi_chan);
> @@ -1274,34 +1320,11 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  			goto error_init_chan;
>  	}
>  
> -	reinit_completion(&mhi_chan->completion);
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> -		ret = -EIO;
> -		goto error_pm_state;
> -	}
> -
> -	mhi_cntrl->wake_toggle(mhi_cntrl);
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> -	mhi_cntrl->runtime_get(mhi_cntrl);
> -	mhi_cntrl->runtime_put(mhi_cntrl);
> -
> -	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, MHI_CMD_START_CHAN);
> +	ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
> +				       MHI_CH_STATE_TYPE_START);
>  	if (ret)
>  		goto error_pm_state;
>  
> -	ret = wait_for_completion_timeout(&mhi_chan->completion,
> -				msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS) {
> -		ret = -EIO;
> -		goto error_pm_state;
> -	}
> -
> -	write_lock_irq(&mhi_chan->lock);
> -	mhi_chan->ch_state = MHI_CH_STATE_ENABLED;
> -	write_unlock_irq(&mhi_chan->lock);
> -
>  	/* Pre-allocate buffer for xfer ring */
>  	if (mhi_chan->pre_alloc) {
>  		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
> @@ -1339,9 +1362,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  
>  	mutex_unlock(&mhi_chan->mutex);
>  
> -	dev_dbg(dev, "Chan: %d successfully moved to start state\n",
> -		mhi_chan->chan);
> -
>  	return 0;
>  
>  error_pm_state:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
