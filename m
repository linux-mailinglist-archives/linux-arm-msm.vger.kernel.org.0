Return-Path: <linux-arm-msm+bounces-18924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87E8B6FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5EF2284812
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AD512C471;
	Tue, 30 Apr 2024 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9xivYhL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37927442;
	Tue, 30 Apr 2024 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473091; cv=none; b=X/GwBMnJFqYhMIAMF6iHmo3FbFdHKWp/brpzeQdo8fMPCgSz+AogItP3+DCbdPpllnqNqQBVTMICBgae8nOxyvd5EvsPnSAYQQnLOyh2J6pULI5Wodq0Lvr8nIs/wLhQWkubW+szVWnZySFvF4NWEdL5YF8FXmiJV4CPoV9hako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473091; c=relaxed/simple;
	bh=kWjgIK5E/ifl/q24znJ3s8xwICjoCzZsujZc66m/hLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNFk4d3qLAUHujK04jPhoIsXmjJEC/6rsgWgQQf0EGiTd4ICE4yGoIWIYd8oltS2t7mVf/TE7jeeqg5OYFNatMzEco8m+iqc/dBu6RC9IRPYphJYmboHBbTbnNgT45fZE6PzFof08ei3K3J/tj+jVQIHjHRpm7yBlc9vi4VCSc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9xivYhL; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ecff9df447so5351354b3a.1;
        Tue, 30 Apr 2024 03:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473089; x=1715077889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVBoXY2/NPG7+wTGyF7C7GoYFHMyHmYdFMeZrUt8JbY=;
        b=Q9xivYhLU/cC1l7HfF2NzcVTnD94ZApP9nrGhw9xdgwI0lWikJuDNa3h7YGOJ8vPLC
         JJKU3nqK+yoTpPvsCfapNZsY/g0KR1R+rBQb+R1g+9qm1XqgZI3hj+L/diRG8KVABNtP
         goF8YIyn8kLvjgmMtLDa1vt4TLIXcaj6O3aYhQTEIlOiG5zhq8rptD2sNp5ZyJaz8N4G
         M88I8LKjIJNL196rqbAk4MfGBAtXpn5zUe5DZMCw538in3D0RWKQv7w83dONlL84Ogoh
         benUGLzttxJkDpLqJ82q7OnduKX57u7kFysOXFhgy1qPAA62OGC5A9GXhgt4gfovIeUL
         MzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473089; x=1715077889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVBoXY2/NPG7+wTGyF7C7GoYFHMyHmYdFMeZrUt8JbY=;
        b=DcacEoz3A2YT695EOjb00g945gIm6I35VNK18OLrLLb32QcKB36xihx38pIhRgtder
         VXMt+g8ithwwm5ClhdbySqywdkvOsj4hhgJ/Qq1gEjRTYI4WrtNLxlYyagVr3xzXyAeg
         uuUdA4wRXeUfvYLjMP49Yih0S6HveXFvNeHlLAHMSPfnaC6IZw9yEeUfVHK4gATCynwD
         gq4x3q9w5KU5tsTqUC4Nh6aJnK61PVdDotcj57huGyaf+dMNrTPrvI5xfsEhHKZh/fEk
         RNPbbtWqfUdP7BAbkLthgxtEWKCixjboUZaWzeLnZYvSbEt6OeiHreDEpU6WW75EYh15
         hEkg==
X-Forwarded-Encrypted: i=1; AJvYcCW8CLelFR92tJudS2gda6RZFalbNfxeHFkk0axpJlTG5ha5I1fR95rxQc42MCETBteNA9cC44BOl7XwHB4J2i3UCx8VhXq8TVKYBJ3/U94t4scXqBqZamYZXL3ZKyJV7Tt9Uhhbvc3uxaY=
X-Gm-Message-State: AOJu0Ywrb6f1io2rCATnRxZX21PEOwpPpqI/ctPm/5mGcGRpBeBKZUwh
	czu1TVLcXoRMZBvC/Ed2y27U8H4fFihsnvDgf9H+N/kLy81XUeb/ysYrVNVd1MURKvRDX6qlQPx
	hIcRChqeUDuIpYQWKc93r6hyeNww=
X-Google-Smtp-Source: AGHT+IEUfP4I+J+PclmF0fk4nYt8dfXjCvRwv9b6ONxIEQjTkj3ayJq9CUlR4q1dy9MAyS2VyDg2sXO9m02NAQhnmek=
X-Received: by 2002:a05:6a21:1a9:b0:1af:41d1:7334 with SMTP id
 le41-20020a056a2101a900b001af41d17334mr2835730pzb.27.1714473089048; Tue, 30
 Apr 2024 03:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com> <12db74c2-87ec-45e3-9ca0-c5f2328c5f8b@linaro.org>
In-Reply-To: <12db74c2-87ec-45e3-9ca0-c5f2328c5f8b@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:31:17 +0100
Message-ID: <CACu1E7H0jpQkkfSCcOhdgZM0kntc-wTiRK_rM83STfAxtZ6fkw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2024 at 1:19=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 26.04.2024 8:34 PM, Connor Abbott wrote:
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
>
> [...]
>
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
> > +     /* Ignore FASTBLEND violations, because the HW will silently fall=
 back
> > +      * to legacy blending.
>
> /*
>  * foo
>
>
>
> > +      */
> > +     if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                   A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > +             del_timer(&gpu->hangcheck_timer);
> > +
> > +             kthread_queue_work(gpu->worker, &gpu->recover_work);
> > +     }
> > +}
> > +
> >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >  {
> >       struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >       if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> >               dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bound=
s access\n");
> >
> > +     if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
>
> Does this field actualy exist on a6 too?

No, it doesn't. It's correctly marked as an a7xx-only field in the
XML, and we only enable the mask on a7xx so we will never call
a7xx_sw_fuse_violation_irq() on a6xx, but the XML parser still puts
the A6XX_ prefix here.

>
> > +             a7xx_sw_fuse_violation_irq(gpu);
> > +
> >       if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> >               msm_gpu_retire(gpu);
> >
> > @@ -2525,6 +2550,59 @@ static void a6xx_llc_slices_init(struct platform=
_device *pdev,
> >               a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> >  }
> >
> > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > +     struct msm_gpu *gpu =3D &adreno_gpu->base;
> > +     u32 fuse_val;
> > +     int ret =3D 0;
> > +
> > +     if (adreno_is_a750(adreno_gpu)) {
> > +             /* Assume that if qcom scm isn't available, that whatever
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
>
> I'm not 100% sure. I'm afraid there may be SKUs with RT cores fused
> off (as in, cut off from the rest, not "indicated unavailable") or
> otherwise dysfunctional..
>
> My guess would be that TZ probably has some sort of a LUT/match table
> based on other SoC identifiers

I don't think so. The entire point of this register AFAIK is to make
it possible for the firmware to block access to features, not to
describe the HW. If they want to fuse something off in the HW, as they
have done before, then they will typically give the GPU a different
chip_id. If they do happen to use this register in that way, which I
think is unlikely, and someone ships this on a platform like
Chromebooks without qcom_scm and with the RTU fused off, then it's on
them to come up with an alternative way to describe it. There's
nothing more we can do here without further information.

>
> > +                     return 0;
> > +             }
> > +
> > +             ret =3D qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ=
 |
> > +                                          QCOM_SCM_GPU_TSENSE_EN_REQ);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* On a750 raytracing may be disabled by the firmware, fi=
nd out whether
> > +              * that's the case. The scm call above sets the fuse regi=
ster.
> > +              */
> > +             fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_=
FUSE_VALUE);
> > +             adreno_gpu->has_ray_tracing =3D
> > +                     !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACI=
NG);
> > +     } else {
> > +             if (adreno_is_a740(adreno_gpu)) {
> > +                     /* Raytracing is always enabled on a740 */
> > +                     adreno_gpu->has_ray_tracing =3D true;
> > +             }
> > +
> > +             if (!qcom_scm_is_available())
> > +                     return 0;
> > +
> > +             ret =3D qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ=
);
> > +     }
> > +
> > +     return ret;
>
>         if (qcom_scm_is_available())
>                 return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ)=
;

Ok.

> }
>
> return 0;
>
> ?
>
> Konrad

