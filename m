Return-Path: <linux-arm-msm+bounces-29517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31295FB40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 23:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 363151F21959
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 21:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F222313B58F;
	Mon, 26 Aug 2024 21:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0kuVs49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05820881E;
	Mon, 26 Aug 2024 21:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706569; cv=none; b=RpriY+HbF96XsKb9nHt2q+bxcVlSj9Otwg+e7Z61Wwh6UEm/enVez/h8L0qZPKzsAQLSVu4TGnbL0TEPdF+e1ZiYvL0gKa9xIts5uhLCpU8Ogm++w6Pgv5zDuWOlYNsH2o4EGOQ0TopDG+rfHSdaYI14TQ7mIOAixnPBDO7Ocqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706569; c=relaxed/simple;
	bh=I30tP0ct4Q1VA620dqYabm9pe2UtKdECUXZ+Kh0jOrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDAQQ3F1DX5fKKNssTLRrDgp9cMatQclN7AcU83svDsIvXPleJOLIqeSLLijgCDQGEU68X3w3C8SidPk3bp5nUZ62mr4rSUZK2jVL0ZmYWWQdAxMF9SVZKs6Q5yxVW8BJztxdQY7JaLgni0VLCfh3HvdFJ4lCeCpzhepBqXjeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0kuVs49; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b6so5508845a12.2;
        Mon, 26 Aug 2024 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724706566; x=1725311366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIX2QhDkWrEJbwJWC9B9IU1GEoxp6p+7TY4C9wY3zQk=;
        b=B0kuVs49iYyl8UfJU2PoVdu7avumTMaDFLgYs4iGJAxrh0e+UMdw9ssWiHx/XFnElT
         JF/vd3oaGDCXDqG0Pw2qh2Ba9rda3HFMLYkF5QBX6igwwupNo1rrp3PKgyrWe251yNq0
         RclIhlPv4yUKVJpDLgQsWyOUG15nwpcHNql5+gzLoHTf6B2NKNJLn71TyZyC0JqIzX7K
         HDQ3IRo5W8ALgJWOLQgC2n9T1uFD0MYYxt2pvPFCnDaSXA0XO4n9zNnPNuXNJ+KA+Mnl
         Vpwj4j54BXX9BxT+Bm3zdj4ILGCe5LZe6V0NyuK93HSoutZjxHNdWgXXVYn0ZfFvuU+U
         402A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724706566; x=1725311366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIX2QhDkWrEJbwJWC9B9IU1GEoxp6p+7TY4C9wY3zQk=;
        b=DE91/itvSOUn8NHENRnnJLTQOU+B5skgCG6uXxTIjlGeKDOu07JcNmItlXbWtyoArI
         PYmYg8ik+T3rwcJTHrpt5HzQf8oE39tVSQ4MumZY6T+XAesv1OehPw6IttlysPK39Eoc
         7A4RAny6aAsInaP6mgZd2YtTg3XtSh5Uq5XZwBQw6BAHvjMtejjy+2YCkI4EmpcwahmI
         icJ7Op6OI2+AUzY87uABSYsS319xCR843Js4vn6pM3BpUJ0bjPMbZvPHyGcGVTjKD7Do
         A0aq8jON8aIOPm0Zz2q3HfzbWBGdrufhonBqwqGZ6vUTM0V5sl2o4k69C/Ltz0b1Rg3M
         VtXw==
X-Forwarded-Encrypted: i=1; AJvYcCWb12elMAIqzVnT6opHeP70TMdw2ArwPvRPOpYKeGJRu4Y1ivkXsFy4RdMCM5emi7JsUUoU6IpKXEMzyytN@vger.kernel.org, AJvYcCXV1Pq+8aYNXTnAtf8PDS2og/W4W06tGOv3c7xAon07873fFwMZMmUH+fWFOSSquCizrv0//4QOM8yzbHQz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cmufF8N8puFBpV8MMwPMfX1EPhE4XBEXK+kSj11/lFXr19sT
	9ZEprjTZkl4Oc8Wi0OZqR9iNz4m438gEs7rEMWCIBJjfiWyUuvYR8LCFCKqkje6y6AFhgt0H0JI
	dZlfaYevFglj39HmO03pRsnmx/ds=
X-Google-Smtp-Source: AGHT+IHjH2V+r3o8cuh9MtOoJUMYYUTv3WA9yQbt9yDfSAYpP0BqSZlmFoQzTuLcTdeynqPmZo+JxZ8fXgfCkSNazcs=
X-Received: by 2002:a05:6402:520b:b0:5c0:ab6f:653c with SMTP id
 4fb4d7f45d1cf-5c0ab6f66b8mr2061302a12.1.1724706565773; Mon, 26 Aug 2024
 14:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
 <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org> <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
In-Reply-To: <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 26 Aug 2024 14:09:14 -0700
Message-ID: <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:07=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Fri, Jul 19, 2024 at 3:03=E2=80=AFAM Konrad Dybcio <konrad.dybcio@lina=
ro.org> wrote:
> >
> > This was apparently almost never set on a6xx.. move the existing values
> > and fill out the remaining ones within the catalog.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 ++----
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
> >  3 files changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index 1ea535960f32..deee0b686962 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] =3D =
{
> >         {REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> >         {REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> >         {REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> > -       {REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
> >         {REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> >         {REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
> >         {}
> > @@ -636,6 +635,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a612_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                         .prim_fifo_threshold =3D 0x00080000,
> >                 },
> >                 /*
> > @@ -668,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a615_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00000222,
> >                         .prim_fifo_threshold =3D 0x00180000,
> >                 },
> >                 .speedbins =3D ADRENO_SPEEDBINS(
> > @@ -691,6 +692,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .init =3D a6xx_gpu_init,
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00000222,
> >                         .prim_fifo_threshold =3D 0x00180000,
> >                 },
> >                 .speedbins =3D ADRENO_SPEEDBINS(
> > @@ -714,6 +716,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a615_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00000222,
> >                         .prim_fifo_threshold =3D 0x00018000,
> >                 },
> >                 .speedbins =3D ADRENO_SPEEDBINS(
> > @@ -737,6 +740,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a615_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00000222,
> >                         .prim_fifo_threshold =3D 0x00018000,
> >                 },
> >                 .speedbins =3D ADRENO_SPEEDBINS(
> > @@ -760,6 +764,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a615_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00000222,
> >                         .prim_fifo_threshold =3D 0x00018000,
> >                 },
> >                 .speedbins =3D ADRENO_SPEEDBINS(
> > @@ -788,6 +793,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a630_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                         .prim_fifo_threshold =3D 0x00180000,
> >                 },
> >         }, {
> > @@ -806,6 +812,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a640_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                         .prim_fifo_threshold =3D 0x00180000,
> >                 },
> >                 .speedbins =3D ADRENO_SPEEDBINS(
> > @@ -829,6 +836,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a650_hwcg,
> >                         .protect =3D &a650_protect,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                         .prim_fifo_threshold =3D 0x00300200,
> >                 },
> >                 .address_space_size =3D SZ_16G,
> > @@ -855,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a660_hwcg,
> >                         .protect =3D &a660_protect,
> > +                       .gmu_cgc_mode =3D 0x00020000,
> >                         .prim_fifo_threshold =3D 0x00300200,
> >                 },
> >                 .address_space_size =3D SZ_16G,
> > @@ -874,6 +883,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a660_hwcg,
> >                         .protect =3D &a660_protect,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                         .prim_fifo_threshold =3D 0x00200200,
> >                 },
> >                 .address_space_size =3D SZ_16G,
> > @@ -899,6 +909,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a640_hwcg,
> >                         .protect =3D &a630_protect,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                         .prim_fifo_threshold =3D 0x00200200,
> >                 },
> >         }, {
> > @@ -917,6 +928,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a690_hwcg,
> >                         .protect =3D &a690_protect,
> > +                       .gmu_cgc_mode =3D 0x00020200,
> >                         .prim_fifo_threshold =3D 0x00800200,
> >                 },
> >                 .address_space_size =3D SZ_16G,
> > @@ -1178,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a702_hwcg,
> >                         .protect =3D &a650_protect,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                         .prim_fifo_threshold =3D 0x0000c000,
> >                 },
> >                 .speedbins =3D ADRENO_SPEEDBINS(
> > @@ -1202,6 +1215,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a730_hwcg,
> >                         .protect =3D &a730_protect,
> > +                       .gmu_cgc_mode =3D 0x00020000,
> >                 },
> >                 .address_space_size =3D SZ_16G,
> >         }, {
> > @@ -1221,6 +1235,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >                         .hwcg =3D a740_hwcg,
> >                         .protect =3D &a730_protect,
> >                         .gmu_chipid =3D 0x7020100,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                 },
> >                 .address_space_size =3D SZ_16G,
> >         }, {
> > @@ -1239,6 +1254,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >                         .hwcg =3D a740_hwcg,
> >                         .protect =3D &a730_protect,
> >                         .gmu_chipid =3D 0x7050001,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                 },
> >                 .address_space_size =3D SZ_256G,
> >         }, {
> > @@ -1257,6 +1273,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .protect =3D &a730_protect,
> >                         .gmu_chipid =3D 0x7090100,
> > +                       .gmu_cgc_mode =3D 0x00020202,
> >                 },
> >                 .address_space_size =3D SZ_16G,
> >         }
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index aaeb1161f90d..871452daa189 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool=
 state)
> >         struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
> >         const struct adreno_reglist *reg;
> >         unsigned int i;
> > -       u32 val, clock_cntl_on, cgc_mode;
> > +       u32 val, clock_cntl_on;
> >
> >         if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu=
)))
> >                 return;
> > @@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, boo=
l state)
> >                 clock_cntl_on =3D 0x8aa8aa82;
> >
> >         if (adreno_is_a7xx(adreno_gpu)) {
> > -               cgc_mode =3D adreno_is_a740_family(adreno_gpu) ? 0x2022=
2 : 0x20000;
> > -
>
> This does appear to change the gmu_cgc_mode in nearly all cases.. was
> this intended?

Hmm, and this will only get written for a7xx, so we're dropping the
reg write for a690..

> BR,
> -R
>
> >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_M=
ODE_CNTL,
> > -                         state ? cgc_mode : 0);
> > +                         state ? adreno_gpu->info->a6xx->gmu_cgc_mode =
: 0);
> >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_D=
ELAY_CNTL,
> >                           state ? 0x10111 : 0);
> >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_H=
YST_CNTL,
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.h
> > index bc37bd8c7f65..0fb7febf70e7 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -22,6 +22,7 @@ struct a6xx_info {
> >         const struct adreno_reglist *hwcg;
> >         const struct adreno_protect *protect;
> >         u32 gmu_chipid;
> > +       u32 gmu_cgc_mode;
> >         u32 prim_fifo_threshold;
> >  };
> >
> >
> > --
> > 2.45.2
> >

