Return-Path: <linux-arm-msm+bounces-45248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D993A13776
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82458188A0D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4EC19259A;
	Thu, 16 Jan 2025 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBrvQIkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB2161321
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022106; cv=none; b=d/e9Nu1Zm6krRPqcnQi484w1RHR22K7R0oGibn5+azgsiZMhfHEt12gyVBK5oRQ4xam+hVgr4+fYJmLqfEOhScvmiSYhtC7IhpB/XuJA1rs2XiepAsJMwXPE39Z3QPn0Jpy4jJv8I+pUW/EOWMYU1KaxcfSARe7KbROZYNLuoto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022106; c=relaxed/simple;
	bh=YVh3ZSLqBe2iCWpT4raX7C5+iC//mGExDxTdhlmyCgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7jX4BC5/BZbRWKA/DyJJbhepG7S0OJLA5aLF0ipRX5IxLI881CGr7t+d8SJ8QJeE4vzlr+s83DE3H7ILSXtyK+ejiS5W/fe6Eau5TwW8N5aRK4Omwip70HEQLCd3ja3xwBBItaxF0vdjmiC4qNw3+6MYAjEWGZj2vQsL9J7yuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBrvQIkt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401c68b89eso887555e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 02:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737022103; x=1737626903; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQL5P+stysbXGUSGza6LY0P64HDoGy15LTxz7SThOgw=;
        b=rBrvQIktpHAPg57u5PU8vBr2cyXj0gFS/lvmWYQ/nZaM0VO+nym9JPFxfWQN0idXqT
         EQfakBGDTCobKJn9u0qLEDzI5gNKa+tuI5EK3SAd+SBBsllGzVUYrpGe2FN5BQ+ZbuOm
         0usOUHARwS3bcNm36vm1WKE3MOxHWJDfg/ozQYpmJVgzR03HEYAsH5BSAancfGDEO4c/
         ckVSCJOv5yH+ostOWCdPqqIrUiYOQjHKVhIOsmcEO3OdZQqvvfJO8RxAJahtQ/qvNuEZ
         CKm6YeHFXaYzS39w9DaT5Oo/RwyFaKKprpwZNMAmncLIjmnGMlUae6ATKuZclLDAV9YH
         8TAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022103; x=1737626903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQL5P+stysbXGUSGza6LY0P64HDoGy15LTxz7SThOgw=;
        b=oJkfotTGUjiNQi2m3t+gFsQpWBznez6Qx/4da254gbsv0Vr4oPDDxr/F5owhAldbfD
         NUdAlGqqFhh2XiiK4/zbxf9rfSWn3F8ERfjfpxV0NPp5tWK07GdZ75gHfFlb/K9uO+oI
         bZAgWT1XIC41hh5DNdxvzpNTzj5/jAkXSfCcTrUiWD5RPSTWd7PeR+PDIm04KhPLMaAN
         v0Z+h0ZLCusOJENvVKiMDvXGXN72+qIvzcTRKU+GNqGucznV/0Pc6vUsj+lxQK37pzjx
         oMHJvjtqJo7sZs0wma9Hf4uX7af0kc+8XqSpJ7mCayIDWwQLF1oBTPDYLcEYfqmBQdE9
         zm6A==
X-Forwarded-Encrypted: i=1; AJvYcCXM4Zjd7EvGSpIDbArxi4OM9NC9GuZRP/8+zyDs96yP6ZucdIbCmI65mWsRXiFXXqeQ3FOCtHO4RyZuaOmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9NGv3N3FCw8u27j+wZoADLmFWU3mXaWH5G5c6ul6RZCPozAtj
	oG5eSDCBgJoEQRTNgWIhBX5y5gdFdedxQrFI0Khd38+GtkSZqg+k598iFKlEioQ=
X-Gm-Gg: ASbGncuD2qvFbatrYCXJE6nGfX1Ybv4sWI0NJCjyp58f4UWKrhf7MB8ykhFOvx8lRWV
	ypP/QvtBqThmyICFzNMntVHmVAquu4+wp1UErTmfl/lB4Uk45K1ZOWztqyibQhYYipat+egIWw2
	Nfx1jxlI1BMxAh3l6eraoC2Wk4oxmeyXXK4Xg5AF8irSLCcO31mSTLki+AV/nNZ62QUhIiE8f1W
	dpcmwCTYQpY1SqWjfAslDjb5S5q/TDV5jQJ4HIUl8Q3f1uZZTDZkdmoou+XMFswdTIUDuHqAOFM
	BQrGDaROpLYWsXgwglNT3fHqxRblTQ+nJ7yG
X-Google-Smtp-Source: AGHT+IHibacZs62C+50hmUYD+We34R8ZMYI1SInbRx/AkSrEVIhxjVZEe01dBch1oRXN+Fj/nO4vEw==
X-Received: by 2002:a05:6512:1049:b0:542:8d92:158a with SMTP id 2adb3069b0e04-542abf9a237mr2328195e87.10.1737022103006;
        Thu, 16 Jan 2025 02:08:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0829sm2270932e87.197.2025.01.16.02.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:08:21 -0800 (PST)
Date: Thu, 16 Jan 2025 12:08:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
Message-ID: <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>

On Thu, Jan 16, 2025 at 05:49:43PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:00写道：
> >
> > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > Store pipes in array with removing dedicated r_pipe. There are
> > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > required for quad-pipe case. Generalize the handling to pipe pair
> > > and ease handling to another pipe pair later.
> >
> > With the first sentence being moved to the end of the commit message:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Minor issues below, please address them in the next version.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-------------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > >  3 files changed, 112 insertions(+), 102 deletions(-)
> >
> > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > +     /* move the assignment here, to ease handling to another pairs later */
> >
> > Is it a TODO comment? It reads like an order.
> >
> > > +     pipe_cfg = &pstate->pipe_cfg[0];
> > > +     r_pipe_cfg = &pstate->pipe_cfg[1];
> > >       /* state->src is 16.16, src_rect is not */
> > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > >
> >
> > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > >  {
> > >       struct drm_plane_state *state = plane->state;
> > >       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > > +     struct dpu_sw_pipe *pipe;
> > > +     int i;
> > >
> > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > -                             pstate->pipe.multirect_mode);
> > > +     for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> > > +             pipe = &pstate->pipe[i];
> > > +             if (!pipe->sspp)
> > > +                     continue;
> > >
> > > -     if (r_pipe->sspp) {
> > > -             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > +                                     pstate->pipe[i].multirect_mode);
> > >
> > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > +             /*
> > > +              * clear multirect for the right pipe so that the SSPP
> > > +              * can be further reused in the solo mode
> > > +              */
> > > +             if (pipe->sspp && i == 1) {
> >
> > Wouldn't it be better to `&& i % 2 != 0`? Then, I think, this condition
> > can stay even in quad-pipe case.
> 
> If all pipes are in solo mode, there is no need to test ' i %2 != 0 '. Below
> test shall be better, right?
> if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1)

Again, this will not work as expected for the SSPP-sharing case as it
will then clear pipe 0 for the sharing planes.

Let me think a bit... This code resets multirect for right pipes. It was
added back in 4.9 to fix the case of 'master' aka RECT_0 not being a
part of the atomic update. However I don't think this is applicable
anymore. We use z_pos normalization, so all planes for a CRTC are added
to the commit. Please drop this piece in a separate commit.

> 
> >
> > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +
> > > +                     if (pipe->sspp->ops.setup_multirect)
> > > +                             pipe->sspp->ops.setup_multirect(pipe);
> > > +             }
> > >       }
> > >
> > >       pstate->pending = true;
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

