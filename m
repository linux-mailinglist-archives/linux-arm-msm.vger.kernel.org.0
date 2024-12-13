Return-Path: <linux-arm-msm+bounces-42116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F69F1775
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 21:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A72D1882339
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 20:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EED1917CD;
	Fri, 13 Dec 2024 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnbYkzGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F382175AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 20:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734122300; cv=none; b=ch4aKPYjYvvGBWEXC+AiBh31rZ8PBZpXkHXF61HsYo4xaA65NcthM2AONghlSPpOnt7n/WZAHU86pP9ZE5dxw3rF7LFjGU1O1tcpm0ON2zxKCohGfTFfusVJcImSmak2Y5KzCjDiPvwX3Fo+kLx/d8mDxIpLC0dHdRjf1Wupf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734122300; c=relaxed/simple;
	bh=2RgIBbWgHVCKLHsj8nqNKNT5O0lXAjsfp8Hgz26Cjek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgvyihcX7cSuz+5hu8ufAmHHshGEjOMEqqngl7ZWdwDo7PLVIyUe6Nu5eK4cUPBvosf3pR/QlttbNH07zOpj7GPVnaLTpeuico2VsLam4SvEJt0fblFQJRebL1qOv4g+O2jFhYX/h1ryEvtqVLu4a73adwQ+k9EJ3wiNT4Buo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnbYkzGT; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef81222be7so21517807b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734122298; x=1734727098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K+k5fKdkj/4CuPycJ1siIOzYtXibL2hQFpVwz2mgPAk=;
        b=gnbYkzGTZwn5Tg2YQ9ls9Z2WZnzdys6RpN7H+61FuLdDYPz1kmdiXfsV9aF32yCSSz
         vpEJd/gh+31hZ1MT9QyZKdxNVnyxlMvmYnuXqnCzRxrMdOZK08v6wKY+sWR8YpzMxJty
         Gd7WmnDV1jTdYu60u52nT97iAsmA8biH5ylXfq2T77ftzw1u/tLPUgPjlKr5s+4zZa7D
         yxrgTjpUH9n39LFDW+V3xh5JCyDbH8mgoeC8ZVcy+pkhauPBnUZnl69VDJAlQnSbK+xD
         rEdtHeV70KcNUbvNMFy4sKGf5lQS+DZt4aUEsKIuZOxewmt/drls8eDn47Vr2zRHW0Ao
         lVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734122298; x=1734727098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+k5fKdkj/4CuPycJ1siIOzYtXibL2hQFpVwz2mgPAk=;
        b=Cu4tf2Sp1T7pCXkvUbqBU87t+fL6iUzrCzm4tQOrm1SPFxhF7EGZe/X/55omkSRd4o
         OEW9c/KhR2jzqfTKio7Q+PsoTPXqsVPQFDg2pBPycRPa8qMdsLoNWDmTx3EGETpocgbw
         01cbN/tdsQQmOejVWCuUlOTACy2diGFF52bMttwooKB24rAWfFEnH1izGnF52jOTlzsR
         ObOifFGdO0r+okWVCWK1y8DKQTlsbf5UqLDxncF2ma7e+fEz17cWRVDBA5s51mVB3B8r
         tWvmIZzzy4jY2nT1B9l/xSQn3HYvFVCzptqjrgOFgsuE+U8IfaKDDtCEIEwSev/w/J0R
         p37g==
X-Forwarded-Encrypted: i=1; AJvYcCWboEkufh2Yt3gIMDHOODFRVVMK79whhEHgMhIBziNtszAeOL84vgT/NItyJWK4WegOL0jGuaWbGOZ7GzxM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vSKXU6suxNwY3rHIeBgZRhGT6dQVoTintrXs2I1mT2nsGWjy
	tVbSKXNC8DqpzklGaTkW7tUvBs9y+urP7Hny3e+BY2oEZni+zanIqbjMOyTUDpEFTJPTgo/PZ9m
	2poHlLJBUtRp1prVx0FrJfd6orodVemIe2TGQgQ==
X-Gm-Gg: ASbGncuNMQAVWcTGBhY5mkDNemPpLRvb5d9d95pskBG1HC+ENKc7AydoIuvpdAKuXvX
	gtmr3Xf2dG+GmjwvNSHSJt/RHABlO9g8Z6aQv650lvPVmdwH+1f3T
X-Google-Smtp-Source: AGHT+IFOHxgqNg+sN7EOtBunHW1em5TfmLksd63iIdUybzrhYuWy5ZpRnCEphZhMbq+wQyfFBmYaHhDNrvmwOqtTc9M=
X-Received: by 2002:a05:690c:fd5:b0:6ef:4a1f:36d6 with SMTP id
 00721157ae682-6f279b23db1mr35730337b3.23.1734122297673; Fri, 13 Dec 2024
 12:38:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
 <onavg2s7uamgwh34ozhbt56c74ktj5chp3jnn4bw5m22y5sdjr@fktyn5yt4gmw> <1f71a352-ab8a-47fb-a4ed-ae0a4767aec6@quicinc.com>
In-Reply-To: <1f71a352-ab8a-47fb-a4ed-ae0a4767aec6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 22:38:07 +0200
Message-ID: <CAA8EJprwE-zV1cX4OUJJfJ1en1+riHZVCQNGNYHxnPe_S=2cwA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/12/2024 5:05 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 12, 2024 at 11:11:54AM -0800, Jessica Zhang wrote:
> >> Filter out modes that have a clock rate greater than the max core clock
> >> rate when adjusted for the perf clock factor
> >>
> >> This is especially important for chipsets such as QCS615 that have lower
> >> limits for the MDP max core clock.
> >>
> >> Since the core CRTC clock is at least the mode clock (adjusted for the
> >> perf clock factor) [1], the modes supported by the driver should be less
> >> than the max core clock rate.
> >>
> >> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
> >>   3 files changed, 36 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >> index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >> @@ -31,6 +31,26 @@ enum dpu_perf_mode {
> >>      DPU_PERF_MODE_MAX
> >>   };
> >>
> >> +/**
> >> + * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to
> >
> > Nit: CRTC (here and further)
> >
> >> + *   the perf clock factor.
> >> + * @crtc_clk_rate - Unadjusted crtc clock rate
> >> + * @perf_cfg: performance configuration
> >> + */
> >> +u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
> >> +                                const struct dpu_perf_cfg *perf_cfg)
> >
> > It's not just the CRTC clocks
> >
>
> Do you mean we should use adjusted mode clock here?

This also applies, etc. But my point was that you can not name it just
"adjusted CRTC clock" if you also add the plane clocks handling.

>
> >> +{
> >> +    u32 clk_factor;
> >> +
> >> +    clk_factor = perf_cfg->clk_inefficiency_factor;
> >> +    if (clk_factor) {
> >> +            crtc_clk_rate *= clk_factor;
> >> +            do_div(crtc_clk_rate, 100);
> >> +    }
> >> +
> >> +    return crtc_clk_rate;
> >> +}
> >> +
> >>   /**
> >>    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> >>    * @perf_cfg: performance configuration
> >> @@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
> >>      struct dpu_plane_state *pstate;
> >>      struct drm_display_mode *mode;
> >>      u64 crtc_clk;
> >
> > While you are at it, could you please also add a patch, replacing height
> > * vidth * vrefresh with mode->clock * 1000? The former one has limited
> > precision.
> >
> >> -    u32 clk_factor;
> >>
> >>      mode = &state->adjusted_mode;
> >>
> >> @@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
> >>              crtc_clk = max(pstate->plane_clk, crtc_clk);
> >>      }
> >
> > This function calculates crtc_clk as max(plane_clk, crtc_clk). Shouldn't
> > we also reject the atomic_state if for any of the planes the corrected
> > clock is lower than max_core_clk_rate
> >
>
> You mean higher than max_core_clk_rate? If so, yes we can fix that up.

Yes

>
> >>
> >> -    clk_factor = perf_cfg->clk_inefficiency_factor;
> >> -    if (clk_factor) {
> >> -            crtc_clk *= clk_factor;
> >> -            do_div(crtc_clk, 100);
> >> -    }
> >> -
> >> -    return crtc_clk;
> >> +    return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
> >>   }
> >>
> >>   static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >> index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >> @@ -54,6 +54,9 @@ struct dpu_core_perf {
> >>      u64 fix_core_ab_vote;
> >>   };
> >>
> >> +u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
> >> +                                const struct dpu_perf_cfg *perf_cfg);
> >> +
> >>   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> >>              struct drm_crtc_state *state);
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> >>                                              const struct drm_display_mode *mode)
> >>   {
> >>      struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >> +    u64 adjusted_mode_clk;
> >>
> >>      /* if there is no 3d_mux block we cannot merge LMs so we cannot
> >>       * split the large layer into 2 LMs, filter out such modes
> >> @@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> >>      if (!dpu_kms->catalog->caps->has_3d_merge &&
> >>          mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >>              return MODE_BAD_HVALUE;
> >> +
> >> +    adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
> >> +                                                        dpu_kms->perf.perf_cfg);
> >> +
> >> +    /*
> >> +     * The given mode, adjusted for the perf clock factor, should not exceed
> >> +     * the max core clock rate
> >> +     */
> >> +    if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
> >> +            return MODE_CLOCK_HIGH;
> >> +
> >>      /*
> >>       * max crtc width is equal to the max mixer width * 2 and max height is 4K
> >>       */
> >>
> >> ---
> >> base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
> >> change-id: 20241212-filter-mode-clock-8cb2e769f05b
> >>
> >> Best regards,
> >> --
> >> Jessica Zhang <quic_jesszhan@quicinc.com>
> >>
> >



-- 
With best wishes
Dmitry

