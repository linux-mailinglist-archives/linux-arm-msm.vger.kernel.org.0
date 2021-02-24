Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528AC3239DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 10:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhBXJtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 04:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbhBXJse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 04:48:34 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60592C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 01:47:54 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id l18so968854pji.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 01:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=52U0A/YQtMMBBruTY7qKqrO0xm8B4H/sB3uMn+s2a/8=;
        b=szRk6h4rpy0I5TDsSmoFOrdENPrR2FaEsZXVaBWOOVr21axunWC1+YYodzxsAPjC0k
         q+adjXQHrnHYtEJ5E24bcb4eCnciCxjIUBqKo6D2Iub+10mlu5Nw2Ql0Rnr70X8a1bVr
         jJ5wqLINj5g+Zakk/CEJxlwF1IXKPRlWGNv5EJtSIk/ymU+SgRERWnkG5xyPTxbfNbkD
         UciF3QLapV/rjLB/jhT7BZp9y1zM+q1Wsq0lcTDzp3EeCPtZm8Ce9xYbzb7HFm37tS6+
         W7cc/T4jNAVDqw2uQzB/0xzICrTjz17O1iY3JAnmMVwsipUBXPR7hTWDFv2qzZ6E5m9x
         F28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=52U0A/YQtMMBBruTY7qKqrO0xm8B4H/sB3uMn+s2a/8=;
        b=skuxO5cmEfft1QnGPoQ1WX94fqr9msy85NCO4fiWatf7gWWfPk99BUh/8yyQVQ2evw
         KHwXWIMgyGySYoNAI9o3zlDzYjA37gE5EG9/arB6yJlZo78WI/Xn7DzF/Hi5WpVCInAV
         gIA5cM/pxgbZKqrKpqpFfyL+4v9X5YWS3+u8UTMGn+SjFvhtRVUL8Lwr3kcpKqcldGos
         UAk7Dy9F+1ljjTgCEzz3/lIihdMlrIx+a1PKlh/VRvu5xWqD27B0CPBpDshbmNCk5u9Q
         mHyh/9JzTEgj5aRKs/Uo+kfmXQsVopFmTnyXgqgx1Ivg7gD6EnyQhpMfqTzUU7kJywpF
         ruUA==
X-Gm-Message-State: AOAM532J93gobqpOnNTzz4VjEz4wY6dZzm/CeWM1KZ3hl9qlYSp5dTgG
        XGgk1eiuEV/XchUWUlUJGXOW
X-Google-Smtp-Source: ABdhPJzclO++kHZWBszVKlN3FJRslMb3/JmnploYDKl4ije2p0oty/j8gpomn00UnvB6iJKpgs5N9g==
X-Received: by 2002:a17:90a:4007:: with SMTP id u7mr3603350pjc.233.1614160073778;
        Wed, 24 Feb 2021 01:47:53 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id jx20sm2090380pjb.30.2021.02.24.01.47.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 01:47:53 -0800 (PST)
Date:   Wed, 24 Feb 2021 15:17:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: core: Sanity check values from remote
 device before use
Message-ID: <20210224094749.GP27945@work>
References: <1613578822-18614-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613578822-18614-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 17, 2021 at 09:20:22AM -0700, Jeffrey Hugo wrote:
> When parsing the structures in the shared memory, there are values which
> come from the remote device.  For example, a transfer completion event
> will have a pointer to the tre in the relevant channel's transfer ring.
> Such values should be considered to be untrusted, and validated before
> use.  If we blindly use such values, we may access invalid data or crash
> if the values are corrupted.
> 
> If validation fails, drop the relevant event.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
> 
> v2: Fix subject
> 
>  drivers/bus/mhi/core/main.c | 81 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 74 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index c043574..1eb2fd3 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -242,6 +242,11 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
>  	smp_wmb();
>  }
>  
> +static bool is_valid_ring_ptr(struct mhi_ring *ring, dma_addr_t addr)
> +{
> +	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len;
> +}
> +
>  int mhi_destroy_device(struct device *dev, void *data)
>  {
>  	struct mhi_device *mhi_dev;
> @@ -383,7 +388,16 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>  	struct mhi_event_ctxt *er_ctxt =
>  		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
>  	struct mhi_ring *ev_ring = &mhi_event->ring;
> -	void *dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> +	dma_addr_t ptr = er_ctxt->rp;
> +	void *dev_rp;
> +
> +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev,
> +			"Event ring rp points outside of the event ring\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	dev_rp = mhi_to_virtual(ev_ring, ptr);
>  
>  	/* Only proceed if event ring has pending events */
>  	if (ev_ring->rp == dev_rp)
> @@ -536,6 +550,11 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  		struct mhi_buf_info *buf_info;
>  		u16 xfer_len;
>  
> +		if (!is_valid_ring_ptr(tre_ring, ptr)) {
> +			dev_err(&mhi_cntrl->mhi_dev->dev,
> +				"Event element points outside of the tre ring\n");
> +			break;
> +		}
>  		/* Get the TRB this event points to */
>  		ev_tre = mhi_to_virtual(tre_ring, ptr);
>  
> @@ -695,6 +714,12 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>  	struct mhi_chan *mhi_chan;
>  	u32 chan;
>  
> +	if (!is_valid_ring_ptr(mhi_ring, ptr)) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev,
> +			"Event element points outside of the cmd ring\n");
> +		return;
> +	}
> +
>  	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
>  
>  	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
> @@ -719,6 +744,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	u32 chan;
>  	int count = 0;
> +	dma_addr_t ptr = er_ctxt->rp;
>  
>  	/*
>  	 * This is a quick check to avoid unnecessary event processing
> @@ -728,7 +754,13 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
>  		return -EIO;
>  
> -	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev,
> +			"Event ring rp points outside of the event ring\n");
> +		return -EIO;
> +	}
> +
> +	dev_rp = mhi_to_virtual(ev_ring, ptr);
>  	local_rp = ev_ring->rp;
>  
>  	while (dev_rp != local_rp) {
> @@ -834,6 +866,8 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  			 */
>  			if (chan < mhi_cntrl->max_chan) {
>  				mhi_chan = &mhi_cntrl->mhi_chan[chan];
> +				if (!mhi_chan->configured)
> +					break;

This change is not part of this patch I believe.

>  				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
>  				event_quota--;
>  			}
> @@ -845,7 +879,15 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  
>  		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
>  		local_rp = ev_ring->rp;
> -		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> +
> +		ptr = er_ctxt->rp;
> +		if (!is_valid_ring_ptr(ev_ring, ptr)) {
> +			dev_err(&mhi_cntrl->mhi_dev->dev,
> +				"Event ring rp points outside of the event ring\n");
> +			return -EIO;
> +		}
> +
> +		dev_rp = mhi_to_virtual(ev_ring, ptr);
>  		count++;
>  	}
>  
> @@ -868,11 +910,18 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  	int count = 0;
>  	u32 chan;
>  	struct mhi_chan *mhi_chan;
> +	dma_addr_t ptr = er_ctxt->rp;
>  
>  	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
>  		return -EIO;
>  
> -	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev,
> +			"Event ring rp points outside of the event ring\n");
> +		return -EIO;
> +	}
> +
> +	dev_rp = mhi_to_virtual(ev_ring, ptr);
>  	local_rp = ev_ring->rp;
>  
>  	while (dev_rp != local_rp && event_quota > 0) {
> @@ -886,7 +935,8 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  		 * Only process the event ring elements whose channel
>  		 * ID is within the maximum supported range.
>  		 */
> -		if (chan < mhi_cntrl->max_chan) {
> +		if (chan < mhi_cntrl->max_chan &&
> +		    mhi_cntrl->mhi_chan[chan].configured) {

Same here.

Thanks,
Mani

>  			mhi_chan = &mhi_cntrl->mhi_chan[chan];
>  
>  			if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
> @@ -900,7 +950,15 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  
>  		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
>  		local_rp = ev_ring->rp;
> -		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> +
> +		ptr = er_ctxt->rp;
> +		if (!is_valid_ring_ptr(ev_ring, ptr)) {
> +			dev_err(&mhi_cntrl->mhi_dev->dev,
> +				"Event ring rp points outside of the event ring\n");
> +			return -EIO;
> +		}
> +
> +		dev_rp = mhi_to_virtual(ev_ring, ptr);
>  		count++;
>  	}
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> @@ -1365,6 +1423,7 @@ static void mhi_mark_stale_events(struct mhi_controller *mhi_cntrl,
>  	struct mhi_ring *ev_ring;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	unsigned long flags;
> +	dma_addr_t ptr;
>  
>  	dev_dbg(dev, "Marking all events for chan: %d as stale\n", chan);
>  
> @@ -1372,7 +1431,15 @@ static void mhi_mark_stale_events(struct mhi_controller *mhi_cntrl,
>  
>  	/* mark all stale events related to channel as STALE event */
>  	spin_lock_irqsave(&mhi_event->lock, flags);
> -	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> +
> +	ptr = er_ctxt->rp;
> +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev,
> +			"Event ring rp points outside of the event ring\n");
> +		dev_rp = ev_ring->rp;
> +	} else {
> +		dev_rp = mhi_to_virtual(ev_ring, ptr);
> +	}
>  
>  	local_rp = ev_ring->rp;
>  	while (dev_rp != local_rp) {
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
