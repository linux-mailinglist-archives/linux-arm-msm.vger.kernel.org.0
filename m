Return-Path: <linux-arm-msm+bounces-16545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E840889A0FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 17:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15AD91C235E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 15:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6B616F8FA;
	Fri,  5 Apr 2024 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfIZKQGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2FB16F27D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330724; cv=none; b=N2gLc5FyhQT6/Qa36tzyHtk3HjJ7FLgkxS5HyqCpm9+MVHTWIWwZ6rTrHm9Czjz6//wI+xE2gOQxBLrKIequgSDeYzfRyJOSBgISYbZmLrCvtzWLQVsWEspMFqpa4qcDjz4xSF8jpWXCnjzTG3czhFTwKf9049XyrNJ61bol+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330724; c=relaxed/simple;
	bh=qlldJ0z+p3nPW/DFS1mjmF33z0ivtDs2v25g87h+Lu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfFLgkERWHlDMY5bBJKCexDDnT4c3kztc6gxTHKVQVYckjqh4+zfbwF+N3QOQ2yyck6cDkxzY+iczkWm4ze2s4gl8b19WiISJyzFJZXCeOGBAqXLSLT8RQ5v1JzPa3b5bcseV2POplhRDiorKQzFkt2b7IElb8r7A+icf0WbIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HfIZKQGH; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc742543119so2312107276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712330722; x=1712935522; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mi/HDpvk+7pwfyufqetrcXB/BAaUoavY2kBMI+/ddTg=;
        b=HfIZKQGHYTLR4TyTYR9/Mro9nZnXeGWQ3HijJ8MpH4WjHM2FvjgdUKYeP5Cemo0kG+
         7QHESYwxZQXdOGfYYe2vNkUjN/d/UMs42/29GDqTfS+VTjEWrGBp4DoFdpLOhTtyMAIU
         4qtdl//S0RoFmfd+cyMaDfINRxAYV6GQEBTQ8GB5mWDPhFZpMZlyeDKpQa0O1F45yKZb
         KBmhYwh2FOHMJaMVrQ5+3gLFPFiee2FL2D0W9+8uHxqE4FZowiRooKt1vj/knd/mBrL9
         2mWMUEv9Jjwl0XCoXhptRwSPLN5LsT8MqIbWfEZXzoJB99s4Xi+yYvI4zeGk2QLRTLBH
         uN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330722; x=1712935522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mi/HDpvk+7pwfyufqetrcXB/BAaUoavY2kBMI+/ddTg=;
        b=QNcVDO2006kVl7eNySap3r3TnSIUZT2qnBvZtKzQoXKwERt0WiARVYEEK+Q6u2W6zu
         euKgpNEKxgcHqYHaoHo+aPM8+r9XYZ0aZr5lPhr2t3iiorwiQjFpOUn+hVcrTLOin3ak
         Mu1TCXNduNfkZy5QDwIgV6CyADbeVPspVcOKBZUMoTvmt9qWOVfMqQsNDTgpQjHvqRZ0
         nT/SrPql0THCjASk1tetgRLrz3Jh1f0pCVS7S95ulx0yK30AKFvQeZ5LzfsTw1YMN9MA
         374K2/Ohc5yuCCXqDkBRo0D9gPoPgkY1rDjqc0NA0UkHAgNPN3MIykOXuAePmkTHXlhD
         bEnw==
X-Forwarded-Encrypted: i=1; AJvYcCXwl2L9Uc9segcPCTiIbQ1yyYF2fVKkOMH8UeE8txrYWLoZCA1oXHvgEJFsOk3CcFh/w7/VjUkQKYNM/ezquIYJIsEVKhIWEteRO76d1g==
X-Gm-Message-State: AOJu0Yz/FjzRI/2PebFj820xTMEOoeaFKKNQu6e6nKO/sfz+wN0fsS+8
	ZP9G6+OS7VaU5zhKemw+IugraaFXFulSRzSM2w/Vyg8Lot00qzY27AIWHC7d1GFu8AX/NITPdDC
	BNNt2heTPUadYQUje96B6PiKnqbncmJRO933sT7mwdsiOap6N5r0=
X-Google-Smtp-Source: AGHT+IEgNShtL+pLXHyw/R5fivQAlSbZHiEZUPZOZV0S6EN6Flb2hMkor9c4/3YG4HFHJY1h3UvhXsFcdA08pfGP+8Q=
X-Received: by 2002:a25:69c2:0:b0:dcb:e82c:f7d with SMTP id
 e185-20020a2569c2000000b00dcbe82c0f7dmr1710752ybc.41.1712330722124; Fri, 05
 Apr 2024 08:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405145049.9570-1-kiarash8112hajian@gmail.com> <20240405145049.9570-2-kiarash8112hajian@gmail.com>
In-Reply-To: <20240405145049.9570-2-kiarash8112hajian@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 18:25:11 +0300
Message-ID: <CAA8EJppfvEkWtWn6pov7sDv1mTg-8tLfzCxXyBY4QeEjrSWkrQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/msm: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: tzimmermann@suse.de, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	sean@poorly.run, marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 17:51, Kiarash Hajian <kiarash8112hajian@gmail.com> wrote:
>
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
>
> Implement the region-request through the corresponding managed
> devres-function.
>
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 +++++
>  drivers/gpu/drm/msm/msm_io_utils.c    | 10 ++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..17a5ef461406 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1503,6 +1503,11 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> +       if (!devm_request_mem_region(&pdev->dev, res->start, resource_size(res), name)) {
> +               DRM_DEV_ERROR(&pdev->dev, "Unable to reserve the %s registers\n", name);
> +               return ERR_PTR(-EBUSY);
> +       }
> +
>         ret = ioremap(res->start, resource_size(res));

Change this to devm_ioremap_resource, please.

>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index afedd61c3e28..e236bdda348e 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -59,6 +59,10 @@ void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
>         res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
>         if (!res)
>                 return ERR_PTR(-EINVAL);
> +
> +       if (!devm_request_mem_region(&pdev->dev, res->start, resource_size(res), name)) {
> +               return ERR_PTR(-EBUSY);
> +       }
>
>         return devm_ioremap_resource(&pdev->dev, res);

NAK. Please take a look at the devm_ioremap_resource() soource code.

>  }
> @@ -83,6 +87,12 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>
>         size = resource_size(res);
>
> +       if (!devm_request_mem_region(&pdev->dev, res->start, size, name)) {
> +               if (!quiet)
> +                       DRM_DEV_ERROR(&pdev->dev, "failed to reserve memory resource: %s\n", name);
> +               return ERR_PTR(-EBUSY);
> +       }
> +
>         ptr = devm_ioremap(&pdev->dev, res->start, size);

Please use devm_ioremap_resource() here.

>         if (!ptr) {
>                 if (!quiet)
> --
> 2.43.0
>


-- 
With best wishes
Dmitry

