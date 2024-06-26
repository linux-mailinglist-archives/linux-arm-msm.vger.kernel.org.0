Return-Path: <linux-arm-msm+bounces-24345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF6918EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 20:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9843B218C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 18:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A9D190686;
	Wed, 26 Jun 2024 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E66Tv1YA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FBF191489;
	Wed, 26 Jun 2024 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719427405; cv=none; b=FcxBBRIkzw2VpE+hWJr0la3kUYisE+FJAJ8WmBP4FPnXd9wTWJEJ0EQ8Mja3nTCnaWtn2xRY1yuudbQRdtv7qOQaqP5V+OPcbfI6zDywY4Y1aOM6YQTluGSyF8TbIcP5oAVERJP3bBjZpizFg0jJEjQaic0iEdSHiAm1mdFEhk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719427405; c=relaxed/simple;
	bh=mQwfjOrhtJU+cajvDUiYYzdDrcdUX1KZt31bWlAPiJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XelqZcaMwcyqpRyebE3sMJzE9MhEevz/YqKNh7TOwTWajM0TvQUj9Xw8Y8NF3Har5rr62eQJhLip14NsilN1byUChfxzOZz+NLHwCu57/6ZSmpHvf/tpyb5Ebi9l+FjJNKe3+EyWowTHCm7rOs+3Hd4iMN/qjJFC+ngIsdpwnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E66Tv1YA; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e72224c395so81889911fa.3;
        Wed, 26 Jun 2024 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719427402; x=1720032202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UR9Qp1fTrxNM5LeM1DAR7Mfemmm10TsjmtqQdGlQAqQ=;
        b=E66Tv1YA6NA+/y6mB2SaCyP5qgGeKBh0kdBcMUIlZT8xfRADyO2sMpItqnq19FPepo
         k0tdfIH9FoR51ee/2omFAaSG+D7eBtO+380PyJu+va6lMWdnZpFgvyny9o4edhGqyw6Q
         wT7s1OJhrhLr9MFm7OpliLMjtCM/qEY5pvBpLHmR0nJoOIjrYSZpDOVHkLubrvohE1Wn
         R8OHiXshvDjBJFPdvLLUTTuJvNruEeTd598V5g9zRtsoJ2ZFV4pepI3xjBbtt/WpjGtf
         M1pcgKF895YnX3m7dztB9VSCW2y3XqpyTVLH9pGPVScAdiDPP7SxhgXOGc25KmqKEE94
         sNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719427402; x=1720032202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR9Qp1fTrxNM5LeM1DAR7Mfemmm10TsjmtqQdGlQAqQ=;
        b=A4VTkNKGvJdd+p+tWGZqz7G4OQ81Pp3wnprLaJv3TJ2GcRH2WqRingvSEJdtdMDwSb
         bBsPktB0QtOV0INodgJ3r2zGs9JokFPqt349pD6TDqrSmJWpihxrImsjZPdkI1CZV4mi
         Gbv6fStZ0+HSWIIYQpjy9n4o0OKHgJNHva/ZKp14FZ7T1mCbpScGfg6yzgiTfVxVEU5R
         xKgHglgalY+suN03gg4wU2k3HG2FLI65bRrAEJOoFRF4LFVKVvhHFDnk8WY9yR4aFsN4
         ZmoU2gos8Lmp5shCmXB6gmY2LOw+qkwZiBjU4ffC0ssHpxxgDiOSbVDEIGdtdGaqOAqa
         +JbA==
X-Forwarded-Encrypted: i=1; AJvYcCVToGDrP/4ZLQ1mORhYbNtHQIX++Bj3eNO5fJ74Wo8hNQtj3N7BppE/HjMlZL3MY/eTBuILdlQXLJ4TrQznxqag0DzVQoFR6ZQHIBpjxkvuGSevFm+OOD0G6YmdY9iUd8e2cIZCRt+uRpEyAA==
X-Gm-Message-State: AOJu0Ywpi8+ZXAEcC7QE/jA/R9RVB5DTyCKZl1qZcyeNyBdkIVZ+PUgM
	AItQxVc/EGP/upgnaJYcSTJWcjQ392sIHdh97m873OFSgzJ230Oaqlf+4ibDQQMbqy3/8j18p6K
	vtvfgiU9PdMP3Xouc52e5Ov+kQyc=
X-Google-Smtp-Source: AGHT+IHcVoQPlUh58ZF730tguw7awKEfLSWtoXlp6zbrPUNXFzV92ij1Ty9lCtgGGz5ceWeK1xuzEN4UQOUqo7+eyi4=
X-Received: by 2002:a2e:8242:0:b0:2ec:50ed:b59f with SMTP id
 38308e7fff4ca-2ec5b2dd950mr64610811fa.34.1719427401351; Wed, 26 Jun 2024
 11:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com> <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2024 11:43:08 -0700
Message-ID: <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno <freedreno@lists.freedesktop.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 1:24=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
> >
> >
> > On 6/23/24 13:06, Akhil P Oommen wrote:
> > > Add support in drm/msm driver for the Adreno X185 gpu found in
> > > Snapdragon X1 Elite chipset.
> > >
> > > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > ---
> > >
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
> > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> > >   4 files changed, 36 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gmu.c
> > > index 0e3dfd4c2bc8..168a4bddfaf2 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gm=
u, unsigned int state)
> > >      */
> > >     gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> > > +   if (adreno_is_x185(adreno_gpu)) {
> > > +           chipid =3D 0x7050001;
> >
> > What's wrong with using the logic below?
>
> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
> changes in the chipid scheme within the a7x family, this is a bit
> confusing. I will try to improve here in another series.

I'm thinking we should just add gmu_chipid to struct a6xx_info, tbh

Maybe to start with, we can fall back to the existing logic if
a6xx_info::gmu_chipid is zero so we don't have to add it for _every_
a6xx/a7xx

BR,
-R

> >
> > >     /* NOTE: A730 may also fall in this if-condition with a future GM=
U fw update. */
> > > -   if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> > > +   } else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_g=
pu)) {
> > >             /* A7xx GPUs have obfuscated chip IDs. Use constant maj =
=3D 7 */
> > >             chipid =3D FIELD_PREP(GENMASK(31, 24), 0x7);
> > > @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct=
 device *dev, u32 *votes,
> > >     if (!pri_count)
> > >             return -EINVAL;
> > > -   sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > -   if (IS_ERR(sec))
> > > -           return PTR_ERR(sec);
> > > +   /*
> > > +    * Some targets have a separate gfx mxc rail. So try to read that=
 first and then fall back
> > > +    * to regular mx rail if it is missing
> > > +    */
> > > +   sec =3D cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> > > +   if (PTR_ERR_OR_ZERO(sec) =3D=3D -EPROBE_DEFER) {
> > > +           return -EPROBE_DEFER;
> > > +   } else if (IS_ERR(sec)) {
> > > +           sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > +           if (IS_ERR(sec))
> > > +                   return PTR_ERR(sec);
> > > +   }
> >
> > I assume GMXC would always be used if present, although please use the
> > approach Dmitry suggested
>
> Correct.
>
> -Akhil
> >
> >
> > The rest looks good!
> >
> > Konrad

