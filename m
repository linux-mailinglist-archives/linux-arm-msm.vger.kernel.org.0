Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F452CB809
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgLBJCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgLBJCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:02:45 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1218C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:02:04 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id y7so809053pfq.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fvwqn31JYyyF1xgbFZ5kR6M9reFQuUdK9OaCX7F1Sfg=;
        b=YBN2sIrWXTgcd/9oMiPdOV7OeP+x1g2CmjepOpqXEGxWz4lsUOxR8tx3QhAUfNLZE3
         qO9JJ5dIvD9x1qnV49l55JU5uyu9gNnMHVTaBuPR40ThFICXoKvR/o4XSfInbbo6kVQh
         nyrphtvHfLcL4u4VL3HLYq5YD4/J5x2PK/LCGIJeelTbRI0VXc7fIKZYtr04WQyk/fBE
         m+4uGvFMdS9wpl31HhVgDDtlU8OhZCktTUnTvRsBWBW7cYOHJghKj25RAD92Knt6L6ZE
         o38gzr+XXZOmHc/uZPT7sIAH8Q8WvIffZCoeA7X0MJSEDIhgNuMMztMSVIPdp8DiTWSP
         Nk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fvwqn31JYyyF1xgbFZ5kR6M9reFQuUdK9OaCX7F1Sfg=;
        b=KHZgeBhs58lrrECgHSbNyJvhE7zTJ9wonKnFDmjtDOWRR06rszwIXRuRsLa0KD3DSC
         q4X3JcQ6KqptUY7aH/dZ+SJ7qZlq74V6vd/OO84p0rRyXrj7Ii3v4wcZ3MhC9OQFxaH0
         L/7yN5tO78lkcoNOaDkrw/yN3yaY+EHdvb0QpNWCCh+rhVIGGG4W8uOGBUL+398hGha0
         wHa7kUeujDiCeZNTNwV+p0QRkPeyRYXEE7PHvk2IdPscrNUCZdzAiVcoDWJTzYcBg+lV
         LK4SJdrsukfkPqH7SRVxdqxakasVaXEBQxiXsGft4nJtj1Cbfky4cMWCSH/FRDUYg6lC
         9fWA==
X-Gm-Message-State: AOAM533ueXVVVSUfG9pI4/Vr64y+HlwGInjF+ZWe0W+xreu/Wt0Y4Iqm
        3/nFHklWbE9cPuprpwFN6P1Y1IL/G7UV
X-Google-Smtp-Source: ABdhPJw1ef/Mb8AoVItci/+tvR2lf+OOGaYfMXy7gdO3m4wT3QmLHcsRE5JIfHQCBASlCM2Zg2dSkg==
X-Received: by 2002:aa7:8297:0:b029:198:15b2:ed0a with SMTP id s23-20020aa782970000b029019815b2ed0amr1652033pfm.47.1606899724135;
        Wed, 02 Dec 2020 01:02:04 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id u24sm1699241pfm.81.2020.12.02.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:02:03 -0800 (PST)
Date:   Wed, 2 Dec 2020 14:31:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] mhi: pci_generic: Fix implicit conversion warning
Message-ID: <20201202090157.GC3241@thinkpad>
References: <1606896750-18198-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606896750-18198-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 02, 2020 at 09:12:30AM +0100, Loic Poulain wrote:
> Fix the following warning with explicit cast:
> 
> warning: implicit conversion from 'unsigned long long' to
> 'dma_addr_t' (aka 'unsigned int')
> mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> 
> Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: Add fixes tag
> 
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index cfee0db..0912885 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -406,7 +406,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_initialize_controller(mhi_cntrl);
>  	mhi_cntrl->cntrl_dev = &pdev->dev;
>  	mhi_cntrl->iova_start = 0;
> -	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> +	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
>  	mhi_cntrl->fw_image = info->fw;
>  	mhi_cntrl->edl_image = info->edl;
>  
> -- 
> 2.7.4
> 
