Return-Path: <linux-arm-msm+bounces-45243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F1A136F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1120167D94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92EE1D89FA;
	Thu, 16 Jan 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIITjBt9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACF18C332
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020996; cv=none; b=KaGAQTHQ9NQjEhR+ZL8sJMfseFFcW3D0i44Uu9WEp6gUZ+8RX/2/YAtt5xOMGOA184zp90I60VqwUgKl9xLUyCDMv5p+vViuh73rQUT2wmvEsRaQV8S8yT1gjpGfLkEBOYtVKUDUVZsHdKlSl9SZSfFavMSNRT9XqcLdaoJKq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020996; c=relaxed/simple;
	bh=no1chb6NSqqwbTYb36QVCP13pBGDk/s2w/DqfglvOmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ex/qNQforb5SkMkaCWpNrjCNUskdNp3PwKCYYkVcCNhhZ7f/K9Kz1s+eZrZQWr63qFyoYLlVOp90PerXppj+y7eLblFmHiMQGBgRcaO4duYsw/hgTf/UB1XpwO87A+BGWrc2OACsRB42xhmTyp1PPf68uBwhGXogz9Du9VBmQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIITjBt9; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e3983426f80so1131949276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 01:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737020994; x=1737625794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpI6PkeKxs4La2peZtwi+NZrR6YCbXN2P1PW0muNPlo=;
        b=PIITjBt9IK58MqLWImtvkm/O5WeZt3baj0dARUzFv1IfW66///1WnoOExJ3vxwQM2y
         /9brtpUTKNUJJT8uTIJzj2/Vt79LptAQ7JpgxiG12c27+EXe/xeih9NFI6QUv+W++2KF
         03Jx4NbvEOaNKZhh5R7bfrRC+p15lPJ5JaM1yMmJG/xUsuNWZSFdqWOgIEeuDPimg22y
         H3p7pFxcjTkGPxQE/N4rfk3YvzAcXj/Bjz4uYjcb4IC+aEzY21BjrS4lMIFGmwrBslCQ
         xmUXkVQnL4DaIJJb5Q+IC2Dh/hJK9kA8ShZ0XBH4TB6JJw1MkpoeOLCFKW0fTsy1Ld71
         wB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020994; x=1737625794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpI6PkeKxs4La2peZtwi+NZrR6YCbXN2P1PW0muNPlo=;
        b=mePSS9ebK8O6VrlMukVKuPCoxfb4bHwng9eWbQX4Td5tA2v/NbQu31zNVBbSSDnkBl
         6vjPYM2/X///o+8Fq6ZYKec9VXr3aFNLMEZIGQvSUQ4AQyr8xmjicCtMNHlKxY75POwu
         kEinN3KIYmwVGOEupUzCghZ8B3xmMVdU2LQrMta9+BOHspX4nRGJtY/jsNyxqqyRm3jY
         JkwNGgF4xB+CB7qDisVdZj5fS66Rtt4hfb5TAlFfxYCzYAaHkE9t4hsoH1S62HkPdJP3
         CkCsx56DvFn5vWpbR5vEdqGJhj75swfqPk6eNOPaaLDGw34NMed4hwubNxPjvHzz7kok
         YSCw==
X-Forwarded-Encrypted: i=1; AJvYcCXt3oYUAPCUPqPty7trKCy/rTxyDNlznyAl1ch547bQxuip76B7qUJawitzXMKvcW6T1hsLCM9OhupIbN5+@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+sM+4pdExpEnm6wwRSVDNRO/xTO9hgbfQbY3fz8TW7ePqvPu
	vXz+iArpe4oQBLLnmzI247DVf9oeCFe1qcL12gX3faM/ntvWLw7eTdDxkoVKP95InlCgpQBqZ9K
	v+TlF1aA0eRHOHaa29DzBDyXRHa4iPO3Qtf1jFg==
X-Gm-Gg: ASbGncuz9qO2iniK6EL+37j7ofzDJBpnnhIBRLdi35xcgB68lXOLwTZn89vRU7wCY7C
	tRW1lP65Kfiz/QXqV8K33kXgyj8OhORc8EqoZmw==
X-Google-Smtp-Source: AGHT+IHsUYmbTKsUERg4PfYdjvqQT5L0zUvj7zKKOodZZe9rrGFoJnyZOZnpy+8qKbTSyrG2OPRnZ2rr1I1fJULeFAw=
X-Received: by 2002:a05:6902:1209:b0:e57:8814:1399 with SMTP id
 3f1490d57ef6-e5788141813mr6478134276.44.1737020993767; Thu, 16 Jan 2025
 01:49:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
In-Reply-To: <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 17:49:43 +0800
X-Gm-Features: AbW1kvaD57nyzT6yujFT9rwov5zHgBxS9AhICFkcPyff2wmU_ZFd8JowLM7kwEE
Message-ID: <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
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
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > Store pipes in array with removing dedicated r_pipe. There are
> > 2 pipes in a drm plane at most currently, while 4 pipes are
> > required for quad-pipe case. Generalize the handling to pipe pair
> > and ease handling to another pipe pair later.
>
> With the first sentence being moved to the end of the commit message:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Minor issues below, please address them in the next version.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-----=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> >  3 files changed, 112 insertions(+), 102 deletions(-)
>
> > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
> >               return -EINVAL;
> >       }
> >
> > +     /* move the assignment here, to ease handling to another pairs la=
ter */
>
> Is it a TODO comment? It reads like an order.
>
> > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> >       /* state->src is 16.16, src_rect is not */
> >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> >
>
> > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct dr=
m_plane *plane)
> >  {
> >       struct drm_plane_state *state =3D plane->state;
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > +     struct dpu_sw_pipe *pipe;
> > +     int i;
> >
> > -     trace_dpu_plane_disable(DRMID(plane), false,
> > -                             pstate->pipe.multirect_mode);
> > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > +             pipe =3D &pstate->pipe[i];
> > +             if (!pipe->sspp)
> > +                     continue;
> >
> > -     if (r_pipe->sspp) {
> > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +             trace_dpu_plane_disable(DRMID(plane), false,
> > +                                     pstate->pipe[i].multirect_mode);
> >
> > -             if (r_pipe->sspp->ops.setup_multirect)
> > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > +             /*
> > +              * clear multirect for the right pipe so that the SSPP
> > +              * can be further reused in the solo mode
> > +              */
> > +             if (pipe->sspp && i =3D=3D 1) {
>
> Wouldn't it be better to `&& i % 2 !=3D 0`? Then, I think, this condition
> can stay even in quad-pipe case.

If all pipes are in solo mode, there is no need to test ' i %2 !=3D 0 '. Be=
low
test shall be better, right?
if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_RECT_1)

>
> > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +
> > +                     if (pipe->sspp->ops.setup_multirect)
> > +                             pipe->sspp->ops.setup_multirect(pipe);
> > +             }
> >       }
> >
> >       pstate->pending =3D true;
>
> --
> With best wishes
> Dmitry

