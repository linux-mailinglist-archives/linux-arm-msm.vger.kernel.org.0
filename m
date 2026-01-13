Return-Path: <linux-arm-msm+bounces-88684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 360A5D17310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09BB830635DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C5136BCCA;
	Tue, 13 Jan 2026 08:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEa05CHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719403563E5;
	Tue, 13 Jan 2026 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291340; cv=none; b=Yi8n4lxFsuLmlE8dU8yPyQUKkw1V8Y9RsvStvpQheiVu3Oo7QGvRVK2Bj0nCI8j5mPbMV7v99ONRmlnclUcVSDnS02oI9MTk3hvcLL5/TPQ+gC5Jw763KriaBR8yIB8DhTM2EgLMnFx/WgikkvFnjmdU4yjlDMCb8+bu/nxfcII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291340; c=relaxed/simple;
	bh=WCE/q8cLVyF9uCFZ+vJ0tY0bSr0X4itkTuVuf2ALeFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zqej5/DJsp+8A2y1Pu9EAM+PHWalDQWqM39MjvJ0heoS9AVYJb/70cEjFTxvJTxCqk5KV5PMWyvg0DjvAuzD7BoOMtFs0ytWSdLP0ptBzby7LkJZOrRORinWu6WevIa2rtaGIts/aKQWxCbbdTOTSTXvOS435gnxROZ8zKap9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEa05CHZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B586CC116C6;
	Tue, 13 Jan 2026 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768291339;
	bh=WCE/q8cLVyF9uCFZ+vJ0tY0bSr0X4itkTuVuf2ALeFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEa05CHZselxesyHuJ1FAGHxAcWybYOFFJ/6Skn5BnyOHvoCk4n/tJXLWBsY5z9LI
	 v+/sghqNfRMcaPqMGv8wVfe4sGH59tDHmY0nQXs1NC+cMxBjrMc2sghMAiq9OxeFYY
	 +o7cTi7D3TTmSLRR+D29BAoUeKTIVLRqCmXFETvvm9J1Fnv4dmbSUG6qbIpMt7biVm
	 bvoPM/XpLhC8CksWxH02sKWxkv/3LQ7xAJaB6QjvVtRHI6RZHKtfDQbTu4Ym6vPeIj
	 P3E4ED1u5Dc8rSyfYIC5u6EnWr1ELi+HItHzaJA/uCtK4eZA8Xhx9sgSITCi3jMxkK
	 qSXMD1OxUBn2w==
Date: Tue, 13 Jan 2026 13:32:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] bus: mhi: host: Add support for queuing multiple
 DMA buffers
Message-ID: <g3bz2wcmdvrv626mltjjf3czribogpsz5ttuhv24ioege4q7fl@pgmspcgoyso6>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-3-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-3-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:35PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Optimize MHI clients by allowing them to queue multiple DMA buffers for a
> given transfer without ringing the channel doorbell for every queue. This
> avoids unnecessary link access. Introduce the exported API mhi_queue_n_dma
> to pass an array of MHI buffers and MHI flags.
> 

Why do you need a new API? Why can't the client work with existing
mhi_queue_buf() API? I don't quite understand the need for a 'DMA' API since the
existing mhi_queue_buf() API allows the client to either DMA map the buffer
beforehand or it can do it internally.

> Currently, the BEI flag is set for all TREs based on the interrupt
> moderation timer value.

> MHI clients are not allowed to block event
> interrupts at runtime.

This is not true as per the spec. Host is allowed to set BEI flag for any TRE
during runtime, but the Linux MHI stack allows only to configure the BEI flag
statically during controller driver probe based on intmod value.

> If interrupt moderation is disabled for an event
> ring, the client is allowed to poll on events posted on the event ring by
> blocking the MSI.

'...blocking the interrupt for the completion event'. Here MSI is not
appropriate as it is *one of the* interrupt mechanism.

> If interrupt moderation is enabled, the BEI flag passed
> in the queue API is overridden to maintain the current implementation tied
> to the interrupt moderation timer value.
> 
> For scatter-gather transfers, MHI clients should set the MHI_SG transfer
> flag. This flag allows skipping the issuance of transfer callbacks per TRE
> and only issuing a single callback when the last TRE is processed.
> 

Spec defines that scatter gather transfers are identified using the 'chain' bit.
So I don't see a need for a separate flag.

Until the above points are clarified, I'm not inclined to look into the code.

- Mani

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/internal.h |   8 ++
>  drivers/bus/mhi/host/main.c     | 203 +++++++++++++++++++++++++++++++++++-----
>  include/linux/mhi.h             |  26 +++++
>  3 files changed, 213 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 7937bb1f742c..97bf6a70b9fa 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -236,6 +236,7 @@ struct mhi_buf_info {
>  	enum dma_data_direction dir;
>  	bool used; /* Indicates whether the buffer is used or not */
>  	bool pre_mapped; /* Already pre-mapped by client */
> +	bool sg_enabled; /* perform sg and return single completion call back */
>  };
>  
>  struct mhi_event {
> @@ -414,6 +415,13 @@ irqreturn_t mhi_intvec_handler(int irq_number, void *dev);
>  
>  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  		struct mhi_buf_info *info, enum mhi_flags flags);
> +int mhi_gen_n_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> +		  struct mhi_buf *bufs, enum mhi_flags flags[],
> +		  unsigned int num);
> +int __mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> +		  struct mhi_buf_info *info, enum mhi_flags flags,
> +		  struct mhi_ring *buf_ring,  struct mhi_ring *tre_ring);
> +
>  int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
>  			 struct mhi_buf_info *buf_info);
>  int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 861551274319..7beb848ca5c1 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -605,7 +605,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  		struct mhi_ring_element *local_rp, *ev_tre;
>  		void *dev_rp, *next_rp;
>  		struct mhi_buf_info *buf_info;
> -		u16 xfer_len;
> +		u16 xfer_len, total_tre_len = 0;
> +		bool send_cb = false;
>  
>  		if (!is_valid_ring_ptr(tre_ring, ptr)) {
>  			dev_err(&mhi_cntrl->mhi_dev->dev,
> @@ -635,10 +636,14 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  		while (local_rp != dev_rp) {
>  			buf_info = buf_ring->rp;
>  			/* If it's the last TRE, get length from the event */
> -			if (local_rp == ev_tre)
> +			if (local_rp == ev_tre) {
>  				xfer_len = MHI_TRE_GET_EV_LEN(event);
> -			else
> +				send_cb = true;
> +			} else {
>  				xfer_len = buf_info->len;
> +			}
> +
> +			total_tre_len += xfer_len;
>  
>  			/* Unmap if it's not pre-mapped by client */
>  			if (likely(!buf_info->pre_mapped))
> @@ -655,13 +660,28 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  
>  			read_unlock_bh(&mhi_chan->lock);
>  
> +
>  			/* notify client */
> -			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> +			if (buf_info->sg_enabled) {
> +				if (send_cb) {
> +					result.bytes_xferd = total_tre_len;
> +					mhi_chan->xfer_cb(mhi_chan->mhi_dev,
> +							  &result);
> +				}
> +			} else {
> +				mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> +			}
>  
>  			if (mhi_chan->dir == DMA_TO_DEVICE) {
>  				atomic_dec(&mhi_cntrl->pending_pkts);
> -				/* Release the reference got from mhi_queue() */
> -				mhi_cntrl->runtime_put(mhi_cntrl);
> +				/*
> +				 * In case of scatter gather send_cb is set to true only
> +				 * for the last TRE, runtime_put should be called for
> +				 * last TRE instead of every buffer i.e, when send_cb
> +				 * is true else runtime_put count will not be balanced
> +				 */
> +				if (!buf_info->sg_enabled || send_cb)
> +					mhi_cntrl->runtime_put(mhi_cntrl);
>  			}
>  
>  			/*
> @@ -1192,25 +1212,14 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_skb);
>  
> -int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> -			struct mhi_buf_info *info, enum mhi_flags flags)
> +int __mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> +		  struct mhi_buf_info *info, enum mhi_flags flags,
> +		  struct mhi_ring *buf_ring,  struct mhi_ring *tre_ring)
>  {
> -	struct mhi_ring *buf_ring, *tre_ring;
>  	struct mhi_ring_element *mhi_tre;
>  	struct mhi_buf_info *buf_info;
>  	int eot, eob, chain, bei;
> -	int ret = 0;
> -
> -	/* Protect accesses for reading and incrementing WP */
> -	write_lock_bh(&mhi_chan->lock);
> -
> -	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> -		ret = -ENODEV;
> -		goto out;
> -	}
> -
> -	buf_ring = &mhi_chan->buf_ring;
> -	tre_ring = &mhi_chan->tre_ring;
> +	int ret;
>  
>  	buf_info = buf_ring->wp;
>  	WARN_ON(buf_info->used);
> @@ -1227,24 +1236,55 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	if (!info->pre_mapped) {
>  		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
>  		if (ret)
> -			goto out;
> +			return ret;
>  	}
>  
> +	trace_mhi_gen_tre(mhi_cntrl, mhi_chan, mhi_tre);
> +
>  	eob = !!(flags & MHI_EOB);
>  	eot = !!(flags & MHI_EOT);
>  	chain = !!(flags & MHI_CHAIN);
> -	bei = !!(mhi_chan->intmod);
> +
> +	buf_info->sg_enabled = !!(flags & MHI_SG);
> +
> +	/* honor bei flag if interrupt moderation is disabled */
> +	bei = !!(mhi_chan->intmod ?
> +				mhi_chan->intmod : flags & MHI_BEI);
>  
>  	mhi_tre = tre_ring->wp;
>  	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
>  	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
>  	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
>  
> -	trace_mhi_gen_tre(mhi_cntrl, mhi_chan, mhi_tre);
> +	if (mhi_chan->dir == DMA_TO_DEVICE)
> +		atomic_inc(&mhi_cntrl->pending_pkts);
> +
>  	/* increment WP */
>  	mhi_add_ring_element(mhi_cntrl, tre_ring);
>  	mhi_add_ring_element(mhi_cntrl, buf_ring);
>  
> +	return 0;
> +}
> +
> +int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> +			struct mhi_buf_info *info, enum mhi_flags flags)
> +{
> +	struct mhi_ring *buf_ring, *tre_ring;
> +	int ret = 0;
> +
> +	/* Protect accesses for reading and incrementing WP */
> +	write_lock_bh(&mhi_chan->lock);
> +
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	buf_ring = &mhi_chan->buf_ring;
> +	tre_ring = &mhi_chan->tre_ring;
> +
> +	ret = __mhi_gen_tre(mhi_cntrl, mhi_chan, info, flags, buf_ring, tre_ring);
> +
>  out:
>  	write_unlock_bh(&mhi_chan->lock);
>  
> @@ -1264,6 +1304,121 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_buf);
>  
> +int mhi_gen_n_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> +		  struct mhi_buf *bufs, enum mhi_flags flags[],
> +		  unsigned int num)
> +{
> +	struct mhi_ring *buf_ring, *tre_ring;
> +	void *cur_buf_ring_wp, *cur_tre_ring_wp;
> +	int i = 0, j, ret;
> +	struct mhi_buf_info buf_info = {0};
> +	struct mhi_buf_info *info;
> +
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	buf_ring = &mhi_chan->buf_ring;
> +	tre_ring = &mhi_chan->tre_ring;
> +
> +	cur_buf_ring_wp = buf_ring->wp;
> +	cur_tre_ring_wp = tre_ring->wp;
> +
> +	while (num-- > 0) {
> +		buf_info.wp = tre_ring->wp;
> +		buf_info.p_addr = bufs[i].dma_addr;
> +		buf_info.cb_buf = bufs[i].buf;
> +		buf_info.len = bufs[i].len;
> +		buf_info.pre_mapped = bufs[i].streaming_dma;
> +
> +		ret = __mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, flags[i], buf_ring, tre_ring);
> +		if (ret)
> +			goto error;
> +
> +		i++;
> +
> +		/**
> +		 * When multiple packets are queued in single queue_n_dma call
> +		 * runtime_get should be called for each packet to balance
> +		 * runtime_put and runtime_get count,
> +		 * because once we get MSI's from the device,
> +		 * we call runtime_put for each packet in parse_xfer_event
> +		 */
> +		if (!buf_info.sg_enabled)
> +			mhi_cntrl->runtime_get(mhi_cntrl);
> +	}
> +
> +	/**
> +	 * If it is a scatter gather transfer, runtime_get
> +	 * should be called only once as we call runtime_put
> +	 * only for last TRE in the parse_xfer_event
> +	 */
> +	if (buf_info.wp && buf_info.sg_enabled)
> +		mhi_cntrl->runtime_get(mhi_cntrl);
> +
> +	return 0;
> +error:
> +	buf_ring->wp = cur_buf_ring_wp;
> +	tre_ring->wp = cur_buf_ring_wp;
> +
> +	for (j = i - 1; j >= 0; j--) {
> +		atomic_dec(&mhi_cntrl->pending_pkts);
> +		info = cur_buf_ring_wp;
> +		if (!bufs[i].dma_addr)
> +			mhi_cntrl->unmap_single(mhi_cntrl, info);
> +
> +		cur_buf_ring_wp += buf_ring->el_size;
> +		if (cur_buf_ring_wp >= buf_ring->base + buf_ring->len)
> +			cur_buf_ring_wp = buf_ring->base;
> +	}
> +
> +out:
> +	return ret;
> +
> +}
> +
> +int mhi_queue_n_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> +		    struct mhi_buf *bufs, enum mhi_flags mflags[],
> +		    unsigned int num)
> +{
> +	unsigned long flags;
> +	int ret;
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
> +							     mhi_dev->dl_chan;
> +
> +	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
> +		return -EIO;
> +
> +	write_lock_irqsave(&mhi_chan->lock, flags);
> +
> +	if (get_nr_avail_ring_elements(mhi_cntrl, &mhi_chan->tre_ring) < num) {
> +		ret = -EAGAIN;
> +		goto error;
> +	}
> +
> +	ret = mhi_gen_n_tre(mhi_dev->mhi_cntrl, mhi_chan, bufs, mflags,
> +			    num);
> +	if (ret)
> +		goto error;
> +
> +	/* Assert dev_wake (to exit/prevent M1/M2)*/
> +	mhi_cntrl->wake_toggle(mhi_cntrl);
> +
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> +
> +	if (dir == DMA_FROM_DEVICE)
> +		mhi_cntrl->runtime_put(mhi_cntrl);
> +
> +error:
> +	write_unlock_irqrestore(&mhi_chan->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mhi_queue_n_dma);
> +
>  bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index dd372b0123a6..360770ddef70 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -52,11 +52,15 @@ enum mhi_callback {
>   * @MHI_EOB: End of buffer for bulk transfer
>   * @MHI_EOT: End of transfer
>   * @MHI_CHAIN: Linked transfer
> + * @MHI_BEI: Block event interrupt
> + * @MHI_SG: scatter-gather enabled, single xfer call back to client
>   */
>  enum mhi_flags {
>  	MHI_EOB = BIT(0),
>  	MHI_EOT = BIT(1),
>  	MHI_CHAIN = BIT(2),
> +	MHI_BEI = BIT(3),
> +	MHI_SG = BIT(4),
>  };
>  
>  /**
> @@ -497,6 +501,7 @@ struct mhi_result {
>   *        ECA - Event context array data
>   *        CCA - Channel context array data
>   * @dma_addr: IOMMU address of the buffer
> + * @streaming_dma: Set this flag by client for pre allocated streaming dma address
>   * @len: # of bytes
>   */
>  struct mhi_buf {
> @@ -504,6 +509,7 @@ struct mhi_buf {
>  	const char *name;
>  	dma_addr_t dma_addr;
>  	size_t len;
> +	bool streaming_dma;
>  };
>  
>  /**
> @@ -770,6 +776,13 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
>   */
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>  
> +/**
> + * mhi_poll - Poll for any available data in DL direction
> + * @mhi_dev: Device associated with the channels
> + * @budget: # of events to process
> + */
> +int mhi_poll(struct mhi_device *mhi_dev, u32 budget);
> +
>  /**
>   * mhi_queue_buf - Send or receive raw buffers from client device over MHI
>   *                 channel
> @@ -782,6 +795,19 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>  int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  		  void *buf, size_t len, enum mhi_flags mflags);
>  
> +/**
> + * mhi_queue_n_dma - Send or receive n DMA mapped buffers from client device
> + *                 over MHI channel
> + * @mhi_dev: Device associated with the channels
> + * @dir: DMA direction for the channel
> + * @mhi_buf[]: Array of mhi_buf for holding the DMA mapped data and len
> + * @mflags[]: Array of MHI transfer flags used for the transfer
> + * @num: Number of transfers
> + */
> +int mhi_queue_n_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> +		  struct mhi_buf *bufs, enum mhi_flags mflags[],
> +		  unsigned int num);
> +
>  /**
>   * mhi_queue_skb - Send or receive SKBs from client device over MHI channel
>   * @mhi_dev: Device associated with the channels
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

