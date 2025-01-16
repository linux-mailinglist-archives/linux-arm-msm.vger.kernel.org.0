Return-Path: <linux-arm-msm+bounces-45245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21CA13704
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F01E163DC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90411DD88B;
	Thu, 16 Jan 2025 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QR47Hq5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251EB1DC9BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021122; cv=none; b=n/Dt1YjYQSBZ223Uk5ReMf7xDQREnS8GSuhKHE/Se+GRHC4ahTQ9IbLTmq+Wz5d+DQ+RV/ooJ+l1Fb9iUSKZadqfktxQPQvI+YU0LeXOVuTJgW7jLUuV7Q1mbUxiWIb6GK2HchnUdtO/hXknN2YDdBAd8eNOiohf+Z4giFicFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021122; c=relaxed/simple;
	bh=KzTZK89KctQ5GsAeK1akuKzVL8N/WO4ByIUtHzaX/0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7gnqqQtQr3eNb/JngDf9G9mJKvC7CH17qaysteeeFLyXtxs00HnSJUOU+uwC1Dtet5b0QJh8OsLeFz8CzDBgqGhTtMsT++X206gIZdJLvrq8z3zkOlkg1dNNPWywe+Rzyyz4ozmDRK3gotoOt2fBmzLxj1acdmv+uhmAPVflcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QR47Hq5H; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e398484b60bso1153369276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 01:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737021119; x=1737625919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHkHmJVyVw2q8SHd/lGtIIaMHF7t+fsEzhn65ZBqGG0=;
        b=QR47Hq5HdhXCUOg/Tw5B3X5zLuPuN9hYFcVxkBVchf/9qJwwdcDMgCR7L7LYyVzlBg
         KjUKEEn9n/ksQO2wg+bt1UF3Y5NHCh6HhY1N+4rEY73HG/2uBtrnQ+asbKMS6YL2o/to
         qz9O3ExMwuuSkrXJgtlyP6rq6+pJdt51Q484W3j52UlaE1eqzIsq1Y2dgJcUyprThTZy
         NPqfCwN9/hDVXS0Ht9Zq5zZUJ+ZdwD7mXfNSN3tG6jk5K/1uViwTKJzl8PQOVRoxv+DY
         Y2tyImAqR55TfTBhXBXXTDUT7YwCKWEZ16pZqTwoDrQWkSqAS3iiRTM5TQnMmRXsSlKR
         uJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737021119; x=1737625919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHkHmJVyVw2q8SHd/lGtIIaMHF7t+fsEzhn65ZBqGG0=;
        b=Sc4mmQtwxWypX6ohiWz56i8ECGZBj2WDkmM9DhDiGqXGLlIXnGsmd9PQeyy9HXqsE5
         WAwwNdFGvmqQVUnqNi1xrUyjaCa0Xf1sRo3UpNzJmoAMQ9tyIoDqc2iI9yY+i23Zpv59
         HVTxdDHRnlpilNYgu3HNdXQnpuvHYoJT38c4ZI53IFQp0uXGwkV+OA+ZeHoMVF0iYfws
         kA3cgH+sm5r3W47D2jvFz31sbyggoJcKChzqQb9Rsta8PsDuSw9wDFVEyStT/ZGPhQpe
         43sjudQs1RvemK52M+Rgxim4BqlY4r62GTxSJhiuquI4bl+BFi6tyOfaYwTegdvs8BrA
         J+pg==
X-Forwarded-Encrypted: i=1; AJvYcCW24QZF1dPwR7X90RNSxfYSZ7OMCdVOR+jG3nr8tQuhcQ4d+3RM++67K+1ZpSskzBQSJRpMhv8BypU/038p@vger.kernel.org
X-Gm-Message-State: AOJu0YyJDlgjPY62SpaUC2Z02pFRMfXHRyIfqaqP+JW1GSQAkBeLSJD+
	/he4nC2YT4O50YRNqQnUPbxAGx3ZfEr9ZEXGL17Py+gDZcrm2r05VR287ysdG1SGeokGcF1rN9Q
	xGVwafzeY90hJPBRxZwPlXdF4uAFYuHyCCzdD8w==
X-Gm-Gg: ASbGncuMabmfIs8zOOEECABRXiZu8pFl7EGNDBBbVPH1JnafDjgsMhOg3ACZBFXmUQQ
	hM2Fkdam7mlKGeeilsE1wCtAp+uII3jtMb1DC7g==
X-Google-Smtp-Source: AGHT+IEPamgQ8A4umLwLWvzdOq5abqzsKPymyE869UdE7JGW5hBM/FhvB7/cu7uZnuZjcd4X4d8keygBo36mKeTM5aA=
X-Received: by 2002:a05:6902:2001:b0:e38:c0ed:8128 with SMTP id
 3f1490d57ef6-e54edf4181emr26876714276.3.1737021119084; Thu, 16 Jan 2025
 01:51:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef> <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
In-Reply-To: <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 17:51:48 +0800
X-Gm-Features: AbW1kvZx8A6GtE-n-Wp7iPIdMM92jpshgFLQ0sM3KOw4L6IGEW1Av757xu2vCFE
Message-ID: <CABymUCPeaG0PVBhNdvhXp=GK9RGqsqDfLLv0w+icBmHwn_hiKg@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=8816=E6=97=A5=E5=
=91=A8=E5=9B=9B 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:00=E5=86=99=E9=81=93=EF=BC=9A
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
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++---=
----------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > >  3 files changed, 112 insertions(+), 102 deletions(-)
> >
> > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > +     /* move the assignment here, to ease handling to another pairs =
later */
> >
> > Is it a TODO comment? It reads like an order.
> >
> > > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > >       /* state->src is 16.16, src_rect is not */
> > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > >
> >
> > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct =
drm_plane *plane)
> > >  {
> > >       struct drm_plane_state *state =3D plane->state;
> > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > +     struct dpu_sw_pipe *pipe;
> > > +     int i;
> > >
> > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > -                             pstate->pipe.multirect_mode);
> > > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > > +             pipe =3D &pstate->pipe[i];
> > > +             if (!pipe->sspp)
> > > +                     continue;
> > >
> > > -     if (r_pipe->sspp) {
> > > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > +                                     pstate->pipe[i].multirect_mode)=
;
> > >
> > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > +             /*
> > > +              * clear multirect for the right pipe so that the SSPP
> > > +              * can be further reused in the solo mode
> > > +              */
> > > +             if (pipe->sspp && i =3D=3D 1) {
> >
> > Wouldn't it be better to `&& i % 2 !=3D 0`? Then, I think, this conditi=
on
> > can stay even in quad-pipe case.
>
> If all pipes are in solo mode, there is no need to test ' i %2 !=3D 0 '. =
Below
> test shall be better, right?
> if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_RECT_1)

See your comments for later patch. Let's keep it as:
i % PIPES_PER_STAGE !=3D 0
>
> >
> > > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > > +
> > > +                     if (pipe->sspp->ops.setup_multirect)
> > > +                             pipe->sspp->ops.setup_multirect(pipe);
> > > +             }
> > >       }
> > >
> > >       pstate->pending =3D true;
> >
> > --
> > With best wishes
> > Dmitry

