Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7570B2CB7B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 09:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgLBItO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 03:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729189AbgLBItO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 03:49:14 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2693FC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 00:48:34 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id f14so190957pju.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 00:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tp96G2AHrB73r1z1BoHvzEfn7IIGmrl7BW65FYcYYug=;
        b=ltIwClQJZNQ16zEXbv0c9JjxHpysqdrpM5sRIh0hsH9iwZOV1FAXefMutqpUsv/j+b
         wAhz09ClZdtI/gTifMt/j5CjVBymK84ZYbeQTqWfzgP7OfurigAQu3ECDx7jE0hrtz6X
         KLh+rUojbdXSLlE5QXFYimfzqqJP49d++mDw6blIsC1eK6ieNO29ciVSsdYJmDE3cOj5
         qxmpFUySgCx1FSqkpPBA5BU/5GRgLG8Rtv2nh7kc3MQ5SRDjaYQFfRglUFxxSesoiNFL
         dU5zCwkckusG5p8aV2UE2ipUjjv1fypNvyxVEL8MAtUqryc9L7Z9esgxstmV5yRtJATi
         +wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tp96G2AHrB73r1z1BoHvzEfn7IIGmrl7BW65FYcYYug=;
        b=c53QKcx0DnLT0w4otRkpknfNIxBRnH9FbH0uGYiH1R5ljrx8JwfhDApEVTI8ZWgaXa
         fx0V0JC2vydPYFHlaa6D6OfWV4cViqRSBoztheBhjj99wWEg++1lNUQCDRljXFqVi3+h
         MuaaGvrF8evkVeHet/HzcqXlzn8+0Dx7SHwoNloqYMW1ES4slE7c8WflABiRmq01rhCr
         Y7/QcENkZFhbrXpcyEDurBiXhACtbfdyTlFKHmfwlvwyq0J//D+v2BP9UsN1aKlkWN7v
         ecENMNF/Jx3KfpSfDRUGZ0tyPbgt24wtpt5r4OivUrXbTALxX5YhDbRfqD6bGfS1rjsq
         PiCw==
X-Gm-Message-State: AOAM5313jl7cWka91Dgl1Slg5Ld8b8MwLlfSVu/fACAjPLc4zGR6KWRg
        o2QSV5wwc3WBdNi/kXRa5Lqm
X-Google-Smtp-Source: ABdhPJz7YQwvPyGMjS0cVjJSeXE2aF+iIXrYywjlQezQhWY1aTKsSXel1g6k5o1adSpamVNep88WbA==
X-Received: by 2002:a17:90a:fd08:: with SMTP id cv8mr1395031pjb.29.1606898913622;
        Wed, 02 Dec 2020 00:48:33 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id 17sm1564578pfh.173.2020.12.02.00.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 00:48:33 -0800 (PST)
Date:   Wed, 2 Dec 2020 14:18:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] mhi: pci_generic: Fix implicit conversion warning
Message-ID: <20201202084827.GB3241@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
