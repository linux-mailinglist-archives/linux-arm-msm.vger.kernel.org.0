Return-Path: <linux-arm-msm+bounces-39767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7CC9DF682
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 17:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02CB8B21109
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 16:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC6E1D14F8;
	Sun,  1 Dec 2024 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qs18ijzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12147AD5A;
	Sun,  1 Dec 2024 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733070997; cv=none; b=ZyrVQ9Gzos32OJ7KoEbVtLPGtwuFxV+b03W0NN15ofM2eGunUi568TyG7qpzfx+Bsr4IEKvXOGasMcq46/zD8v1tCyCP+IpRTOu1dikAXcL46mZjtT4vMsKz5vsX8ej1c4dcIQwxnuvN7BjMglALiLMblT8ubqAdv25fq+M0EAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733070997; c=relaxed/simple;
	bh=Uco+KKE46gpgDDPQ+eoNKFB2QASJWra3Sc8yRNd+H9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHRbNsxogafsKO+s02SNE32heMOSKfchgeTEryBFmcBzbeOwPSS20MfDmyenz2DlpZP67Xd2ebNSn6HylDTsNtqQVpFaH24tGFvx56iEkAAko/xHaU9BplGyA/NOFg+uRgWnR35o1xTTvCFDGFp4fO54tb/uEiFVyYGXN7gXzq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qs18ijzA; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-841acc8151aso123684139f.1;
        Sun, 01 Dec 2024 08:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733070995; x=1733675795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+35eOzfvYajKV3Nm3HQixZpInvCrAeOE/bEVYUk458g=;
        b=Qs18ijzAfPT3Zw38xFpCDLZIZ/9IEZ1EwSTPlBVPEVXNJRZRToHocppqZROF4d4AoT
         9Mmn1t7RU5uq1Ko0AsFo8XLiKW0VZPLNF/4AJPdtvmA/WYTz/sSG5bfaTQpdTtHJRsu6
         oFu8qdMArP0y1GWiZJ4Xwx3x2ToDBSSq594tb/nWlZ1WwV+cd56HOu0/PWyHoUpotcZz
         ZSJs/LEeCz9r2Z7UaVCeC/b/YmWV0outNVaY97crtP4sXkq5AWAIthCPixv6WO7RpREV
         Z5CpTFsALHjSXavaQU7HjQOun4Xyf/1XvnkkDSocDKjfjQN1YK0OxEdC8aVoHU9jS1TI
         NfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733070995; x=1733675795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+35eOzfvYajKV3Nm3HQixZpInvCrAeOE/bEVYUk458g=;
        b=DanpyHzBHK3hNhagNRQ3ScdeIg08qd75jfphhiqt3KZxzqPsGTXGjxUyHosaRdf2UU
         8rZWtgPJMIg19cztM9O99gJp9iNcRpaWHD3OBFOCdVlFsSO0QZPxuX4x1RHwx42uTUjj
         sZYi0GNDYgfn1k81o7h/nh8ru/Mj09UFSwTmLiNHFeE/6Qu3SdommjeXLS4GFQ5/KLtn
         BgkYtOuYWIjA87zhCoyEYsNz6apdAvchcLl5JsTDjxz6u2XzYLBrdl/zfPZrI8nWd15B
         /laeMkulJx8fl9WtmeC+165CLUDbUtjnU39T8QAz94+mgsVRWqRYnBs6NzwNpwEDsed3
         6tqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnGD4YoKRNgCR42jDy+Lju9qwLR3obXuR7+OG/D3ewOZU//0/t7WasUYgpJ9sls8qN+ZAuKWEvRi/tgCzj@vger.kernel.org, AJvYcCWBaxvnyqqpzNA1h2VAzHPS9td7YKkcQIH6SOZWDZzd5jAVgzkBTZh4xEEnGLrdJMpMSyliPer2OvX7IHkY@vger.kernel.org
X-Gm-Message-State: AOJu0YyudTTzvAKGXjg1IEjoOMQm6RI9K6QobN/Sux3iACaetKOyRjCA
	KkwqR+3tCnw4uvwI+tazeHFGhbf8+/ch2TGvwcU+Zalz5pbqdl2Qn/5hk9hooI7DKtW3wCanWwD
	LaPLGS+qEqBNLpAoyHuxb70vUBRU=
X-Gm-Gg: ASbGncujy7qvpLe7yQmzeHguDtP2ohqWzQuTgKY3uHn7S7ruTkDLQpc5C0aGj7mzhKo
	qQzLexNyoGL5EUphmhJtIyvLBoP0bUho=
X-Google-Smtp-Source: AGHT+IGAFxd+VmGnfW2AJOQn/sdbZ1aJbEv+tkoCAMmunmiIAyzosR/XXQh7YEEUfl26fOoBWaBNVr43pumc1fETHe4=
X-Received: by 2002:a05:6602:2d84:b0:834:f2d5:c758 with SMTP id
 ca18e2360f4ac-843ed01ca9amr1900930739f.13.1733070995124; Sun, 01 Dec 2024
 08:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com> <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
 <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com>
In-Reply-To: <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 1 Dec 2024 08:36:23 -0800
Message-ID: <CAF6AEGvqPEFN+j0Txa5KPmxF8tXCn_uUsM86i4uo+tc2mTWYgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 30, 2024 at 12:30=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 11/30/2024 7:01 PM, Konrad Dybcio wrote:
> > On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
> >> There are a few chipsets which don't have system cache a.k.a LLC.
> >> Currently, the assumption in the driver is that the system cache
> >> availability correlates with the presence of GMU or RPMH, which
> >> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> >> with a full blown GMU, but doesnot have a system cache. So,
> >> introduce an Adreno Quirk flag to check support for system cache
> >> instead of using gmu_wrapper flag.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
> >>  3 files changed, 4 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/d=
rm/msm/adreno/a6xx_catalog.c
> >> index 0c560e84ad5a..5e389f6b8b8a 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >>              },
> >>              .gmem =3D (SZ_128K + SZ_4K),
> >>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >> +            .quirks =3D ADRENO_QUIRK_NO_SYSCACHE,
> >>              .init =3D a6xx_gpu_init,
> >>              .zapfw =3D "a610_zap.mdt",
> >>              .a6xx =3D &(const struct a6xx_info) {
> >> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] =3D =
{
> >>              },
> >>              .gmem =3D SZ_128K,
> >>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >> -            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> >> +            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_S=
YSCACHE,
> >>              .init =3D a6xx_gpu_init,
> >>              .zapfw =3D "a702_zap.mbn",
> >>              .a6xx =3D &(const struct a6xx_info) {
> >
> > +a619_holi
> >
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 019610341df1..a8b928d0f320 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *=
a6xx_gpu)
> >>
> >>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
> >>  {
> >> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >> -            return;
> >> -
> >>      llcc_slice_putd(a6xx_gpu->llc_slice);
> >>      llcc_slice_putd(a6xx_gpu->htw_llc_slice);
> >>  }
> >> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform=
_device *pdev,
> >>  {
> >>      struct device_node *phandle;
> >>
> >> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >> +    if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
> >>              return;
> >
> > I think A612 is the "quirky" one here.. it has some sort of a GMU,
> > but we're choosing not to implement it. maybe a check for
> >
> > if (adreno_has_gmu_wrapper && !adreno_is_a612)
> >
> > would be clearer here, with a comment that RGMU support is not
> > implemented
> >
> >
> >
> > But going further, I'm a bit concerned about dt-bindings.. If we
> > implement RGMU on the driver side in the future, that will require
> > DT changes which will make the currently proposed description invalid.
> >
> > I think a better angle would be to add a adreno_has_rgmu() func with
> > a qcom,adreno-rgmu compatible and plumb it correctly from the get-go.
> >
> > This way, we can avoid this syscache quirk as well.
> >
>
> I am aware of at least Adreno 710 which doesn't have syscache, but has
> proper GMU. And I don't see any reason why there couldn't be another one
> in future to save silicon area. So, a quirk flag doesn't seem so bad in
> this case.
>
> The correct way to avoid this quirk flag is by making LLCC driver return
> a proper error to detect the absence of syscache. Currently, it just
> returns EPROBE_DEFER which put driver in an infinite probe loop.

Hmm, this seems solvable?  llcc has a node in the dt, so it seems like
it should be able to tell the difference between not existing and not
being probed yet.  Something maybe like, initialize drv_data to NULL
instead of -EPROBE_DEFER, and then in the various entry points, if
(!drv_data) return not_probed_helper(); which would check if a
compatible node exists in dt?

BR,
-R

> Agree about the dt binding suggestion. I will define a new compatible
> string for rgmu.
>
> -Akhil.
>
> > Konrad
>

