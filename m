Return-Path: <linux-arm-msm+bounces-22390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CEE904E79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D68971F21837
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74811649DB;
	Wed, 12 Jun 2024 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HN2/YXOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217E757F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182248; cv=none; b=XPhocPZE+qfTt50NxmTKKz3o3ClGNSQVNO8V+NpDANlqefDDcqP/gMol6FRcRg0Q46gNKnOtC3nC3/GhW7P+RHtcwyx2pweD3UQz7xQPpwC9EyS7o25gBWHCyhjwSw877HKUcgqqpB7hA2Hpn+n9iDvQRqawG9ifx2Wx4J+6Kn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182248; c=relaxed/simple;
	bh=sfji93PCmqYt8IRTRtY6VwZtBaZMeXNH8EhPEdoumso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPPqDlTbA7dEv5b366/+1jrJHnH2z3wzcViogs5lEqR9CDaXOZM2PDVSqWrH5Ce9m5ydaUvHEgJpfK26JH4xIxB//shlqufF2UjjtkLwjC0qs+cynIcr+47BpL9FX6Pn79jJIlClUGXA0v8yt3XTUvCLdJW/yoD9YmUquQeHVEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HN2/YXOj; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62f86eaffbeso7422897b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718182246; x=1718787046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hNjdy7UPfu6XvaHxYP1tE+6Sgn9Tw3j/iRDWJlIZilY=;
        b=HN2/YXOj+DSCuMX6lBzXI/0bzrcvjgX1lpU/TRJaJbQwyJjWv66ThE/l8rJxGEMxan
         1woRkb1samaN7aYsbuqgMD4CSIGAqJd0J527DxJ8+Nf7j+gd9lNxMBswuKvo//15XmEo
         rT5ltBG8qbwckCpUYht2zMkM8XigcYPeUhW8bie3lZjoPnhuLxylQEc5XiHyqeBzDwys
         cO+2b3XCG+ww1PNfrbQC+uA6Ua73koV0LEEsnwWM3q/uP/ADGYoaR0tWIVT9q6lT60Oy
         DD3bKNWnXvmq1TvUi52YR+QXPmdrQG/sEP1MDQI1ej5cHj3+1piVuGGPK/tAsfuIyjIq
         LPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182246; x=1718787046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNjdy7UPfu6XvaHxYP1tE+6Sgn9Tw3j/iRDWJlIZilY=;
        b=JyZ9mxaFss64dOgMc84bkHk1vTmk1NgQ49SOiHRSxLqVPgjPui+q/8lUfBZTL7TET4
         WquDBoR3OvPQfClUCZIW47yrIDKPWx2Lv1htqGrh9lqfTolDmVb7mRIoC1NQtMcO4Kgw
         y8Ti84ov0IIInerS9JO9JalqoheoOyn66obtv6SgkMnk519pLGT9RFson0VeEe1ZgXmo
         UsjCyW8+WbpR/qCkuJa//77XlLSt5mqLgpREjEHOYvbDIH7kdk5W7C8tMoSasF//wilZ
         D6dkb/Je7J8Bl1VwH3qMrN+B8bMoOzuLwNsSGpqj3fBkddWQedqzDEasUC90ZJ7+9wAr
         M6QA==
X-Forwarded-Encrypted: i=1; AJvYcCUxrU89W/OGR8MnvrgB2ZOZkqoELruxlXpDNZSM3bkrU4gxiXLYu+O17raDadk1OY8xiZo1Npy7ATy90edyVPzy4mOZ+S61bqcjO74Pvw==
X-Gm-Message-State: AOJu0Yw+Bz7oCM4KI6TA/KobH9SU9j0QapFKAI+NPANsRjxaI46hnd5W
	5WKqYFxpskaBEgA0ggDljLI2nO9cDawlmrNQ0NRTbviMXnJgUq/CREepXhdKn45SPjzAz0dq1PA
	0ckwfcga77Poo7mv3ZMi0RjjHxrpmi6Tf/CdTug==
X-Google-Smtp-Source: AGHT+IEIep8TWUDQNYipjdR8ozOU4TsvCnB30cqeIU/L2mK6IRI2gHDnCC8z6o/4kDTLu0qtEuxMlFKxSjEfM2ymJuE=
X-Received: by 2002:a81:a705:0:b0:61a:d4ea:b856 with SMTP id
 00721157ae682-62fbd6a5654mr10701807b3.40.1718182245910; Wed, 12 Jun 2024
 01:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-13-dmitry.baryshkov@linaro.org> <0996ccd1-32b1-eaa9-0331-e0270da80da2@quicinc.com>
In-Reply-To: <0996ccd1-32b1-eaa9-0331-e0270da80da2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 11:50:35 +0300
Message-ID: <CAA8EJprJq7jFVK5hU2ByYP2QWoy1xfmCn0L3W4kYhgLRa0yDNA@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] drm/msm/dpu: allow sharing of blending stages
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jun 2024 at 04:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > It is possible to slightly bend the limitations of the HW blender. If
> > two rectangles are contiguous (like two rectangles of a single plane)
> > they can be blended using a single LM blending stage, allowing one to
> > blend more planes via a single LM.
> >
>
> Can you pls let me know the source of this optimization (assuming its
> present downstream) ?
>
> Otherwise I will have to lookup some more docs to confirm this.
>
> It certainly makes sense, that if the same layer is being split across
> two SSPP's we can certainly use the same blend stage. But want to make
> sure this is already in place somewhere and not something which was
> tried and just worked.

My source was the original 'virtual' / 'multirect' implementation in
the SDE driver.

>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 ++++++++++++++++++-----
> >   2 files changed, 37 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 794c5643584f..fbbd7f635d04 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -445,6 +445,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >
> >       uint32_t lm_idx;
> >       bool bg_alpha_enable = false;
> > +     unsigned int stage_indices[DPU_STAGE_MAX] = {};
> >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> >
> >       memset(fetch_active, 0, sizeof(fetch_active));
> > @@ -469,7 +470,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >                                          mixer, cstate->num_mixers,
> >                                          pstate->stage,
> >                                          format, fb ? fb->modifier : 0,
> > -                                        &pstate->pipe, 0, stage_cfg);
> > +                                        &pstate->pipe,
> > +                                        stage_indices[pstate->stage]++,
> > +                                        stage_cfg);
> >
> >               if (pstate->r_pipe.sspp) {
> >                       set_bit(pstate->r_pipe.sspp->idx, fetch_active);
> > @@ -477,7 +480,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >                                                  mixer, cstate->num_mixers,
> >                                                  pstate->stage,
> >                                                  format, fb ? fb->modifier : 0,
> > -                                                &pstate->r_pipe, 1, stage_cfg);
> > +                                                &pstate->r_pipe,
> > +                                                stage_indices[pstate->stage]++,
> > +                                                stage_cfg);
> >               }
>
> Is this part of the change related to this patch? We moved from
> hard-coding 0 and 1 for the stage_idx to stage_indices[pstate->stage]
> will still result in the same values of 0 and 1 right?

No. The stage can span multiple planes now, see one of the chunks below.

>
> The sharing will be achieved with the change below of doing
> pstate->stage = prev_pstate->stage.
>
> Rest of the change LGTM.
>
>
> >
> >               /* blend config update */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 2e1c544efc4a..43dfe13eb298 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -827,13 +827,6 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> > -     if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> > -             DPU_ERROR("> %d plane stages assigned\n",
> > -                       pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> > -             return -EINVAL;
> > -     }
> > -
> >       /* state->src is 16.16, src_rect is not */
> >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> >
> > @@ -971,6 +964,18 @@ static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
> >               prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> >               prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > +             if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
> > +                 pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
> > +                 pipe_cfg->dst_rect.x1 == prev_pipe_cfg->dst_rect.x2) {
> > +                     pstate->stage = prev_pstate->stage;
> > +             } else if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
> > +                        pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
> > +                        pipe_cfg->dst_rect.x2 == prev_pipe_cfg->dst_rect.x1) {
> > +                     pstate->stage = prev_pstate->stage;
> > +                     pipe->multirect_index = DPU_SSPP_RECT_0;
> > +                     prev_pipe->multirect_index = DPU_SSPP_RECT_1;
> > +             }
> > +
> >               return true;
> >       }
> >
> > @@ -1080,6 +1085,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > +     pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> > +     if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> > +             DPU_ERROR("> %d plane stages assigned\n",
> > +                       pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> > +             return -EINVAL;
> > +     }
> > +
> >       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >       r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > @@ -1221,6 +1233,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >
> >       max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> >
> > +     if (prev_pstate)
> > +             pstate->stage = prev_pstate->stage + 1;
> > +     else
> > +             pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> > +
> >       if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> >               if (!prev_pstate ||
> >                   !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
> > @@ -1267,6 +1284,12 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >               }
> >       }
> >
> > +     if (pstate->stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
> > +             DPU_ERROR("> %d plane stages assigned\n",
> > +                       dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> > +             return -EINVAL;
> > +     }
> > +
> >       return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
> >   }
> >



-- 
With best wishes
Dmitry

