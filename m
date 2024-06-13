Return-Path: <linux-arm-msm+bounces-22564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4149890699E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327CA1C24105
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5FE140E5E;
	Thu, 13 Jun 2024 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBPukWKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF613CA95
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718273135; cv=none; b=CuRx94QxKsd76G/3+bcwTBjyZES4BFL43fFjuceb23nc32lf+CE7Qkyjg+p1K3fkgjxL8Oci7L5PK/gW54F8ZT5+7tsLsgeTRZLxRA45XLOOmPJ74NFo5g6quP1DuT6P+T06v6/wQSnu8p8HbBFP2+OwmMB3361ExsMVSPWpWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718273135; c=relaxed/simple;
	bh=Samv/OmBP0smmLJ3naD0x30gv3X/R5L8vnJyEtNLFUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0v+03kd+sLBaDkE5/uMiWzui4Z0JZ1tff1JC59y5M4npFNZSmIM0qhpSY+XvnTE/3jvV+WpOt8MrLgRvEIQtUW5fcLu57+Jl0Lf7+r4291xTWyZ4u7TsJQSiBAjd+OdwyvHtDhxkikYaFzarGzIN4asv/NwWBTWWAkX9xaNrgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBPukWKX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso1024233e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718273131; x=1718877931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hHCrsrh6ppxIXphRQlWZtbbbYPfuJ/rlYxAYQJBQqs=;
        b=YBPukWKXOdSAJalpApgWFLD1IEVig+gRiQHgf9DdRBvi+EwFyjG6tBc8AMsd5Jw2y4
         ZP1TqLAVM6XCgZtEEUDmEkhKZctF1hWO4Y/z9a4r4HcMvhojKb7mJgeEZc7nNsQ21bCF
         jG3x4fJOf7rPn85IxTninscZkfKu/pf166v8lAdVNOl5nOxgFiKbCouextP4XTuPAtbK
         EV7DS6R36KYndHF6bWnjgSD/pPuLsP8X07t8nJLCMSvnQsLyq3YY1U8/CMYwz/D7OY4A
         2xeoLN0mH7Y+otakqdlXQC0DdDNVlcKbRFt9nABt/K5yl8fpsZhkp3MaiG9VwSCu+kKE
         4kTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273131; x=1718877931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hHCrsrh6ppxIXphRQlWZtbbbYPfuJ/rlYxAYQJBQqs=;
        b=Yy3IMjlPBfgwgAZAt+kJjxZ/rBdm0sPXFIj2tT/nT7SCdd0/ixgfr4sa/PNHg1XEyJ
         j8UFoektfS7i5yyay6+xoclt/K1BwIWMngnYrplEfi1JOgl23iUdZZR2yjDipylIiyfB
         eZWs4oS84osYdgMA8Fk6BesUjtynuX+JyOANVF387ruslJVg5N53Gl9ptacg6GEfF+jj
         2wip+7a7rIDK72/dI+RuGF8X+kuVepKY4JgNS2iysWlaN8S+rsrZQ5fOQrK6p5aDK6xR
         TaGX8WW6T0ymoH1K3OW+2q5apjZnkvZE1SmG+8slUF2gFpF65/O83Vhhg21lqOMi/kvn
         hU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNE7PBYEfrB+W+9sc9j0rxfdgJivSsx/xB/wNzy7SnyugWmdYgxKc3zAGB/4/Keas6Go87SVuBXMlkOeddx/3ll9fjj1WsaPv0gFcvNQ==
X-Gm-Message-State: AOJu0YzGfKc4nCJC9USzfZ6WOaGWmlOATtqSV825HXRNqlq53wpcTRhf
	z0oX8IiCvndTjbBqeCSwZiEDVg2tWsBACyfdhGCCM7bpRpZ5nJZdAaCL59a8PTM=
X-Google-Smtp-Source: AGHT+IGclSTgpTUO81xbIS3nAXPH4gjiNHBTnUw/2Ohghjpq2gPuYtroFXFhfwu8awEadNIxb7bBPQ==
X-Received: by 2002:a05:6512:12cc:b0:52c:8abe:f54c with SMTP id 2adb3069b0e04-52c9a3d973cmr4515714e87.32.1718273130898;
        Thu, 13 Jun 2024 03:05:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f4c1sm148065e87.99.2024.06.13.03.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:05:30 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:05:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 10/13] drm/msm/dpu: allow sharing SSPP between planes
Message-ID: <emkkg5jqeyxvqifm4pubrtrizoui7cj3nnzwli7n2h6ly53xcf@dpa7245xozpp>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-11-dmitry.baryshkov@linaro.org>
 <68dc0d98-9830-d71d-ec65-71890fb2986e@quicinc.com>
 <CAA8EJpop48--yTyyWs+3b=sgHgjV6-7akp7mJX007aMaaKteJA@mail.gmail.com>
 <7e1c4f24-f663-71ea-3a03-e21951ee543b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e1c4f24-f663-71ea-3a03-e21951ee543b@quicinc.com>

On Wed, Jun 12, 2024 at 06:17:37PM -0700, Abhinav Kumar wrote:
> 
> 
> On 6/12/2024 2:08 AM, Dmitry Baryshkov wrote:
> > On Wed, 12 Jun 2024 at 02:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > > > Since SmartDMA planes provide two rectangles, it is possible to use them
> > > > to drive two different DRM planes, first plane getting the rect_0,
> > > > another one using rect_1 of the same SSPP. The sharing algorithm is
> > > > pretty simple, it requires that each of the planes can be driven by the
> > > > single rectangle and only consequetive planes are considered.
> > > > 
> > > 
> > > consequetive - > consecutive
> > > 
> > > Can you please explain why only consecutive planes are considered for this?
> > > 
> > > So lets say we have 4 virtual planes : 0, 1, 2, 3
> > > 
> > > It will try 0-1, 1-2, 2-3
> > > 
> > > Because all planes are virtual, there are only 3 unique pairs to be
> > > considered? Otherwise technically 6 pairs are possible.
> > 
> > An implementation that tries all 6 pairs taking the zpos and the
> > overlapping into account is appreciated. I cared for the simplest case
> > here. Yes, further optimizations can be implemented.
> > 
> 
> Ok got it. So you would like to build a better one on top of this.
> But I see one case where this has an issue or is not optimal. Pls see below.

Yes, it is not optimal. This is the 'best possible effort' or 'best
simple effort' from my POV.

> 
> > > 
> > > 
> > > General request:
> > > 
> > > Patches 1-9 : Add support for using 2 SSPPs in one plane
> > > Patches 10-12 : Add support for using two rectangles of the same SSPP as
> > > two virtual planes
> > > Patch 13 : Can be pushed along with the first set.
> > > 
> > > Can we break up this series in this way to make it easier to test and
> > > land the bulk of it in this cycle?
> > 
> > Sure.
> > 
> 
> Thanks.
> 
> > > 
> > > I have some doubts on patches 10-12 and would like to spend more time
> > > reviewing and testing this. So I am trying to reduce the debt of patches
> > > we have been carrying as this is a tricky feature to simulate and test
> > > the cases.
> > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 128 +++++++++++++++++++---
> > > >    1 file changed, 112 insertions(+), 16 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index cde20c1fa90d..2e1c544efc4a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -886,10 +886,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> > > >        return 0;
> > > >    }
> > > > 
> > > > -static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> > > > -                                                struct dpu_sw_pipe_cfg *pipe_cfg,
> > > > -                                                const struct dpu_format *fmt,
> > > > -                                                uint32_t max_linewidth)
> > > > +static int dpu_plane_is_multirect_capable(struct dpu_sw_pipe *pipe,
> > > > +                                       struct dpu_sw_pipe_cfg *pipe_cfg,
> > > > +                                       const struct dpu_format *fmt)
> > > >    {
> > > >        if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> > > >            drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
> > > > @@ -901,6 +900,13 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> > > >        if (DPU_FORMAT_IS_YUV(fmt))
> > > >                return false;
> > > > 
> > > > +     return true;
> > > > +}
> > > > +
> > > > +static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
> > > > +                                      const struct dpu_format *fmt,
> > > > +                                      uint32_t max_linewidth)
> > > > +{
> > > >        if (DPU_FORMAT_IS_UBWC(fmt) &&
> > > >            drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
> > > >                return false;
> > > > @@ -908,6 +914,82 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> > > >        return true;
> > > >    }
> > > > 
> > > > +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> > > > +                                                struct dpu_sw_pipe_cfg *pipe_cfg,
> > > > +                                                const struct dpu_format *fmt,
> > > > +                                                uint32_t max_linewidth)
> > > > +{
> > > > +     return dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) &&
> > > > +             dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > > > +}
> > > > +
> > > > +
> > > > +static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
> > > > +                                struct dpu_plane_state *prev_pstate,
> > > > +                                const struct dpu_format *fmt,
> > > > +                                uint32_t max_linewidth)
> > > > +{
> > > > +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > > > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > > > +     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> > > > +     struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
> > > > +     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
> > > > +     const struct dpu_format *prev_fmt =
> > > > +             to_dpu_format(msm_framebuffer_format(prev_pstate->base.fb));
> > > > +     u16 max_tile_height = 1;
> > > > +
> > > > +     if (prev_pstate->r_pipe.sspp != NULL ||
> > > > +         prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> > > > +             return false;
> > > > +
> > > > +     if (!dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) ||
> > > > +         !dpu_plane_is_multirect_capable(prev_pipe, prev_pipe_cfg, prev_fmt) ||
> > > > +         !(test_bit(DPU_SSPP_SMART_DMA_V1, &prev_pipe->sspp->cap->features) ||
> > > > +           test_bit(DPU_SSPP_SMART_DMA_V2, &prev_pipe->sspp->cap->features)))
> > > 
> > > This test_bit check should be absorbed into
> > > dpu_plane_is_multirect_capable()?
> > 
> > Yep.
> > 
> > > 
> > > > +             return false;
> > > > +
> > > > +     if (DPU_FORMAT_IS_UBWC(fmt))
> > > > +             max_tile_height = max(max_tile_height, fmt->tile_height);
> > > > +
> > > > +     if (DPU_FORMAT_IS_UBWC(prev_fmt))
> > > > +             max_tile_height = max(max_tile_height, prev_fmt->tile_height);
> > > > +
> > > > +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > +
> > > > +     r_pipe->sspp = NULL;
> > > > +
> > > > +     if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
> > > > +         dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
> > > > +         (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> > > > +          prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
> > > 
> > > Even if y1 > y2 or y2 > y1 but the separation is less than the  2 *
> > > max_tile_height, it can qualify for parallel fetch.
> > > 
> > > So parallel fetch is possible not only in x direction but y direction as
> > > well as it will be fetched by different SSPPs.
> > 
> > I think that's now what I see in the SDE driver.
> > 
> 
> hmm , okay, we can support that case once this one works without issues.
> 
> > > 
> > > > +             pipe->sspp = prev_pipe->sspp;
> > > > +
> > > > +             pipe->multirect_index = DPU_SSPP_RECT_1;
> > > > +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > > > +
> > > > +             prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> > > > +             prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > > > +
> > > > +             return true;
> > > > +     }
> > > > +
> > > > +     if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
> > > > +         prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
> > > > +             pipe->sspp = prev_pipe->sspp;
> > > > +
> > > > +             pipe->multirect_index = DPU_SSPP_RECT_1;
> > > > +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> > > > +
> > > > +             prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> > > > +             prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> > > > +
> > > > +             return true;
> > > > +     }
> > > > +
> > > > +     return false;
> > > > +}
> > > > +
> > > >    static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
> > > >                                        struct drm_atomic_state *state,
> > > >                                        const struct drm_crtc_state *crtc_state)
> > > > @@ -1098,13 +1180,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > > >    static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > >                                              struct dpu_global_state *global_state,
> > > >                                              struct drm_atomic_state *state,
> > > > -                                           struct drm_plane_state *plane_state)
> > > > +                                           struct drm_plane_state *plane_state,
> > > > +                                           struct drm_plane_state *prev_plane_state)
> > > >    {
> > > >        const struct drm_crtc_state *crtc_state = NULL;
> > > >        struct drm_plane *plane = plane_state->plane;
> > > >        struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > >        struct dpu_rm_sspp_requirements reqs;
> > > > -     struct dpu_plane_state *pstate;
> > > > +     struct dpu_plane_state *pstate, *prev_pstate;
> > > >        struct dpu_sw_pipe *pipe;
> > > >        struct dpu_sw_pipe *r_pipe;
> > > >        struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > @@ -1117,6 +1200,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > >                                                           plane_state->crtc);
> > > > 
> > > >        pstate = to_dpu_plane_state(plane_state);
> > > > +     prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
> > > >        pipe = &pstate->pipe;
> > > >        r_pipe = &pstate->r_pipe;
> > > >        pipe_cfg = &pstate->pipe_cfg;
> > > > @@ -1137,19 +1221,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > > 
> > > >        max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> > > > 
> > > > -     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > > -     if (!pipe->sspp)
> > > > -             return -ENODEV;
> > > > -
> > > >        if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> > > > -             pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > -             pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > +             if (!prev_pstate ||
> > > > +                 !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
> > > 
> > > This is a bit confusing to check esp since i am unable to apply this
> > > patch and check .... but...
> > 
> > It was posted several months ago. No surprise that the source code has
> > evolved. Getting the patches reviewed in time would have helped them
> > to be applicable.
> > 
> 
> Yes, part of the delays for virtual plane was purely because the CB setup
> was down (both due to internal IT issues and general sc7280 being down) and
> I want to make sure this series is compositor-tested and not just modetest
> tested.
> 
> But anyway, thats why I didnt request a rebase this time even though it was
> very hard to review the patch emails for this series.

Review is review, testing is testing. Those are two different items.
It's perfectly fine to review a patchset and at the same time to add a
notice 'don't merge until fully validated on a hardware'.

> 
> > > dpu_plane_atomic_check_nopipe() will set r_pipe_cfg if we are going to
> > > do multirect with two rectangles of the same sspp. Right?
> > 
> > No. It sets r_pipe_cfg in all the cases.
> > 
> 
> From what I see, we still have this check before a valid rectangle is set
> for the r_pipe_cfg
> 
>  	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
>  	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) >
> max_mdp_clk_rate) {

I really don't see a contradiction here. Maybe I'm missing something.

> > > Which means r_pipe_cfg will be 0 if multirect is not possible with same
> > > SSPP. Thats why the else case of this either uses two SSPPs.
> > 
> > No. It means that the plane can use a single rectangle of the SSPP.
> > 
> 
> OR that the plane does not need to use multirect because its rectangle width
> is < max_linewidth.

Isn't it the same fact, just expressed in different words?

> 
> > > 
> > > So why are we trying multirect with again with the two rectangles of the
> > > same SSPP as different planes? The result will be same right?
> > 
> > No, if the width of r_pipe_cfg is 0, it means that this plane doesn't
> > need a second rectangle to be displayed. So we can try reusing the
> > SSPP from the previous plane.
> > 
> 
> Yes, agreed to this point that this plane doesnt need a second rectangle to
> be displayed as it will fit in one rectangle.
> 
> And I see what you mean now, if the current plane needs only one rectangle
> to be used, you are trying to use the prev plane's SSPP's other rect?
> 
> So lets say we have plane 1 and plane 2 in the list.
> 
> Plane 1 has only one rect used and plane 2 also needs only one rect.
> 
> Then you use plane 1's SSPP even for plane 2.

Yes!

> Cant you use an alternative check like !dpu_plane_is_wideplane_multirect()
> to make this condition clear?

No. There might be other conditions in play. So we really need to check
both pipe configurations together in order to determine.

> Also dpu_plane_try_multirect() name is confusing then because you are trying
> multi-rect again to see if the SSPP can be shared and wide-plane multirect
> was not possible. So technically both are multirect, just dfferent
> applications.

dpu_plane_try_sharing_sspp() ?

> That will make it clear that you are trying to use multi-rect for sharing
> SSPP.
> 
> So there are essentially two use-cases of multi-rect:
> 
> 1) Wide plane multi-rect
> 2) SSPP sharing multi-rect
> 
> So this will make it clear.

Ideally we should be able to get rid of this distinction. Maybe in the
end we should just list all pipe configurations in some natural order
and then assign SSPP rectangles.

> 
> Coming to the algorithm, I see one issue with this now.
> 
> Lets say we have this list of SSPPs.
> 
> DMA0 Vig0 Vig1

Fine.

> 
> DMA0 has only rec0 used and rec1 is free.
> 
> Vig0 needs both recs used.
> 
> Vig1 needs only one rec.

And this is not fine. There are no fixed planes like DMA0, etc.

Let me rephrase that for you, if I got your example correctly. We have
three planes, first one is small RGB plane, so it requires only a single
rectangle, second plane requires both rectangles of VIG0.
Third plane could have fit into DMA1 / REC1, but using this algorithm we
end up allocating VIG1 for the third plane.


> Here it will notice that its previous plane has both rects used and will not
> try the DMA0 even though it has one rect free and will end up using a new
> SSPP.
> 
> Thats why considering only immediate pairs is not enough. All possible pairs
> will address this.

Yes, I know the algorithm is not optimal from the resource management
point of view. However:

- I was not sure how allocating two rectangles of the same SSPP for
  different stages will work across different hardware generations, etc.
  This algorithm doesn't have such an issue, because both rectangles are
  always using the same blending stage.

- Trying all possible combinations requires exponential time for the
  number of planes in use. The simple algorithm works in a linear time,
  while being good enough for the simplest cases.


-- 
With best wishes
Dmitry

