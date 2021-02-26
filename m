Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E60326409
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 15:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBZOZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 09:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhBZOYr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 09:24:47 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C25C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 06:24:06 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id q20so6342739pfu.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DAaGVb7r/TvUsy8AGyqpjJMg3/kOQ92bLhl4QPZ8jWQ=;
        b=ThkH0JGDreGtf7pDodavSruoyKWVlP6UhhqIi8iEzROkRM4R1TxDRFn7N6oIPdSOMH
         cArjbf+V7/Aku9RZ1LwYtBXKEkSdAW5YGyf20rTPm8P24SsV0HMgmolhHVfSNZnIiw7c
         U2hdFI8462mUBWSvLStzw7wlUyKascYNVarK9VtWQMJ1csUQ9oDBVYCBu5tbXLx6gN99
         bLXUszavhYF4cHmsXph/Ctp2hcSuEg0bk+Sbx5XEmW1V0MgUZ0dscPqfEiDdSiRwAq3b
         96z5Y3xlLudUdPwmvQjETW/eBZJNYuluwknAT7SR1yOlRYm4jS2tXSkJBzzwGG80sjJW
         8l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DAaGVb7r/TvUsy8AGyqpjJMg3/kOQ92bLhl4QPZ8jWQ=;
        b=MAn4uO4pAwnm2CsFXRWoidVjeM2UWiOop2XRyEDW3lpmeLRwYTReJ26+PAkY/yvigS
         G0V+WLL2Vtn+y+vBopQSLJ47mej9kq3z+PN2BYNIW7KATve9ZgehP6QGwzKkjoZDFu6Q
         tjTrMMN88UqCsb2Q8jrvZ7m+aNM0lXZb7MmVs263BpaBtqVEv5UpnbtbtuYok+WdA+Dr
         RVxgfvT5qcT4tNk8FhRdfghpkYBfC+sQdYujc1xeznTpDwZT8RPat1NOz1sI20yWtI/r
         9zIHcpdFcyIzC/IRUrPLpL3gT8tZCkL+Nrkx1Y+dQW3SFh9bxL49sGq5HhERtoMy9qAg
         vDfQ==
X-Gm-Message-State: AOAM5309PepQkkyE/epRB1W/gWNjIZV85oHoh9jhHFX4D/9RfB/Qrk+r
        0kQ1gzxXBi9xDatYP6UqcI5d3wMsNf3S
X-Google-Smtp-Source: ABdhPJxrQR7OSm5JKfZUozWBCsMpp2KpH5Gu5fLdAUV4qHKqKFXV4f7Va/ZfzQNmj0/CNr2VR+24UQ==
X-Received: by 2002:a05:6a00:1681:b029:1ec:c756:7ec3 with SMTP id k1-20020a056a001681b02901ecc7567ec3mr3497302pfc.13.1614349445812;
        Fri, 26 Feb 2021 06:24:05 -0800 (PST)
Received: from thinkpad ([103.66.79.124])
        by smtp.gmail.com with ESMTPSA id u3sm10703006pfm.144.2021.02.26.06.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:24:05 -0800 (PST)
Date:   Fri, 26 Feb 2021 19:54:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] mhi: Fix invalid error returning in mhi_queue
Message-ID: <20210226142401.GA70936@thinkpad>
References: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 26, 2021 at 11:53:02AM +0100, Loic Poulain wrote:
> mhi_queue returns an error when the doorbell is not accessible in
> the current state. This can happen when the device is in non M0
> state, like M3, and needs to be waken-up prior ringing the DB. This
> case is managed earlier by triggering an asynchronous M3 exit via
> controller resume/suspend callbacks, that in turn will cause M0
> transition and DB update.
> 
> So, since it's not an error but just delaying of doorbell update, there
> is no reason to return an error.
> 
> This also fixes a use after free error for skb case, indeed a caller
> queuing skb will try to free the skb if the queueing fails, but in
> that case queueing has been done.
> 
> Fixes: a8f75cb348fd ("mhi: core: Factorize mhi queuing")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: - Fix/reword commit message
>      - Add Fixes tag
> 
>  drivers/bus/mhi/core/main.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 7fc2482..c780234 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1031,12 +1031,8 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  	if (mhi_chan->dir == DMA_TO_DEVICE)
>  		atomic_inc(&mhi_cntrl->pending_pkts);
>  
> -	if (unlikely(!MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> -		ret = -EIO;
> -		goto exit_unlock;
> -	}
> -
> -	mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>  
>  exit_unlock:
>  	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> -- 
> 2.7.4
> 
