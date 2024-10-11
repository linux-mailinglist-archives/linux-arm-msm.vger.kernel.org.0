Return-Path: <linux-arm-msm+bounces-34056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB768999EC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 10:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB243B20FF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7541420ADC2;
	Fri, 11 Oct 2024 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jw7q0nP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C551CDA31
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728634390; cv=none; b=hEox/grSyK8XhD3wgiw10yXGOhhWVNb2EURudME6HX4zR2WRLWZHDt1XkZKQYc2f6TKNoHVfiWxaMJWQlIhewDEoRQMN1EX0dgMk6SFVh9ri+clrdkcJt/axVlxsep2FQInm6ADH/e98Sm0UbvkO2tgN9CQNI/bWMcySQKcgQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728634390; c=relaxed/simple;
	bh=uLrYFUXBHWX2JXNYaR58oswHfyR8IdaV6UgF1BWiWW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7Hq2bqQvgY6ZIx2e363W/rLOxwadAAADTHVxPfjfKrnxog1DYxh71ZaZUS12TW+UTftpidMsHXUtgK+eAxKcpgJPz9McrfqQfGWw9mw1p9pMPDpbfqryX+GU6YiFBRkB46k6vjtIfi1MuAsPvIMd5fC7hQrcfohK9qECWGpMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jw7q0nP5; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e290200a560so1628084276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728634387; x=1729239187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xqi8+YquEXJlPFJXt9jXWmFBFMG9TT+Lb8hYw8B1kA=;
        b=Jw7q0nP5hFAlwpDVnvQ9SZUe+iix80qd0AQqrM2k7KL+sG6Ur49kidIMivkZ4GR9/2
         lGRcRLkDXHQFTuBQrSzqlI63vkpg0FSckOsAJD5dq6yWVubwhfzwbFfMwlSVq5e0UeAt
         yUkEHxnEi7BDGRAUbYwJNj+BUK3xYoAELUZ6MTcxmKIusSvM5dKOVU8rWf3uymRDtACp
         BAFJjApQLgqNP8PgxZY+4zN7itUMr8KHYDhvodC6/SlZTm2GIYiiuVPPRiVlZTA2fPEB
         iW+tRHObKhp1XYZ0ZuBn1kfJEzuSkRQIgzFsdtZ5iQRduObNBexRAEkci+xnLlDRuxs2
         XQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728634387; x=1729239187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xqi8+YquEXJlPFJXt9jXWmFBFMG9TT+Lb8hYw8B1kA=;
        b=SMqFUNPUjIa3VVC8WDDSjeVy4GPOK1koHGE7pw9JzeKJtVj+dsmfQEF0swm7S+wkSd
         fjyCqc51NDRJZU/ItuYaUkWFkqXd/50I//uKOYkQtGkgqwAdmT2bvToyeY1fMDEPdySo
         MmuJ6LT+NjzE5jpYbFuNmOgqrE6qpvuDMhIMbdekayVNZ3IRuISX5ZvPgt6HG+wf+Nd2
         zVuEgwlAc0jide8ptSMDR62SawxkcQNKp30FFadr4llIBFYJhQggg+Z7dL/qb/t6c7IR
         RzY87usmJQILbZdF68baVUJVJiDf0G8nHIEVPAUelc/T4H+8luI3/q3WOhwmtT7jABYd
         wLbA==
X-Forwarded-Encrypted: i=1; AJvYcCVywZld+KkiaIclNH7lHqugzfnyxk5CMGzobkkv5NTIO+uj1itJNjpye44D0Wn2k4Gw083ag95pmomquD9R@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zyrx9qxU5BLWdSCZllrDnQBpHgBmTQZsnBMD3M2WZ3FTaHth
	U/1q38g3mxidTJIGNAIjg+8IAv1cDpsiXAhgBFvJobOnkH/loaQUdUcA2LKezIwljP4FRAhzRmK
	Twx4BSTg3s+whbCrMIOuCy/u/5tBXsCTJRJ1mow==
X-Google-Smtp-Source: AGHT+IHHqEdEHu61NjyYbtbIw8Hhydz5tqoMqEmRPHikx10w3Hwl5aGVT/DS042WR3aWmGbkdqH6YngFoaTZ86z+72M=
X-Received: by 2002:a05:6902:1247:b0:e29:29b0:2b2a with SMTP id
 3f1490d57ef6-e2929b02cc0mr225315276.51.1728634387370; Fri, 11 Oct 2024
 01:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>
 <fbqhq7zvusll377oxi4tcr4bpgwhab2xbnfw2izotua5me4ufe@syy4jundvccf>
In-Reply-To: <fbqhq7zvusll377oxi4tcr4bpgwhab2xbnfw2izotua5me4ufe@syy4jundvccf>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 16:12:56 +0800
Message-ID: <CABymUCMcKwrUFZ=KJdS852-KkWPaGGigHr2Jo8B17_oZa6HEeA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:25PM GMT, Jun Nie wrote:
> > Clip plane into pipes per left and right half screen ROI if topology
> > is quad pipe.
>
> Why? Please provide an explanation for the reviewers not knowing the
> details.

The content of every half of screen is sent out via one interface in
dual-DSI case. The content for every interface is blended by a LM
pair, thus no content of any pipe shall cross the LM pair. We need
to clip plane into pipes per left and right half screen ROI if topology
is quad pipe.
>
> > Then split the clipped rectangle by half if the rectangle
> > width still exceeds width limit.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  6 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 99 ++++++++++++++++++++++-=
--------
> >  3 files changed, 84 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 66f745399a602..d2aca0a9493d5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1310,6 +1310,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >       return 0;
> >  }
> >
> > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
>
> I think the DPU driver uses num_foo rather than foo_num

dpu_crtc_get_num_lm()
>
> > +{
> > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +     return cstate->num_mixers;
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index 5260e2440f059..ee7cf71f89fc7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -304,4 +304,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_g=
et_client_type(
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +/**
> > + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> > + * state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
> > +
> >  #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 898fc2937954e..480a1b46aba72 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -837,10 +837,12 @@ static int dpu_plane_atomic_check_nopipe(struct d=
rm_plane *plane,
> >       struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> >       u64 max_mdp_clk_rate =3D kms->perf.max_core_clk_rate;
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > -     struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     struct dpu_sw_pipe_cfg pipe_cfg;
> >       struct drm_rect fb_rect =3D { 0 };
> > +     const struct drm_display_mode *mode =3D &crtc_state->adjusted_mod=
e;
> >       uint32_t max_linewidth;
> > +     u32 lm_num;
> > +     int lmcfg_id, lmcfg_num;
> >
> >       min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >       max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > @@ -863,13 +865,10 @@ static int dpu_plane_atomic_check_nopipe(struct d=
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
> > +     lm_num =3D dpu_crtc_get_lm_num(crtc_state);
> >
> > -     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&pipe_cfg.src_rect, &new_plane_state->src);
> >
> >       fb_rect.x2 =3D new_plane_state->fb->width;
> >       fb_rect.y2 =3D new_plane_state->fb->height;
> > @@ -884,34 +883,78 @@ static int dpu_plane_atomic_check_nopipe(struct d=
rm_plane *plane,
> >
> >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> >
> > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > +     drm_rect_rotate(&pipe_cfg.src_rect,
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
> > +      * But we may have 2 rect to split plane with 1 config for 2:2:1.
> > +      * So need to handle super wide plane splitting, and plane on rig=
ht half
> > +      * for quad-pipe case. Check dest rectangle left/right clipping
> > +      * first, then check super wide rectangle splitting in every half=
 next.
> > +      */
> > +     lmcfg_num =3D (lm_num + 1) / 2;
>
> num_stages?

OK. Then lmcfg_id   ->   stage_id
>
> > +     /* iterate mixer configs for this plane, to separate left/right w=
ith the id */
> > +     for (lmcfg_id =3D 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
> > +             struct drm_rect mixer_rect =3D {lmcfg_id * mode->hdisplay=
 / lmcfg_num, 0,
> > +                                     (lmcfg_id + 1) * mode->hdisplay /=
 lmcfg_num, mode->vdisplay};
> > +             int cfg_idx =3D lmcfg_id * PIPES_PER_LM_PAIR;
> > +             struct dpu_sw_pipe_cfg *cur_pipecfg =3D &pstate->pipe_cfg=
[cfg_idx];
> > +
> > +             drm_rect_fp_to_int(&cur_pipecfg->src_rect, &new_plane_sta=
te->src);
> > +             cur_pipecfg->dst_rect =3D new_plane_state->dst;
> > +
> > +             DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> > +                             " vs clip window " DRM_RECT_FMT "\n",
> > +                             DRM_RECT_ARG(&cur_pipecfg->src_rect),
> > +                             DRM_RECT_ARG(&mixer_rect));
> > +
> > +             /* If this plane does not fall into mixer rect, check nex=
t mixer rect */
> > +             if (!drm_rect_clip_scaled(&cur_pipecfg->src_rect, &cur_pi=
pecfg->dst_rect, &mixer_rect)) {
> > +                     memset(&pstate->pipe_cfg[cfg_idx], 0, 2 * sizeof(=
struct dpu_sw_pipe_cfg));
> > +                     memset(&pstate->pipe[cfg_idx], 0, 2 * sizeof(stru=
ct dpu_sw_pipe));
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
> > +             cur_pipecfg->valid =3D true;
>
> ... and checks have been broken up to now. This isn't good.

Will move this patch before the plane checking patch.
>
> > +             cur_pipecfg->dst_rect.x1 -=3D mixer_rect.x1;
> > +             cur_pipecfg->dst_rect.x2 -=3D mixer_rect.x1;
> > +
> > +             DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst:=
 " DRM_RECT_FMT "\n",
> > +                             DRM_RECT_ARG(&cur_pipecfg->src_rect), DRM=
_RECT_ARG(&cur_pipecfg->dst_rect));
> > +
> > +             /* Split super wide rect into 2 rect */
> > +             if ((drm_rect_width(&cur_pipecfg->src_rect) > max_linewid=
th) ||
> > +                  _dpu_plane_calc_clk(mode, cur_pipecfg) > max_mdp_clk=
_rate) {
> > +                     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->p=
ipe_cfg[cfg_idx + 1];
> > +
> > +                     if (drm_rect_width(&cur_pipecfg->src_rect) > 2 * =
max_linewidth) {
> > +                             DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_=
RECT_FMT " line:%u\n",
> > +                                             DRM_RECT_ARG(&cur_pipecfg=
->src_rect), max_linewidth);
> > +                             return -E2BIG;
> > +                     }
> > +
> > +                     memcpy(r_pipe_cfg, cur_pipecfg, sizeof(struct dpu=
_sw_pipe_cfg));
> > +                     cur_pipecfg->src_rect.x2 =3D (cur_pipecfg->src_re=
ct.x1 + cur_pipecfg->src_rect.x2) >> 1;
> > +                     cur_pipecfg->dst_rect.x2 =3D (cur_pipecfg->dst_re=
ct.x1 + cur_pipecfg->dst_rect.x2) >> 1;
>
> pipe_cfg. If you need, rename the topmost var name.

OK.  pipe_cfg_cur ?

>
> > +                     r_pipe_cfg->src_rect.x1 =3D cur_pipecfg->src_rect=
.x2;
> > +                     r_pipe_cfg->dst_rect.x1 =3D cur_pipecfg->dst_rect=
.x2;
> > +                     r_pipe_cfg->valid =3D true;
> > +                     DPU_DEBUG_PLANE(pdpu, "Split super wide plane int=
o:"
> > +                                     DRM_RECT_FMT " and " DRM_RECT_FMT=
 "\n",
> > +                                     DRM_RECT_ARG(&cur_pipecfg->src_re=
ct),
> > +                                     DRM_RECT_ARG(&r_pipe_cfg->src_rec=
t));
> > +             } else {
> > +                     memset(&pstate->pipe_cfg[cfg_idx + 1], 0, sizeof(=
struct dpu_sw_pipe_cfg));
> > +                     memset(&pstate->pipe[cfg_idx + 1], 0, sizeof(stru=
ct dpu_sw_pipe));
>
> Please keep using r_pipe_cfg here.

OK, will make r_pipe_cfg a variable in function scope, not bracket scope.
>
> > +             }
> >
> > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > -                         new_plane_state->fb->width, new_plane_state->=
fb->height,
> > -                         new_plane_state->rotation);
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > +             drm_rect_rotate_inv(&cur_pipecfg->src_rect,
> >                                   new_plane_state->fb->width, new_plane=
_state->fb->height,
> >                                   new_plane_state->rotation);
> > +     }
> >
> >       pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

