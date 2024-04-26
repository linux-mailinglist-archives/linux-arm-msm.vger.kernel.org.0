Return-Path: <linux-arm-msm+bounces-18663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B717D8B3751
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 14:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45DF41F211BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 12:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C64538384;
	Fri, 26 Apr 2024 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ9ava5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFD93715E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714134935; cv=none; b=lxV0oZErGpIVALxahQqPSDBU4uQ25++WIHipfJP7y3MrWFHEgTL4/KrfohIrK0njf0yDYPcgkmr6qdzl0x2cGH+B7paycIT5oPh6jSU9uNLPVjmF0wpcTNTGPzGcytwNs9sgt8Aui7hkPXA+HeI4hBiWjXdGS0EP/Bg4yJKOjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714134935; c=relaxed/simple;
	bh=022m67HfWd17QyiVCC2q8VQ/4acnP9nzlk5AqbX7nAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKnVF/PaJABPONBDcWEn/2+x9kq0LAp9ncTmBfjR8HC49b8Q6ZsBmhYhWbU9qwBKeK3OhGvIPcTVc1Sb21Y4Xf3jC8apPxcEaBcseuv+b0m0nCVog4Q9OK8e+iF0ZauMDzfjbqHrATG4OLw5f1Um4gxyy2caAkIG9ZQvV3rHbdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ9ava5V; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed01c63657so1997481b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714134933; x=1714739733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6htC0MyY+kLnmG9joS/4PBX+T+leznoq0J3s1A7B7wY=;
        b=jZ9ava5VuYfkn2CSdodj1w7fchk01UK3peVrpwsFN/LiC80CqNKsuvCnorvOgb+RMH
         VNjR4rBeAeQrvuUFJnOwfPUtcayAxAU1aasX0blcCsoCW9/WSjPneMptUxtRALLmwWjF
         1V/JWm2bEpKKSnl3TZi3wNxWVE9nmvz57BqiuiRmnAJr+bQlMJ2v7i9yrKfDcEm2J084
         SAPZX36xck8S9ClpSQ7mBFaRZ9d5OsOL8Bg6JitHImVtGIHBo/IdIqHtZ5kJ0N/++qCX
         UCoSl9nzPMFtrfDI25LuTSXVib01U/3GzUlrBqoc5d7eLZi1CYtyQNdbyxDmyNHd6vQY
         Abfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134933; x=1714739733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6htC0MyY+kLnmG9joS/4PBX+T+leznoq0J3s1A7B7wY=;
        b=k19/KRgWFcDWBKBEocfuSKs+c2YUaqoJzKp9TeKdDheD9tRBEkEtiHtzLAfYZcVxBK
         r4E6tTcVZ0A9Tz2/u46Luf2bCSMWs0mV0OQRcS9yJzx8BWMfcxpBedUaG/WWj/hjM1GU
         Hj67WM6JuECJlGSEUBUX1lTfYEbKCywQmXC+OEVueSEiGSxMcEorrkBEIzDjLsm36FvE
         CKRBxiurSnJ7pBM8FI1fLDGimVXi07jaMwwYzu5U5mJw6NkdJ81SH++oWZQfDKLtg1Y+
         l1zwdR5y+NpwR1kSjH5SqloWuDMpKIztT9l1R1xgI+Tuui05vgEe4i/UrqojVxm/Vh5F
         cJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg3PQog1LYo6X2uNaLMcrqlhRzqq6YxE8jhsLXws+Fh9S8j+OU8DS+k5pKJDTdDtPNw0bKStkqSVwrChLONfUYqWdmV2GluyYPUarMzw==
X-Gm-Message-State: AOJu0YxYOa7qSYo6A3+K4t9p+lwmX9xCIdgk8nnu9hOWUN2mpimL1DbR
	TjQpSYC2Z5XzogCElvFT/hoxWG0XOYiRRU7biHBsKFOijnSk7kYh1OH+rDWcwnogrKOkTzLhizf
	q0e+6aggdN1axjNs59WFF4ZTbXOs=
X-Google-Smtp-Source: AGHT+IHowYH8O3ojZFUKbyvQC9g7mneswl0bToVesQ7UbL42/lrP6QYMPOZMD5A+a36MjyUfByLe/4uB+7t0uEbakxY=
X-Received: by 2002:a05:6a21:3948:b0:1ae:42f0:dd40 with SMTP id
 ac8-20020a056a21394800b001ae42f0dd40mr887189pzc.10.1714134933026; Fri, 26 Apr
 2024 05:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
In-Reply-To: <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 13:35:21 +0100
Message-ID: <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> > initialize cx_mem. Copy this from downstream (minus BCL which we
> > currently don't support). On a750, this includes a new "fuse" register
> > which can be used by qcom_scm to fuse off certain features like
> > raytracing in software. The fuse is default off, and is initialized by
> > calling the method. Afterwards we have to read it to find out which
> > features were enabled.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 ++++++++++++++++++++++++-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> >  2 files changed, 90 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index cf0b1de1c071..fb2722574ae5 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -10,6 +10,7 @@
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/firmware/qcom/qcom_scm.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/soc/qcom/llcc-qcom.h>
> >
> > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *g=
pu)
> >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> >
> >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_gpu=
 *gpu)
> >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> >  }
> >
> > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > +{
> > +       u32 status;
> > +
> > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > +
> > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=
=3D%8.8x\n", status);
> > +
> > +       /* Ignore FASTBLEND violations, because the HW will silently fa=
ll back
> > +        * to legacy blending.
> > +        */
> > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > +               del_timer(&gpu->hangcheck_timer);
> > +
> > +               kthread_queue_work(gpu->worker, &gpu->recover_work);
> > +       }
> > +}
> > +
> >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >  {
> >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bou=
nds access\n");
> >
> > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > +               a7xx_sw_fuse_violation_irq(gpu);
> > +
> >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> >                 msm_gpu_retire(gpu);
> >
> > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platform=
_device *pdev,
> >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> >  }
> >
> > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > +       u32 fuse_val;
> > +       int ret;
> > +
> > +       if (adreno_is_a740(adreno_gpu)) {
> > +               /* Raytracing is always enabled on a740 */
> > +               adreno_gpu->has_ray_tracing =3D true;
> > +       }
> > +
> > +       if (!qcom_scm_is_available()) {
> > +               /* Assume that if qcom scm isn't available, that whatev=
er
> > +                * replacement allows writing the fuse register ourselv=
es.
> > +                * Users of alternative firmware need to make sure this
> > +                * register is writeable or indicate that it's not some=
how.
> > +                * Print a warning because if you mess this up you're a=
bout to
> > +                * crash horribly.
> > +                */
> > +               if (adreno_is_a750(adreno_gpu)) {
> > +                       dev_warn_once(gpu->dev->dev,
> > +                               "SCM is not available, poking fuse regi=
ster\n");
> > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FU=
SE_VALUE,
> > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > +                       adreno_gpu->has_ray_tracing =3D true;
> > +               }
> > +
> > +               return 0;
> > +       }
> > +
> > +       if (adreno_is_a750(adreno_gpu))
>
> Most of the function is under the if (adreno_is_a750) conditions. Can
> we invert the logic and add a single block of if(adreno_is_a750) and
> then place all the code underneath?

You mean to duplicate the qcom_scm_is_available check and qcom_scm_

>
> > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > +
> > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* On a750 raytracing may be disabled by the firmware, find out=
 whether
> > +        * that's the case. The scm call above sets the fuse register.
> > +        */
> > +       if (adreno_is_a750(adreno_gpu)) {
> > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_S=
W_FUSE_VALUE);
>
> This register isn't accessible with the current sm8650.dtsi. Since DT
> and driver are going through different trees, please add safety guards
> here, so that the driver doesn't crash if used with older dtsi

I don't see how this is an issue. msm-next is currently based on 6.9,
which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches 1 and
2 will have to go through the linux-arm-msm tree, which will have to
be merged into msm-next before this patch lands there, so there will
never be any breakage.

> (not to mention that dts is considered to be an ABI and newer kernels
> are supposed not to break with older DT files).

That policy only applies to released kernels, so that's irrelevant here.

>
> > +               adreno_gpu->has_ray_tracing =3D
> > +                       !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRA=
CING);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +
> >  #define GBIF_CLIENT_HALT_MASK          BIT(0)
> >  #define GBIF_ARB_HALT_MASK             BIT(1)
> >  #define VBIF_XIN_HALT_CTRL0_MASK       GENMASK(3, 0)
> > @@ -3094,6 +3173,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device =
*dev)
> >                 return ERR_PTR(ret);
> >         }
> >
> > +       if (adreno_is_a7xx(adreno_gpu)) {
> > +               ret =3D a7xx_cx_mem_init(a6xx_gpu);
> > +               if (ret) {
> > +                       a6xx_destroy(&(a6xx_gpu->base.base));
> > +                       return ERR_PTR(ret);
> > +               }
> > +       }
> > +
> >         if (gpu->aspace)
> >                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
> >                                 a6xx_fault_handler);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 77526892eb8c..4180f3149dd8 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -182,6 +182,8 @@ struct adreno_gpu {
> >          */
> >         const unsigned int *reg_offsets;
> >         bool gmu_is_wrapper;
> > +
> > +       bool has_ray_tracing;
> >  };
> >  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> >
> > --
> > 2.31.1
> >
>
>
> --
> With best wishes
> Dmitry

