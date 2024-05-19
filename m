Return-Path: <linux-arm-msm+bounces-20026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C98C9412
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 10:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE5821F21380
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 08:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE53168DC;
	Sun, 19 May 2024 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utL5Gnzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC04241E7
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716107986; cv=none; b=V3rhR609FazwnaZu82T8khxGTc3+t+zENgoA5AwMGKkd11h53Tjz2I8FmlTkI6iSWY9TysPeZYd7BXWbeApeKJyjG5J5MkOsEjpCLpSRkF/Y2Fvb30Kc4XfQ91BrIniz9iGawrXjgjtu9HKZfEjSeURM/a/jiG5Et+TijHHfMSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716107986; c=relaxed/simple;
	bh=Kg3YX6ii6Indv1+t4Rh29tADMsvqWwP3yWdw78z0LO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlMyeXZW/uZbMr641UrH4iZWSBV8aq8kEfef/63m2G8BPhYOnqoI8tGWRsej4LTfCopsr/VyFv9YsAfCA5pdWd59saiW1xJNhtTMtsnEiNghNrLBW9AiGhMLLah8+JeqzmF51qxw8Q6jTv4cty8NR108L3jCyb27DKDz+mvHWZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utL5Gnzr; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9d1so38909291fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 01:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716107983; x=1716712783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wINRsVYOfc9e8SdgZRbrSE/ek9LX88q64lK0ONVJskM=;
        b=utL5GnzrdmA5YirwGSS2B7C7qx9bs8AIq/33RBAoV/UUuRYYuJaiGb49/P/aoT21FP
         HZ4sr1Sf8H9PXL4bu4E+esevHoQ98v61q/MunYs2FyGyvMr6N8GwWbFUsBSOCtSvSBnc
         2LMZIOhzyVXHj2i5J4Yheg+HhOwe4BbxnJbapgyjTj9LTUILSbdff72zPIzVFjzN42T6
         yXHnOhw7SO07ypwfrgurKmVoc65kVolCGiJGUl8wT6IBDNj4bcC04v5WGvroGpwnmkiB
         BxIwAlZXR2KmRcYtJwLP8DNCh2DDjUNDIPWI4c3Le75JFbJLQmYO7hIJOAVZPYUMYaff
         gZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716107983; x=1716712783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wINRsVYOfc9e8SdgZRbrSE/ek9LX88q64lK0ONVJskM=;
        b=VI/6jxXr6SjgC88e789qxbzE9/Vm4l66tRwYBo04psToOC7AeGCx/K33YDLSRXaT73
         DMI50Ty73OhO6vI40orI821MPL7Xh4juZlN19BXVStoVUPN+Dc5eg1+EzASb8xXcaZ3E
         yUPt+yi+qKRXfB+AfXW2l07aerRERg0kHoC4ybtm4ALt5extsJ4jfz6kLver4pM+/EcC
         OLFykOv5p1oItAcWKSQkWx2jq+iiCKbRNzOi99ye9U/WkYF6eSHg8htU+BFoDKmn5N6P
         PBZnM80Bujaq42yzBzzxG9lPvXIxdZgTeAy2vfe1zszyKmCn6tHaHWHPghTPJ8LEWFeB
         2PRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIhOaWMFDiI6iqwsTE0XmRyGopFXPUOw9OwdFUuFWLB6TAq2s5YvgmcM1FjEt8G0r2BOblz5ztx5fpgoUMvSzyOElbb6W9CPdfWFZOOQ==
X-Gm-Message-State: AOJu0Yy9tC16Ft/fexwOz/seNzWup5jRSOMracG6BAzOtdo7tIbmm/o5
	gaApeoqd45hfc0C/jEzrhLbV6C3IE0dazJydwX4taVVxUiQVTI4WU6BAsRROKsM=
X-Google-Smtp-Source: AGHT+IFI6PXjXa5dIVUKDoC56AXg8GLn15W3jSRDWvlVXmFTkJPr2Sj8InmpAqQX1jsCJ0QL5wMf+w==
X-Received: by 2002:ac2:520a:0:b0:51f:1e8e:f7d5 with SMTP id 2adb3069b0e04-5220fc6d51bmr17374319e87.35.1716107983501;
        Sun, 19 May 2024 01:39:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8d70sm3840903e87.226.2024.05.19.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:39:43 -0700 (PDT)
Date: Sun, 19 May 2024 11:39:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/4] drm/msm: switch msm_kms to use
 msm_iommu_disp_new()
Message-ID: <gfmxslhxpokhwsbnxucd4od2kdqldelrysl6gd2tmgb3dfx6bs@gku27mrctqfh>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-5-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-5-quic_abhinavk@quicinc.com>

On Fri, May 17, 2024 at 04:37:59PM -0700, Abhinav Kumar wrote:
> Switch msm_kms to use msm_iommu_disp_new() so that the newly
> registered fault handler will kick-in during any mmu faults.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 62c8e6163e81..1859efbbff1d 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -181,7 +181,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  	else
>  		iommu_dev = mdss_dev;
>  
> -	mmu = msm_iommu_new(iommu_dev, 0);
> +	mmu = msm_iommu_disp_new(iommu_dev, 0);
>  	if (IS_ERR(mmu))
>  		return ERR_CAST(mmu);

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Note to myself: make mdp4 use msm_kms_init_aspace().

-- 
With best wishes
Dmitry

