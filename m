Return-Path: <linux-arm-msm+bounces-23970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F22914FE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06EC3B22B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B62143C44;
	Mon, 24 Jun 2024 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RazppWe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C423EA72;
	Mon, 24 Jun 2024 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719239301; cv=none; b=rKr8dlJCUPSJEfhlxxEskuJUvUdc/GvjPgzI8mvhXWba6qbXt6hSQc/qv76+uz3wFEcKM55QGfgmRka6BWxJTxkObHn7Fm1FHP+QkcjcMXIX4LP2dAyXidvIEskcPFP5+rDM83BP4xmbkLEgpG730VnTVs0hEOwUB5/OlNQ3ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719239301; c=relaxed/simple;
	bh=99Zz3DlQs/XyJ99/sDyMvEk+Xp+hUzRrroVD5k+Wl2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERBVrKY5ZEJYCdaAz3FQw9uyQ4rHGVbNXRZqvSn7xkt7OLubGKgwEX90x5dQOwEUa7VKFvG3pfk/ui4xR+xBzVjOmRS8p4fMWeZllqYF9qGc6Q4iUBFJx8eNt46/9GplaNY1wWjUEGY35gHTt2T3lp4mDiS0lTBzeKsZRKKe4XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RazppWe3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6fe7a0cb58so101091366b.1;
        Mon, 24 Jun 2024 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719239298; x=1719844098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqKLNgTuFKM0ZCtxXKtMgTqLY0aOhJLT00CcJPHXIww=;
        b=RazppWe3aS30mYX6h8HysJjgeXabpYBUUa0NxR5PdDjw3jUxGT3RnaKFAhfd382Gri
         bdwjKwHJSzcRKrXKEe7Fdl9BTPz/E0wYn33NcyAp8MLDoa5xgrtuNHffk5QW2PGL6ehH
         KaINcqWnCORd/rF62BPKY0D03z0k0P+mdpiNlE3jnm6xfuI9KTebWB8hD6CL6VP9yE7+
         CX5jGlWCrS8U8f/NoeVJDySX5I6yKLLwD3Vud8jutVGkPpAP40yNWmAtuaJmRSAnXEDZ
         ygPdJIuyyQIDUkpQhM+NH3gj3Zas2kh2VWmQzkSy9nT4/eUJPikWcGsBTfStGO/YWcof
         eR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239298; x=1719844098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqKLNgTuFKM0ZCtxXKtMgTqLY0aOhJLT00CcJPHXIww=;
        b=CgeTtUEVB7k6rl2Mq7cjC4TjzxSGfCUwAtCtbUC2mj7IciKXxHSjgmHZXWNnFzgEHB
         96ra8lrSEks+CIf/tdilLZYktHptYeNzqGZIKsy2xS+DtbRWhfgUFGU6DLKX1MtWZUGJ
         NwjNX6au29luVNeMyivy423Y4SxT6xCmHMIibDoKxs2afyj0uXOmME2XbFl2Rudxs0ud
         tuvLGo4D9ZO8eWftmmDm75u7XZsGUee1NC1Nj4ILhNkLWlDzDca/a4pNCRj9WSzRBKpY
         gY3H5uec2wJtdfDihaBZA4OVHnJ9n1C2NDRpwaDqZqZMZ5A6Q9Vy2etf+WUghO0Iwt/K
         8/oA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Uhg+7O9SYEl1Gl6KYYh3M9BC9Aq72c7u6iL5HaazgjK+5w0yMUsKU6/RNUiVmnVB0ZmfUy9lXkvVr9A7PkRrhDAWQS/q/4UVK5bDikPofzO90UkOFQojEBMa9EsrqBT5AamjgJoJ3kOfbA==
X-Gm-Message-State: AOJu0Yw34IJaQjmptMyOMZqykYllZm8IVM0YJzFQbX+Fn+2i3ZEa8iqj
	oW4RTHv+o5EM88cd56wGrEmCGbvqvI/D1xZpzF8rlPyEcii6YSZdCGjAsfHcLqCl2guCBW2wUV3
	rFbSsPTkLUtjMc8h44GXjr69hkaA=
X-Google-Smtp-Source: AGHT+IFwOxUB2g0LO6vpR019qwMsG9+gEf3VPde7nLgxFLGZ7hxLAghHqprjYJFoum0OHF6FJg2/THwzvXC6WnTCdRQ=
X-Received: by 2002:a50:9f6d:0:b0:57c:671d:8455 with SMTP id
 4fb4d7f45d1cf-57d4bd728c8mr3451952a12.14.1719239298308; Mon, 24 Jun 2024
 07:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com> <CAF6AEGti-Qibmb0YCgWypx7S1sVmtu3287a1reMnUgYqMzTKsw@mail.gmail.com>
In-Reply-To: <CAF6AEGti-Qibmb0YCgWypx7S1sVmtu3287a1reMnUgYqMzTKsw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 07:28:06 -0700
Message-ID: <CAF6AEGvWFUOk-N8oRxZZYm-EWGV61yiLfjZAUSjHdmy9RhDiAA@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 7:25=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Sun, Jun 23, 2024 at 4:08=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >
> > Add support in drm/msm driver for the Adreno X185 gpu found in
> > Snapdragon X1 Elite chipset.
> >
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> >  4 files changed, 36 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c
> > index 0e3dfd4c2bc8..168a4bddfaf2 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu,=
 unsigned int state)
> >          */
> >         gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> >
> > +       if (adreno_is_x185(adreno_gpu)) {
> > +               chipid =3D 0x7050001;
> >         /* NOTE: A730 may also fall in this if-condition with a future =
GMU fw update. */
> > -       if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) =
{
> > +       } else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno=
_gpu)) {
> >                 /* A7xx GPUs have obfuscated chip IDs. Use constant maj=
 =3D 7 */
> >                 chipid =3D FIELD_PREP(GENMASK(31, 24), 0x7);
> >
> > @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct d=
evice *dev, u32 *votes,
> >         if (!pri_count)
> >                 return -EINVAL;
> >
> > -       sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > -       if (IS_ERR(sec))
> > -               return PTR_ERR(sec);
> > +       /*
> > +        * Some targets have a separate gfx mxc rail. So try to read th=
at first and then fall back
> > +        * to regular mx rail if it is missing
> > +        */
> > +       sec =3D cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> > +       if (PTR_ERR_OR_ZERO(sec) =3D=3D -EPROBE_DEFER) {
> > +               return -EPROBE_DEFER;
> > +       } else if (IS_ERR(sec)) {
> > +               sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > +               if (IS_ERR(sec))
> > +                       return PTR_ERR(sec);
> > +       }
> >
> >         sec_count >>=3D 1;
> >         if (!sec_count)
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 973872ad0474..97837f7f2a40 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1319,9 +1319,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *g=
pu)
> >                 count =3D ARRAY_SIZE(a660_protect);
> >                 count_max =3D 48;
> >                 BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> > -       } else if (adreno_is_a730(adreno_gpu) ||
> > -                  adreno_is_a740(adreno_gpu) ||
> > -                  adreno_is_a750(adreno_gpu)) {
> > +       } else if (adreno_is_a7xx(adreno_gpu)) {
> >                 regs =3D a730_protect;
> >                 count =3D ARRAY_SIZE(a730_protect);
> >                 count_max =3D 48;
> > @@ -1891,7 +1889,7 @@ static int hw_init(struct msm_gpu *gpu)
> >         gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
> >
> >         /* Set weights for bicubic filtering */
> > -       if (adreno_is_a650_family(adreno_gpu)) {
> > +       if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_=
gpu)) {
> >                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0=
);
> >                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> >                         0x3fe05ff4);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index c3703a51287b..139c7d828749 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -568,6 +568,20 @@ static const struct adreno_info gpulist[] =3D {
> >                 .zapfw =3D "a740_zap.mdt",
> >                 .hwcg =3D a740_hwcg,
> >                 .address_space_size =3D SZ_16G,
> > +       }, {
> > +               .chip_ids =3D ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" =
*/
> > +               .family =3D ADRENO_7XX_GEN2,
> > +               .fw =3D {
> > +                       [ADRENO_FW_SQE] =3D "gen70500_sqe.fw",
> > +                       [ADRENO_FW_GMU] =3D "gen70500_gmu.bin",
> > +               },
> > +               .gmem =3D 3 * SZ_1M,
> > +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                         ADRENO_QUIRK_HAS_HW_APRIV,
> > +               .init =3D a6xx_gpu_init,
> > +               .hwcg =3D a740_hwcg,
> > +               .address_space_size =3D SZ_16G,
>
> I'm kinda thinking we should drop the address_space_size and add
> instead ADRENO_QUIRK_4G or something along those lines, since there
> are devices with 32 or 64G

or alternatively put in a correct address_space_size (I guess 2^^48 or 2^^5=
6 ?)

BR,
-R

> (a690 is incorrect in this way too)
>
> BR,
> -R
>
> >         }, {
> >                 .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520v2" =
*/
> >                 .family =3D ADRENO_7XX_GEN3,
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 77526892eb8c..d9ea8e0f6ad5 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -448,6 +448,11 @@ static inline int adreno_is_a750(struct adreno_gpu=
 *gpu)
> >         return gpu->info->chip_ids[0] =3D=3D 0x43051401;
> >  }
> >
> > +static inline int adreno_is_x185(struct adreno_gpu *gpu)
> > +{
> > +       return gpu->info->chip_ids[0] =3D=3D 0x43050c01;
> > +}
> > +
> >  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
> >  {
> >         if (WARN_ON_ONCE(!gpu->info))
> > --
> > 2.45.1
> >

