Return-Path: <linux-arm-msm+bounces-24730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ABD91CD2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF541C2158C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D444680026;
	Sat, 29 Jun 2024 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kP92CHjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F743BB48;
	Sat, 29 Jun 2024 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719667941; cv=none; b=JwOZMrunv3XldcMNXRMljCbQ+eARnI4O65ToiP/2WC2IXc6Iz/fBLogxJLoR8qxXKcj9T3w25hxnOsQu4PO5ZDZZip2VMEtsbQxm9GCKlN6OxPSOFS9elDLd4VVUVtNc0+3vIIOXgdccn0P4d2IH9QW8YmQlT4xnO221nsw2fmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719667941; c=relaxed/simple;
	bh=UT0/VIb4UwrYNdYJ/l7BBaSMJPvRv51xbLFYY6RXwig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTLrZcZGqYySefSuzxXUbuNz5XucAERO2BBQSRrIRaGU1UjNHo3LRWR+YhuFMBcl2hDxAR/bq+nFj9gAENFhch22NcR7D8QIgOWmR4DOgoqrO4f8wNPNQjPcd6JFAcX4jclYBqgZWGHamtkkELQnjusEFo7MJiNfuWXShDWfPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kP92CHjP; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d1d45ba34so1908904a12.3;
        Sat, 29 Jun 2024 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719667938; x=1720272738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZgrWGkd1meoHWo3+J42luLI3PD/AXRaWnAoTRiKZiA=;
        b=kP92CHjPqLkmNEm4yy2hQBCtgxitrrgLdXayDuU35vYa2YVnr1Ja2Uk8rSjW8Zy3JZ
         sPtXKq6S+O8bIDMte3Ikrx4e3X5/0NtYlhPuCreguFKVqvIanqDGVlyKVzgWzGSq7rrZ
         sT6wjjVFcd5Pig6g6qNcss8NF4CKc8JcDYIQqgXOYXYpe95Yf1yIobP9o5Uh+KC+VRgH
         LXt0OQCsGzqV8MXe3Gj1S03GJ5AnM/uprUBrupqrHzHK7AoH1jKAcHXQNIaNYNIdrkvF
         lsnYc3pecC5wBQN2W/1uOWjvh4OJfBWHqC+CDcJNXEBYSD8+plcnMN8ka/Qx68qRGBhk
         22BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719667938; x=1720272738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZgrWGkd1meoHWo3+J42luLI3PD/AXRaWnAoTRiKZiA=;
        b=hMurD2nHzx61aY82shVbHC7ZcMhBQnd4uQy4CdZuxFKa6j5T3cYha8Weyo0LDeXVyt
         W+IRqxJ/TW4thgz8s/g8PC5rVjlqz5fy7BFr55keMApT3zgddkOQ4IKsPkf/d6KioRuI
         bFdMMl40Y88Vg8o66tXAOjbOosXbhFFfcVhn8+MFY8XF/rlzG08L20WP0jfCTJYTtDEs
         Y2u1hmI9hs8ufvPMLKdiOf/sX4xjl1A53E0FThFY6gPsHoaJP5WCAvJGDXmgBrd2ba6c
         fFLnbrOYmykVSopI54NaUJVY2KTyI3YFTyhCNE7/h4yRbVY/VSyg8t8HLzrJtj6ayKd7
         IddQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/nwjpCXLzlbJzFAh/QlD306VfV7y34Ld3EFbIByhmuCI704IhAA03iarYUOAvKz+64mwS5GjpRi3yUutGzCg6qpRLHXqHZs5hv4XvEVyhflrDi6E5I/RlQ+7gB9ASlevX0xRCzCBD/I6Xdw==
X-Gm-Message-State: AOJu0YzOjhMnCA8WAXyYkkmXgh83T3T6rhhgZlm6bdAx9K46KirGyrOX
	NVqDBmFXMC78jS5T+u3iDl4+UfS7zS6mbTpbZLC92C45vuxYDHebqPbgb/o8TBoOfg8/XOFm95M
	XcC8cW2AnDUS0di9cSPY0D1jJexrfhw==
X-Google-Smtp-Source: AGHT+IFvFuLSfoqQo8otUXQUXzOPg8zdgXZW8DX2SjfJm3mHt6zQq6wbuQpB8S2qspBnkctoW6DN/nj6zMo3ATVh4Z8=
X-Received: by 2002:a05:6402:1d4e:b0:57c:60f0:98bc with SMTP id
 4fb4d7f45d1cf-5879f59bc5bmr749843a12.11.1719667938126; Sat, 29 Jun 2024
 06:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618164303.66615-1-robdclark@gmail.com> <20240618164303.66615-2-robdclark@gmail.com>
 <20240629015831.sglaflboanhrarmn@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240629015831.sglaflboanhrarmn@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 29 Jun 2024 06:32:05 -0700
Message-ID: <CAF6AEGtHyGZhBaqNXtujNMg7Cv_cLkUQoCiAckKAWUihzO1i4Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Split up giant device table
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 6:58=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Jun 18, 2024 at 09:42:47AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Split into a separate table per generation, in preparation to move each
> > gen's device table to it's own file.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
> >  2 files changed, 63 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index c3703a51287b..a57659eaddc2 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -20,7 +20,7 @@ bool allow_vram_carveout =3D false;
> >  MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in p=
lace of IOMMU");
> >  module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 060=
0);
> >
> > -static const struct adreno_info gpulist[] =3D {
> > +static const struct adreno_info a2xx_gpus[] =3D {
> >       {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x02000000),
> >               .family =3D ADRENO_2XX_GEN1,
> > @@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .gmem  =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a2xx_gpu_init,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a2xx);
> > +
> > +static const struct adreno_info a3xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x03000512),
> >               .family =3D ADRENO_3XX,
> >               .fw =3D {
> > @@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .gmem  =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a3xx);
> > +
> > +static const struct adreno_info a4xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x04000500),
> >               .family =3D ADRENO_4XX,
> >               .revn  =3D 405,
> > @@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .gmem  =3D (SZ_1M + SZ_512K),
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a4xx_gpu_init,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a4xx);
> > +
> > +static const struct adreno_info a5xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x05000600),
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 506,
> > @@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .quirks =3D ADRENO_QUIRK_LMLOADKILL_DISABLE,
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a540_zap.mdt",
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a5xx);
> > +
> > +static const struct adreno_info a6xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x06010000),
> >               .family =3D ADRENO_6XX_GEN1,
> >               .revn =3D 610,
> > @@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .zapfw =3D "a690_zap.mdt",
> >               .hwcg =3D a690_hwcg,
> >               .address_space_size =3D SZ_16G,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a6xx);
> > +
> > +static const struct adreno_info a7xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> >               .family =3D ADRENO_6XX_GEN1, /* NOT a mistake! */
> >               .fw =3D {
> > @@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "gen70900_zap.mbn",
> >               .address_space_size =3D SZ_16G,
> > -     },
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a7xx);
> > +
> > +static const struct adreno_gpulist *gpulists[] =3D {
> > +     &a2xx_gpulist,
> > +     &a3xx_gpulist,
> > +     &a4xx_gpulist,
> > +     &a5xx_gpulist,
> > +     &a6xx_gpulist,
> > +     &a6xx_gpulist,
>
> Typo. a6xx_gpulist -> a7xx_gpulist.

yup, already have a patch fixing that in msm-next-robclark

BR,
-R

> -Akhil
>
> >  };
> >
> >  MODULE_FIRMWARE("qcom/a300_pm4.fw");
> > @@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> >  static const struct adreno_info *adreno_info(uint32_t chip_id)
> >  {
> >       /* identify gpu: */
> > -     for (int i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> > -             const struct adreno_info *info =3D &gpulist[i];
> > -             if (info->machine && !of_machine_is_compatible(info->mach=
ine))
> > -                     continue;
> > -             for (int j =3D 0; info->chip_ids[j]; j++)
> > -                     if (info->chip_ids[j] =3D=3D chip_id)
> > -                             return info;
> > +     for (int i =3D 0; i < ARRAY_SIZE(gpulists); i++) {
> > +             for (int j =3D 0; j < gpulists[i]->gpus_count; j++) {
> > +                     const struct adreno_info *info =3D &gpulists[i]->=
gpus[j];
> > +
> > +                     if (info->machine && !of_machine_is_compatible(in=
fo->machine))
> > +                             continue;
> > +
> > +                     for (int k =3D 0; info->chip_ids[k]; k++)
> > +                             if (info->chip_ids[k] =3D=3D chip_id)
> > +                                     return info;
> > +             }
> >       }
> >
> >       return NULL;
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 77526892eb8c..17aba8c58f3d 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -114,6 +114,16 @@ struct adreno_info {
> >
> >  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> >
> > +struct adreno_gpulist {
> > +     const struct adreno_info *gpus;
> > +     unsigned gpus_count;
> > +};
> > +
> > +#define DECLARE_ADRENO_GPULIST(name)                  \
> > +const struct adreno_gpulist name ## _gpulist =3D {      \
> > +     name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
> > +}
> > +
> >  /*
> >   * Helper to build a speedbin table, ie. the table:
> >   *      fuse | speedbin
> > --
> > 2.45.2
> >

