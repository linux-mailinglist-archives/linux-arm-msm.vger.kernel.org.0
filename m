Return-Path: <linux-arm-msm+bounces-30481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BA969619
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EF591C2316C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE82820010C;
	Tue,  3 Sep 2024 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/a84tGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA62200105
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349900; cv=none; b=lbCFfGqwd4/loLQ0IJr9K0oC5xJMRzSm2Oi/seJhHxbOr+b4uS6Kuu+9A9MEicXtbkP14tBlH/uZXKJvWOn+AHOzgnnKDwf2dIgq4pPhBHmbHFuRlqNYtDfjxa1ayXvQ5/7gn0FnCyei9iCxc184FUh/xmrEkqahamlTZypL8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349900; c=relaxed/simple;
	bh=0lAkV1JaMYZIGy9MfPQpczoX0W7IxABff9Ml9R2HaSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R10u9LYcYJ9HZzBabY8krCX9BQjoJpaa/jAWSZEXNcf5zKSW2isIuzGpcexlhj14J6SCibH1kNkc6NgwfleTJZ2nyY+n9OnEUEUHTJR6Thdmf0c0mS5O8qNiDTP/3ybjE0+Nxe+ydlCi+45GXyHr5qa4+2CRZtKWji+9MsBECEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/a84tGi; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5343eeb4973so7659480e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725349897; x=1725954697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDpBd0DcKFHqi7TRsZxPSmHB+Sopn4xcxaEov6TE0IM=;
        b=V/a84tGiBuEngExvvH6g2ntGf7/O5eJKgx1k0ybYyrpBoPhTPk3JAKGzQGt/ldQsTB
         0g/whdo+6Tb5UWolGQE+WLdRch4mEnahMl3pyR31yWSOJ2M+FUdAtD//wFcVtu67CMkl
         BBqrFUE9ZdRDbVPEbTUXrPalCWGN1+tHnRjF2j6ncpzdWqiERMjJ2ptV6qryC0O98u6i
         9udM0l5uQo5RYzJJVSBeTASxiBE35p/Dc415MhoMwm0rDZTWcYMCRrcEG0TIFkZoyXAi
         n83DfQwZfaOa0YTGDnfQOtnuCag4MoOA7lkwYKM24v2v2NIV0oI4ZuCza61uptWFn5l/
         DmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349897; x=1725954697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDpBd0DcKFHqi7TRsZxPSmHB+Sopn4xcxaEov6TE0IM=;
        b=ZDQN0470h5WcWvh1EDwtUxlmakT9Q3rbdhEdgGDXD+L6OIBRrewz0zLTLOllZs/0PE
         Rln8lAmtfbeeSESbMCSN55ulYwd9tEstPNu4EX1dY4Xhlss25qO6xBEVXAzakkUzjYys
         zKv78xELkk9KbP5jr459H+F4e5+UcnRlX3iZy8ykp6HEnbqFHdepoC1EFQgGJYRTbzT2
         MfsUSRIMIiGF1shU5UGX/PZI+xgFtGOE2jLJWf4+yM6jQ2Q9n3IpsXmb6J10JuYjRyLF
         z6TRgAtF9ILqTtwaPVmU0QyWzwKwoV9OppASf5qJSgnZKPaEpYndJi2sfXwCuehHBvZy
         zTIA==
X-Forwarded-Encrypted: i=1; AJvYcCVEMUwdfm9yb4fsZVTKD7QzOGlAGaarN93hN+t+iObE8ujaqMxlXrs1HSKWLUF/gyY6fyMIv/YABLYmm4oo@vger.kernel.org
X-Gm-Message-State: AOJu0YzT0Sjfb46/R1LszRpiInaaj60md5h4cBIhwkjSuV761gzZsRWr
	DPppuX0OM5YHnddqXi91vj981SmvptQsRUwSkuh0nZ/s5FmZFuoCLpyRLzCWHjpVC8q9WLeiQGd
	rYDVhgFCZd0VWqIZnyoQrHp0pteaj38uG1KBpVQ==
X-Google-Smtp-Source: AGHT+IEJq9Hcf+hYnhDmPSos6p5+3PqNxTwI6P5DnjqhxId6XAa9NPSgnr9L2Qj531r6ftFFDtLGOJNB1kwofYpay64=
X-Received: by 2002:a05:6512:a91:b0:532:fb9e:a175 with SMTP id
 2adb3069b0e04-53546b223demr10487637e87.6.1725349896573; Tue, 03 Sep 2024
 00:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-13-bdb05b4b5a2e@linaro.org>
 <CAA8EJpoRiF5uYUeeVog6QU+5f64eBzVDwafopXLnRkW5EiW6Eg@mail.gmail.com>
In-Reply-To: <CAA8EJpoRiF5uYUeeVog6QU+5f64eBzVDwafopXLnRkW5EiW6Eg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:51:24 +0800
Message-ID: <CABymUCPPXk3Nc-GUCy63V9HcCUyywx7tMCjbHzrTz3joA5=8ng@mail.gmail.com>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Support quad pipe in header files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Support 4 pipes and their configs at most. They are for 2 SSPP
> > and their multi-rect mode. Because one SSPP can co-work with
> > 2 mixer at most, 2 pair of mixer are needed for 2 SSPP in quad-
> > pipe case. So 2 mixer configs are needed in quad-pipe case.
>
> As you wrote this is based (depends?) on the virtual planes, then you
> know that the code already uses either one or two SSPP blocks to drive
> one sw_pipe. I'm not sure what do you mean by "2 mixer configs". There
> are 4 LMs and 4 mixer configurations in the quad-pipe case. The commit
> message is thus misleading.

This patch set depends on the virtual plane patch set. The mixer config is
not a proper term per your response. It is from DPU2 branch. Maybe
clip_config is a better term for this. The config is used to split the plan=
e
into 2 mixers pairs and 2 DSI interface with 2 halves of full screen.

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 11 ++++++++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   | 30 +++++++++++++++++++++=
--------
> >  3 files changed, 33 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index a2eff36a2224c..424725303ccad 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -32,7 +32,7 @@
> >  #define DPU_MAX_PLANES                 4
> >  #endif
> >
> > -#define PIPES_PER_STAGE                        2
> > +#define PIPES_PER_STAGE                        4
> >  #ifndef DPU_MAX_DE_CURVES
> >  #define DPU_MAX_DE_CURVES              3
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index fc54625ae5d4f..ae6beff2c294b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -143,11 +143,20 @@ struct dpu_hw_pixel_ext {
> >   *             such as decimation, flip etc to program this field
> >   * @dest_rect: destination ROI.
> >   * @rotation: simplified drm rotation hint
> > + * @visible: mark this cfg is valid
>
> So is it valid or visible?
Yeah, valid is better than visible.
>
> > + * @mxcfg_id: mixer config ID for left or right half screen.
> > + *             We have single SSPP, dual SSPP, single SSPP+multi_rect =
or dual
> > + *             SSPP+multi_rect case. mxcfg_id mark current pipe will u=
se
> > + *             which mixer cfg. The first mxcfg is for the left half o=
f screen,
> > + *             the 2nd mxcfg is for the right half screen. The heading=
 cfg may
> > + *             be skipped by pipe with the first mxcfg_id =3D 1 if the=
 plane is
> > + *             only displayed in the right side, thus SSPP goes to lat=
er mixers.
>
> too long description for an unreadable name.

Maybe the clip_id is better per above discussion?
>
> >   */
> >  struct dpu_sw_pipe_cfg {
> >         struct drm_rect src_rect;
> >         struct drm_rect dst_rect;
> > -       unsigned int rotation;
> > +       unsigned int rotation, mxcfg_id;
> > +       bool visible;
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.h
> > index e225d5baceb09..9e79cf9eba264 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > @@ -14,14 +14,30 @@
> >  #include "dpu_hw_mdss.h"
> >  #include "dpu_hw_sspp.h"
> >
> > +/**
> > + * Max number of mixer configs. Because we support 4 pipes at most,
> > + * the 4 pipes are with 2 SSPP and their multi-rect mode. While one
>
> Or 4 SSPPs. Or 3 SSPPs. Or even a single SSPP if it doesn't cover the
> whole screen.
>
> I'm really sorry to say, but I can not understand this text.

Yeah, lots of usage cases are not mentioned here. It just describe how the
config number come from. It should be the number for screen clip rectangle
in a full screen.

>
> > + * SSPP can co-work with 2 mixer at most, then 2 pair of mixer are
> > + * needed for 2 SSPP in quad-pipe case. Thus 2 mixer configs are
> > + * needed in quad-pipe case.
> > + */
> > +#define MIX_CFGS_IN_CRTC 2
> > +
> >  /**
> >   * struct dpu_plane_state: Define dpu extension of drm plane state obj=
ect
> >   * @base:      base drm plane state object
> >   * @aspace:    pointer to address space for input/output buffers
> > - * @pipe:      software pipe description
> > - * @r_pipe:    software pipe description of the second pipe
> > - * @pipe_cfg:  software pipe configuration
> > - * @r_pipe_cfg:        software pipe configuration for the second pipe
> > + * @pipe:      software pipe description. Some or all of fields in arr=
ay can
>
> array has elements, not fields.
>
> > + *             be in use per topology. The heading fields are used fir=
st,
> > + *             and the later fields is invalid if visible field of pip=
e_cfg
> > + *             is not set. For example, the visible fields of pipe_cfg=
 are set
> > + *             in the first 2 pipe_cfg fields, and the mxcfg_id for th=
em are
> > + *             0 and 1. That means the first pipe is for left half scr=
een and
> > + *             the 2nd pipe is for right half. The visible field of th=
e 3rd
> > + *             pipe_cfg is not set, which means the 3rd and 4th pipe a=
re not
> > + *             in use.
>
> NAK. A single LM pair might already need two sw pipes.
> After reading the comment I have doubts that you understand what the
> code is currently doing.

This describes that  a right half only plane will only use the first
pipe/pipe_cfg with
valid flag and clip_id flag. So the later 2 elements of
sw_pipe/pipe_cfg arrary are not
used.

>
> > + * @pipe_cfg:  software pipe configuration. The 4 fields are for SSPP =
and their
> > +               parallel rect as above pipes.
> >   * @stage:     assigned by crtc blender
> >   * @needs_qos_remap: qos remap settings need to be updated
> >   * @multirect_index: index of the rectangle of SSPP
> > @@ -34,10 +50,8 @@
> >  struct dpu_plane_state {
> >         struct drm_plane_state base;
> >         struct msm_gem_address_space *aspace;
> > -       struct dpu_sw_pipe pipe;
> > -       struct dpu_sw_pipe r_pipe;
> > -       struct dpu_sw_pipe_cfg pipe_cfg;
> > -       struct dpu_sw_pipe_cfg r_pipe_cfg;
> > +       struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> > +       struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
> >         enum dpu_stage stage;
> >         bool needs_qos_remap;
> >         bool pending;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry

