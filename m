Return-Path: <linux-arm-msm+bounces-57978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754FAB7650
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 22:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCCC01889D1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA550293B60;
	Wed, 14 May 2025 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3Uc4D6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206CD293746;
	Wed, 14 May 2025 20:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252990; cv=none; b=AWobeO42DVfg8jTySyf4T0T04aNTRubAqmBMQ6Cz7g9MbzQTIeO3G2f59RnvoypoJFSC3wplef0oMLUFF9oY4wTmYLapJVwP71kaQKQWLjblDyD385SLy3Sm3XP13BcWgXheqBgDLa8fOz0E+MbFz6LKxKH401yjcVlu7lC1P58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252990; c=relaxed/simple;
	bh=U5afnGUYKfixuB98O3oWVka1oYarANvD9C06BJ//Qss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcaQGhelrdnxECl0YdCgEQLRjQ3yxCR8pHupcIsyoM1oqVFhv9dUc1kD1lx8Ag078HAQp7xA5IXpAW4dRaYTk7dFKCL74doG+9lniRpZDhlslXzFawX+POCbMQzs8dy712wZCsmnQdJShcmregxT+oeP9+yuGMJ87XudmD0zKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3Uc4D6I; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so960885ab.3;
        Wed, 14 May 2025 13:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747252988; x=1747857788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1E2sT5R2SmFJKKgIXZwDEjvPjG1MOjyIT8KeOeX6Ys=;
        b=S3Uc4D6ID9apSY/JhHWDO2lVpu1z+LwDG1g+my/2MzgmPXksAana1ACh3Hkr+iTlvE
         JsBjkI9M5KCcpswZ/MrtEBVB+yStjtQveB37sqtMkFMvCWLouN0sDXhM/wSTNX6+6XB7
         2H2lXQ1cAe++8xswmeA5+0rvOMqdJ5WcwxtwNLEFkxpky+NnsL6mxPKx+Me5MjsxwFH8
         Y3Yz+v7PlmyfcEOgJNSsc4mrCfOaaBN56qqFzDTBIPoODjxCQunai4TAtEd5/j2a7c2P
         3r6HdoJwgwPxcbfh5Gl85vYR2xE+wqjybva1HoouP/DK6rk/7GkSDm/aAQ1giRKuq6FK
         k7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252988; x=1747857788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1E2sT5R2SmFJKKgIXZwDEjvPjG1MOjyIT8KeOeX6Ys=;
        b=GCls/ipfpGMNeJ5lC7bAbL9KXrPYLTRm2wfMdWL8HwjouPMAgEyOD3pANN9Xdsa17C
         Q4H3gipQHXMJ6L8YMy7NChNLrSYYIhZidzZjjoj/KvWnmQP/av19kBw8CIlct9rJLAyh
         cq5zQz+2QhI1bW7vipXxBjdjEvjTUbj1RJpcKBIRo+/xvYtECnQxbP1qnYuCR58SpCod
         MeecZShPQorJbgZ2cr3uDU5rbY5P6qZR4tvhG38VsB42/MqqdVZCrISvAp852SGa1K84
         BVMe3uGtEBTAuRkGsUVKW+7PFo6EXYWy0wKiT+64t4FenngK3XnTAisAVDvHaBWNLJQp
         f9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXIHrYh7Yw7zqXVDEb9kO5FoFnrtXyND8Wlc/QV71FYuAD6u+YV1z6oOkx/9yJGyW7XO9u2yPWU+QW+Rbmu@vger.kernel.org, AJvYcCXKtqKcndo/57ClX4t+lOZm8UwZ84zK0uv3t8UmSDHWCAbPR68FX8APGaCbUy/eomf4OqX1WGtNwBBQAOYd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ZrIKvRsx0zd6T+jJP2p5yJXZpAVIhwfhLYs71wXPAsHzXZIV
	ICV1QDj8CVPtsGl5etarV6zhZ9z11vP0vXbyTqdnhvp0vCgFmU4DkBXOmg0upS+f21a7D4tFbed
	YkHRD0GjbcrdhZE01UDPwVu3pau+U2A==
X-Gm-Gg: ASbGncuyihLOfUuahiUD3igvgdZSYK9NPaupLIwGQG+ivtc4k8z4ShUDhpvL4C8sHAJ
	oqsUB42PhZAivxFBJtwohzxEFIR5GBzJhmYxXrV2tznxDG/UWyvm0BJNIj2lZLo+q0Z9Ws5JveS
	ZrjXA1IjOZG5dqbkZ4BKAJuRavqKFPix43ttfLKbzBXLGN7b1y/y84CFT/SqIr5w==
X-Google-Smtp-Source: AGHT+IF1g7w//ZlnlwapkYnOdaFxYkXwOpQfaU8H1YRFOI08stCn05hzEkMX+xpM9tacO9lTlvp9BUPHgpCDRjYnKhU=
X-Received: by 2002:a05:6e02:1909:b0:3d4:3fbf:967d with SMTP id
 e9e14a558f8ab-3db6f79feefmr55448475ab.7.1747252988035; Wed, 14 May 2025
 13:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com> <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
In-Reply-To: <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 May 2025 13:02:56 -0700
X-Gm-Features: AX0GCFvdoWfmNFmJ9co0T0z7-_QRhBMytxeVDMg9fsi5B81FFmjxiQU2kryYTjI
Message-ID: <CAF6AEGu45fsHVxDa5s0Q2XiaYBBaD14nJq3e0UYr3EpOn+188g@mail.gmail.com>
Subject: Re: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:15=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, May 14, 2025 at 05:10:27PM +0200, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > This bit is set iff the UBWC version is 1.0. That notably does not
> > include QCM2290's "no UBWC".
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd=
49f2889be13c9780d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *=
gpu)
> >        */
> >       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> >       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> > +     bool ubwc_mode =3D qcom_ubwc_get_ubwc_mode(cfg);
>
> I'd really prefer if the function came in this patch rather than being
> added at some earlier point. I understand that you want to simplify
> cross-tree merging, but I think we should also simplify reviewing.

Also, since it is so far just used by display and gpu, we probably
don't need to care about cross tree too much... we could just land via
drm

BR,
-R

> >       bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
> >       u32 hbb_hi =3D hbb >> 2;
> >       u32 hbb_lo =3D hbb & 3;
> > -     u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
> >
> >       gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> >
> > --
> > 2.49.0
> >
>
> --
> With best wishes
> Dmitry

