Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E532A421AB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbhJDXes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbhJDXep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:34:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEF6C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 16:32:56 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y15so12722584lfk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 16:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bRhtxMYNMMjc9yrBuvHKCrG43c9/TrL576pC79Lp13I=;
        b=T+J+9aMQB2c8kMQ038lJ7lSxDX7Y9PFtHfxEl9IavvNrhWjgeE5e0mjRJz/XLRcu8c
         CPdf1ojrTl5YfjtTqTPWctgpZnLGhgStRTbZjP+ZV89Yohzu2AfX4lxrWLipVgILEfmU
         WyHNcGYu1RDSGJicYqsR+1KAVEIlJqYBQJaQI95Ic0ZWtz8mc1Ha8SXlioutst/iqeWF
         NvDCidcpkWcjQqNgGjHWXZCcGVf6fvrHGV7nHsh0I6m98ZXUeb5XiePlwtYV8MEBWmau
         jaNqYsdohaYkUs70lJTx5Mdhs/S8qvrJzpcOhtqGFQbqyGi6l/HYy1D+MRJSgi/B0Q6I
         7UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bRhtxMYNMMjc9yrBuvHKCrG43c9/TrL576pC79Lp13I=;
        b=6uZm6QIIlqZ89/ENWrYIsAix2vI0jP7xomXixVS/bUIEYFGQT8b6nUFP8ZRtiejdnz
         vsKJBFXFipdHkvhfA4dRUta0MqJ1/XiA9P8eG6kD0zZRZ2if3BN5ONPKRAqDLYjh/IJY
         VpRO/rhVbUDzmSwrapakbxGhLKeqYWZ/gY7QzvMcAFFeoSZTWThgZHQ5qR2QBtTLO3NA
         iV1NEX5OehNFeNRVPTwY+79FOcB06QRmyV0730Biy/aufZf3mFylgOUcvogd/EGDw9jv
         EycNbaBg8YRJVBZ4I4snS6En4eCcjsbf1XR/jVRvk6Z0lzkpDKmEKSRc4KBUgo9i16kD
         FOhA==
X-Gm-Message-State: AOAM533F0lte5oHxr4C1utyMlE8eAb7qzsqI00FK4wATTUfAygN60+YK
        baIXHnk1Vj4se621fEfVAAYHqA==
X-Google-Smtp-Source: ABdhPJx5D/0n9bCdRZ6aBhCGktRui4qXKFbgegybOF3Sj14vtcmlOuuhd7iE1kVwVh/00ITVLlYoDg==
X-Received: by 2002:a05:6512:3181:: with SMTP id i1mr3328077lfe.29.1633390374526;
        Mon, 04 Oct 2021 16:32:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o23sm1727765lfc.172.2021.10.04.16.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 16:32:54 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Fix potential Oops in a6xx_gmu_rpmh_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211004134530.GB11689@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <1f99aa52-c781-05ee-6310-0cb0f9ec4782@linaro.org>
Date:   Tue, 5 Oct 2021 02:32:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211004134530.GB11689@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2021 16:45, Dan Carpenter wrote:
> There are two problems here:
> 1) The "seqptr" is used uninitalized when we free it at the end.

This looks like a nice catch, potentially causing troubles.

> 2) The a6xx_gmu_get_mmio() function returns error pointers.  It never
>     returns true.
> 
> Fixes: 64245fc55172 ("drm/msm/a6xx: use AOP-initialized PDC for a650")
> Fixes: f8fc924e088e ("drm/msm/a6xx: Fix PDC register overlap")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index a7c58018959f..3bd6e579ea89 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -512,11 +512,11 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>   	struct platform_device *pdev = to_platform_device(gmu->dev);
>   	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
> -	void __iomem *seqptr;
> +	void __iomem *seqptr = NULL;
>   	uint32_t pdc_address_offset;
>   	bool pdc_in_aop = false;
>   
> -	if (!pdcptr)
> +	if (IS_ERR(pdcptr))
>   		goto err;
>   
>   	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
> @@ -528,7 +528,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   
>   	if (!pdc_in_aop) {
>   		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> -		if (!seqptr)
> +		if (IS_ERR(seqptr))
>   			goto err;
>   	}
>   
> 


-- 
With best wishes
Dmitry
