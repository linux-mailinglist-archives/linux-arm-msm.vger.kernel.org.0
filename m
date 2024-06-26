Return-Path: <linux-arm-msm+bounces-24254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB07917D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 12:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA061C21232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A9716EB68;
	Wed, 26 Jun 2024 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PM6uiAao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EA38003B;
	Wed, 26 Jun 2024 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396347; cv=none; b=or3I2yMUuUsmms0SpOyBNB5EuLgr0g0DN0lhGkReg8TTMw7K43dUmLD3ZMk6KI7kEXh601DML7SaOZwiq7PhZDaycAyNpQXpEvwNXFC/WnAzAsuBjKG1RCquH8/CR7KsxM+aGUQfhCvMZuk0BZnapxyN4Z39fWZjx5a0WLx1MWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396347; c=relaxed/simple;
	bh=z3M8mEdJVPWR6v6jV/cfRegtN1SyT57XXI1u4yA9zyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqiyuOA9WykgNbk3myEchzJU214l0BlX1UlLoDhYc2yMCj+f62tBu7u4gmkMUXGsA2PiCuXzKm08Q1JyxX/7vz8dxZSPqTorMUjFXhL3BaB3xHbP1StCLUuGo0md2BtcmI+i+jFgtj7vJhl+1b9r6Bi2XAJxMbUJaj3Kkg95V3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PM6uiAao; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f9cd92b146so50903705ad.3;
        Wed, 26 Jun 2024 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719396345; x=1720001145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykrPcK/Irry8zoUOTi7Jl5zhAUchsKgA/28aNj59N9k=;
        b=PM6uiAaonnvCAkILfgpibnUZ3OsiGJEsgMVoACcGAgkjAilnqT//lFrKp4ZHgscN9A
         RjoDE3hQcUXUh5OVJ9C09EIk3SdTGqZGZjrehYrEiHAb6YDgZPtA2AiFnrVQuibGhkl2
         cVDhd0kzQuyEUowAZVapFQPzwlhRM93+7sx/49Or1Mi2YvLWAzWXfftG/4HXJm2R0dg4
         r92DfQJkAK0kUsMGelLdf6W8QylzItVxNhroQ73wPw7UegnfxcQr82bJ78mMAUK5blCk
         ClX2p00k9Gp/AfO8QDejbdUNmhijjHIZe6CfUfVkiM+Nh07PoRRBVbqNLfSp4bbc15by
         BjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396345; x=1720001145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykrPcK/Irry8zoUOTi7Jl5zhAUchsKgA/28aNj59N9k=;
        b=AwgWYENXzt/G4P4HJyo2uVzQuhNm9ig+Fy+DHrtgPaSAGwwiAd4shXbU80P0ofoAcI
         AylzM/UmsLc1XaBoU7zNQJv7+d6LK1YND2ovbSFTGMH0vxUPy+xlhLg8t1TNvOtv/B8R
         ZJuQVqNdH+NOkN8iBvQBKnojciw5Ygs+98q1sd1eN//JIvDjwCAGV98bFAs0YG4TVf9I
         tgBh9mkOGHLeccTFBX7H6ZZPjI5jL4qlC+yCympfpFC2DUdKJDyS7DtG9l+g88fj7EU+
         H4PqAqM3V84mzL4pmGEcBl4ELK0LcTw5Xq08omWuOQIIMzaaKRBClTDNfHpjdOyHES08
         LQsw==
X-Forwarded-Encrypted: i=1; AJvYcCUgmWihBLgfwKva5rvUoTDdy0xkSPAvROXkvmV4u0JFFvs7crn6gDJuD70Ga1JfQYY7o7Vyd5YVSYcYQFmnWA6k7EBACWYHQrHnbwB28h9K3PK7dW0+sd5FUrtrn1yNAGFaFu6xIVmqH5c=
X-Gm-Message-State: AOJu0YxreG69u3gINmgjgpqXPooWic8AtXIC4oEw7qUh0USzqPlPdzNq
	Y8yL9e6hPilID7b5aL3V01zBG/w6L0602IPWv7naUPNVZaqJWCZ5TpjK/sUp6RN/yWDgP6gPpnH
	mI0uMnenqxx2Hlt9tfMfun8H66wE=
X-Google-Smtp-Source: AGHT+IEbDk7wHb0MmrtAj5JICBIPh3uCDiOdX9j47siTgRNnT9It2W7wT9Xg7W29VcOY+M8sdRaqqNdUtNXutejItdY=
X-Received: by 2002:a17:90a:c78f:b0:2c8:e4a6:4229 with SMTP id
 98e67ed59e1d1-2c8e4a64303mr310020a91.33.1719396345441; Wed, 26 Jun 2024
 03:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-4-7f57c5ac082d@gmail.com> <041cbf33-9fce-4f72-be90-23bc7d215b10@linaro.org>
In-Reply-To: <041cbf33-9fce-4f72-be90-23bc7d215b10@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 26 Jun 2024 11:05:33 +0100
Message-ID: <CACu1E7Gx-cyJYPAjNrc2KOmoZT=f5c50u18HVB=cNzjjrDWjbg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 10:33=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 30/04/2024 12:43, Connor Abbott wrote:
> > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> > initialize cx_mem. Copy this from downstream (minus BCL which we
> > currently don't support). On a750, this includes a new "fuse" register
> > which can be used by qcom_scm to fuse off certain features like
> > raytracing in software. The fuse is default off, and is initialized by
> > calling the method. Afterwards we have to read it to find out which
> > features were enabled.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 91 ++++++++++++++++++++++++=
++++++++-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> >   2 files changed, 92 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index cf0b1de1c071..52b080206090 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -10,6 +10,7 @@
> >
> >   #include <linux/bitfield.h>
> >   #include <linux/devfreq.h>
> > +#include <linux/firmware/qcom/qcom_scm.h>
> >   #include <linux/pm_domain.h>
> >   #include <linux/soc/qcom/llcc-qcom.h>
> >
> > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *g=
pu)
> >                      A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> >                      A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> >                      A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > -                    A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > +                    A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > +                    A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> >
> >   #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> >                        A6XX_CP_APRIV_CNTL_RBFETCH | \
> > @@ -2356,6 +2358,27 @@ static void a6xx_fault_detect_irq(struct msm_gpu=
 *gpu)
> >       kthread_queue_work(gpu->worker, &gpu->recover_work);
> >   }
> >
> > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > +{
> > +     u32 status;
> > +
> > +     status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > +     gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > +
> > +     dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=3D=
%8.8x\n", status);
> > +
> > +     /*
> > +      * Ignore FASTBLEND violations, because the HW will silently fall=
 back
> > +      * to legacy blending.
> > +      */
> > +     if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                   A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > +             del_timer(&gpu->hangcheck_timer);
> > +
> > +             kthread_queue_work(gpu->worker, &gpu->recover_work);
> > +     }
> > +}
> > +
> >   static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >   {
> >       struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > @@ -2384,6 +2407,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >       if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> >               dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bound=
s access\n");
> >
> > +     if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > +             a7xx_sw_fuse_violation_irq(gpu);
> > +
> >       if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> >               msm_gpu_retire(gpu);
> >
> > @@ -2525,6 +2551,61 @@ static void a6xx_llc_slices_init(struct platform=
_device *pdev,
> >               a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> >   }
> >
> > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > +     struct msm_gpu *gpu =3D &adreno_gpu->base;
> > +     u32 fuse_val;
> > +     int ret;
> > +
> > +     if (adreno_is_a750(adreno_gpu)) {
> > +             /*
> > +              * Assume that if qcom scm isn't available, that whatever
> > +              * replacement allows writing the fuse register ourselves=
.
> > +              * Users of alternative firmware need to make sure this
> > +              * register is writeable or indicate that it's not someho=
w.
> > +              * Print a warning because if you mess this up you're abo=
ut to
> > +              * crash horribly.
> > +              */
> > +             if (!qcom_scm_is_available()) {
> > +                     dev_warn_once(gpu->dev->dev,
> > +                             "SCM is not available, poking fuse regist=
er\n");
> > +                     a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE=
_VALUE,
> > +                             A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                             A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> > +                             A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > +                     adreno_gpu->has_ray_tracing =3D true;
> > +                     return 0;
> > +             }
> > +
> > +             ret =3D qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ=
 |
> > +                                          QCOM_SCM_GPU_TSENSE_EN_REQ);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /*
> > +              * On a750 raytracing may be disabled by the firmware, fi=
nd out
> > +              * whether that's the case. The scm call above sets the f=
use
> > +              * register.
> > +              */
> > +             fuse_val =3D a6xx_llc_read(a6xx_gpu,
> > +                                      REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> > +             adreno_gpu->has_ray_tracing =3D
> > +                     !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACI=
NG);
> > +     } else {
> > +             if (adreno_is_a740(adreno_gpu)) {
> > +                     /* Raytracing is always enabled on a740 */
> > +                     adreno_gpu->has_ray_tracing =3D true;
> > +             }
> > +
> > +             if (qcom_scm_is_available())
> > +                     return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS=
_EN_REQ);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +
> >   #define GBIF_CLIENT_HALT_MASK               BIT(0)
> >   #define GBIF_ARB_HALT_MASK          BIT(1)
> >   #define VBIF_XIN_HALT_CTRL0_MASK    GENMASK(3, 0)
> > @@ -3094,6 +3175,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device =
*dev)
> >               return ERR_PTR(ret);
> >       }
> >
> > +     if (adreno_is_a7xx(adreno_gpu)) {
> > +             ret =3D a7xx_cx_mem_init(a6xx_gpu);
> > +             if (ret) {
> > +                     a6xx_destroy(&(a6xx_gpu->base.base));
> > +                     return ERR_PTR(ret);
> > +             }
> > +     }
> > +
> >       if (gpu->aspace)
> >               msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
> >                               a6xx_fault_handler);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 77526892eb8c..4180f3149dd8 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -182,6 +182,8 @@ struct adreno_gpu {
> >        */
> >       const unsigned int *reg_offsets;
> >       bool gmu_is_wrapper;
> > +
> > +     bool has_ray_tracing;
> >   };
> >   #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> >
> >
>
> This patch break GPU init on SM8450-HDK and SM8550-HDK, call to
> qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ) returns -5.
>
> On which device did you test this ?
>
> Neil

I tested on SM8650-HDK (with your DTS patches on top). kgsl does call
this on SM8450/SM8550 [1], and doesn't swallow -EIO, which is why I
thought it was safe. But looking more into it now, the commit message
introducing it mentions the software fuse which is SM8650-only, so
maybe they broke SM8550 when adding this for SM8650?

Connor

[1] https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/graph=
ics-kernel/-/blob/gfx-kernel.le.0.0.r1-rel/adreno_gen7.c?ref_type=3Dheads#L=
915.

