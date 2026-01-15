Return-Path: <linux-arm-msm+bounces-89188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF17D2394F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CEDC302BAB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EE7346765;
	Thu, 15 Jan 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aoohe+CK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C433291B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469681; cv=none; b=gXPP2VzycQNwEkyiic1btpNV+VhHWqvDvuApi5svwEqrSakSOzhjmtjVDH8wz+sPVp1RX1yqyvDWE8gEwpdslnNhtm0LBC0KA8flltkqMh+CuUfsNMG9K0StxddHzWvFyMnbYwiuVhnqktl4c4oZ4aBDFYeBF/5Uiex44P+uPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469681; c=relaxed/simple;
	bh=AxqYozrLuMmXMaoZ5/pZf5jnpk4TfGKrjjZhe4c567Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnRZ8mDEgQwjldbwEC8ur9k+tibCtL1lRM2ss56Wn1fRFn9xSsVGIpN7Nuil2JrYMw+JUYGpe5YVhV+LQNp5uTWKbNBI87Rg2tzOIgV7Gte2I9oR+VLuM+WqsJ9C02luTff63syXHdO4HCSte0MWZjqMcNpdBLXztZNJYs3BH9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aoohe+CK; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78e7ba9fc29so6639397b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768469679; x=1769074479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtmucDODzCQNgpM1i8fstCkKu8sS/X2z9xJEfREIeM4=;
        b=aoohe+CKtc2VCR+whZXommOpyaqFEa1FPc8hlN8O+umzxFWHo7Exn6HQT+eVTZqh7K
         cPBuHM9KPWKnDmYm9tfJ0kYs8BwCv36ZicFpCfX6mNNqI9Q33rT7y/oUc2m6kyQ1RiTy
         13uAuLDzJFgVNY3Bd2aqbKmDMeWgqZqMBO0N5Yk6cGTUSLYMNQQ6gHVquEh+3fSx/mg6
         9Zw8nd22kBIx+uscoC0X/T8n+p5icZR6ZM4FBbgJsf8m3LebzHO++k5Ik4P/EjQfFyf9
         DtSBAT0BfSVMjPe7Y/cPUnNIuJvp9CB8RFyZ7sjGdYmb+PUEipcqW0Lrxn2wpE5A38UJ
         JmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469679; x=1769074479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gtmucDODzCQNgpM1i8fstCkKu8sS/X2z9xJEfREIeM4=;
        b=EEZrLDgxK3cCzyZmNQnsAMeBrUCU/lGljriWSDwW997kOhHHnh8RMhttnYCnrMoNOe
         O/4qQIM6kO1YOnJmCQP2FyMh4XvVgoTp7OfiKNpJ5shSx7SY4e5rZkJg1h9Nf1Y7XPxD
         c6qjo1T9w/uLZOpLpJOdA+Ff4NUsCnyVgYdQVU8hUdMuiAH0UtSTUKOpj42K5kJMvkYY
         V0X+VRHj8t740wYdQdEpnQ1drYGPNi8n10dGK3YwkxptnFJAdwj8Xj6Bqp5zcVHburOU
         X5rPToHJctY2fk/CmPZ9e6GFYsmwkXK8LTSgLgrTNucckcPGzii7LCLq4wNtRzq4AP1f
         9PIg==
X-Forwarded-Encrypted: i=1; AJvYcCW57S8MT54QABeY6Qo7arymdIDipjJN9GQa/7RpC+a+2bbrOW9Yort7rD2jnUNDPf0gdurjZSinTmL5v/5x@vger.kernel.org
X-Gm-Message-State: AOJu0YwvL2YHvfc1KCb0JcEsM1V1ellQC7a2f4ZBvUwxwC1dfo6F9umD
	/1ULCrNdW5LxTPu3n9hEKicPpgBSiDOp5vi61t0V1E90qprG6BxBXq97g6SeQAWAZn4W9Zg9fmu
	GGTULDj+W4sJ0cU9JOXLkfUwnT2KC5/ltwkm9gM4PYw==
X-Gm-Gg: AY/fxX4xCV9FxJl/D0u3e+257bq6kihHAbKJwYyAQuTe4/rUHp//+hv2rwbJ3K8LG8q
	LXOlK4/NKFXxI+IOhjxjw7ZFxNvQGMR5GbyEBigWoAmQuTshIaaZVS9rasjn6Pi4HPeXlJj+XcK
	rPNAE3pJmYJYf24HaKHUmtIeVIsarHCPXkQDtFvTu5sQsTFgNNzkz2Cjfp/fMUkydz1QwLC3tz0
	i+btVoT/F2eXMKutFOD6MOQRBykhWMOPCtasQrMTK6yjX0VpqQkFab7zZNFjFgh0Vu5K515JNpg
	2EI=
X-Received: by 2002:a53:ad51:0:b0:644:4f94:c534 with SMTP id
 956f58d0204a3-64901b01e6bmr3412888d50.53.1768469679004; Thu, 15 Jan 2026
 01:34:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com> <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
In-Reply-To: <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 15 Jan 2026 17:34:28 +0800
X-Gm-Features: AZwV_QjTArNszH-qrNgMT-T_17tzEChvNSpI6BZWzX1L0kGAzHlaV3mOKtWzKrQ
Message-ID: <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 00:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=E6=97=
=A5=E5=91=A8=E5=9B=9B 21:30=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen is futher handled by tw=
o
> > > pipes if its width exceeds a limit for a single pipe.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 ++++++++++++++++++++=
+---------
> > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d73=
5fdc2c5b9fd5ae83e6a 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, boo=
l en)
> > >         return 0;
> > >  }
> > >
> > > +/**
> > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > + * @state: Pointer to drm crtc state object
> > > + */
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > > +{
> > > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > > +
> > > +       return cstate->num_mixers;
> > > +}
> > > +
> > >  #ifdef CONFIG_DEBUG_FS
> > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > >  {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.h
> > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9=
895c4c8714ca6589b10 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_=
get_client_type(
> > >
> > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > >
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)=
;
> > > +
> > >  #endif /* _DPU_CRTC_H_ */
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562=
c3dc4e61c16c92e460c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct =
drm_plane *plane,
> > >         struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_pla=
ne_state);
> > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > >         struct drm_rect fb_rect =3D { 0 };
> > > +       const struct drm_display_mode *mode =3D &crtc_state->adjusted=
_mode;
> > >         uint32_t max_linewidth;
> > > +       u32 num_lm;
> > > +       int stage_id, num_stages;
> > >
> > >         min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > >         max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct=
 drm_plane *plane,
> > >                 return -EINVAL;
> > >         }
> > >
> > > -       /* move the assignment here, to ease handling to another pair=
s later */
> > > -       pipe_cfg =3D &pstate->pipe_cfg[0];
> > > -       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > -       /* state->src is 16.16, src_rect is not */
> > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src=
);
> > > +       num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> > >
> > > -       pipe_cfg->dst_rect =3D new_plane_state->dst;
> > > +       /* state->src is 16.16, src_rect is not */
> > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state-=
>src);
> > >
> > >         fb_rect.x2 =3D new_plane_state->fb->width;
> > >         fb_rect.y2 =3D new_plane_state->fb->height;
> > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct=
 drm_plane *plane,
> > >
> > >         max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> > >
> > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > >                         new_plane_state->fb->width, new_plane_state->=
fb->height,
> > >                         new_plane_state->rotation);
> > >
> > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg=
) > max_mdp_clk_rate) {
> > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_lin=
ewidth) {
> > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT=
_FMT " line:%u\n",
> > > -                                       DRM_RECT_ARG(&pipe_cfg->src_r=
ect), max_linewidth);
> > > -                       return -E2BIG;
> > > +       /*
> > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 m=
ixer pair
> > > +        * configs for left and right half screen in case of 4:4:2 to=
pology.
> > > +        * But we may have 2 rect to split wide plane that exceeds li=
mit with 1
> > > +        * config for 2:2:1. So need to handle both wide plane splitt=
ing, and
> > > +        * two halves of screen splitting for quad-pipe case. Check d=
est
> > > +        * rectangle left/right clipping first, then check wide recta=
ngle
> > > +        * splitting in every half next.
> > > +        */
> > > +       num_stages =3D (num_lm + 1) / 2;
> >
> > Hi Dmitry,
> > Because the plane is checked before crtc is checked in the drm framewor=
k. While
> > the topology is decided in crtc check. Thus num_lm is 0 when this funct=
ion is
> > called for the first time. As a result, the below iteration is not run
> > at all and leads
> >  to iommu warning.
>
> How does it lead to IOMMU warnings?

Because the pipe is not configured with width/height etc when the iteration=
 is
skipped. I have not found the root cause so far. But per the null IOMMU iov=
a
value, suppose it is due to DMA buffer not being prepared when DMA is start=
ed.

>
> > Do you suggest to change drm framework with adding extra crtc check bef=
ore
> > plane check, or you prefer the below line here?
> >
> > num_stages =3D max(1, (num_lm + 1) / 2);
>
> DRM framework provides enough hooks to be able to influence the order or
> operations without changing the framework. But, I'd like to point out
> that for the virtual plane case we already perform plane operations
> from dpu_crtc_atomic_check(). You can employ the same approach.

Thanks for the suggestion! I see dpu_assign_plane_resources() is called
from crtc side, which avoids the plane splitting before topology decision.
To use this method, it looks like we are enabling the virtual plane by defa=
ult.
Because the virtual plane differs from the traditional method only with the
plane splitting and resource preparation. Can we just enable the virtual
plane by default in this situation?

Jun

>
>
> --
> With best wishes
> Dmitry

