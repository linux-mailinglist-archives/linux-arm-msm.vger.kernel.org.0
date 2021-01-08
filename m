Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E372EF20A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 13:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbhAHMIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 07:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728073AbhAHMIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 07:08:06 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD476C0612F4
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 04:07:26 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id h186so6136571pfe.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7+wPI5svthzXhBsVs1eF0k617JV5P3gfJFvuVAYuIh4=;
        b=f5qxioedjdsegiKHuqNvMq7xOQ1qCERasw/UMqypMUpopfRoUrvSoQxP+SJUHZ2afk
         rewLlim8KSwC3PRudOBcyWBjm9mbI6k73LBM+OnYVhUKE3L/36DazII/vzkEvbqWeYXl
         cWoBbYFqU1SE+cht6rGq+iarIgM8Ks5BWBP5ERK7RZjSctlC8lHyHycBpCPjOk5cVsb3
         tEGnukWGi0wyPJW7yD4/oxOZCnr0XHwGxnoymGdqiaEYo02yDE+BxkhOBPmLlw8LLqVm
         W9dW6URSbRG2VmObxHaXYNy+EUa4OU2uWFyYBcGL7Alf5IUN5Dpox3YYvvpo/0PvQQbG
         nibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7+wPI5svthzXhBsVs1eF0k617JV5P3gfJFvuVAYuIh4=;
        b=aVaEZ+i1OhR6RVbzkf2qp5TL5UhReF41G2lxHGDF4HrllnmXXYU9Zm60hyQMqFnLfy
         LMoaLppoeyCVksZ+okBfk7NxXiOXq/Bk/cU0INkdaf5hRyAeQhLgeOSo/eYXqYHAZW5w
         vaTGhZjoycB9MxuE+PbxLIQvCq/KaNikbSd1JH6WZcKSvFQGYZMFCfzp8599vX9Zf0DQ
         DsYZMIJvZhxyERkZUuEUaYqkhhJtmt/r2aGF4vNwpz7FfM8K1zopd61TNVNFbaPZBXNI
         ki6QDACqvOd3MRJJBrhmcRjiVmX0fUImZg1AXFazRhKzcOaqG0Y2TdDC/y7hOYbXGEta
         bEMw==
X-Gm-Message-State: AOAM530HNA8R0IePUwe6LPWD+nzTK5Jl1OK2mIc6w1E0rhVUkNas8p1F
        MHgrHMdvESEd9UqqwmC/i1Zs
X-Google-Smtp-Source: ABdhPJwxIaobs2Xruh/yJ6LxzIZZL73AxCSCMooTow/H10+qQA3ocxeqxbYyLT/IH6ey253tGJxRLw==
X-Received: by 2002:a63:5304:: with SMTP id h4mr6703027pgb.199.1610107646094;
        Fri, 08 Jan 2021 04:07:26 -0800 (PST)
Received: from thinkpad ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id cl23sm7700862pjb.23.2021.01.08.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:07:25 -0800 (PST)
Date:   Fri, 8 Jan 2021 17:37:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mhi: core: Factorize mhi queuing
Message-ID: <20210108120722.GC74017@thinkpad>
References: <1607599892-6229-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607599892-6229-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 10, 2020 at 12:31:32PM +0100, Loic Poulain wrote:
> Instead of duplicating queuing procedure in mhi_queue_dma(),
> mhi_queue_buf() and mhi_queue_skb(), add a new generic mhi_queue()
> as common helper.
> 

While doing the factoring, please don't make any additional changes. If you want
to do, then use incremental patches.

Thanks,
Mani

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/main.c | 160 +++++++++++---------------------------------
>  1 file changed, 38 insertions(+), 122 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 3871ef0..4fa4c88 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -963,118 +963,78 @@ static bool mhi_is_ring_full(struct mhi_controller *mhi_cntrl,
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
> -		return -EINVAL;
> +	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
> +		return -EIO;
>  
> -	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
> -		return -ENOMEM;
> +	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>  
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> -		return -EIO;
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
>  
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
> -
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
> @@ -1128,57 +1088,13 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
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
