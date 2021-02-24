Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3350F323A2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 11:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbhBXKIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 05:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbhBXKI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 05:08:27 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF818C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:07:46 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id a24so890618plm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P1DtbSliENRAC9b9n4afXRz7Q9RrBjH4sUA2kl9wFeo=;
        b=vpt3YytLLL6hi3PS0w7y+vkwmCGx5r4lioE+VKZ87GslbyTsaBwFSkI4kB1Y0o97yy
         XKuatwsHIse32zvM+yBrFrZ46p8vUQ6sOGjheV23DzFwOdXnMj3APcpyC8NaxPzXIjK0
         OcXt5GqIGwBbgVMMrFIYr/Ul6dyKTp6ul+BXpLQOIQI2DVghhnjrGBsBeMPT9vp9+bLt
         TALjjquHH+Got+bjXscs7AoKK+ENaGJ9JkTihtDllCPlqbSwHqexGgAlbig9Yx4V/r/h
         QvSAtuu24d9jdinQYr3UljLb7x1EPF2uxlDsOFi5PLySAXSrhz7t/IzPgsb26K+0Zy6k
         u2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P1DtbSliENRAC9b9n4afXRz7Q9RrBjH4sUA2kl9wFeo=;
        b=sSQY+xXwTb3UHGui5KJY60P+4jqpQMxcbZn/4Nk9E1ttS3fV/EddwJ8gsayQ5qQKYt
         R0tX0pRqQtM4aZrVggdXoGeruQ0PIRV9QnIEzl7KXovDeBKhiTs7+3nLHpBVqIW8rUU2
         T9IxXA4rFKSahY84C8Ov9nYYbbTSsfiBN+dKhvHHDCMY7uL8GYTB2vWMBHfgqpQJIKnb
         jduY5dHdGymmW7Dx47szJnFXYnF5Ab4hi8x5nyYX4sWuU4j+NZfw7UMgvBRK0qXMdiCi
         tfzF6EFPt5CZqFqSF7SfpJjB6WesCufDOKN4uNQIcx47UPIuXfIkaY8bglipS4bAXgut
         ipDg==
X-Gm-Message-State: AOAM533L8pE4GjgMRSfZKBrDM+d21bMiz4E05lutnUbt6yAzfdbEEd6o
        XwE7qZoOxTzD+xQSlLLw6yhdeiBTe00O
X-Google-Smtp-Source: ABdhPJxpKQ0C8esHZgLneCIucbRS/lEIr+qR+sVY/22UyYDGu4Kqy9PdU2sWZAHA0Xo3LR8mmJc98g==
X-Received: by 2002:a17:90a:a596:: with SMTP id b22mr3845941pjq.33.1614161266389;
        Wed, 24 Feb 2021 02:07:46 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id g6sm2174555pfi.15.2021.02.24.02.07.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 02:07:45 -0800 (PST)
Date:   Wed, 24 Feb 2021 15:37:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v6 5/8] bus: mhi: core: Check channel execution
 environment before issuing reset
Message-ID: <20210224100742.GT27945@work>
References: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
 <1612470486-10440-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612470486-10440-6-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 04, 2021 at 12:28:03PM -0800, Bhaumik Bhatt wrote:
> A client can attempt to unprepare certain channels for transfer even
> after the execution environment they are supposed to run in has changed.
> In the event that happens, the device need not be notified of the reset
> and the host can proceed with clean up for the channel context and
> memory allocated for it on the host as the device will no longer be able
> to respond to such a request.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2f6fdb2..f511e3a 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1283,6 +1283,12 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
>  
>  	mutex_lock(&mhi_chan->mutex);
>  
> +	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
> +		dev_dbg(dev, "Current EE: %s Required EE Mask: 0x%x\n",
> +			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask);
> +		goto exit_unprepare_channel;
> +	}
> +
>  	/* no more processing events for this channel */
>  	ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
>  				       MHI_CH_STATE_TYPE_RESET);
> @@ -1290,6 +1296,11 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
>  		dev_err(dev, "%d: Failed to reset channel, still resetting\n",
>  			mhi_chan->chan);
>  
> +exit_unprepare_channel:
> +	write_lock_irq(&mhi_chan->lock);
> +	mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> +	write_unlock_irq(&mhi_chan->lock);
> +
>  	if (!mhi_chan->offload_ch) {
>  		mhi_reset_chan(mhi_cntrl, mhi_chan);
>  		mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
