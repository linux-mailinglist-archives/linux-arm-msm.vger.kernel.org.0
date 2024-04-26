Return-Path: <linux-arm-msm+bounces-18686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFD8B3C52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D715A286995
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 16:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BAA14EC5C;
	Fri, 26 Apr 2024 16:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3OV8h9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F614D2B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147380; cv=none; b=YH7A12PBk6pD4NJd32Dg8ECq7faDV43KPn51FJgsKtmeFAAF792NnFFoOUcOCGslJ8CYVomGXIY01Bv2zkHe0tFIfHur/GcK186iPUCU6Qe3LT+GlRHJEo3/0K2aBvLGRM6xqwiIOjPwy7o9uAaBMIf9RZT/ca76XKZLWJVXWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147380; c=relaxed/simple;
	bh=O0ksq8UPlc8HQjmbyT+ee++7UUwkrWVduPwFZhZkB/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZWWLkvx3gI1YmMcXrBASxYS6LUE3CHKMCYbJfVsD+X7bufVYz1L/veKZixdvE9actnf7C7zQsH7doMRqo1Hm/fIhASKw9l4OEKK707iD6H/hnMcBnfn37AYbDpVXqT6HKPJKJ2fgaej6OamZa/oVA5jfLU0eIF0KvIuix6Maow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3OV8h9/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so2505391a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714147376; x=1714752176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/mHQ4MkFqB/UisPkl6IydDN9QWBAdzt+77QAtukqkg=;
        b=h3OV8h9/x6wHZU8/bUmj7oo/nP71/O4bpBhEpnwgAhG/SQd9CcxxUO43gi+RlfMxI/
         VlhbBG9tc7OQDPAoyfNfEMwaaYlfQigTsFN+rpQlKiIyZlMIZ1h6LkiJP0xmTGV1G8d7
         ceLIuGo4McbIfZl1CewHQEsRDnhvXgB00ADVqekAM5K9gVvtGlqX+TxVJBLyef5rUkmv
         fngzimpcwtlEXUO8FpVYjAREnAdoKn+vhf3ss1qc9tJ1tbB1fzx/7WDBdOkJIT/5rphq
         mDdpw5II81nR0q9vP4IuOK0HmgwnowsCOkqcqm9Qgr0ug78iXWXitxVuRbiONQKOdMxZ
         QbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147376; x=1714752176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/mHQ4MkFqB/UisPkl6IydDN9QWBAdzt+77QAtukqkg=;
        b=rZQmF8qVxPgxdZf2AIsgMGCutqfpIrEzSFBw9XzWcGtz9E4G9qt3kZCL272sbD70Wy
         6H1IklTzUDPriVFTCC6+ND7SbwZk6oMVHJXrIO0beN5uF2vP4Atftpsc9mCCwZgy3TBA
         e1UVSWRV3vlHOe5bizKU/obriZxZJhj0aiQgmcQ9vj+qD2jSW+Sq0neVqni5G8wyb8g2
         p04zl8WLurVXdbOOzGG4n0AXDoe3U7PpwVCF6UpcJq4WYjGWxwyIWy07NoViQ0d2/yDw
         E5ThiywdKJd384upoAERcJAC9LtIBkpnaoXw0nucuU3Xmj8EW4VBW9AiJPjATLNDrv3y
         1CUw==
X-Forwarded-Encrypted: i=1; AJvYcCXGKRqCL695lzjh71eFsoDam6KoxISV7ZxE7Bu4oEUfjW48nJHwTwU3vqxunPJphUFu6QDEVrwIWgorKECkM3idAwx1ORk/aH5h5NVumQ==
X-Gm-Message-State: AOJu0Yyid7AOPCwq1nSzUe5Rf2KP2ERx7wbRvcTEoTSjzMTFr7zW3x+W
	OEtHmPvjSSeyLWo4/nyaecUgGk50qiF9I5r/aUztQJAiYeCXf6Mjn76XgxX7V9D4xFwyDzRPe+a
	9QpnEfy2zN6LPb3+f99vJOxzk4KI=
X-Google-Smtp-Source: AGHT+IEG2beRHbi81qNTHs5kOUweKj2j3IIckJh+BruFsDgDFTGxEWnzB7Vj1z9oDmlvvCQFUv03nhGus99h0X9MSVM=
X-Received: by 2002:a50:d5db:0:b0:56d:ee61:6874 with SMTP id
 g27-20020a50d5db000000b0056dee616874mr2333960edj.20.1714147375897; Fri, 26
 Apr 2024 09:02:55 -0700 (PDT)
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
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 26 Apr 2024 09:02:43 -0700
Message-ID: <CAF6AEGsTVkvtyOk0F7Vp23Kp5DH4UAh-YJMfxHuFjKYfhRVpNw@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 8:24=E2=80=AFAM Dmitry Baryshkov
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
>
> Anyway. Please. Don't break compat with old DTS. That is a rule of thumb.
>

+Bjorn, since that is who we need to coordinate with, on two points

1) fix for sm8650.dtsi gpu node..  the gpu node is in linux-next, but
not yet (AFAICT) in any pull req.  So we just ask Bjorn to land the
gpu node fix from this series before sending his DT pull req.  Problem
solved.  Either drm-next gets pulled first, in which case the dt node
doesn't even exist yet, or the dt is pulled with the fix before
drm-next is.

2) the scm dependency.. looks like there are these in-flight scm patches:

[1/4] firmware: qcom: scm: Remove log reporting memory allocation failure
      commit: 3de990f7895906a7a18d2dff63e3e525acaa4ecc
[2/4] firmware: scm: Remove redundant scm argument from qcom_scm_waitq_wake=
up()
      commit: 000636d91d605f6209a635a29d0487af5b12b237
[3/4] firmware: qcom: scm: Rework dload mode availability check
      commit: 398a4c58f3f29ac3ff4d777dc91fe40a07bbca8c
[4/4] firmware: qcom: scm: Fix __scm and waitq completion variable
initialization
      commit: 2e4955167ec5c04534cebea9e8273a907e7a75e1

[1/1] firmware: qcom: scm: Modify only the download bits in TCSR register
      commit: b9718298e028f9edbe0fcdf48c02a1c355409410

Those don't look like they should conflict with [2/6] firmware:
qcom_scm: Add gpu_init_regs call... so maybe we could get an a-b for
landing that patch via msm-next.

BR,
-R

