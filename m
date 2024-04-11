Return-Path: <linux-arm-msm+bounces-17296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C68A2108
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 23:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2991F22DF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0CA36B08;
	Thu, 11 Apr 2024 21:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpJWQQAo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C662942D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712871785; cv=none; b=kRT+JuutDFXtPty9SlUShbUzOK81/EYzFxV6igV/s+1LsvH15R8hmYM2+ZB24v2Qf0F5YrrFvVL04KzoW9LntuvxKzIFkmtF1UETGjWBZZnFxFGLai33qNXemvA2uBYqpxGf+I0cxaEL+peStoSfMDS1x7gEv1wKpAwc/oij6B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712871785; c=relaxed/simple;
	bh=24FJbaxrefo/bA9g+rhflfSaEx789/Uo/qcNTQs4WAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUhyx4zASJsaijegPMnIKQ8N6eoOArIPPUSbbd6ztPVNR2LTQYWbXyXHcjJRQ/ZgLrrZiRZW9yENH072FRZ39sSzNGcNwq6UdW4EkSveM4Ica8QzaNdygJOHLBw+NsUMBbxQ7HznGG+MyvYxyNImO7zxDYeNvKH/bD5n4Kt/4z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpJWQQAo; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6153d85053aso2183017b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712871783; x=1713476583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6bYuYlDD4bikRNQjIGcc6KvKj6VbfxrQTctYAm5dxiY=;
        b=VpJWQQAo/6o9Ri6AB7Ec6Emjr4NoeA9dn+nwl+dWfV4oVP4bxBpRZUVTTJeNcGHFWO
         8WW3ma+xuSZzjJHHoCDUf3YBFlqYhohWFY5WXAisawJVtLNSjGUQ0rXa2iFt1024YfUg
         DKVrw99EplrEMqxhtDFlYZOT9EVCWxubeNq5tOtVWHIZZ7v9xwO0mDlGsmJkPRmVa+N9
         1nBsWHXO04rlngcO/y/jKW8f9KVz557fuhBEZzXDO/JAFlD0n1H2TMHrwVFnzDMv5qUp
         Q1skURKMHiTT3+nYsOkjQkCc2p8JpmwN11UfMC0iZfB+/MT8EbnFUeOTJya4vPa6zc9g
         TUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871783; x=1713476583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bYuYlDD4bikRNQjIGcc6KvKj6VbfxrQTctYAm5dxiY=;
        b=TUSBDBPFmvAJk79//0tt660gY607dnZLDrtPwQIJNKjKfQ3P4MPA2Tfsa7Pxki/5Fr
         av71qTDaTZrBl1MADrFur7gYBozEKB39ZbtsdVTa9tf1xtlueptNjiwFvQnfCsXV4tQE
         VEp+pi9lO6jfaY3M5m9We+ugDNJJyblDRXIMO1z/LcsrjeYKW5uoigLDzqiQFW2mr9fv
         eCgi3W9mFVtN733eBT5qY2/ZtrpAAyy8SEF8pbqsxZAXLX+L6oLAM/Tv1B3A+zgt+Aev
         yJRdOQEv8WbnExecTjWx1seE8W5GHnvVHZ8EIgFW/Bpz1YtWMuYIAy2HEH+Aj++g4fEj
         wC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9Y4qlb8p6wEEx5cvo43yuebxw6/dwbCbATWraz0UpEsbrWtX/0aePEiMR2R2mmyAJPaWtuQdSwRFqQaoGQsooMWAKAWx0DtPLnIAqfQ==
X-Gm-Message-State: AOJu0YwEkSyQuU7idiMU/29tPtSFs+9wlfVNFU253gokEyJ6kOptRUoe
	4zS/wsm6EGhT4V4entzddxnUkitQcf/9UdqLBhPEckefOTy6KiMOMxXAV2zyJMrDbm6+7l6T4JF
	KnJAiBXGQgbw58dl9Rt9PEG68dwhK1DHTlzsPWQ==
X-Google-Smtp-Source: AGHT+IHIIfeM2tjeJdKh3NEqxwc+b1swpMUJboe18LxMuQvQu+sEhhsn8QKXrYgchqiyURwLXmYr7Tdlot6jXwNwIRs=
X-Received: by 2002:a25:ba93:0:b0:ddd:705e:a34b with SMTP id
 s19-20020a25ba93000000b00ddd705ea34bmr778897ybg.38.1712871783275; Thu, 11 Apr
 2024 14:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-11-dmitry.baryshkov@linaro.org> <ec73ae6f-3a81-70f6-27e7-a94a6794f2d0@quicinc.com>
In-Reply-To: <ec73ae6f-3a81-70f6-27e7-a94a6794f2d0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 00:42:52 +0300
Message-ID: <CAA8EJpq2MufDSsaOEoG0aE7n2-cK_b-cK7FbotVRHEfvxtUCBA@mail.gmail.com>
Subject: Re: [PATCH 10/12] drm/msm: convert msm_format::alpha_enable to the flag
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2024 at 00:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Instead of having a bool field alpha_enable, convert it to the
> > flag, this save space in the tables and allows us to handle all booleans
> > in the same way.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 12 ++++++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 24 ++++++++++-----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  7 +++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  3 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  4 ++--
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 ++-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  9 ++++----
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 ++-
> >   drivers/gpu/drm/msm/disp/mdp_format.c       |  2 +-
> >   drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
> >   11 files changed, 40 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 9041b0d71b25..201010038660 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -342,7 +342,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> >
> >       /* default to opaque blending */
> >       if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
> > -         !format->alpha_enable) {
> > +         !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)) {
> >               blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
> >                       DPU_BLEND_BG_ALPHA_BG_CONST;
> >       } else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
> > @@ -373,8 +373,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> >       lm->ops.setup_blend_config(lm, pstate->stage,
> >                               fg_alpha, bg_alpha, blend_op);
> >
> > -     DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
> > -               &format->pixel_format, format->alpha_enable, blend_op);
> > +     DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%lu blend_op:0x%x\n",
> > +               &format->pixel_format, format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE, blend_op);
> >   }
> >
> >   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > @@ -472,7 +472,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >
> >               format = msm_framebuffer_format(pstate->base.fb);
> >
> > -             if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
> > +             if (pstate->stage == DPU_STAGE_BASE &&
> > +                 format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)
> >                       bg_alpha_enable = true;
> >
> >               set_bit(pstate->pipe.sspp->idx, fetch_active);
> > @@ -495,7 +496,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >               for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
> >                       _dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
> >
> > -                     if (bg_alpha_enable && !format->alpha_enable)
> > +                     if (bg_alpha_enable &&
> > +                         !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE))
> >                               mixer[lm_idx].mixer_op_mode = 0;
> >                       else
> >                               mixer[lm_idx].mixer_op_mode |=
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index baf0fd67bf42..de9e93cb42c4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -36,7 +36,6 @@ bp, flg, fm, np)                                                          \
> >   {                                                                         \
> >       .pixel_format = DRM_FORMAT_ ## fmt,                               \
> >       .fetch_type = MDP_PLANE_INTERLEAVED,                              \
> > -     .alpha_enable = alpha,                                            \
> >       .element = { (e0), (e1), (e2), (e3) },                            \
> >       .bpc_g_y = g,                                                     \
> >       .bpc_b_cb = b,                                                    \
> > @@ -46,7 +45,9 @@ bp, flg, fm, np)                                                          \
> >       .unpack_count = uc,                                               \
> >       .bpp = bp,                                                        \
> >       .fetch_mode = fm,                                                 \
> > -     .flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> > +     .flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> > +             (alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
> > +             flg,                                                      \
>
> In the previous two patches where the same thing was done for
> unpack_tight and unpack_align_msb, it was different in the sense that
> just on the basis of which macro we were choosing we knew the value of
> those flags so you could just unconditionally OR those flags.
>
> But for alpha, you are performing a conditional before ORing this so I
> think for this leaving it as a bool is cleaner.

Ack

-- 
With best wishes
Dmitry

