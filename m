Return-Path: <linux-arm-msm+bounces-80491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C2C38293
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 23:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF84A1A205AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 22:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF162EBDDE;
	Wed,  5 Nov 2025 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VX8z9VVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75D2C11F9;
	Wed,  5 Nov 2025 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381036; cv=none; b=rRaVi8WaGyKkX8USmB/WHFKWKZydrMKt2+uKnutjVZ+O868V3/NCa4fW1Nuez214ILALEdP0FQWtYRKZiMqecFNCdFBrwCkSrrVzd7ekNMEXRrpnl5wXTrG6xfPNtYyvybu4Jgqo9WPWOLag8QE9EWlPb4/M5b8zY458/gzymyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381036; c=relaxed/simple;
	bh=sMe7Q7c8g+PVIZxgBouDeRxgp5ZyW6ickklTN5FWV68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkIOH4O3mxpvhmPZnjmvNFeJO+oBrHTMeN4lVarMni/T0sx1v6BkqBOlSAFuDSx13cNpxVHFTTm2OwUVsptILV9etu25DXQB6t9kuJzXPC/ouYqpRFVZBW+EljKIAx1srN9BXGfh2JhRgB5iroVdGmp4PTq/7aCUHc1vqvtTx/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VX8z9VVV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F013C4CEFB;
	Wed,  5 Nov 2025 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762381033;
	bh=sMe7Q7c8g+PVIZxgBouDeRxgp5ZyW6ickklTN5FWV68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VX8z9VVVTdDrvzfXPlgLrm6IUmk2afANYaO8JFAO1tI7HavDF2AO0mMm4JnoVlCXt
	 UD9/jtvxpcUPtxKT60yN14x+ZDP0IS3Dc6TFj5sm0QGzvqPNz+g8SnSqRnTMqaUVIX
	 oITG0Ykjw/AEijJlTlRuzGu9FGObB3yu8TjVg8zXR95bdgvi3SnuTS7DK4IwQeYp2A
	 cb0GBPDl5PLzdY7zFx6HDc5jsfM2GFDMnbSvthvS5mk1JK/uqAJ9AXaGJmUxDHjULh
	 mo3ERkCgFeVYYbRkXunPIWUaEyAxOr4WGrJBTtj9QQMP837E985xY6tLPr69IMpH4I
	 ISyuC+/0nCkng==
Date: Wed, 5 Nov 2025 16:20:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com
Subject: Re: [PATCH v2 2/3] bus: mhi: ep: Create mhi_ep_queue_buf API for raw
 buffer queuing
Message-ID: <x7y653maep4keb6e33dbpsjeqdasum2l6dd75o5ykwbsqpq5l6@apnaxk4tlcj4>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
 <20251104-loopback_mhi-v2-2-727a3fd9aa74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-loopback_mhi-v2-2-727a3fd9aa74@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 11:09:06AM +0530, Sumit Kumar wrote:
> Create and export a new mhi_ep_queue_buf() API that allows raw buffer
> queuing for client not using skb.

Start with make it clear why this patch is desired. Why would such
clients exist, can't they just allocate some skbs?

> 
> Extract core logic for queuing buffers into a new internal mhi_ep_queue()
> function that provides a unified implementation for both mhi_ep_queue_skb()
> and mhi_ep_queue_buf(). This internal function uses a cb_buf parameter to
> handle both socket buffers and raw buffers through the same code path.

No signed-off-by?

> ---
>  drivers/bus/mhi/ep/main.c | 23 +++++++++++++++++------
>  include/linux/mhi_ep.h    | 10 ++++++++++
>  2 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..f4b119a8dca2dbfb3ffc24b04c85743fb57088fd 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -544,9 +544,9 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
>  
>  	mhi_ep_ring_inc_index(ring);
>  }
> -

I'm pretty sure we want that line.

>  /* TODO: Handle partially formed TDs */
> -int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> +static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
> +			void *cb_buf)
>  {
>  	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
>  	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
> @@ -559,7 +559,7 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  	u32 tre_len;
>  	int ret;
>  
> -	buf_left = skb->len;
> +	buf_left = len;
>  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
>  
>  	mutex_lock(&mhi_chan->lock);
> @@ -582,13 +582,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  		tre_len = MHI_TRE_DATA_GET_LEN(el);
>  
>  		tr_len = min(buf_left, tre_len);
> -		read_offset = skb->len - buf_left;
> +		read_offset = len - buf_left;
>  
> -		buf_info.dev_addr = skb->data + read_offset;
> +		buf_info.dev_addr = buf + read_offset;
>  		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
>  		buf_info.size = tr_len;
>  		buf_info.cb = mhi_ep_skb_completion;
> -		buf_info.cb_buf = skb;
> +		buf_info.cb_buf = cb_buf;
>  		buf_info.mhi_dev = mhi_dev;
>  
>  		/*
> @@ -627,8 +627,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  
>  	return ret;
>  }
> +
> +int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> +{
> +	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
> +}
>  EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
>  
> +int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
> +{
> +	return mhi_ep_queue(mhi_dev, buf, len, buf);
> +}
> +EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
> +
>  static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
>  {
>  	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
> diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
> index 7b40fc8cbe77ab8419d167e89264b69a817b9fb1..7186eb667b081009927af48513519084fb0be3a6 100644
> --- a/include/linux/mhi_ep.h
> +++ b/include/linux/mhi_ep.h
> @@ -302,4 +302,14 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
>   */
>  int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
>  
> +/**
> + * mhi_ep_queue_buf - Send buffer to host over MHI Endpoint
> + * @mhi_dev: Device associated with the DL channel
> + * @buf: Buffer to be queued
> + * @len: Size of the buffer
> + *
> + * Return: 0 if the buffer has been sent successfully, a negative error code otherwise.

Sent or queued?

Regards,
Bjorn

> + */
> +int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
> +
>  #endif
> 
> -- 
> 2.34.1
> 
> 

