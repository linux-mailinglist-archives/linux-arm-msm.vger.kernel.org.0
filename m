Return-Path: <linux-arm-msm+bounces-57184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C72AAE702
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E83F3BDE19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F6D28A73F;
	Wed,  7 May 2025 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIfvOO/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F711917FB;
	Wed,  7 May 2025 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636207; cv=none; b=t0yhiYjA2X9ES7Z6u8uVTkBO8lPc+2C89qjqscVsaXRTi6t5e3T7WMHhLXiOR/0SZb4iSTbSzgCzx7dAMCdXixMb+XiVVTetY6YlRwq5uAeAbZFD+XkbbGyylfUr1GzLF7QYMgVOa1jvmx8UTpSc9R1g8mtaR5lmBYKm1vLiK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636207; c=relaxed/simple;
	bh=V3KyBFKKrJmMFQZk9vIK+r96hFDIfLgmk6zptUCS9Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7MurKqnFetc0MLY46UbRyRHrRAIw7nundcqFZCby4bipey9KfqHGENEdfzZqXud2XX7WWiyBvlWs46R2q+LW0EGO1+jM6BIyboilsKkuAAXyWSZs4FyKUDEkQJ8j5QZVMkFZV+EG3kR7ayAhJKpTv5wrl3Ams/sQV0VNIS6bto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIfvOO/M; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so187739f.3;
        Wed, 07 May 2025 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746636204; x=1747241004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqGiu2LUseqRIDDRrmCl771ZRfnWxX3nt+ElhtFaT0=;
        b=iIfvOO/MMbddCnfNyGlBF54BLz8JZwaKF46uOa7tILhmQiuQwu3JmAn8Ds0QfFZogt
         HahcXwh33TL3iFDdVsEP+6m+7g+MhJth7HLSYHxgkXpMju/yJGeRKCyHyqdnsvOXbTej
         bYMgtVInNwQOHeCwmNfSqKEX7cMjYTCzInq8Y6vcTIleJkc/5eeQVB+5Ts9mWJN1pHLy
         oryx0lmfLjFD6hdBbz8onQkQfViEqKLQYI7a5nF8BDugw04YjwrUyalJQtb0jlwgKWDE
         oZhAyaKeFuH67yIFQsOE5bJ55webjmJ3DEGSLEOOIwrjM+YQ9DkIBNohup0Zkn8AQo7s
         w6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746636204; x=1747241004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqGiu2LUseqRIDDRrmCl771ZRfnWxX3nt+ElhtFaT0=;
        b=F9XDHCJt+tVhAvLx+cf8Uy17vgUcUCxdg+GIuIjL5DNznO/jP+RdY7yJ9lyADJUqzO
         9ZePQa9Xwpm0M3bosRchGqj8BKWdSZlWfDC4q6keGYcRGmfjWFnvRsXRAIrf6hOqdr0S
         Ib8TZzcn+HCMRjUlmNdKKm2umacQK8v+6rDzQdtzGkmxSKVPu8srpN0GRnV07laqWl9y
         9vuWjPnAsTk6tb0MgY7A8KcaCX0n+danXv+a+A41yaEvnNOgiGCjDv6dlYEziMoLnNhr
         oZZc0zJf3N+0aSlhAj1WWMh+4wvdtpO50KyURyFKa0+4fAl6g9biHDEstGH8sEFfdHsN
         phDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVnssRuIk7Iw4sXHPH27fN9Jgj4pziZAD/dedrQvQecotx1LjKfKsEqZR7+eSQCTdwxO2bRWmqXhxIiud8@vger.kernel.org, AJvYcCXjis3IpLSi2MNuWweZeGucaV5nS3N4ViwVFxVe4DTQ9ewdoWD3vFpIsND93CUZc3iBtwo+KrBdOZ6Y83nL@vger.kernel.org
X-Gm-Message-State: AOJu0YwhpKG8cPu2MPnZaseUeVcqPWJpY/qiQPhS+pWtf9Qo7kta12Ed
	znSsE3LKIWKHev0tyPZadlA5X2X17zIw92r2QY/gjjm3/Cj51yTqXmbxWybDoDn7z+l8WuhuRf1
	Yxnln+wbSFdYUycjb8rqoz/7ttTs=
X-Gm-Gg: ASbGncsDzrX9Z9OExyvFFaHt45z92VhhBJFyoP82H3w/TKUFKh88ziNp5b7ZLDLw9aW
	bMkQfVCqFlDKMg3sAqz6Ej7xlFQUWa3fgE1cGqjclic5zzzF0zHR3ZSa00f1r46/qSMHP7XWBht
	Id/9Mf5cxJXVAyTgdRySNtGd8ADYY/34wwktrbfFvM3OHpL66Ug1K6
X-Google-Smtp-Source: AGHT+IG+VzgbCuwSpeEeu88K4dm4csb7shCW7OmtTncZJ7dCEfYism1vlRMw/YoaxQZ8HA81jNsKnJZ8r2bbrQrhc5M=
X-Received: by 2002:a05:6e02:1aae:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3da738f0d85mr38356795ab.11.1746636204548; Wed, 07 May 2025
 09:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com> <20250503-msm-gpu-split-v2-10-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-10-1292cba0f5ad@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 May 2025 09:43:10 -0700
X-Gm-Features: ATxdqUEuMUPuOU2GnLpXWpKVqP1SfNDpJCTDk56Nr0a5tjEcmFOuiLqPR3zdRGk
Message-ID: <CAF6AEGtsnfxHYZyEsC+BSW0aWd1V4ZvM0c_wyTx20Vaeku4o6A@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] drm/msm: enable separate binding of GPU and
 display devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 12:17=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> There are cases when we want to have separate DRM devices for GPU and
> display pipelines.
> One example is development, when it is beneficial to be able to bind the
> GPU driver separately, without the display pipeline (and without the
> hacks adding "amd,imageon" to the compatible string).
> Another example is some of Qualcomm platforms, which have two MDSS
> units, but only one GPU. With current approach it is next to impossible
> to support this usecase properly, while separate binding allows users to
> have three DRM devices: two for MDSS units and a single headless GPU.
>
> Add kernel param msm.separate_gpu_drm, which if set to true forces
> creation of separate display and GPU DRM devices. Mesa supports this
> setup by using the kmsro wrapper.
>
> The param is disabled by default, in order to be able to test userspace
> for the compatibility issues. Simple clients are able to handle this
> setup automatically.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +-
>  drivers/gpu/drm/msm/msm_drv.c              | 49 ++++++++++++++++++++++++=
+++---
>  drivers/gpu/drm/msm/msm_drv.h              |  2 ++
>  3 files changed, 49 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 325cb710ea08ac8e5c3d9c80c8d8e18e1946e994..2322a3301a5226c4e2590344e=
4744934addeea33 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -243,7 +243,8 @@ static const struct component_ops a3xx_ops =3D {
>
>  static int adreno_probe(struct platform_device *pdev)
>  {
> -       if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
> +       if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
> +           msm_gpu_no_components())
>                 return msm_gpu_probe(pdev, &a3xx_ops);
>
>         return component_add(&pdev->dev, &a3xx_ops);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 804b594ba1e7df9d9aec53a9be1451f1167fc77a..eec7501eb05b6c31ffd9dc5a7=
ba430e3284ea5ed 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -59,9 +59,18 @@ static bool modeset =3D true;
>  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (default=
), 0=3Ddisable)");
>  module_param(modeset, bool, 0600);
>
> +static bool separate_gpu_drm;
> +MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU =
(0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM devi=
ces)");
> +module_param(separate_gpu_drm, bool, 0400);
> +
>  DECLARE_FAULT_ATTR(fail_gem_alloc);
>  DECLARE_FAULT_ATTR(fail_gem_iova);
>
> +bool msm_gpu_no_components(void)
> +{
> +       return separate_gpu_drm;
> +}
> +
>  static int msm_drm_uninit(struct device *dev, const struct component_ops=
 *gpu_ops)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
> @@ -898,6 +907,32 @@ static const struct drm_driver msm_driver =3D {
>         .patchlevel         =3D MSM_VERSION_PATCHLEVEL,
>  };
>
> +static const struct drm_driver msm_kms_driver =3D {
> +       .driver_features    =3D DRIVER_GEM |
> +                               DRIVER_ATOMIC |
> +                               DRIVER_MODESET |
> +                               DRIVER_SYNCOBJ_TIMELINE |
> +                               DRIVER_SYNCOBJ,

I think, drop DRIVER_SYNCOBJ + DRIVER_SYNCOBJ_TIMELINE, since kms only
uses fence fd's.  (Syncobj support is only in the SUBMIT and upcoming
VM_BIND ioctls..  I don't think there is a use-case for being able to
create syncobjs for KMS only drivers, and it doesn't look like any of
the other kms-only drivers support this.)

Alternatively, we could use drm_device::driver_features to mask
certain drm_driver::driver_features at runtime.. that would be a way
to avoid having separate drm_driver tables.

BR,
-R

> +       .open               =3D msm_open,
> +       .postclose          =3D msm_postclose,
> +       .dumb_create        =3D msm_gem_dumb_create,
> +       .dumb_map_offset    =3D msm_gem_dumb_map_offset,
> +       .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table,
> +#ifdef CONFIG_DEBUG_FS
> +       .debugfs_init       =3D msm_debugfs_init,
> +#endif
> +       MSM_FBDEV_DRIVER_OPS,
> +       .show_fdinfo        =3D msm_show_fdinfo,
> +       .ioctls             =3D msm_ioctls,
> +       .num_ioctls         =3D ARRAY_SIZE(msm_ioctls),
> +       .fops               =3D &fops,
> +       .name               =3D "msm-kms",
> +       .desc               =3D "MSM Snapdragon DRM",
> +       .major              =3D MSM_VERSION_MAJOR,
> +       .minor              =3D MSM_VERSION_MINOR,
> +       .patchlevel         =3D MSM_VERSION_PATCHLEVEL,
> +};
> +
>  static const struct drm_driver msm_gpu_driver =3D {
>         .driver_features    =3D DRIVER_GEM |
>                                 DRIVER_RENDER |
> @@ -1044,7 +1079,11 @@ static int add_gpu_components(struct device *dev,
>
>  static int msm_drm_bind(struct device *dev)
>  {
> -       return msm_drm_init(dev, &msm_driver, NULL);
> +       return msm_drm_init(dev,
> +                           msm_gpu_no_components() ?
> +                                   &msm_kms_driver :
> +                                   &msm_driver,
> +                           NULL);
>  }
>
>  static void msm_drm_unbind(struct device *dev)
> @@ -1080,9 +1119,11 @@ int msm_drv_probe(struct device *master_dev,
>                         return ret;
>         }
>
> -       ret =3D add_gpu_components(master_dev, &match);
> -       if (ret)
> -               return ret;
> +       if (!msm_gpu_no_components()) {
> +               ret =3D add_gpu_components(master_dev, &match);
> +               if (ret)
> +                       return ret;
> +       }
>
>         /* on all devices that I am aware of, iommu's which can map
>          * any address the cpu can see are used:
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552..1ff799f0c78133e73c6857e36=
92c2dca2c5e60fa 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -543,4 +543,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
>
>  bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
>
> +bool msm_gpu_no_components(void);
> +
>  #endif /* __MSM_DRV_H__ */
>
> --
> 2.39.5
>

