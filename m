Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A645A1CA2E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 07:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgEHFp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 01:45:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:38118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgEHFp1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 01:45:27 -0400
Received: from Mani-XPS-13-9360 (unknown [157.50.45.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BADF20870;
        Fri,  8 May 2020 05:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588916726;
        bh=xl7B0YoVOjHdWRaltXdlzxOy2VDoxVt7dvjedSM273g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WlBDb9EwxfnxqPgTBWTPZiayJ7xbuRHy4SFaU1C2LRHWVtucnjfzHBlw0eupdKSa7
         xa6DR+uUHYfENBxj9hTt00SDnrdYUVjx+29qWFJxBifwvw/NfYxhyLcB7bQRsSzCPU
         xqycww2M1zVHI12F4FbBMa4yl+M7lALgm9nwis40=
Date:   Fri, 8 May 2020 11:15:18 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v6 3/8] bus: mhi: core: Add range check for channel id
 received in event ring
Message-ID: <20200508054518.GA2696@Mani-XPS-13-9360>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
 <1588718832-4891-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588718832-4891-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 05, 2020 at 03:47:07PM -0700, Bhaumik Bhatt wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> MHI data completion handler function reads channel id from event
> ring element. Value is under the control of MHI devices and can be
> any value between 0 and 255. In order to prevent out of bound access
> add a bound check against the max channel supported by controller
> and skip processing of that event ring element.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 605640c..e60ab21 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -776,6 +776,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  		case MHI_PKT_TYPE_TX_EVENT:
>  			chan = MHI_TRE_GET_EV_CHID(local_rp);
>  			mhi_chan = &mhi_cntrl->mhi_chan[chan];

Check should be done before this statement, isn't it?

> +			if (WARN_ON(chan >= mhi_cntrl->max_chan))
> +				goto next_event;
> +

I don't prefer using gotos for non exit paths but I don't have a better solution
here. But you can try to wrap 'WARN_ON' inside the 'MHI_TRE_GET_EV_CHID'
definition and the just use:

			/*
			 * Only process the event ring elements whose channel
			 * ID is within the maximum supported range.
			 */
			if (chan < mhi_cntrl->max_chan) {
                        	mhi_chan = &mhi_cntrl->mhi_chan[chan];
                        	parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
                        	event_quota--;
			}
			break;

This looks more clean.

>  			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
>  			event_quota--;
>  			break;
> @@ -784,6 +787,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  			break;
>  		}
>  
> +next_event:
>  		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
>  		local_rp = ev_ring->rp;
>  		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);

So you want the count to get increased for skipped element also?

Thanks,
Mani

> @@ -820,6 +824,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
>  
>  		chan = MHI_TRE_GET_EV_CHID(local_rp);
> +		if (WARN_ON(chan >= mhi_cntrl->max_chan))
> +			goto next_event;
> +
>  		mhi_chan = &mhi_cntrl->mhi_chan[chan];
>  
>  		if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
> @@ -830,6 +837,7 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  			event_quota--;
>  		}
>  
> +next_event:
>  		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
>  		local_rp = ev_ring->rp;
>  		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
