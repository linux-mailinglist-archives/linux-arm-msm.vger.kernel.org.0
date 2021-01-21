Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251142FE8FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 12:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730450AbhAULiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 06:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729725AbhAULYM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 06:24:12 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1056EC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:23:32 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id n7so1178452pgg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=giomJ0krdJfgizuRFfQAQJInEH5uDbYd+ubs6SVJPMw=;
        b=jc/7LjX7pEy7Z4id9wguYide/tGH5AC9R2RdHFr+ivXj4qHt0B3XvP1W7qFrDthckL
         QIYRtDtgw8aqcxKnohaFmoTevQSxz7rDFOf+gWr1ui4SiHJ4A7bH7tEomVMuCyjuhQjn
         r13XAKzt5acImnlAFBEWYHknP8nQOdosiL144lwUyHziHnEACfqP6Qwnh9ITWVHsJH6P
         eQjFzMYiwk2afewtPDGBgvY4P/oBS8pXkDj9mvzugit/l716a5lhCe0d1GVbir7svUAo
         zXnkxBltmwde72YawM9AB5lPf5GZ+W9nCrZxerAYAgYATuxSBZw+nSf4Tq39lbMb7Z5c
         MW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=giomJ0krdJfgizuRFfQAQJInEH5uDbYd+ubs6SVJPMw=;
        b=DHOCXt54inAM1XNQ8cSqSdP9suTJ9rOlfUAi5IHX+bRiJ93t1xS44CKTCK2UuRttEu
         45s7DNmb6kBWIHycn30eXba8F+sEofEMEB6l2Kr5OCq3NNHCT44fO1P9LhQcOUnljysT
         O9y94ET1Y+Jeeftt+ng1uMcs1jTi5/DMZaAoxaUFUPXbyMyJLOlwwUdWofnPJWQMYWHN
         Jt9a7ueZ60dLyn31/S2OEswL0f3eQ3coF9UDn8TBme1qi8cmhFFlyPZj7t37JydSjRy/
         LBmdDo/VZALsvrlBcnRx/NvYudakvC9b7E9hSHEf3JKKbCUaaUmH+zQvRCSuvJqOz1Zr
         4HAw==
X-Gm-Message-State: AOAM533gvex56fao0xbK4I+y+gd/5FaPo3LeQRpJRvjvGOFcZrBwFxFD
        sYPXRXKnXWEGH0NeIxbeBJwEGyISCJ9i
X-Google-Smtp-Source: ABdhPJxuDXXRSJfH+Me2gwYTbYQFYyTC6s/EkAWsLovQr43EwtSy/snxcrIYA+UWlgEvHpGQX8lTng==
X-Received: by 2002:a63:1b22:: with SMTP id b34mr14036636pgb.132.1611228211508;
        Thu, 21 Jan 2021 03:23:31 -0800 (PST)
Received: from thinkpad ([2409:4072:6182:23c4:4d5:e6d9:fc7e:c8e2])
        by smtp.gmail.com with ESMTPSA id i1sm5708444pfb.54.2021.01.21.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 03:23:30 -0800 (PST)
Date:   Thu, 21 Jan 2021 16:53:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org
Subject: Re: [PATCH v2] mhi: core: Factorize mhi queuing
Message-ID: <20210121112326.GD30041@thinkpad>
References: <1610124750-11950-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610124750-11950-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 05:52:30PM +0100, Loic Poulain wrote:
> Instead of duplicating queuing procedure in mhi_queue_dma(),
> mhi_queue_buf() and mhi_queue_skb(), add a new generic mhi_queue()
> as common helper.
> 
> Note that the unified mhi_queue align pm_lock locking on mhi_queue_buf
> behavior, taking it with irqsave variant (vs _bh for former queue_skb
> and queue_dma version).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: re-integrate pre_alloc check (Mani)
>      comment about _bh to _irqsave unification     
> 
>  drivers/bus/mhi/core/main.c | 161 +++++++++++---------------------------------
>  1 file changed, 40 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index effe94f..2d9157ce 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -969,118 +969,81 @@ static bool mhi_is_ring_full(struct mhi_controller *mhi_cntrl,
>  	return (tmp == ring->rp);
>  }
>  
> -int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct sk_buff *skb, size_t len, enum mhi_flags mflags)
> +static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
> +		     enum dma_data_direction dir, enum mhi_flags mflags)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>  	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
>  							     mhi_dev->dl_chan;
>  	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
> -	struct mhi_buf_info buf_info = { };
> +	unsigned long flags;
>  	int ret;
>  
> -	/* If MHI host pre-allocates buffers then client drivers cannot queue */
> -	if (mhi_chan->pre_alloc)
> +	if (unlikely(mhi_chan->pre_alloc))
>  		return -EINVAL;
>  
> -	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
> -		return -ENOMEM;
> -
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> +	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
>  		return -EIO;
> +
> +	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> +
> +	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
> +	if (unlikely(ret)) {
> +		ret = -ENOMEM;
> +		goto exit_unlock;
>  	}
>  
> -	/* we're in M3 or transitioning to M3 */
> +	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, buf_info, mflags);
> +	if (unlikely(ret))
> +		goto exit_unlock;
> +
> +	/* trigger M3 exit if necessary */
>  	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>  		mhi_trigger_resume(mhi_cntrl);
>  
> -	/* Toggle wake to exit out of M2 */
> +	/* Assert dev_wake (to exit/prevent M1/M2)*/
>  	mhi_cntrl->wake_toggle(mhi_cntrl);
>  
> -	buf_info.v_addr = skb->data;
> -	buf_info.cb_buf = skb;
> -	buf_info.len = len;
> -
> -	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
> -	if (unlikely(ret)) {
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> -		return ret;
> -	}
> -
>  	if (mhi_chan->dir == DMA_TO_DEVICE)
>  		atomic_inc(&mhi_cntrl->pending_pkts);
>  
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> -		read_lock_bh(&mhi_chan->lock);
> -		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> -		read_unlock_bh(&mhi_chan->lock);
> +	if (unlikely(!MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> +		ret = -EIO;
> +		goto exit_unlock;
>  	}
>  
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> +	mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>  
> -	return 0;
> +exit_unlock:
> +	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> +
> +	return ret;
>  }
> -EXPORT_SYMBOL_GPL(mhi_queue_skb);
>  
> -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
> +int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> +		  struct sk_buff *skb, size_t len, enum mhi_flags mflags)
>  {
> -	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> -	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
> -							     mhi_dev->dl_chan;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
>  	struct mhi_buf_info buf_info = { };
> -	int ret;
> -
> -	/* If MHI host pre-allocates buffers then client drivers cannot queue */
> -	if (mhi_chan->pre_alloc)
> -		return -EINVAL;
> -
> -	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
> -		return -ENOMEM;
> -
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
> -		dev_err(dev, "MHI is not in activate state, PM state: %s\n",
> -			to_mhi_pm_state_str(mhi_cntrl->pm_state));
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
>  
> -		return -EIO;
> -	}
> +	buf_info.v_addr = skb->data;
> +	buf_info.cb_buf = skb;
> +	buf_info.len = len;
>  
> -	/* we're in M3 or transitioning to M3 */
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
> +	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
> +}
> +EXPORT_SYMBOL_GPL(mhi_queue_skb);
>  
> -	/* Toggle wake to exit out of M2 */
> -	mhi_cntrl->wake_toggle(mhi_cntrl);
> +int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> +		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
> +{
> +	struct mhi_buf_info buf_info = { };
>  
>  	buf_info.p_addr = mhi_buf->dma_addr;
>  	buf_info.cb_buf = mhi_buf;
>  	buf_info.pre_mapped = true;
>  	buf_info.len = len;
>  
> -	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
> -	if (unlikely(ret)) {
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> -		return ret;
> -	}
> -
> -	if (mhi_chan->dir == DMA_TO_DEVICE)
> -		atomic_inc(&mhi_cntrl->pending_pkts);
> -
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> -		read_lock_bh(&mhi_chan->lock);
> -		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> -		read_unlock_bh(&mhi_chan->lock);
> -	}
> -
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> -
> -	return 0;
> +	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_dma);
>  
> @@ -1134,57 +1097,13 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  		  void *buf, size_t len, enum mhi_flags mflags)
>  {
> -	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> -	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
> -							     mhi_dev->dl_chan;
> -	struct mhi_ring *tre_ring;
>  	struct mhi_buf_info buf_info = { };
> -	unsigned long flags;
> -	int ret;
> -
> -	/*
> -	 * this check here only as a guard, it's always
> -	 * possible mhi can enter error while executing rest of function,
> -	 * which is not fatal so we do not need to hold pm_lock
> -	 */
> -	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
> -		return -EIO;
> -
> -	tre_ring = &mhi_chan->tre_ring;
> -	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
> -		return -ENOMEM;
>  
>  	buf_info.v_addr = buf;
>  	buf_info.cb_buf = buf;
>  	buf_info.len = len;
>  
> -	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, mflags);
> -	if (unlikely(ret))
> -		return ret;
> -
> -	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> -
> -	/* we're in M3 or transitioning to M3 */
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
> -
> -	/* Toggle wake to exit out of M2 */
> -	mhi_cntrl->wake_toggle(mhi_cntrl);
> -
> -	if (mhi_chan->dir == DMA_TO_DEVICE)
> -		atomic_inc(&mhi_cntrl->pending_pkts);
> -
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> -		unsigned long flags;
> -
> -		read_lock_irqsave(&mhi_chan->lock, flags);
> -		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> -		read_unlock_irqrestore(&mhi_chan->lock, flags);
> -	}
> -
> -	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> -
> -	return 0;
> +	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_buf);
>  
> -- 
> 2.7.4
> 
