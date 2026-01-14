Return-Path: <linux-arm-msm+bounces-89021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD6D1F883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 15:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77DE3018191
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C57726ED48;
	Wed, 14 Jan 2026 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyEIhSD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5B21D3F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402112; cv=none; b=JYrLdsTDvqSVE+zohSuDT0OcNgKOLylo15zzcTHLed6nB5rQl7Z/ByEi4uqTyPi4Y2inzFrj99mgCqxHZ7n20FB/oV3Gz0AFlkcCzM3upq3JxEaE3toNkxHOKMAMcRSnxMKM3l8PC+SQtXVJxoMzZDJf2icxxSUm5kdAsbSzxJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402112; c=relaxed/simple;
	bh=Yot2vPkHbVZWH1eHaSP6/eITxeqakCtr3zwR4KHxxIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdPf8CxEUK9i9EzRLjyED/ZBa574KdP1Txh7bepEFJBqSUgo4pwTHcEt6saNLpWn3SqYwmKQ83tqB2OCYotn1cNr8fi93Dio6x8ewgTu/1L6p/i5Nq/RvfcuLrYb/QdFN9R4qEEnun593xV2AbFXf1u1WOHuvRAVBQGYEp7LaV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DyEIhSD2; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64471fcdef0so7913574d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768402110; x=1769006910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moURBLGJf5+rXV68bZZhYNA/I5Oay3dNci5O9TfNQ54=;
        b=DyEIhSD2JRtqm6aHeiaK/uJdNpkeZMxe4bnCsDrWGpb9cT1Qx1RCMVpvcGp3QHT67+
         Ni6uNO7tZg+R1+TiLqeMd3WU32CeIRH9eyEsPHO4jzzj45b8LNZCHL7q+qUx2c/U93lP
         ULt+3ctWtBFhBKnCWLxzHpHrZqbgsADhBtn3oy3VoXkMjLrOYtlfd9W0DAIGLqFK3hXW
         tfqy7WQbIzgTD+oCgbWMzNN7TtjBnVKu5lymy0qUzYH3BTUHBOVePt+17GxNwdowwqvw
         PGMYS/VR+LJTWurHUn1A3pzEOWpifozojeF+GE91hMKPQVLzbuT8aZWV8a3Yg70wrbtf
         AUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768402110; x=1769006910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=moURBLGJf5+rXV68bZZhYNA/I5Oay3dNci5O9TfNQ54=;
        b=VhIP1BcvfQBu0+gNtd0D+SFJW5tDYr2h51uTZobwKH6ADQZnLRV7xjwHzUjrsT4Cak
         UAcyZ3mPCKRRrISY6Pr1nS6U3Y9WQbAQyB2d+Vl8ODyNHJDCxdz6NhmfeNhwcBXWo0W+
         QjFmztxNLrVRfPdRu+Jl52RQXWFaxYfcJAsIawMIcFoXBxBawyKzG6RjvISv3vfvEOtL
         mfyZAmqjuCpMLc4DWCnNQl0ZJFvzacjov17JOp7hDbnESHJZ3i1i9G/coSxlDvOuT8py
         sRXDi12KT+DMcJHq0V1VJcYD7bewdoD6CnIVj9XA0n/oB1LkBVouHE58yj+fnagz+6j7
         MN6A==
X-Gm-Message-State: AOJu0YxT0yNWgFCChwUgnQo3UOZrJQDB2sa5M2WITbsS9JnErB0xdsDA
	+pIUs3ZSvDlO9zT7E1g/c6wts3SAUGdngP2Bdt6XW++wDku0LY8laZdPVcPqK5unn5NMU3TJlEB
	PgZ237LzF6a+qpoIPny/0Au8uOwlf3I5SCgC1G/p6YA==
X-Gm-Gg: AY/fxX5TpcrRpu20avslmQd5+v2uGHOtsJxv/TPcuj78GH976r1IzW/UAC4R6UACuMY
	qM4peihI/p4dZqiWnhSq2n+zv9FnA9BHEg0cRnC3HcmNb42h6456R0JEc0a66uchgHhSgUP/n++
	S+OauH+CxTazR2FTxQHZiaWK8S8qk5eRbr31Csk4t3nGzj68Lf9z529kPno/TPFCNLpdOwprseG
	e2yuil4CWdknyTt6YLJryqk9PtNJk09vWPcU7xYn/GeE4P8AKNk83MSfu3XuLF2NBMhrxQyhLNC
	Wf0KHDfTUGA=
X-Received: by 2002:a05:690c:9a01:b0:787:e779:9eb3 with SMTP id
 00721157ae682-793a1d9d67cmr45024817b3.62.1768402109292; Wed, 14 Jan 2026
 06:48:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 14 Jan 2026 22:48:17 +0800
X-Gm-Features: AZwV_QhxEXOKU22GGsX-5EC8TiJBFaRkWwxBFGCNSHzm_nmpA2a_JSQsuPnfxLw
Message-ID: <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=E6=97=A5=E5=
=91=A8=E5=9B=9B 21:30=E5=86=99=E9=81=93=EF=BC=9A
>
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
>
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---=
------
>  3 files changed, 110 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d735fdc=
2c5b9fd5ae83e6a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en=
)
>         return 0;
>  }
>
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * @state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> +{
> +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> +
> +       return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.h
> index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c=
4c8714ca6589b10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_=
client_type(
>
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562c3dc=
4e61c16c92e460c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_=
plane *plane,
>         struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
>         struct dpu_sw_pipe_cfg *pipe_cfg;
>         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +       struct dpu_sw_pipe_cfg init_pipe_cfg;
>         struct drm_rect fb_rect =3D { 0 };
> +       const struct drm_display_mode *mode =3D &crtc_state->adjusted_mod=
e;
>         uint32_t max_linewidth;
> +       u32 num_lm;
> +       int stage_id, num_stages;
>
>         min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
>         max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
>                 return -EINVAL;
>         }
>
> -       /* move the assignment here, to ease handling to another pairs la=
ter */
> -       pipe_cfg =3D &pstate->pipe_cfg[0];
> -       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> -       /* state->src is 16.16, src_rect is not */
> -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +       num_lm =3D dpu_crtc_get_num_lm(crtc_state);
>
> -       pipe_cfg->dst_rect =3D new_plane_state->dst;
> +       /* state->src is 16.16, src_rect is not */
> +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src=
);
>
>         fb_rect.x2 =3D new_plane_state->fb->width;
>         fb_rect.y2 =3D new_plane_state->fb->height;
> @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
>
>         max_linewidth =3D pdpu->catalog->caps->max_linewidth;
>
> -       drm_rect_rotate(&pipe_cfg->src_rect,
> +       drm_rect_rotate(&init_pipe_cfg.src_rect,
>                         new_plane_state->fb->width, new_plane_state->fb->=
height,
>                         new_plane_state->rotation);
>
> -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > =
max_mdp_clk_rate) {
> -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewid=
th) {
> -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT=
 " line:%u\n",
> -                                       DRM_RECT_ARG(&pipe_cfg->src_rect)=
, max_linewidth);
> -                       return -E2BIG;
> +       /*
> +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer=
 pair
> +        * configs for left and right half screen in case of 4:4:2 topolo=
gy.
> +        * But we may have 2 rect to split wide plane that exceeds limit =
with 1
> +        * config for 2:2:1. So need to handle both wide plane splitting,=
 and
> +        * two halves of screen splitting for quad-pipe case. Check dest
> +        * rectangle left/right clipping first, then check wide rectangle
> +        * splitting in every half next.
> +        */
> +       num_stages =3D (num_lm + 1) / 2;

Hi Dmitry,
Because the plane is checked before crtc is checked in the drm framework. W=
hile
the topology is decided in crtc check. Thus num_lm is 0 when this function =
is
called for the first time. As a result, the below iteration is not run
at all and leads
 to iommu warning.
Do you suggest to change drm framework with adding extra crtc check before
plane check, or you prefer the below line here?

num_stages =3D max(1, (num_lm + 1) / 2);

Jun

> +       /* iterate mixer configs for this plane, to separate left/right w=
ith the id */
> +       for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> +               struct drm_rect mixer_rect =3D {
> +                       .x1 =3D stage_id * mode->hdisplay / num_stages,
> +                       .y1 =3D 0,
> +                       .x2 =3D (stage_id + 1) * mode->hdisplay / num_sta=
ges,
> +                       .y2 =3D mode->vdisplay
> +                       };
> +               int cfg_idx =3D stage_id * PIPES_PER_STAGE;
> +
> +               pipe_cfg =3D &pstate->pipe_cfg[cfg_idx];
> +               r_pipe_cfg =3D &pstate->pipe_cfg[cfg_idx + 1];
> +
> +               drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state-=
>src);
> +               pipe_cfg->dst_rect =3D new_plane_state->dst;
> +
> +               DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> +                               " vs clip window " DRM_RECT_FMT "\n",
> +                               DRM_RECT_ARG(&pipe_cfg->src_rect),
> +                               DRM_RECT_ARG(&mixer_rect));
> +
> +               /*
> +                * If this plane does not fall into mixer rect, check nex=
t
> +                * mixer rect.
> +                */
> +               if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> +                                         &pipe_cfg->dst_rect,
> +                                         &mixer_rect)) {
> +                       memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe=
_cfg));
> +
> +                       continue;
>                 }
>
> -               *r_pipe_cfg =3D *pipe_cfg;
> -               pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 + pipe_c=
fg->src_rect.x2) >> 1;
> -               pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 + pipe_c=
fg->dst_rect.x2) >> 1;
> -               r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2;
> -               r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2;
> -       } else {
> -               memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> -       }
> +               pipe_cfg->dst_rect.x1 -=3D mixer_rect.x1;
> +               pipe_cfg->dst_rect.x2 -=3D mixer_rect.x1;
> +
> +               DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst:=
 " DRM_RECT_FMT "\n",
> +                               DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RE=
CT_ARG(&pipe_cfg->dst_rect));
> +
> +               /* Split wide rect into 2 rect */
> +               if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth)=
 ||
> +                    _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_ra=
te) {
> +
> +                       if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max=
_linewidth) {
> +                               DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_=
RECT_FMT " line:%u\n",
> +                                               DRM_RECT_ARG(&pipe_cfg->s=
rc_rect), max_linewidth);
> +                               return -E2BIG;
> +                       }
> +
> +                       memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw=
_pipe_cfg));
> +                       pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 =
+ pipe_cfg->src_rect.x2) >> 1;
> +                       pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 =
+ pipe_cfg->dst_rect.x2) >> 1;
> +                       r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2=
;
> +                       r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2=
;
> +                       DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> +                                       DRM_RECT_FMT " and " DRM_RECT_FMT=
 "\n",
> +                                       DRM_RECT_ARG(&pipe_cfg->src_rect)=
,
> +                                       DRM_RECT_ARG(&r_pipe_cfg->src_rec=
t));
> +               } else {
> +                       memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_c=
fg));
> +               }
>
> -       drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -                           new_plane_state->fb->width, new_plane_state->=
fb->height,
> -                           new_plane_state->rotation);
> -       if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> -               drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> -                                   new_plane_state->fb->width, new_plane=
_state->fb->height,
> +               drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +                                   new_plane_state->fb->width,
> +                                   new_plane_state->fb->height,
>                                     new_plane_state->rotation);
>
> +               if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> +                       drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +                                           new_plane_state->fb->width,
> +                                           new_plane_state->fb->height,
> +                                           new_plane_state->rotation);
> +       }
> +
>         pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
>
>         return 0;
> @@ -983,20 +1043,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_=
plane *plane,
>                 drm_atomic_get_new_plane_state(state, plane);
>         struct dpu_plane *pdpu =3D to_dpu_plane(plane);
>         struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> -       struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> -       struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> -       struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> -       int ret =3D 0;
> -
> -       ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> -                                         &crtc_state->adjusted_mode,
> -                                         new_plane_state);
> -       if (ret)
> -               return ret;
> +       struct dpu_sw_pipe *pipe;
> +       struct dpu_sw_pipe_cfg *pipe_cfg;
> +       int ret =3D 0, i;
>
> -       if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> -               ret =3D dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_=
cfg,
> +       for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> +               pipe =3D &pstate->pipe[i];
> +               pipe_cfg =3D &pstate->pipe_cfg[i];
> +               if (!drm_rect_width(&pipe_cfg->src_rect))
> +                       continue;
> +               DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n",=
 i);
> +               ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
>                                                   &crtc_state->adjusted_m=
ode,
>                                                   new_plane_state);
>                 if (ret)
>
> --
> 2.34.1
>

