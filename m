Return-Path: <linux-arm-msm+bounces-18673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB268B3894
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 15:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53D4283409
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36523146A95;
	Fri, 26 Apr 2024 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2mGObno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D161F956
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138669; cv=none; b=BNh1FToexIooBiUIiIPOko5XfSeiKQmidI02MLbUsxQAqyhX4gHXicSKJWar63Hw7zfTciVa02G5ITsw5vAYgFSc5b10SXWupcdONg4J03sMdm6L+Yfc5t8Y7uy6u0DzZy9DPh+tuCse5sOrbCpmF6mOm+kqYKjE8Mf1nANeWIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138669; c=relaxed/simple;
	bh=5nGr7Khul2UP0vGV1D2vOWrp152L/NxklaU2bcolGVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhGClkxOv8GnOujPNP6Gj/WSjK+ICyS1gjO+r4Nbru8AQc/yoj3eUMcD0NJHZZOoy/+ug8gZgZEGpaXzqpg/dWWSAj8kgLFvtjRqmSm2KdVq1a6IYeBeDTNy8fIrG+NBLvEVT0xkX/9bKc0XNzjpQleOaLyGs1uL0mJl94dOdUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2mGObno; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so2854967276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138666; x=1714743466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86T/oEqzRWMvqN/jhl6bfbOWuaVo8OEZv1+dOP8/hAk=;
        b=B2mGObnoT+1qHUwcNtiF0DeJWKpB++HyZLoXsgsgR+ov5FMR75JFWlKQOZkRsbY5in
         1iQZcD2KdURZ/g50gTQB6XYEbSl4Y6rfj/DxnScTkofoBweFWsscKnbZoPBOYnZPNo3s
         icnNu0YfSOunEKciytxvXBmXUCkcGOB6is67HCMx8z1UUX8uKT8SrJwHCiX97PIM55+2
         gBqrZ9ysWuLlS1NlgpveUqEJjFVSZQmitk7iO0dFOEoJcVIBd6YRzH0R/zQGKOclq1PE
         BFxwW4Kyr9Cn3mlcbhVpZf4qYs7y7bCvsDCrUxYKrUULpRDHcn7HzyFe3yLkL0LcU1EA
         VLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138666; x=1714743466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86T/oEqzRWMvqN/jhl6bfbOWuaVo8OEZv1+dOP8/hAk=;
        b=C6JdEb1i+x0D8IdXbPo5X5vpJZwgn/NLu/zdnow1qad9yvbDErh43YdkazgSIoAQ0m
         cdIR6mtSZENa99mB+Kmj6M4hltB5We9IJlHsqYRRhkRLacqmVd/NyAkI7U60QcQhPDoN
         lm6A89zXgVakvxD5eTrLYytJwNaqLJqJkpPVtzVz43va4ccO9s/1lXYusc4rwoP6iWQx
         Fi1uVeqM6W/4Egk7EKOWW3ih8Jbs/glJDUwgiBOSLfFQ7dcCtdhr7vv9QGHoCWmNisRX
         5jH+EdwYrtm5vqNHAPnm9fkEJr4P7jvmbKBPdshhLMeLkrQYjHPJm/2DUimjA6bmNZH2
         /8tA==
X-Forwarded-Encrypted: i=1; AJvYcCV2SLesC6xXQqY1b95zi+nHixvSODoe/Ew9JUYhacwbPP5MdDPHQIO3zeunLwu60K8aVdP7YYqbme8VYE6GZYRO/KOupPOfbvD24Z83uQ==
X-Gm-Message-State: AOJu0YzI8JpOkgp/70y//XVh+uIf1fjQDn71CG1zvMNJy5d1rSpaHgWB
	h7+Ph+9BQfjE/gBu8Deu5ATo7jrh6Id6hoHDRevp1xO2TqYryPVhB33PBBslMQ20XC/8UNp6aDr
	6uorJCYFAdaz1+3A/+g2hJEJCm7ZsD/6V/xqm7A==
X-Google-Smtp-Source: AGHT+IFlN/2Hb9h4kgi2uXjP4e7Mp6xBKQKjUM8NeVwQJWlOPuDHFBu48cL1Ls0YRUtorH01J7UqoD+e1XwzgXqg1JA=
X-Received: by 2002:a05:6902:238a:b0:de4:6ace:7aa with SMTP id
 dp10-20020a056902238a00b00de46ace07aamr4810315ybb.17.1714138666334; Fri, 26
 Apr 2024 06:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com> <CACu1E7H=A+qBQ8vDbAyzmQ85e-xFmAZsArWjstCdLSGuBupf8g@mail.gmail.com>
In-Reply-To: <CACu1E7H=A+qBQ8vDbAyzmQ85e-xFmAZsArWjstCdLSGuBupf8g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 16:37:35 +0300
Message-ID: <CAA8EJpo95+w4ovyPWdoSuGEKUgrakfM2Qp1wb_39BYaCWgBtDw@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Apr 2024 at 15:54, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Fri, Apr 26, 2024 at 1:35=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wro=
te:
> > > >
> > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a metho=
d to
> > > > initialize cx_mem. Copy this from downstream (minus BCL which we
> > > > currently don't support). On a750, this includes a new "fuse" regis=
ter
> > > > which can be used by qcom_scm to fuse off certain features like
> > > > raytracing in software. The fuse is default off, and is initialized=
 by
> > > > calling the method. Afterwards we have to read it to find out which
> > > > features were enabled.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu.c
> > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > @@ -10,6 +10,7 @@
> > > >
> > > >  #include <linux/bitfield.h>
> > > >  #include <linux/devfreq.h>
> > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > >  #include <linux/pm_domain.h>
> > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > >
> > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gp=
u *gpu)
> > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > >
> > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm=
_gpu *gpu)
> > > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > >  }
> > > >
> > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > > +{
> > > > +       u32 status;
> > > > +
> > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > > +
> > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation sta=
tus=3D%8.8x\n", status);
> > > > +
> > > > +       /* Ignore FASTBLEND violations, because the HW will silentl=
y fall back
> > > > +        * to legacy blending.
> > > > +        */
> > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > +               del_timer(&gpu->hangcheck_timer);
> > > > +
> > > > +               kthread_queue_work(gpu->worker, &gpu->recover_work)=
;
> > > > +       }
> > > > +}
> > > > +
> > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > >  {
> > > >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *g=
pu)
> > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of=
 bounds access\n");
> > > >
> > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > +
> > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > > >                 msm_gpu_retire(gpu);
> > > >
> > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct plat=
form_device *pdev,
> > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > >  }
> > > >
> > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > +{
> > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > +       u32 fuse_val;
> > > > +       int ret;
> > > > +
> > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > +               /* Raytracing is always enabled on a740 */
> > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > +       }
> > > > +
> > > > +       if (!qcom_scm_is_available()) {
> > > > +               /* Assume that if qcom scm isn't available, that wh=
atever
> > > > +                * replacement allows writing the fuse register our=
selves.
> > > > +                * Users of alternative firmware need to make sure =
this
> > > > +                * register is writeable or indicate that it's not =
somehow.
> > > > +                * Print a warning because if you mess this up you'=
re about to
> > > > +                * crash horribly.
> > > > +                */
> > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > +                       dev_warn_once(gpu->dev->dev,
> > > > +                               "SCM is not available, poking fuse =
register\n");
> > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_S=
W_FUSE_VALUE,
> > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACI=
NG |
> > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEN=
D |
> > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > > +               }
> > > > +
> > > > +               return 0;
> > > > +       }
> > > > +
> > > > +       if (adreno_is_a750(adreno_gpu))
> > >
> > > Most of the function is under the if (adreno_is_a750) conditions. Can
> > > we invert the logic and add a single block of if(adreno_is_a750) and
> > > then place all the code underneath?
> >
> > You mean to duplicate the qcom_scm_is_available check and qcom_scm_
> >
>
> Sorry, didn't finish this thought. I meant to ask if you wanted to
> duplicate qcom_scm_is_available check and qcom_scm_gpu_init_regs
> between a750+ and everything else.

I don't see !qcom_scm_is_available()) being useful anywhere else, at
least for now.

So it becomes:

       if (adreno_is_a740(adreno_gpu)) {
               /* Raytracing is always enabled on a740 */
               adreno_gpu->has_ray_tracing =3D true;
               // FIXME: Do we need this at all on a740?
               qcom_scm_gpu_init_regs(gpu_req);
       } else if (adreno_is_a750(adreno_gpu)) {
                 if (!qcom_scm_is_available()) {
                       dev_warn_once();
                       adreno_gpu->has_ray_tracing =3D true;
                       return 0;
                  }
                  gpu_req |=3D ...;
                  qcom_scm_gpu_init_regs(gpu_req);
                  fuse_val ....;
         }

--=20
With best wishes
Dmitry

