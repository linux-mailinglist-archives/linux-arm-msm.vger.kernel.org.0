Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC09B2C2F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403815AbgKXRsw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbgKXRsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:48:51 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D016C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:48:50 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id 18so11047107pli.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aupDT8jvCk1IWXvxPS3LZ2iJRHfVeSO0EYPm7jHxnx0=;
        b=r05QW/tNhoEq/mTDsTZ3GY5g7YcxAQY0YxHhfm7V0u9k5Nfnd0QisJqA52dghjHLgx
         6cmTBKig7ov8HaYT294CHZ6+W85kBC6kRG3fZevnFOIXno6RKV80OiW1UHotPvrbsc5G
         PI9AOwhB8IoKCzNDIn+RhHFT+9bGr45Li6wjJdrOIt/Do8JvT22JixGt2CVKeW1SgzNQ
         jm3TjBbXQf+PduEMm84aQfVKMbKUpNymxEDj/s5p4E+GXsls2BoevhIgIvO53YU//lXG
         f6s6QTxW2dXBeyXXmkJrPTtBEr0WrDWkSvjUDjkTk+lCMKaMgCfTeyVW+Q5BZ94rLc+t
         amJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aupDT8jvCk1IWXvxPS3LZ2iJRHfVeSO0EYPm7jHxnx0=;
        b=bUZ2BozUihL61xVJmXqPyz9Qsqr2R+ZpYKCuU16ZUxTCj0pZQkc+1gMVEc+IShjPqK
         aLJAZqS+ci9eEcoEEpJrOXUb5gYqDDX4cJ7O1n4Z7TyYEkQaV0QN4jKRMzslLk2SmiR6
         WQtqEOw23CjDmt11touLD04CXQyCsApi/n2/c2aoPtIH1PA2vIr8rCjJD1aZ1XSiiOuU
         rLm8EKuEu95qmIF9XSRzEK3LuC2FGwZ+04WWBMQeAYM4KPaAMvIxS0dvj81VLXxGU/Lz
         IPHZQcsdCNnKwQtRUF9RgRtzotvTjU2r72G3UQQbQu3/bPKe/X6xrhDchOCvS7UCvT3v
         vRHw==
X-Gm-Message-State: AOAM530gW1OS+bhdrRMPqY7AIbujKZhXd5AbyTkOJr3Z/53tibMsm3p8
        dYV88KqQnk18yyA/P6FDdKykqkMJTWVq
X-Google-Smtp-Source: ABdhPJySy7rRRHdqj4Esx86Jes8cPPRENLXATnM9mpj/bszZ5iZyE848W8QLoZpT/64zdJ8cVWgcwA==
X-Received: by 2002:a17:902:b58a:b029:d7:d45c:481c with SMTP id a10-20020a170902b58ab02900d7d45c481cmr4998224pls.55.1606240129638;
        Tue, 24 Nov 2020 09:48:49 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id g16sm15185224pfb.201.2020.11.24.09.48.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 09:48:48 -0800 (PST)
Date:   Tue, 24 Nov 2020 23:18:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix device hierarchy issue
Message-ID: <20201124174843.GB16720@work>
References: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 24, 2020 at 05:18:31PM +0100, Loic Poulain wrote:
> A MHI client device should be child of the MHI controller device.
> Today both MHI controller and its MHI clients are direct children
> of the same bus device. This patch fixes the hierarchy.
> 

Change looks good to me but as Jeff said, please elaborate the commit
message to justify the reasoning behind this.

Thanks,
Mani

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
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
