Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183FD482E50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jan 2022 06:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiACFwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jan 2022 00:52:03 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44166 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiACFwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jan 2022 00:52:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 24951B80989
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jan 2022 05:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA07C36AEB;
        Mon,  3 Jan 2022 05:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641189120;
        bh=Rvdd71uzdWwOSe7+yhScwEDQuAfW55HrUBLeHi9rhPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LgPw8OWSLgkN3lCpvTt0bPlghy/ha3PBlcersBkE6W5gJcH0sGdkfbrmvnGLNya4Z
         51AKmPdvdoi/K26sqv61xKvvEUw4o4eeFot+19srcfFecq40QNrHInGG6xeglVaGFr
         C37FY5H61YDbOEuYxcLytKNMWQ0sRbrR5FiezeV3riMxlyML+d9pcwR2UiJwmuOGF/
         Rb2V7sbMLbRy8fRh4fIUFlOUR4Gs7vdanLA8RkUwdoVMtkpsy/HyXdhf2hOeqDtiAk
         OOK6Hmjpw6/amQEYtdYIwMrM17q3tDXk5ABFq86tDopud6W1yNiL25pY7VdSjW4uvT
         ds/KL7TMUKN9g==
Date:   Mon, 3 Jan 2022 11:21:52 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org, baruch@tkos.co.il
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Message-ID: <20220103055152.GA3581@thinkpad>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
 <20220103030316.58301-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103030316.58301-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 03, 2022 at 03:03:15AM +0000, Bryan O'Donoghue wrote:
> Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
> partition parser was returning -EPROBE_DEFER waiting for the main smem
> driver to load.
> 
> This caused the board to reset. Playing about with the probe() function
> shows that the problem lies in the core clock being switched off before the
> nandc_unalloc() routine has completed.
> 
> If we look at how qcom_nandc_remove() tears down allocated resources we see
> the expected order is
> 
> qcom_nandc_unalloc(nandc);
> 
> clk_disable_unprepare(nandc->aon_clk);
> clk_disable_unprepare(nandc->core_clk);
> 
> dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
> 		   DMA_BIDIRECTIONAL, 0);
> 
> Tweaking probe() to both bring up and tear-down in that order removes the
> reset if we end up deferring elsewhere.
> 
> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Can you please CC stable list for backporting?

Thanks,
Mani

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 04e6f7b267064..0f41a9a421575 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2,7 +2,6 @@
>  /*
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>   */
> -
>  #include <linux/clk.h>
>  #include <linux/slab.h>
>  #include <linux/bitops.h>
> @@ -3063,10 +3062,6 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  	if (dma_mapping_error(dev, nandc->base_dma))
>  		return -ENXIO;
>  
> -	ret = qcom_nandc_alloc(nandc);
> -	if (ret)
> -		goto err_nandc_alloc;
> -
>  	ret = clk_prepare_enable(nandc->core_clk);
>  	if (ret)
>  		goto err_core_clk;
> @@ -3075,6 +3070,10 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_aon_clk;
>  
> +	ret = qcom_nandc_alloc(nandc);
> +	if (ret)
> +		goto err_nandc_alloc;
> +
>  	ret = qcom_nandc_setup(nandc);
>  	if (ret)
>  		goto err_setup;
> @@ -3086,15 +3085,14 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_setup:
> +	qcom_nandc_unalloc(nandc);
> +err_nandc_alloc:
>  	clk_disable_unprepare(nandc->aon_clk);
>  err_aon_clk:
>  	clk_disable_unprepare(nandc->core_clk);
>  err_core_clk:
> -	qcom_nandc_unalloc(nandc);
> -err_nandc_alloc:
>  	dma_unmap_resource(dev, res->start, resource_size(res),
>  			   DMA_BIDIRECTIONAL, 0);
> -
>  	return ret;
>  }
>  
> -- 
> 2.33.0
> 
