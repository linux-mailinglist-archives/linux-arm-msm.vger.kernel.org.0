Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383F43563DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 08:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhDGG0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 02:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhDGG0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 02:26:42 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57732C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 23:26:33 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id a6so5483631pls.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 23:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nv+030+K+5MMv235heiMJ5vuiaCK99dbHL27acpLMHc=;
        b=qFZMjlysbpozfuJdNAjyNixJqKWCdlp/3WDF/JGEk9CTodY9y6maOmpsY+kdOl06ev
         J88ZQ8TNbQ8lwWfDTq34BDt8XjrCNeywg+r899IP9pYeWUodIH4uLu5czqk6JyRdws5O
         ieDwOjisAAJ76T/gla0pyFO0t3YouCqyQYuxLnCJCu2AnNKQKA5rp0T9i0T8bd4h+rHz
         m022UWyQ5l5Ug76xealLqxUKSFOBe3m7Tr/X3+bsYCsMm5xwlKxxyh8ySi2wiHxkVP/v
         +LQwKiGNlMUPxLKdFFicVERxvXBGr96wZao9iIa6QyKZqawhOmQ6nExwdC884qvO6KQ0
         n3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nv+030+K+5MMv235heiMJ5vuiaCK99dbHL27acpLMHc=;
        b=jQoQtRp32mJg6RUyqOdKpAfI/oR/xwN9Z0TmF+/YSK6gpebE5+XN3ujrur941K35t2
         JF2O+yuieqRJlm+LEX6ORNcxurLFbAbRJ7yKnA+YYPq+l8ROmJBjmHW7UM18EfgdDV2E
         PycAF/P/ZeZO70BoDHb8b94Q5tlIX112N5/Rbl9HKFTfl5k4bzDS4FRBlD6LFnv/OCTH
         QKUK0lf3TFqJ8+6qH01x0LzGrlBfXmE3CLha4kHv09WOY7aDLLcJdxLwcRz4VdXdj8HL
         IkAL4wR8kbC8jSxSRxwwYBbwFZciyR45l5TLwawHXC/FZs7J1+Lw5E+OYN1enCfY98AT
         4gEw==
X-Gm-Message-State: AOAM531vVkgTnUfBnxhaOEBRixKj2dyaFzV1lllsJzvMM5jOy+axL6r6
        O5n/4AT2bx76o78BJ+mf5pmsK/AdgZlR
X-Google-Smtp-Source: ABdhPJw6yOW1YjqXTz+FAgI1V1Y8knt7AldjaYkyJ+J41U4Eks+B+EZCYxoOvVGOssDCVQlC7WeNrw==
X-Received: by 2002:a17:90b:3114:: with SMTP id gc20mr1865620pjb.123.1617776792533;
        Tue, 06 Apr 2021 23:26:32 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id r11sm4046536pjp.46.2021.04.06.23.26.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 23:26:31 -0700 (PDT)
Date:   Wed, 7 Apr 2021 11:56:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v8 3/9] bus: mhi: core: Improvements to the channel
 handling state machine
Message-ID: <20210407062628.GE8675@work>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
 <1617311778-1254-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617311778-1254-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 01, 2021 at 02:16:12PM -0700, Bhaumik Bhatt wrote:
> Improve the channel handling state machine such that all commands
> go through a common function and a validation process to ensure
> that the state machine is not violated in any way and adheres to
> the MHI specification. Using this common function allows MHI to
> eliminate some unnecessary debug messages and code duplication.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c     |   6 ++
>  drivers/bus/mhi/core/internal.h |  12 ++++
>  drivers/bus/mhi/core/main.c     | 151 ++++++++++++++++++++++------------------
>  3 files changed, 100 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index f8ba954..9c2ed92 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -56,6 +56,12 @@ const char * const mhi_state_str[MHI_STATE_MAX] = {
>  	[MHI_STATE_SYS_ERR] = "SYS ERROR",
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
>  	[MHI_PM_STATE_POR] = "POWER ON RESET",
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index e690f15..5b9ea66 100644
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
> index 8c510f1..710ca0f 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1234,56 +1234,105 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
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
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	enum mhi_cmd_type cmd = MHI_CMD_NOP;
> +	int ret;
>  
> -	dev_dbg(dev, "Entered: unprepare channel:%d\n", mhi_chan->chan);
> -
> -	/* no more processing events for this channel */
> -	mutex_lock(&mhi_chan->mutex);
> -	write_lock_irq(&mhi_chan->lock);
> -	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
> -	    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
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
>  		write_unlock_irq(&mhi_chan->lock);
> -		mutex_unlock(&mhi_chan->mutex);
> -		return;
> -	}
>  
> -	mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> -	write_unlock_irq(&mhi_chan->lock);
> +		cmd = MHI_CMD_RESET_CHAN;
> +		break;
> +	case MHI_CH_STATE_TYPE_STOP:
> +		if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
> +			return -EINVAL;
>  
> -	reinit_completion(&mhi_chan->completion);
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> -		goto error_invalid_state;
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
>  	mhi_cntrl->wake_toggle(mhi_cntrl);
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> -
>  	mhi_cntrl->runtime_get(mhi_cntrl);
>  	mhi_cntrl->runtime_put(mhi_cntrl);
> -	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, MHI_CMD_RESET_CHAN);
> -	if (ret)
> -		goto error_invalid_state;
>  
> -	/* even if it fails we will still reset */
> +	reinit_completion(&mhi_chan->completion);
> +	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
> +	if (ret) {
> +		dev_err(dev, "%d: Failed to send %s channel command\n",
> +			mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> +		return ret;
> +	}
> +
>  	ret = wait_for_completion_timeout(&mhi_chan->completion,
> -				msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS)
> +				       msecs_to_jiffies(mhi_cntrl->timeout_ms));
> +	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS) {
>  		dev_err(dev,
> -			"Failed to receive cmd completion, still resetting\n");
> +			"%d: Failed to receive %s channel command completion\n",
> +			mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> +		return -EIO;
> +	}
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
> +	return 0;
> +}
> +
> +static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
> +				    struct mhi_chan *mhi_chan)
> +{
> +	int ret;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
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
> @@ -1293,8 +1342,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  	int ret = 0;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
> -	dev_dbg(dev, "Preparing channel: %d\n", mhi_chan->chan);
> -
>  	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
>  		dev_err(dev,
>  			"Current EE: %s Required EE Mask: 0x%x for chan: %s\n",
> @@ -1305,14 +1352,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
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
> @@ -1320,34 +1359,11 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
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
> @@ -1385,9 +1401,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
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
