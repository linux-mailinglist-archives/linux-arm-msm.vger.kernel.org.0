Return-Path: <linux-arm-msm+bounces-57338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC4AB0891
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90F00B211EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 03:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1F823AE95;
	Fri,  9 May 2025 03:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBkV91LP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081592309B6
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746760124; cv=none; b=IvJceWVQoMB12IOTR3vSRUHhoEUP02zfIIjiM+tsUeOqd2tdBOxYoTVtkFYn2by2uLzfmMP2GBJ/EcQ8KuT2ID0KAmEUyNLJ0jglYZz92D7isbATFxOauiCfQElra26kUdnbCtSN6iR5I7yZDE7D7Vuwz+Y/tpWycT3p1Ca9ppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746760124; c=relaxed/simple;
	bh=aOWscNLIgCyceoVFJFem4gwtpNrQO4l3WlQM4yLCo80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ofq2V/QhSySKVgVwMhSuk4c5uAmsGEEWsKziR9CX/rX8AUBH3zw2AYgFDqIPArXXt3MuHblFfkc/pgjI0A1e07q/KV4g7NlIQimUGp3mcj7yxsWtDdDI6uKlUYEIDilOgh9Zv9bY8zqoMa++F7Gyka6SJxi/k5x/gPwFf8cwtlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBkV91LP; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7080dd5fe92so14702807b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 20:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746760122; x=1747364922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHI4ppsEzBZRI81Zs2flbGsQenmb6fI0hGNQNfUSqyo=;
        b=sBkV91LPa3QwGIrYX/b4+2vgZFPxG0vOnmAsgb/eqURhDvOJuQ5Xeh4y4rdPtLQjdR
         c9F/rK0zgNtaOfTXLOk1ezUbWysbGBCNz9ZnXOaWOYgfX24I2EqQEiMj6acLDKJGFoKX
         eHRHnpn9TsVLO0IOmWS3j7w7sphGb7Yw5wKm6E9ZGjxM7dv4y25uSuE+Cn+d02VJ8524
         6tk06DvTINOzP6sgLLV/Rzn9IZ0KRhCjTpd+Oq8YjgPfrbfQ6OmHxDj+iM9dvdcFbLT7
         YLDVpk6lS6nQx5k34SSDw2SjvjusTjOfkuADJFoJUSXYYR+o3A/6T7cJFJFRvf4nK9HJ
         ZB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746760122; x=1747364922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHI4ppsEzBZRI81Zs2flbGsQenmb6fI0hGNQNfUSqyo=;
        b=sInBc76Bqm1XPhDTia20/IQ++BH8+rqhldeL/yqqYKMDVs57L5rZKMZismhZ7BtpYJ
         zUmUS6Wx/k8pSotOctRHcInOaQ1beWMYzbM3mhRSkS5NAX2U1RSGhKsadZr5Og2/jjDG
         0J6/GgS1QSLmYyxfUtNCDM7oEq02k8H8TZzhVNmVIp7ywl1RPZe/F0WrclFDChuL4oPt
         p3l62jJ1Iy2m3Tlu5DPiIhd3vteCqK4iZnEYlEesKTFOfHMHvyYakj4iTryGmighL47U
         avPSiiO0D+4CJvkz7+EV4uMh8n7Z4aWo0W0R2/KppTohLeIhlS44nwvg8W9t5U97WlWe
         /LTw==
X-Forwarded-Encrypted: i=1; AJvYcCUATMIl1yr5TCH0ZG+rz+O32CuDAhXxggEIa+TfOFRApNorymzJLvcDBCSJg+nU7vi0zx8yYOqzvsOCv2GD@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3Awi/eIa13nmjtP6EnCL6TiubTf08ljG3f//EDFCayJ2ZiiW
	ipdJU7ep45vHIpzMJsMYTQZD2Z0HnxTB5yACHb/C71vP1rASdDdxlzRHVbn4d8jE3kQVdi5mf98
	JeiPnpJvIWmtECeeUkP6pGPVSkimTms4hzVvEPw==
X-Gm-Gg: ASbGncsJB8w+c2p27H4MtWUysCK0L9j4TfyrV2uI7c4XJGuLu1QD/Hctqzkik2FbII/
	XjaBIUKyhT96goVCWUhkz+3XGbfKekbfxZ4tA+ZwD8RYcLPa0RFyZbAX+XMVDlbp/SrdZHDo8Xj
	TkWR8zEIoXqP/gd8z3ICHrWQ==
X-Google-Smtp-Source: AGHT+IEsXDASIzmYprExBPl4LogRqFg5eDp7hYbmNE7oXZcNevMIZVASWTighCbkXMHiMuOZAJdvbaomhbiURhxQMew=
X-Received: by 2002:a05:690c:4448:b0:700:a6be:d6b8 with SMTP id
 00721157ae682-70a3fb5683cmr25884547b3.35.1746760121821; Thu, 08 May 2025
 20:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org> <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
In-Reply-To: <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 9 May 2025 11:08:30 +0800
X-Gm-Features: AX0GCFvZnKBJWsJdmQ2it9cgVNnwhp-EM2d0BXlFc-71GKNHWB1m0DJqIw5fTRM
Message-ID: <CABymUCMuiKQwtuYW-HX4bwyTR4awm4scwXTWNzVCEmyQsQ29aA@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
5=E6=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B 18:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
> > Some display controller support flexible CRTC and DMA, such as the disp=
lay
> > controllers in snapdragon SoCs. CRTC can be implemented with several mi=
xers
> > in parallel, and plane fetching can be implemented with several DMA und=
er
> > umberala of a virtual drm plane.
> >
> > The mixer number is decided per panel resolution and clock rate constra=
in
> > first, which happens in CRTC side. Then plane is split per mixer number
> > and configure DMA accordingly.
>
> Here you are describing a behaviour of one particular driver as a reason
> to change the framework.

Yeah, the specific driver requires a change in framework. Maybe the
comment is not
proper?
>
> >
> > To support such forthcoming usage case, CRTC checking shall happen befo=
re
> > checking plane. Add the checking in the drm_atomic_helper_check_modeset=
().
>
> So, now drivers will get two calls to atomic_check(), one coming in
> circumstances which were not expected by the drivers before. Are you
> sure that this won't break anything?

Yes, it is a concern. Is there any way to limit the change in
framework to specific
driver with a flag, such as DRM_FLAG_CHECK_CRTC_BEFORE_PLANE?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb=
7c0bc9d57960314fe 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device =
*dev,
> >                       return ret;
> >       }
> >
> > +     for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > +             const struct drm_crtc_helper_funcs *funcs;
> > +
> > +             funcs =3D crtc->helper_private;
> > +
> > +             if (!funcs || !funcs->atomic_check)
> > +                     continue;
> > +
> > +             ret =3D funcs->atomic_check(crtc, state);
> > +             if (ret) {
> > +                     drm_dbg_atomic(crtc->dev,
> > +                                    "[CRTC:%d:%s] atomic driver check =
failed\n",
> > +                                    crtc->base.id, crtc->name);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +
> > +
>
> Too many empty lines. But the main quesiton is: why are you calling it
> before mode_valid()? According to your description a better place would
> be in drm_atomic_helper_check_planes().
>
Agree, that's the proper function. Will remove the empty line in next versi=
on.

> >       ret =3D mode_valid(state);
> >       if (ret)
> >               return ret;
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
>

