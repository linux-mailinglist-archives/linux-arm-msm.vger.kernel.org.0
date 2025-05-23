Return-Path: <linux-arm-msm+bounces-59200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899AAC20E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33E8A18846E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7BF22A7E1;
	Fri, 23 May 2025 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PFqLz5KY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCE322A4F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995706; cv=none; b=ZKrH9Dick5QVk8gHqkRd4iklvcGqO2VTwhkaJ6qu3wc1fkFrD6suXZ8eQ4WehHdUIC+pU/hk+ZsQvfKF+L6Sjra0KkhlY9sUKCYYtsKZrpSh7abid/02JIH+LKMAq3JtXPqj6TmMMUH+m655NzS1o3Skp9yLLELzNYkDXUNH/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995706; c=relaxed/simple;
	bh=tWw8nSqfzpXdcPQRvieHq9A/TnZ5bCU3FEahy5Grv2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsOOv6JchB8TGyNOUXX6rkltwYA0JmsbhB8wMrZrbgNxw/66hvcadjIOgU6LP5uytmiS9rKiiJkz21dEFFykyY1EX6dZodG0ksLnboYkBjpE4GWMgYEXQFJXZsBu4QyqkYPd2UY8AzifpAT9HASKpl9Dk/ARYvKR4vUKBMoinYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PFqLz5KY; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7d5c72167bso695845276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 03:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747995704; x=1748600504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7emrg8zNxQVeudQUvRDXFsxfsO9owlAv3fztOkgYQCk=;
        b=PFqLz5KYsk5qY3wDXmDqIas+3qOrI2fhtKOWXtkYY9dUzCX768UFeBmb/8FnrAQiim
         Yo4aH6DtW43/bcvsrsfEQE4uQsfggXJ6Woio40g8BkpBwbdB1arBfM8xONHlupULcSz1
         j4Lz4ybClH4CdiNA4M71uM/ihj2pM4rzRrkkCB7Qj+6J9qSSnq2YafrcrK2jX1bDNK/u
         8Wsq0ZF/W+zP6xADKi13+306O6LOn4lDKC1WNjez/F14WxHEnLQkgJ1MpnZqZlBVlHS1
         YgBdHFxLP2Go1jXA+RNM9lMhKCaRcNcJdt78jJDLmHA4bUfHaHebkN+j1G3/ltZwHEul
         cagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995704; x=1748600504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7emrg8zNxQVeudQUvRDXFsxfsO9owlAv3fztOkgYQCk=;
        b=h2iZ+9fqy0gTmwgErBF/cjQZ9GR21rApilDD/JSYb5JiU+poPBGwUwdBMTcoLoe5t2
         xfDqc7dI2Huns/b4DzEISGnrIG/3Htz10fHhjlw3Pah3MXqqWXC0r1vIzs5f8dopMKJl
         lpG3YixqBvT7kFmIGFR7O9wRmURfPm55XSeWlk8jUWBOGPyUmwPlvqAI5A4fy8vJ7cpW
         LVRE9vELmZ2AFONV1rNpxQlZdOorZ7lbr9Pk9czjqjBiXuRpKIvkzFoSjK7OfsOn8yaB
         YcW5V4z9CCSHd4VkwcbmC88XZsOMKA0TJc7cik/Cw+jB65wVOij+Bbfdnqe9OMDMqMvj
         LJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdf95IETadWQ4S4xwLIqS2gjWW+GMBReT+wZhQNnDVA/o6sh6YutYGAEWWtropNFK3NAy8qbPEo0FduCM2@vger.kernel.org
X-Gm-Message-State: AOJu0YyrjT3ScbOCB4DBc1RBFE/1h/i6B9jNjCwT/e6KwiH95TMPn5nZ
	nbJ/H8KBameDCMEbxtcPHR55g7rwpvLRN43JRUmLrbQb4o4OmrWy0j0BDTHSPVb7VYq39UFnY0i
	DSj3nrGmg65Nocj1p1nk5RTYyIlwFm8jfDvDTIUre7m2thMYhj+P81WQ3Yw==
X-Gm-Gg: ASbGncs/SPRGWhOK9jrtD4+7MH6qxcddD6CXvACSbuNUZdCcgz6HF6RpKrEH9ltVj7b
	2lUC3PrdeyaJ0tVU+f5o7Y61Aq0d4TGLMYyvD7/H138bTsrzAzXBnuvxkd/Lc6Aj6dwSmZrA5ja
	d5DGngVVfINfTMwztWj/tLGUFSD8O0cJnXD9Nfqq01ro9D3o7VWHVoVFusoCIW6WDIBP0=
X-Google-Smtp-Source: AGHT+IGo3wsqsCeLRtybGJ1nIQF2WJZ39Z7MG7rmt5iXx9tykxIP9+bekBEtxBS/9aOGAVEzQqUddwmdQwR4Nr/NBLc=
X-Received: by 2002:a05:6902:102e:b0:e7b:9efc:1155 with SMTP id
 3f1490d57ef6-e7d7cdf8c27mr3377942276.14.1747995703623; Fri, 23 May 2025
 03:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-13-f7b273a8cc80@linaro.org> <974194c2-08fd-4866-9a4b-5cb58eca9a20@quicinc.com>
In-Reply-To: <974194c2-08fd-4866-9a4b-5cb58eca9a20@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 23 May 2025 18:21:32 +0800
X-Gm-Features: AX0GCFvIK6zc5HlKRjTf8juldvSBsCJYJCZixYXxNHP9XcY_mSYF_oh6i6_0juA
Message-ID: <CABymUCNuL2Bn1KC4k0YS2xciL-53VrSs8-QtxoMMdKOMU8aW1g@mail.gmail.com>
Subject: Re: [PATCH v9 13/14] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B45=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=BA=94 05:24=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 5/6/2025 8:47 AM, Jun Nie wrote:
> > The content of every half of screen is sent out via one interface in
> > dual-DSI case. The content for every interface is blended by a LM
> > pair in quad-pipe case, thus a LM pair should not blend any content
> > that cross the half of screen in this case. Clip plane into pipes per
> > left and right half screen ROI if topology is quad pipe case.
> >
> > The clipped rectangle on every half of screen is futher handled by two
> > pipes if its width exceeds a limit for a single pipe.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 134 +++++++++++++++++++++=
---------
> >   3 files changed, 107 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index f35cb1f7a7d2c2c63b4228bc47b85bb57cddbe6b..a56d68de219910a82783029=
3e8ff24f4cdee74e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1560,6 +1560,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >       return 0;
> >   }
> >
> > +/**
> > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > + * @state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > +{
> > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +     return cstate->num_mixers;
> > +}
> > +
> >   #ifdef CONFIG_DEBUG_FS
> >   static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >   {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a989=
5c4c8714ca6589b10 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_ge=
t_client_type(
> >
> >   void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >   #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index de3f52d743e1d1f11ae8721a316b9872d4139069..cf2b4d5cb0ccc144c2cf8fd=
227c862b0b6e7725f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -831,8 +831,12 @@ static int dpu_plane_atomic_check_nosspp(struct dr=
m_plane *plane,
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> >       struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     struct dpu_sw_pipe_cfg init_pipe_cfg;
> >       struct drm_rect fb_rect =3D { 0 };
> > +     const struct drm_display_mode *mode =3D &crtc_state->adjusted_mod=
e;
> >       uint32_t max_linewidth;
> > +     u32 num_lm;
> > +     int stage_id, num_stages;
> >
> >       min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >       max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > @@ -855,13 +859,10 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> >               return -EINVAL;
> >       }
> >
> > -     /* move the assignment here, to ease handling to another pairs la=
ter */
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     /* state->src is 16.16, src_rect is not */
> > -     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +     num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> >
> > -     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src=
);
> >
> >       fb_rect.x2 =3D new_plane_state->fb->width;
> >       fb_rect.y2 =3D new_plane_state->fb->height;
> > @@ -886,35 +887,91 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> >
> >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> >
> > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > +     drm_rect_rotate(&init_pipe_cfg.src_rect,
> >                       new_plane_state->fb->width, new_plane_state->fb->=
height,
> >                       new_plane_state->rotation);
> >
> > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > =
max_mdp_clk_rate) {
> > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewid=
th) {
> > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT=
 " line:%u\n",
> > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect)=
, max_linewidth);
> > -                     return -E2BIG;
> > +     /*
> > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer=
 pair
> > +      * configs for left and right half screen in case of 4:4:2 topolo=
gy.
> > +      * But we may have 2 rect to split wide plane that exceeds limit =
with 1
> > +      * config for 2:2:1. So need to handle both wide plane splitting,=
 and
> > +      * two halves of screen splitting for quad-pipe case. Check dest
> > +      * rectangle left/right clipping first, then check wide rectangle
> > +      * splitting in every half next.
> > +      */
> > +     num_stages =3D (num_lm + 1) / 2;
> > +     /* iterate mixer configs for this plane, to separate left/right w=
ith the id */
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> > +             struct drm_rect mixer_rect =3D {stage_id * mode->hdisplay=
 / num_stages, 0,
> > +                                     (stage_id + 1) * mode->hdisplay /=
 num_stages,
> > +                                     mode->vdisplay};
>
> Hi Jun,
>
> Nit: can you specify the fields when initializing the drm_rect struct her=
e?
>
> e.g.:
>
> mixer_rect =3D {
>         .x1 =3D ...,
>         .y1 =3D ...
>         ...
> }
>
Will do.

> > +             int cfg_idx =3D stage_id * PIPES_PER_STAGE;
> > +
> > +             pipe_cfg =3D &pstate->pipe_cfg[cfg_idx];
> > +             r_pipe_cfg =3D &pstate->pipe_cfg[cfg_idx + 1];
> > +
> > +             drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state-=
>src);
> > +             pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +
> > +             DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> > +                             " vs clip window " DRM_RECT_FMT "\n",
> > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > +                             DRM_RECT_ARG(&mixer_rect));
> > +
> > +             /*
> > +              * If this plane does not fall into mixer rect, check nex=
t
> > +              * mixer rect.
> > +              */
> > +             if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> > +                                       &pipe_cfg->dst_rect,
> > +                                       &mixer_rect)) {
> > +                     memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe=
_cfg));
> > +
> > +                     continue;
> >               }
> >
> > -             *r_pipe_cfg =3D *pipe_cfg;
> > -             pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 + pipe_c=
fg->src_rect.x2) >> 1;
> > -             pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 + pipe_c=
fg->dst_rect.x2) >> 1;
> > -             r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2;
> > -             r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2;
> > -     } else {
> > -             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > -     }
> > +             pipe_cfg->dst_rect.x1 -=3D mixer_rect.x1;
> > +             pipe_cfg->dst_rect.x2 -=3D mixer_rect.x1;
> > +
> > +             DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst:=
 " DRM_RECT_FMT "\n",
> > +                             DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RE=
CT_ARG(&pipe_cfg->dst_rect));
> >
> > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > -                         new_plane_state->fb->width, new_plane_state->=
fb->height,
> > -                         new_plane_state->rotation);
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > -                                 new_plane_state->fb->width, new_plane=
_state->fb->height,
> > +             /* Split wide rect into 2 rect */
> > +             if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth)=
 ||
> > +                  _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_ra=
te) {
> > +
> > +                     if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max=
_linewidth) {
> > +                             DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_=
RECT_FMT " line:%u\n",
> > +                                             DRM_RECT_ARG(&pipe_cfg->s=
rc_rect), max_linewidth);
> > +                             return -E2BIG;
> > +                     }
> > +
> > +                     memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw=
_pipe_cfg));
> > +                     pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 =
+ pipe_cfg->src_rect.x2) >> 1;
> > +                     pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 =
+ pipe_cfg->dst_rect.x2) >> 1;
> > +                     r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2=
;
> > +                     r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2=
;
> > +                     DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> > +                                     DRM_RECT_FMT " and " DRM_RECT_FMT=
 "\n",
> > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect)=
,
> > +                                     DRM_RECT_ARG(&r_pipe_cfg->src_rec=
t));
> > +             } else {
> > +                     memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_c=
fg));
> > +             }
> > +
> > +             drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > +                                 new_plane_state->fb->width,
> > +                                 new_plane_state->fb->height,
> >                                   new_plane_state->rotation);
> >
> > +             if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > +                     drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > +                                         new_plane_state->fb->width,
> > +                                         new_plane_state->fb->height,
> > +                                         new_plane_state->rotation);
> > +     }
> > +
> >       pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> >
> >       return 0;
> > @@ -954,20 +1011,17 @@ static int dpu_plane_atomic_check_sspp(struct dr=
m_plane *plane,
> >               drm_atomic_get_new_plane_state(state, plane);
> >       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     int ret =3D 0;
> > -
> > -     ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> > -                                       &crtc_state->adjusted_mode,
> > -                                       new_plane_state);
> > -     if (ret)
> > -             return ret;
> > +     struct dpu_sw_pipe *pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > +     int ret =3D 0, i;
> >
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
>
> Any reason why this check was dropped?
>
> Thanks,
>
> Jessica Zhang

Because we have a pipe array now and will loop on it, not just the 2nd pipe=
.
It is converted to below 2 lines, as sspp is assigned only for valid pipe.
+               if (!pipe->sspp)
+                       continue;

>
> > -             ret =3D dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_=
cfg,
> > +     for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> > +             pipe =3D &pstate->pipe[i];
> > +             pipe_cfg =3D &pstate->pipe_cfg[i];
> > +             if (!pipe->sspp)
> > +                     continue;
> > +             DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n",=
 i);
> > +             ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> >                                                 &crtc_state->adjusted_m=
ode,
> >                                                 new_plane_state);
> >               if (ret)
> >
>

