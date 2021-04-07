Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526583562D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 07:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244465AbhDGFF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 01:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348549AbhDGFF6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 01:05:58 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F90C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 22:05:48 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id l123so10523448pfl.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 22:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v1EbD4K5+ZpWVviiRiexwAVWwPlInM5vPeGVWeHHASY=;
        b=YBp9fyCEC8aVk/aQfLyQqYsm0CSq3/xmquVD+YjKYRMRWbPdk83zBZ/XEVmFdPr8fm
         VIEdxoQ+lvgeoto4KE41aChQ/+a/RKijez0cM774a4CzCAVeVKEWOAhNKj61UOc/b217
         vY0h9lLREemGIzzPLGKOP8FX2q4aUQKOQuWlUUy2xXnFQkG2IFdW7dgb9FRgRFcpZCg0
         tVNE3a2ZYVbsQ4GH0aZ3PK06MfIkDp2qD4bk4txYrU7cEhZE/AmunZtiBxKthQSxGL5r
         8fCDhBx4gjiZ49PsJZhAjTBZVpnYxHbdJ84SBgWl+nU/cmelDO1zdiCim0FUXFXz5U0X
         wZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v1EbD4K5+ZpWVviiRiexwAVWwPlInM5vPeGVWeHHASY=;
        b=GM+yOM0T0aTiSgQYFnOG6682ehQL+eTzl9uOH6Hxq54wlWO0+7+ZKIbDIGFelhL+4c
         YCkk/38WQr0gubY9665TNfL6WvGPFEr4hqbQ7jRZoIwHuwlcrrYq/P5CwbzxCLmeDnmD
         G2fi+u6p+uZnOvXJGpZ4oCQdjqzPWhPeQlQ1nrl8uBQxUk6+MBmcg+hiV4fz2VPjvzo7
         eP1lkSRrW17MCVk5UCGEYSyQwqWmWsh2bbGVXSRoGArYvpO8gvEC3zkR+tEztxyn6YJK
         7q7GRlTooJugb4sUuZkmXRNUYpyCXoOswJzij72OkrB8E8WFZCfSlrudK3ifOsE6kyvp
         /R+g==
X-Gm-Message-State: AOAM531XTzIpg0WU7L9L/AqZTKeY/NCOtuYtHPHuIprdK6QIk2szLsTk
        FXNxXbFMVrckelEYPEF5y00rSUHiglF4
X-Google-Smtp-Source: ABdhPJw+1h2A346rNL1K65aCM5og/W9kT11xWu3+Tvdm1KmrZhLjLPGDTaFYqn2N7wOVqKFfcaq2GQ==
X-Received: by 2002:a62:bd03:0:b029:21d:b680:db15 with SMTP id a3-20020a62bd030000b029021db680db15mr1411811pff.25.1617771947787;
        Tue, 06 Apr 2021 22:05:47 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id f2sm20353479pfq.129.2021.04.06.22.05.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 22:05:46 -0700 (PDT)
Date:   Wed, 7 Apr 2021 10:35:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
Message-ID: <20210407050544.GB8675@work>
References: <1617700315-12492-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617700315-12492-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 06, 2021 at 11:11:54AM +0200, Loic Poulain wrote:
> This change ensures that PM reference is always get during packet
> queueing and released either after queuing completion (RX) or once
> the buffer has been consumed (TX). This guarantees proper update for
> underlying MHI controller runtime status (e.g. last_busy timestamp)
> and prevents suspend to be triggered while TX packets are flying,
> or before we completed update of the RX ring.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: mhi_reset_data_chan: move put under existing DMA_TO_DEVICE if block
> 
>  drivers/bus/mhi/core/main.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index c780234..6e72239 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -584,8 +584,11 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  			/* notify client */
>  			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>  
> -			if (mhi_chan->dir == DMA_TO_DEVICE)
> +			if (mhi_chan->dir == DMA_TO_DEVICE) {
>  				atomic_dec(&mhi_cntrl->pending_pkts);
> +				/* Release the reference got from mhi_queue() */
> +				mhi_cntrl->runtime_put(mhi_cntrl);
> +			}
>  
>  			/*
>  			 * Recycle the buffer if buffer is pre-allocated,
> @@ -1021,9 +1024,11 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  	if (unlikely(ret))
>  		goto exit_unlock;
>  
> -	/* trigger M3 exit if necessary */
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
> +	/* Packet is queued, take a usage ref to exit M3 if necessary
> +	 * for host->device buffer, balanced put is done on buffer completion
> +	 * for device->host buffer, balanced put is after ringing the DB
> +	 */
> +	mhi_cntrl->runtime_get(mhi_cntrl);
>  
>  	/* Assert dev_wake (to exit/prevent M1/M2)*/
>  	mhi_cntrl->wake_toggle(mhi_cntrl);
> @@ -1034,6 +1039,9 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>  		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>  
> +	if (dir == DMA_FROM_DEVICE)
> +		mhi_cntrl->runtime_put(mhi_cntrl);
> +
>  exit_unlock:
>  	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>  
> @@ -1416,8 +1424,11 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
>  	while (tre_ring->rp != tre_ring->wp) {
>  		struct mhi_buf_info *buf_info = buf_ring->rp;
>  
> -		if (mhi_chan->dir == DMA_TO_DEVICE)
> +		if (mhi_chan->dir == DMA_TO_DEVICE) {
>  			atomic_dec(&mhi_cntrl->pending_pkts);
> +			/* Release the reference got from mhi_queue() */
> +			mhi_cntrl->runtime_put(mhi_cntrl);
> +		}
>  
>  		if (!buf_info->pre_mapped)
>  			mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
> -- 
> 2.7.4
> 
