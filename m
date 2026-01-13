Return-Path: <linux-arm-msm+bounces-88693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A88D17404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E31730084F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DA536E47B;
	Tue, 13 Jan 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujK7UetR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E6E314A89;
	Tue, 13 Jan 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292381; cv=none; b=YHJHXYFDIaoRmGoQfhXSdGKKPDdxaEJ3B1Q9FOGr0UvbeS21a3lZ9M54R2JDks2fT4Sd3l2W8pfmK/X7NvCbGW6T2R79f51CJnL+YW7jlLB6UdaeDaxvnEB7iZH3BNaML8JwjVFRoOWL02yMgHtfgZxQR9QZmyXdl4CXx031//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292381; c=relaxed/simple;
	bh=NmOzlycXV1NJ+Yt40W7uLtaKbz4k2N2YbsIG9hykDm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTKdHa7U8QbDQrhN6OqkeFDrW98/RT4KMnK1aQrDMF3erWV3UC5lTBw4TptEGCzI9pqZin2c3g51Thz+YRBUuJnraQrnbpN5h8EyrYxCldHXDPgyiohz1hlPojefj4FuxluhiJ6ZvambLj14ZQXCSZ1Ndo9xVUPbycv+ySBgtr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujK7UetR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196E9C116C6;
	Tue, 13 Jan 2026 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292381;
	bh=NmOzlycXV1NJ+Yt40W7uLtaKbz4k2N2YbsIG9hykDm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujK7UetR1DPY8grndXzYSPzhtZZUeAcN4wYs6t5iw7Byot/hc9BQ64ZqVJtUTLBkp
	 O9pSRjfiK7hm5tUysy8rSEDF3A/W3zHbl3jaMr+zGzYD4QB8XuogLjxwDhDz//V7fl
	 NLWJaKVtp6Nm6+Zz7iKHKN+7xoIfVQAwV6P7u6VpheP8tmk/hT8gMUJIJdKSruq4m5
	 zRehrloBsHWHGA1nobYmY6y63996vR5XbTvGLSmY9iRp/PvqfrNRlusSGO7Dg9dUB1
	 1tYUsCLVDmZW8i8oNq7Q1od6UnDgz0JSpxVk83Uq44eQl98DugPR91CV4hMblHad0O
	 cA8AU965R4j3Q==
Date: Tue, 13 Jan 2026 13:49:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 08/11] bus: mhi: MHI CB support for Channel error
 notification
Message-ID: <3a32ffif2mo3dycw7h4fzvrdwbmbtboxhtpl2wjru425lxqvzr@fnfehgdd5ycf>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-8-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-8-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:40PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> If a device reports an error on any channel, it sends a
> CH_ERROR_EVENT over the control event ring. Update the host to
> parse the entire channel list, check the channel context ring
> for CH_STATE_ERROR, and notify the client. This enables the
> client driver to take appropriate action as needed.
> 

What scenarios could lead to the device sending this channel error event?

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h    |  1 +
>  drivers/bus/mhi/host/main.c | 24 ++++++++++++++++++++++++
>  include/linux/mhi.h         |  2 ++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index 31ff4d2e6eba..3b3ecbc6169f 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -230,6 +230,7 @@ enum mhi_pkt_type {
>  	MHI_PKT_TYPE_TX_EVENT = 0x22,
>  	MHI_PKT_TYPE_RSC_TX_EVENT = 0x28,
>  	MHI_PKT_TYPE_EE_EVENT = 0x40,
> +	MHI_PKT_TYPE_CH_ERROR_EVENT = 0x41,
>  	MHI_PKT_TYPE_TSYNC_EVENT = 0x48,
>  	MHI_PKT_TYPE_BW_REQ_EVENT = 0x50,
>  	MHI_PKT_TYPE_STALE_EVENT, /* internal event */
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 53bb93da4017..9772fb13400c 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -798,6 +798,27 @@ static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
>  	return 0;
>  }
>  
> +static void mhi_process_channel_error(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_chan *mhi_chan;
> +	struct mhi_chan_ctxt *chan_ctxt;
> +	struct mhi_device *mhi_dev;
> +	int i;
> +
> +	mhi_chan = mhi_cntrl->mhi_chan;
> +	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
> +		chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
> +
> +		if ((chan_ctxt->chcfg & CHAN_CTX_CHSTATE_MASK) == MHI_CH_STATE_ERROR) {
> +			dev_err(&mhi_cntrl->mhi_dev->dev,

You should use the channel mhi_dev.

> +				"ch_id:%d is moved to error state by device", mhi_chan->chan);

"Channel entered error state"

- Mani

> +				mhi_dev = mhi_chan->mhi_dev;
> +			if (mhi_dev)
> +				mhi_notify(mhi_dev, MHI_CB_CHANNEL_ERROR);
> +		}
> +	}
> +}
> +
>  static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>  				       struct mhi_ring_element *tre)
>  {
> @@ -961,6 +982,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  
>  			break;
>  		}
> +		case MHI_PKT_TYPE_CH_ERROR_EVENT:
> +			mhi_process_channel_error(mhi_cntrl);
> +			break;
>  		case MHI_PKT_TYPE_TX_EVENT:
>  			chan = MHI_TRE_GET_EV_CHID(local_rp);
>  
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 926a20835467..66fd83bed306 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -34,6 +34,7 @@ struct mhi_buf_info;
>   * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
>   * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
>   * @MHI_CB_BW_REQ: Received a bandwidth switch request from device
> + * @MHI_CB_CHANNEL_ERROR: MHI channel entered error state from device
>   */
>  enum mhi_callback {
>  	MHI_CB_IDLE,
> @@ -45,6 +46,7 @@ enum mhi_callback {
>  	MHI_CB_SYS_ERROR,
>  	MHI_CB_FATAL_ERROR,
>  	MHI_CB_BW_REQ,
> +	MHI_CB_CHANNEL_ERROR,
>  };
>  
>  /**
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

