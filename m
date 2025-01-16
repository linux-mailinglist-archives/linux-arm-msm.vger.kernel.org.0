Return-Path: <linux-arm-msm+bounces-45257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92211A1380F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9CB71889070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906811DE2AA;
	Thu, 16 Jan 2025 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgSUg/KC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A481DC9A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 10:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737023868; cv=none; b=nqDIEeP0MFl7V3THCAqGbPpR3usw9MmHMD05y55DKEqjsCOYs9lnsT/yn0H3mQihUYReZMWjeVVlUcXtM0dMOlTSa2IcAw8wgMhf4KVw72/89Ww5gb7XZyeWgfzOSRDyPRxBxV4UV6SoBW1YGsO1Co7H+use8sQ3A8TgteJJzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737023868; c=relaxed/simple;
	bh=s+KHljGo5n22NhQRQbVQckMICqBzPeg/Hs5LjeWYpeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkcPbq/JtJMzcbXs6TtVwJyy6wNvolN+M99bjy8nodMI1Rf+HSRGxoBCK6Aw9zL1C2Uw8plYeoTJjDRqwFmfGiDmtHhtVvDpMjXUk3saWqoe/BpFEk8SMqNdxeewtfTDRdQ7AaM+2tZdcqiWx3RBlmKXzGd70P/T4dOIbR3mvpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BgSUg/KC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so873169e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 02:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737023863; x=1737628663; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ej4Zc7uXIgXJxD3C2iLeGE3+l4IPsZm0sPJBi+11PIU=;
        b=BgSUg/KCSuXN1fuq+9FuJYkBPULKwghlk98dz6ZaT2kMCdsDaEeg4uCTqB19EfOD0S
         St8wQSwmlmomSZ8UXMPqssyLSn+zR6vgJyku4Qyx6XoG+6S04FNUd1TnKprLRzPnh/xe
         mT9zOe9dCyd8lQ0dHJPRb4zt5eG1fmCPFmIk2BXfAlaouvvqEK8srsYy4g0Zid5zrLBJ
         JUhttG/QQ4OehPTSr2Z9KSpp/Dn7ZysXE5bdlG+s2JKNy1PsegDRDmLsLSSLnlwMdIKT
         XEnvJZnHmLWOre7pKBtnRpe3JJ9Mej+MQA4/6bbpyHQcR5TGBD0OTSNRtB7TmeFmNf1i
         DmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023863; x=1737628663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej4Zc7uXIgXJxD3C2iLeGE3+l4IPsZm0sPJBi+11PIU=;
        b=oZ2yukGbYViomvgaMHu0DmCsId6v2ADhEtsFWfjo9lR1++M0/WLe+HGDb1KbHVjhwo
         ttf6cqOIidrmsYAqc1zeDhq119Kanb/TwP72jT/frHgGh4XfMfoIpKZ0oWaUHMqmRgVz
         twXznZlTKH4NYcW8y5p2+hJXn7TQzGXE9m0kr/eHBZ+p1YEMvNrZaDC6v5WBBKEsBe8g
         lMcQflWW2NEzrKiR2+WJ5xG1Hv8YknDI/KJq/47K7e9Eo19b2+ywkXR5iUWQE59oVxjU
         LEnakBNVO4DkVBHp4HLSkTMM+wvKRJZpKmZHd3uI+wZLX92f2hB+dtDGJw8FuKKI9Tny
         zKjA==
X-Forwarded-Encrypted: i=1; AJvYcCVCinL7zQyOtnsqzrO7QaR1FtoChjSKxh/g2GUwjmMcnVl6+lo2fGbmO9DKSArU6H74rQrjwyoVd1dqhwAC@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqdKoDfGA5yx7gF5xUDKFcEAZUlBd1CubL4Sn2CyBeEcCxYqn
	sHLEJvQoiiLDcYb5aHFSj4Y0i9TeS4EWU4t9PSzZtmZSGB5LTryWH0DHxAUbFOM=
X-Gm-Gg: ASbGncsa8o2koRXlsUZwYkKprEKeLeFu1ThyEPvPc9+QaRdBPTBH+0GeZv3WPaQ1Pwq
	z8Ls6rcKyJ5fKrvAA7dO3oXf6BIyEAyzEr0bPPsSkLPAbJCoZwu6b3Of3ITQjL9Hq9VbcOX328b
	SHddOqdboQNP3TCGpYuGV8atrm+HGNaPkgDk6nxxKfP6oSsrmtWKbzJL8mMshL6q8n920ZjW5In
	MS789rehQ54oHRccjdgdHWTw6c9VJiYYaW36HEZ6Xi1qGUEFvkdF+FmrVyjOhI2sScjCl9YB7gZ
	fNW2iJ+oZPBwprZ7dWMOQFJFOxAj/trbdn1Y
X-Google-Smtp-Source: AGHT+IGdM1ckswIauyESjkiC4TPlvzuRzEiaLifuPz/Iq9QNmkNfUelTdfgO8GMyFEdfJVi5aMvqJA==
X-Received: by 2002:a05:6512:b03:b0:542:2ef4:4884 with SMTP id 2adb3069b0e04-542845bf063mr10563279e87.19.1737023863189;
        Thu, 16 Jan 2025 02:37:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea693csm2273496e87.169.2025.01.16.02.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:37:41 -0800 (PST)
Date: Thu, 16 Jan 2025 12:37:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/16] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <fbw4ehm6e7hq6wv2ek2zokwzgr2vhnpece3iy2y67qe54z7lyb@uncyoewqjydv>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-13-74749c6eba33@linaro.org>
 <ohq35qtnnas5oqiqycn3floji3auuvwitdy43geve6nce5xxq4@4gsyikmqbbh3>
 <CABymUCNMe7egDjOfExA8AOqjtkjHHLPspibG6OZMhzHmvn6W+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNMe7egDjOfExA8AOqjtkjHHLPspibG6OZMhzHmvn6W+g@mail.gmail.com>

On Thu, Jan 16, 2025 at 06:20:48PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:14写道：
> >
> > On Thu, Jan 16, 2025 at 03:26:02PM +0800, Jun Nie wrote:
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen will be split further
> > > by half if its width still exceeds limit.
> >
> > futher handled by two pipes if its width exceeds a limit for a single
> > pipe.
> 
> Accepted.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  11 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 138 +++++++++++++++++++---------
> > >  4 files changed, 112 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index 5ae640da53fbf..a900220deeb35 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1361,6 +1361,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
> > >       return 0;
> > >  }
> > >
> > > +/**
> > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > + * @state: Pointer to drm crtc state object
> > > + */
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > > +{
> > > +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > > +
> > > +     return cstate->num_mixers;
> > > +}
> > > +
> > >  #ifdef CONFIG_DEBUG_FS
> > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > >  {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > index 0b148f3ce0d7a..b14bab2754635 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> > >
> > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > >
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > > +
> > >  #endif /* _DPU_CRTC_H_ */
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > index 56a0edf2a57c6..39fe338e76691 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > @@ -145,11 +145,13 @@ struct dpu_hw_pixel_ext {
> > >   *             such as decimation, flip etc to program this field
> > >   * @dest_rect: destination ROI.
> > >   * @rotation: simplified drm rotation hint
> > > + * @valid: notify that this pipe and config is in use
> > >   */
> > >  struct dpu_sw_pipe_cfg {
> > >       struct drm_rect src_rect;
> > >       struct drm_rect dst_rect;
> > >       unsigned int rotation;
> > > +     bool valid;
> >
> > Commit message doesn't describe why this is necessary at all. Why isn't
> > it enough to check pipe->sspp as the code has been doing up to this
> > point?
> 
> We test non-zero width of r_pipe or check pipe->sspp to decide whether
> to allocate SSPP and go thru the routine for the r_pipe when we have 2
> pipes at most. With 4 pipes, it is a bit complex to handle it this way because
> the 2rd and the 4th pipes may be not valid when splitting the plane. A valid
> flag is more straightforward for later handling.

Why? Even for 4-pipe case we need to allocate SSPP rect if
drm_rect_width is non-0, that's for the atomic_check() function. And
later we should be using pipe->sspp to check if it is valid or not.
Adding extra flag complicates code because it can easily become unsync
with the rest of the pipe configuration.

> 
> >
> > >  };
> > >
> > >  /**
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 3795576e2eedd..4bcd7b1a05c16 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -831,8 +831,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > >       struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > >       struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > +     struct dpu_sw_pipe_cfg init_pipe_cfg;
> > >       struct drm_rect fb_rect = { 0 };
> > > +     const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > >       uint32_t max_linewidth;
> > > +     u32 num_lm;
> > > +     int stage_id, num_stages;
> > >
> > >       min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > >       max_scale = MAX_DOWNSCALE_RATIO << 16;
> > > @@ -855,13 +859,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > -     /* move the assignment here, to ease handling to another pairs later */
> > > -     pipe_cfg = &pstate->pipe_cfg[0];
> > > -     r_pipe_cfg = &pstate->pipe_cfg[1];
> > > -     /* state->src is 16.16, src_rect is not */
> > > -     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > +     num_lm = dpu_crtc_get_num_lm(crtc_state);
> > >
> > > -     pipe_cfg->dst_rect = new_plane_state->dst;
> > > +     /* state->src is 16.16, src_rect is not */
> > > +     drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
> > >
> > >       fb_rect.x2 = new_plane_state->fb->width;
> > >       fb_rect.y2 = new_plane_state->fb->height;
> > > @@ -886,35 +887,93 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > >
> > >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> > >
> > > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > > +     drm_rect_rotate(&init_pipe_cfg.src_rect,
> > >                       new_plane_state->fb->width, new_plane_state->fb->height,
> > >                       new_plane_state->rotation);
> > >
> > > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > -                     return -E2BIG;
> > > +     /*
> > > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > > +      * configs for left and right half screen in case of 4:4:2 topology.
> > > +      * But we may have 2 rect to split wide plane that exceeds limit with 1
> > > +      * config for 2:2:1. So need to handle both wide plane splitting, and
> > > +      * plane on right half for quad-pipe case. Check dest rectangle
> >
> > only on the right side?
> 
> Yeah, below shall be better.
> So need to handle both wide plane splitting, and two halves of screen splitting
> for quad-pipe case.
> >
> > > +      * left/right clipping first, then check wide rectangle splitting in
> > > +      * every half next.
> > > +      */
> > > +     num_stages = (num_lm + 1) / 2;
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

