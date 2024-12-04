Return-Path: <linux-arm-msm+bounces-40390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1F9E4726
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78D5284E67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F30618FDDB;
	Wed,  4 Dec 2024 21:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bctgae+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929ED19BBA;
	Wed,  4 Dec 2024 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348871; cv=none; b=OE2UhDt8nTSvTaCw4m0eujRA64romk6yYpEeD3se7l2l8xfOTyBOQ9xUYKr4gjJJXgRXgMR9nTrd5PMkm7HoYai9CqpVN1H7IJ/jMNz67Heu50eU3phc9h4H+Fc4ErqrayHCwm/3nJ33J/UfaPOra7Gm/w0OhspUcgpEiODkQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348871; c=relaxed/simple;
	bh=NAPaQLLw3n6isfvXnNYqz9XhcTLA+zHOJ8U2ZEJFbIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kX4gQbkOYNK3WsdyBabWjGCdiUFVsvlDOVUhQLfug3u90CiT1H5RjDfQOQ6QkFC0hxAHrRFwVSE20BJgqqpEr8j4bJ/oAUTbRlu/Hm0NAc+/MhXrHGEG6hnIO59mD0+DbQ8MKmlyIkKJBKw3WyEppwQ49z3Qdjp1iQVvHnI6d2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bctgae+s; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-84386a6669bso8217239f.3;
        Wed, 04 Dec 2024 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348868; x=1733953668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkUWpt632yNwjVGL7Px9OoDHkkL3C4ca4wA/IGFSQ2g=;
        b=Bctgae+spGYTZjL30/xulOUOI0az9JbGYhD1+E7c9ZjkgY8PX50lTx/d5OvJ7SMK+M
         dnQpJYlEws/9LnjwvGVnrnejr6gm6RtCWT942iUYRU2ej2oqALcTpW388nGQTGjIz9pX
         Dr10LNVIoh+OupOn5km4niEBaoed89EAZdc52e95jdEEfPzpGvhzAOo3V76xH5W+T5s+
         gpKLP8IGtXTu/jcRwIT7WnMrzv2FNjN7F6Iya8+8v5SkueGFHz0AtlTKalLwcpHOFfnY
         pa0f7ptISjQUoMO/AeiAntXLPP37QIQRx6LXzzQNtIF6arXdJRJZrPEilS/rRlRsmmcu
         CHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348868; x=1733953668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkUWpt632yNwjVGL7Px9OoDHkkL3C4ca4wA/IGFSQ2g=;
        b=HdbU0M9iZEgO1wYsSbfXQ/t/RGU3z8QXCb02HUW+XjHaZJSwr/JVGTLqav4PT6sXH6
         hLkXq1t9wi8KqXeSyUeIEB5R80G2vCXsRGuqVpj+COTKrwO+D6hhm48RCkfOr0889srW
         IqVBaNEHlpsGzj+TYYA+CLtoYZ8lROw3hNVi7TN+uFwdFmIpzMC0ha73vru3nxC/eXk/
         S+N0DM/JvLUwz1g3KjaNyTfIoeUeNqXQPmZ9wLHetJZuY+JgQYbiG9nntNdlSS2xJeTm
         elSYlCGxU7UQehwpvhczxX3NBUH7JqeF+qRAAuligapgipdVoo+kL3oatCyEyT7jgJfw
         HKWg==
X-Forwarded-Encrypted: i=1; AJvYcCU7oNnrocsCgX2kPasyZPDrvtyKpD0uXgb5bn/2l1ermTz4lpWhslRfU5ZwFnxrp6QEJTr+xm4nnfBvxpI5@vger.kernel.org, AJvYcCVOtj9QrlST5eD78wvIzPZ0AOFXhGoPGsx+/RDgjw8euiE4y3pjnmalFUrOlUomshYq4lknILwl9jTnswi4@vger.kernel.org
X-Gm-Message-State: AOJu0YzO32pvynMzV7AG1HSr6Gm0c1uYCGblKgSOk41inPu3Da70YfkI
	qUbo2d2a/k14InxIyr7XjsJztjs0EgklVnwn28Gq0auco1DTKt54P0fO58yWE5tlw8bhnpV9oa4
	ZiyCf6YInCw4Dg0qqasg98+2/j+s=
X-Gm-Gg: ASbGnct4OvvnyIN+5m9Q2uJhQYPN9JkPBZ3nDdScOz/Itoel7MBl0z69GLySLZXG1zN
	arPy1bHrBqMa979tAx1FbwQ74/xdc+kMmsWj5NjCaScA1+zcmIOwnDnYw/EaHFfgKzQ==
X-Google-Smtp-Source: AGHT+IEQ7xEThkcg5PY00J7uHpV2UKEhB5xX4Rm23g6H9R7iyEVJfwjFNZv40WQcyubiRxoi2BHB25XQxHAoYB3sERo=
X-Received: by 2002:a05:6602:13c5:b0:835:4402:e2eb with SMTP id
 ca18e2360f4ac-8445b574378mr878085539f.7.1733348868624; Wed, 04 Dec 2024
 13:47:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com> <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
 <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com> <CAF6AEGvqPEFN+j0Txa5KPmxF8tXCn_uUsM86i4uo+tc2mTWYgg@mail.gmail.com>
 <f603f71c-64f4-4f29-b8b9-430d758a738b@quicinc.com>
In-Reply-To: <f603f71c-64f4-4f29-b8b9-430d758a738b@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Dec 2024 13:47:36 -0800
Message-ID: <CAF6AEGt-wojTde=OfqSyez3fD1jiyUTP08TWxNQMgkoWhF-MVA@mail.gmail.com>
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

On Wed, Dec 4, 2024 at 11:04=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/1/2024 10:06 PM, Rob Clark wrote:
> > On Sat, Nov 30, 2024 at 12:30=E2=80=AFPM Akhil P Oommen
> > <quic_akhilpo@quicinc.com> wrote:
> >>
> >> On 11/30/2024 7:01 PM, Konrad Dybcio wrote:
> >>> On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
> >>>> There are a few chipsets which don't have system cache a.k.a LLC.
> >>>> Currently, the assumption in the driver is that the system cache
> >>>> availability correlates with the presence of GMU or RPMH, which
> >>>> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> >>>> with a full blown GMU, but doesnot have a system cache. So,
> >>>> introduce an Adreno Quirk flag to check support for system cache
> >>>> instead of using gmu_wrapper flag.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
> >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
> >>>>  3 files changed, 4 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu=
/drm/msm/adreno/a6xx_catalog.c
> >>>> index 0c560e84ad5a..5e389f6b8b8a 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] =3D =
{
> >>>>              },
> >>>>              .gmem =3D (SZ_128K + SZ_4K),
> >>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >>>> +            .quirks =3D ADRENO_QUIRK_NO_SYSCACHE,
> >>>>              .init =3D a6xx_gpu_init,
> >>>>              .zapfw =3D "a610_zap.mdt",
> >>>>              .a6xx =3D &(const struct a6xx_info) {
> >>>> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] =
=3D {
> >>>>              },
> >>>>              .gmem =3D SZ_128K,
> >>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >>>> -            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> >>>> +            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO=
_SYSCACHE,
> >>>>              .init =3D a6xx_gpu_init,
> >>>>              .zapfw =3D "a702_zap.mbn",
> >>>>              .a6xx =3D &(const struct a6xx_info) {
> >>>
> >>> +a619_holi
> >>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gpu.c
> >>>> index 019610341df1..a8b928d0f320 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu=
 *a6xx_gpu)
> >>>>
> >>>>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
> >>>>  {
> >>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >>>> -            return;
> >>>> -
> >>>>      llcc_slice_putd(a6xx_gpu->llc_slice);
> >>>>      llcc_slice_putd(a6xx_gpu->htw_llc_slice);
> >>>>  }
> >>>> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platfo=
rm_device *pdev,
> >>>>  {
> >>>>      struct device_node *phandle;
> >>>>
> >>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >>>> +    if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
> >>>>              return;
> >>>
> >>> I think A612 is the "quirky" one here.. it has some sort of a GMU,
> >>> but we're choosing not to implement it. maybe a check for
> >>>
> >>> if (adreno_has_gmu_wrapper && !adreno_is_a612)
> >>>
> >>> would be clearer here, with a comment that RGMU support is not
> >>> implemented
> >>>
> >>>
> >>>
> >>> But going further, I'm a bit concerned about dt-bindings.. If we
> >>> implement RGMU on the driver side in the future, that will require
> >>> DT changes which will make the currently proposed description invalid=
.
> >>>
> >>> I think a better angle would be to add a adreno_has_rgmu() func with
> >>> a qcom,adreno-rgmu compatible and plumb it correctly from the get-go.
> >>>
> >>> This way, we can avoid this syscache quirk as well.
> >>>
> >>
> >> I am aware of at least Adreno 710 which doesn't have syscache, but has
> >> proper GMU. And I don't see any reason why there couldn't be another o=
ne
> >> in future to save silicon area. So, a quirk flag doesn't seem so bad i=
n
> >> this case.
> >>
> >> The correct way to avoid this quirk flag is by making LLCC driver retu=
rn
> >> a proper error to detect the absence of syscache. Currently, it just
> >> returns EPROBE_DEFER which put driver in an infinite probe loop.
> >
> > Hmm, this seems solvable?  llcc has a node in the dt, so it seems like
> > it should be able to tell the difference between not existing and not
> > being probed yet.  Something maybe like, initialize drv_data to NULL
> > instead of -EPROBE_DEFER, and then in the various entry points, if
> > (!drv_data) return not_probed_helper(); which would check if a
> > compatible node exists in dt?
>
> Sounds like that would work. Can we explore that separately?
>
> I am a bit worried about adding another subsystem's patch to this
> series. That might delay this series by weeks.

I don't think there is a dependency between the two, so it shouldn't
delay anything.  We can just merge the first patch in this series as
it is and drop the second.  And the llcc change is a legit bug fix,
IMO, -EPROBE_DEFER is the incorrect return value when the device is
not present.

BR,
-R

> -Akhil
>
> >
> > BR,
> > -R
> >
> >> Agree about the dt binding suggestion. I will define a new compatible
> >> string for rgmu.
> >>
> >> -Akhil.
> >>
> >>> Konrad
> >>
>

