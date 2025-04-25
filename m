Return-Path: <linux-arm-msm+bounces-55537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2BA9BDF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0B751B88182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 05:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B12E1AB6D4;
	Fri, 25 Apr 2025 05:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPgyHwr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA7622A4CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745559636; cv=none; b=JyEXt5/3YdalFjcO5IDbUihztOoe6dh9TSeIFfnfOEI5wdZaZ7O/D5I3r7k7NlBHE31wcf/nIH7datL5xpFi/cEbRmAh7W2pCK5vJjxIV22Yd2anPe0b63AX8e96e0K3TSBKIDnqs1P+n6ID52j1Aavi+iYSYSYJQRrdvmWdLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745559636; c=relaxed/simple;
	bh=HO8HJw1IetjCPzDN/WvudCkLHwaDG9k6bkQYKPYtV3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDF9rwqv6Jlkh3VcAGuOv6l/DnEDLhiTIIVYmSj9JsF7DyViTgMeXMJbx5ymlGXrujY3jqIOktAyldv18Cc0G2twZ1cpIe/xoBRyJC7V1gD7GUexpyTNx2x6cEwf8LM5N7WtKgl/qy3MnaA4WFrPoD9i5W68rHKv98CCDuHCd34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPgyHwr0; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so1288910a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745559633; x=1746164433; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CrB711eZ0ZIEq72Y3qHkV5DYvjiZiIEUOroq3oq1+v8=;
        b=WPgyHwr0llBbign39L/bLWv+SNW8M9QiKdcklVAQtUB55PjekDVak0kj5LlmXhT4lQ
         Q3CKzbcLDF9rvx9dfY5r27FjYBO7wi6MtZIxjFOGJmDqEU2SRE3HMru5UV0ggvukVA74
         WvWTUrVXdXYgPaVbRAa3nLGN8e906mL7u7krBrjTJv7UqRGyQtL+tZqW7NoP1JvxuIIE
         mXwZ9+F8bh0uor0TsE6FvSPrOBOBPgnIv4hwzbvIuiYxsXeNEpyrg+VUJ+GCONBV8k+j
         nQacCNJNlwuLXZgtqXxINoL2IHlsONdtgDfQ4I+AGp6zYHHrYS+KL+I2qPCk5vwEqe3X
         Uorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559633; x=1746164433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrB711eZ0ZIEq72Y3qHkV5DYvjiZiIEUOroq3oq1+v8=;
        b=QkRv3wZtwWd2rtDcVP1xfjcg2E6NhThx9HMAe4pgo3q9F/89fE0GaH7Zt3crBq3kkK
         +UowuKsAg87N7mGXbpyyyMWB9Ydbn6SoHYNXgA1yROv6QYPK0xuX9Vi0XqG3IRVicPkn
         7HS4nxjKnHqJw3kr2imkx36D92rnO9lxfoVv4O8iXHezlT0b22+gi/md1Q3MfOtwt4PS
         jzJab2hkMWzGDkWbivG6M++QSf99idev9meCPOFkBVUINOWOi4pW7IyrmsVMluHW3M+3
         nTVX6GHuvLILtEfWz3vOKpXveLaOuJ1NWz4j+Uq1gg4MzvhAKNqEzgWu+fj72x9Ep/Pz
         DUzA==
X-Forwarded-Encrypted: i=1; AJvYcCXiE4ADyqp9xM0+2m7+thwihPyrXYNuFjJROECfexqR463uU08KSUTq7+E7rmYNya5H1B3z4ChhJTvUX89n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JXKY6ICS5gvzZ//lsk9pPnvRmW5OaBWAXnvhQwpQzX31sk7Y
	s0QBDIrBZYWVNbtfdaHMzDD+hQMQZB9P6N9mGyjkgXhuSp8uTuj2HbXfxrYmrQ==
X-Gm-Gg: ASbGnctlFP7C7C0tO9DhG/rinLp+YQWZtumCW23Mb/tb56F+4S1PWwR4D66h04XGNy5
	AlI8SEEhlgPP4wlZ3YSgpD1fuM0baXffknNsIaU2h2ofbHO+pA6PeJ7TSS0ZHMM5dLftVZbw136
	7o4sY7vWTsDAi/hM2MEMcVbl7Ja7kHVm9xThKvBw7QOcxa7KPf4gITH7y1V5E+GpRyppF/8o2AO
	kidV2UPngCa6dP/vKij6mOurBziIT6xmpMTUEVyxQLpudHjl+qHYV36EDmWjS8Bn4X2p/h7qAyN
	fNroXm1wRsIiwUa1kegn74cKGTsCU836m58YZctS9xR5RMMQuRQ=
X-Google-Smtp-Source: AGHT+IGOuiaUIOPghZa+Vx84GDx8VBr5BQ6KitGS6V3OicgZ+Up7OCkxsjNwKaQFaSGyVm53FlNRSA==
X-Received: by 2002:a17:90a:bb8f:b0:305:5f32:d9f0 with SMTP id 98e67ed59e1d1-309f8db391amr1003820a91.19.1745559632688;
        Thu, 24 Apr 2025 22:40:32 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124675sm2766383a91.30.2025.04.24.22.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:40:32 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:10:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <qjgzfuzb57etwsblgsdnek6pmw4c5ickt2yaiprqzskhjwr2zb@vwstguwle4m4>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> MHI control configurations such as channel context, event context, command
> context and rings, are currently allocated individually. During MHI
> initialization MHI bus driver needs to configure the address space in
> which this control configuration resides. Since different component of the
> config is being allocated separately, only logical solution is to give the
> entire RAM address space, as they could be anywhere.
> 
> As per MHI specification the MHI control configuration address space should
> not be more them 4GB.

Could you please add the spec limitation here as you described in your reply?

> 
> Since the current implementation is in violation of MHI specification.

Here too.

> Allocate a single giant DMA buffer for MHI control configurations and
> limit the configuration address space to that buffer.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Other than that, patch looks good to me.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/init.c     | 259 +++++++++++++++++---------------
>  drivers/bus/mhi/host/internal.h |   1 -
>  include/linux/mhi.h             |   7 +
>  3 files changed, 143 insertions(+), 124 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 13e7a55f54ff..03afbfb8a96f 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -159,21 +159,21 @@ static struct attribute *mhi_dev_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(mhi_dev);
>  
> -/* MHI protocol requires the transfer ring to be aligned with ring length */
> -static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
> -				  struct mhi_ring *ring,
> -				  u64 len)
> +static void mhi_init_ring_base(struct mhi_ring *ring)
>  {
> -	ring->alloc_size = len + (len - 1);
> -	ring->pre_aligned = dma_alloc_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
> -					       &ring->dma_handle, GFP_KERNEL);
> -	if (!ring->pre_aligned)
> -		return -ENOMEM;
> -
> -	ring->iommu_base = (ring->dma_handle + (len - 1)) & ~(len - 1);
> +	ring->iommu_base = (ring->dma_handle + (ring->len - 1)) & ~(ring->len - 1);
>  	ring->base = ring->pre_aligned + (ring->iommu_base - ring->dma_handle);
> +}
>  
> -	return 0;
> +/* MHI protocol requires the transfer ring to be aligned with ring length */
> +static void mhi_init_ring(struct mhi_controller *mhi_cntrl, struct mhi_ring *ring,
> +			  size_t el_size, size_t offset)
> +{
> +	ring->el_size = el_size;
> +	ring->len = ring->el_size * ring->elements;
> +	ring->pre_aligned = mhi_cntrl->ctrl_config_base + offset;
> +	ring->dma_handle = mhi_cntrl->ctrl_config_dma + offset;
> +	mhi_init_ring_base(ring);
>  }
>  
>  void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
> @@ -265,40 +265,134 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
>  	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
>  		ring = &mhi_cmd->ring;
> -		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
> -				  ring->pre_aligned, ring->dma_handle);
>  		ring->base = NULL;
>  		ring->iommu_base = 0;
>  	}
>  
> -	dma_free_coherent(mhi_cntrl->cntrl_dev,
> -			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
> -			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
> -
>  	mhi_event = mhi_cntrl->mhi_event;
>  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>  		if (mhi_event->offload_ev)
>  			continue;
>  
>  		ring = &mhi_event->ring;
> -		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
> -				  ring->pre_aligned, ring->dma_handle);
>  		ring->base = NULL;
>  		ring->iommu_base = 0;
>  	}
>  
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
> -			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
> -			  mhi_ctxt->er_ctxt_addr);
> -
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
> -			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
> -			  mhi_ctxt->chan_ctxt_addr);
> -
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_cntrl->ctrl_config_size,
> +			  mhi_cntrl->ctrl_config_base, mhi_cntrl->ctrl_config_dma);
>  	kfree(mhi_ctxt);
>  	mhi_cntrl->mhi_ctxt = NULL;
>  }
>  
> +/*
> + * Control Configuration Address Space Layout
> + *              +------------------------------------------+
> + *              |              Channel Context             |
> + *              +------------------------------------------+
> + *              |           Array of Channel Rings         |
> + *              +------------------------------------------+
> + *              |              Event Context               |
> + *              +------------------------------------------+
> + *              |           Array of Event Rings           |
> + *              +------------------------------------------+
> + *              |              Command Context             |
> + *              +------------------------------------------+
> + *              |           Array of Command Rings         |
> + *              +------------------------------------------+
> + */
> +static int mhi_alloc_control_space(struct mhi_controller *mhi_cntrl, struct mhi_ctxt *mhi_ctxt)
> +{
> +	size_t chan_ctxt_offset, cmd_ctxt_offset, er_ctxt_offset;
> +	size_t chan_ctxt_size, cmd_ctxt_size, er_ctxt_size;
> +	size_t el_size = sizeof(struct mhi_ring_element);
> +	u32 ev_rings = mhi_cntrl->total_ev_rings;
> +	struct mhi_event *mhi_event;
> +	size_t alloc_size, offset = 0;
> +	struct mhi_chan *mhi_chan;
> +	struct mhi_cmd *mhi_cmd;
> +	struct mhi_ring *ring;
> +	int i;
> +
> +	chan_ctxt_offset = offset;
> +	chan_ctxt_size = sizeof(*mhi_ctxt->chan_ctxt) * mhi_cntrl->max_chan;
> +	chan_ctxt_size = PAGE_ALIGN(chan_ctxt_size);
> +	offset += chan_ctxt_size;
> +	for (i = 0, mhi_chan = mhi_cntrl->mhi_chan; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
> +		ring = &mhi_chan->tre_ring;
> +		if (!ring->elements)
> +			continue;
> +		alloc_size = ring->elements * el_size;
> +		alloc_size = PAGE_ALIGN(alloc_size << 1);
> +		/* Temporarily save offset here */
> +		ring->pre_aligned = (void *)offset;
> +		offset += alloc_size;
> +	}
> +
> +	er_ctxt_offset = offset;
> +	er_ctxt_size = sizeof(*mhi_ctxt->er_ctxt) * ev_rings;
> +	er_ctxt_size = PAGE_ALIGN(er_ctxt_size);
> +	offset += er_ctxt_size;
> +	for (i = 0, mhi_event = mhi_cntrl->mhi_event; i < ev_rings; i++, mhi_event++) {
> +		ring = &mhi_event->ring;
> +		alloc_size = ring->elements * el_size;
> +		alloc_size = PAGE_ALIGN(alloc_size << 1);
> +		/* Temporarily save offset here */
> +		ring->pre_aligned = (void *)offset;
> +		offset += alloc_size;
> +	}
> +
> +	cmd_ctxt_offset = offset;
> +	cmd_ctxt_size = sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS;
> +	cmd_ctxt_size = PAGE_ALIGN(cmd_ctxt_size);
> +	offset += cmd_ctxt_size;
> +	for (i = 0, mhi_cmd = mhi_cntrl->mhi_cmd; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
> +		ring = &mhi_cmd->ring;
> +		alloc_size = CMD_EL_PER_RING * el_size;
> +		alloc_size = PAGE_ALIGN(alloc_size << 1);
> +		/* Temporarily save offset here */
> +		ring->pre_aligned = (void *)offset;
> +		offset += alloc_size;
> +	}
> +
> +	mhi_cntrl->ctrl_config_size = offset;
> +	mhi_cntrl->ctrl_config_base = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
> +							 mhi_cntrl->ctrl_config_size,
> +							 &mhi_cntrl->ctrl_config_dma,
> +							 GFP_KERNEL);
> +	if (!mhi_cntrl->ctrl_config_base)
> +		return -ENOMEM;
> +
> +	/* Setup channel ctxt */
> +	mhi_ctxt->chan_ctxt = mhi_cntrl->ctrl_config_base + chan_ctxt_offset;
> +	mhi_ctxt->chan_ctxt_addr = mhi_cntrl->ctrl_config_dma + chan_ctxt_offset;
> +	for (i = 0, mhi_chan = mhi_cntrl->mhi_chan; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
> +		ring = &mhi_chan->tre_ring;
> +		if (!ring->elements)
> +			continue;
> +		mhi_init_ring(mhi_cntrl, ring, el_size, (size_t)ring->pre_aligned);
> +	}
> +
> +	/* Setup event context */
> +	mhi_ctxt->er_ctxt = mhi_cntrl->ctrl_config_base + er_ctxt_offset;
> +	mhi_ctxt->er_ctxt_addr = mhi_cntrl->ctrl_config_dma + er_ctxt_offset;
> +	for (i = 0, mhi_event = mhi_cntrl->mhi_event; i < ev_rings; i++, mhi_event++) {
> +		ring = &mhi_event->ring;
> +		mhi_init_ring(mhi_cntrl, ring, el_size, (size_t)ring->pre_aligned);
> +	}
> +
> +	/* Setup cmd context */
> +	mhi_ctxt->cmd_ctxt = mhi_cntrl->ctrl_config_base + cmd_ctxt_offset;
> +	mhi_ctxt->cmd_ctxt_addr = mhi_cntrl->ctrl_config_dma + cmd_ctxt_offset;
> +	for (i = 0, mhi_cmd = mhi_cntrl->mhi_cmd; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
> +		ring = &mhi_cmd->ring;
> +		ring->elements = CMD_EL_PER_RING;
> +		mhi_init_ring(mhi_cntrl, ring, el_size, (size_t)ring->pre_aligned);
> +	}
> +
> +	return 0;
> +}
> +
>  int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  {
>  	struct mhi_ctxt *mhi_ctxt;
> @@ -309,7 +403,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	struct mhi_event *mhi_event;
>  	struct mhi_cmd *mhi_cmd;
>  	u32 tmp;
> -	int ret = -ENOMEM, i;
> +	int ret, i;
>  
>  	atomic_set(&mhi_cntrl->dev_wake, 0);
>  	atomic_set(&mhi_cntrl->pending_pkts, 0);
> @@ -318,14 +412,12 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	if (!mhi_ctxt)
>  		return -ENOMEM;
>  
> -	/* Setup channel ctxt */
> -	mhi_ctxt->chan_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
> -						 sizeof(*mhi_ctxt->chan_ctxt) *
> -						 mhi_cntrl->max_chan,
> -						 &mhi_ctxt->chan_ctxt_addr,
> -						 GFP_KERNEL);
> -	if (!mhi_ctxt->chan_ctxt)
> -		goto error_alloc_chan_ctxt;
> +	/* Allocate control configuration */
> +	ret = mhi_alloc_control_space(mhi_cntrl, mhi_ctxt);
> +	if (ret) {
> +		kfree(mhi_ctxt);
> +		return ret;
> +	}
>  
>  	mhi_chan = mhi_cntrl->mhi_chan;
>  	chan_ctxt = mhi_ctxt->chan_ctxt;
> @@ -350,15 +442,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  		mhi_chan->tre_ring.db_addr = (void __iomem *)&chan_ctxt->wp;
>  	}
>  
> -	/* Setup event context */
> -	mhi_ctxt->er_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
> -					       sizeof(*mhi_ctxt->er_ctxt) *
> -					       mhi_cntrl->total_ev_rings,
> -					       &mhi_ctxt->er_ctxt_addr,
> -					       GFP_KERNEL);
> -	if (!mhi_ctxt->er_ctxt)
> -		goto error_alloc_er_ctxt;
> -
>  	er_ctxt = mhi_ctxt->er_ctxt;
>  	mhi_event = mhi_cntrl->mhi_event;
>  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
> @@ -379,12 +462,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  		er_ctxt->msivec = cpu_to_le32(mhi_event->irq);
>  		mhi_event->db_cfg.db_mode = true;
>  
> -		ring->el_size = sizeof(struct mhi_ring_element);
> -		ring->len = ring->el_size * ring->elements;
> -		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
> -		if (ret)
> -			goto error_alloc_er;
> -
>  		/*
>  		 * If the read pointer equals to the write pointer, then the
>  		 * ring is empty
> @@ -396,28 +473,10 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  		ring->ctxt_wp = &er_ctxt->wp;
>  	}
>  
> -	/* Setup cmd context */
> -	ret = -ENOMEM;
> -	mhi_ctxt->cmd_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
> -						sizeof(*mhi_ctxt->cmd_ctxt) *
> -						NR_OF_CMD_RINGS,
> -						&mhi_ctxt->cmd_ctxt_addr,
> -						GFP_KERNEL);
> -	if (!mhi_ctxt->cmd_ctxt)
> -		goto error_alloc_er;
> -
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
>  	cmd_ctxt = mhi_ctxt->cmd_ctxt;
>  	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
>  		struct mhi_ring *ring = &mhi_cmd->ring;
> -
> -		ring->el_size = sizeof(struct mhi_ring_element);
> -		ring->elements = CMD_EL_PER_RING;
> -		ring->len = ring->el_size * ring->elements;
> -		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
> -		if (ret)
> -			goto error_alloc_cmd;
> -
>  		ring->rp = ring->wp = ring->base;
>  		cmd_ctxt->rbase = cpu_to_le64(ring->iommu_base);
>  		cmd_ctxt->rp = cmd_ctxt->wp = cmd_ctxt->rbase;
> @@ -428,43 +487,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	mhi_cntrl->mhi_ctxt = mhi_ctxt;
>  
>  	return 0;
> -
> -error_alloc_cmd:
> -	for (--i, --mhi_cmd; i >= 0; i--, mhi_cmd--) {
> -		struct mhi_ring *ring = &mhi_cmd->ring;
> -
> -		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
> -				  ring->pre_aligned, ring->dma_handle);
> -	}
> -	dma_free_coherent(mhi_cntrl->cntrl_dev,
> -			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
> -			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
> -	i = mhi_cntrl->total_ev_rings;
> -	mhi_event = mhi_cntrl->mhi_event + i;
> -
> -error_alloc_er:
> -	for (--i, --mhi_event; i >= 0; i--, mhi_event--) {
> -		struct mhi_ring *ring = &mhi_event->ring;
> -
> -		if (mhi_event->offload_ev)
> -			continue;
> -
> -		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
> -				  ring->pre_aligned, ring->dma_handle);
> -	}
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
> -			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
> -			  mhi_ctxt->er_ctxt_addr);
> -
> -error_alloc_er_ctxt:
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
> -			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
> -			  mhi_ctxt->chan_ctxt_addr);
> -
> -error_alloc_chan_ctxt:
> -	kfree(mhi_ctxt);
> -
> -	return ret;
>  }
>  
>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  	struct mhi_event *mhi_event;
>  	void __iomem *base = mhi_cntrl->regs;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl->ctrl_config_size - 1;
>  	struct {
>  		u32 offset;
>  		u32 val;
> @@ -505,11 +528,11 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  		},
>  		{
>  			MHICTRLBASE_HIGHER,
> -			upper_32_bits(mhi_cntrl->iova_start),
> +			upper_32_bits(mhi_cntrl->ctrl_config_dma),
>  		},
>  		{
>  			MHICTRLBASE_LOWER,
> -			lower_32_bits(mhi_cntrl->iova_start),
> +			lower_32_bits(mhi_cntrl->ctrl_config_dma),
>  		},
>  		{
>  			MHIDATABASE_HIGHER,
> @@ -521,11 +544,11 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  		},
>  		{
>  			MHICTRLLIMIT_HIGHER,
> -			upper_32_bits(mhi_cntrl->iova_stop),
> +			upper_32_bits(mhi_ctrl_limit),
>  		},
>  		{
>  			MHICTRLLIMIT_LOWER,
> -			lower_32_bits(mhi_cntrl->iova_stop),
> +			lower_32_bits(mhi_ctrl_limit),
>  		},
>  		{
>  			MHIDATALIMIT_HIGHER,
> @@ -622,8 +645,6 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  	if (!chan_ctxt->rbase) /* Already uninitialized */
>  		return;
>  
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
> -			  tre_ring->pre_aligned, tre_ring->dma_handle);
>  	vfree(buf_ring->base);
>  
>  	buf_ring->base = tre_ring->base = NULL;
> @@ -649,26 +670,18 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  	struct mhi_ring *tre_ring;
>  	struct mhi_chan_ctxt *chan_ctxt;
>  	u32 tmp;
> -	int ret;
>  
>  	buf_ring = &mhi_chan->buf_ring;
>  	tre_ring = &mhi_chan->tre_ring;
> -	tre_ring->el_size = sizeof(struct mhi_ring_element);
> -	tre_ring->len = tre_ring->el_size * tre_ring->elements;
>  	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
> -	ret = mhi_alloc_aligned_ring(mhi_cntrl, tre_ring, tre_ring->len);
> -	if (ret)
> -		return -ENOMEM;
> +	mhi_init_ring_base(tre_ring);
>  
>  	buf_ring->el_size = sizeof(struct mhi_buf_info);
>  	buf_ring->len = buf_ring->el_size * buf_ring->elements;
>  	buf_ring->base = vzalloc(buf_ring->len);
>  
> -	if (!buf_ring->base) {
> -		dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
> -				  tre_ring->pre_aligned, tre_ring->dma_handle);
> +	if (!buf_ring->base)
>  		return -ENOMEM;
> -	}
>  
>  	tmp = le32_to_cpu(chan_ctxt->chcfg);
>  	tmp &= ~CHAN_CTX_CHSTATE_MASK;
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index ce566f7d2e92..bedaf248c49a 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -215,7 +215,6 @@ struct mhi_ring {
>  	size_t el_size;
>  	size_t len;
>  	size_t elements;
> -	size_t alloc_size;
>  	void __iomem *db_addr;
>  };
>  
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 059dc94d20bb..eb5e0181bea7 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -325,6 +325,9 @@ struct mhi_controller_config {
>   * @mhi_event: MHI event ring configurations table
>   * @mhi_cmd: MHI command ring configurations table
>   * @mhi_ctxt: MHI device context, shared memory between host and device
> + * @ctrl_config_size: Total allocated size of control configuration buffer
> + * @ctrl_config_dma: Base bus address of control configuration buffer
> + * @ctrl_config_base: Base CPU address of control configuration buffer
>   * @pm_mutex: Mutex for suspend/resume operation
>   * @pm_lock: Lock for protecting MHI power management state
>   * @timeout_ms: Timeout in ms for state transitions
> @@ -403,6 +406,10 @@ struct mhi_controller {
>  	struct mhi_cmd *mhi_cmd;
>  	struct mhi_ctxt *mhi_ctxt;
>  
> +	size_t ctrl_config_size;
> +	dma_addr_t ctrl_config_dma;
> +	void *ctrl_config_base;
> +
>  	struct mutex pm_mutex;
>  	rwlock_t pm_lock;
>  	u32 timeout_ms;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

