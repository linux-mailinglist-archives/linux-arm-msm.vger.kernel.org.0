Return-Path: <linux-arm-msm+bounces-24891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185EC924197
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 16:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D1311C211B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 14:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194681BA880;
	Tue,  2 Jul 2024 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPGA4VAJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5FD15B995
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 14:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719932341; cv=none; b=JGd3JuXUetFhPJzjJJbcfCxgEPo19Els9pwbE4aOZG6JTNvifp2GPshCqENBtswWzwNR0Px6aHxWSYwL+dfg8B2vOkiiBJokGBtuwXOKDA433HqkQVYtjSXa521uA+BEMO/SLhYKQL8nl2I7H6GRhKk6WC/OzEA/ELH8+hFnMkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719932341; c=relaxed/simple;
	bh=uxW14RlGzbCrholahQRHkGjQZPm6tNgCVV+Hu1FRO70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5xAHnNQF7BRgwatKmdDRIglJfK1P+94JLM9I7svGv0gYKa5hEvaPj2v9GUHk3dxMrNts9lhWx3lDKCxGn4jYupXgcgpRwSvhFq/4fKAM9uM3A51ML9TxkW+CulgvYhBAgicfagmCmixE4VJPUNroXO0u5Exg2E4uWnXAGCePdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPGA4VAJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7066463c841so2828266b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719932339; x=1720537139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xd/gYaSsw123ES2y6SAFKy2GqNwG0P6DwixOAzM0d/w=;
        b=TPGA4VAJwS5CQHQVci40P6jjP6RvyWDo9eFy3Jl6N08gZnUNUzjB8ZemLSiemOIdwa
         7eML3H/qVXl9dnH1WHX/COP8iKqNULhO2HpGwdIytjRHwZr+52pQwviZSEx2Fmyncmf2
         WSqV+WJnkHyQGyt4VexzlOKzWtuhap2UFUr4ZRzShAg3aC1XIGv1AKefPPMJvCsQehG2
         jtHaLasODUxS2u5OqTdz8xw1eOInoPTvgPuEGHXTUhr/ZgWTNn5YRkRelKV/qPgJMNth
         KFozF8Z+vknd7HFARYqTKwEb4EjDlULIkpuiBh5HT74Hu+Fm35XgU9dCuL73Q/Be1BLm
         fNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719932339; x=1720537139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xd/gYaSsw123ES2y6SAFKy2GqNwG0P6DwixOAzM0d/w=;
        b=K2dYiaOmKgLoRsACLY7+GUG+JF05F0xc7tXozKMWYKsGYdPiZiOMu8vandfP4H3kJS
         TY6+Q1I0sfbJvHU7LSS7WRFaR1NE/g3A7Yk0KfKno14Lk8LFFeEy6XubRhPr+hp3l+JE
         66q3M28eJPWv2mG/amvQ9PmE2jS4fP5sgDoKbZwGbYlRgi842z84p8NjvASeBMYwNJLB
         ulCDMyrsIc4Ain6StCkM486hafJymVx+SNog4Ld+9xu73izwCV1AbLyis760F2jpN6lG
         Rrjm3QE8lOTHmut8qw9MuwyHQXVR7D5TehXwUs4d/fUegZkTCQCpeCo6k8Up0dCd+/xG
         Cbrw==
X-Forwarded-Encrypted: i=1; AJvYcCXNDAieT04mi7p8yOlUNEe4Xs2x0MPi9rRfgnfMyXaKb0HbfDHkLkSWQIjKASOoX2pYAQ0TclZ1UERlWHmVSR6l5mmXMLATCOaPxPz24w==
X-Gm-Message-State: AOJu0YzZ7AX/ySBJJb+wMmNzlSK5THTjFfqGTxNH+SMU5Rj4dwBArzwk
	dhcMGj2938JT5CJ74Wbht9Z28P+UgBcfiq7zIIFBaiQMST0CsvdDuINmbGreVuj7n1f3TGVxE+Y
	NA4KfrvSYNpGSQOboypBG+xZEZws=
X-Google-Smtp-Source: AGHT+IEQ4JierNF7bQpxvoWM/0SST94e0VkWdILSLE4uBS5WVteG6Gu9MkA66HiTLnYiyOrjLoXkaX5Pch6Hn/SY3FU=
X-Received: by 2002:a05:6a00:92a2:b0:706:747c:76b6 with SMTP id
 d2e1a72fcca58-70aaaee27cdmr7355424b3a.22.1719932338594; Tue, 02 Jul 2024
 07:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
 <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com> <CAF6AEGsFtgvKAjvjD5K5Uhw-PSEWrvW2O7reiM2Z7p6=R5wQiQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsFtgvKAjvjD5K5Uhw-PSEWrvW2O7reiM2Z7p6=R5wQiQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 2 Jul 2024 15:58:47 +0100
Message-ID: <CACu1E7E8FWQdiwX8s4L8MEyAX0v6PJgD9fuG=Y_3WA8Zh3hm0w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: Expand UBWC config setting
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 3:31=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> On Tue, Jul 2, 2024 at 5:56=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com=
> wrote:
> >
> > According to downstream we should be setting RBBM_NC_MODE_CNTL to a
> > non-default value on a663 and a680, we don't support a663 and on a680
> > we're leaving it at the wrong (suboptimal) value. Just set it on all
> > GPUs. Similarly, plumb through level2_swizzling_dis which will be
> > necessary on a663.
> >
> > ubwc_mode is expanded and renamed to ubwc_swizzle to match the name on
> > the display side. Similarly macrotile_mode should match the display
> > side.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++++
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 36 ++++++++++++++++++++++++-=
--------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 ++-
> >  3 files changed, 33 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a5xx_gpu.c
> > index c003f970189b..33b0f607f913 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -1788,5 +1788,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *=
dev)
> >         else
> >                 adreno_gpu->ubwc_config.highest_bank_bit =3D 14;
> >
> > +       /* a5xx only supports UBWC 1.0, these are not configurable */
> > +       adreno_gpu->ubwc_config.macrotile_mode =3D 0;
> > +       adreno_gpu->ubwc_config.ubwc_swizzle =3D 0x7;
> > +
> >         return gpu;
> >  }
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index c98cdb1e9326..7a3564dd7941 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -499,8 +499,17 @@ static void a6xx_calc_ubwc_config(struct adreno_gp=
u *gpu)
> >         gpu->ubwc_config.uavflagprd_inv =3D 0;
> >         /* Whether the minimum access length is 64 bits */
> >         gpu->ubwc_config.min_acc_len =3D 0;
> > -       /* Entirely magic, per-GPU-gen value */
> > -       gpu->ubwc_config.ubwc_mode =3D 0;
> > +       /* Whether to enable level 1, 2 & 3 bank swizzling.
> > +        * UBWC 1.0 always enables all three levels.
> > +        * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & =
3.
> > +        * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
>
> I guess this is a bitmask for BIT(level_n)?

Yes, I'll add that to the comment. BIT(0) is level 1, BIT(1) is level
2, and BIT(2) is level 3. I got that convention from msm_mdss.c.

>
> > +        */
> > +       gpu->ubwc_config.ubwc_swizzle =3D 0x6;
> > +       /* Whether to use 4-channel macrotiling mode or the newer 8-cha=
nnel
> > +        * macrotiling mode introduced in UBWC 3.1. 0 is 4-channel and =
1 is
> > +        * 8-channel.
> > +        */
>
> Can we add these comments as kerneldoc comments in the ubwc_config
> struct?  That would be a more natural place for eventually moving ubwc
> config to a central systemwide table (and perhaps finally properly
> dealing with the setting differences for DDR vs LPDDR)

Sure. These comments started right next to the code setting the
registers and sort of naturally migrated here but I guess that's
better.

FWIW, I think that in a central systemwide table we'd want to define
the config struct slightly differently, by instead storing the UBWC
version and deriving most of these parameters from that as kgsl
downstream and mdss upstream do. There would be a few extra parameters
that remain:

- highest bank bit
- minimum access length
- levels 2 & 3 bank swizzling enable/disable (level 1 can be inferred
from the version, but maybe we still want to have it to keep all the
bank swizzle config in one place?)

Everybody seems to also have macrotile_mode as a separate parameter,
but that can be avoided by adding UBWC 3.1 and then deriving it from
"ubwc_version >=3D 3.1".

I haven't taken that step here in adreno because I didn't want to
define UBWC versions in UABI yet when it's not necessary, and if we
don't have that then it's not quite necessary to refactor the driver
yet.

Connor

>
> BR,
> -R
>
> > +       gpu->ubwc_config.macrotile_mode =3D 0;
> >         /*
> >          * The Highest Bank Bit value represents the bit of the highest=
 DDR bank.
> >          * This should ideally use DRAM type detection.
> > @@ -510,7 +519,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
> >         if (adreno_is_a610(gpu)) {
> >                 gpu->ubwc_config.highest_bank_bit =3D 13;
> >                 gpu->ubwc_config.min_acc_len =3D 1;
> > -               gpu->ubwc_config.ubwc_mode =3D 1;
> > +               gpu->ubwc_config.ubwc_swizzle =3D 0x7;
> >         }
> >
> >         if (adreno_is_a618(gpu))
> > @@ -536,6 +545,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
> >                 gpu->ubwc_config.amsbc =3D 1;
> >                 gpu->ubwc_config.rgb565_predicator =3D 1;
> >                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> > +               gpu->ubwc_config.macrotile_mode =3D 1;
> >         }
> >
> >         if (adreno_is_7c3(gpu)) {
> > @@ -543,12 +553,12 @@ static void a6xx_calc_ubwc_config(struct adreno_g=
pu *gpu)
> >                 gpu->ubwc_config.amsbc =3D 1;
> >                 gpu->ubwc_config.rgb565_predicator =3D 1;
> >                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> > +               gpu->ubwc_config.macrotile_mode =3D 1;
> >         }
> >
> >         if (adreno_is_a702(gpu)) {
> >                 gpu->ubwc_config.highest_bank_bit =3D 14;
> >                 gpu->ubwc_config.min_acc_len =3D 1;
> > -               gpu->ubwc_config.ubwc_mode =3D 0;
> >         }
> >  }
> >
> > @@ -564,21 +574,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *=
gpu)
> >         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> >         u32 hbb_hi =3D hbb >> 2;
> >         u32 hbb_lo =3D hbb & 3;
> > +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> > +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swi=
zzle & 2);
> >
> >         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> > +                 level2_swizzling_dis << 12 |
> >                   adreno_gpu->ubwc_config.rgb565_predicator << 11 |
> >                   hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
> >                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> > -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> > +                 hbb_lo << 1 | ubwc_mode);
> >
> > -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
> > +       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
> > +                 level2_swizzling_dis << 6 | hbb_hi << 4 |
> >                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> > -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> > +                 hbb_lo << 1 | ubwc_mode);
> >
> > -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
> > +       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> > +                 level2_swizzling_dis << 12 | hbb_hi << 10 |
> >                   adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
> >                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> > -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> > +                 hbb_lo << 1 | ubwc_mode);
> >
> >         if (adreno_is_a7xx(adreno_gpu))
> >                 gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
> > @@ -586,6 +601,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
> >
> >         gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
> >                   adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo <<=
 21);
> > +
> > +       gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
> > +                 adreno_gpu->ubwc_config.macrotile_mode);
> >  }
> >
> >  static int a6xx_cp_init(struct msm_gpu *gpu)
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index cff8ce541d2c..b2da660c10c7 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -194,9 +194,10 @@ struct adreno_gpu {
> >                 u32 rgb565_predicator;
> >                 u32 uavflagprd_inv;
> >                 u32 min_acc_len;
> > -               u32 ubwc_mode;
> > +               u32 ubwc_swizzle;
> >                 u32 highest_bank_bit;
> >                 u32 amsbc;
> > +               u32 macrotile_mode;
> >         } ubwc_config;
> >
> >         /*
> >
> > --
> > 2.31.1
> >

