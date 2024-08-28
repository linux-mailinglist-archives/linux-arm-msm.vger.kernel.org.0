Return-Path: <linux-arm-msm+bounces-29785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8132D962AFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355AD1F23A6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1C71891AC;
	Wed, 28 Aug 2024 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYzLPD28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745C917C9AF;
	Wed, 28 Aug 2024 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857332; cv=none; b=qtkY3k1m3sXYuNjlMaF1QJI1HgXZFi+V9CiwmGcLH74vw2r5s/MR/oX6neVr51bddGM/or9boipNfi+RtqmiBsgVSHwaBaLLfJFogWJ5B7fbkP8Sk24oekdtQ36FFn9+Bsvgyuy8Q6UxzWW1SokgdX5YpTYiBSFlqRoUeNUZh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857332; c=relaxed/simple;
	bh=+C5Ir0kofCaMx4UpFydW1CbwaTLDRckemtDzjSxoIW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkQBn0zhUpe0W9PxLGk+hVsMcZ1lDejZrFxSkY8/v7AP7ZqDDHq6yqX5xckldFPig/Ov0qgvzDDp6exlkvSwZ1bLhjlKnUahUOXOMhaT6WVhpwJvsr+GKF/lXoWzKiRd/MYfuYoOekqABaUPv6818Cjl4L25rlcAvZzk4w++6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYzLPD28; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d5f5d8cc01so563860a91.0;
        Wed, 28 Aug 2024 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724857330; x=1725462130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T684eJY5uaT2GoNJQao8Ux/8bEW4DFpDBArVLTN0ng=;
        b=VYzLPD28b98jg3JgtPrrvO7ljh3gaQakBPOgpWfyJyKYZ5oHz2czCW+K1ZwCQL829U
         93lVaftfKHUnQFmlesdYiKRxYFgemO5DHHYcTpqi23NvJG86W3hYLD9GOV2jXpTx+8R7
         8vYzRN9OnpeSoGDyt71E3DDDbGZbEhbrAYYXyjLDbLUTxUt436n1RjTjHLvk0TQ2gv8g
         SDCvZ+GKNHc9Ed6rUmUVQVmGWHAY5IqByBnRkg/x8hdWR+AeBc/phEuZ6bOs6/gPTqkq
         AXmcg2atsQ+M96Kn+37NNLXEkHuQJpKbsNhVOdTvnx7z9+THXBJyGRhllzPQZUw7Izmv
         tiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857330; x=1725462130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2T684eJY5uaT2GoNJQao8Ux/8bEW4DFpDBArVLTN0ng=;
        b=ETuQGnY6PosSqNL8/rXrqfz8hD2RenxQdvWeJAaB9UornbIjX+vs1/jjsBfYpP9tjj
         H5amniApPM7eTR5c5+sq4Sq4emIbXkNZn0yEFnYZiVdx3w+ExslZiGmyV5HCk6LwGahC
         nZQVXW+6GReaX5XVsmwJpsWeFF7lgyTqLB5fmyjacGRGr//n1sD+RnG5HN7JAlJnW4Tw
         L9GXDXOsGuJnTzZ4MqFkiwOPahcML57oieNFf2uO5JjdkZi2FvcqzPD1Q0e0MmTVT3Ml
         2UApp+04CAahDuXYzmBKhnhdL4Azqga8xd8sBM7lV7QbXV07F07R4BYj9gvFnhf0OCL7
         Mv6A==
X-Forwarded-Encrypted: i=1; AJvYcCXK8kFBrCWCC++cRR4YjtbPMcRv8Txxby3A1UUdLSZghUMvccol+eMu8vawTd4ZT1zb+T7QDIMcpyc9cz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMs5FL2xN31P+sCzy3oluYn+DrhywE/Jg5xp8vQo3hHytdy3zT
	hNTrDhdxhtim5B3pAcQPdHVFRXhs7d3bqh7mUQ2+et60FrUePTt1JJVisjAazyMN0Cri0iWkr0y
	EkquuQ4nO8SM7gWKp92kQeC3M6F4=
X-Google-Smtp-Source: AGHT+IF7bNTPR1qyKoYtr4W+dmqFvYBuHOT06w+IqX5vqDvi6m7zgZ+Ib4Beyv/qmB8HmkrdfHIOYz2dLy3spp+c14A=
X-Received: by 2002:a17:90a:644c:b0:2c9:90fa:b9f8 with SMTP id
 98e67ed59e1d1-2d843d6f66dmr3633644a91.10.1724857329540; Wed, 28 Aug 2024
 08:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722-a306a-v3-1-cff90857c615@gmail.com>
In-Reply-To: <20240722-a306a-v3-1-cff90857c615@gmail.com>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Wed, 28 Aug 2024 17:01:58 +0200
Message-ID: <CAGsSOWUO=+LE6Xat61yoE9u9TTAdpAEXo9ECvkAw9Cbyw_AZ8A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/adreno: Add A306A support
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I hope it was not forgotten or am I missing something?

On Mon, Jul 22, 2024 at 4:58=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n <tra=
barni@gmail.com> wrote:
>
> From: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
>
> Add support for Adreno 306A GPU what is found in MSM8917 SoC.
> This GPU marketing name is Adreno 308.
>
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> [use internal name of the GPU, reword the commit message]
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> ---
> Changes in v3:
> - Fix issues addressed by reviews.
> - Rebase on latest next.
> - Link to v2: https://lore.kernel.org/r/20240620-a306a-v2-1-0d388e1deebf@=
gmail.com
>
> Changes in v2:
> - Rebase on https://patchwork.freedesktop.org/series/127393/
> - Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@=
gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
>  3 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a3xx_catalog.c
> index 0de8465b6cf0..2eb6c3e93748 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> @@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] =3D {
>                 .gmem  =3D SZ_128K,
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
>                 .init  =3D a3xx_gpu_init,
> +       }, {
> +               .chip_ids =3D ADRENO_CHIP_IDS(0x03000620),
> +               .family =3D ADRENO_3XX,
> +               .revn =3D 308,
> +               .fw =3D {
> +                       [ADRENO_FW_PM4] =3D "a300_pm4.fw",
> +                       [ADRENO_FW_PFP] =3D "a300_pfp.fw",
> +               },
> +               .gmem =3D SZ_128K,
> +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +               .init =3D a3xx_gpu_init,
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(
>                         0x03020000,
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a3xx_gpu.c
> index 5273dc849838..b46ff49f47cf 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003)=
;
>                 gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a=
);
>                 gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a=
);
> +       } else if (adreno_is_a306a(adreno_gpu)) {
> +               gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003)=
;
> +               gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010=
);
> +               gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010=
);
>         } else if (adreno_is_a320(adreno_gpu)) {
>                 /* Set up 16 deep read/write request queues: */
>                 gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010)=
;
> @@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
>
>         /* Enable Clock gating: */
> -       if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
> +       if (adreno_is_a305b(adreno_gpu) ||
> +           adreno_is_a306(adreno_gpu) ||
> +           adreno_is_a306a(adreno_gpu))
>                 gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
>         else if (adreno_is_a320(adreno_gpu))
>                 gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
> @@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
>
>         /* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
> -       if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
> -                       adreno_is_a320(adreno_gpu)) {
> +       if (adreno_is_a305(adreno_gpu) ||
> +           adreno_is_a306(adreno_gpu) ||
> +           adreno_is_a306a(adreno_gpu) ||
> +           adreno_is_a320(adreno_gpu)) {
>                 gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
>                                 AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2)=
 |
>                                 AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6)=
 |
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 1ab523a163a0..c3b7970c2bfa 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -294,6 +294,12 @@ static inline bool adreno_is_a306(const struct adren=
o_gpu *gpu)
>         return adreno_is_revn(gpu, 307);
>  }
>
> +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
> +{
> +       /* a306a (marketing name is a308) */
> +       return adreno_is_revn(gpu, 308);
> +}
> +
>  static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
>  {
>         return adreno_is_revn(gpu, 320);
>
> ---
> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
> change-id: 20240528-a306a-48e173724d6c
>
> Best regards,
> --
> Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
>

