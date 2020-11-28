Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED182C7393
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389261AbgK1Vt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732693AbgK1TCf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 14:02:35 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78673C061A04
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:42:26 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id x15so3649277pll.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CwrFEMTXbMYULa2eX6yDUN3k6a02SLNry4Pf/60VSho=;
        b=nVnf7zNHv5RWEHSo6bXGt3gtpfSYOQbxlug6AiTOrec+77fYxKHjFbZKfC1fLQWLOX
         BK3z+uO0Elr9s4qkF/vfROHeWVkliu/UUnEMJ+KaxbqJLev253BoEg4+lR7ByZ1vuvil
         V+Vicnfmvihx1NjdmbIwcAy64+rjeoF1WkKrBfDHMPnXoOm20GqzOQ20kfd1CsYCeiJ8
         SsmTx5NQpeHJMaN1NAV8p0bmQmt0Bg3JxOSSe8pRfppCL65rtS8bnFXdXHHi5VVjdgdx
         JDv48Or0taYIOz1nlo1zVIRiYUVCBVbIGa+aKL8pntwH+7tGtVJHNKY1HZ6XCZcTznUq
         myqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CwrFEMTXbMYULa2eX6yDUN3k6a02SLNry4Pf/60VSho=;
        b=kzOr5JaW/voyALst64yFVb5XMV2dRV3JwcLHaOOAaDqRfICmsL0fWJBDmZ1+ZPzqst
         A2cwf6aK3RXAWPWK+y/hO1XhdYfdhdfxl+EguT9tigsgWLFj/LUU+e6eK6owQaXFLVWF
         HrtqdY4nmUQt7JzZzno6X6olyVk3557F++TjjkArDZPNusWidlfnLiaad+pFrh37jft3
         J6299/G6Q/qqVGogTI+Zn7z2oLpxWWds2sBhxe5ivCuO6RoehZiEFvwU8Gl07/X22rUC
         fVlRmDUS5Z6rng4BmreHOiCAOYuu2EjzBHEp4M47g+ISJyaSukUD5mLv5RbZcUpHC4EC
         FAdg==
X-Gm-Message-State: AOAM530ounmBtmS4gBI7rCKugN/5/N14iA2J7NXs6UoG4pdvJ8ET/Myd
        zL9u3OpFSMRT5WxC/qm5vX29
X-Google-Smtp-Source: ABdhPJw1S9B9vckW0u5kOZfU04a5lS+g450OybcrFY86joJX8J874cyg2kopMAOmaDz2xXNkN94OVQ==
X-Received: by 2002:a17:902:7b97:b029:d8:ec6e:5c28 with SMTP id w23-20020a1709027b97b02900d8ec6e5c28mr9886257pll.40.1606542145663;
        Fri, 27 Nov 2020 21:42:25 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id e2sm12035037pjv.10.2020.11.27.21.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 21:42:24 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:12:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v3 1/9] mhi: Add mhi_controller_initialize helper
Message-ID: <20201128054219.GA3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606404547-10737-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 04:28:59PM +0100, Loic Poulain wrote:
> This function allows to initialize a mhi_controller structure.
> Today, it only zeroing the structure.
> 

That's what kzalloc is also doing, right?

Thanks,
Mani

> Use this function from mhi_alloc_controller so that any further
> initialization can be factorized in initalize function.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 7 +++++++
>  include/linux/mhi.h         | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 96cde9c..4acad28 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1021,11 +1021,18 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>  
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
> +{
> +	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
> +}
> +EXPORT_SYMBOL_GPL(mhi_initialize_controller);
> +
>  struct mhi_controller *mhi_alloc_controller(void)
>  {
>  	struct mhi_controller *mhi_cntrl;
>  
>  	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
> +	mhi_initialize_controller(mhi_cntrl);
>  
>  	return mhi_cntrl;
>  }
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 5721a0a..30c676d 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -537,6 +537,12 @@ struct mhi_driver {
>  #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
>  
>  /**
> + * mhi_initialize_controller - Initialize MHI Controller structure
> + * @mhi_cntrl: MHI controller structure to initialize
> + */
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
> +
> +/**
>   * mhi_alloc_controller - Allocate the MHI Controller structure
>   * Allocate the mhi_controller structure using zero initialized memory
>   */
> -- 
> 2.7.4
> 
