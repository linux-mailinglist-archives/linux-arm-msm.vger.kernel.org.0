Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528E538C7A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 15:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhEUNSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 09:18:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231601AbhEUNSu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 09:18:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F021861244;
        Fri, 21 May 2021 13:17:23 +0000 (UTC)
Date:   Fri, 21 May 2021 18:47:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: core: Validate channel ID when processing
 command completions
Message-ID: <20210521131719.GH70095@thinkpad>
References: <1619481538-4435-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619481538-4435-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 26, 2021 at 04:58:58PM -0700, Bhaumik Bhatt wrote:
> MHI reads the channel ID from the event ring element sent by the
> device which can be any value between 0 and 255. In order to
> prevent any out of bound accesses, add a check against the maximum
> number of channels supported by the controller and those channels
> not configured yet so as to skip processing of that event ring
> element.
> 
> Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 22acde1..ed07421 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -773,11 +773,16 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>  	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
>  
>  	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
> -	mhi_chan = &mhi_cntrl->mhi_chan[chan];
> -	write_lock_bh(&mhi_chan->lock);
> -	mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
> -	complete(&mhi_chan->completion);
> -	write_unlock_bh(&mhi_chan->lock);
> +	WARN_ON(chan >= mhi_cntrl->max_chan);
> +
> +	if (chan < mhi_cntrl->max_chan &&
> +	    mhi_cntrl->mhi_chan[chan].configured) {
> +		mhi_chan = &mhi_cntrl->mhi_chan[chan];
> +		write_lock_bh(&mhi_chan->lock);
> +		mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
> +		complete(&mhi_chan->completion);
> +		write_unlock_bh(&mhi_chan->lock);
> +	}
>  
>  	mhi_del_ring_element(mhi_cntrl, mhi_ring);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
