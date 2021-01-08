Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468BE2EF35B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 14:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbhAHNpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 08:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbhAHNpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 08:45:10 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A9EC0612F5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 05:44:30 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b5so6179911pjk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 05:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3LJwbGSUKx0vqi7yWXymiWI3aMHuCCgGigS5uJDYNGg=;
        b=bt0HgdVOAIKvJsoGY7vkBtdtd4yy6x7bBH2KAI9KtH5e1w34Q7r6pvdKUq5QDL3DI6
         Swy5596o4bgDG2TJVUzf1SODFkaWzLpUaAFg0WTQPwf1Gqt0O0mazgGXhSRMs20VBaeI
         gCsp7tnsFb8xUrSQf6MRrYFwrFBN141E3c/OhNx4R6kttBPycZ7Lqydo3JtrkV2R1E66
         8isL5/bRj7dASkPtda7vzSwFoWXZiczgCwzYk9CbKcuZw2eDgE9rR+8YZweVIDmAK88D
         i0+n3+/aoSLZloiWnu5yNuNP4JDwpyKRkwn2j6X8CXCXEQmIbyODETjdcZCxDajGDGYP
         vd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3LJwbGSUKx0vqi7yWXymiWI3aMHuCCgGigS5uJDYNGg=;
        b=TEVSwXLXaDDFExDU+PSmM4RwP3MPo5mII3dlhdYphHGFFCABIV7XYvR9G1mTRDZTev
         1AGz0DH5L6AT58Ll+e1UQ2l4FtNSkxlMNA61yoQ24HnsSL3ibyo/pLfObn+j+XrEMqZk
         Uh+6TyFLLiXlDGCRYSM/6fkE3kTJfs1is8VgCW1G0DejBC4ZmCxbgi46f6do+UzibNID
         v2+1hAzBW3105qzbEE0bxygppfwEP/EKL1564SwnzOw6HqfQVWt5PScDwdZTZjMYDaa6
         L1k5U2EvyugmKowq01Q10LRPhLW6WqidBStWNx9/zoVLfJm6suDBiXqexv/IUffuqe3c
         44pA==
X-Gm-Message-State: AOAM532RnUXDIvyJrl93UbYNhVl0eEdOctMrq9deS0JugRQygefw54eB
        wRjZujRmvu/Au6xL4LEhs9Br
X-Google-Smtp-Source: ABdhPJwV8WpbeeMrGKSQZEebTAiEWVY7MwArPrPpHaLLgfEFQWY4tU0QAdfRe2RzIINb0C6s+/Bb1g==
X-Received: by 2002:a17:90a:f48b:: with SMTP id bx11mr3802985pjb.48.1610113469621;
        Fri, 08 Jan 2021 05:44:29 -0800 (PST)
Received: from work ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id 22sm8925081pfn.190.2021.01.08.05.44.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 05:44:28 -0800 (PST)
Date:   Fri, 8 Jan 2021 19:14:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        kuba@kernel.org, davem@davemloft.net, netdev@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Add inbound buffers allocation flag
Message-ID: <20210108134425.GA32678@work>
References: <1609940623-8864-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609940623-8864-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 06, 2021 at 02:43:43PM +0100, Loic Poulain wrote:
> Currently, the MHI controller driver defines which channels should
> have their inbound buffers allocated and queued. But ideally, this is
> something that should be decided by the MHI device driver instead,

We call them, "MHI client drivers"

> which actually deals with that buffers.
> 
> Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> if buffers have to be allocated and queued by the MHI stack.
> 
> Keep auto_queue flag for now, but should be removed at some point.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/internal.h |  2 +-
>  drivers/bus/mhi/core/main.c     | 11 ++++++++---
>  drivers/net/mhi_net.c           |  2 +-
>  include/linux/mhi.h             | 12 +++++++++++-
>  net/qrtr/mhi.c                  |  2 +-
>  5 files changed, 22 insertions(+), 7 deletions(-)
> 

[...]

> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index fa41d8c..b7f7f2e 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -265,7 +265,7 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>  	u64_stats_init(&mhi_netdev->stats.tx_syncp);
>  
>  	/* Start MHI channels */
> -	err = mhi_prepare_for_transfer(mhi_dev);
> +	err = mhi_prepare_for_transfer(mhi_dev, 0);

Eventhough I'd like Hemant to comment on this patch, AFAIU this looks to
me a controller dependent behaviour. The controller should have the
information whether a particular channel can auto queue or not then the
client driver can be agnostic.

>  	if (err)
>  		goto out_err;
>  
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 209b335..6723339 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -60,6 +60,14 @@ enum mhi_flags {
>  };
>  
>  /**
> + * enum mhi_chan_flags - MHI channel flags
> + * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue inbound buffers
> + */
> +enum mhi_chan_flags {
> +	MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
> +};
> +
> +/**
>   * enum mhi_device_type - Device types
>   * @MHI_DEVICE_XFER: Handles data transfer
>   * @MHI_DEVICE_CONTROLLER: Control device
> @@ -705,8 +713,10 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>  /**
>   * mhi_prepare_for_transfer - Setup channel for data transfer
>   * @mhi_dev: Device associated with the channels
> + * @flags: MHI channel flags
>   */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +			     enum mhi_chan_flags flags);
>  
>  /**
>   * mhi_unprepare_from_transfer - Unprepare the channels
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 2bf2b19..47afded 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -77,7 +77,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	int rc;
>  
>  	/* start channels */
> -	rc = mhi_prepare_for_transfer(mhi_dev);
> +	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);

Are you sure it requires auto queued channel?

Thanks,
Mani

>  	if (rc)
>  		return rc;
>  
> -- 
> 2.7.4
> 
