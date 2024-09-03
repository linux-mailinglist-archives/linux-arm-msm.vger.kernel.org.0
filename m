Return-Path: <linux-arm-msm+bounces-30497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AA496980F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8F1285548
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0021C7677;
	Tue,  3 Sep 2024 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKT2Zdst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD051C7660
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725353966; cv=none; b=Y44+CglBViGMEr31/L9pBs/MKqsO+Oubgi5Lg1eekz+Bd3XNdiCGXqkk3RmTYaalmr0NBFJDODhOfFSyxI2QyZ4IdL3sIO5j1sLdXrOEU9VhaqXDAaEL3ynpFLk72Q2Olpnc5ptPnkP9WrBgS0CkeAD14/iK91E2CsaNw8StpLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725353966; c=relaxed/simple;
	bh=43dvIqYq1aTUBVKac9ylC5fQvUAh+5J8rOpcgHY4avI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XF45aTGpOaF3RfQyhB5k4VhUYWSYGtPsMEjlNAN8xdsJslpJajxsC71Wj8XrSukTeOzZywDMMFcRb4xaQLvvhPiTzsdENdCzqi6YBC+WOL82PNiakfItNF5TKRFG9+A2UQW4um5hD0HXlcKSW3CtmYQcvMckMtSkzuFdywgRB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKT2Zdst; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d74ff7216eso15363577b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725353963; x=1725958763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjMrP6ByPwO+xl7QUgd6pIme65ZPvQHEPoRMFWbC26U=;
        b=oKT2Zdstkl5mlXFgHGqiwbeLNBIQ3JTFn81R6V3f2GwI5U+3mf7r1ITCHpkkPkRvj6
         Uo4lub6JZPDSFju7EXgtc3FzJtHVlC2lt2aiiVwrW7ntSFjn9DTYxYMHK7cgeOmVJIP3
         zVq9ouRwK96jgo14DdIQnMq8kphnNQqd2u1BTNx6fmWqUXq4/a6b/QrqgHN2Jnl03oNo
         BIJmLzKErrHS5C1vrYXwGDJqMRGylFy2JsOsL3UbhbvYH/855psxanKcbhkA+oNxf3Cf
         a1vzMPlH22uIdqcry4MLkR5YgZQvLHCwx8VMbEssWzatgL6wxB0fbD2774M1scu4QFIu
         FsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725353963; x=1725958763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjMrP6ByPwO+xl7QUgd6pIme65ZPvQHEPoRMFWbC26U=;
        b=p2OLb/2SelSJIMbIHbPrny4QLeIMZX8DzCo7s9yqoR6TWQL2ve/SFWwV/bKl8ZttiA
         +YIcPCbTnIccegJfg34lZwylsIP4FNTLBXtmjr8YmDtIaQ6rJpkIKDEUS9oHlWOvxL4u
         fn9frBhRWgIF2izBvBbi5gOmRfT8akfFXhXqe9jyciNb2zuneTHS/GARjPYK6yWc1lvv
         K9HzpQ6wXpfoiJAeFwjiigwjYua4556/P6e6uu2OTu4fQMU7BCKoeS5aPPjTtrPbZGBQ
         Q+oMmufC3n4qmzoU7HuJdTpUWNMfbKGpL7ZaZhNIVrnmqKoOmYkEGOx6klVTHmo0k2ve
         WhVw==
X-Forwarded-Encrypted: i=1; AJvYcCXs3CDb937jPs8Rn4Z/7Q/Y1BIvtJPRId8jNm9+/Jyat59ugGiHVb7SrBO42xbEyXaDu1Q5xEs7QKZJzOc4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/N4Y4z78Givx2Ig7cAj5x0lSATULnJYhEEYnem7V9Gk5UgQK9
	EzVXKN88RGCncr56ONNsIBUNHxO2Z4aRDP4GJ0RtwkXLNMkB5qI1Hn3ZsG0lNA3gxmPK++xE0k4
	yJML91ndSnSNsYOKBOlWSG9mV2JUaMek/cqW8zA==
X-Google-Smtp-Source: AGHT+IHS0GzsmdR0si/TrTMH3ZQl3LYKdLuzZSFZv49wDd4H/iof6WJG/gETGwxahkV73EWWQ97UX7TrN4rJsUmUCi4=
X-Received: by 2002:a05:690c:dca:b0:65f:93c1:fee9 with SMTP id
 00721157ae682-6d40ee5716cmr147698137b3.9.1725353962947; Tue, 03 Sep 2024
 01:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-13-bdb05b4b5a2e@linaro.org>
 <CAA8EJpoRiF5uYUeeVog6QU+5f64eBzVDwafopXLnRkW5EiW6Eg@mail.gmail.com> <CABymUCPPXk3Nc-GUCy63V9HcCUyywx7tMCjbHzrTz3joA5=8ng@mail.gmail.com>
In-Reply-To: <CABymUCPPXk3Nc-GUCy63V9HcCUyywx7tMCjbHzrTz3joA5=8ng@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:59:11 +0300
Message-ID: <CAA8EJpqDWZiGawPtMXgY9evOWOZ6bTqmgBgks7rXxr4VC5tCXw@mail.gmail.com>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Support quad pipe in header files
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Sept 2024 at 10:51, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:30=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Support 4 pipes and their configs at most. They are for 2 SSPP
> > > and their multi-rect mode. Because one SSPP can co-work with
> > > 2 mixer at most, 2 pair of mixer are needed for 2 SSPP in quad-
> > > pipe case. So 2 mixer configs are needed in quad-pipe case.
> >
> > As you wrote this is based (depends?) on the virtual planes, then you
> > know that the code already uses either one or two SSPP blocks to drive
> > one sw_pipe. I'm not sure what do you mean by "2 mixer configs". There
> > are 4 LMs and 4 mixer configurations in the quad-pipe case. The commit
> > message is thus misleading.
>
> This patch set depends on the virtual plane patch set. The mixer config i=
s
> not a proper term per your response. It is from DPU2 branch. Maybe
> clip_config is a better term for this. The config is used to split the pl=
ane
> into 2 mixers pairs and 2 DSI interface with 2 halves of full screen.

Let's understand why you need it at all. The sw_pipe should be
agnostic of the "left-or-right-half" part of the story.

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 11 ++++++++++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   | 30 +++++++++++++++++++=
++--------
> > >  3 files changed, 33 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index a2eff36a2224c..424725303ccad 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -32,7 +32,7 @@
> > >  #define DPU_MAX_PLANES                 4
> > >  #endif
> > >
> > > -#define PIPES_PER_STAGE                        2
> > > +#define PIPES_PER_STAGE                        4
> > >  #ifndef DPU_MAX_DE_CURVES
> > >  #define DPU_MAX_DE_CURVES              3
> > >  #endif
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > index fc54625ae5d4f..ae6beff2c294b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > @@ -143,11 +143,20 @@ struct dpu_hw_pixel_ext {
> > >   *             such as decimation, flip etc to program this field
> > >   * @dest_rect: destination ROI.
> > >   * @rotation: simplified drm rotation hint
> > > + * @visible: mark this cfg is valid
> >
> > So is it valid or visible?
> Yeah, valid is better than visible.
> >
> > > + * @mxcfg_id: mixer config ID for left or right half screen.
> > > + *             We have single SSPP, dual SSPP, single SSPP+multi_rec=
t or dual
> > > + *             SSPP+multi_rect case. mxcfg_id mark current pipe will=
 use
> > > + *             which mixer cfg. The first mxcfg is for the left half=
 of screen,
> > > + *             the 2nd mxcfg is for the right half screen. The headi=
ng cfg may
> > > + *             be skipped by pipe with the first mxcfg_id =3D 1 if t=
he plane is
> > > + *             only displayed in the right side, thus SSPP goes to l=
ater mixers.
> >
> > too long description for an unreadable name.
>
> Maybe the clip_id is better per above discussion?

No. Please use clip when something gets clipped (e.g. because the
plane displays just a part of the framebuffer).

> >
> > >   */
> > >  struct dpu_sw_pipe_cfg {
> > >         struct drm_rect src_rect;
> > >         struct drm_rect dst_rect;
> > > -       unsigned int rotation;
> > > +       unsigned int rotation, mxcfg_id;
> > > +       bool visible;
> > >  };
> > >
> > >  /**
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.h
> > > index e225d5baceb09..9e79cf9eba264 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > @@ -14,14 +14,30 @@
> > >  #include "dpu_hw_mdss.h"
> > >  #include "dpu_hw_sspp.h"
> > >
> > > +/**
> > > + * Max number of mixer configs. Because we support 4 pipes at most,
> > > + * the 4 pipes are with 2 SSPP and their multi-rect mode. While one
> >
> > Or 4 SSPPs. Or 3 SSPPs. Or even a single SSPP if it doesn't cover the
> > whole screen.
> >
> > I'm really sorry to say, but I can not understand this text.
>
> Yeah, lots of usage cases are not mentioned here. It just describe how th=
e
> config number come from. It should be the number for screen clip rectangl=
e
> in a full screen.
>
> >
> > > + * SSPP can co-work with 2 mixer at most, then 2 pair of mixer are
> > > + * needed for 2 SSPP in quad-pipe case. Thus 2 mixer configs are
> > > + * needed in quad-pipe case.
> > > + */
> > > +#define MIX_CFGS_IN_CRTC 2
> > > +
> > >  /**
> > >   * struct dpu_plane_state: Define dpu extension of drm plane state o=
bject
> > >   * @base:      base drm plane state object
> > >   * @aspace:    pointer to address space for input/output buffers
> > > - * @pipe:      software pipe description
> > > - * @r_pipe:    software pipe description of the second pipe
> > > - * @pipe_cfg:  software pipe configuration
> > > - * @r_pipe_cfg:        software pipe configuration for the second pi=
pe
> > > + * @pipe:      software pipe description. Some or all of fields in a=
rray can
> >
> > array has elements, not fields.
> >
> > > + *             be in use per topology. The heading fields are used f=
irst,
> > > + *             and the later fields is invalid if visible field of p=
ipe_cfg
> > > + *             is not set. For example, the visible fields of pipe_c=
fg are set
> > > + *             in the first 2 pipe_cfg fields, and the mxcfg_id for =
them are
> > > + *             0 and 1. That means the first pipe is for left half s=
creen and
> > > + *             the 2nd pipe is for right half. The visible field of =
the 3rd
> > > + *             pipe_cfg is not set, which means the 3rd and 4th pipe=
 are not
> > > + *             in use.
> >
> > NAK. A single LM pair might already need two sw pipes.
> > After reading the comment I have doubts that you understand what the
> > code is currently doing.
>
> This describes that  a right half only plane will only use the first
> pipe/pipe_cfg with
> valid flag and clip_id flag. So the later 2 elements of
> sw_pipe/pipe_cfg arrary are not
> used.

I'd suggest doing it in the opposite way: always use 0/1 for the left
part, 2/3 for the right part. It should save you from all the
"visible" and "mxcfg_id" story.

>
> >
> > > + * @pipe_cfg:  software pipe configuration. The 4 fields are for SSP=
P and their
> > > +               parallel rect as above pipes.
> > >   * @stage:     assigned by crtc blender
> > >   * @needs_qos_remap: qos remap settings need to be updated
> > >   * @multirect_index: index of the rectangle of SSPP
> > > @@ -34,10 +50,8 @@
> > >  struct dpu_plane_state {
> > >         struct drm_plane_state base;
> > >         struct msm_gem_address_space *aspace;
> > > -       struct dpu_sw_pipe pipe;
> > > -       struct dpu_sw_pipe r_pipe;
> > > -       struct dpu_sw_pipe_cfg pipe_cfg;
> > > -       struct dpu_sw_pipe_cfg r_pipe_cfg;
> > > +       struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> > > +       struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
> > >         enum dpu_stage stage;
> > >         bool needs_qos_remap;
> > >         bool pending;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--
With best wishes
Dmitry

