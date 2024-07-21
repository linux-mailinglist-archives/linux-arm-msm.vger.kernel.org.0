Return-Path: <linux-arm-msm+bounces-26680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82D938635
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jul 2024 23:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF8161F2100C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jul 2024 21:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8731BD529;
	Sun, 21 Jul 2024 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKIUzlq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA956322E;
	Sun, 21 Jul 2024 21:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721598201; cv=none; b=agzy2Nb2YGoZhZ2XZJZot/KY/C/3J5JPRgNbIYLGUjB5ChOP637WDF8t1uFKCkmPe1XeT9cjtYIg/P8/Hm8pHhEZ4DmwWmKOgIRYr6l7DZmObpTCYzTM8Vethfka3HgfdvYxvWpfbwuT77qnI21XDLJXbAOTE4Eqw5JU6j6DuK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721598201; c=relaxed/simple;
	bh=4iaDEe8bEFU4SUANinOIIN8SjYNlk7AC/IOHNcEFw+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oco9pKtPHz019nrZED6YMjYNWfREF4UfwhbiUOxjBWQx8LoPll4pYmRKQzJPe8OgxMXWtHFGDiiVApx867hxKtMYj2WNGTxglXBcfRRrQ2QzlxAo+ME1EG0HAwRvaRclmjBLjPHJb35RdbBHcxoWreuCwqG2iIr1Vt3eCmC+ZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKIUzlq6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2010989a12.2;
        Sun, 21 Jul 2024 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721598199; x=1722202999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4GmvoaTuonLMkgxvdyWZq2weTLspPvsGFuIaeqz+wQ=;
        b=ZKIUzlq6QtAxP9ohLi1EKbmp6uDAmkVrTVyErWsUdaVpVRGUFT7NupHu4EGwgbYZXe
         T7kIZr+5Pi2ahlNulp+3/YGpfJ/09qqdpyLFIV4dKZqveKCo4vXJ79ZBP8kSqaTqXCdF
         7XahitNNHgpJ7uE1QMFlsDMr3rfN2zLNhWuKPQVzDRNJ+dF+I+Y22B/lNo7N1USrnwwL
         pToDKTi0jh3HV7CDtlUro/zEQrUaO9EYQdEC1l3oowtFFMe24ybvnJ4Y959jwhnWZytd
         NWKsRGbQg3RlygLdduQEROzx0ZzcRB/kzYh8gJctzd6CtCelYwTHDZgyAZHCTDickEcj
         np3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721598199; x=1722202999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4GmvoaTuonLMkgxvdyWZq2weTLspPvsGFuIaeqz+wQ=;
        b=XFXaZ7WSWPEKnMw/OByLSXthcdKECwXroHRKnnrSnVnFe1MwqjFqmN6RQcZ7IzxoC1
         FlbHHJegfGu9MDNUDGl6Ltcxk8VGPvESaJ6R9LL/r1ksRPICy/fuARTWHJrlM3OB/EBy
         GkpB1StL5ghBRLWt+BTENUdLwYhLAc8FpXthmnJf1uQfVM/HEgUoDMxoSgi9X3jzOcXT
         Woy+UGzmEfjBCg6VzhhHBwG2FXx6SWEX5YimcGqRa3bBRjuEUxhGYljMOrTDIoUtxXFK
         q3HDEfIlhI/Pq0JEdIG5+pbr4RIZsXCMga4YbqLXcs9Tn0Oc4PKjvlqhYxN8sAt40dMz
         eClg==
X-Forwarded-Encrypted: i=1; AJvYcCVeoE0eal99HaifnuYSkOrAHl2zKXEp/c1K2+8c8fqoFc5fB3wwQkSzTmE6IqS3GZOI5fxuh7WnZQMGS7Qg0oERYS57SwIBIOK3vtqjb7hrAeZHGu3yg8b3kWrwCfkpxA7JT1Vua9czwsXPlg==
X-Gm-Message-State: AOJu0YwM6BRCVSV9tMFFpOmP75C6enB3tIsaNB/wW9tkonSGYf9kjGMJ
	CJz+h/qLCOZVmnK4899fj4hzE37etgWwB+shgF1JZ1M5WbqgGjIN9x2lL2dyQaMUqgET+dJGdBv
	DTYaZZ9oSUVw3od6emjMWBd2wrJV0Kpj7/4k=
X-Google-Smtp-Source: AGHT+IE0m57M0lv0Bov+KnIzcCurDxaQ9o49WC1ffJ0Ecoi1fU8qWPQY8A0Xw5SNXViRinSgbvyIgc4yEGmAh/O9We8=
X-Received: by 2002:a05:6a20:1aa6:b0:1c0:f274:c54a with SMTP id
 adf61e73a8af0-1c4228e96d2mr3567560637.28.1721598199171; Sun, 21 Jul 2024
 14:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620-a306a-v2-1-0d388e1deebf@gmail.com> <2f10d70a-aed6-4687-8e12-4d649f6a2a5e@linaro.org>
In-Reply-To: <2f10d70a-aed6-4687-8e12-4d649f6a2a5e@linaro.org>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Sun, 21 Jul 2024 23:43:07 +0200
Message-ID: <CAGsSOWUoSkDooRx+QUrucj517pBFxwDMiCwoA6tah5o2=q2oGw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Add A306A support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	20240618164303.66615-1-robdclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 1:36=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 20.06.2024 11:52 PM, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > From: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> >
> > Add support for Adreno 306A GPU what is found in MSM8917 SoC.
> > This GPU marketing name is Adreno 308.
> >
> > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > [use internal name of the GPU, reword the commit message]
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
> > Changes in v2:
> > - Rebase on https://patchwork.freedesktop.org/series/127393/
> > - Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c=
7@gmail.com
> > ---
> >  drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
> >  drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
> >  3 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a3xx_catalog.c
> > index 0de8465b6cf0..61aeac5054a2 100644
> > --- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> > @@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] =3D {
> >               .gmem  =3D SZ_128K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x03000620),
> > +             .family =3D ADRENO_3XX,
> > +             .revn  =3D 308,
>
> Double space
It is similar like other blocks.
>
> > +             .fw =3D {
> > +                     [ADRENO_FW_PM4] =3D "a300_pm4.fw",
> > +                     [ADRENO_FW_PFP] =3D "a300_pfp.fw",
> > +             },
> > +             .gmem  =3D SZ_128K,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .init  =3D a3xx_gpu_init,
> >       }, {
> >               .chip_ids =3D ADRENO_CHIP_IDS(
> >                       0x03020000,
> > diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a3xx_gpu.c
> > index 5273dc849838..b46ff49f47cf 100644
> > --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> > @@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
> >               gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003)=
;
> >               gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a=
);
> >               gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a=
);
> > +     } else if (adreno_is_a306a(adreno_gpu)) {
> > +             gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003)=
;
> > +             gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010=
);
> > +             gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010=
);
> >       } else if (adreno_is_a320(adreno_gpu)) {
> >               /* Set up 16 deep read/write request queues: */
> >               gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010)=
;
> > @@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
> >       gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
> >
> >       /* Enable Clock gating: */
> > -     if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
> > +     if (adreno_is_a305b(adreno_gpu) ||
> > +         adreno_is_a306(adreno_gpu) ||
> > +         adreno_is_a306a(adreno_gpu))
> >               gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
> >       else if (adreno_is_a320(adreno_gpu))
> >               gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
> > @@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
> >               gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
> >
> >       /* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
> > -     if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
> > -                     adreno_is_a320(adreno_gpu)) {
> > +     if (adreno_is_a305(adreno_gpu) ||
> > +         adreno_is_a306(adreno_gpu) ||
> > +         adreno_is_a306a(adreno_gpu) ||
> > +         adreno_is_a320(adreno_gpu)) {
> >               gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
> >                               AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2)=
 |
> >                               AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6)=
 |
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index b8ee9320a315..3b361a077688 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -292,6 +292,12 @@ static inline bool adreno_is_a306(const struct adr=
eno_gpu *gpu)
> >       return adreno_is_revn(gpu, 307);
> >  }
> >
> > +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
> > +{
> > +     /* a306a marketing name is a308 */
>
> "marketing name is a308" could use a (), but it's me being picky..
/* a306a (marketing name is a308) */ ?
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> > +     return adreno_is_revn(gpu, 308);
> > +}
> > +
> >  static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
> >  {
> >       return adreno_is_revn(gpu, 320);
> >
> > ---
> > base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
> > change-id: 20240528-a306a-48e173724d6c
> > prerequisite-message-id: <20240618164303.66615-1-robdclark@gmail.com>
> > prerequisite-patch-id: b26cd6e5aa23ea623fec94f938a06d1e3359de55
> > prerequisite-patch-id: 301e8fe4c2687a4606ee7debce95a5ada732e27f
> > prerequisite-patch-id: 24a5654d9b52079c010b0594d8599d84af1659c7
> > prerequisite-patch-id: b09a3d28d04b7ebe968e05835ebf8397c27f8d7d
> > prerequisite-patch-id: a74556e25862c22f0ec543b8a7c7d92cb2e55099
>
> b4 is amazing
>
> Konrad

