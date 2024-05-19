Return-Path: <linux-arm-msm+bounces-20021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7F8C93D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 10:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF701F21396
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 08:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB16F18B09;
	Sun, 19 May 2024 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DtK4O20s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6F71FB4
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106598; cv=none; b=AgDT2l34ZAQoq2llh6CJI14vojMGwwQjN2C0zgYpI13oAcX8QRDh206JJ8T179GmGPZTgtoQ0mX2jERzdUA3RnD5fbOQdWrZrARCGQ94p/1993075Sf0oQm2SHa8/S+JiEYh5WqgZxSkzStzXU8ppEvB/bAFgHKqrvUadu+doGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106598; c=relaxed/simple;
	bh=5GvvJGAyZf8QY6YNoSOkE8KDWtNj13Zl8SY6VB7LWdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDmMa8yHLw+KIvfAMLBtWjTukFKNZjO9I4Mwq1WCw8E2qRhGGPEpG0opJ6X4OueGKLWKowM5v31BHhW+bfF5QSsB9wbK7US04SnZZu1YPbUvApTptLeZ/XoHnccdcqxH5rUSvjuPB7LpRnFgyyGVVVYT1IbASh/sYJLhXTZnPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DtK4O20s; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5241b49c0daso819341e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716106593; x=1716711393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nqscv5hPY4OsF6W8djpNx/MqPGz0oq15EeGyLjqSwyg=;
        b=DtK4O20sNPzadCuNXxRkmcfQIBGaGvB+09EpOcQ7DDEVKmjWUh/Mg2mkK0Zno7tLp4
         s8kPOzAJQSeYuJT2UzgnFzXsVAS62EDhGRimyrZaFNyj4c0ItjqM4eStKgLkVs/a49hR
         tSj+UbU0NlAoBtUTsu78ruoip0vqVtF5H4Tjeo+oQca8fkJ/948Q9iQgaXVOgNICkTE+
         fqFVxibByv0aojrXW0nI3SfEJj361lWCeKdtHMTE8AVxMymMIKLBoCVoJzqtzmFHzn3a
         rWi8ky7Zd8oYUFmB3bmInmBSIEmtGfEiYfFDLN2G+zJOJu6E7LX8vqpVhVS932OkBVcH
         /eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106593; x=1716711393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqscv5hPY4OsF6W8djpNx/MqPGz0oq15EeGyLjqSwyg=;
        b=KeeRzxfNTiT1vdcYy0Fx1KzzUSejKNLnbUBt5UahjiJiR6CodVUmhCoYX+SLiSB8rQ
         QTTREfoO7EYosEE/lNWZSZAkAuYJk3Q7M1vlvS9omzBB0c7hxeQ+SlgwGRRLrcdg0VRf
         OJrfJJRa3E5Lf6HErlr/7KchA69X4sBgf/PF0RrgneVRMtp2oML0yF3Eb4Q9woeYrmHM
         1rpO1PsyfAB/FAE49pXIFaWgwj1zRAsOcRaCaU2hGGUVFpLiJsKitWaTvXjwvDP+KTBZ
         o4fEMkeMdw8XqHN70E+WJbEdnp1fEhclvzQqSnW0FfxLaS5F7eEmau3yiGBy79vntOLv
         wvlw==
X-Forwarded-Encrypted: i=1; AJvYcCWQbu1hMQ546YWmYBB5kKzEvC45bMzY/rxQkw6OdPIdYLO8zndPUEGq+JkGYKIPKgkZ9Xa2i8XKrmzbMRuB0GqQu/uiC4jwVbVkeaPViw==
X-Gm-Message-State: AOJu0Yy1nPhxR94rPx4xr5CPqVuSxdtDdhjCImqi4N2+a6bh2DmB+wbs
	zp8CKFl1Up/sZU7pCROnX5jVywfkwX0FCLkPFL/jXu4SekOUcXmtsvXbwvvS9o4=
X-Google-Smtp-Source: AGHT+IFRGaG2cgRyfRkJRXqkedyOipsI0+xvINvklLqDqBRjRxo9DNXLPfaP4ViVN92ReZ3cfEXEYA==
X-Received: by 2002:ac2:4c55:0:b0:51f:4165:9305 with SMTP id 2adb3069b0e04-5221007016dmr19852722e87.55.1716106592716;
        Sun, 19 May 2024 01:16:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d31aasm3904344e87.283.2024.05.19.01.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:16:32 -0700 (PDT)
Date: Sun, 19 May 2024 11:16:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/a6xx: request memory region
Message-ID: <4susqladik7qzknlggchehmfyzeaccc7j27jtpvgrfm4pc7bqk@weiwasipz674>
References: <20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com>

On Sun, May 12, 2024 at 05:03:53AM -0400, Kiarash Hajian wrote:
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
> 
> Implement the region-request through the corresponding managed
> devres-function.
> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> Changes in v4:
> - Combine v3 commits into a singel commit
> - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
> 
> Changes in v3:
> - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
> 
> Changes in v2:
> - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..cf0b3b3d8f34 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -524,9 +524,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	uint32_t pdc_address_offset;
>  	bool pdc_in_aop = false;
>  
> -	if (IS_ERR(pdcptr))
> -		goto err;

So, if there is an error, we just continue through? What about the code
that accesses the region afterwards?

If error handling becomes void, then there should be an early return
instead of dropping the error check completely.

> -
>  	if (adreno_is_a650(adreno_gpu) ||
>  	    adreno_is_a660_family(adreno_gpu) ||
>  	    adreno_is_a7xx(adreno_gpu))
> @@ -540,8 +537,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  
>  	if (!pdc_in_aop) {
>  		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> -		if (IS_ERR(seqptr))
> -			goto err;

Same question.

>  	}
>  
>  	/* Disable SDE clock gating */
> @@ -633,12 +628,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	wmb();
>  
>  	a6xx_rpmh_stop(gmu);
> -
> -err:
> -	if (!IS_ERR_OR_NULL(pdcptr))
> -		iounmap(pdcptr);
> -	if (!IS_ERR_OR_NULL(seqptr))
> -		iounmap(seqptr);
>  }
>  
>  /*
> @@ -1503,7 +1492,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	ret = ioremap(res->start, resource_size(res));
> +	ret = devm_ioremap_resource(&pdev->dev, res);
>  	if (!ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>  		return ERR_PTR(-EINVAL);
> @@ -1613,13 +1602,11 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>  	if (IS_ERR(gmu->mmio)) {
>  		ret = PTR_ERR(gmu->mmio);
> -		goto err_mmio;

And this is even worse. See the comment below.

>  	}
>  
>  	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
>  	if (IS_ERR(gmu->cxpd)) {
>  		ret = PTR_ERR(gmu->cxpd);
> -		goto err_mmio;
>  	}
>  
>  	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> @@ -1635,7 +1622,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
>  	if (IS_ERR(gmu->gxpd)) {
>  		ret = PTR_ERR(gmu->gxpd);
> -		goto err_mmio;
>  	}
>  
>  	gmu->initialized = true;
> @@ -1645,9 +1631,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  detach_cxpd:
>  	dev_pm_domain_detach(gmu->cxpd, false);
>  
> -err_mmio:
> -	iounmap(gmu->mmio);
> -

You have dropped the iounmap(). However now the error path should
remain. The put_device() must be called. So fix the label name and just
drop the iounmap().

>  	/* Drop reference taken in of_find_device_by_node */
>  	put_device(gmu->dev);
>  
> @@ -1825,9 +1808,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	dev_pm_domain_detach(gmu->cxpd, false);
>  
>  err_mmio:
> -	iounmap(gmu->mmio);
> -	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -		iounmap(gmu->rscc);

Same comment here.

>  	free_irq(gmu->gmu_irq, gmu);
>  	free_irq(gmu->hfi_irq, gmu);
>  
> 
> ---
> base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
> change-id: 20240511-msm-adreno-memory-region-2bcb1c958621
> 
> Best regards,
> -- 
> Kiarash Hajian <kiarash8112hajian@gmail.com>
> 

-- 
With best wishes
Dmitry

