Return-Path: <linux-arm-msm+bounces-45292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3FA13DCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 16:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50BD0188C668
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35DA22B8CA;
	Thu, 16 Jan 2025 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/2N6ix6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E722B8BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737041794; cv=none; b=UH244mxwRAVq3cv7Fwt/ix09S1MI125/j1QGi5IHpsxcExebclgM67E1wvCRCIDHTVhIoRhxYbUMPH62JBfkeku98xc8Ut8PZ6hrHIgf6Q5vE8gqpaLebLqqbEXj34Lf0++W2J9va57TnyCcNWzIhjc4peq7bEbPQcnIalPc+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737041794; c=relaxed/simple;
	bh=I8xGvlStNM3CsxSWyUQwiebqdcck0Nqe6NvMZqAPtno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdZvYPPwmFt/NdHyHVmOpTU0LFIQWKHVmHDOjciZdwBbIyUSdibKgfvSKSqQyxuNTWTSR99jlyPTnia5kSWQWSoOkVK+cwxn+iQLFSKRenP2/Xk7lhKjOarIP2Ewoqr7wZeu3Ru2CLY4i9qq8rQ5ekd7BG+/xrSu5g4+ZlcUid8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/2N6ix6; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3983426f80so1684158276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737041792; x=1737646592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu0YL2cR5qf4RDKaSc6EL4rrNDHMX6AlalCb9gr7/tY=;
        b=N/2N6ix6/00EnH1S+/dd8tu5h+Iv4c6n5p78Mct5cHjSsMdWR9Gvn/IeipTYm/vnJr
         JQbkriitNthOLbXyzKeMjqAyixyk/KiVIvTkz5GHV8e4cymGwLlGNzGLHgY6UL+Pc8B1
         vAfm/6HqvvapzNXwSeK6AAXBCsZuYyHTF4X6NcboQz9fGeDqQUl3xjGqnxFnh/1MDS/+
         SeDRge4qG+SrbmHnTNpBE+esiP9NKpoz9MVG1Ty0xzoBwePMhTwX3v9SPlx9OtPKB8r7
         9izjcXLtTImiK88S4lA7ZeMlQm2pNpE6Odh85j52cMo7NYW9O2BQeKkBIrdXqlfCMsaQ
         mkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737041792; x=1737646592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu0YL2cR5qf4RDKaSc6EL4rrNDHMX6AlalCb9gr7/tY=;
        b=N7LpNDVCUV06LE35FvzbewRJj8ub6afjq3zn8CcISlpcuUbDCr8gXPTkdj6S6STBPf
         6+iUeWWQ4XHAgalDFM3bv0/XOV5NDefHtYvUF3JYGhtut4pnLzniRTc8kKFz4AgDGaax
         Ud3/u4oksOxn6WoVlZK0IGzcTZl2bKcMMQmBYoF3R7++WdO/Rj7bYmXkioeIZqkNu+so
         ILv913tcGKS1WyCfqLwHHeO76D3EUQ5qWV6fViA4qcvAs1Kii3mdFwUetv45+97qlizH
         7i0v/1GAqIfT/oLitbiROOXcGY03hVsPblHkomewkuVkThHdKnhNZe053X9Y9dkEVJmB
         Id4g==
X-Forwarded-Encrypted: i=1; AJvYcCVy21JKZUEePe8zjNRlKUxdOYAKGHEo8AVs5YoKv0Il1eEk1cPEPyfcp8J6rjvKvQowhImNv16nko08QCZl@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjpQKKCb/dQUZNit2c6Y3rexi1kLdfaYh5qw/SzFiRgJmYXmS
	j6fFFlRPhoY5QWvY+43egr9WEWG6aSL5QjYQSfQ8mN2Gcb/r/xtai/99Rc4FBStbs9fvIfyqw62
	pXLwqTOdCGHv0KF3KE1UHhzSguspaiy42H5KTGA==
X-Gm-Gg: ASbGnct1Cp9/WhFEG3eMacGSfd2lTlLM8nH+tBoZ9sM46aGRTF2TeLPtZ2al5uzIhS8
	P3TJbZclaCdYo6ZB7oo3UgAPvN1WGbLrI3Yz5Ew==
X-Google-Smtp-Source: AGHT+IE2lu1RJ+81fEpNx2WS29TXGJpZrv6nZSZo1ywtrcEHqUGGQ7ZOJqu97lvj99DQhbFcEkOqg4s+u5+aR73vUwE=
X-Received: by 2002:a05:6902:1502:b0:e4b:25c6:54f1 with SMTP id
 3f1490d57ef6-e54ee1ece4fmr27894249276.33.1737041791741; Thu, 16 Jan 2025
 07:36:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com> <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
In-Reply-To: <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 23:36:21 +0800
X-Gm-Features: AbW1kvYXwuBEDYTg5kJTxrLDV19dmEanvAhgmxnLYFZRVVWyY8KWs11jybEQtzk
Message-ID: <CABymUCPa_k7OriJcDNZmCER9zhK-vk78NaK5HpV8-+Ta+MQQMg@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 18:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 05:49:43PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=
=E6=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:00=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > > Store pipes in array with removing dedicated r_pipe. There are
> > > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > > required for quad-pipe case. Generalize the handling to pipe pair
> > > > and ease handling to another pipe pair later.
> > >
> > > With the first sentence being moved to the end of the commit message:
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Minor issues below, please address them in the next version.
> > >
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-=
------------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > > >  3 files changed, 112 insertions(+), 102 deletions(-)
> > >
> > > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct=
 drm_plane *plane,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > +     /* move the assignment here, to ease handling to another pair=
s later */
> > >
> > > Is it a TODO comment? It reads like an order.
> > >
> > > > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > >       /* state->src is 16.16, src_rect is not */
> > > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src=
);
> > > >
> > >
> > > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struc=
t drm_plane *plane)
> > > >  {
> > > >       struct drm_plane_state *state =3D plane->state;
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > > +     struct dpu_sw_pipe *pipe;
> > > > +     int i;
> > > >
> > > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > > -                             pstate->pipe.multirect_mode);
> > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > > > +             pipe =3D &pstate->pipe[i];
> > > > +             if (!pipe->sspp)
> > > > +                     continue;
> > > >
> > > > -     if (r_pipe->sspp) {
> > > > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > > +                                     pstate->pipe[i].multirect_mod=
e);
> > > >
> > > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > > +             /*
> > > > +              * clear multirect for the right pipe so that the SSP=
P
> > > > +              * can be further reused in the solo mode
> > > > +              */
> > > > +             if (pipe->sspp && i =3D=3D 1) {
> > >
> > > Wouldn't it be better to `&& i % 2 !=3D 0`? Then, I think, this condi=
tion
> > > can stay even in quad-pipe case.
> >
> > If all pipes are in solo mode, there is no need to test ' i %2 !=3D 0 '=
. Below
> > test shall be better, right?
> > if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_RECT_1)
>
> Again, this will not work as expected for the SSPP-sharing case as it
> will then clear pipe 0 for the sharing planes.
>
> Let me think a bit... This code resets multirect for right pipes. It was
> added back in 4.9 to fix the case of 'master' aka RECT_0 not being a
> part of the atomic update. However I don't think this is applicable
> anymore. We use z_pos normalization, so all planes for a CRTC are added
> to the commit. Please drop this piece in a separate commit.

You mean only testing sspp as below? We have to handle the default
 non-shared case as existing implementation. Maybe we add a flag after
sharing SSPP among planes? Otherwise, how to distinct the shared
SSPP case and disable multi-rect mode in non-shared case?

               if (pipe->sspp) {

>
> >
> > >
> > > > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > > +
> > > > +                     if (pipe->sspp->ops.setup_multirect)
> > > > +                             pipe->sspp->ops.setup_multirect(pipe)=
;
> > > > +             }
> > > >       }
> > > >
> > > >       pstate->pending =3D true;
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

