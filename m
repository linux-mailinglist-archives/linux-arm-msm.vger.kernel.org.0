Return-Path: <linux-arm-msm+bounces-40391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D179E473C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603AA1696FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6814C192D62;
	Wed,  4 Dec 2024 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEitM6ST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB7C192D7E;
	Wed,  4 Dec 2024 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733349050; cv=none; b=hgY4Lw2V8VUXJZRGTqjz/FBvrAN+n5cJIZ8y526OdFtyrOCYB+Z0rRRo99IOGetizRlLXh1OW/F3onm5T6x/ojC1yoBWtoPXhbicxY9o41vd9TrknItOxz6taIGg51cG0rnHeWUyMTYZj+ihlx+DmopcQDBMYyYJMZxVBhtk4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733349050; c=relaxed/simple;
	bh=ktwypj/tr93wyY+IQ1vpsy6kj5knrYzdaxEnllwK1ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AX0+Stt90j60c0Vd/FCxif27R5eLrXeAJJVqqLrBOhhMc8iDj3zuXA1AGnE2wQgRYB6u+4B1EUMv25NgleakW4QFNGCFFd+ASHcdgP1OTc6Ze/4m863SIKotiOqqB9sCsjuJ0pkaYr+RYk5K/GFRJyj9Cn5xR0lg5KWYKVwtvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEitM6ST; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a7def51c9cso673805ab.2;
        Wed, 04 Dec 2024 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733349048; x=1733953848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0hg9lZJZN9avUvJdZ9Zeao5cWyz1cd0v08GATDUcUo=;
        b=ZEitM6STLd2ViiGr5ygn98oT5UWioVtBdNxOdW9/f6kgL44Y8h5IsnixCKS2CMPD6c
         VVsilVyLDkeB1dZ4m+G5vXXZ5JQ1U5JI4B0VPtKanw9Q77PEiPzE6TsM4UIpNenmWKdP
         MGFH95cjR153rxB6+SO8sRJV74nTNqB+FI0ufVvVeJ4s9hJqWp9H2n6WGDl0o8dmaJx6
         d3Ki47Ufi+RuL1W9uni7Fhvz2q4O0vQMQMKVW7qqKRrcddarB5Gq4j6KrcDIT6NY+tR4
         nabflwmdEQ4OvoBmZWrygLGH++CgkYWnrD1w9ymRMDjn0umoxVL+R2sO9toZgkN2xrG4
         maxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733349048; x=1733953848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0hg9lZJZN9avUvJdZ9Zeao5cWyz1cd0v08GATDUcUo=;
        b=SSW1+cATPzG0cpm9WoFyfJesrKQdGBBKKvShrG6zoSG6vKiDywycP+jaa3FwtNvpoF
         h4+MguL7gNh5aYOcu8yNH0lXr4WVeZfgOwbpu6MTWEeppAsuRsqavrXAcVGZWsx9nX7m
         DCRB/u3Q9alzWnAIcmehzlg+9t6+tpMdnEYptN0FRMNaME2f7Xmw8YPB0uXiccKaj1D7
         7hThBs1dU3ynyKji+PNPCBHkV27ymnUKm5bPQSvd+TWvudgbmzEDUcoWsvTTakmeKBXw
         hTU7L7f1yco9swsbTtT1hcYaVC4nlkLgYT0ojgrVi6zkhFZvBFIfqLaQSKtddmDdY5VP
         Q7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/dWj36fm0W6f2W6npTeAlHm+hMsF/Y8VQFrL33RBavW4sfqdIxaGwlB5BIa+si3KVi/+YKEkdPwDsPFN7@vger.kernel.org, AJvYcCX39xG7JfAsPu2UM7a6QXwi8XIZN3z/OrHw/KW14TbAZ9+F7ypJnvthYRDZVH9YwrEvBYwYIEo5uNqb3Dam@vger.kernel.org
X-Gm-Message-State: AOJu0YwlqZwsi/zEr0jiN9bxSLZuvggsf1adQPMEw6qW1Dj96WxdnJ4j
	/6YHSPfszbbVj2AxFpq+caXOZ0KM5m3e6DgoJ5vhUBIsHB075qszKLRIr/9RXvrMHwt9CDysZRr
	StYLGg8HrVBZd3C4p3J617SThiPA=
X-Gm-Gg: ASbGncu0zaHJw2hYZXYSUu2WSKU84kjcMaB0tMjnH5lfXR/2mMYxYqtJOb9i2uIjHR5
	RJyGSSNQ5k6mIzSXz0rZTSGuCAPRBae2y18RSFov+8TRm97MJ2l4yShuMvTI8dfsM4Q==
X-Google-Smtp-Source: AGHT+IEN22zZO17beulhc91zwdhUV4FuS5A/AGEPOGDx/jgh8nXD72t6NrVHshchMWIfdwnMPRMw2pDkgVwvxaSGD24=
X-Received: by 2002:a05:6e02:1c43:b0:3a7:819c:5129 with SMTP id
 e9e14a558f8ab-3a7f9a8d86fmr107044695ab.18.1733349047572; Wed, 04 Dec 2024
 13:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com> <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
 <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com> <CAF6AEGvqPEFN+j0Txa5KPmxF8tXCn_uUsM86i4uo+tc2mTWYgg@mail.gmail.com>
 <f603f71c-64f4-4f29-b8b9-430d758a738b@quicinc.com> <CAF6AEGt-wojTde=OfqSyez3fD1jiyUTP08TWxNQMgkoWhF-MVA@mail.gmail.com>
In-Reply-To: <CAF6AEGt-wojTde=OfqSyez3fD1jiyUTP08TWxNQMgkoWhF-MVA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Dec 2024 13:50:36 -0800
Message-ID: <CAF6AEGuedG4j0no=9GYK=y2HZHVVporDfkpL9y9dg8H5PhZdKg@mail.gmail.com>
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

On Wed, Dec 4, 2024 at 1:47=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> On Wed, Dec 4, 2024 at 11:04=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >
> > On 12/1/2024 10:06 PM, Rob Clark wrote:
> > > On Sat, Nov 30, 2024 at 12:30=E2=80=AFPM Akhil P Oommen
> > > <quic_akhilpo@quicinc.com> wrote:
> > >>
> > >> On 11/30/2024 7:01 PM, Konrad Dybcio wrote:
> > >>> On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
> > >>>> There are a few chipsets which don't have system cache a.k.a LLC.
> > >>>> Currently, the assumption in the driver is that the system cache
> > >>>> availability correlates with the presence of GMU or RPMH, which
> > >>>> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> > >>>> with a full blown GMU, but doesnot have a system cache. So,
> > >>>> introduce an Adreno Quirk flag to check support for system cache
> > >>>> instead of using gmu_wrapper flag.
> > >>>>
> > >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > >>>> ---
> > >>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
> > >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
> > >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
> > >>>>  3 files changed, 4 insertions(+), 7 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/g=
pu/drm/msm/adreno/a6xx_catalog.c
> > >>>> index 0c560e84ad5a..5e389f6b8b8a 100644
> > >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > >>>> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] =
=3D {
> > >>>>              },
> > >>>>              .gmem =3D (SZ_128K + SZ_4K),
> > >>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > >>>> +            .quirks =3D ADRENO_QUIRK_NO_SYSCACHE,
> > >>>>              .init =3D a6xx_gpu_init,
> > >>>>              .zapfw =3D "a610_zap.mdt",
> > >>>>              .a6xx =3D &(const struct a6xx_info) {
> > >>>> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] =
=3D {
> > >>>>              },
> > >>>>              .gmem =3D SZ_128K,
> > >>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > >>>> -            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > >>>> +            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_=
NO_SYSCACHE,
> > >>>>              .init =3D a6xx_gpu_init,
> > >>>>              .zapfw =3D "a702_zap.mbn",
> > >>>>              .a6xx =3D &(const struct a6xx_info) {
> > >>>
> > >>> +a619_holi
> > >>>
> > >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/d=
rm/msm/adreno/a6xx_gpu.c
> > >>>> index 019610341df1..a8b928d0f320 100644
> > >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_g=
pu *a6xx_gpu)
> > >>>>
> > >>>>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
> > >>>>  {
> > >>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> > >>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> > >>>> -            return;
> > >>>> -
> > >>>>      llcc_slice_putd(a6xx_gpu->llc_slice);
> > >>>>      llcc_slice_putd(a6xx_gpu->htw_llc_slice);
> > >>>>  }
> > >>>> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct plat=
form_device *pdev,
> > >>>>  {
> > >>>>      struct device_node *phandle;
> > >>>>
> > >>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> > >>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> > >>>> +    if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
> > >>>>              return;
> > >>>
> > >>> I think A612 is the "quirky" one here.. it has some sort of a GMU,
> > >>> but we're choosing not to implement it. maybe a check for
> > >>>
> > >>> if (adreno_has_gmu_wrapper && !adreno_is_a612)
> > >>>
> > >>> would be clearer here, with a comment that RGMU support is not
> > >>> implemented
> > >>>
> > >>>
> > >>>
> > >>> But going further, I'm a bit concerned about dt-bindings.. If we
> > >>> implement RGMU on the driver side in the future, that will require
> > >>> DT changes which will make the currently proposed description inval=
id.
> > >>>
> > >>> I think a better angle would be to add a adreno_has_rgmu() func wit=
h
> > >>> a qcom,adreno-rgmu compatible and plumb it correctly from the get-g=
o.
> > >>>
> > >>> This way, we can avoid this syscache quirk as well.
> > >>>
> > >>
> > >> I am aware of at least Adreno 710 which doesn't have syscache, but h=
as
> > >> proper GMU. And I don't see any reason why there couldn't be another=
 one
> > >> in future to save silicon area. So, a quirk flag doesn't seem so bad=
 in
> > >> this case.
> > >>
> > >> The correct way to avoid this quirk flag is by making LLCC driver re=
turn
> > >> a proper error to detect the absence of syscache. Currently, it just
> > >> returns EPROBE_DEFER which put driver in an infinite probe loop.
> > >
> > > Hmm, this seems solvable?  llcc has a node in the dt, so it seems lik=
e
> > > it should be able to tell the difference between not existing and not
> > > being probed yet.  Something maybe like, initialize drv_data to NULL
> > > instead of -EPROBE_DEFER, and then in the various entry points, if
> > > (!drv_data) return not_probed_helper(); which would check if a
> > > compatible node exists in dt?
> >
> > Sounds like that would work. Can we explore that separately?
> >
> > I am a bit worried about adding another subsystem's patch to this
> > series. That might delay this series by weeks.
>
> I don't think there is a dependency between the two, so it shouldn't
> delay anything.  We can just merge the first patch in this series as
> it is and drop the second.  And the llcc change is a legit bug fix,
> IMO, -EPROBE_DEFER is the incorrect return value when the device is
> not present.

Actually, that wasn't _quite_ correct, but the idea still stands.
Re-send second patch, but without the ADRENO_QUIRK_NO_SYSCACHE parts,
and drop the first.

In parallel send the llcc fix.  There is no compile time dependency,
so they can go thru different trees.

BR,
-R

>
> BR,
> -R
>
> > -Akhil
> >
> > >
> > > BR,
> > > -R
> > >
> > >> Agree about the dt binding suggestion. I will define a new compatibl=
e
> > >> string for rgmu.
> > >>
> > >> -Akhil.
> > >>
> > >>> Konrad
> > >>
> >

