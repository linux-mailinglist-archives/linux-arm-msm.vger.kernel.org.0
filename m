Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1962C2CF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390099AbgKXQb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390017AbgKXQb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:31:58 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F2AC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:31:58 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 11so7361185oty.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O1ba/f2z4FniBZjfqbUKsu3JvZQwwQqF9zir1Omgmjw=;
        b=GPK6roWoya5lyy2gbTplpznOoGUsaYM2Ffqph9CG2f3VniFMlfnA3ducEifA7cjdMs
         3BKYjWQ6nFq9O8qoyxCykx0LVu1JU6DrxH4poyftRgsqXhFDl9HqDxao34s08MMr0wzK
         iYuXaerjTxiheGRB/M7BfWPPZqoND/1NdsiLc5IeZHziBoCjHpKmaBXY50Gfkw8QZjFU
         k7h6aN24fkCT7SNDyVY6WufvxMq4cb+GcJpwwtRqegfL360WgLiZ/RddpMJyXaWrYF7N
         WflzHApk7h4lIX1Q8JDvEtDQ4MgpfM+47SUEhczZ5BW+PuV1T2vUT2kxugGfS4eq0Jdc
         elIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O1ba/f2z4FniBZjfqbUKsu3JvZQwwQqF9zir1Omgmjw=;
        b=RlD8PunMG1sCioRJNzdepVU2XQ1ioA4EozXcsZLEFufxcMGe+iaRNHWbStlm5Q5FIX
         wu+YirTcIcM7wXS/GjixAYyK3MRvjqyyv7EnAmzst3h/njZ0bGMglCs21Kna1UkL8Ios
         JH6siF8ZI7fBqgjKmPiDh3BVXImkkbpKIE7dPV3pOpX8MEJP98OGLcfU1AqKQF6TE/8v
         L/poS/ngjA52NvQvgrNbtJhS3ZL0wZQ8V3GAfy2oaoeZ/s4Q0kAOfmRuu1+ALOee1juL
         FdCvmhphiaTfVI0XNAajCFWXewrG7g/rs41Ix+IXuvvb5VklSuLN/pomI3sFf75azgQV
         js6A==
X-Gm-Message-State: AOAM530CSRoYFLMyfiJw3txceXWJr3XFbCZmTuXbeyOtgXVEOiSmIlZw
        zJ6tnOb5F5RxDkD6Zk5MOM0Vcw==
X-Google-Smtp-Source: ABdhPJwggyZl8L8g2b9hR43GvCNlab5dHHsODCrifU8R6VNY8s8rLLkIRxx3/EbDQehqsvMsG0iMxg==
X-Received: by 2002:a9d:3e85:: with SMTP id b5mr3767632otc.354.1606235517411;
        Tue, 24 Nov 2020 08:31:57 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c190sm9548303oig.34.2020.11.24.08.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:31:56 -0800 (PST)
Date:   Tue, 24 Nov 2020 10:31:55 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix device hierarchy issue
Message-ID: <20201124163155.GM95182@builder.lan>
References: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 Nov 10:18 CST 2020, Loic Poulain wrote:

> A MHI client device should be child of the MHI controller device.
> Today both MHI controller and its MHI clients are direct children
> of the same bus device. This patch fixes the hierarchy.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

I like this, but have a nagging feeling that we discussed this during
the upstreaming of MHI. Mani, do you remember?

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  v2: fix commit message
> 
>  drivers/bus/mhi/core/init.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 436221c..c7a7354 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
>  	device_initialize(dev);
>  	dev->bus = &mhi_bus_type;
>  	dev->release = mhi_release_device;
> -	dev->parent = mhi_cntrl->cntrl_dev;
> +
> +	if (mhi_cntrl->mhi_dev) {
> +		/* for MHI client devices, parent is the MHI controller device */
> +		dev->parent = &mhi_cntrl->mhi_dev->dev;
> +	} else {
> +		/* for MHI controller device, parent is the bus device (e.g. pci device) */
> +		dev->parent = mhi_cntrl->cntrl_dev;
> +	}
> +
>  	mhi_dev->mhi_cntrl = mhi_cntrl;
>  	mhi_dev->dev_wake = 0;
>  
> -- 
> 2.7.4
> 
