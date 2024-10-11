Return-Path: <linux-arm-msm+bounces-34055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0218999E9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BBB1F22038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2863120ADCC;
	Fri, 11 Oct 2024 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nTfEgFaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D220A5FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633360; cv=none; b=Ws9N+jIwUH3WEuA3gi8TQdHXXzkpFK6P9K/gISCiXx7Frz4KnH5P5oGirKneItpe7wKRs+UD5hzI2KIkuuXBWXMmL/6A1EHknSxpnAeW6Imx1XyvFnHm38IIO5h/CIJSeOGA++tHSiphuWbIsSIjEhZYHR99EujCp97woZUVpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633360; c=relaxed/simple;
	bh=7TNOKICrw09ne4r6APWOT1VcA/SrS9F99vRwBKQFO+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5xZ5Xez6jt7xr88p25RV3/TLJ3wWBi5KZQKbiTDj8cky0qv0CZWS5a5+HOCRDmUQ/88/AIpgdxMUP5tg6QWGHG4UNrwx2mUXLcmGBk0efhWGVmmUo/qcLSwQs/+3qCrfOJ/3Vhs97gSd9HR9pNgVcw6GPELikpJIXVBgDJs1ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nTfEgFaE; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e290333a62cso1572609276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728633357; x=1729238157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0jvr97BuxiETKruxRFgol82j0ZmSNukoUptXHdstGU=;
        b=nTfEgFaEtsyr+EgOkEWg9FHyVuoIwIIEf+xiZkUp2d4teYY0fDilVwZ0hPdkdgT33D
         O137+WAdjd3rxRMvhwbnEpSrTpDGv6pkz3S/VDtGf5i6Q+ZRSrnawgqYxW7ozGYOrJ12
         PlHM0zy4KDjQgTRoAQUKKiySXyyvxYxq+un2E9LI9BK65mOgQ+E844h7g6WbqOdVjKx7
         eb9xTDO28ywi8+lz1kcAr0xV4FinSw53CkKB2I8GhzHTNgsF0Notby+pY4SlkE1tO/oY
         6FXclrpblWt6VvHN2aUt9If5laK1TCYKhYsxTEC9T8Wdp7oMhq1WTawvjbnwaw4X4ElH
         Cirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728633357; x=1729238157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0jvr97BuxiETKruxRFgol82j0ZmSNukoUptXHdstGU=;
        b=h4uEUVBcA+3gqiQ2yWPZCKm+awKI0a+CBRxzFj5JX6OntRG2Ny3+VJ/M4q7aCxTp67
         rusAw3/0QCtjw3EiNJbZGvYWEF+BcDiDtV98e6nKVCNQ9LaNKIMooJ8WUPPI9HFhonl9
         aRkKjZvHdV5h9/khZhiq+wWA5CAaaF9WJ5XkKiIdYC7MR7TtB03ovGoGzRwMl9xgDgvC
         FYihBS3MoFh/3bcSXm8hwcnj7xvxcJ9uTXF/OG1lZcgnP4g2g9kj0yX6CVt9D6LDFd9J
         SUyGHrHrIYd65YgHiYl58KCcBA88XtuSDJNkVGGrpqm4/IHUcf9s0Oy+R++4JwnkjovE
         Sr3w==
X-Forwarded-Encrypted: i=1; AJvYcCUx2mN3iL/R+0nvjw8WfyVpbzLdbtFk80ukTnVc9bq4YypX6jUDdgtcoFjeKNvghBo+lEUhnk/3OoGXSgvc@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVgp5dwAYN7wg0Z9K41tKBtyZ1JMtQRPRbXIjHT7anLIgOPGQ
	ZISAuLoqTsm90TgYtWyAvSr+9kah4dSnmx3Ok1E7Z4AkKh/MU8AU6UdGrr9hrD3HX567sdKOYfL
	v6otcYDBQNWa13NCDVnz9cyG9xB1fn6GAoWYpHg==
X-Google-Smtp-Source: AGHT+IE/r6hzL3lwV08dSNtczgOs3siT6XXHp4kLInDfgaPgX/o70fkd03mEG5Nam6IAVjb3jN3/6DZS5fPuQ8ppxOI=
X-Received: by 2002:a05:6902:cc9:b0:e29:e81:fe45 with SMTP id
 3f1490d57ef6-e2919def3c5mr1403380276.35.1728633357128; Fri, 11 Oct 2024
 00:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-10-76d4f5d413bf@linaro.org>
 <j2ws4q45uwmk4anzgz32ckzsbuc32zngmnybynxoyvgtezu6kr@5e2hxhfsmbtf>
In-Reply-To: <j2ws4q45uwmk4anzgz32ckzsbuc32zngmnybynxoyvgtezu6kr@5e2hxhfsmbtf>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 15:55:46 +0800
Message-ID: <CABymUCPQA0tb1VhtbwQq8LHQMorxYf4rmC9td3oXFzvR9rTUEg@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/msm/dpu: Support quad-pipe in SSPP checking
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:23PM GMT, Jun Nie wrote:
> > Move requreiment check to routine of every pipe check. Because there is
>
> s/Because there is/There will be/
>
> > multiple SSPPs for quad-pipe case in future.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 86 ++++++++++++++-------=
--------
> >  2 files changed, 44 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index fc54625ae5d4f..05b92ff7eb529 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -143,11 +143,13 @@ struct dpu_hw_pixel_ext {
> >   *             such as decimation, flip etc to program this field
> >   * @dest_rect: destination ROI.
> >   * @rotation: simplified drm rotation hint
> > + * @valid: notify that this pipe and config is in use
>
> This is not related to code move, is it? And if it is, it should be
> described in the commit message.

Will move this part to plane splitting patch and add commit message
to address this valid flag.
>
> >   */
> >  struct dpu_sw_pipe_cfg {
> >       struct drm_rect src_rect;
> >       struct drm_rect dst_rect;
> >       unsigned int rotation;
> > +     bool valid;
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 9a8fbeec2e1e8..904ebec1c8a18 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -739,12 +739,40 @@ static int dpu_plane_check_inline_rotation(struct=
 dpu_plane *pdpu,
> >  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >               struct dpu_sw_pipe *pipe,
> >               struct dpu_sw_pipe_cfg *pipe_cfg,
> > -             const struct msm_format *fmt,
> > -             const struct drm_display_mode *mode)
> > +             const struct drm_display_mode *mode,
> > +             struct drm_plane_state *new_plane_state)
> >  {
> >       uint32_t min_src_size;
> >       struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> >       int ret;
> > +     const struct msm_format *fmt;
> > +     uint32_t supported_rotations;
> > +     const struct dpu_sspp_cfg *pipe_hw_caps;
> > +     const struct dpu_sspp_sub_blks *sblk;
> > +
> > +     pipe_hw_caps =3D pipe->sspp->cap;
> > +     sblk =3D pipe->sspp->cap->sblk;
> > +
> > +     /*
> > +      * We already have verified scaling against platform limitations.
> > +      * Now check if the SSPP supports scaling at all.
> > +      */
> > +     if (!sblk->scaler_blk.len &&
> > +         ((drm_rect_width(&new_plane_state->src) >> 16 !=3D
> > +           drm_rect_width(&new_plane_state->dst)) ||
> > +          (drm_rect_height(&new_plane_state->src) >> 16 !=3D
> > +           drm_rect_height(&new_plane_state->dst))))
> > +             return -ERANGE;
> > +
> > +     fmt =3D msm_framebuffer_format(new_plane_state->fb);
> > +
> > +     supported_rotations =3D DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0=
;
> > +
> > +     if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> > +             supported_rotations |=3D DRM_MODE_ROTATE_90;
> > +
> > +     pipe_cfg->rotation =3D drm_rotation_simplify(new_plane_state->rot=
ation,
> > +                                                supported_rotations);
> >
> >       min_src_size =3D MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
> >
> > @@ -920,49 +948,19 @@ static int dpu_plane_atomic_check_pipes(struct dr=
m_plane *plane,
> >               drm_atomic_get_new_plane_state(state, plane);
> >       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > -     const struct msm_format *fmt;
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     uint32_t supported_rotations;
> > -     const struct dpu_sspp_cfg *pipe_hw_caps;
> > -     const struct dpu_sspp_sub_blks *sblk;
> > -     int ret =3D 0;
> > -
> > -     pipe_hw_caps =3D pipe->sspp->cap;
> > -     sblk =3D pipe->sspp->cap->sblk;
> > -
> > -     /*
> > -      * We already have verified scaling against platform limitations.
> > -      * Now check if the SSPP supports scaling at all.
> > -      */
> > -     if (!sblk->scaler_blk.len &&
> > -         ((drm_rect_width(&new_plane_state->src) >> 16 !=3D
> > -           drm_rect_width(&new_plane_state->dst)) ||
> > -          (drm_rect_height(&new_plane_state->src) >> 16 !=3D
> > -           drm_rect_height(&new_plane_state->dst))))
> > -             return -ERANGE;
> > -
> > -     fmt =3D msm_framebuffer_format(new_plane_state->fb);
> > -
> > -     supported_rotations =3D DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0=
;
> > -
> > -     if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> > -             supported_rotations |=3D DRM_MODE_ROTATE_90;
> > -
> > -     pipe_cfg->rotation =3D drm_rotation_simplify(new_plane_state->rot=
ation,
> > -                                                supported_rotations);
> > -     r_pipe_cfg->rotation =3D pipe_cfg->rotation;
> > -
> > -     ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> > -                                       &crtc_state->adjusted_mode);
> > -     if (ret)
> > -             return ret;
> > +     struct dpu_sw_pipe *pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > +     int ret =3D 0, i;
> >
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> > -             ret =3D dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_=
cfg, fmt,
> > -                                               &crtc_state->adjusted_m=
ode);
> > +     for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> > +             pipe =3D &pstate->pipe[i];
> > +             pipe_cfg =3D &pstate->pipe_cfg[i];
> > +             if (!pipe_cfg->valid || !pipe->sspp)
> > +                     break;
>
> And... this check broke display support at this point, didn't it? It's
> never set, so none of the pipes are going to be checked.

Yeah, no pipe is checked. It passes real test without the check luckily.
Will move plane splitting patch before this check patch.

- Jun

>
> > +             DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n",=
 i);
> > +             ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> > +                                               &crtc_state->adjusted_m=
ode,
> > +                                               new_plane_state);
> >               if (ret)
> >                       return ret;
> >       }
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

