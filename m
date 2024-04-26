Return-Path: <linux-arm-msm+bounces-18672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3E8B3878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 15:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ADD21F22645
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 13:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66C01474BD;
	Fri, 26 Apr 2024 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6xoM40a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED6613D2B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138313; cv=none; b=konPZtFZRWAotKqkFWY+IWnYruDQXbQvxdYDUA4jZTv4iRg+E42wjov122uYnuY8hSS9fsaOtXE+qziAKgncs7i0nitC86tSFbsSuK3++KhBrYaXZYTjccbd4gWrnJoS7Xeah1ysWi64SQbLdvMxc7onavUxdG2Q/GIegmNYQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138313; c=relaxed/simple;
	bh=hJxsJzG4jLFHJ3HH6mdHYHiJm7Av3R+iLPjmZSa1w5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUj6JNjZRqiIcwMUbI1ZO1t3H++9WR88+Qu0/vm/99WxAaDL2oHTA9Oge/+Gp743/ByP/fjzmxRjrprLbqsk0IrvmqoQiG0fO+8yAjjexpnSif4xxKaPCir1K+pu9B7n5FK5Eha2JiAjdzq00WdBrLs1W40rzbgkjDPjaC9di5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6xoM40a; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-de55708c616so2367638276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138311; x=1714743111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9qAe36Cj6tNkkF7VwFJ0JlfB/3eMv2UT/DeO4zC6Bo=;
        b=s6xoM40aqzZXVLW7ndc4jnMS1xv1elHMhp2XCLPU8w9j/XtWKfg5lp0rO6wKQcrmeK
         i2MYMMiZeRVCajIwylWszOZ6E8rwmqe1DkzVWSJ/7SsJehlqsX5r9Xj0yllPnrweaxGr
         VI5tpRKZdhFy3IcaAS5M+xwimp7zfTSVW0wrVuTysfUtcJcqecwxeexonS4jSqrqJXvB
         arhv3XYES/A1tt9l/qFi5ZiUV3VLTjX090MTxKuYaTgqioL4x4F19g6x5Ur3hprNg6jm
         7U7VMZOJLk8/37GeoLPKrPBgnwT/AWNZAY346b7kGQeC7Sy/7uVnJD47hXHLxksEB0AZ
         X1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138311; x=1714743111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9qAe36Cj6tNkkF7VwFJ0JlfB/3eMv2UT/DeO4zC6Bo=;
        b=EjXvODVP2Pr4dZx5nTVzmNNt5wOSmCE6xrQob+dKGI92X+1ei5g4/Qpug4rCogNe+f
         PQRTjGx8NdpzNHcrHqEKVIWlprprDJQXWzPJ2EzORc6Pf6/NOKUIjNvwD0knLLeHyQrD
         HXS+Z87h70uduljrrFNej/++DJXTjGkUdfo+x4ys2l601L4GCKHX8KBexvKpmju4BlOt
         fOva/7dG9Pyg2/TSXsmUeSjzpyEu/lf0yKanTPiPRruF/vhf+DZe3VBrYN9q9GIQOUY+
         8tC/D5240giAh0rDI8GqXchvqBPkUKeI0uOQVJ+85VKTF5+c8LvN1CvBdlVeR15Y2Ucb
         kIuA==
X-Forwarded-Encrypted: i=1; AJvYcCXXr+pJQr4QhthaS9CNdozvLMxO49u0ED+WwDP3SVNRLRFWvq6SWal1GgOqzfz3IlsbwpBCn7760FfUWUNKFKwNd94/XV20IfjaZ8cqHw==
X-Gm-Message-State: AOJu0YzhdcXObX2qbOhhD3pgISroEHyULv5y4GSrVLo989MoOHFju7D3
	upe5KZI1rzySlWxuSJvyEKbLi7DTNkr/7YULUnXT+Q2/B7DUHIdQrrt45+ZaQdenC81gVdBQ1Yw
	d0INlxsptsvg1shT3nMjotVVqWv5EAB8AnM79XA==
X-Google-Smtp-Source: AGHT+IGRS1b6FBVwW8+cIPrgKO3C49UgnZkg1LJV4sNTUOD5x7UhBEmPEP1Nu3drSgYTsXYlnueFid/FlHxHIowg1K0=
X-Received: by 2002:a25:acdc:0:b0:de4:613c:a63 with SMTP id
 x28-20020a25acdc000000b00de4613c0a63mr2792665ybd.53.1714138310698; Fri, 26
 Apr 2024 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com> <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
In-Reply-To: <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 16:31:39 +0300
Message-ID: <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote=
:
> > >
> > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method =
to
> > > initialize cx_mem. Copy this from downstream (minus BCL which we
> > > currently don't support). On a750, this includes a new "fuse" registe=
r
> > > which can be used by qcom_scm to fuse off certain features like
> > > raytracing in software. The fuse is default off, and is initialized b=
y
> > > calling the method. Afterwards we have to read it to find out which
> > > features were enabled.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index cf0b1de1c071..fb2722574ae5 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -10,6 +10,7 @@
> > >
> > >  #include <linux/bitfield.h>
> > >  #include <linux/devfreq.h>
> > > +#include <linux/firmware/qcom/qcom_scm.h>
> > >  #include <linux/pm_domain.h>
> > >  #include <linux/soc/qcom/llcc-qcom.h>
> > >
> > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu =
*gpu)
> > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > >
> > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_g=
pu *gpu)
> > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > >  }
> > >
> > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > +{
> > > +       u32 status;
> > > +
> > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > +
> > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation statu=
s=3D%8.8x\n", status);
> > > +
> > > +       /* Ignore FASTBLEND violations, because the HW will silently =
fall back
> > > +        * to legacy blending.
> > > +        */
> > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > +               del_timer(&gpu->hangcheck_timer);
> > > +
> > > +               kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > +       }
> > > +}
> > > +
> > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > >  {
> > >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu=
)
> > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of b=
ounds access\n");
> > >
> > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > +
> > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > >                 msm_gpu_retire(gpu);
> > >
> > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platfo=
rm_device *pdev,
> > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > >  }
> > >
> > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > +{
> > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > +       u32 fuse_val;
> > > +       int ret;
> > > +
> > > +       if (adreno_is_a740(adreno_gpu)) {
> > > +               /* Raytracing is always enabled on a740 */
> > > +               adreno_gpu->has_ray_tracing =3D true;
> > > +       }
> > > +
> > > +       if (!qcom_scm_is_available()) {
> > > +               /* Assume that if qcom scm isn't available, that what=
ever
> > > +                * replacement allows writing the fuse register ourse=
lves.
> > > +                * Users of alternative firmware need to make sure th=
is
> > > +                * register is writeable or indicate that it's not so=
mehow.
> > > +                * Print a warning because if you mess this up you're=
 about to
> > > +                * crash horribly.
> > > +                */
> > > +               if (adreno_is_a750(adreno_gpu)) {
> > > +                       dev_warn_once(gpu->dev->dev,
> > > +                               "SCM is not available, poking fuse re=
gister\n");
> > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_=
FUSE_VALUE,
> > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING=
 |
> > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND =
|
> > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > +               }
> > > +
> > > +               return 0;
> > > +       }
> > > +
> > > +       if (adreno_is_a750(adreno_gpu))
> >
> > Most of the function is under the if (adreno_is_a750) conditions. Can
> > we invert the logic and add a single block of if(adreno_is_a750) and
> > then place all the code underneath?
>
> You mean to duplicate the qcom_scm_is_available check and qcom_scm_
>
> >
> > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > +
> > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /* On a750 raytracing may be disabled by the firmware, find o=
ut whether
> > > +        * that's the case. The scm call above sets the fuse register=
.
> > > +        */
> > > +       if (adreno_is_a750(adreno_gpu)) {
> > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC=
_SW_FUSE_VALUE);
> >
> > This register isn't accessible with the current sm8650.dtsi. Since DT
> > and driver are going through different trees, please add safety guards
> > here, so that the driver doesn't crash if used with older dtsi
>
> I don't see how this is an issue. msm-next is currently based on 6.9,
> which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches 1 and
> 2 will have to go through the linux-arm-msm tree, which will have to
> be merged into msm-next before this patch lands there, so there will
> never be any breakage.

linux-arm-msm isn't going to be merged into msm-next. If we do not ask
for ack for the fix to go through msm-next, they will get these
patches in parallel.

Another option is to get dtsi fix into 6.9 and delay the raytracing
until 6.10-rc which doesn't make a lot of sense from my POV).

>
> > (not to mention that dts is considered to be an ABI and newer kernels
> > are supposed not to break with older DT files).
>
> That policy only applies to released kernels, so that's irrelevant here.

It applies to all kernels, the reason being pretty simple: git-bisect
should not be broken.

--=20
With best wishes
Dmitry

