Return-Path: <linux-arm-msm+bounces-42418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 973709F3E10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB07216DDD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FF51D5CF2;
	Mon, 16 Dec 2024 23:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ll/41Ny6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ECB1D5ADB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 23:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734390780; cv=none; b=JsYAxjW3WCE2FZX00wJnhwz6h3wE1RTEolmnZpzb1vl3bv55/Sxth8p+St/yN/rv8loUWN9NAjtOtActtsU+puCQbWzh8AHhj+i0ZUD2BM94CGxuz3oy8rYGDp21VKx8iWTsQappcBqjjDy33poVubW4utZJ/rPPppup7Nthzt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734390780; c=relaxed/simple;
	bh=RbVtYUtJHTlM4wrJ56wmLCvwDa6dqo5XpejpG62cLGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiIKpB6R9l/12d/z2t8S2c1JLyAlHvEhQJIUyG/aXSSYCJAfStL/tuM9Qmlw3WWBoEngVNEkDtioflNyfTPRs3fDsgoV2oXV7+7WqD643mjLEbmZGn5fYz61Xm/CWXvO8AlwHbKJstwGLNgYRmJrMNGbBtVyjnVCOMSjVGTzx7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ll/41Ny6; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53f757134cdso5344075e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734390776; x=1734995576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0P4AswTsYx2b/iGrf+A9EVoTJbyL0X0MceH/L1Aum8=;
        b=ll/41Ny6qhy2zjUt7HQ+RyEj1pt6J6NDRAKBPcIGaW+0pb/umgyN3FCUYNvI6Kk6vp
         9q+NZ23J12YppuAfj1Fz4DIBsyDlYayAt5DYjZJX1um20eY0JLNH6vg7bfwi+Z2VWPIi
         y/BH6zGtyPWy2cg3vaJXPtypxO2A683pMrPbjIVyybWmKusz1l32ODN+CFNST+yunf8f
         mmijunotMkaJrAFhlY/xm+FAkiJOBnC8xkr1X+7SeGDU0L+MPl9u/PIu3Rnt5s/33maf
         6/JmeRwP1CyNRoxGL4QPWc301W/Ydgx6JVX87RmM9q4QcZYJSPHbU+3k7CcX3oyuFUeK
         eS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390776; x=1734995576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0P4AswTsYx2b/iGrf+A9EVoTJbyL0X0MceH/L1Aum8=;
        b=IVFiPDcOhXaosyk8sklEwbM6w1n/ZVuBoKkM1JDXe6K12pj5E1fu1GCpF/pI7q8F6f
         7S7A1cIoTbjQTtS7sh6et7r1I6kekskfB45i84C/GWZM6KBbmoLa6jvxmMixz0yWo0Lb
         tfQ+7QA17kEwdGeLLJQkLbItwZnMBmoo5M3DEEQFgpK+hWfICry5iizIkiLiiini/Tvi
         MJuyJT2my44MImO99XMThoXVEVkGptSSVCHDufYGEYC03baoTv48rxnDVaVfy7Vjh+uA
         mU8oygQBTVuQuyy1G4iD2KGSum4Vasljhg8qbSKVGQowFKR0gfOkIcc6fg3JkTgUCeV1
         5k8w==
X-Forwarded-Encrypted: i=1; AJvYcCWvPF7ET5sLKMdc/el6sdTMfEiOW4BTaM9sirI2bc2xE2iSWDeoEa2tw7EWPfMsa6lR48ATx0+XCULa3dnk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1YDi+QA5LeTwAgQKEIsZez2EhYxZui0M3i5FQmExCD/ZwRk5
	TLeRhfnfdLnDjMOPm/nE78Ya1wuGtVNwl2Uw5gIjPl9aPaCQRcY/sFlqVCGz2T4=
X-Gm-Gg: ASbGncuWv2YXwjWbcIafyOQFVfG0+SNrCbCij+RV7LNJ4BYulURLNHZcb1kdNMS43BU
	LA1gRSob/ySeutY9JrwKdycaw7QKA44Pler4ttp0iuCddKQPVzAkezdGULPcwclMMBsl9y1cOUN
	WhjW5YkMlbk60T/0z1JkRl6/HT4httiCElbR+FH0fYpBuFdjv88G6c7/RTWYMUO5UVs3EZB3xvT
	wstfZI2/nU8i/TvFYtysOUduPnBNxsXc6QhQs0J2r/+3K8QGCULxqa9fD9H9WVQ6sO9rO2RW/4Z
	jlM/qiTqK6SwK7NaYUUhgdbeLRNDUcIY0n1S
X-Google-Smtp-Source: AGHT+IGxkH9SkFiq3CGiGZxHiWcc8rXr1a5UVkJ34/pYTrDfP9KJgxRgVb0I9tDzZSzuforz9ETJ4A==
X-Received: by 2002:a05:6512:3d1f:b0:53e:3a94:c2bc with SMTP id 2adb3069b0e04-54131051798mr366127e87.18.1734390776090;
        Mon, 16 Dec 2024 15:12:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120bffd6csm983605e87.132.2024.12.16.15.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:12:54 -0800 (PST)
Date: Tue, 17 Dec 2024 01:12:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <dybjy4t2wj6wyrlttes3ekppi27vlejbwg7yvfmnfw3call2jk@wfj6nzibgnpd>
References: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
 <onavg2s7uamgwh34ozhbt56c74ktj5chp3jnn4bw5m22y5sdjr@fktyn5yt4gmw>
 <1f71a352-ab8a-47fb-a4ed-ae0a4767aec6@quicinc.com>
 <CAA8EJprwE-zV1cX4OUJJfJ1en1+riHZVCQNGNYHxnPe_S=2cwA@mail.gmail.com>
 <ab9a5f29-39d3-46bd-bcdf-15466a6a30b4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab9a5f29-39d3-46bd-bcdf-15466a6a30b4@quicinc.com>

On Mon, Dec 16, 2024 at 11:16:11AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/13/2024 12:38 PM, Dmitry Baryshkov wrote:
> > On Fri, 13 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 12/12/2024 5:05 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Dec 12, 2024 at 11:11:54AM -0800, Jessica Zhang wrote:
> > > > > Filter out modes that have a clock rate greater than the max core clock
> > > > > rate when adjusted for the perf clock factor
> > > > > 
> > > > > This is especially important for chipsets such as QCS615 that have lower
> > > > > limits for the MDP max core clock.
> > > > > 
> > > > > Since the core CRTC clock is at least the mode clock (adjusted for the
> > > > > perf clock factor) [1], the modes supported by the driver should be less
> > > > > than the max core clock rate.
> > > > > 
> > > > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
> > > > >    3 files changed, 36 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > @@ -31,6 +31,26 @@ enum dpu_perf_mode {
> > > > >       DPU_PERF_MODE_MAX
> > > > >    };
> > > > > 
> > > > > +/**
> > > > > + * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to
> > > > 
> > > > Nit: CRTC (here and further)
> > > > 
> > > > > + *   the perf clock factor.
> > > > > + * @crtc_clk_rate - Unadjusted crtc clock rate
> > > > > + * @perf_cfg: performance configuration
> > > > > + */
> > > > > +u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
> > > > > +                                const struct dpu_perf_cfg *perf_cfg)
> > > > 
> > > > It's not just the CRTC clocks
> > > > 
> > > 
> > > Do you mean we should use adjusted mode clock here?
> > 
> > This also applies, etc. But my point was that you can not name it just
> > "adjusted CRTC clock" if you also add the plane clocks handling.
> > 
> 
> _dpu_plane_calc_clk() already handles the plane_clk calculation so we dont
> need to add it here.
> 
> adjusted_mode_clk sounds fine to me in that case.
> 
> > > 
> > > > > +{
> > > > > +    u32 clk_factor;
> > > > > +
> > > > > +    clk_factor = perf_cfg->clk_inefficiency_factor;
> > > > > +    if (clk_factor) {
> > > > > +            crtc_clk_rate *= clk_factor;
> > > > > +            do_div(crtc_clk_rate, 100);
> > > > > +    }
> > > > > +
> > > > > +    return crtc_clk_rate;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> > > > >     * @perf_cfg: performance configuration
> > > > > @@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
> > > > >       struct dpu_plane_state *pstate;
> > > > >       struct drm_display_mode *mode;
> > > > >       u64 crtc_clk;
> > > > 
> > > > While you are at it, could you please also add a patch, replacing height
> > > > * vidth * vrefresh with mode->clock * 1000? The former one has limited
> > > > precision.
> > > > 
> > > > > -    u32 clk_factor;
> > > > > 
> > > > >       mode = &state->adjusted_mode;
> > > > > 
> > > > > @@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
> > > > >               crtc_clk = max(pstate->plane_clk, crtc_clk);
> > > > >       }
> > > > 
> > > > This function calculates crtc_clk as max(plane_clk, crtc_clk). Shouldn't
> > > > we also reject the atomic_state if for any of the planes the corrected
> > > > clock is lower than max_core_clk_rate
> > > > 
> > > 
> > > You mean higher than max_core_clk_rate? If so, yes we can fix that up.
> > 
> > Yes
> > 
> 
> I cross-checked the src code, we do already have the protection for
> plane_clk going beyond max_core_clk
> 
>         /* max clk check */
>         if (_dpu_plane_calc_clk(mode, pipe_cfg) >
> kms->perf.max_core_clk_rate) {
>                 DPU_DEBUG_PLANE(pdpu, "plane exceeds max mdp core clk
> limits\n");
>                 return -E2BIG;
>         }
> 
> So this should be sufficient for the case you are referring to.

But the quoted piece of code doesn't take the 'inefficiency' into account.

But it is probably a separate issue to be fixed. For this patch:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> > > 
> > > > > 
> > > > > -    clk_factor = perf_cfg->clk_inefficiency_factor;
> > > > > -    if (clk_factor) {
> > > > > -            crtc_clk *= clk_factor;
> > > > > -            do_div(crtc_clk, 100);
> > > > > -    }
> > > > > -
> > > > > -    return crtc_clk;
> > > > > +    return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
> > > > >    }
> > > > > 
> > > > >    static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > > index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > > @@ -54,6 +54,9 @@ struct dpu_core_perf {
> > > > >       u64 fix_core_ab_vote;
> > > > >    };
> > > > > 
> > > > > +u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
> > > > > +                                const struct dpu_perf_cfg *perf_cfg);
> > > > > +
> > > > >    int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> > > > >               struct drm_crtc_state *state);
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> > > > >                                               const struct drm_display_mode *mode)
> > > > >    {
> > > > >       struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> > > > > +    u64 adjusted_mode_clk;
> > > > > 
> > > > >       /* if there is no 3d_mux block we cannot merge LMs so we cannot
> > > > >        * split the large layer into 2 LMs, filter out such modes
> > > > > @@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> > > > >       if (!dpu_kms->catalog->caps->has_3d_merge &&
> > > > >           mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> > > > >               return MODE_BAD_HVALUE;
> > > > > +
> > > > > +    adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
> > > > > +                                                        dpu_kms->perf.perf_cfg);
> > > > > +
> > > > > +    /*
> > > > > +     * The given mode, adjusted for the perf clock factor, should not exceed
> > > > > +     * the max core clock rate
> > > > > +     */
> > > > > +    if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
> > > > > +            return MODE_CLOCK_HIGH;
> > > > > +
> > > > >       /*
> > > > >        * max crtc width is equal to the max mixer width * 2 and max height is 4K
> > > > >        */
> > > > > 
> > > > > ---
> > > > > base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
> > > > > change-id: 20241212-filter-mode-clock-8cb2e769f05b
> > > > > 
> > > > > Best regards,
> > > > > --
> > > > > Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > 
> > > > 
> > 
> > 
> > 

-- 
With best wishes
Dmitry

