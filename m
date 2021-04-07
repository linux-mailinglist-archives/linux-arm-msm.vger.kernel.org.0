Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E95F356484
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 08:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhDGGuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 02:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhDGGuR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 02:50:17 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A53C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 23:50:08 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so775142pjg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=etCN0gqQWgu5lQ6Morhq48Dj3szgGaAogIL1xEHC3hc=;
        b=FsXH4WV+itAtz86opsSaqD3g8gVFAbegNuFzBqEBH3O6tS9rhI3y/VP2ZJC464te2h
         NnNh2Of+Rlpj+8V29qoWEykIqTXLD+ooN8xwyBpMSSXikfL0qzE+ae9TuHUhDz/KOnwp
         0i22tBLKQcCT96MAHEAbdqNaV/4GHOwasMIReZMv0kxFAMGMGH5DTW2tN+LBtse1EG7m
         JbswKyPmMC0Avvx/Y7OqNPZGT1LO4JSGqdbu01JCsYWQqa4Wyq9pbhSME5PLZAXLsCBi
         SksnzzU6NfFNRJoWj59VfNR539AA02lb/zraNuZqJn3TLe3XQPNndYVDdn0mG4QeUlH2
         b07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=etCN0gqQWgu5lQ6Morhq48Dj3szgGaAogIL1xEHC3hc=;
        b=MkTkhZGqk1kV3CEzrYmh4IpR6epwWnxGPFv6p4g2WF42MJHzwOCpZZhIHTsFkSV5JV
         6PM+ONYnoV6PE1T3z0KSaKH2YfJlS1LhiDv43fs/qvl/QFH8E+QGY4ERhezIMyxo/sHE
         8t48n6FEy+sxt4Yc3JomA1p+6bWqDz8iERov8bJt7wekR7wDpx7kG4gdSENs+pYpsC3w
         vPg3ZLPWo4k9jMrxFY62TuVR5Zhi6XkZxf9c37sFj26+nMCEgzPQY2tSb+pUVnk8Z9Zy
         rq+qmNVqEyMb9bz/HkFg6yzzp0CBUJazzYnTNW7v2jXFNkWmysnHxWHuYw2beB8J0TWh
         676w==
X-Gm-Message-State: AOAM533hjDjwyiUHqztJJs9yESudNoCSq4+MB9NtoEdKq0lNSc9HI8bg
        j3l9q5bw3reBdVd8tG+dfdh+
X-Google-Smtp-Source: ABdhPJw07mkBltNaYbZJqJAMAll2cjyO88yEdabmeQSd4wfKWMppJy2z7+u3cDmWHso7nar7bPg4Ug==
X-Received: by 2002:a17:90a:bf84:: with SMTP id d4mr1857660pjs.118.1617778207750;
        Tue, 06 Apr 2021 23:50:07 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id z16sm20037905pfc.139.2021.04.06.23.50.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 23:50:07 -0700 (PDT)
Date:   Wed, 7 Apr 2021 12:20:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
Message-ID: <20210407065004.GI8675@work>
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

Applied to mhi-next!

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
