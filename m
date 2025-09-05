Return-Path: <linux-arm-msm+bounces-72319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA4B45BFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07FFC1CC7201
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333EF1991C9;
	Fri,  5 Sep 2025 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuHsIsWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E6C31B83B;
	Fri,  5 Sep 2025 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084831; cv=none; b=eZ+NR75H2h+kKLaT5GhFEuVJnYt0du6IecFfZkX75xBiua8vO+dUuNTar0lMitolBENFyAs2ebYoA2sqSNVvYlO9dXZuVPR5tTgHtxatonKAX7QBMWzEZhNX3sGUpkK32PrJLmuPHMVvALV2lckr6RzPZrCoE9Qs5Gx+//rkzaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084831; c=relaxed/simple;
	bh=DEKYvgIIgXIMpr/uTX+LEAS6Q2DGtqKgYOgRXgbXI3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXViz4pljiHtMR7W7Q9lbKhna7/aPt+V+PY5LXvUbVYDOinz2GJvkYK8+1Arlsp1Zud3brNU+voRa1M8Hq0GKA0R+1j6EgEW9g2IXpjqOjHKN9K1LIfMUfJ/iil8XnD0+d+0yMbNO158xuaVJYVaozFwL6qb1d3ddqEWITGHDes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuHsIsWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEE4C4CEF1;
	Fri,  5 Sep 2025 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757084830;
	bh=DEKYvgIIgXIMpr/uTX+LEAS6Q2DGtqKgYOgRXgbXI3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuHsIsWjuYPIa6EBXLaqBE3y5QchSogHZ9/62uP1RU8+MjuV8M0gtbtpiGK2jSu9P
	 s//AnQkLCc8KBD6mZ4tHrrihIvhPc5+qAY2CvGUhmbu7zXp9FoDeXCPJstyZhE1COa
	 vBMljlSyv8AaqIsxIhKQGSl4Ma/UZG4HSWhUrIXSa4PTrYdaCg7I/pmvakkhmtVdqU
	 Y5jcaQeyZVi0pqjXM62iLs3sU1VjLBdW8RunwaFRKx10v/71yDIBo1hHRYPvYXB9tB
	 KpxwGkvB1N1cymhr4tayM99faCGHlGX5mVQaQ+QgL8ER1QSpFDnjWpu1J+fB4nG/M+
	 aIFvkdnmgCyrg==
Date: Fri, 5 Sep 2025 20:37:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_akhvin@quicinc.com, 
	quic_skananth@quicinc.com, quic_vbadigan@quicinc.com, Sumit Kumar <sumk@qti.qualcomm.com>, 
	stable@vger.kernel.org, Akhil Vinod <akhvin@qti.qualcomm.com>
Subject: Re: [PATCH v2] bus: mhi: ep: Fix chained transfer handling in read
 path
Message-ID: <gdre46l3e3tpviqwly75d6zgoig2ijq3v4au6lwnenpqlhgxh6@xrihqbolefnq>
References: <20250822-chained_transfer-v2-1-7aeb5ac215b6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822-chained_transfer-v2-1-7aeb5ac215b6@quicinc.com>

On Fri, Aug 22, 2025 at 02:54:18PM GMT, Sumit Kumar wrote:
> From: Sumit Kumar <sumk@qti.qualcomm.com>
> 
> The current implementation of mhi_ep_read_channel, in case of chained
> transactions, assumes the End of Transfer(EOT) bit is received with the
> doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
> beyond wr_offset during host-to-device transfers when EOT has not yet
> arrived. This can lead to access of unmapped host memory, causing
> IOMMU faults and processing of stale TREs.
> 
> This change modifies the loop condition to ensure mhi_queue is not empty,
> allowing the function to process only valid TREs up to the current write
> pointer. This prevents premature reads and ensures safe traversal of
> chained TREs.
> 
> Removed buf_left from the while loop condition to avoid exiting prematurely
> before reading the ring completely.
> 
> Removed write_offset since it will always be zero because the new cache
> buffer is allocated everytime.
> 

Could you please write the description in imperative mood and also as a
continuous paragraph?

Change LGTM!

- Mani

> Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
> Cc: stable@vger.kernel.org
> Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
> ---
> Changes in v2:
> - Use mhi_ep_queue_is_empty in while loop (Mani).
> - Remove do while loop in mhi_ep_process_ch_ring (Mani).
> - Remove buf_left, wr_offset, tr_done.
> - Haven't added Reviewed-by as there is change in logic.
> - Link to v1: https://lore.kernel.org/r/20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com
> ---
>  drivers/bus/mhi/ep/main.c | 37 ++++++++++++-------------------------
>  1 file changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..cdea24e9291959ae0a92487c1b9698dc8164d2f1 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -403,17 +403,13 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>  {
>  	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ring->ch_id];
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	size_t tr_len, read_offset, write_offset;
> +	size_t tr_len, read_offset;
>  	struct mhi_ep_buf_info buf_info = {};
>  	u32 len = MHI_EP_DEFAULT_MTU;
>  	struct mhi_ring_element *el;
> -	bool tr_done = false;
>  	void *buf_addr;
> -	u32 buf_left;
>  	int ret;
>  
> -	buf_left = len;
> -
>  	do {
>  		/* Don't process the transfer ring if the channel is not in RUNNING state */
>  		if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
> @@ -426,24 +422,23 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>  		/* Check if there is data pending to be read from previous read operation */
>  		if (mhi_chan->tre_bytes_left) {
>  			dev_dbg(dev, "TRE bytes remaining: %u\n", mhi_chan->tre_bytes_left);
> -			tr_len = min(buf_left, mhi_chan->tre_bytes_left);
> +			tr_len = min(len, mhi_chan->tre_bytes_left);
>  		} else {
>  			mhi_chan->tre_loc = MHI_TRE_DATA_GET_PTR(el);
>  			mhi_chan->tre_size = MHI_TRE_DATA_GET_LEN(el);
>  			mhi_chan->tre_bytes_left = mhi_chan->tre_size;
>  
> -			tr_len = min(buf_left, mhi_chan->tre_size);
> +			tr_len = min(len, mhi_chan->tre_size);
>  		}
>  
>  		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
> -		write_offset = len - buf_left;
>  
>  		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL);
>  		if (!buf_addr)
>  			return -ENOMEM;
>  
>  		buf_info.host_addr = mhi_chan->tre_loc + read_offset;
> -		buf_info.dev_addr = buf_addr + write_offset;
> +		buf_info.dev_addr = buf_addr;
>  		buf_info.size = tr_len;
>  		buf_info.cb = mhi_ep_read_completion;
>  		buf_info.cb_buf = buf_addr;
> @@ -459,16 +454,12 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>  			goto err_free_buf_addr;
>  		}
>  
> -		buf_left -= tr_len;
>  		mhi_chan->tre_bytes_left -= tr_len;
>  
> -		if (!mhi_chan->tre_bytes_left) {
> -			if (MHI_TRE_DATA_GET_IEOT(el))
> -				tr_done = true;
> -
> +		if (!mhi_chan->tre_bytes_left)
>  			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
> -		}
> -	} while (buf_left && !tr_done);
> +	/* Read until the some buffer is left or the ring becomes not empty */
> +	} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
>  
>  	return 0;
>  
> @@ -502,15 +493,11 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
>  		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>  	} else {
>  		/* UL channel */
> -		do {
> -			ret = mhi_ep_read_channel(mhi_cntrl, ring);
> -			if (ret < 0) {
> -				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
> -				return ret;
> -			}
> -
> -			/* Read until the ring becomes empty */
> -		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
> +		ret = mhi_ep_read_channel(mhi_cntrl, ring);
> +		if (ret < 0) {
> +			dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
> 
> ---
> base-commit: 4c06e63b92038fadb566b652ec3ec04e228931e8
> change-id: 20250709-chained_transfer-0b95f8afa487
> 
> Best regards,
> -- 
> Sumit Kumar <quic_sumk@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

