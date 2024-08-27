Return-Path: <linux-arm-msm+bounces-29671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 968DB961863
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 22:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5586B22C2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752041D2795;
	Tue, 27 Aug 2024 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baV2727w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8A1CDA26;
	Tue, 27 Aug 2024 20:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724789587; cv=none; b=g5s/+607vhFXe5pYMMWg4Djp3y/m7GJBWO/YCYe5bo6lXQRNZCSs36fMMNBpjFW9Wbvjv0rhraKanuaSG95ak14T1Mjp7eLHv9OvVRzYERZH8r17pVsN6QkjcvOy5UIixF3ajLZNzawXj8L61fA6o/rJfNQTcTX7AJNGcCOAbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724789587; c=relaxed/simple;
	bh=vrQ7ysCSXxpvFRUtJwPWzQUsaIRiTM/al6qYGhkJ6ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=larLlsvASAc57GCofvTS0iZJN9f8FOVrNwzHpFWof03NRKQdap/DgD1U2ze8GPhPbXHr6C1PVjvTXOj7HpiusHV2LkoEJQnDuz0FV8BAgG79MHYHl6grXfPU6NwQ9Wi/Cc2kxWymHR/BrKiloCxkqktoNRvopQsMmiD8J1cxde4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baV2727w; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bf068aebe5so7452191a12.0;
        Tue, 27 Aug 2024 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724789580; x=1725394380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1kAFeRUUkUPzf8j/TTAdVevnQF3KbzgNDiHDcBMBag=;
        b=baV2727wZoveczng09s+MKgZrESfeQLp8+hw5pWq8HnAnw5qQmwVBYYtQ7d5KVkSa8
         YnjlveVu31k6EkPZTqSL+LWpEMFT28sbBhrZCcWbXHjakK2ykXh/cvhARlkkKHNhn+tW
         BLKnRowV90G0aF1+PZVkK0yu0ADwUCXPiH2yupYkeJ0ks/1yKTsUn+U+RfFf9AY/p2KW
         OpIC2v4pWRLCv8YKst4l7O+8KbBZDGc1gy0059holx3wNW+fD3mA/dEoBGWJxFgXymkB
         YRnabqcGbfS5dpV7vRw0p5X9CbC8hiQOWmWtlADZc0LvleCh3Qp5sRrrWF9kipwhL1Br
         H5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724789580; x=1725394380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1kAFeRUUkUPzf8j/TTAdVevnQF3KbzgNDiHDcBMBag=;
        b=dWCYuWDxoUntewr+XS9//Ceo/nVGFjf8ApqNjyAnOI2YtYegB0+X9Kk79j1CZxwZGm
         5W5BlLmzVOIoC8t6fL+VSAf7flZkYKmbLB6DwuT7nSLQCYGZXA0AKIHNjXZsfdnATo9p
         Ir60Je10++HvMLwi5zgDgWFQMqzwc+iaalAt02d3tubU1SOdlGSqcmsE2nYg4UwYEuN0
         8xEXJ9NNrv9StNhZiVfAYrU1773C0xO5MFkYmZwVme01SMPcyIOy+PYcKvnZabKizlgU
         xsC/+aPJDcjyadcmXK+5Y/ZEI3QnJhmXIUh5fB6CJ5I8V9rCbu4DfhaAn25+fEZvvJz6
         1J+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvLo1I7bF7086N6MSYSyVhZFfRGGwnx7iPL3Nb1HMe49qLEERqVFDlSLUUg/6+gC4RnsRdIsF0lLCwrgem@vger.kernel.org, AJvYcCXq7b6tDOYYK6KR+IzEl9iXmzHf5B4OtI0NmFdL9IwXsSs0Lt9oC3wSnZmyVhSYzETHUimBaAuo251xYsXE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxism7VGy4Oh0qWnf0VqfGsTwGOwfzDPPq0z9/Xigu3b2nJwqV3
	gYOdWcPj6G0U44e7/aRjVSEcMDT6+e8G75ju7kNaetmZQCLlHyiXiclpThVuuvJjukDMOTLMXxO
	0wqUlyMdQPI/wKTzPmblVLzXQkgo=
X-Google-Smtp-Source: AGHT+IGMI7VsfWj2s/nh8dIO8bCfxyCvIeFS2NNKFnpFkfgacirB/qC+VqtaTXNOHdp3SxPr2sC7wtA48oijoRclV6Y=
X-Received: by 2002:a05:6402:3550:b0:5c0:9fca:9352 with SMTP id
 4fb4d7f45d1cf-5c09fca944emr5418717a12.36.1724789579939; Tue, 27 Aug 2024
 13:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
 <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org> <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
 <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
In-Reply-To: <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Aug 2024 13:12:47 -0700
Message-ID: <CAF6AEGtkikykNKHz0905HZ4FOJYieO5R3jr6-OO8QLYqok25BA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

resending with updated Konrad email addr

On Mon, Aug 26, 2024 at 2:09=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Mon, Aug 26, 2024 at 2:07=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Fri, Jul 19, 2024 at 3:03=E2=80=AFAM Konrad Dybcio <konrad.dybcio@li=
naro.org> wrote:
> > >
> > > This was apparently almost never set on a6xx.. move the existing valu=
es
> > > and fill out the remaining ones within the catalog.
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 ++----
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
> > >  3 files changed, 21 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/=
drm/msm/adreno/a6xx_catalog.c
> > > index 1ea535960f32..deee0b686962 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > @@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] =
=3D {
> > >         {REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> > >         {REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> > >         {REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> > > -       {REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
> > >         {REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> > >         {REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
> > >         {}
> > > @@ -636,6 +635,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a612_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00080000,
> > >                 },
> > >                 /*
> > > @@ -668,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -691,6 +692,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .init =3D a6xx_gpu_init,
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -714,6 +716,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00018000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -737,6 +740,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00018000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -760,6 +764,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00018000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -788,6 +793,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a630_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >         }, {
> > > @@ -806,6 +812,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a640_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -829,6 +836,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a650_hwcg,
> > >                         .protect =3D &a650_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00300200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -855,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a660_hwcg,
> > >                         .protect =3D &a660_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020000,
> > >                         .prim_fifo_threshold =3D 0x00300200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -874,6 +883,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a660_hwcg,
> > >                         .protect =3D &a660_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00200200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -899,6 +909,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a640_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00200200,
> > >                 },
> > >         }, {
> > > @@ -917,6 +928,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a690_hwcg,
> > >                         .protect =3D &a690_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020200,
> > >                         .prim_fifo_threshold =3D 0x00800200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -1178,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a702_hwcg,
> > >                         .protect =3D &a650_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x0000c000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -1202,6 +1215,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a730_hwcg,
> > >                         .protect =3D &a730_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020000,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > >         }, {
> > > @@ -1221,6 +1235,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                         .hwcg =3D a740_hwcg,
> > >                         .protect =3D &a730_protect,
> > >                         .gmu_chipid =3D 0x7020100,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > >         }, {
> > > @@ -1239,6 +1254,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                         .hwcg =3D a740_hwcg,
> > >                         .protect =3D &a730_protect,
> > >                         .gmu_chipid =3D 0x7050001,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                 },
> > >                 .address_space_size =3D SZ_256G,
> > >         }, {
> > > @@ -1257,6 +1273,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .protect =3D &a730_protect,
> > >                         .gmu_chipid =3D 0x7090100,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > >         }
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index aaeb1161f90d..871452daa189 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bo=
ol state)
> > >         struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
> > >         const struct adreno_reglist *reg;
> > >         unsigned int i;
> > > -       u32 val, clock_cntl_on, cgc_mode;
> > > +       u32 val, clock_cntl_on;
> > >
> > >         if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_g=
pu)))
> > >                 return;
> > > @@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, b=
ool state)
> > >                 clock_cntl_on =3D 0x8aa8aa82;
> > >
> > >         if (adreno_is_a7xx(adreno_gpu)) {
> > > -               cgc_mode =3D adreno_is_a740_family(adreno_gpu) ? 0x20=
222 : 0x20000;
> > > -
> >
> > This does appear to change the gmu_cgc_mode in nearly all cases.. was
> > this intended?
>
> Hmm, and this will only get written for a7xx, so we're dropping the
> reg write for a690..
>
> > BR,
> > -R
> >
> > >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC=
_MODE_CNTL,
> > > -                         state ? cgc_mode : 0);
> > > +                         state ? adreno_gpu->info->a6xx->gmu_cgc_mod=
e : 0);
> > >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC=
_DELAY_CNTL,
> > >                           state ? 0x10111 : 0);
> > >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC=
_HYST_CNTL,
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.h
> > > index bc37bd8c7f65..0fb7febf70e7 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > @@ -22,6 +22,7 @@ struct a6xx_info {
> > >         const struct adreno_reglist *hwcg;
> > >         const struct adreno_protect *protect;
> > >         u32 gmu_chipid;
> > > +       u32 gmu_cgc_mode;
> > >         u32 prim_fifo_threshold;
> > >  };
> > >
> > >
> > > --
> > > 2.45.2
> > >

