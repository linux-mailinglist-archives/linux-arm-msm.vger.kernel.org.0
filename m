Return-Path: <linux-arm-msm+bounces-20305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D168CD20D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 14:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9BDA1C20DD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 12:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4F1146016;
	Thu, 23 May 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A04jUYRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684A13EFFB;
	Thu, 23 May 2024 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466481; cv=none; b=K6MZrSsHTqowEFRkkmoOm4PR9teXnk1SXdB5POgkCt6piB9hrxTU7UaScz4+LsQxYXrI9L6VDJswQ1465Qw+hkZvgU3Xwt3Mx1Qjb4U4xSamBzRx9k6dXvt4ysouKL7ej20ykqeLroxfqcVntpBFKCbWGTarlarMORdkTduS9B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466481; c=relaxed/simple;
	bh=xZIpJivLu+N2qKC2v6ld7pqDHFIxvM1aDec54BJF83E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INtuBuQ1hA872vQzxM5L8lsc0gGOJYcU2MtPr6tbfGfoCjvCfi25H+iBSk3TwfcOqFv2NK6f+5efm0LESW2CIWPQQQU5pYaqgoSNPx4BJwvzU4gd6+VbTwrWmYuHv0e4aHuS7ULWZdBl/0xB5BpjxTfqt0Apuwse6PfYr65hnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A04jUYRV; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so2132539a12.0;
        Thu, 23 May 2024 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716466479; x=1717071279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3oL0hJH9iQZa7HT6bN1XrGAdgrVd/JpkMuhPZJ+FSA=;
        b=A04jUYRVfkecPE4juj+E73SWD9wyvOdkjOGW7vaRecaNkDOmHTFhcVjMk+Z0w6E/Be
         pwcZrDvslDqUjrRhO+SWHqOoGEqjvD9KYiMKIWi2rWuWxg2jqekH3uOGXURXWTc1wzX8
         wDnOsTOvXWYwKJWDweOdTulQJvIq6RhFfaRRGCLL54r5Xoyvpk1IvJajFMCWFAPMIDvH
         tcLqoFN/HtFMT0P2GsFMtpmrkbbZYoLCGSb5mWxIgKwX5hoTCiiFSrDDlUtDbT1iTukL
         F09dqGMo9GOzwiRYEpdRGfWozqWq/8+YLbMo8hwKy1kVUINZt2YLFPQhV5Vecl6k8dmz
         Yu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716466479; x=1717071279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3oL0hJH9iQZa7HT6bN1XrGAdgrVd/JpkMuhPZJ+FSA=;
        b=RtZGkGuPn0nSmyjXLvdf0U1SYH2DjpPDnszcYnwC13FrwbyoLC9tMKK/KyDbuihJul
         g5BKi4TKao3UYfKi0gkK4zzN7G043sSC3VSbFyolJvJ066bq+XhbtdIqF9BXdB7HxB1H
         1RjzMUYvR/+kHm9wd3cbymij/ahdmByPl6+8OjfC38MyZHNAPwbKhN+m/1ir2Qk6SSQx
         EzGJvqYgYvfH7Nj4x4RV5d76INExHyE5r0BOMV81txE7bPNoJjShP6F+F+3P/vHJLgS+
         PzpjW2O/15f4Oq74aPSHE8MqJqGhk3KvcL5edqaYh+hk3+TYnZpktydoDEcZRmzrZyVU
         J+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUPN1Si9bD6EyK1X11plpwbos4RCqkUY2o82twu1NRm/awE7UkA2RHuAE7PHygH6Nf6Z0+M2Cqu43TkrNXTDcY1Nzamena1+eJMS3X9gUjqLqVj4uAJlGd5vHD4qEKDkaDL+SFBcl1+XEbMnM6BJEBC4XuAEympXMz4xSGdu9FslqKKnILbIC6xr11WZAHOcqd0d8qneOBU54XNYPjuWPLVZNQ=
X-Gm-Message-State: AOJu0Yw6MxxyHBgAS6atSPTSstktZ96hahiGjlAHNCQgs1SkGKlEfGqh
	PKuotP1U9hSZRea5r7I1IC/sWnO7WDJmCyLA8piixL60XU7365+CKpLee9yG/VXZtd1zmYxl5Oy
	QXmxXbVFvGhW/pkpB17KIC/m3dUw=
X-Google-Smtp-Source: AGHT+IHw9ZZCHWpxNboaptDkdVdr8T+p7xebRwOl0Rjt8m+lhfKDa/C5Cw+D+Bez4Rundj6pGONwEyaKDtN6PK/SNng=
X-Received: by 2002:a17:90a:c907:b0:2bd:edbe:4e1 with SMTP id
 98e67ed59e1d1-2bdedbe0512mr984702a91.31.1716466478558; Thu, 23 May 2024
 05:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org> <20240219-topic-rb1_gpu-v2-5-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-5-2d3d6a0db040@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 May 2024 13:14:26 +0100
Message-ID: <CACu1E7FTN=kwaDJMNiTmFspALzj2+Q-nvsN5ugi=vz4RdUGvGw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm/adreno: Add A702 support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 9:28=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> The A702 is a weird mix of 600 and 700 series.. Perhaps even a
> testing ground for some A7xx features with good ol' A6xx silicon.
> It's basically A610 that's been beefed up with some new registers
> and hw features (like APRIV!), that was then cut back in size,
> memory bus and some other ways.
>
> Add support for it, tested with QCM2290 / RB1.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 92 ++++++++++++++++++++++++=
+++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 16 +++++-
>  3 files changed, 117 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c9c55e2ea584..2a491a486ca1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -837,6 +837,65 @@ const struct adreno_reglist a690_hwcg[] =3D {
>         {}
>  };
>
> +const struct adreno_reglist a702_hwcg[] =3D {
> +       { REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
> +       { REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
> +       { REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
> +       { REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
> +       { REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
> +       { REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
> +       { REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
> +       { REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
> +       { REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
> +       { REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
> +       { REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
> +       { REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
> +       {}
> +};
> +
>  const struct adreno_reglist a730_hwcg[] =3D {
>         { REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
>         { REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
> @@ -968,6 +1027,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool =
state)
>                 clock_cntl_on =3D 0x8aa8aa02;
>         else if (adreno_is_a610(adreno_gpu))
>                 clock_cntl_on =3D 0xaaa8aa82;
> +       else if (adreno_is_a702(adreno_gpu))
> +               clock_cntl_on =3D 0xaaaaaa82;
>         else
>                 clock_cntl_on =3D 0x8aa8aa82;
>
> @@ -989,14 +1050,14 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, boo=
l state)
>                 return;
>
>         /* Disable SP clock before programming HWCG registers */
> -       if (!adreno_is_a610(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
> +       if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_=
gpu))
>                 gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1=
, 0);
>
>         for (i =3D 0; (reg =3D &adreno_gpu->info->hwcg[i], reg->offset); =
i++)
>                 gpu_write(gpu, reg->offset, state ? reg->value : 0);
>
>         /* Enable SP clock */
> -       if (!adreno_is_a610(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
> +       if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_=
gpu))
>                 gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0=
, 1);
>
>         gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : =
0);
> @@ -1224,7 +1285,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu=
)
>         const u32 *regs =3D a6xx_protect;
>         unsigned i, count, count_max;
>
> -       if (adreno_is_a650(adreno_gpu)) {
> +       if (adreno_is_a650(adreno_gpu) || adreno_is_a702(adreno_gpu)) {
>                 regs =3D a650_protect;
>                 count =3D ARRAY_SIZE(a650_protect);
>                 count_max =3D 48;
> @@ -1320,6 +1381,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gp=
u *gpu)
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>         }
> +
> +       if (adreno_is_a702(gpu)) {
> +               gpu->ubwc_config.highest_bank_bit =3D 14;
> +               gpu->ubwc_config.min_acc_len =3D 1;
> +               gpu->ubwc_config.ubwc_mode =3D 2;

I just noticed, but this is wrong. ubwc_mode is a 1 bit field and what
this is actually doing is overwriting hbb_lo, making the highest bank
bit 15 instead of 14.

> +       }
>  }
>
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> @@ -1453,7 +1520,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gp=
u *a6xx_gpu,
>                 return false;
>
>         /* A7xx is safe! */
> -       if (adreno_is_a7xx(adreno_gpu))
> +       if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
>                 return true;
>
>         /*
> @@ -1671,7 +1738,7 @@ static int hw_init(struct msm_gpu *gpu)
>         a6xx_set_hwcg(gpu, true);
>
>         /* VBIF/GBIF start*/
> -       if (adreno_is_a610(adreno_gpu) ||
> +       if (adreno_is_a610_family(adreno_gpu) ||
>             adreno_is_a640_family(adreno_gpu) ||
>             adreno_is_a650_family(adreno_gpu) ||
>             adreno_is_a7xx(adreno_gpu)) {
> @@ -1705,6 +1772,7 @@ static int hw_init(struct msm_gpu *gpu)
>         }
>
>         if (!(adreno_is_a650_family(adreno_gpu) ||
> +             adreno_is_a702(adreno_gpu) ||
>               adreno_is_a730(adreno_gpu))) {
>                 gmem_range_min =3D adreno_is_a740_family(adreno_gpu) ? SZ=
_16M : SZ_1M;
>
> @@ -1725,7 +1793,7 @@ static int hw_init(struct msm_gpu *gpu)
>         if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(ad=
reno_gpu)) {
>                 gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
>                 gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
> -       } else if (adreno_is_a610(adreno_gpu)) {
> +       } else if (adreno_is_a610_family(adreno_gpu)) {
>                 gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x00800060);
>                 gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x40201b16);
>         } else if (!adreno_is_a7xx(adreno_gpu)) {
> @@ -1740,13 +1808,18 @@ static int hw_init(struct msm_gpu *gpu)
>         if (adreno_is_a610(adreno_gpu)) {
>                 gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
>                 gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
> +       } else if (adreno_is_a702(adreno_gpu)) {
> +               gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 64);
> +               gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 63);
>         } else if (!adreno_is_a7xx(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
>
>         /* Setting the primFifo thresholds default values,
>          * and vccCacheSkipDis=3D1 bit (0x200) for A640 and newer
>         */
> -       if (adreno_is_a690(adreno_gpu))
> +       if (adreno_is_a702(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x0000c000);
> +       else if (adreno_is_a690(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
>         else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)=
)
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
> @@ -1786,7 +1859,7 @@ static int hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 =
<< 30) | 0x4fffff);
>         else if (adreno_is_a619(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 =
<< 30) | 0x3fffff);
> -       else if (adreno_is_a610(adreno_gpu))
> +       else if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu)=
)
>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 =
<< 30) | 0x3ffff);
>         else
>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 =
<< 30) | 0x1fffff);
> @@ -1822,6 +1895,9 @@ static int hw_init(struct msm_gpu *gpu)
>                 else
>                         gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
>                 gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
> +       } else if (adreno_is_a702(adreno_gpu)) {
> +               /* Something to do with the HLSQ cluster */
> +               gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(24));
>         }
>
>         if (adreno_is_a690(adreno_gpu))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 2ce7d7b1690d..b121abc71338 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -492,6 +492,24 @@ static const struct adreno_info gpulist[] =3D {
>                 .zapfw =3D "a690_zap.mdt",
>                 .hwcg =3D a690_hwcg,
>                 .address_space_size =3D SZ_16G,
> +       }, {
> +               .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> +               .family =3D ADRENO_6XX_GEN1, /* NOT a mistake! */
> +               .fw =3D {
> +                       [ADRENO_FW_SQE] =3D "a702_sqe.fw",
> +               },
> +               .gmem =3D SZ_128K,
> +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +               .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> +               .init =3D a6xx_gpu_init,
> +               .zapfw =3D "a702_zap.mbn",
> +               .hwcg =3D a702_hwcg,
> +               .speedbins =3D ADRENO_SPEEDBINS(
> +                       { 0,   0 },
> +                       { 236, 1 },
> +                       { 178, 2 },
> +                       { 142, 3 },
> +               ),
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x07030001),
>                 .family =3D ADRENO_7XX_GEN1,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index bc14df96feb0..f451881a6ddf 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -77,7 +77,7 @@ struct adreno_reglist {
>  };
>
>  extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[]=
, a640_hwcg[], a650_hwcg[];
> -extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a730_hwcg[]=
, a740_hwcg[];
> +extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a702_hwcg[]=
, a730_hwcg[], a740_hwcg[];
>
>  struct adreno_speedbin {
>         uint16_t fuse;
> @@ -382,6 +382,20 @@ static inline int adreno_is_a690(const struct adreno=
_gpu *gpu)
>         return gpu->info->chip_ids[0] =3D=3D 0x06090000;
>  }
>
> +static inline int adreno_is_a702(const struct adreno_gpu *gpu)
> +{
> +       return gpu->info->chip_ids[0] =3D=3D 0x07000200;
> +}
> +
> +static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
> +{
> +       if (WARN_ON_ONCE(!gpu->info))
> +               return false;
> +
> +       /* TODO: A612 */
> +       return adreno_is_a610(gpu) || adreno_is_a702(gpu);
> +}
> +
>  /* check for a615, a616, a618, a619 or any a630 derivatives */
>  static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
>  {
>
> --
> 2.43.2
>

