Return-Path: <linux-arm-msm+bounces-61072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA3AD6961
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDD43ABF02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 07:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64F0217704;
	Thu, 12 Jun 2025 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TW3h+wiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F62153CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714286; cv=none; b=qRYOwpRYVGx6SbiV/JmHdZ+Vi7eyoZArXCLIhoHlQ3H47MxgEZaaUHZgMRQRXCnwqh2H/KKZFfE5TcPmvkvfYiLE4355c2LVKdpIMA45n8EWE6TRQYzjF4k20Q1o0zXfEm5PF3h5VKxYUJw2+w1M+BEgUxpw5tvpC17QBg0oIZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714286; c=relaxed/simple;
	bh=jpduxG508I5+L+PumVENzjbRdk3jxhluXgEXuF1Vlh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5oReTeHZzFKCZu6MQCPoUFgL9knnq9g1uIOrcRLhqeQzBwjrpm29O8ktjga1cHfQkCaKaxwejPlNsV+Lbusf6TAZ886dl3HqJHS71IcGNN+OhXzqtmgx5FpaXCke6tw0dFEmfu69djHBxMVVAQH6pAgv7Y1sTH5NUiBRkIZHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TW3h+wiY; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e77831d68so5723397b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749714284; x=1750319084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bey/QopOQhAz9in3qPDYj1tdW3PjSItIhwNmUsRkUcw=;
        b=TW3h+wiYvUu4yez6tqZ44PdhKuCjF5ob72+vGTBhVmp0cdXKnll+KytG3Mk1XnkdJh
         SVu+VDWjW1GBNqoTO+QFT2CRFPs1vC3BZDpqR7PGZsUz5zHbSOb6V9b8A9WvxdLBMTiV
         gi6wqaC0o7OpCM2kX6OcH1Z874ti645uwhVwFcNtdpTS8A/LzdzVcoYgBwcDOgOJJi2g
         2jMQQNvCLrBxZO4PLSls3CzDNMNa/KfhtKa7pIlHy5lGoNyoKkeripJU5DtawnjqYC3f
         KjBQPEEDS1b/u7XxwMhBwf2Qx2ZhCx9oPY7FqS7tZ1KykpJEFEAiq87ilrowWzKG7aw5
         MYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714284; x=1750319084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bey/QopOQhAz9in3qPDYj1tdW3PjSItIhwNmUsRkUcw=;
        b=Tq0Eds/JCaNf7qqopOWwdDkExL5SHn/UvDvJQ3bNlRD/Nt1MisMwlDoZ2oWcV/uJV7
         7ORc18oWf5/f5gRb5rP8N/+7ZpMFWpVwHHjhTmsjPR8YWiWFPRrJWkoBP/Qf4WX9hnjx
         OgNIieDr9Nb1em9H3BvMndQQCrZPT2WzFik0ztjlsEgzl7vynN0ksiY/ULBJaUVDSUvv
         YI2iIRN5C+Tjghq4/MpayMlN9fa3mTcBGQNM6VkyB//4ZVJ+EBXak4Oy2yiddKsbagR5
         6RU6xyxMkl15/ENKUwe/j27oPrkrRg+BOzACFhdJTB8ptk1wT6BPaKuID5hLD3OGxH6x
         m3MA==
X-Forwarded-Encrypted: i=1; AJvYcCU7GdSjoWZHO33mP8xtLyxCHESAViQUfuzDCp5mTqUDRYNEx4AJBRwhVzbk9/xGom6FllAnjsFTdZbPR2JM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq/qZxET7k6lpoQ0KxFkrW2UrVqAM9zWlfdxEL6/MRtuK26TzD
	JhkKQZ2XWlwlgrWNUr+fuu4qnYKCaQo0RKvmNPL5xrXxfvALn09fGBwDIXRk1wh/OdOVlAdNBJ5
	hiJdOPqlUYyVBY5fwgtApp57MCrRBGXdojXxxfpI+0w==
X-Gm-Gg: ASbGncvcJH/4omAJWGY7Kuuwd1gf5G3I8CuT/MtZ/lGUULC96YqTNblcEko12c8fdRz
	o4+aXVzg7RKRVjMSKOQiKgS3XiM8xwCsB9PLZSgmE9brWctmdBY1i+iBIiZBS0BarJvGc0p1UtY
	vgthYcyrnfxk0ZeVprOnUjhzYgpGDl4qMtLvl/3n3L8Q==
X-Google-Smtp-Source: AGHT+IFdOybMwmC50Y2TLodQhVkA3vk2OAc6BeWCZeVoRAEn4IDsweFt+dTs+m7K3ehtbUdKRX/l2KQowqE2aoxpNkc=
X-Received: by 2002:a05:690c:60c6:b0:70c:90af:154 with SMTP id
 00721157ae682-7114ed6a1c6mr40554667b3.20.1749714283621; Thu, 12 Jun 2025
 00:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org> <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
In-Reply-To: <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Jun 2025 15:44:32 +0800
X-Gm-Features: AX0GCFsO_nCI8egougDr63n_gTKnTwM5DYwkqcQjLkSyPF363OFA-OnbDdeQldY
Message-ID: <CABymUCOx-kJ0FpZnvTPAT9i-kvcA8Bs8WxFZZWQXbLZ2Koobpg@mail.gmail.com>
Subject: Re: [PATCH v11 11/12] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
6=E6=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 18:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jun 03, 2025 at 03:10:10PM +0800, Jun Nie wrote:
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
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++-=
--------
> >  3 files changed, 110 insertions(+), 40 deletions(-)
> >
> > @@ -886,35 +887,94 @@ static int dpu_plane_atomic_check_nosspp(struct d=
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
>
> I thought we agreed to loop over all stages, dropping the need for
> num_lm.

num_stages is needed here, so that the plane can be cropped into left/right
half of LCD and result pipe will be handled by 2 stages in quadpipe case.
While only 1 stage is involved in 1 or 2 pipe case and the crop operation
does not make a real impact. If we do not care num_lm and use 2 stages
by default, then we are forcing quad-pipe. Do you have any suggestion?

>
> > +     /* iterate mixer configs for this plane, to separate left/right w=
ith the id */
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> > +             struct drm_rect mixer_rect =3D {
> > +                     .x1 =3D stage_id * mode->hdisplay / num_stages,
> > +                     .y1 =3D 0,
> > +                     .x2 =3D (stage_id + 1) * mode->hdisplay / num_sta=
ges,

The crop window is calculated with num_stages here.

> > +                     .y2 =3D mode->vdisplay
> > +                     };
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
> > +
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
> >
> > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > -                         new_plane_state->fb->width, new_plane_state->=
fb->height,
> > -                         new_plane_state->rotation);
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > -                                 new_plane_state->fb->width, new_plane=
_state->fb->height,
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
> > @@ -997,20 +1057,17 @@ static int dpu_plane_atomic_check_sspp(struct dr=
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
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

