Return-Path: <linux-arm-msm+bounces-18666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD718B378B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 14:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4276F1C21B2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 12:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B5D146A99;
	Fri, 26 Apr 2024 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNEbxKP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8585813E88A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714136071; cv=none; b=LlyK/U1D3KS1DzAYkn6kwQFC1t25qQRSM1wYh96xMcSqsmV8AR/7X05U6fqNv6N6Kui9AJCUEkP674YY5zNEEC80zbvS11ZDmadbnopkFbuCDmS+RdQperXzGsfHutimHn4m7boRPv/9ENiTnblc7ZBUCdmXaZLA6NOvo2Tz/G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714136071; c=relaxed/simple;
	bh=NcQLW3ocCdC/PzVBkGiFGyk0ODWjYpRP2FPVdFgeF9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgzzCWnjOj4hU98PrY19FNW6cQChjRrBXhq8VE3e2nh+xxHaiuUj8PdDRrTkWjKp4RlqcVHnvVFLWZGB76gXKuTy8AVYNht/dK2NBG1+V+A4G76HpzM+H6o/LsnSrIIjgdjiYEjfXkOfGj9wGtBNpdEqlT9uaTezLV/0U7du/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNEbxKP3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2b07f6b38daso310821a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714136069; x=1714740869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvHSmxPO3bv3+Us8pqufuGCxhhyShCntoTklTfCkcKc=;
        b=aNEbxKP3q38JdDrdGHi785uhKmEXffcODi+vmHc2iA1+mN9/Z9rF8drdV02X4TzZkm
         LsDBpD1pKvIZoY0OCzmkxEbvAQC3QoVOljEaH7AOnV1ILoJ401+DFwoHmAcDnNtyNpba
         2DcrKNDP1ULzsWIYeE8IFP+IbLL7lLlUASYAQoGMWI+9zzXdmGDwFZT4wmj8CH8cCPEQ
         V0vOzzcN7xWGQgKyznQNHKEdGUETxxAag3g09pipRxTzYNNhSW8QA86s5G74/y4ie5Em
         83OzUpCs8qC2ydW/sa1/9WueZDGJ0NUhe+Kzi2OhPMcZzV1IhFWdodOkYSWBN54DtZ35
         hRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714136069; x=1714740869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvHSmxPO3bv3+Us8pqufuGCxhhyShCntoTklTfCkcKc=;
        b=AzDNH3rtg0JOx7AcEDGZX1A70NByDcIpVPgbG+3Pj1MMFJp76rkYcYtqv7IOnNPtiS
         bzNtnMokonmYQRqyqiUmcAtUevoSziC2302O8T+FISWWgs1cf8qn91v+XUSKeCvZV4/g
         T/LwZRDtD7jMWZGvkWyIdIjSX11TahUUOuo/z1EY/NBL/c8GkwcnRysZ7nqV/ZKJBgKh
         Eojb//9C/gcVjBVbDC2ZzIMAP/weDmP7hB2cA/uvq4svMELIln4sk8dWbsvoV0OUQqf8
         /R4SIQB7UAmboZ1WqDmcl1GCZN+cXqZB7MuJvOTeaLy6ElIv2QdcRS8JVEE5pG5cZ2J/
         ggsw==
X-Forwarded-Encrypted: i=1; AJvYcCXfvBrIxTWgbKBYyuNm2O9k6gIcwyY9dChjvyaoSCsdgi3ZXTsqw2JiSG9BkjvA8VQmAGfFpKIlwpi5Ma1FP7VpB2V9oYEPHO+sD/bRTg==
X-Gm-Message-State: AOJu0YyEFRwNM9AgCiicbTDG4PdmuDu3scIonRgNW6qgIrBMHmZlZyJ2
	voXi/wYSYP2DQesYiNJ+DE4b5MneJGoCEv2uqpI6Apd5fTLsqdDW/RKiAJvOBoaKxOfH3aGhyqE
	wvkZ8h1AM8WGkbU0guOyqyWT1fkc=
X-Google-Smtp-Source: AGHT+IGdoLx1QCZOfeq4n84Twe7LZbV2iZvSOpXCn1CtGXnHhGz7vJG63eUdIau/vYs7quyysf4OUXRGM75ALultSic=
X-Received: by 2002:a17:90b:3911:b0:2a5:3367:604b with SMTP id
 ob17-20020a17090b391100b002a53367604bmr4076806pjb.19.1714136068792; Fri, 26
 Apr 2024 05:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com> <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
In-Reply-To: <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 13:54:17 +0100
Message-ID: <CACu1E7H=A+qBQ8vDbAyzmQ85e-xFmAZsArWjstCdLSGuBupf8g@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 1:35=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
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

Sorry, didn't finish this thought. I meant to ask if you wanted to
duplicate qcom_scm_is_available check and qcom_scm_gpu_init_regs
between a750+ and everything else.

Connor

