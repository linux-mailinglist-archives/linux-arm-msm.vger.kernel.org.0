Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03EEC267D6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 05:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgIMDOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 23:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgIMDOq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 23:14:46 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24394C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 20:14:46 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id c13so13866582oiy.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 20:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eCqlMmeFwnaJqMzKobKwxzuAcoUu5Y/KrYbNh4cg/CI=;
        b=DSkn8ROU3zelVpsj2ReGD/hlM9SmL8+oVHeuo55D3Ic0A6eMcy5rkmr99lJJzVFgZo
         8gUsA0TI+kmEXjjmeOQh6QNCZsbI8E0b1I14BakseeoBK2LIdqXrPdEhoSKSLbp2Bu3K
         +UyKDxO97lMNDMcpJjVvVQbFBCEgJx5kcua5mSGE/Pq859gjwaGn+Lec2G++4Z/wS1dK
         WJYf5gt/PDgM/aZR5xORixMOF17AHJ0KiYoJEfUouANo012fcDfXjes/jUKVdWG3j7W7
         4+VD16X+/V971rzUV+N6mXkdlnh1T1e+9WTMD1pZCBXxiqky3Rl+zcxN0EcbPRrHC1+S
         r5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eCqlMmeFwnaJqMzKobKwxzuAcoUu5Y/KrYbNh4cg/CI=;
        b=A9P/UenqiB5bLCXStskvd685UraCUOc0L/WS2yNZm0iz349i1hW06oYX82Pl/1Fm6S
         aXM4A7G+qSJyYqPOGh8lJDnmjsbSld70z7MQKTTPYLXKE9uk9lZTdVkRGsWnjWHXI0zg
         VMpwEgS7xyaLCVvIQbSuBiPcf0a5aAOzKKcV3UFVbZcxfDaCpqY2Eg8LO5NIXM5yexLx
         YSNhFyqYnkkVjv51aYCp7Z+CvtWNBXa1VkG0QX79f5QhE1a0RhS6Msa+v22Zohp2reRl
         2ZStnNOrw9DS5G8nnnayKg4K1FHRxMLaz996ZWxfDKQcwAEootjUGo/ee0pS12Q3hYdZ
         8+/A==
X-Gm-Message-State: AOAM530wJKmNw+Rqub4J8ZzIftdLWM1xQoribeXNmu5u21f/TXaFu2GI
        2xQcAJeq8HpeXIb7AP3KgIvcHA==
X-Google-Smtp-Source: ABdhPJwbeFPrbjxKAQIpdugGlybxZzVcWEtLsjEIfZtzkecp8+WvSdNWhEUJeeUEm54+jzLXONtJoQ==
X-Received: by 2002:a05:6808:601:: with SMTP id y1mr5490419oih.9.1599966885546;
        Sat, 12 Sep 2020 20:14:45 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id w19sm1192469otq.70.2020.09.12.20.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 20:14:44 -0700 (PDT)
Date:   Sat, 12 Sep 2020 22:14:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     freedreno@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: fix probe without iommu
Message-ID: <20200913031442.GS3715@yoga>
References: <20200911160854.484114-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911160854.484114-1-luca@z3ntu.xyz>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 11 Sep 11:08 CDT 2020, Luca Weiss wrote:

> The function iommu_domain_alloc returns NULL on platforms without IOMMU
> such as msm8974. This resulted in PTR_ERR(-ENODEV) being assigned to
> gpu->aspace so the correct code path wasn't taken.
> 
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
