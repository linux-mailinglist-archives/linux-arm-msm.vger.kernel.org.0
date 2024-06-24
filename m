Return-Path: <linux-arm-msm+bounces-23969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1716914FDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532B91F23421
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0FB143C52;
	Mon, 24 Jun 2024 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hul6K5s0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D711814D294;
	Mon, 24 Jun 2024 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719239127; cv=none; b=OeMEzCI+QRQQGteydijeOBoqYyyp260/19qWQB+fWExkc57C29c8zvQPwBYtoV51qDK1XkSfgOXWZzQpPsEngUoeDDCOeFiN4Yu/7qiEytqpOEn/VzLU9NGogSMBxL7mKwA36yzpyzQ9sSjfTEUoMGNWrzCvGsfGd5icz7HcNRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719239127; c=relaxed/simple;
	bh=Dgu+MZvdgu+zcSsdK2czgVKPWmgDHD+SOyksaJ4irsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/VoGyj3bqF+PEDkONts/vi36nPAmPokcCMlCegjX/3IBPoIYJSCElWFjDVcuQA+pTa/9oQIQh3AG1eqI1xzdZhyRtO7fxWgJvxsc8aV3WivszdiAPbLXxMbDLbz7UjzLQwJaRp5YV3MP5zhbJ6SOhSeG4IwzC6phkpDiOKAvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hul6K5s0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d1012e52fso5006916a12.3;
        Mon, 24 Jun 2024 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719239124; x=1719843924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXhcJIHJ6aL58Q+24L6xiELja+dHfuQGqa4Xai/mxrU=;
        b=hul6K5s0VvlK6NsYEsbDbMFwLW3q/GZgVVwH7MqQaCtqh0pQ6Ug3Eke/QK0NPoQ5Bi
         UTQVZX3bmccoxYt/MRns4Jkc9ADeLQp30lmLKXsoGuptG8IjKRkP6CbVYs96Lg03f1Dy
         3WNMV5nnGqKmVAAUSPbUheHdBpVkERY3Z4DNreQ2y7ck0jt/6zhSpE7d9TEcPnDAMDpE
         o/jyZ66TM+4svw2kUq461o0MfOI2Ui22F28XyozTeK6q2yWuLyMv3ROZBKirekQ7Bse5
         PSlSq/vX8g1aJupeY2SsY1qWitM68jS6knkCt0PnPYxNKtyRxzkJMun+OIyBFsbyZmby
         TscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239124; x=1719843924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXhcJIHJ6aL58Q+24L6xiELja+dHfuQGqa4Xai/mxrU=;
        b=KZn2PXgoRrH+d2hGwlBR4ZPwSfgMcABiQoNhcvzJiVWrTlRD6LC0u9tArhoTpubfna
         aFCjgfe0vY5uJ1v9XTZqzzdEpEEuopSjbb4CcwdSLnkSnJm+Lc3N4wfbGohmr446xwJA
         Cksir3JVSQRXYQhYbGg6IF8xzK0z15+JeX5IR7TbQM9ayOngznVQsK+Pq9T8JfnNupIV
         XDQrLHACSVddLPqELxapDkrTOkozvEiGvkO6vwXdqivtuYvdZVTJYiyJHmUHM8200mkY
         GtzwHaqi82BqI3mm1+304ndrD1qMFkh/qbDH2g8/Wwo51VHdzZVBe7tlDr07B6CoGix9
         jGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYBkcnG0MTND+x+vbF1xPK6Gq3ziirr5oGBuMR6ciV6hEgzxIeXcTm99pUwtyfgABWT/KeOpOpJm5axQg4Ctm3kQHhL71V28Y4vvZo73tYNvMX79DnZC/USOxb7bu+9fWc+NHcN0ncz8wKpQ==
X-Gm-Message-State: AOJu0YxmY/4YxS2UeProJVR6cKu3MBk0gCOifXTVLeWYaOnLR12JvMwB
	z0yVY9XoBJh9Qt6lAwYs6WZRPKLWkvVknV+scHRlen1hIA5zjT7DhCr3KYDHZiC/eCG96HA6EOd
	x/UhMyeTg4Vt4UHep0Wq4g2zrIgw=
X-Google-Smtp-Source: AGHT+IF68NrWtboqpp119GE7TUv2Lyjgd3LoOFLM9A15Bj8lLV1VtW17SedkyU29Crq5sxPUAkQJkhaJbtmwOyh0Tfk=
X-Received: by 2002:a50:a417:0:b0:57a:4c22:c0 with SMTP id 4fb4d7f45d1cf-57d4bd6060amr2710437a12.10.1719239123716;
 Mon, 24 Jun 2024 07:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com> <20240623110753.141400-3-quic_akhilpo@quicinc.com>
In-Reply-To: <20240623110753.141400-3-quic_akhilpo@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 07:25:11 -0700
Message-ID: <CAF6AEGti-Qibmb0YCgWypx7S1sVmtu3287a1reMnUgYqMzTKsw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 4:08=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> Add support in drm/msm driver for the Adreno X185 gpu found in
> Snapdragon X1 Elite chipset.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>  4 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.c
> index 0e3dfd4c2bc8..168a4bddfaf2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, u=
nsigned int state)
>          */
>         gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>
> +       if (adreno_is_x185(adreno_gpu)) {
> +               chipid =3D 0x7050001;
>         /* NOTE: A730 may also fall in this if-condition with a future GM=
U fw update. */
> -       if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> +       } else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_g=
pu)) {
>                 /* A7xx GPUs have obfuscated chip IDs. Use constant maj =
=3D 7 */
>                 chipid =3D FIELD_PREP(GENMASK(31, 24), 0x7);
>
> @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct dev=
ice *dev, u32 *votes,
>         if (!pri_count)
>                 return -EINVAL;
>
> -       sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> -       if (IS_ERR(sec))
> -               return PTR_ERR(sec);
> +       /*
> +        * Some targets have a separate gfx mxc rail. So try to read that=
 first and then fall back
> +        * to regular mx rail if it is missing
> +        */
> +       sec =3D cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> +       if (PTR_ERR_OR_ZERO(sec) =3D=3D -EPROBE_DEFER) {
> +               return -EPROBE_DEFER;
> +       } else if (IS_ERR(sec)) {
> +               sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> +               if (IS_ERR(sec))
> +                       return PTR_ERR(sec);
> +       }
>
>         sec_count >>=3D 1;
>         if (!sec_count)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 973872ad0474..97837f7f2a40 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1319,9 +1319,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu=
)
>                 count =3D ARRAY_SIZE(a660_protect);
>                 count_max =3D 48;
>                 BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> -       } else if (adreno_is_a730(adreno_gpu) ||
> -                  adreno_is_a740(adreno_gpu) ||
> -                  adreno_is_a750(adreno_gpu)) {
> +       } else if (adreno_is_a7xx(adreno_gpu)) {
>                 regs =3D a730_protect;
>                 count =3D ARRAY_SIZE(a730_protect);
>                 count_max =3D 48;
> @@ -1891,7 +1889,7 @@ static int hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
>
>         /* Set weights for bicubic filtering */
> -       if (adreno_is_a650_family(adreno_gpu)) {
> +       if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gp=
u)) {
>                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
>                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>                         0x3fe05ff4);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index c3703a51287b..139c7d828749 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -568,6 +568,20 @@ static const struct adreno_info gpulist[] =3D {
>                 .zapfw =3D "a740_zap.mdt",
>                 .hwcg =3D a740_hwcg,
>                 .address_space_size =3D SZ_16G,
> +       }, {
> +               .chip_ids =3D ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
> +               .family =3D ADRENO_7XX_GEN2,
> +               .fw =3D {
> +                       [ADRENO_FW_SQE] =3D "gen70500_sqe.fw",
> +                       [ADRENO_FW_GMU] =3D "gen70500_gmu.bin",
> +               },
> +               .gmem =3D 3 * SZ_1M,
> +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +                         ADRENO_QUIRK_HAS_HW_APRIV,
> +               .init =3D a6xx_gpu_init,
> +               .hwcg =3D a740_hwcg,
> +               .address_space_size =3D SZ_16G,

I'm kinda thinking we should drop the address_space_size and add
instead ADRENO_QUIRK_4G or something along those lines, since there
are devices with 32 or 64G

(a690 is incorrect in this way too)

BR,
-R

>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>                 .family =3D ADRENO_7XX_GEN3,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 77526892eb8c..d9ea8e0f6ad5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -448,6 +448,11 @@ static inline int adreno_is_a750(struct adreno_gpu *=
gpu)
>         return gpu->info->chip_ids[0] =3D=3D 0x43051401;
>  }
>
> +static inline int adreno_is_x185(struct adreno_gpu *gpu)
> +{
> +       return gpu->info->chip_ids[0] =3D=3D 0x43050c01;
> +}
> +
>  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
>  {
>         if (WARN_ON_ONCE(!gpu->info))
> --
> 2.45.1
>

