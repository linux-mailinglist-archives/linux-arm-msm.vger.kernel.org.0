Return-Path: <linux-arm-msm+bounces-18684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F2F8B3BBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 17:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C89E28AF22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 15:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7B9145B07;
	Fri, 26 Apr 2024 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5CzF5Nl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0BD14901A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145777; cv=none; b=XGuD2sL7hcZK7idJyF5d89myLvsBryM+Lq+VNfQnqP5bPBKDeSdN5m3mxATxqWO1fqWR6EQgGc51KdpxChcP9EM+BceLGIQ6qiHVMyuVwsrbEO/RaJYbsxjkFhz4J/rlvdp+pNcf5fVGy2X9t+6fyX6JoGrDKPUPWmUdZ+PcxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145777; c=relaxed/simple;
	bh=BlL2X+vQ7E4spRY9TOAVP8k6W3b3kZfwXZkE5AtY9Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N45wO9gBYSFUtHkdY6JsB8Z7J3qFLza1jA290Ze6wmovHpYDLsUNiW77Nz5zkBqy3YuYL45zFYZzLkQGv61o3+GTcYi62b+Sj7FK4f5nC4V2wIF7W6WS23Ge0Tot8xc9OTR66B4C9WzZC9H7JjFYrns5TLQCPIKaRweCDQ8qt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5CzF5Nl; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so1907646a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714145775; x=1714750575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnnDnxD3brbis4evivxZ04BWU7h2tTWj9fcKmsduOOw=;
        b=a5CzF5NlvnOjuK38AimRmXoP5qUJsTxQ1LPYiI6UJ3jYbSMe49enXe2CZdSoaVz9ur
         99nZD9yqxNvkgzJRrN8DMVPupD0G5/IotdtCxaG030dcb1ZWjYkafPuijOkLbf6u09QZ
         Zz+c4axiHPs93OG6iBxa8zSERtV6HuEKgo8aK7Du7pUPqgX//TmcunyIGOq7EW8jUrvX
         oO/8pAuI0KTL08G5gSy6VfckMnvFEBEoaCor9+BK8GhwliuhFdh/4XmXiqkuzzkatwvR
         O/5ODJayKVyi9lBltPwkmlB9EoyuCHAccRHMPAcnQjocc3zo+37zJAF5cX2H7PhJMLjQ
         ig9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145775; x=1714750575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnnDnxD3brbis4evivxZ04BWU7h2tTWj9fcKmsduOOw=;
        b=S0S9hrcIpfISUBrX4+XY+pcMRoGEdthLgOx+lwEizyzPiXv26dz1xpCGrF3WgXzUtQ
         OU3Uy2979blahe+BvIH1HeoVZZLyVEJtjGbrZQ2rzSBsbd2mWwxn6NnOLjQKSFkw5iFf
         rmOzrTz6eJZJiBp4oXWWMQbHZmsK/HYTjJeqA9FPTAyMDcJnd7e2vG/0/ayAj9LBE5FR
         tdqRsuWJjdh3FejDbZ0GKUXi1HTtqi/grgBsXeddnfNPw59B6HEBw3G4cy4nK4gbYT61
         D3/dwdySVmXEkMowwipCgxJ3K4NdI1YOl/wENOqM2F6VVXE+kLjt8CAFN2RcbsdzRelp
         Z+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Mn+J15ZgtxW4O2qqooGgh5f8HVPfoKSUmIccoqkGYXBFCEh9oqFGIxZ5OSDB6yN3mD81yG714bv50sN1t5AN639C5NOX57hj1tGmJg==
X-Gm-Message-State: AOJu0YyuNsLYK5QRhil/ckqbrCA4JVmx2RED8Mmt++gBGT2UuefGq6q3
	+4v4SFXzWy1ix7IZmLvQjBhQnkD33Wl1UEuQB5urknyEUbq1XO0EcmwhWHz/UUuU5bxYf0Hoq9y
	J2JDIqCcXLtUCJ9rze26LosZdPCc=
X-Google-Smtp-Source: AGHT+IEIpLWSgenILhykaszT56dl5PDyL3qjGcnDOUw3vInG7JMIO0AFSbcRVWBALgvFrEyGUpXYSadXriHYHVtdRvw=
X-Received: by 2002:a17:90b:3658:b0:2af:2978:be02 with SMTP id
 nh24-20020a17090b365800b002af2978be02mr2871439pjb.2.1714145775111; Fri, 26
 Apr 2024 08:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
 <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
 <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com>
 <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
 <CACu1E7FuW48HLC2abdapaE4eGzw9DzOe0C5q_FJNMLEcpR3Q7g@mail.gmail.com> <CAA8EJpoqwvfoK4AP1jCk2YRAfeMk3bpJHwrGEvBFXCPMyXU3CA@mail.gmail.com>
In-Reply-To: <CAA8EJpoqwvfoK4AP1jCk2YRAfeMk3bpJHwrGEvBFXCPMyXU3CA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 16:36:03 +0100
Message-ID: <CACu1E7EAcPtPsQAsozcq-cY9VCUY8xU6_D9i73_qehSqOyv29Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 4:24=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 26 Apr 2024 at 18:08, Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Fri, Apr 26, 2024 at 3:53=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Fri, 26 Apr 2024 at 17:05, Connor Abbott <cwabbott0@gmail.com> wro=
te:
> > > >
> > > > On Fri, Apr 26, 2024 at 2:31=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com>=
 wrote:
> > > > > >
> > > > > > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > > >
> > > > > > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > > > > > > >
> > > > > > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides=
 a method to
> > > > > > > > initialize cx_mem. Copy this from downstream (minus BCL whi=
ch we
> > > > > > > > currently don't support). On a750, this includes a new "fus=
e" register
> > > > > > > > which can be used by qcom_scm to fuse off certain features =
like
> > > > > > > > raytracing in software. The fuse is default off, and is ini=
tialized by
> > > > > > > > calling the method. Afterwards we have to read it to find o=
ut which
> > > > > > > > features were enabled.
> > > > > > > >
> > > > > > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++=
+++++++++++-
> > > > > > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > > > > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/driver=
s/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > > @@ -10,6 +10,7 @@
> > > > > > > >
> > > > > > > >  #include <linux/bitfield.h>
> > > > > > > >  #include <linux/devfreq.h>
> > > > > > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > > > > > >  #include <linux/pm_domain.h>
> > > > > > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > > > > > >
> > > > > > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struc=
t msm_gpu *gpu)
> > > > > > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETEC=
T | \
> > > > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS=
 | \
> > > > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR =
| \
> > > > > > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > > > > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR |=
 \
> > > > > > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION=
)
> > > > > > > >
> > > > > > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > > > > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > > > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(st=
ruct msm_gpu *gpu)
> > > > > > > >         kthread_queue_work(gpu->worker, &gpu->recover_work)=
;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu=
)
> > > > > > > > +{
> > > > > > > > +       u32 status;
> > > > > > > > +
> > > > > > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_=
STATUS);
> > > > > > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > > > > > > +
> > > > > > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse viola=
tion status=3D%8.8x\n", status);
> > > > > > > > +
> > > > > > > > +       /* Ignore FASTBLEND violations, because the HW will=
 silently fall back
> > > > > > > > +        * to legacy blending.
> > > > > > > > +        */
> > > > > > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING=
 |
> > > > > > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > > > > > +               del_timer(&gpu->hangcheck_timer);
> > > > > > > > +
> > > > > > > > +               kthread_queue_work(gpu->worker, &gpu->recov=
er_work);
> > > > > > > > +       }
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > > > > > >  {
> > > > > > > >         struct msm_drm_private *priv =3D gpu->dev->dev_priv=
ate;
> > > > > > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct ms=
m_gpu *gpu)
> > > > > > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > > > > > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE =
| Out of bounds access\n");
> > > > > > > >
> > > > > > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > > > > > +
> > > > > > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS=
)
> > > > > > > >                 msm_gpu_retire(gpu);
> > > > > > > >
> > > > > > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(str=
uct platform_device *pdev,
> > > > > > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > > > > > +{
> > > > > > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > > > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > > > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > > > > > +       u32 fuse_val;
> > > > > > > > +       int ret;
> > > > > > > > +
> > > > > > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > > > > > +               /* Raytracing is always enabled on a740 */
> > > > > > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       if (!qcom_scm_is_available()) {
> > > > > > > > +               /* Assume that if qcom scm isn't available,=
 that whatever
> > > > > > > > +                * replacement allows writing the fuse regi=
ster ourselves.
> > > > > > > > +                * Users of alternative firmware need to ma=
ke sure this
> > > > > > > > +                * register is writeable or indicate that i=
t's not somehow.
> > > > > > > > +                * Print a warning because if you mess this=
 up you're about to
> > > > > > > > +                * crash horribly.
> > > > > > > > +                */
> > > > > > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > > > > > +                       dev_warn_once(gpu->dev->dev,
> > > > > > > > +                               "SCM is not available, poki=
ng fuse register\n");
> > > > > > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_C=
X_MISC_SW_FUSE_VALUE,
> > > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_=
RAYTRACING |
> > > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_=
FASTBLEND |
> > > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_=
LPAC);
> > > > > > > > +                       adreno_gpu->has_ray_tracing =3D tru=
e;
> > > > > > > > +               }
> > > > > > > > +
> > > > > > > > +               return 0;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       if (adreno_is_a750(adreno_gpu))
> > > > > > >
> > > > > > > Most of the function is under the if (adreno_is_a750) conditi=
ons. Can
> > > > > > > we invert the logic and add a single block of if(adreno_is_a7=
50) and
> > > > > > > then place all the code underneath?
> > > > > >
> > > > > > You mean to duplicate the qcom_scm_is_available check and qcom_=
scm_
> > > > > >
> > > > > > >
> > > > > > > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > > > > > > +
> > > > > > > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > > > > > > +       if (ret)
> > > > > > > > +               return ret;
> > > > > > > > +
> > > > > > > > +       /* On a750 raytracing may be disabled by the firmwa=
re, find out whether
> > > > > > > > +        * that's the case. The scm call above sets the fus=
e register.
> > > > > > > > +        */
> > > > > > > > +       if (adreno_is_a750(adreno_gpu)) {
> > > > > > > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7=
XX_CX_MISC_SW_FUSE_VALUE);
> > > > > > >
> > > > > > > This register isn't accessible with the current sm8650.dtsi. =
Since DT
> > > > > > > and driver are going through different trees, please add safe=
ty guards
> > > > > > > here, so that the driver doesn't crash if used with older dts=
i
> > > > > >
> > > > > > I don't see how this is an issue. msm-next is currently based o=
n 6.9,
> > > > > > which doesn't have the GPU defined in sm8650.dtsi. AFAIK patche=
s 1 and
> > > > > > 2 will have to go through the linux-arm-msm tree, which will ha=
ve to
> > > > > > be merged into msm-next before this patch lands there, so there=
 will
> > > > > > never be any breakage.
> > > > >
> > > > > linux-arm-msm isn't going to be merged into msm-next. If we do no=
t ask
> > > > > for ack for the fix to go through msm-next, they will get these
> > > > > patches in parallel.
> > > >
> > > > I'm not familiar with how complicated cross-tree changes like this =
get
> > > > merged, but why would we merge these in parallel given that this pa=
tch
> > > > depends on the previous patch that introduces
> > > > qcom_scm_gpu_init_regs(), and that would (I assume?) normally go
> > > > through the same tree as patch 1? Even if patch 1 gets merged in
> > > > parallel in linux-arm-msm, in what scenario would we have a broken
> > > > boot? You won't have a devicetree with a working sm8650 GPU and
> > > > drm/msm with raytracing until linux-arm-msm is merged into msm-next=
 at
> > > > which point patch 1 will have landed somehow.
> > >
> > > arch/arm64/qcom/dts and drivers/firmware/qcom are two separate trees.
> > > So yes, this needs a lot of coordination.
> >
> >
> >
> > >
> > > >
> > > > >
> > > > > Another option is to get dtsi fix into 6.9 and delay the raytraci=
ng
> > > > > until 6.10-rc which doesn't make a lot of sense from my POV).
> > > > >
> > > > > >
> > > > > > > (not to mention that dts is considered to be an ABI and newer=
 kernels
> > > > > > > are supposed not to break with older DT files).
> > > > > >
> > > > > > That policy only applies to released kernels, so that's irrelev=
ant here.
> > > > >
> > > > > It applies to all kernels, the reason being pretty simple: git-bi=
sect
> > > > > should not be broken.
> > > >
> > > > As I wrote above, this is not an issue. The point I was making is t=
hat
> > > > mixing and matching dtb's from one unmerged subsystem tree and a
> > > > kernel from another isn't supported AFAIK, and that's the only
> > > > scenario where this could break.
> > >
> > > And it can happen if somebody running a bisect ends up in the branch
> > > with these patches in, but with the dtsi bits not being picked up.
> >
> > That wouldn't be possible unless we merged the "bad" commit
> > introducing the GPU node to sm8650.dtsi into msm-next but not the fix.
> > So yeah, it's going to require a lot of careful cooperation but it
> > should be possible to avoid that happening.
>
> Well, the GPU node is already there in the linux-next.

And? As long as the devicetree fix lands first, linux-next will never be br=
oken.

> Anyway. Please. Don't break compat with old DTS. That is a rule of thumb.

It's exactly that, a rule of thumb. This is obviously a bit of an
exceptional case, and you haven't articulated any reason why we should
follow it in this case when there's an obvious reason not to.

Connor

