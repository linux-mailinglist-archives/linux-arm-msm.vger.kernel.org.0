Return-Path: <linux-arm-msm+bounces-18681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37B8B3AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 17:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCF6C1F218EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B45A14884A;
	Fri, 26 Apr 2024 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8MWrwvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0931148FE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144094; cv=none; b=mjh5wR2eQgTel/KioVqPxBnjuQUln3PtH1gcumjXWa44iXmkRgKASw/IH0cr1n+J1JwDXC5n9i0v9ramWIrEHxPzEd03yWHYbpAqHtHZL1ZfvRqYkGIJr4b26mpQ02QDbvVFHCEYEkQLhDLFWhORM0W9JFcXtbY0LGvdEYWOSw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144094; c=relaxed/simple;
	bh=ycL6+QbtCnxU8RzmEynWTwKKcelORyzftT5rwOUowrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1S75AJ8jqBCDTKkm4ilKVU0POneD5RFQP7jWiYNscpeoN28CurKzHJLcgo3c2abuONrlTcSPke+hRzuavcJGUryo9VFfBD1MZdfSv9nvubcHwdJ+ZccgFEF4PWacoVHTiifH0uyCIoXce7iDlv2TJzzs2O8Z6EqRjltE0M1VZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8MWrwvg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e8fce77bb2so17379675ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714144092; x=1714748892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctu0m4rM6+USl2xcHMefQK5yQcIRHLN6sIxyq7B3ozc=;
        b=N8MWrwvgOVglSJMDx4/8dNc0PYziUWjcz/kwbIs+uFMFLDkYe1+vs+UstR5FkDrKam
         Q/LCLtgmA/FXqOZGy6v5869sdQSYXbA6Vv+IoP7F6hMKud7SkFFgQWB61dkztwE8MMi1
         IOhYRjpkdFj0x99Wj0bL0HonqkoqOcePrQCE9+nrSKHK3xo1rTxHsomWPQC1UdaRPWoN
         UQ1BwVSVum0Urp5AQKTiWyZ+mKEJvw1xjUZNgBHs+OyJATMchC6rbORAWiQORZvlZSB6
         v77HfNfD5rHudVbj4VIVN6l/IjGd+s2xQn42b1WW7gvdoTc6EH1wzO+aMJzf0mjMhKHb
         ZulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714144092; x=1714748892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctu0m4rM6+USl2xcHMefQK5yQcIRHLN6sIxyq7B3ozc=;
        b=gXBs2IvXzw4zhsaCI1+N9wAWKyTMx7UNODPx5wV4OnMfdcIxTQNIRzZJbEhZGbgV+7
         vsvAjjNzUoEzX9Yuj3TrOPUMgKa01twhqE0VSwvwsHWvP5oVJQaxqyr+rSipT0C9Uf7T
         4h0ajvLrfTGdEU11UPeGe2LPs/QbLWvT015FKnzCdUcDm7tnC/E5PDyQHN4eEiO1H+01
         7CaEiZGiT+2bK61PTS8Slv+EtqlpFyhgAl69wqWI4OlUdIyA6gQE7pzkNjq4+m5bZz1Z
         7MdOPTcgRpKm0hlx3EmKlTZFQFRCDDqjMGTEY3b+zL8ZhzwnsEv44LsCM3ovwfdMTYU2
         usYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5ILz8qgBcb/Zn/wkL15Qkt82oLmj7nwCMzaujW/yiNxUKzZsVBdfAOgPGVGuTx0di0injC8TKmHM7oe3Us0zvr5ppYHjEOixDJ9WrxA==
X-Gm-Message-State: AOJu0YxW9AzC3lZzVTnb+SLR/9peJ8NiUpEAZscq+b0LOMLdMaaex5Bx
	enVvY+zqxhO0nSfm/ohsa2D1huYI4DJoZXZEZSu9oPIWMLW6nv6wrbIth4mcQl3Hzzw6p2x5SD3
	ngOiPvGuR27Nem+KgEl7mKD4eGhQ=
X-Google-Smtp-Source: AGHT+IHL5Ivl2RDCWHbWaLV8CntELtFfdBiGDW53jCFsLGqxctCm6DXJ/RAHfnglm+21ZTWsNhtEezL9xIn/ZBTRzp4=
X-Received: by 2002:a17:902:d506:b0:1eb:fe3:3436 with SMTP id
 b6-20020a170902d50600b001eb0fe33436mr1888980plg.52.1714144091717; Fri, 26 Apr
 2024 08:08:11 -0700 (PDT)
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
 <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com> <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
In-Reply-To: <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 16:08:00 +0100
Message-ID: <CACu1E7FuW48HLC2abdapaE4eGzw9DzOe0C5q_FJNMLEcpR3Q7g@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 3:53=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 26 Apr 2024 at 17:05, Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Fri, Apr 26, 2024 at 2:31=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com> wro=
te:
> > > >
> > > > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com>=
 wrote:
> > > > > >
> > > > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a m=
ethod to
> > > > > > initialize cx_mem. Copy this from downstream (minus BCL which w=
e
> > > > > > currently don't support). On a750, this includes a new "fuse" r=
egister
> > > > > > which can be used by qcom_scm to fuse off certain features like
> > > > > > raytracing in software. The fuse is default off, and is initial=
ized by
> > > > > > calling the method. Afterwards we have to read it to find out w=
hich
> > > > > > features were enabled.
> > > > > >
> > > > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++=
+++++++-
> > > > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gp=
u/drm/msm/adreno/a6xx_gpu.c
> > > > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > @@ -10,6 +10,7 @@
> > > > > >
> > > > > >  #include <linux/bitfield.h>
> > > > > >  #include <linux/devfreq.h>
> > > > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > > > >  #include <linux/pm_domain.h>
> > > > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > > > >
> > > > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct ms=
m_gpu *gpu)
> > > > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | =
\
> > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > > > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > >
> > > > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct=
 msm_gpu *gpu)
> > > > > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > > > >  }
> > > > > >
> > > > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > > > > +{
> > > > > > +       u32 status;
> > > > > > +
> > > > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STAT=
US);
> > > > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > > > > +
> > > > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation=
 status=3D%8.8x\n", status);
> > > > > > +
> > > > > > +       /* Ignore FASTBLEND violations, because the HW will sil=
ently fall back
> > > > > > +        * to legacy blending.
> > > > > > +        */
> > > > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > > > +               del_timer(&gpu->hangcheck_timer);
> > > > > > +
> > > > > > +               kthread_queue_work(gpu->worker, &gpu->recover_w=
ork);
> > > > > > +       }
> > > > > > +}
> > > > > > +
> > > > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > > > >  {
> > > > > >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > > > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gp=
u *gpu)
> > > > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > > > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Ou=
t of bounds access\n");
> > > > > >
> > > > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > > > +
> > > > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > > > > >                 msm_gpu_retire(gpu);
> > > > > >
> > > > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct =
platform_device *pdev,
> > > > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > > > >  }
> > > > > >
> > > > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > > > +{
> > > > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > > > +       u32 fuse_val;
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > > > +               /* Raytracing is always enabled on a740 */
> > > > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > > > +       }
> > > > > > +
> > > > > > +       if (!qcom_scm_is_available()) {
> > > > > > +               /* Assume that if qcom scm isn't available, tha=
t whatever
> > > > > > +                * replacement allows writing the fuse register=
 ourselves.
> > > > > > +                * Users of alternative firmware need to make s=
ure this
> > > > > > +                * register is writeable or indicate that it's =
not somehow.
> > > > > > +                * Print a warning because if you mess this up =
you're about to
> > > > > > +                * crash horribly.
> > > > > > +                */
> > > > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > > > +                       dev_warn_once(gpu->dev->dev,
> > > > > > +                               "SCM is not available, poking f=
use register\n");
> > > > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MI=
SC_SW_FUSE_VALUE,
> > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYT=
RACING |
> > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FAST=
BLEND |
> > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC=
);
> > > > > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > > > > +               }
> > > > > > +
> > > > > > +               return 0;
> > > > > > +       }
> > > > > > +
> > > > > > +       if (adreno_is_a750(adreno_gpu))
> > > > >
> > > > > Most of the function is under the if (adreno_is_a750) conditions.=
 Can
> > > > > we invert the logic and add a single block of if(adreno_is_a750) =
and
> > > > > then place all the code underneath?
> > > >
> > > > You mean to duplicate the qcom_scm_is_available check and qcom_scm_
> > > >
> > > > >
> > > > > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > > > > +
> > > > > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > > > > +       if (ret)
> > > > > > +               return ret;
> > > > > > +
> > > > > > +       /* On a750 raytracing may be disabled by the firmware, =
find out whether
> > > > > > +        * that's the case. The scm call above sets the fuse re=
gister.
> > > > > > +        */
> > > > > > +       if (adreno_is_a750(adreno_gpu)) {
> > > > > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_C=
X_MISC_SW_FUSE_VALUE);
> > > > >
> > > > > This register isn't accessible with the current sm8650.dtsi. Sinc=
e DT
> > > > > and driver are going through different trees, please add safety g=
uards
> > > > > here, so that the driver doesn't crash if used with older dtsi
> > > >
> > > > I don't see how this is an issue. msm-next is currently based on 6.=
9,
> > > > which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches 1 =
and
> > > > 2 will have to go through the linux-arm-msm tree, which will have t=
o
> > > > be merged into msm-next before this patch lands there, so there wil=
l
> > > > never be any breakage.
> > >
> > > linux-arm-msm isn't going to be merged into msm-next. If we do not as=
k
> > > for ack for the fix to go through msm-next, they will get these
> > > patches in parallel.
> >
> > I'm not familiar with how complicated cross-tree changes like this get
> > merged, but why would we merge these in parallel given that this patch
> > depends on the previous patch that introduces
> > qcom_scm_gpu_init_regs(), and that would (I assume?) normally go
> > through the same tree as patch 1? Even if patch 1 gets merged in
> > parallel in linux-arm-msm, in what scenario would we have a broken
> > boot? You won't have a devicetree with a working sm8650 GPU and
> > drm/msm with raytracing until linux-arm-msm is merged into msm-next at
> > which point patch 1 will have landed somehow.
>
> arch/arm64/qcom/dts and drivers/firmware/qcom are two separate trees.
> So yes, this needs a lot of coordination.



>
> >
> > >
> > > Another option is to get dtsi fix into 6.9 and delay the raytracing
> > > until 6.10-rc which doesn't make a lot of sense from my POV).
> > >
> > > >
> > > > > (not to mention that dts is considered to be an ABI and newer ker=
nels
> > > > > are supposed not to break with older DT files).
> > > >
> > > > That policy only applies to released kernels, so that's irrelevant =
here.
> > >
> > > It applies to all kernels, the reason being pretty simple: git-bisect
> > > should not be broken.
> >
> > As I wrote above, this is not an issue. The point I was making is that
> > mixing and matching dtb's from one unmerged subsystem tree and a
> > kernel from another isn't supported AFAIK, and that's the only
> > scenario where this could break.
>
> And it can happen if somebody running a bisect ends up in the branch
> with these patches in, but with the dtsi bits not being picked up.

That wouldn't be possible unless we merged the "bad" commit
introducing the GPU node to sm8650.dtsi into msm-next but not the fix.
So yeah, it's going to require a lot of careful cooperation but it
should be possible to avoid that happening.

Connor

