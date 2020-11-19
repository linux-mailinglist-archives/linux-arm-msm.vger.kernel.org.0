Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA642B9CDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 22:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgKSVVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 16:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgKSVVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 16:21:02 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9163C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 13:21:02 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id r7so6956552qkf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 13:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GEX5h8qqgdAsDqn7VEch7OqrvkwYAh8vDfHyaYgJ2Hk=;
        b=XuHvE5pivaR9qCU5G3BtLfHfphhZXyKtgEIr1uSWjmJyt0QtnVdupuAv8dQgQyLM0v
         P1npfhXwxT9YT/EALL6fzwFVAzdFeRJFMpGxn+1+DKaaVWURnX2X3vwYb253UEWgrCKJ
         SgmWtkGo3J2du2ArCNk59HHfZrYjhQ8gGt6CSmr27m4uoWX3zTxSouJTLlwi7h4z4WJG
         5K1W0F46ppZdne18VTEC7r9IvSpkgT2nFDq3nkNtFYlGDrqb1+BAi40vgyGp05KTin4x
         p0fMtQ1aAViwuet6j0lILjg3YopGEhTna7vCZp2f31a5olExG3mwa/LYHd2ZpUesOudV
         ZIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GEX5h8qqgdAsDqn7VEch7OqrvkwYAh8vDfHyaYgJ2Hk=;
        b=EVG+1sde1sjgFTSAvTaDxSEupE6qgB9o+Orqk0h9CDh2/7Nov8VTXIyLlwP76HCHJQ
         zT//z/MTUIVi9n+YVVuOSivGIq+17n2gwZit4YdrEfWGfFwAwoziCpCK1Wz1eypabHhx
         SWjuJf2DJiu/PZzVM1kvjx3DkVQeTu+9KZ+qPW5vcNC3ikCOwSP7LKRAm4oufSpBIolb
         zvfvOBhadwB41zatS2oHfEH1muBhzU+rNzs/PCeljtEgmGi1IODrSMNPAXD7L10BnBti
         6EN1CGxejKvKzY4LalvMiYRSzZVxqBrTPQ6DLm4BAuIc5f4exlEii9hFzTrAmxH8ohGm
         84RQ==
X-Gm-Message-State: AOAM5305+ApS4ivwLLsbSpLpjpMTTdMc7lNAdgO17jDjJbvL62ffak2P
        ZbA3Lh8DYbcfCuXpT2sZguk=
X-Google-Smtp-Source: ABdhPJz1YKr+YIZYqmc5EMaVKnMvfef0V1DDsm+3ltXzwVeWSEEDObPyK/56a6h5GiKiLR8VnDugiw==
X-Received: by 2002:ae9:f015:: with SMTP id l21mr13472540qkg.205.1605820861735;
        Thu, 19 Nov 2020 13:21:01 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id w54sm844705qtb.0.2020.11.19.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 13:21:01 -0800 (PST)
Date:   Thu, 19 Nov 2020 14:20:59 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mhi: pci_generic: Fix implicit conversion warning
Message-ID: <20201119212059.GA676197@ubuntu-m3-large-x86>
References: <1605781171-29093-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605781171-29093-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 19, 2020 at 11:19:31AM +0100, Loic Poulain wrote:
> Fix the following warning with explicit cast:
> 
> warning: implicit conversion from 'unsigned long long' to
> 'dma_addr_t' (aka 'unsigned int')
> mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 17c6448..3337c6d 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -411,7 +411,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl = &mhi_pdev->mhi_cntrl;
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
