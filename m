Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00CC3CB70A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 13:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbhGPL53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 07:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbhGPL52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 07:57:28 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AD5C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 04:54:32 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t9so9747202pgn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=McLq8C0l/ty7XCMoCzUHlUD6T7P73PiH5/4RXUmovZI=;
        b=TgjsfiSEZ6ps6RWzuquLwUjuG52UbMDGu8yxVEJ/p49SSC7j/4vU4aFSZXSDOl09HI
         6kZ8rjjMb6JUOwfJKAQyl3nkzs89xJZbfGKYWGsUdJrGlACUOvHOTKoteAFN33tNippz
         mMlJNfQqse+9g4eacSIApEx+JxMHICnA05YBLTQANnLCzP8oieOsGW7kbQt9U24tjQBV
         zNNMTvX0yKvDfN/vUy+o6nQCT6ToeH2AC7HjS72kNLrcS4WRNDfKMe3BK2lQ0bcRvZ0i
         wDbIUOIMDroCL84KNW/OQ+m0i/JJhVLZ47Yim4+SVMIemiK2Pp4wtX8iCXDZXEw9HyaS
         Wk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=McLq8C0l/ty7XCMoCzUHlUD6T7P73PiH5/4RXUmovZI=;
        b=bmUFYNcD/qlBzM3W0HDE0+oicXD872lmzFeKjs/zmraORQiMnATdliH6VHoTNCITpg
         FUAtNESCV5FclIbN5nxiH5rz9Tm6qep3M2lvFk3WxNtdbTjJb0KO3ln1zUV/yDZxwP6Z
         0dkXHmbU6EdU+Rq7zt8hwv8/BKty/DOdMSVsG0+Qql7/7maO7QOIoADYsrEEUeWFz3Gz
         NJqPvR5iHZ3kCXp/DYBgOOdJtmC9Z8mpCyqlfLu+BNDAPB8daOwznZNVnhzkx8s8Cybq
         jLKyZCHp3rFf8ud0o2YHV9glR0pa1/NhTvpLxSncQ9PPvhbaYjcmII2NZqyabDGLdvib
         NVpQ==
X-Gm-Message-State: AOAM530hKG3MCsuFZkw9ivWtzfq9rs+YMmaI0zM06m6z20VU4rs3YDvM
        dovBjxZ3vVOJTjrKlWnryrwy
X-Google-Smtp-Source: ABdhPJy4RT8Y9XLct06JtdclYukX3QVoaUCu4qwyRZdQ1GyuAO0ogilVMJB6X746eErf+N9S1j4D+A==
X-Received: by 2002:a62:bd15:0:b029:31c:a584:5f97 with SMTP id a21-20020a62bd150000b029031ca5845f97mr9904415pff.33.1626436472363;
        Fri, 16 Jul 2021 04:54:32 -0700 (PDT)
Received: from workstation ([120.138.12.214])
        by smtp.gmail.com with ESMTPSA id w186sm10367185pfw.106.2021.07.16.04.54.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 04:54:31 -0700 (PDT)
Date:   Fri, 16 Jul 2021 17:24:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: core: Replace DMA allocation wrappers with
 original APIs
Message-ID: <20210716115428.GJ3323@workstation>
References: <1624392428-9328-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624392428-9328-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 22, 2021 at 01:07:08PM -0700, Bhaumik Bhatt wrote:
> There is nothing special done within the mhi_alloc_coherent() and
> the mhi_free_coherent() wrapper functions. They only directly
> call the equivalent DMA allocation functions. Replace them with
> the original function calls such that the implementation is clear
> and direct.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/boot.c     | 17 +++++++++--------
>  drivers/bus/mhi/core/init.c     | 32 ++++++++++++++++----------------
>  drivers/bus/mhi/core/internal.h | 20 --------------------
>  drivers/bus/mhi/core/main.c     |  6 +++---
>  4 files changed, 28 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 8100cf5..0a97262 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -302,8 +302,8 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>  	struct mhi_buf *mhi_buf = image_info->mhi_buf;
>  
>  	for (i = 0; i < image_info->entries; i++, mhi_buf++)
> -		mhi_free_coherent(mhi_cntrl, mhi_buf->len, mhi_buf->buf,
> -				  mhi_buf->dma_addr);
> +		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
> +				  mhi_buf->buf, mhi_buf->dma_addr);
>  
>  	kfree(image_info->mhi_buf);
>  	kfree(image_info);
> @@ -339,8 +339,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  			vec_size = sizeof(struct bhi_vec_entry) * i;
>  
>  		mhi_buf->len = vec_size;
> -		mhi_buf->buf = mhi_alloc_coherent(mhi_cntrl, vec_size,
> -						  &mhi_buf->dma_addr,
> +		mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
> +						  vec_size, &mhi_buf->dma_addr,
>  						  GFP_KERNEL);
>  		if (!mhi_buf->buf)
>  			goto error_alloc_segment;
> @@ -354,8 +354,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  
>  error_alloc_segment:
>  	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
> -		mhi_free_coherent(mhi_cntrl, mhi_buf->len, mhi_buf->buf,
> -				  mhi_buf->dma_addr);
> +		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
> +				  mhi_buf->buf, mhi_buf->dma_addr);
>  
>  error_alloc_mhi_buf:
>  	kfree(img_info);
> @@ -442,7 +442,8 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	if (size > firmware->size)
>  		size = firmware->size;
>  
> -	buf = mhi_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
> +	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
> +				 GFP_KERNEL);
>  	if (!buf) {
>  		release_firmware(firmware);
>  		goto error_fw_load;
> @@ -451,7 +452,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	/* Download image using BHI */
>  	memcpy(buf, firmware->data, size);
>  	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
> -	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
>  
>  	/* Error or in EDL mode, we're done */
>  	if (ret) {
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 4446760..c7ba715 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -129,7 +129,7 @@ static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
>  				  u64 len)
>  {
>  	ring->alloc_size = len + (len - 1);
> -	ring->pre_aligned = mhi_alloc_coherent(mhi_cntrl, ring->alloc_size,
> +	ring->pre_aligned = dma_alloc_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
>  					       &ring->dma_handle, GFP_KERNEL);
>  	if (!ring->pre_aligned)
>  		return -ENOMEM;
> @@ -221,13 +221,13 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
>  	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
>  		ring = &mhi_cmd->ring;
> -		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
> +		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
>  				  ring->pre_aligned, ring->dma_handle);
>  		ring->base = NULL;
>  		ring->iommu_base = 0;
>  	}
>  
> -	mhi_free_coherent(mhi_cntrl,
> +	dma_free_coherent(mhi_cntrl->cntrl_dev,
>  			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
>  			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
>  
> @@ -237,17 +237,17 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  			continue;
>  
>  		ring = &mhi_event->ring;
> -		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
> +		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
>  				  ring->pre_aligned, ring->dma_handle);
>  		ring->base = NULL;
>  		ring->iommu_base = 0;
>  	}
>  
> -	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
>  			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
>  			  mhi_ctxt->er_ctxt_addr);
>  
> -	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
>  			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
>  			  mhi_ctxt->chan_ctxt_addr);
>  
> @@ -275,7 +275,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  		return -ENOMEM;
>  
>  	/* Setup channel ctxt */
> -	mhi_ctxt->chan_ctxt = mhi_alloc_coherent(mhi_cntrl,
> +	mhi_ctxt->chan_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
>  						 sizeof(*mhi_ctxt->chan_ctxt) *
>  						 mhi_cntrl->max_chan,
>  						 &mhi_ctxt->chan_ctxt_addr,
> @@ -307,7 +307,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	/* Setup event context */
> -	mhi_ctxt->er_ctxt = mhi_alloc_coherent(mhi_cntrl,
> +	mhi_ctxt->er_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
>  					       sizeof(*mhi_ctxt->er_ctxt) *
>  					       mhi_cntrl->total_ev_rings,
>  					       &mhi_ctxt->er_ctxt_addr,
> @@ -354,7 +354,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  
>  	/* Setup cmd context */
>  	ret = -ENOMEM;
> -	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
> +	mhi_ctxt->cmd_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
>  						sizeof(*mhi_ctxt->cmd_ctxt) *
>  						NR_OF_CMD_RINGS,
>  						&mhi_ctxt->cmd_ctxt_addr,
> @@ -389,10 +389,10 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	for (--i, --mhi_cmd; i >= 0; i--, mhi_cmd--) {
>  		struct mhi_ring *ring = &mhi_cmd->ring;
>  
> -		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
> +		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
>  				  ring->pre_aligned, ring->dma_handle);
>  	}
> -	mhi_free_coherent(mhi_cntrl,
> +	dma_free_coherent(mhi_cntrl->cntrl_dev,
>  			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
>  			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
>  	i = mhi_cntrl->total_ev_rings;
> @@ -405,15 +405,15 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  		if (mhi_event->offload_ev)
>  			continue;
>  
> -		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
> +		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
>  				  ring->pre_aligned, ring->dma_handle);
>  	}
> -	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
>  			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
>  			  mhi_ctxt->er_ctxt_addr);
>  
>  error_alloc_er_ctxt:
> -	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
>  			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
>  			  mhi_ctxt->chan_ctxt_addr);
>  
> @@ -567,7 +567,7 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  	if (!chan_ctxt->rbase) /* Already uninitialized */
>  		return;
>  
> -	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
>  			  tre_ring->pre_aligned, tre_ring->dma_handle);
>  	vfree(buf_ring->base);
>  
> @@ -610,7 +610,7 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  	buf_ring->base = vzalloc(buf_ring->len);
>  
>  	if (!buf_ring->base) {
> -		mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
> +		dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
>  				  tre_ring->pre_aligned, tre_ring->dma_handle);
>  		return -ENOMEM;
>  	}
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 672052f..b5594fa 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -690,26 +690,6 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  void mhi_reset_chan(struct mhi_controller *mhi_cntrl,
>  		    struct mhi_chan *mhi_chan);
>  
> -/* Memory allocation methods */
> -static inline void *mhi_alloc_coherent(struct mhi_controller *mhi_cntrl,
> -				       size_t size,
> -				       dma_addr_t *dma_handle,
> -				       gfp_t gfp)
> -{
> -	void *buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, dma_handle,
> -				       gfp);
> -
> -	return buf;
> -}
> -
> -static inline void mhi_free_coherent(struct mhi_controller *mhi_cntrl,
> -				     size_t size,
> -				     void *vaddr,
> -				     dma_addr_t dma_handle)
> -{
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, size, vaddr, dma_handle);
> -}
> -
>  /* Event processing methods */
>  void mhi_ctrl_ev_task(unsigned long data);
>  void mhi_ev_task(unsigned long data);
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 02c8c09..409c68bc 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -193,7 +193,7 @@ int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
>  int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
>  			  struct mhi_buf_info *buf_info)
>  {
> -	void *buf = mhi_alloc_coherent(mhi_cntrl, buf_info->len,
> +	void *buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, buf_info->len,
>  				       &buf_info->p_addr, GFP_ATOMIC);
>  
>  	if (!buf)
> @@ -220,8 +220,8 @@ void mhi_unmap_single_use_bb(struct mhi_controller *mhi_cntrl,
>  	if (buf_info->dir == DMA_FROM_DEVICE)
>  		memcpy(buf_info->v_addr, buf_info->bb_addr, buf_info->len);
>  
> -	mhi_free_coherent(mhi_cntrl, buf_info->len, buf_info->bb_addr,
> -			  buf_info->p_addr);
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, buf_info->len,
> +			  buf_info->bb_addr, buf_info->p_addr);
>  }
>  
>  static int get_nr_avail_ring_elements(struct mhi_controller *mhi_cntrl,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
