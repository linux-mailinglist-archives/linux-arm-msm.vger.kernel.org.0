Return-Path: <linux-arm-msm+bounces-39681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD79DEE90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB1616148F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76670487A5;
	Sat, 30 Nov 2024 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TkStegRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FB320ED
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931890; cv=none; b=F9cXli0W8IvDbGLPzghxFyqO9yHnzpnYvr74PoL9Y+K9W14M1NdV4FJxCW12258tfjsT7QljYGXXQREdd/95R6/29lNpenXWfFmvlKzoyKVL5CVBTm5Zo6HJdb1vefiERbDEL9Pds+GjcLboYdKMWpwE7tk7wKc4Jj/uUsy7m3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931890; c=relaxed/simple;
	bh=QUtxboWEpYzPJBkc8MA4gPeiIpTOWy0lung4mPgZhfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfZ14Dkl66aeL94sGx2JtAN3oq3rmO5mQAZxIhriCy3JvN5z9GYEq8MFmNWHCFV2weLd4L4z6NV5z9IklfFjA7XLs9Rx2yB7KXI/RyNHvZS16XDXPf4u4cXMGu3b4ZI4cpI+n8pST7ugDWmJmqrjh7rxOQT3C/eY6sbyIZSWyUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TkStegRA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffc357ea33so26640981fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931886; x=1733536686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8OZWsrIrTwnUzalAhGoRoN2jmtZFU/SWdczT+zM8Bg=;
        b=TkStegRAUbkMDjlaeR2iTQ1hHFPbLFzrfeUhUR/7YX7VLgocltQ6At78/UkyQc3uta
         kMy39ebV9GnruJZKq5bAd81suct7lege1zhcFgYGn9v8qLRje9JDUDZ3YrchehuCE9si
         ErDTQJleokSm9Xo+XQOCAhAS3ZIICmAzbNKZxIpXyArOqcOYK3T7/IeLirZIyDb30p75
         fkhZ3aAq9GOe1dVqXnoR0WXv3a8J8JQAt4gSfC8lTwxBAoWih4WMMWsovzZTTh6nsj7/
         6TrOOS5St6PmK+ZeE1jUP8lekF935sB9OZHUVD1D/335tVDs+1+YPAM9lXQAQI6DWGAI
         7nEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931886; x=1733536686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8OZWsrIrTwnUzalAhGoRoN2jmtZFU/SWdczT+zM8Bg=;
        b=IclUcVAyyB5zMUfYv0FDmlmypxwcMnphb87sq+xSiCdGGhWQ4elKL5aiJ0ElX0KILQ
         DNYW6mA8s8kzsrYHvdY/tHqS7kary0nJkp5y4soYeCkjo8lDHj7nDMgBBmLln2l1XAfP
         66bajar6dDQaCWPAnKqLPE9OKYMiJg3hBSvRGwlMXjvPk0v/tmDlGsORqx+QIFMLauZ5
         qVyob+hJjA1+rLjROJvus3x1DrN8MvocSkl004CN2d2X4klxvOzGRoVd3XAdXfXGG6ip
         lDYGovdqb1e/uhCaqdgVcNYn1AJC/Ukm2fcJmmWHjj630m/LxLniUXCju2mBkJfdrupS
         I9JA==
X-Forwarded-Encrypted: i=1; AJvYcCWdzUGwlclvLBTR3p3bjB3757zY9TYEZC+T0wTCP/PqTGdwaWED320mXIelvp+znbSP9KDFDW/hXyLPjfeO@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIckbdk2wCrNnvFGk12YIHWVxz1aicA2Wi2yR3Yc8htNpWqfU
	A8rzAA3gUQhIwamvPDBIYQR6nYP8ZUsl+sNq8buH4AfTgOZr3phYAHZD8m+vf+g=
X-Gm-Gg: ASbGncvGL6Jhn9gsyLY1g/+8cZQob0VoSGu1eVNdEEfixWros1JXEtOZIWgKt5fgaUA
	k4w+pxQ5cbggJ05rNgwO9AG70B9YeiAYsFdegxLT28e1CPSrlzWT7+OFoZenE4z9vLEDHD41VDz
	VvHZwZQHEyBq/DZ0GWC3ipbGKaw6p/hSywgEFS9V6fb9JB/LcmIqWi6fyJk2r4P+XRAbT5/bjEe
	QGeZy1ATius4CLMTdkU3Us7BHTE3e/pLeJKGWTyeFBuoVY+PaK4XRteqRQrQxsgxD8WbTE0Nm1I
	G4qqwV468K0zVIdtwLY2dPWQo1fkYA==
X-Google-Smtp-Source: AGHT+IH3PxC/7zsS1K0DnMW67rOahIA/SiVj7/NI8dYtx07JEByEXiIOKaepX+9HHyKUtQ3n8U7v3g==
X-Received: by 2002:a05:6512:3181:b0:53d:a4f9:6141 with SMTP id 2adb3069b0e04-53df00d1b1cmr7390373e87.14.1732931886173;
        Fri, 29 Nov 2024 17:58:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb915esm5675341fa.19.2024.11.29.17.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:58:04 -0800 (PST)
Date: Sat, 30 Nov 2024 03:58:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Message-ID: <6hunbphnn2m647swkujhyjywp3e7vnlxhrbye5tjakvlfclimc@j64qbwen2hh4>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>

On Mon, Nov 04, 2024 at 05:07:38PM +0800, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Fixes: 29ac8979cdf7 ("drm/msm/a6xx: use msm_gem for GMU memory objects")
Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 37927bdd6fbe..b26dfe0a76c5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1605,7 +1605,9 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  	gmu->dev = &pdev->dev;
>  
> -	of_dma_configure(gmu->dev, node, true);
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
>  
>  	pm_runtime_enable(gmu->dev);
>  
> @@ -1670,7 +1672,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  	gmu->dev = &pdev->dev;
>  
> -	of_dma_configure(gmu->dev, node, true);
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
>  
>  	/* Fow now, don't do anything fancy until we get our feet under us */
>  	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

