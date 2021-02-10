Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D53A3160BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 09:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbhBJIPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 03:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbhBJIPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 03:15:24 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD50C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:14:43 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id e12so786125pls.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=teATK7TqlsR6FecITFgdLZO0PyVXHjRxwgE/FTuMEuE=;
        b=PcHSlhbN4ONNxaKC7dL0+yWD2/lywMHMvWZOv6HbFvd/7tn5V0xybz2tlUpa9QEHJ7
         GRNvUp7PEmkmg/71FJ5la96uLM4DjVccnmXf5NcECeg6yt5Mra0bHxGkzHk5XuHKtPIY
         lE/7RlSvikHmQQZ4EXPl1a9nGgciP+GUY3zgeNTEmXpTya6WYkP7Hy1F6s8K8kZuFRJZ
         P8pMpD+4DkoRseAe+4MHEGamj7XVMtUEu5zNPptSVDJ/nTJFgaiqyu5ZOZGrU5lMdNIx
         lhn/UDHiSG1aSGJClOvv6VJq5gfUDpgSzPODfmARpSwkpetskoGlk6y5Be6dECoCde1m
         rI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=teATK7TqlsR6FecITFgdLZO0PyVXHjRxwgE/FTuMEuE=;
        b=dZEk5YZwxP4X42lS/HIEhWuVpziCsQ/pLk+fMItUQo/HYfIStSu1JD7fy3aG4TVVUm
         z6NCzIMoAay9jeR/GiSDH8ZvRfxKLz2YznYoZe5Xy5V+G0cbUp3VNVYqT/gASVoQ1qKy
         2ZM0MO+MeT3Tdbcd47xDMkVYhA14QtnMkdNulFTJiNRalXlISlOJ80ZG+2PnEaHmrQc7
         Y6pV8ntljh9c+Gk5N9rl+1pv/NrMxxV5vSEFaMAqgJl92w717AZm2PdNLlhr3tvpV3qJ
         /uWXoib3GbdA70ev8MyS5EaJMeElqcYWYKy4908NwzSUwIWFbf6Rsr0vvjj8988NaT6s
         vmYA==
X-Gm-Message-State: AOAM5322xw3LEjyYndpsR0zi67FO15qClCkAtc+63MToYxleoTZ0h59m
        WlxJrWOrRwCZmAJKb0Uv81N8U8dKuOVs
X-Google-Smtp-Source: ABdhPJwpAuI79HEOzpkh7txmm7y4OYOLlzhFzX89l4NsgIty7mw7yIGe2xeg1t1vzVO5BW4YrBkJXw==
X-Received: by 2002:a17:90a:d145:: with SMTP id t5mr2100285pjw.104.1612944883327;
        Wed, 10 Feb 2021 00:14:43 -0800 (PST)
Received: from work ([103.66.79.29])
        by smtp.gmail.com with ESMTPSA id bb4sm1236668pjb.56.2021.02.10.00.14.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 00:14:42 -0800 (PST)
Date:   Wed, 10 Feb 2021 13:44:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        kvalo@codeaurora.org
Subject: Re: [PATCH v2] mhi: Fix double dma free
Message-ID: <20210210081439.GB13668@work>
References: <1612894264-15956-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612894264-15956-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 09, 2021 at 07:11:04PM +0100, Loic Poulain wrote:
> mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
> resources, including unmapping coherent MHI areas, can be called
> from different path in case of controller unregistering/removal:
>  - From a client driver remove callback, via mhi_unprepare_channel
>  - From mhi_driver_remove that unitialize all channels
> 
> mhi_driver_remove()
> |-> driver->remove()
> |    |-> mhi_unprepare_channel()
> |        |-> mhi_deinit_chan_ctxt()
> |...
> |-> mhi_deinit_chan_ctxt()
> 
> This leads to double dma freeing...
> 
> Fix that by preventing deinit for already uninitialized channel.
> 
> Fixes: a7f422f2f89e ("bus: mhi: Fix channel close issue on driver remove")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Tested-by: Kalle Valo <kvalo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: add Fixes tag
> 
>  drivers/bus/mhi/core/init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index aa575d3..be4eebb 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -557,6 +557,9 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  	tre_ring = &mhi_chan->tre_ring;
>  	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
>  
> +	if (!chan_ctxt->rbase) /* Already uninitialized */
> +		return;
> +
>  	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
>  			  tre_ring->pre_aligned, tre_ring->dma_handle);
>  	vfree(buf_ring->base);
> -- 
> 2.7.4
> 
