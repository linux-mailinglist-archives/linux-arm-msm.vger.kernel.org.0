Return-Path: <linux-arm-msm+bounces-69982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BFBB2DE66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 15:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0736A03B7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AE81A9FB1;
	Wed, 20 Aug 2025 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+WpkuV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A81D6DB6;
	Wed, 20 Aug 2025 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697868; cv=none; b=FPEEmYoKt+qyXstw0CMS1hHqTfDnyJ54O+zwU+GGSOiyw5ZJYf4PFUvDy4u26hjbHfOLG4PAxldbWEVT34MkDMC/finKkEPOFWmLtNOJGtsupKbnDXYFjysau3YcgauBlcmTFWXMU3w8YKMmfIZ7BppkP2ORAMDRxCvu0ut1tg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697868; c=relaxed/simple;
	bh=G8xbiCLYL1b0hOEgdR7yHBlSW7oty7trbVCD2tljr4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7B1dn2XL6Aveemdel9VvDmE1AVaXOhXLn3a8+CJpbEUpSZQ6P+oZUtdQksqSwOW83CnQzNR19SLyayhB2holjeVci+ndQGhv9cjW9AD+GpJmoLN9exWxEhAYr1cwhNz9lW9uMG+wZrsnJ4MZ5avNJmQzsa2L/oGz2dGGtr7Fh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+WpkuV0; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323267c2730so365034a91.1;
        Wed, 20 Aug 2025 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755697866; x=1756302666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlJXkRnyFfMw194yiBU6YgrZ0umSqMzMmufYJJtuLXM=;
        b=W+WpkuV0uHg9sstR3/i2u/vBGkwHl0g0lFOkjBxvWPs+IgF5U6wzwwu1ziCOHsR8aI
         N2TEPbqmmTxug36Mz8lb1hpUyt2tUNNrxwzrAzzhA2xzKBYIxitaR6S/2YC4OKJkTsIu
         VyML//cPjgbXqvppIzjEnsKWoIjsINBdkPRlr360cUPheDsHhxw9MFbbwJU7dfhUDnm/
         nBk6jg/6zqiiDDo5/NnT/+yZBs8q2pGQlGI028gbsxcxlCXEqIns8hK6+K2kwbyi8RAl
         v6Htsu+rAhnyMzRmF5tZvsWalhwUOABEHtPxEzX3nEoU0fRVit3mLMira/uToozv5n0x
         //Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755697866; x=1756302666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlJXkRnyFfMw194yiBU6YgrZ0umSqMzMmufYJJtuLXM=;
        b=XqQyP1N6h3Wnmm0hmp1iNH/o6ciPz5/EzQfV66tJxYcGhtp715xXeRQxirAYipKfFv
         4rWGCulkCSfCNUVE032Qfj5KzEG0xuFW5yVOynPabHqeM4XzY/Crjz6YLXV0en6Wu4GK
         wuMHzX+HDAgqxV1wAtRbFOsqkAM16FCORyRI1xfooXaRfO8GnfG1ZnFDn5kzgm6xJ4jc
         5142WzCOVOv0piMdFSi371lkY9PuTrHA3/lId9yizUR4dMlWePSyrlz5KR+T/BIZet/L
         ZlvYv9T1yUEPKvEo/LdL5hKFzIL62F4d0MEc5kRiSdkBIWKeKH4De2UCvfbQeXR2n+lG
         LlOw==
X-Forwarded-Encrypted: i=1; AJvYcCUOq79obrpNB8Q/HwZtXQ3e9BQ3p1u3BuQq1UyVxDQTGu8G7EqhSWgTdnUyVRZ11EA/zIx7tSjk8juft+tc@vger.kernel.org, AJvYcCXWzr2bVALaHSLqtw3Qx+GJuz6Au8FyZCx+od4noa8UxAQu7+spstDLXkn7/kLaFkBq/TctqZtqa3leCYyR@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+krSepyV0SBYtE3HlPt6sBIubnIPKi8DS9ipG2WEMI/XhI2j
	tMOs8AaTwfKwJIHB6RkwQUuo4QiHBOf3GeenIrBu8rg9kuAodA8QVeWRx48pLiG0yYCrr8k1kpJ
	lhebBDtsN0BHm06IBrypPEf4mQipWfnM=
X-Gm-Gg: ASbGncvzPKrHiYDa/qxnEgKqH85EnBxSDqAALov4OMj3mIEwyLbD7f8a96MpIToLdJN
	arwSMwxk2pgZm7Z6dTxY1jjCGR7hTtgo5r26jagpWhBVBRU4tPevAxV8xqfIcPeuD8GAuUmclhW
	7rtI/mSX6dCeZCUhJ4sKuGrnpB967IJewWUPVObycd3y6wTIkK8kXhFJtI70gXSGGHK/swuySk0
	tagXjgckAu6y9QS2Q==
X-Google-Smtp-Source: AGHT+IE6OAjXgpyJBTRniq4mnO0jJGbm2gGpXRPGqbR38KoHFeYRj9+xp9TQOqh/fCkb1imF5SbKiigJa79Ba97jDxw=
X-Received: by 2002:a17:90b:4a06:b0:31e:ff94:3fae with SMTP id
 98e67ed59e1d1-324e13f22d6mr2185022a91.4.1755697865494; Wed, 20 Aug 2025
 06:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com> <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 20 Aug 2025 09:50:54 -0400
X-Gm-Features: Ac12FXzFiomJlv1YMbkQK_BbOjXnQl8FSkekKg4vURPNW6oUakhabbsZFd5--Vg
Message-ID: <CACu1E7GgGZc7zF5YQxppMj=dG_emNhh1Ld7PbNT_oM_S436xQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Fix 32b size truncation
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 7:29=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> Somehow we never noticed this when arm64 became a thing, many years ago.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++---------
>  drivers/gpu/drm/msm/msm_gem.h |  6 +++---
>  2 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 958bac4e2768..9a935650e5e3 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1142,7 +1142,7 @@ static int msm_gem_object_mmap(struct drm_gem_objec=
t *obj, struct vm_area_struct
>
>  /* convenience method to construct a GEM buffer object, and userspace ha=
ndle */
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
> -               uint32_t size, uint32_t flags, uint32_t *handle,
> +               size_t size, uint32_t flags, uint32_t *handle,
>                 char *name)
>  {
>         struct drm_gem_object *obj;
> @@ -1208,9 +1208,8 @@ static const struct drm_gem_object_funcs msm_gem_ob=
ject_funcs =3D {
>         .vm_ops =3D &vm_ops,
>  };
>
> -static int msm_gem_new_impl(struct drm_device *dev,
> -               uint32_t size, uint32_t flags,
> -               struct drm_gem_object **obj)
> +static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
> +                           struct drm_gem_object **obj)
>  {
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_object *msm_obj;
> @@ -1244,7 +1243,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
>         return 0;
>  }
>
> -struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size=
, uint32_t flags)
> +struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, =
uint32_t flags)
>  {
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_object *msm_obj;
> @@ -1259,7 +1258,7 @@ struct drm_gem_object *msm_gem_new(struct drm_devic=
e *dev, uint32_t size, uint32
>         if (size =3D=3D 0)
>                 return ERR_PTR(-EINVAL);
>
> -       ret =3D msm_gem_new_impl(dev, size, flags, &obj);
> +       ret =3D msm_gem_new_impl(dev, flags, &obj);
>         if (ret)
>                 return ERR_PTR(ret);
>
> @@ -1299,12 +1298,12 @@ struct drm_gem_object *msm_gem_import(struct drm_=
device *dev,
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_object *msm_obj;
>         struct drm_gem_object *obj;
> -       uint32_t size;
> +       size_t size;
>         int ret, npages;

npages should also be size_t.

>
>         size =3D PAGE_ALIGN(dmabuf->size);
>
> -       ret =3D msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
> +       ret =3D msm_gem_new_impl(dev, MSM_BO_WC, &obj);
>         if (ret)
>                 return ERR_PTR(ret);
>
> @@ -1347,7 +1346,7 @@ struct drm_gem_object *msm_gem_import(struct drm_de=
vice *dev,
>         return ERR_PTR(ret);
>  }
>
> -void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t=
 flags,
> +void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t f=
lags,
>                          struct drm_gpuvm *vm, struct drm_gem_object **bo=
,
>                          uint64_t *iova)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
> index 751c3b4965bc..a4cf31853c50 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -297,10 +297,10 @@ bool msm_gem_active(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *t=
imeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
> -               uint32_t size, uint32_t flags, uint32_t *handle, char *na=
me);
> +               size_t size, uint32_t flags, uint32_t *handle, char *name=
);
>  struct drm_gem_object *msm_gem_new(struct drm_device *dev,
> -               uint32_t size, uint32_t flags);
> -void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t=
 flags,
> +               size_t size, uint32_t flags);
> +void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t f=
lags,
>                          struct drm_gpuvm *vm, struct drm_gem_object **bo=
,
>                          uint64_t *iova);
>  void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm)=
;
> --
> 2.50.1
>

