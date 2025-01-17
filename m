Return-Path: <linux-arm-msm+bounces-45364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D53A14884
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 04:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EA171889201
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 03:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC901F63C2;
	Fri, 17 Jan 2025 03:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bp4Oms9W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A51F5616
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 03:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737085077; cv=none; b=MhIibEbBzxvgw4JFgpQD0vDLqjhVlb1uuW6tPhtDmLmQ6P5qNPZp+h3kqWuvCMKxasfyTWrEYcVUUU1XdteqhrFSq8VDKeApWQejHr/hlhpMA6ttGTryTlEoopbsG0BXHW4l+8zoOLhCeweiUWDmnn6YslnHCvtiMjlXm1tfApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737085077; c=relaxed/simple;
	bh=MJ3QxAbDy1kriIAHUnVZKwSdyipkUogFYOXeWkQEkfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0XNIOWMMchjFLMcxR8BuAWywhIUkH6kqNp1OrDAX6HpxbCnw6q/EYDFQvdq8u51G7hJ3nvkNKB4U1e12OyB10RAj3K3g1JsUVveBmd0ioOm4qXV9bEodEB0colHrCtszulWRuvB+UH9DlSvOSs08MoruNhRjFDnIm2W6/dllXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bp4Oms9W; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1897290e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 19:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737085073; x=1737689873; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbRhauMuE7vnNEQUajYDJYV2KJ4uJrNBBU7umCd3XAo=;
        b=Bp4Oms9W5602pmnTEwav8VCKNTMj2X3DWvrkhVmUiPo6Ihp+PftJ4xQTd099yr5bAh
         v9FxARMgklGbiRK6sWXFPLo/cPiADpyhL6gDpsPNVstuH1tJ1lFkww6GHb+C7Nzz1Fi+
         LUcqAN15Y4mZrpJnRtQvonWVRI89IAnY4qnhR58QZHCGRm3h/X2zcIdqoEeyU7Nbwh9R
         ZZgLtOhzJbDTlR9ukYuwmVmNtycOFc1DUyNj8/XLleoneMLOMPCjoWTX3W0hSbJWpGiq
         vRSfkiZzJOo82j6RCVyDrPScOgJB2GTA5+P/dcvu/CQJiWlbJO0fofMXCaXib0rsNq6q
         oN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737085073; x=1737689873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbRhauMuE7vnNEQUajYDJYV2KJ4uJrNBBU7umCd3XAo=;
        b=AoqTcqE5YXjp5qpjZmGo6KS9o5s6zWMlIc64VkVRFToG8/50T82LUt7Lx0Dg0hggim
         9AtOk4as2d3KCdFbtyeTXqaH+IVdD2eHuA55Op8VBwLHCovsdCUqCUw7WTVPkzvQc/sB
         z3+U6UxncZg0l9rvJKpVi2ZSk63A3V59qC051E4yWjmXPVBbca4N6ovzcvs2t3PovWPD
         kOY1lJ4EBX6rvnq5/XscWB2Y4keSFwEfAoiYYjp5AxRf5DwdhmoJUvCRFnTUN9ofyFrg
         tkrqs2HAMzMr5BT4f9RksQVjnGfR85KWN71LGyumnOwy7VYDX27D4aSG8K+axAc7r4Zd
         pzlA==
X-Forwarded-Encrypted: i=1; AJvYcCUuLcmJA9pD4JVLc6ajZzOmWF9Cij9EwPkXs4YGqRs5ovak/SOEHM0ByclikioXp8B0kGQGzujnXEhyJyTt@vger.kernel.org
X-Gm-Message-State: AOJu0YxGs6C1+X/Onv/+JG0oMGKHvCphMpaQspyNiKHLa0pjU7y8rvZf
	MB5oWn8IXWtNodpSBv+hNyLIdW35ZNqSoc7K+QaJxTpQMXAFLW4R+yC5Pqb/RZo=
X-Gm-Gg: ASbGncsIUhH5qZrazVoxIIci92U47hsqw/i0Q9/VT8YZr1WbVCM8IFIouAD9PwjN3xl
	KdpEHuzHC6kWPnWkjJNHebQz8rsy7Hvmn2n/jLRKvgWgaZi4Bpbd8b1IKsj1Ngz54pFMjuyYK1+
	J/M7GRSzOnQPfpUQx+45q2FBPsT/zZcy2M6e1fBExL24owTbJwN/LZXQaOzoAta6snT/ihoy3E7
	J25vkEbXWWARQF1dm8VXFgk05wRy5hMkwjJsdJ8to5FRUHAcY9TmTdSWR48NqtsPwIrv2jPZiqx
	7Ho+Pxm5Ue4eFND0ZsNHAQQNSUF+Ov3pR4Tn
X-Google-Smtp-Source: AGHT+IFOT1+RQIjsjZXqf2Cffm/N+YEVBjWGmnuiuZFzm+cpHfW+kc9gDgzw7QaN3oySnGnlkKtSug==
X-Received: by 2002:a05:6512:ad5:b0:542:2190:9d99 with SMTP id 2adb3069b0e04-5439c22d7fcmr220660e87.6.1737085073255;
        Thu, 16 Jan 2025 19:37:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af62dbdsm195439e87.144.2025.01.16.19.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 19:37:51 -0800 (PST)
Date: Fri, 17 Jan 2025 05:37:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
Message-ID: <a5ezjovkywse5pvzkm6gpgxrylfzxoahld46nenhfwa4xh2vf6@dhiwwbxauvrk>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
 <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
 <CABymUCPa_k7OriJcDNZmCER9zhK-vk78NaK5HpV8-+Ta+MQQMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPa_k7OriJcDNZmCER9zhK-vk78NaK5HpV8-+Ta+MQQMg@mail.gmail.com>

On Thu, Jan 16, 2025 at 11:36:21PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 18:08写道：
> >
> > On Thu, Jan 16, 2025 at 05:49:43PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:00写道：
> > > >
> > > > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > > > Store pipes in array with removing dedicated r_pipe. There are
> > > > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > > > required for quad-pipe case. Generalize the handling to pipe pair
> > > > > and ease handling to another pipe pair later.
> > > >
> > > > With the first sentence being moved to the end of the commit message:
> > > >
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > Minor issues below, please address them in the next version.
> > > >
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-------------
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > > > >  3 files changed, 112 insertions(+), 102 deletions(-)
> > > >
> > > > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > > >               return -EINVAL;
> > > > >       }
> > > > >
> > > > > +     /* move the assignment here, to ease handling to another pairs later */
> > > >
> > > > Is it a TODO comment? It reads like an order.
> > > >
> > > > > +     pipe_cfg = &pstate->pipe_cfg[0];
> > > > > +     r_pipe_cfg = &pstate->pipe_cfg[1];
> > > > >       /* state->src is 16.16, src_rect is not */
> > > > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > > >
> > > >
> > > > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > > > >  {
> > > > >       struct drm_plane_state *state = plane->state;
> > > > >       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> > > > > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > > > > +     struct dpu_sw_pipe *pipe;
> > > > > +     int i;
> > > > >
> > > > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > > > -                             pstate->pipe.multirect_mode);
> > > > > +     for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> > > > > +             pipe = &pstate->pipe[i];
> > > > > +             if (!pipe->sspp)
> > > > > +                     continue;
> > > > >
> > > > > -     if (r_pipe->sspp) {
> > > > > -             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > -             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > > > +                                     pstate->pipe[i].multirect_mode);
> > > > >
> > > > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > > > +             /*
> > > > > +              * clear multirect for the right pipe so that the SSPP
> > > > > +              * can be further reused in the solo mode
> > > > > +              */
> > > > > +             if (pipe->sspp && i == 1) {
> > > >
> > > > Wouldn't it be better to `&& i % 2 != 0`? Then, I think, this condition
> > > > can stay even in quad-pipe case.
> > >
> > > If all pipes are in solo mode, there is no need to test ' i %2 != 0 '. Below
> > > test shall be better, right?
> > > if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1)
> >
> > Again, this will not work as expected for the SSPP-sharing case as it
> > will then clear pipe 0 for the sharing planes.
> >
> > Let me think a bit... This code resets multirect for right pipes. It was
> > added back in 4.9 to fix the case of 'master' aka RECT_0 not being a
> > part of the atomic update. However I don't think this is applicable
> > anymore. We use z_pos normalization, so all planes for a CRTC are added
> > to the commit. Please drop this piece in a separate commit.
> 
> You mean only testing sspp as below? We have to handle the default
>  non-shared case as existing implementation. Maybe we add a flag after
> sharing SSPP among planes? Otherwise, how to distinct the shared
> SSPP case and disable multi-rect mode in non-shared case?
> 
>                if (pipe->sspp) {

I was thinking about dropping this piece of code completely, but we can
do it afterwards. Note, that you check for !pipe->sspp few lines above,
so the code can become:


 for (i = 0; i < PIPES_PER_STAGE; i++) {
   pipe = &pstate->pipe[i];
   if (!pipe->sspp)
     continue;

   if (i % PIPES_PER_STAGE == 0)
     continue;

   pipe->multirect_index = DPU_SSPP_RECT_SOLO;
   ...
 }

> 
> >
> > >
> > > >
> > > > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > +
> > > > > +                     if (pipe->sspp->ops.setup_multirect)
> > > > > +                             pipe->sspp->ops.setup_multirect(pipe);
> > > > > +             }
> > > > >       }
> > > > >
> > > > >       pstate->pending = true;
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

