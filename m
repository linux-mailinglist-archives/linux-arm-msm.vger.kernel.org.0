Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA83A28BE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 22:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387894AbfEWUv4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 16:51:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49554 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387885AbfEWUv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 16:51:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EA19C60E42; Thu, 23 May 2019 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644714;
        bh=YV+gAwwbS79U/5jkzKimUPb7BPvziSeuL9ft4ZBfyp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bu0Q70BFcoTXFzp3Ph2zeeZYZ+3Bs4QKUWUag/BIw0krkQw5oVkdsefOszz0JoC2m
         +6rJSt63tWZM9gqobqD490vsaTSfdush1oQjjrTacZf6aj+O5JMOfPGKEkQZCcxciC
         +tMILimbic9eWWk6leoXwr79GGSrS4XmSbhnVLzk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5900F6030E;
        Thu, 23 May 2019 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644713;
        bh=YV+gAwwbS79U/5jkzKimUPb7BPvziSeuL9ft4ZBfyp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i94FTHJC6TLAb3YTlqRnWIXo3Ry0FDQLxkcXoeNT4N+h1BzSNHJVvNhmNIiUjlqUs
         GrtSl3Q7RgGvsYN98j+fLtDL8K3GSUwL95uoRUuupS9FJkwTUThlB00jEvjqVnCJaX
         fkgSFtOBgjRD9xn2n1SPfijhMsHFguwdL+9B9VCo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5900F6030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 May 2019 14:51:51 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drm/msm/a6xx: Remove devm calls from gmu driver
Message-ID: <20190523205151.GE18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-4-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-4-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 23, 2019 at 01:16:43PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The gmu driver is initialized and cleaned up with calls from the gpu driver. As
> such, the platform device stays valid after a6xx_gmu_remove is called and the
> device managed resources are not freed. In the case of gpu probe failures or
> unbind, these resources will remain managed.
> 
> If the gpu bind is run again (eg: if there's a probe defer somewhere in msm),
> these resources will be initialized again for the same device, creating multiple
> references. In the case of irqs, this causes failures since the irqs are
> not shared (nor should they be).
> 
> This patch removes all devm_* calls and manually cleans things up in
> gmu_remove.
> 
> Changes in v2:
> - Add iounmap and free_irq to gmu_probe error paths
> 
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

As we discussed in IRC, I feel like the way we are probing and dealing with
the GMU device is messing up the reference counting. I had hoped that a
put_device() would do the trick but testing showed it didn't so there is clearly
remaining fail that we should eventually find and fix.

That said; there is really no reason to be using managed resources for this
device so this is an entirely appropriate patch.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 ++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 7465423e9b71..f7240c9e11fb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -505,9 +505,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  
>  err:
>  	if (!IS_ERR_OR_NULL(pdcptr))
> -		devm_iounmap(gmu->dev, pdcptr);
> +		iounmap(pdcptr);
>  	if (!IS_ERR_OR_NULL(seqptr))
> -		devm_iounmap(gmu->dev, seqptr);
> +		iounmap(seqptr);
>  }
>  
>  /*
> @@ -1197,7 +1197,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	ret = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	ret = ioremap(res->start, resource_size(res));
>  	if (!ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>  		return ERR_PTR(-EINVAL);
> @@ -1213,10 +1213,10 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
>  
>  	irq = platform_get_irq_byname(pdev, name);
>  
> -	ret = devm_request_irq(&pdev->dev, irq, handler, IRQF_TRIGGER_HIGH,
> -		name, gmu);
> +	ret = request_irq(irq, handler, IRQF_TRIGGER_HIGH, name, gmu);
>  	if (ret) {
> -		DRM_DEV_ERROR(&pdev->dev, "Unable to get interrupt %s\n", name);
> +		DRM_DEV_ERROR(&pdev->dev, "Unable to get interrupt %s %d\n",
> +			      name, ret);
>  		return ret;
>  	}
>  
> @@ -1241,12 +1241,18 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  		dev_pm_domain_detach(gmu->gxpd, false);
>  	}
>  
> +	iounmap(gmu->mmio);
> +	gmu->mmio = NULL;
> +
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);
>  
>  	iommu_detach_device(gmu->domain, gmu->dev);
>  
>  	iommu_domain_free(gmu->domain);
>  
> +	free_irq(gmu->gmu_irq, gmu);
> +	free_irq(gmu->hfi_irq, gmu);
> +
>  	gmu->initialized = false;
>  }
>  
> @@ -1281,24 +1287,24 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	/* Allocate memory for for the HFI queues */
>  	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
>  	if (IS_ERR(gmu->hfi))
> -		goto err;
> +		goto err_memory;
>  
>  	/* Allocate memory for the GMU debug region */
>  	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K);
>  	if (IS_ERR(gmu->debug))
> -		goto err;
> +		goto err_memory;
>  
>  	/* Map the GMU registers */
>  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>  	if (IS_ERR(gmu->mmio))
> -		goto err;
> +		goto err_memory;
>  
>  	/* Get the HFI and GMU interrupts */
>  	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
>  	gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
>  
>  	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
> -		goto err;
> +		goto err_mmio;
>  
>  	/*
>  	 * Get a link to the GX power domain to reset the GPU in case of GMU
> @@ -1315,7 +1321,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	gmu->initialized = true;
>  
>  	return 0;
> -err:
> +
> +err_mmio:
> +	iounmap(gmu->mmio);
> +	free_irq(gmu->gmu_irq, gmu);
> +	free_irq(gmu->hfi_irq, gmu);
> +err_memory:
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);
>  
>  	if (gmu->domain) {
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
