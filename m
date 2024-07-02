Return-Path: <linux-arm-msm+bounces-24890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E739240F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 16:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CB4281802
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 14:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C871DFE3;
	Tue,  2 Jul 2024 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TztlGkjS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B311BE7F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930715; cv=none; b=qDLfd4QKTRQKUV7VSJvEEfitdfR/4+PaL6L7LdRWmM2Sa5bsRzaFt3C4ruLqVcLvkFwTzW5UXHcHd3p4FFApMziwqZ12Ufsej/k/umt+QyN9CoH4X6RNbAKyAESc76FAHKIk5HwncgUpg5LHtp+DqnW384LfttlcXQLMhNVr26o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930715; c=relaxed/simple;
	bh=nllA+uxPTlxlcGyyBzCU0F1eTVv4JTYRZbM6EaNbJ8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxpi/03shLi8DbmiR1K/VkcUyVy15vkYiVoCmQociRiX2+hSX5EG19O2IGYjhroMW5Whg/hHubLvMhcptmn49lxjwPw8FLQjowudwNUHr9/TcNnj1z4RD7oFAzh9E8eJbgZ8dZu4Fh+Ew9aXAQGE+rw5I29Raz2mRj/vjAV2gdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TztlGkjS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso2245975a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719930713; x=1720535513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6zM5tU5QFFmVWuSFqhyuiK14HA9L2zMcB50VIIzdJo=;
        b=TztlGkjSFAmqQa0ZIkTTA0h1VigvVHnwU0MxC5rHGepTg5P/FM9g/I8gQ63fbW9aa7
         uBp7NQ21sjUBc+Ml13XHcEMiIbEbwME9G9wsm7Gfh4qpD1olOfPMEFmPJJOMpiSu6OiT
         fNXxZtvwRw6Dl+NmQT+mTJiS/NkPrDiwlBkKd7FtoAjbHNniuoL/YCohVfIZboAqSnIA
         J+W1dghqjX6+ENWA4ZTpRoM+dXshVenoeTG6VQe7droAS8YCWJ/vRw14vUrBgCdC0nuZ
         RyC14O/aq9MzChUT/XZ79snz0Q1So/RLL6qOlT/jIvM/q4St0xpEQEi3nzlkVIkjT0js
         SakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719930713; x=1720535513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6zM5tU5QFFmVWuSFqhyuiK14HA9L2zMcB50VIIzdJo=;
        b=puAhYqvaPYAYp5o3Li61HVYceSp3Mi8/dOapb1QEwcD+cX1PvxJZg1/AvQa0SvjJul
         xQejCH8d5Hyv55Nv27F9naJRgjhevkXAyS7HEEXw+q7iMbi0B+VR068bCKtFrOZEPfx9
         JQTe1fu6PSJLFnoa5r/gP3eKk2DXl9uxwWT1ZjFZHAin2K/4Focj3XmlVvFj0w+Z0xwQ
         +nQ1GzHcTA66htEkAVkTFBdAlBqctDSc3YGSFljXPK8+hreHRErMPFNTz9ju2LLgSf82
         jkT46ZY+4Wm3MCxzbUWWqIonohi07Yrl3Jx6nuBWKJqGQN4tMZWu+q6/ZVcTNo5twCUC
         x74g==
X-Forwarded-Encrypted: i=1; AJvYcCXkf28Zw2oTqa04Cd9jh8i7nDS+TDgpKNTSzwXi4XB5BZhg7PJquvc8/Th314WwMeYHyELxn2/LhUTIpvMC3GwxqtVXNkq9a9Ait2jyxQ==
X-Gm-Message-State: AOJu0YwFwtElKqk63n7rQlASsFUBt2gu6pad9dnvjgCLpdbQ6k4o65p0
	A/F3Z8kIXpTXzkTHrknIvX1okwsWiv6LXeH3MFX548Kg/tNoWQuPdTQ3e4xpXPaRvcAZ3E+xMiA
	iyNg2jecy0L2ew/YSH63zWgknznY=
X-Google-Smtp-Source: AGHT+IGso0BljKVwbkyC6SeXo26MO6l7CwcXrbDcUzUoj5LbNZjp5wGm2nw0rpZFSIkrodAqJM0onhBdhTyifEAKeQc=
X-Received: by 2002:a05:6402:50d3:b0:57d:4b56:da11 with SMTP id
 4fb4d7f45d1cf-5879f4a5716mr7212784a12.11.1719930712510; Tue, 02 Jul 2024
 07:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com> <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com>
In-Reply-To: <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Jul 2024 07:31:40 -0700
Message-ID: <CAF6AEGsFtgvKAjvjD5K5Uhw-PSEWrvW2O7reiM2Z7p6=R5wQiQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: Expand UBWC config setting
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 5:56=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> According to downstream we should be setting RBBM_NC_MODE_CNTL to a
> non-default value on a663 and a680, we don't support a663 and on a680
> we're leaving it at the wrong (suboptimal) value. Just set it on all
> GPUs. Similarly, plumb through level2_swizzling_dis which will be
> necessary on a663.
>
> ubwc_mode is expanded and renamed to ubwc_swizzle to match the name on
> the display side. Similarly macrotile_mode should match the display
> side.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 36 ++++++++++++++++++++++++---=
------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 ++-
>  3 files changed, 33 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index c003f970189b..33b0f607f913 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1788,5 +1788,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *de=
v)
>         else
>                 adreno_gpu->ubwc_config.highest_bank_bit =3D 14;
>
> +       /* a5xx only supports UBWC 1.0, these are not configurable */
> +       adreno_gpu->ubwc_config.macrotile_mode =3D 0;
> +       adreno_gpu->ubwc_config.ubwc_swizzle =3D 0x7;
> +
>         return gpu;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c98cdb1e9326..7a3564dd7941 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -499,8 +499,17 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>         gpu->ubwc_config.uavflagprd_inv =3D 0;
>         /* Whether the minimum access length is 64 bits */
>         gpu->ubwc_config.min_acc_len =3D 0;
> -       /* Entirely magic, per-GPU-gen value */
> -       gpu->ubwc_config.ubwc_mode =3D 0;
> +       /* Whether to enable level 1, 2 & 3 bank swizzling.
> +        * UBWC 1.0 always enables all three levels.
> +        * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
> +        * UBWC 4.0 adds the optional ability to disable levels 2 & 3.

I guess this is a bitmask for BIT(level_n)?

> +        */
> +       gpu->ubwc_config.ubwc_swizzle =3D 0x6;
> +       /* Whether to use 4-channel macrotiling mode or the newer 8-chann=
el
> +        * macrotiling mode introduced in UBWC 3.1. 0 is 4-channel and 1 =
is
> +        * 8-channel.
> +        */

Can we add these comments as kerneldoc comments in the ubwc_config
struct?  That would be a more natural place for eventually moving ubwc
config to a central systemwide table (and perhaps finally properly
dealing with the setting differences for DDR vs LPDDR)

BR,
-R

> +       gpu->ubwc_config.macrotile_mode =3D 0;
>         /*
>          * The Highest Bank Bit value represents the bit of the highest D=
DR bank.
>          * This should ideally use DRAM type detection.
> @@ -510,7 +519,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>         if (adreno_is_a610(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 13;
>                 gpu->ubwc_config.min_acc_len =3D 1;
> -               gpu->ubwc_config.ubwc_mode =3D 1;
> +               gpu->ubwc_config.ubwc_swizzle =3D 0x7;
>         }
>
>         if (adreno_is_a618(gpu))
> @@ -536,6 +545,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> +               gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_7c3(gpu)) {
> @@ -543,12 +553,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> +               gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a702(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 14;
>                 gpu->ubwc_config.min_acc_len =3D 1;
> -               gpu->ubwc_config.ubwc_mode =3D 0;
>         }
>  }
>
> @@ -564,21 +574,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
>
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> +                 level2_swizzling_dis << 12 |
>                   adreno_gpu->ubwc_config.rgb565_predicator << 11 |
>                   hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> +                 hbb_lo << 1 | ubwc_mode);
>
> -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
> +       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
> +                 level2_swizzling_dis << 6 | hbb_hi << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> +                 hbb_lo << 1 | ubwc_mode);
>
> -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
> +       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> +                 level2_swizzling_dis << 12 | hbb_hi << 10 |
>                   adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> +                 hbb_lo << 1 | ubwc_mode);
>
>         if (adreno_is_a7xx(adreno_gpu))
>                 gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
> @@ -586,6 +601,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>                   adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 2=
1);
> +
> +       gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
> +                 adreno_gpu->ubwc_config.macrotile_mode);
>  }
>
>  static int a6xx_cp_init(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index cff8ce541d2c..b2da660c10c7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -194,9 +194,10 @@ struct adreno_gpu {
>                 u32 rgb565_predicator;
>                 u32 uavflagprd_inv;
>                 u32 min_acc_len;
> -               u32 ubwc_mode;
> +               u32 ubwc_swizzle;
>                 u32 highest_bank_bit;
>                 u32 amsbc;
> +               u32 macrotile_mode;
>         } ubwc_config;
>
>         /*
>
> --
> 2.31.1
>

