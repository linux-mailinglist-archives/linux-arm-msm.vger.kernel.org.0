Return-Path: <linux-arm-msm+bounces-88694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF5D17432
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AB49300B920
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BC937FF5B;
	Tue, 13 Jan 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/z+aM13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F135C1BA;
	Tue, 13 Jan 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292513; cv=none; b=SQpEI9nQYjNw8vClANtZK0+M6qf/rukXn+c1yzJfwkpazpGMeeHtFC9MYGdpk5/HSsGrlz/rJ9CeixPuudYIB88y0O00ZTy92u/hKffv3wHxsmIT6Zo6xlJYrEC7G6uffEbtODx48VdJBHr4D8YTHNSRGk7VhKEUkW8MLOfgELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292513; c=relaxed/simple;
	bh=c43E1951LNrFNUX7/4uU1ywODI1lfTG61JdkpGS9K74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPoNLIwYZxoRd9giu49vkgyqEMrA0p596Yd3GkZ/2kBxfm4kfM2E9cl/1tshG1T/en8BToWcI1/MHuoWqYu3R+n0woG2wMTkuDEmUzHHZ9JCyKD/QpIP8Y39zyla5YR76KuKZSrnqIHCW2Fy87usUSNEi6JYs1gJDREVNz8D8Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/z+aM13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1824AC19421;
	Tue, 13 Jan 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292513;
	bh=c43E1951LNrFNUX7/4uU1ywODI1lfTG61JdkpGS9K74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/z+aM13hM4q6glzzqhBk1N2zKiVoJZ0b1Cxby4ytdDuaemguy8Gvl/xQQrVxi/w8
	 CnLBdUJ0mkgcmba7H2PQ+Sk/bQeZKD4IBk0NPcdoZjbZOgIE0IOMHNJtt39rerKfVV
	 +PpyC7lpqAlO0Zd89sYv4cCEdz+907HFQORfwCtnhT6Xj65csWLTDu7pgWTJ2KNGos
	 VTFJgjc2iCx432e9gtvt8Tgc4FDBdkNwMYlVJl7jdIHhakpa4qo/5/EDW3n5t9nGK9
	 yg83vt8FIZPSHQDO8qeNwOds5KNMfrCHdutpAS6EeLDsMIT6exMgrjcARX4zDHXpKK
	 1hRBZ/1HbOjdA==
Date: Tue, 13 Jan 2026 13:51:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 09/11] bus: mhi: host: Get total descriptor count
Message-ID: <xggno3wbicx3kxxqyjnpqyfiesrit4osvud7bdlpd6wcnbdxtk@fbijrfhiitve>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-9-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-9-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:41PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Introduce a new API to retrieve the length of a transfer ring.
> This API allows clients to query the ring length.
> 

What about mhi_get_free_desc_count()?

- Mani

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/main.c | 11 +++++++++++
>  include/linux/mhi.h         |  9 +++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 9772fb13400c..6be15297829d 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -345,6 +345,17 @@ int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
>  }
>  EXPORT_SYMBOL_GPL(mhi_get_free_desc_count);
>  
> +int mhi_get_total_descriptors(struct mhi_device *mhi_dev,
> +			      enum dma_data_direction dir)
> +{
> +	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
> +				    mhi_dev->ul_chan : mhi_dev->dl_chan;
> +	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
> +
> +	return tre_ring->elements;
> +}
> +EXPORT_SYMBOL(mhi_get_total_descriptors);
> +
>  void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
>  {
>  	struct mhi_driver *mhi_drv;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 66fd83bed306..013bc2d82196 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -620,6 +620,15 @@ void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason);
>  int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
>  				enum dma_data_direction dir);
>  
> +/**
> + * mhi_get_total_descriptors - Get total transfer ring length
> + * Get # of TD available to queue buffers
> + * @mhi_dev: Device associated with the channels
> + * @dir: Direction of the channel
> + */
> +int mhi_get_total_descriptors(struct mhi_device *mhi_dev,
> +			      enum dma_data_direction dir);
> +
>  /**
>   * mhi_prepare_for_power_up - Do pre-initialization before power up.
>   *                            This is optional, call this before power up if
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

