Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BF3266A3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 23:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgIKVpf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 17:45:35 -0400
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:54014
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbgIKVpe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 17:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599860733;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=ugAF6M/Vv/bl8EUYaXGQWHTNSpMHFIh6qv//R/9KMqM=;
        b=ApXw3N5U4vfIXj/lc8+devRlVa8clYL0ViOf62lx+v+3gJCI/k99Q+GmB/bfwpRc
        3LNfBPTlmAJd2q9z0ZAozW8+m/iaWhKZtWuf6tN1ysQtf2HesKWIMWKqptXoV9oh/5t
        OyG1MDKaTMe3oS6gC0W02rCOBl412SbOsLn+yIws=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599860733;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=ugAF6M/Vv/bl8EUYaXGQWHTNSpMHFIh6qv//R/9KMqM=;
        b=hkSNI3rQ7iZS6LPFHx8jRyFpwFwa6KYapEjugOyZ6XcZXi/EPxQF1HZP/gV370wi
        edROp9RSGjkN1fZmTR6LnmsXRqBVoIDQsMbopHEla9Z9HLgQ5ZRgM3gtLzXCBl9SJHE
        mQECZWc1vM095O4vcHoB2g/+wx2RrnUEYlduXmGY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7004EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Fri, 11 Sep 2020 21:45:33 +0000
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     freedreno@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: fix probe without iommu
Message-ID: <010101747f21758f-a93ae818-f39a-4b40-b609-c5da56bb4040-000000@us-west-2.amazonses.com>
Mail-Followup-To: Luca Weiss <luca@z3ntu.xyz>,
        freedreno@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        John Stultz <john.stultz@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200911160854.484114-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911160854.484114-1-luca@z3ntu.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2020.09.11-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 11, 2020 at 06:08:53PM +0200, Luca Weiss wrote:
> The function iommu_domain_alloc returns NULL on platforms without IOMMU
> such as msm8974. This resulted in PTR_ERR(-ENODEV) being assigned to
> gpu->aspace so the correct code path wasn't taken.
> 
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 862dd35b27d3..6e8bef1a9ea2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -189,10 +189,16 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>  		struct platform_device *pdev)
>  {
> -	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> -	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> +	struct iommu_domain *iommu;
> +	struct msm_mmu *mmu;
>  	struct msm_gem_address_space *aspace;
>  
> +	iommu = iommu_domain_alloc(&platform_bus_type);
> +	if (!iommu)
> +		return NULL;
> +
> +	mmu = msm_iommu_new(&pdev->dev, iommu);
> +
>  	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
>  		0xffffffff - SZ_16M);
>  
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
