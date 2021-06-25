Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68333B3C34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 07:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbhFYF0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 01:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhFYF0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 01:26:17 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D8EC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:23:56 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id e33so6651705pgm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cyj6s4sHpfppPnMBo26sZU6xwfPH65HatOyxjgawFg8=;
        b=Lq6ougXAljr42lvCyI2Q9QGuGZ4AncpOqWBJU9/JTotbO/aIG8iOmjyDIlUKs07jxX
         1JeoCX1rpvzkMe+wRAgy31z04xPK2dapXcdg+/qxX24jAf9Ow+Y5k78KNS0Jkbs9dN3X
         SGBHxy66+aLpk5g+yFxhcnvibo0OJbkR4to+hWI55+vf4zb7Sq91m3DRJ7StSYkoqlJm
         5njn9CCyjmh3n/jX74aahHEPZagzi2LbAhd89BXWGBrmssxzFwr6bnUMYNVe1MJdvrSu
         qaAvizXLmEkHJC4a/xS8QrU9MUfNW+jrKHI8ax2gh4b76Qu4VpSpR8lPwLXNYO116Qik
         jjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cyj6s4sHpfppPnMBo26sZU6xwfPH65HatOyxjgawFg8=;
        b=eG7YdnZIabxwZM1FBi9JCpyWwO2jXep2/0o0EcFM7JtThalGJ6+BE4SDAFjc7ESo1E
         dwAKboOR3vDu4tz6SxkOxdm77yT31rPyaAFiyFbyn/EAmkmk5TvLuIgKHlg8XhXXs//D
         Vphm2gO/OZzi6gQHd7RJoe0CmBvJZqXV5deYL1BCC7qXW4fLUD9jFHSFe1MsEkIyBhxR
         qsD/6o76968jL8vl2ZmOmbG5Y24BVTofpEi+wE73hTjc55qSvfRWP9iRMaS64yrvywap
         T+Dxg7AbPnO/xSSnxbVN2j55y2hkKHBuGUt129Q5MbBH8Fsmsx2ar5k90VARx6XtRKTn
         giAw==
X-Gm-Message-State: AOAM531oavhC0TDDy/1csuuqYzgkE2UqPm4/2REA3wh+Vmq+1G4/u9ED
        ZRKviIQRjTKQfr54SWqYEIgb8HmtRz7a
X-Google-Smtp-Source: ABdhPJzJ1yRbMvgaboJE8dC85pliGYUKfTef4n9w2IGaujc/g7tQK4qYZpZ6s0FZH+GwstEj4TxXAQ==
X-Received: by 2002:a63:5446:: with SMTP id e6mr8017440pgm.73.1624598636294;
        Thu, 24 Jun 2021 22:23:56 -0700 (PDT)
Received: from workstation ([120.138.13.204])
        by smtp.gmail.com with ESMTPSA id k35sm4021764pgi.21.2021.06.24.22.23.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jun 2021 22:23:55 -0700 (PDT)
Date:   Fri, 25 Jun 2021 10:53:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Validate channel ID when processing
 command completions
Message-ID: <20210625052353.GE4974@workstation>
References: <1624558141-11045-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624558141-11045-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 11:09:01AM -0700, Bhaumik Bhatt wrote:
> MHI reads the channel ID from the event ring element sent by the
> device which can be any value between 0 and 255. In order to
> prevent any out of bound accesses, add a check against the maximum
> number of channels supported by the controller and those channels
> not configured yet so as to skip processing of that event ring
> element.
> 
> Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Link: https://lore.kernel.org/r/1619481538-4435-1-git-send-email-bbhatt@codeaurora.org

Removed "Link" and applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 22acde1..fc9196f 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -773,11 +773,18 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>  	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
>  
>  	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
> -	mhi_chan = &mhi_cntrl->mhi_chan[chan];
> -	write_lock_bh(&mhi_chan->lock);
> -	mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
> -	complete(&mhi_chan->completion);
> -	write_unlock_bh(&mhi_chan->lock);
> +
> +	if (chan < mhi_cntrl->max_chan &&
> +	    mhi_cntrl->mhi_chan[chan].configured) {
> +		mhi_chan = &mhi_cntrl->mhi_chan[chan];
> +		write_lock_bh(&mhi_chan->lock);
> +		mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
> +		complete(&mhi_chan->completion);
> +		write_unlock_bh(&mhi_chan->lock);
> +	} else {
> +		dev_err(&mhi_cntrl->mhi_dev->dev,
> +			"Completion packet for invalid channel ID: %d\n", chan);
> +	}
>  
>  	mhi_del_ring_element(mhi_cntrl, mhi_ring);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
