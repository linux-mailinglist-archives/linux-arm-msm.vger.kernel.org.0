Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C39D028BC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 22:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387533AbfEWUqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 16:46:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46268 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387394AbfEWUqp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 16:46:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6F44660C8B; Thu, 23 May 2019 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644404;
        bh=Ir/HRhOrB0L3PO9O6yHN6CugZdjLH2Ob1K2L92FVfHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h3RKebO6g5Uo1nTjJ+nT7mURYYRzLOcnu4Gq7WW2uPmAms0caAp6qoyE3HVPaBMW1
         XyJWqwWJjJ+p8IGu9EngDXcsSYYeY/Sizo4VshjB+aH50GaJfvoWnOLiyLssNNlls9
         g+E+NKaH/QJ7i9xv8bt4akt+tWaey5t8Ot8dr52Y=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF69E6030E;
        Thu, 23 May 2019 20:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644403;
        bh=Ir/HRhOrB0L3PO9O6yHN6CugZdjLH2Ob1K2L92FVfHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K/6jQpMR+YFjj3a/oinAU4mvGY8z1dIPxmsKp6Tn6Rij0bFY9HQWt25dlgUfTha6y
         HoB9xcWHP8d1vi8+6UWwKWTQ1gIQn6VvvwhWcNIXpd9zDKpQ6g5xuEMRhjZ91KVq4u
         a4JdS61QZJx3oL/dpqgnn197t56Vzn6x50bEBipc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF69E6030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 May 2019 14:46:41 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Avoid freeing gmu resources
 multiple times
Message-ID: <20190523204640.GB18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 23, 2019 at 01:16:40PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The driver checks for gmu->mmio as a sign that the device has been
> initialized, however there are failures in probe below the mmio init.
> If one of those is hit, mmio will be non-null but freed.
> 
> In that case, a6xx_gmu_probe will return an error to a6xx_gpu_init which
> will in turn call a6xx_gmu_remove which checks gmu->mmio and tries to free
> resources for a second time. This causes a great boom.
> 
> Fix this by adding an initialized member to gmu which is set on
> successful probe and cleared on removal.
> 
> Changes in v2:
> - None
> 
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 +++++++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 38e2cfa9cec7..aa84edb25d91 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -74,7 +74,7 @@ bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
>  	u32 val;
>  
>  	/* This can be called from gpu state code so make sure GMU is valid */
> -	if (IS_ERR_OR_NULL(gmu->mmio))
> +	if (!gmu->initialized)
>  		return false;
>  
>  	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
> @@ -90,7 +90,7 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
>  	u32 val;
>  
>  	/* This can be called from gpu state code so make sure GMU is valid */
> -	if (IS_ERR_OR_NULL(gmu->mmio))
> +	if (!gmu->initialized)
>  		return false;
>  
>  	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
> @@ -695,7 +695,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	int status, ret;
>  
> -	if (WARN(!gmu->mmio, "The GMU is not set up yet\n"))
> +	if (WARN(!gmu->initialized, "The GMU is not set up yet\n"))
>  		return 0;
>  
>  	gmu->hung = false;
> @@ -765,7 +765,7 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu)
>  {
>  	u32 reg;
>  
> -	if (!gmu->mmio)
> +	if (!gmu->initialized)
>  		return true;
>  
>  	reg = gmu_read(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS);
> @@ -1227,7 +1227,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  {
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  
> -	if (IS_ERR_OR_NULL(gmu->mmio))
> +	if (!gmu->initialized)
>  		return;
>  
>  	a6xx_gmu_stop(a6xx_gpu);
> @@ -1245,6 +1245,8 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  	iommu_detach_device(gmu->domain, gmu->dev);
>  
>  	iommu_domain_free(gmu->domain);
> +
> +	gmu->initialized = false;
>  }
>  
>  int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> @@ -1309,6 +1311,8 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	/* Set up the HFI queues */
>  	a6xx_hfi_init(gmu);
>  
> +	gmu->initialized = true;
> +
>  	return 0;
>  err:
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index bedd8e6a63aa..39a26dd63674 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -75,6 +75,7 @@ struct a6xx_gmu {
>  
>  	struct a6xx_hfi_queue queues[2];
>  
> +	bool initialized;
>  	bool hung;
>  };
>  
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
