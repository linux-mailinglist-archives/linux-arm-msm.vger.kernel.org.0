Return-Path: <linux-arm-msm+bounces-17993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2248AB666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 23:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47BF11F20D38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 21:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12273EA8C;
	Fri, 19 Apr 2024 21:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eotCUJI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C4C168C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 21:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713561729; cv=none; b=i4+dM+Bazc5WZT8V4KUdxsBL1md9yolqUxN7UyecoCH5E4FbM74E3uNw3IEs7KVgHTXpQQ6/rWLNWQRt3VI8tBWu+1vW3HhZyahQoLu5RUujlpwbMATzmyLMyaPnEzOlPF2Y+2GUN+Xyg5W9EKP6za54vdvsmDJ/p6X2dfo46YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713561729; c=relaxed/simple;
	bh=SLR93HaquRVjzC/g1+VPkxEuJWoqwLZaDSmPAzx20gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGqN23dfSP3n5UHAUCXgG9aIZEiQroZhEKEKabg/zNKihSJn61V7B1Wl3jqPTjmBNXeQ98UmYtkth603A8AG4/M2Fski6nod/3xDF4eO3JV3FYqMKKmztRZSDPRqf6AQ8nO5PpnkXkpDu64/ohhqBtSf+3dF1tkyRccL8jALelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eotCUJI5; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso2773035276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 14:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713561727; x=1714166527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tM8bv0/XuiSnFU08HBK9V9VgoiYOmYXBN5vef9CJivs=;
        b=eotCUJI5mdlPjBr43NabOrLdxm1Yrsn2BZKZ9rgMoNrYJmFNuinyqeZG1eWpP4ZO5K
         2XerT8WV2TReDWXX3Z1lECr/MI5ZGXSCO4Cm1kboCfnhqW5J5fYcRDeVMgwouw6Urw+4
         vWc3c3HjpOHDvOeGQv7GkHHLHhX9EDy0UJSnR9PbRd3HQQcKDy5veGOFgAIfwE8kUejH
         vMui6DbV56T4YIVKE6I3wPCPGnz6vz+GcieOAOcKz4ELBRmLOVk6SwaMRH6h7XyIG6dh
         +eoD6qZsLqzVfweUWDDWTqxwejAAbmEi32zTmcOe2bpRUhnd8kABdjEb3KHRemd6Ernb
         bKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713561727; x=1714166527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tM8bv0/XuiSnFU08HBK9V9VgoiYOmYXBN5vef9CJivs=;
        b=ev+Uis1v4bH/7G1TROD0LT8RAirFIknajFB3ODXwuhtISwhmCLbpxRwn/A9/3aW1b6
         TJl/Xca+ycbyjRw4WCEYMNSLcuOnrbl8c3MuIu1Ucn1EeNRCzo5pziA4sB34+QPLbSfh
         ZS5tplnokpXf1NqFFHpuVqaFj5naCL6oqMyjxuvSUTBaJJj2iNzIedKDq+MefhgT4bHH
         lleuEaiAxJeyBi8Rx1YotP1e7F/H8I88sCDpQgyGlorBFIhrrHFBDtGY0nZM70nU1PYE
         s+A+6+60joEEBLVKzU/8V4vTgowgPVu3bXt7V/Cs79faNEkGPW48Dx60dtWxjaZzlp7T
         s2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJu0sVYerEJ6OoAnbgbzNoi7gPrv5OgZAhMp8glistPaA0UZ0lKEK+lkcs4ITCqqtv656FxGaXivtUQ3xCRKZ6wIatNaxnv0H8yU3qIg==
X-Gm-Message-State: AOJu0Yzc/6Kin4C2X2nnmZ+JR7kZdFJ42jF1yZPQrRlYL83kQCAiRvQe
	ee5XW7KHRM83KllBToz/mj+goLJkV8ayq0zZ+3Rfq7QjLxgyK54Yl1ThOrUzvg3LtOz9OoeWrvg
	8Q1VEXK0rdsD4/7LGjR5WFNQZrblODlL0TMJIyg==
X-Google-Smtp-Source: AGHT+IGhzEMaV0X0p6+rKVqZI49NZ16cVdfLETG6UDXqzV+cSLuQqCYKuDIlZ1CzV2fl5DT0UeHZvD/bHCfrMflSeAA=
X-Received: by 2002:a25:c789:0:b0:dc7:32ea:c89f with SMTP id
 w131-20020a25c789000000b00dc732eac89fmr3321829ybe.15.1713561726826; Fri, 19
 Apr 2024 14:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-5-dmitry.baryshkov@linaro.org> <b4e725ad-19c3-a344-9504-674ae17f7027@quicinc.com>
In-Reply-To: <b4e725ad-19c3-a344-9504-674ae17f7027@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 00:21:56 +0300
Message-ID: <CAA8EJpqGjJSKqggN3KyTTVog7rZx6pjekr=mOcvneKYcG7_Lrg@mail.gmail.com>
Subject: Re: [PATCH 04/12] drm/msm: add arrays listing formats supported by
 MDP4/MDP5 hardware
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Apr 2024 at 00:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > MDP4 and MDP5 drivers enumerate supported formats each time the plane is
> > created. In preparation to merger of MDP DPU format databases, define
> > precise formats list, so that changes to the database do not cause the
> > driver to add unsupported format to the list.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 57 ++++++++++++++++++++--
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 36 +++++++++++---
> >   drivers/gpu/drm/msm/disp/mdp_format.c      | 28 -----------
> >   drivers/gpu/drm/msm/disp/mdp_kms.h         |  1 -
> >   4 files changed, 80 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> > index b689b618da78..cebe20c82a54 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> > @@ -371,6 +371,47 @@ static const uint64_t supported_format_modifiers[] = {
> >       DRM_FORMAT_MOD_INVALID
> >   };
> >
> > +const uint32_t mdp4_rgb_formats[] = {
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGBX8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_BGR565,
> > +};
> > +
> > +const uint32_t mdp4_rgb_yuv_formats[] = {
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGBX8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_BGR565,
> > +
> > +     DRM_FORMAT_NV12,
> > +     DRM_FORMAT_NV21,
> > +     DRM_FORMAT_NV16,
> > +     DRM_FORMAT_NV61,
> > +     DRM_FORMAT_VYUY,
> > +     DRM_FORMAT_UYVY,
> > +     DRM_FORMAT_YUYV,
> > +     DRM_FORMAT_YVYU,
> > +     DRM_FORMAT_YUV420,
> > +     DRM_FORMAT_YVU420,
> > +};
> > +
> >   /* initialize plane */
> >   struct drm_plane *mdp4_plane_init(struct drm_device *dev,
> >               enum mdp4_pipe pipe_id, bool private_plane)
> > @@ -379,6 +420,8 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
> >       struct mdp4_plane *mdp4_plane;
> >       int ret;
> >       enum drm_plane_type type;
> > +     const uint32_t *formats;
> > +     unsigned int nformats;
> >
> >       mdp4_plane = kzalloc(sizeof(*mdp4_plane), GFP_KERNEL);
> >       if (!mdp4_plane) {
> > @@ -392,13 +435,17 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
> >       mdp4_plane->name = pipe_names[pipe_id];
> >       mdp4_plane->caps = mdp4_pipe_caps(pipe_id);
> >
> > -     mdp4_plane->nformats = mdp_get_formats(mdp4_plane->formats,
> > -                     ARRAY_SIZE(mdp4_plane->formats),
> > -                     !pipe_supports_yuv(mdp4_plane->caps));
> > -
> >       type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
> > +
> > +     if (pipe_supports_yuv(mdp4_plane->caps)) {
> > +             formats = mdp4_rgb_yuv_formats;
> > +             nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
> > +     } else {
> > +             formats = mdp4_rgb_formats;
> > +             nformats = ARRAY_SIZE(mdp4_rgb_formats);
> > +     }
> >       ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
> > -                              mdp4_plane->formats, mdp4_plane->nformats,
> > +                              formats, nformats,
> >                                supported_format_modifiers, type, NULL);
> >       if (ret)
> >               goto fail;
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > index 0d5ff03cb091..aa8342d93393 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > @@ -17,9 +17,6 @@
> >
> >   struct mdp5_plane {
> >       struct drm_plane base;
> > -
> > -     uint32_t nformats;
> > -     uint32_t formats[32];
> >   };
> >   #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
> >
> > @@ -1007,6 +1004,32 @@ uint32_t mdp5_plane_get_flush(struct drm_plane *plane)
> >       return mask;
> >   }
> >
> > +const uint32_t mdp5_plane_formats[] = {
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGBX8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_BGR565,
> > +
> > +     DRM_FORMAT_NV12,
> > +     DRM_FORMAT_NV21,
> > +     DRM_FORMAT_NV16,
> > +     DRM_FORMAT_NV61,
> > +     DRM_FORMAT_VYUY,
> > +     DRM_FORMAT_UYVY,
> > +     DRM_FORMAT_YUYV,
> > +     DRM_FORMAT_YVYU,
> > +     DRM_FORMAT_YUV420,
> > +     DRM_FORMAT_YVU420,
> > +};
> > +
> >   /* initialize plane */
> >   struct drm_plane *mdp5_plane_init(struct drm_device *dev,
> >                                 enum drm_plane_type type)
> > @@ -1023,12 +1046,9 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
> >
> >       plane = &mdp5_plane->base;
> >
> > -     mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
> > -             ARRAY_SIZE(mdp5_plane->formats), false);
> > -
> >       ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
> > -                     mdp5_plane->formats, mdp5_plane->nformats,
> > -                     NULL, type, NULL);
> > +                                    mdp5_plane_formats, ARRAY_SIZE(mdp5_plane_formats),
> > +                                    NULL, type, NULL);
> >       if (ret)
> >               goto fail;
> >
>
> Did you accidentally drop checking for YUV format cap before adding the
> formats for the plane similar to

No. MDP5 driver asks RGB+YUV planes see the mdp_get_formats() arguments.

>
>  > +    if (pipe_supports_yuv(mdp4_plane->caps)) {
>  > +            formats = mdp4_rgb_yuv_formats;
>  > +            nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
>  > +    } else {
>  > +            formats = mdp4_rgb_formats;
>  > +            nformats = ARRAY_SIZE(mdp4_rgb_formats);
>  > +    }
>
>
> Also, from what I checked the format table is identical between mdp4 and
> mdp5. Even if we cannot unify mdp4/5 and dpu tables, we can atleast have
> mdp_4_5_rgb and mdp_4_5_rgb_yuv?

I'd rather not do that. If we are to change mdp4 or mdp5 planes at
some point, I don't want to think about the second driver. The amount
of duplication is minimal compared to the burden of thinking about the
second driver.

-- 
With best wishes
Dmitry

