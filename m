Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291952FED68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 15:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbhAUOtw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 09:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729582AbhAUOsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 09:48:43 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DAFC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 06:48:03 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id b8so1431525plx.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 06:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G+S0rFKyTGDTCdU1llLOUGr5q+U1y5lXIe7fD1GaN3A=;
        b=u24Y3ZsHly/iK3xpxqP+F7HIGRxw3XrqltXysZEl3kXUtagoYMnJ+Np1TA9MTfgVw/
         Oy2yR88V9rVC+rPwWp58USajcIwFs0FMiNFE5kS1Is2o9ZEqw6iRhRc45JrrKr9whTZN
         gcrwl4CbrJRmRdnJGUUJGDfesG43xg+fBdPcdyhOC82evrFnu97dLeFICDOeBac84TIA
         r8GQ/MjpClwoMnt3MomTk34XGjKFpLeAZ78QbF0wNFKfSA0CIQeE5MU4KBOV69pIWhe6
         F8ZzNn5PU639PNj7ihGgKkCSYjSSEv6W9ggpsZENKU1tCpWq/7THhwnQNF9YDXBwuNqm
         ncAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G+S0rFKyTGDTCdU1llLOUGr5q+U1y5lXIe7fD1GaN3A=;
        b=Arp/Z7+MzGgfwXyQx+5bn2WODvj1yIHGYmnoZAiFNFPfydyTmMrhT8QA7ZQFHwip3C
         /FmcXV7aTGUE7tCTk/F9YAb2yU8u4opVYjGDe5XjjdwulAlQLrlhZsRcgxqto9z1zXVS
         lxpalM0hLEbDB92jhqWdpbWlUTIox9ejbvqX79hTdNHlGuH0QDpiIHXqglh4v/38IRMD
         W4uX+p+6wWhhlquKn2p7WnqYto0VqiFYn2sa+xReJieDz+f7C0Y9xb1Q8IJdlprK56i3
         UlZTiw71SObTDwlH37s+ACsV8marrs4r/Y6MamVmuccHx2DSOaiHzYrXWmUKsXq+blF4
         2/JQ==
X-Gm-Message-State: AOAM532xta5UcClN2uU43mgi5V2SbaPjlfT1vwKNwi3DS9Dq4dOMGU/Q
        S+OzpDYA7VUTBCUeRQYq/HU28bwPSKo3
X-Google-Smtp-Source: ABdhPJw0WYkVes2MNDi6YsZPAIyM5Gf0LqRvklREhRCZrzV3mToyvqD1seRPHGoDhIYbBRBL+noUTw==
X-Received: by 2002:a17:90a:8c87:: with SMTP id b7mr12862334pjo.158.1611240482801;
        Thu, 21 Jan 2021 06:48:02 -0800 (PST)
Received: from work ([103.77.37.184])
        by smtp.gmail.com with ESMTPSA id a1sm5609979pfo.56.2021.01.21.06.48.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 06:48:01 -0800 (PST)
Date:   Thu, 21 Jan 2021 20:17:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 4/9] bus: mhi: core: Clear configuration from channel
 context during reset
Message-ID: <20210121144758.GB5473@work>
References: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
 <1610139297-36435-5-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610139297-36435-5-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 12:54:52PM -0800, Bhaumik Bhatt wrote:
> When clearing up the channel context after client drivers are
> done using channels, the configuration is currently not being
> reset entirely. Ensure this is done to appropriately handle
> issues where clients unaware of the context state end up calling
> functions which expect a context.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 482b365..30eef19 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -558,6 +558,7 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  	struct mhi_ring *buf_ring;
>  	struct mhi_ring *tre_ring;
>  	struct mhi_chan_ctxt *chan_ctxt;
> +	u32 tmp;
>  
>  	buf_ring = &mhi_chan->buf_ring;
>  	tre_ring = &mhi_chan->tre_ring;
> @@ -568,7 +569,19 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  	vfree(buf_ring->base);
>  
>  	buf_ring->base = tre_ring->base = NULL;
> +	tre_ring->ctxt_wp = NULL;
>  	chan_ctxt->rbase = 0;
> +	chan_ctxt->rlen = 0;
> +	chan_ctxt->rp = 0;
> +	chan_ctxt->wp = 0;
> +
> +	tmp = chan_ctxt->chcfg;
> +	tmp &= ~CHAN_CTX_CHSTATE_MASK;
> +	tmp |= (MHI_CH_STATE_DISABLED << CHAN_CTX_CHSTATE_SHIFT);
> +	chan_ctxt->chcfg = tmp;
> +
> +	/* Update to all cores */
> +	smp_wmb();
>  }
>  
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
