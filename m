Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C9E2AB508
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 11:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgKIKeS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 05:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgKIKeS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 05:34:18 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A88C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 02:34:18 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id x13so7710427pfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 02:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PWpW2uQvGn1h0nbyrbfd1nJvmqL1odyb76MYsq7s18U=;
        b=y1DQ4Pwq+l/FBZ1kfseUM/+u8PveS/Wcz8s35YsUDvH97gVLipFI8mY1AL6jOzSvII
         WaKNe70h3ORWQLzK3NqTWJS8soivk8bC9GoXzIjEEs9y4/17PjVk1bxinouNPWPU99LH
         XeK5frbmRXe0wkArJD4ivFI95Jb9oytUBqTCemynbTIrmqhuKzbcximQnoCa3SbmD/dS
         3Y9yCcw6esS9TN0O86QjgD6O7dwDYFfSl4w1uf4YIzBZ2PAriAWdD39bE/UIxAC3f1Ko
         k5ShxoFocgwwAXKpCSPmzeIteNeZqD2EFr6LFv1hnYiWt0KL3lQHim8cBfBf7nwC2r+s
         QhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PWpW2uQvGn1h0nbyrbfd1nJvmqL1odyb76MYsq7s18U=;
        b=fSHnnWlplKn2s1N8k4C1dn7q5jtK/1KeHwmYz1SpJU8VhjKI+uCWX0fPkMLJgYoa9q
         +eeYiQRUSjDBufpMvbHrZplTf04s2MuQW0r9fHneMKJZNKJ9YNGnC1q4ScF4/ntIYdeM
         vyBtGf4sqmTl89ePxnKRWzhsP7YkXXVDov6GmLQpVLXMQ0NNATjaAW7pWqvQQ526G0Pf
         yYkMIE5EwN1A207qjdGCzuG2y7mGUSSTPnqthxwnpo16LuLJCQ6U9Umnz16Zt60enTLF
         d/e/dW9EIo2cV3LgNY2gO2gLxVcS0/SWw/2EceA5I9LSuALfl33VE71bn2I1Ls0z1j3I
         p8qA==
X-Gm-Message-State: AOAM5315POI9JL1g/Fov7z4f/lzlzeda6F+rpbJlaZwy2F1YhOzj6LSd
        9hlK2EfhCMtqe6M5U2wXP63B
X-Google-Smtp-Source: ABdhPJxNnNK+/w6Awd8gs1YujmHMKGR3d7M8OAnJy6DmOydPYpJT6/SFH/0FZOU8YiH87nzVr0LBTQ==
X-Received: by 2002:a17:90a:5508:: with SMTP id b8mr6962383pji.85.1604918058010;
        Mon, 09 Nov 2020 02:34:18 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id 3sm10733040pfv.92.2020.11.09.02.34.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 02:34:17 -0800 (PST)
Date:   Mon, 9 Nov 2020 16:04:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Fix channel close issue on driver remove
Message-ID: <20201109103412.GB24289@work>
References: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 09, 2020 at 11:07:14AM +0200, Loic Poulain wrote:
> Some MHI device drivers need to stop the channels in their driver
> remove callback (e.g. module unloading), but the unprepare function
> is aborted because MHI core moved the channels to suspended state
> prior calling driver remove callback. This prevents the driver to
> send a proper MHI RESET CHAN command to the device. Device is then
> unaware of the stopped state of these channels.
> 
> This causes issue when driver tries to start the channels again (e.g.
> module is reloaded), since device considers channels as already
> started (inconsistent state).
> 
> Fix this by allowing channel reset when channel is suspended.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index d20967a..a588eac 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1232,7 +1232,8 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
>  	/* no more processing events for this channel */
>  	mutex_lock(&mhi_chan->mutex);
>  	write_lock_irq(&mhi_chan->lock);
> -	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
> +	    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
>  		write_unlock_irq(&mhi_chan->lock);
>  		mutex_unlock(&mhi_chan->mutex);
>  		return;
> -- 
> 2.7.4
> 
