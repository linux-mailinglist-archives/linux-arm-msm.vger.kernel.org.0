Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2719038E070
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 06:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhEXEoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 00:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhEXEoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 00:44:01 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297D0C061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 21:42:34 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id r1so4339717pgk.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 21:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GepLbdbjGV1ycrQxG4b8/nNqglHTIxbk99LIKbMgmyo=;
        b=yhYrdYhnm0R+E61X42D7AGR+Sn9ZLDUjATInjVeOzIy1OIlEKI5mxocf8sp+tjhPqt
         SmeYnRzewjpLCRV8G8ASk3pvBTlJjVY24JQZGCSY4Nl4DEMEUsUq5J6w7ZCLNQtWjOfO
         eUGrVlSX3iWsljx06w2vVLQ8f5rhogVMAqBYbvAMs5YEc/P7SfqaLILmsQW8kiT9g//a
         zL7aL+M8wxeMAVvslGOll8lWsM9Cx5/YZDdHjoVIGIQdj5ybU9yp99ZWP0TFouQvvqrk
         hQsBzQguNXtwiDm+Hfa9DJG5X41wscFPzqEQ8K2vxIDZZj5YpMCOHT1gJQn9NG8ijc+9
         K2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GepLbdbjGV1ycrQxG4b8/nNqglHTIxbk99LIKbMgmyo=;
        b=QsnPGL0hlYnKXKBELXKYLoIXJtZoVaB1OIELuDaXR6/fBj2Fg0bjKdRQDQdw6GLujc
         D0tipj+VA8lARnPIGE+ugdt6vuTDuLute4IW/cMzMQbAU7tVPPvv1zka3qk/os4eKuXY
         OBGS50H+zmk1btDSHS0CkXTdxLprKc09zOKwHJy4TqhDv4rbh6ZbXQhkA1lesGX/JcYq
         vT20uQeMx/Zis85ybVYdbOTAkguWZxMR0V3vyGUiQmJB06LZr6nvK624krTIzfTaLYLx
         OQHRFUFX7ok9R+b3KSG8Vt7ja/Tx9d8Z0PsMD8w3Z+cw5RYnfUo+AgTEvVaYlE0As4W7
         kXSQ==
X-Gm-Message-State: AOAM533P1e57E5z/nWBjI2R/HgdLpnT1tOlLgeK3r/9ZivlK4n+P6TBe
        BMvq12eSuQNvijiMw/ib8BYV
X-Google-Smtp-Source: ABdhPJwkyPjRjzvxhR4kTKhPZW+P8IrFp21N4Iw/ZXhw8Tl4ICMstphTyh7bO62RY5RcyA/VvCk4Cg==
X-Received: by 2002:a63:cd08:: with SMTP id i8mr11363145pgg.312.1621831353424;
        Sun, 23 May 2021 21:42:33 -0700 (PDT)
Received: from work ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id m191sm10216832pga.88.2021.05.23.21.42.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 May 2021 21:42:32 -0700 (PDT)
Date:   Mon, 24 May 2021 10:12:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: core: Validate channel ID when processing
 command completions
Message-ID: <20210524044228.GD8823@work>
References: <1619481538-4435-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619481538-4435-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

Applied to mhi-next!

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
