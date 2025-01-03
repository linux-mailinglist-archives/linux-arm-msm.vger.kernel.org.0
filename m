Return-Path: <linux-arm-msm+bounces-43905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82944A00D3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987F61884BF9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 17:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54611F9EDF;
	Fri,  3 Jan 2025 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MjkFte8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98411E4AD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735926703; cv=none; b=lloLQY0Cp7+Wn2KkfLVMqo5ctjnTvCyx4ShwKc+BbM+ZHQS5WQUxa4Z3pUMQBpOxEA1jyO8C4/+l/fJXtrYP9pc7WokBEr5xLKIoilRuP4EQzb3O9qBzROmqwxrR2AyRzszTjE2mPlgwxh18iJzWf2W1ivopbjwighhUtvj7PbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735926703; c=relaxed/simple;
	bh=8C2oU+bdfVvwBXuCSYx64e+8BfUL6Vx2ULODtEXtJys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPjw36G1rpcNwzTUmL1sWEpagpYFtjwuXuIJVCzcddGC1mK6R1cmIhb6U2FMUu64Cl5wTraGRQfRzT5jsjI57YPJM/zUKyuBq461iei4bYeYWGcOJMfSyJcBdJZZAK1QwC+BbLoSCWhnOdMkCPUa9jlJSQsSo4Ea0LSTmFA65vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MjkFte8Y; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso14969810e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 09:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735926699; x=1736531499; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dObIDMQEIEp+rZPwfZYdlA1khpQZ5/9GkKfu84d0u/8=;
        b=MjkFte8YTI0w01UcjdpCY3HoIcZwiUvuw80/ME5mNiXUmbXnQMYv8Jnd960QAqoGb8
         +uAGmzhj0JaUJ1Typ/0asoN9JlTa9CunDp4warXuTpe8uAdz5usAjq43L2vxhcHe8UfU
         3LSSdMQXuUo5zsuz9r6Z1yzy2t3Ru9h0w1LUHl+Lcjbb7E3M5fQjtaC4/0UnQrnJzFgA
         iv95Kjaj+Bj3aiCNMVJIuT491AYeXY6CMpJY6MNsQht+uIGs+raADyMx9yt70rToj/+X
         yXO1PotTjSUONrVDqo386Z85uDYs9gEDa1ClFHiE9anCtmd/C1poUBSuM7rhoSXdy2hT
         7KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735926699; x=1736531499;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dObIDMQEIEp+rZPwfZYdlA1khpQZ5/9GkKfu84d0u/8=;
        b=v1i1PbNCB7vnprJpt28HZigclnSLISwln+Q8wVU2k/4C+qsZM7bU+kh9RrweCqB9Bw
         hoZIzuSWo2Al7rZqt9ijJJDl+sau1mT61kxhIxHVbtFICJIhYmQuWy9hpZCvdFi1neLS
         gkJY6LsFtKbpjnRvzWRGjoxmVg5Ww2R2e9xW32ACIn8GBeRYVrMcScoWnllHlUVsl2wD
         8FJb8674CYR/+T07vi8toR5ldNIPp8n0KqOQDtOvKUNDdHuzvv3grcVYZ26RwzVT1TYO
         XAiCsGyrm8FRrhhnoBKKZuuUVk2f9Qe+45kyNQtalW0j+Kvf6DmbzFp/Tc1VM4tYj3Y+
         Raug==
X-Forwarded-Encrypted: i=1; AJvYcCX+gslgFmahJkuYEmaxRDtCTVH1zr21FznuakEXfiX+mdvXybYSXKSXkxE9fpSZxZK1VV1lbtoAh5x7vYYC@vger.kernel.org
X-Gm-Message-State: AOJu0YwnUNEWAFVMJ9vucS/1/WWFmnaYtzgfESUBesAbxO5PbWcYxXpb
	DKJcFDfwZDhPaD8BPhU9/rERBEghMW676eGdv6yvfiTYKAmW5mq8aBafxUYl6oo=
X-Gm-Gg: ASbGnctjVNicfR/pM4FTY4Wix3Ay9XAfofcFWwIMUQvnC+Gx5h/Tj25dwYT3xnkNaHb
	srmbEVHTBgGgpHEhsHfXKBRN0V9pozpMkIt6c/3lNX1uhyqMlK+OVHLetFtcuA3c6g1/Rb20dib
	mV0t2C1O8aRxS6kyY5gGMiJTWTYMcLF4NdJd0aW7BCShs9NerN+lwXpciEe1UGa+AQ9DBBbmChr
	qg7pTrAhXUKi74T4w+rPQGf39yFyD1fDaryeB2o1XdUhA0Ro/+PORhAMxwke29jI4Jxsq8AnYJN
	24szrrdR50CyAbIhpR2FKfnWARjM/C1Pp9nj
X-Google-Smtp-Source: AGHT+IGeN8u0PJAzpExjRibkmahTcfBWtDliej3Q58szu4tXtcheHuhBGtHO8+3nzP/EoVNTDbPYsQ==
X-Received: by 2002:ac2:4c47:0:b0:542:2139:636a with SMTP id 2adb3069b0e04-542294432e0mr15089693e87.7.1735926698776;
        Fri, 03 Jan 2025 09:51:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235fff03sm4238196e87.75.2025.01.03.09.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 09:51:37 -0800 (PST)
Date: Fri, 3 Jan 2025 19:51:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
 <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>

On Fri, Jan 03, 2025 at 11:49:07PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年12月20日周五 07:46写道：
> >
> > On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > > enabled. We prefer to use 4 pipes for dual DSI case for it is power optimal
> > > for DSC.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
> > >  7 files changed, 30 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index bad75af4e50ab..3c51c199f3e05 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
> > >               struct dpu_crtc_state *crtc_state)
> > >  {
> > >       struct dpu_crtc_mixer *m;
> > > -     u32 crcs[CRTC_DUAL_MIXERS];
> > > +     u32 crcs[CRTC_QUAD_MIXERS];
> > >
> > >       int rc = 0;
> > >       int i;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > index d1bb3f84fe440..ce41fb364f3db 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -210,7 +210,7 @@ struct dpu_crtc_state {
> > >
> > >       bool bw_control;
> > >       bool bw_split_vote;
> > > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> > >
> > >       uint64_t input_fence_timeout_ns;
> > >
> > > @@ -218,10 +218,10 @@ struct dpu_crtc_state {
> > >
> > >       /* HW Resources reserved for the crtc */
> > >       u32 num_mixers;
> > > -     struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> > > +     struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
> > >
> > >       u32 num_ctls;
> > > -     struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> > > +     struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
> > >
> > >       enum dpu_crtc_crc_source crc_source;
> > >       int crc_frame_skip_count;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 96d06db3e4be5..6e54ddeaffacd 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -54,7 +54,7 @@
> > >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> > >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> > >
> > > -#define MAX_CHANNELS_PER_ENC 2
> > > +#define MAX_CHANNELS_PER_ENC 4
> > >
> > >  #define IDLE_SHORT_TIMEOUT   1
> > >
> > > @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >
> > >       /* Datapath topology selection
> > >        *
> > > -      * Dual display
> > > +      * Dual display without DSC
> > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > >        *
> > > +      * Dual display with DSC
> > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > > +      *
> > >        * Single display
> > >        * 1 LM, 1 INTF
> > >        * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > >        *
> > >        * Add dspps to the reservation requirements if ctm is requested
> > >        */
> > > +
> > >       if (intf_count == 2)
> > >               topology.num_lm = 2;
> > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >                * 2 DSC encoders, 2 layer mixers and 1 interface
> > >                * this is power optimal and can drive up to (including) 4k
> > >                * screens
> > > +              * But for dual display case, we prefer 4 layer mixers. Because
> > > +              * the resolution is always high in the case and 4 DSCs are more
> > > +              * power optimal.
> > >                */
> > > -             topology.num_dsc = 2;
> > > -             topology.num_lm = 2;
> > > -             topology.num_intf = 1;
> > > +
> > > +             if (intf_count == 2) {
> > > +                     topology.num_dsc = 4;
> > > +                     topology.num_lm = 4;
> > > +                     topology.num_intf = 2;
> > > +             } else {
> > > +                     topology.num_dsc = 2;
> > > +                     topology.num_lm = 2;
> > > +                     topology.num_intf = 1;
> >
> > Why is it only enabled for the DSC case? Also I'd like to point out
> > platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
> > condition here needs more work to work with those platforms too.
> 
> Because the DSC + quad-pipe is assumed with wide LCD case that dual
> pipe can not handle due to width limitation. If DSC is not involved, the
> resolution is not too big to involve DSC together with 2 interfaces. Do you
> think there is need to support quad-pipe without DSC?

Yes, of course. The same logic: ultra wide resolutions. If two LMs are
not enough for the panel / monitor.

> 
> Of course, it is a valid case to use 2 DSC with 2 interfaces. Below logic shall
> be better.
> 
>    if (intf_count == 2) {
>            topology.num_dsc = dpu_kms->catalog->dsc_count >= 4 ? 4 : 2;
>            topology.num_lm = topology.num_dsc;
>            topology.num_intf = 2;
>    } else {
>            topology.num_dsc = 2;
>            topology.num_lm = 2;
>            topology.num_intf = 1;
>    }

It all starts to look like a collection of use-case quirks. But indeed,
it should work.

> 
> >
> > > +             }
> > >       }
> > >
> > >       return topology;
> > > @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
> > >       struct dpu_hw_mixer_cfg mixer;
> > >       int i, num_lm;
> > >       struct dpu_global_state *global_state;
> > > -     struct dpu_hw_blk *hw_lm[2];
> > > -     struct dpu_hw_mixer *hw_mixer[2];
> > > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > +     struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> > >       struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
> > >
> > >       memset(&mixer, 0, sizeof(mixer));
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > index 63f09857025c2..d378a990cc0fb 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
> > >
> > >       /* Use merge_3d unless DSC MERGE topology is used */
> > >       if (phys_enc->split_role == ENC_ROLE_SOLO &&
> > > -         dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
> > > +         (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
> > > +             dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&
> >
> > Misaligned. Also isn't it enough to check that num_mixers != 1?
> 
> Yeah, num_mixers != 1 should work.
> >
> > >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> > >               return BLEND_3D_H_ROW_INT;
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > index 3ab79092a7f25..d9cc84b081b1f 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > @@ -25,6 +25,7 @@
> > >  #define DPU_MAX_IMG_HEIGHT 0x3fff
> > >
> > >  #define CRTC_DUAL_MIXERS     2
> >
> > Do we still need this define?
> >
> > > +#define CRTC_QUAD_MIXERS     4
> > >
> > >  #define MAX_XIN_COUNT 16
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index 27ef0771da5d2..1fe21087a141a 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -33,8 +33,8 @@
> > >  #endif
> > >
> > >  #define STAGES_PER_PLANE             2
> > > -#define PIPES_PER_PLANE                      2
> > >  #define PIPES_PER_STAGE                      2
> > > +#define PIPES_PER_PLANE                      (STAGES_PER_PLANE * STAGES_PER_PLANE)
> >
> > This is incorrect.
> >
> > >  #ifndef DPU_MAX_DE_CURVES
> > >  #define DPU_MAX_DE_CURVES            3
> > >  #endif
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 57ccb73c45683..b5c1ad2a75594 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > >               trace_dpu_plane_disable(DRMID(plane), false,
> > >                                       pstate->pipe[i].multirect_mode);
> > >
> > > -             if (pipe->sspp && i == 1) {
> > > +             if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
> >
> > Separate change, please. Also I'm not sure how does that work with the
> > shared SSPP case that I pointed to in one of the previous replies.
> 
> Maybe we can add a peer member in the pipe to reference each other, then we have
> chance to use multirect across all pipes in all planes.

I'd rather not. We have pairs of pipes. I'd rather see the code stay the
same way: processing one pair at the same time.

> 
> 
> >
> > >                       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > >                       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

