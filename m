Return-Path: <linux-arm-msm+bounces-20024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E508C9400
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 10:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2AF81F213C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D53022097;
	Sun, 19 May 2024 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5V0Ym8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD90219F9
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716107897; cv=none; b=d8s4VA35mdZ/TLUB0lSF+AKx9E3z5VY852oJcYVKGULaAoWo2x1/bu7px3dEXljDPcQuxxLCdIbyBIRga39R9dJ/c4iaA7fuA3LGSVo/YqQEvDIbZDYMssooTYc4PTNHTjaXfuBxBdIKjZjHHgPFYDcibSawC5vv97zqHRONtwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716107897; c=relaxed/simple;
	bh=BedoqEtKMOZam2JgPykEE9v9ZCC0wqAbPoP+aVn8WZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfk+9OW7nEpXkMRGe/mPDilEUNzd5c6xa/GWfEalrlpt6PFOkh+tKk3w1cB2bi5xuED1LRhZgZEj8ey3JrjYURAYivCGZowiawBk29efd0VK5uth3lGAZ/KZsZ0GK6XE0HTkOE+8nzW/oZpwePrN+TlwB5n+hvyVcL+l8OUZg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5V0Ym8Z; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f174e316eso2204327e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716107893; x=1716712693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uvn7S9N3gs1R0QzYy1uNyet1Yeg7h3PJLDPnNcMfPqM=;
        b=F5V0Ym8Zzr5tL0OFp5dVFF247vDge9t/2RYBRCzBpC6oQjz5TpDIsv5sq9Y62npJWZ
         x1I/selYFNjiEtDLCl6pJaZozEgNOlAxYJCwlLKQDFb4d8TlMS2ULs8rO6unJd9RpXeE
         v+R+NtDZnDMjk5Xf66AgufaUXdMfvl778ksEI8jTlcie6f4q1e8ruBNyeuCnsnhC5uzp
         B2ylxiYnRp6Qu0sOjZO9Ed7Zs5qzX3gycb2GiezMTlJxTJEv/kT9M9b+FguXEQtIIFEU
         LEGGJDKLUin3VCS07/LTCFb1puLCpEHzsaukWGRAN8PwKbofBILuy4OxOUY6E0yDl1jl
         grIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716107893; x=1716712693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvn7S9N3gs1R0QzYy1uNyet1Yeg7h3PJLDPnNcMfPqM=;
        b=WmP9oFKmJo4g9A3z4PMfHufKXAgjoknHJFKYSrtCeivEBSXfh3vnL38TzIueu774Co
         7GR7Y1t661LGlH+9027UGws/UYrp44rpNk9JVM8tUyyTyhgtTLkdWVeHEjyPaLziDJyU
         oe5zlf3EAn9gG5rhg42GX4FAdn6tKz7yoc+x/V6/pD1NFvtur0ECNHMfe6H4z0UADgOG
         YQ6dEjcFi/DydoGDQAWL1cUajfSRhGy/7r825reEL210NJGBfbrsHkDKegPSHXqzJj9W
         Hfx69GUuDgLknOVA5mXfys5AJo/aMylnDOkKFxiFpOHZBQZJPqjIVLKKAzStyGDohUKG
         Wcgg==
X-Forwarded-Encrypted: i=1; AJvYcCVVqTOBbbzm85mLrW8f2ts9p88h3uk5sYNosydcsB8kAy4OGfPl5ITkRBjLOcju0ekLhRXICfh3A8nq5gWnv8Xc9ubhzeugnW/TaAkJ8A==
X-Gm-Message-State: AOJu0Yyi6DkWa3hrtfynadhyUWY2wqvedGmRdcAhAMaOyrCEoCq6AXI+
	Bamj840IDRJVt4Jbfi5NEcX2F+vCyh14T5N3hUXS3OuAW7Pc3nsYPWuJVk7YBNM=
X-Google-Smtp-Source: AGHT+IGgzh0RQFEUj/vfjQqsWUMRHSlFORbeArQ4XW7evJ1dXUJQ/TVW+RMYFRKn5ItvOp/AT5UuTA==
X-Received: by 2002:a19:381e:0:b0:51c:c1a3:a4f9 with SMTP id 2adb3069b0e04-5220ff72f76mr15212294e87.64.1716107893329;
        Sun, 19 May 2024 01:38:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba754sm3826785e87.107.2024.05.19.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:38:12 -0700 (PDT)
Date: Sun, 19 May 2024 11:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] drm/msm/iommu: introduce msm_iommu_disp_new()
 for msm_kms
Message-ID: <jqin56krw2rpk4wezuhgql7fhbjfx2ruv2nh7ksuw3dkbbba63@272ulj5n4yk2>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-4-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-4-quic_abhinavk@quicinc.com>

On Fri, May 17, 2024 at 04:37:58PM -0700, Abhinav Kumar wrote:
> Introduce a new API msm_iommu_disp_new() for display use-cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index a79cd18bc4c9..3d5c1bb4c013 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -343,6 +343,19 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
>  	return 0;
>  }
>  
> +static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *dev,
> +				  unsigned long iova, int flags, void *arg)
> +{
> +	struct msm_iommu *iommu = arg;
> +
> +	if (iommu->base.handler)
> +		return iommu->base.handler(iommu->base.arg, iova, flags, NULL);
> +
> +	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
> +
> +	return 0;

I'd say, drop pr_warn and return -ENOSYS, letting the
arm_smmu_context_fault() report the error.

> +}
> +
>  static void msm_iommu_resume_translation(struct msm_mmu *mmu)
>  {
>  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
> @@ -434,6 +447,21 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>  	return &iommu->base;
>  }
>  
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
> +{
> +	struct msm_iommu *iommu;
> +	struct msm_mmu *mmu;
> +
> +	mmu = msm_iommu_new(dev, quirks);
> +	if (IS_ERR_OR_NULL(mmu))
> +		return mmu;
> +
> +	iommu = to_msm_iommu(mmu);
> +	iommu_set_fault_handler(iommu->domain, msm_disp_fault_handler, iommu);
> +
> +	return mmu;
> +}
> +
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
>  {
>  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 88af4f490881..730458d08d6b 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -42,6 +42,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
>  
>  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks);
>  
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

