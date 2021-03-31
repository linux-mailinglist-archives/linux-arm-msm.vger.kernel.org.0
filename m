Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96AD350543
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 19:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhCaRN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 13:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaRM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 13:12:57 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4052DC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 10:12:57 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id ay2so8235303plb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z3+8hPiPx8bVU1yZj+P8PIPaGQrYTj5Jj/muY7V4UIE=;
        b=dP2bCxd8Mdqq7IhxLvaNx4gtCmCvbrlHjPgixIOW9DWgwCHkwTpBjzEGF5kT0buDql
         28wd77NeXfL4hTCqNQpiU8rErRBQktGg9bDqjLFvEnteLxQp3RVoHnpMj1bljVoUGdqC
         YNBg0brvuaL6nBkMjEQ8eb3WceetM2pwhkmc2l4LXkaQAPGwHaFEdZO34osBYl+ayEBy
         Ht7FYVWNaexK16G0zSidpi4CQIhWUgLUrXchrK8iMkJ/8kBweSgixxBy923hZGOk/nBy
         ABRpRCA9YC7Th2m10ds4Fp9sGLSa8kZuHfvAlwGicQNsjMrUQBr+STc4i7J8HcPKcEdv
         nzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z3+8hPiPx8bVU1yZj+P8PIPaGQrYTj5Jj/muY7V4UIE=;
        b=Lo0beTwJB9SncCulYKiMfsT+PSCuut+2Hml9FCMgo/KHQJrEsWnSlNRAj3S/oJ2egw
         5TSuzFjAHDg9vH1pbG3U3vK53B9+q1zvJ+ETiCVUYfQWkI7DVdJs080bCzv/q5d7xfgd
         9k7DIj7ffTNNbf9Pw8E0wsAXq6COqacU1xV6r2qaAsUr/3w530MherkyfpOYcSGUe971
         m+osL63c+n6kVkE3QKFcDH1GhJLNxanI29Bvbs/iw2TgYXDsPdtKi0BG9VHKykn0vzIU
         ulMaANoZlSvVN+uWAUkD56iLVADNP+1Q797XUYXwnqccF22jxLSiUfHBw1Tl8pYolGoz
         OsOQ==
X-Gm-Message-State: AOAM533mAFFhAWqt/lmb9fSbbzidOusAgnslGuOxzzx/KbH57ZvvvdeV
        EKwSbqzcl19HjvPLJs23Phci+20HhoIBg78=
X-Google-Smtp-Source: ABdhPJz0aBRJkwwRX/UfUf6WwDVw8VXL79bbtE5huXUJr/RCUgrrsZhneu0oUeEAILGMPaohYoWzUw==
X-Received: by 2002:a17:902:a587:b029:e7:347d:4872 with SMTP id az7-20020a170902a587b02900e7347d4872mr4240614plb.2.1617210776614;
        Wed, 31 Mar 2021 10:12:56 -0700 (PDT)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id o18sm2694802pji.10.2021.03.31.10.12.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 10:12:55 -0700 (PDT)
Date:   Wed, 31 Mar 2021 22:42:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
Message-ID: <20210331171252.GK15610@work>
References: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 06:02:23PM +0100, Loic Poulain wrote:
> This change ensures that PM reference is always get during packet
> queueing and released either after queuing completion (RX) or once
> the buffer has been consumed (TX). This guarantees proper update for
> underlying MHI controller runtime status (e.g. last_busy timestamp)
> and prevents suspend to be triggered while TX packets are flying,
> or before we completed update of the RX ring.
> 

Any reason why you didn't wait for RX completion also?

Thanks,
Mani

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/main.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index c780234..16b9640 100644
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
> @@ -1431,6 +1439,10 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
>  			result.buf_addr = buf_info->cb_buf;
>  			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>  		}
> +
> +		/* Release the reference got from mhi_queue() */
> +		if (mhi_chan->dir == DMA_TO_DEVICE)
> +			mhi_cntrl->runtime_put(mhi_cntrl);
>  	}
>  }
>  
> -- 
> 2.7.4
> 
