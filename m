Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C764333FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhCJNxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:53:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhCJNxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:53:07 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9919CC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:53:07 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso7518469pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=InN9m7hIprfWWBkDrI24e5tae9R+vk+vV3+IqqJrTHk=;
        b=hley0yp994m20s7olEdzr4zUvmgmfA+s3wM2zyc1EsCKyEFbeVDRMjl/LyikTjjb2/
         GSakKCGengIIeWFNg9Zu7w5qmL09Gvx6hxOgmFNtm7dS03pNPbz2PEf8fvaBnTH1bFsl
         VsV+soMSWTd7HlfHpZIqcCmtcDvcb9bRcqXG+e+vnLJIlDq588Ynbt1IXUtTftYDHClX
         Vq29xJHDW0eS2QxXGTAeBtczP6p6nVXj/zWCoA6vBXv56MhWBp4VFZ/RCkX7xZ8+/vez
         GmK009YmJxv/TsI0Xh2Yvce/E0QIJrRr+2gjxRDKXMceum117T+mAtFiHfptINans96K
         ejpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=InN9m7hIprfWWBkDrI24e5tae9R+vk+vV3+IqqJrTHk=;
        b=gXLEuL7AeuM3CubCLK6gVz42Vc7zJgJiEPU9H2jv8PzFdsWvIFh0teUbVG3HF/FYzP
         100tm584I1uRDQ2w68JQJLWGwesrax5NA77iFqReLphBG+HRVeSbnWt2gPJIk0ty4pVE
         NFlUYWTM2EyCBz62eZ8xB7siiLoReTBZp4V8YkrAd7mumRJQ7690aD65Mp6wSzFD86Ri
         nomcDdcwQbphDgBKFPNmuwcjea+bbo3gaUmCPgIqKiEK/T2hBwxFunGYA+aEa81jdudb
         pb/v2PGcor0C76XNoE6jQ68+PMdKsNvvvjqmi9WiHFKOtO8rbdzpUMBByOHsdWlK7yVK
         Sf+A==
X-Gm-Message-State: AOAM533ZdKIwtGCKesntab88k2vND/dO7hd2yo7FX3temdOICkFEZFUd
        xlJJBc0YERcHzL0Q3flte6HT
X-Google-Smtp-Source: ABdhPJy9D3b4xRKPH7Fw5bprufQUEXAOSRHXuKvGxwnap5Z9PaIf4V/bUoxe86dq6v+VfzZuHYbHZA==
X-Received: by 2002:a17:90a:7182:: with SMTP id i2mr3666760pjk.111.1615384387119;
        Wed, 10 Mar 2021 05:53:07 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id 35sm16050113pgr.14.2021.03.10.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:53:06 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:23:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v3] bus: mhi: core: Add missing checks for MMIO register
 entries
Message-ID: <20210310135301.GN30275@thinkpad>
References: <1615315490-36017-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615315490-36017-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 09, 2021 at 10:44:50AM -0800, Bhaumik Bhatt wrote:
> As per documentation, fields marked as (required) in an MHI
> controller structure need to be populated by the controller driver
> before calling mhi_register_controller(). Ensure all required
> pointers and non-zero fields are present in the controller before
> proceeding with the registration.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v3: removed fw_image as not all controllers require it
>  v2: removed iova_start and iova_stop as they can be zero
> 
>  drivers/bus/mhi/core/init.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 272f350..d8882b3 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -879,12 +879,10 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	u32 soc_info;
>  	int ret, i;
>  
> -	if (!mhi_cntrl)
> -		return -EINVAL;
> -
> -	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
> +	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
> +	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>  	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
> -	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
> +	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs || !mhi_cntrl->irq)
>  		return -EINVAL;
>  
>  	ret = parse_config(mhi_cntrl, config);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
