Return-Path: <linux-arm-msm+bounces-19193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF058BB4B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 22:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E424B1F24BDE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 20:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C9C155321;
	Fri,  3 May 2024 20:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLIYyQ5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F5F158877
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714767619; cv=none; b=LpybjgXszlLq0VLlAwkjnv9SqUPS26Srg0dQbxAdO9GRcvJzkpAFqyG26AcAd7crKQK+405bzQMzGauP3UI7Dqv0oUlwxuRp7jhcfThvXEB0WI5lWK0m4wiaTLarO5yp/949Fxwsmy+8qg6vaec2kslNy/6c7kzM7LRa29gYNWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714767619; c=relaxed/simple;
	bh=cT3b01kZzeSTYi58+b1yPoeLYZaiAkjUIG74P8fjFiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bToqYNbtiqfa5J/hMX5A2X7Q879VjLlxh22QqOk3OlSdDbA4S2IWpF+GfdiRw7mpXSocIC5Dit0rE+5qQBVGLk5MycTx1rAmQvKJqjrUsyphTZepznMP516qf3JtBDUFfPHrtpByDT1I2p7vHOi5UlSy0dGQbMxxEPDo/IM1SNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BLIYyQ5A; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de61424f478so111885276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 13:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714767616; x=1715372416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i/q/SogMvCoOqZoAt+GfE+x38sUg5iDJ97SmB2A6bj8=;
        b=BLIYyQ5A1k6OvsN2cN9hbR+s75gmk5qD7wxFDF3V3vz5q53gO8rUGeHX6fxqOotyvX
         h9mJyzDE2tXA+GVBuOpPuV/Acz/c0RtP+iGrv4ctJeawV4YyLdvTNJJkv6+CzSswB/5T
         wn2TgdgQri8InI07R0XjJGnqtAJkbIYpAcJPUlPTX0ccU5Yx+NSM3ZyBSTdPHqAfx3ji
         kFii4TFKEY+hbskaWU2RXg2zlju5ag0vi5lJ+y0z08VuOl9dZvMglGxaMq5f21KZvg2w
         P5G+7ud3fCF+MGa0IgNCzo6Saf1xRp6EMGSM1iTotG5RplftmMYCm6hJiD8W+SHUQ7DF
         MUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714767616; x=1715372416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/q/SogMvCoOqZoAt+GfE+x38sUg5iDJ97SmB2A6bj8=;
        b=UXb52h6tuzoqOXADZBhfe2Ghl4sBD+Q4hfMwdHTHKTVONHbFHSZgrUiXsEc66iqevd
         FLzWHnrtuVecyDO54Gt0oj+tCregyR4KQyWUlYKUlLZ9QZF+BEGOYijpPQUUiZYUvasp
         kSHBh5p+fecxpGtFawD7qUKW+UNelUHBI788iIm5X15MDf4jbfocaEg6ZvSJH9Pru2oI
         vXGiP4TqgBfCiedjt21gmJ+2bluoWhiOJL9PWfv8M7TwAM9lr6g/Z+iDFLpn1Y/5ObJN
         Q4KbqWClzxm/J+IEfBy3+KqfgJvi2j3XAdvw4dQ/YJHjos30EisqJ8F2sL1Gl2EsEO7T
         gvQw==
X-Forwarded-Encrypted: i=1; AJvYcCVoBkeKevJokUXgpi14YVjx3ouQkWLVGzcCnHNkuFgNrpTptdISx+3WJ68ekn5Yrx/R7gbVp+7nE3AAeJO2Ju3NZJoSUVg8TUrl1xqFqw==
X-Gm-Message-State: AOJu0YxG6qApzAnTZBqiz6I2SLRbGzhtMKB/H9JBrBaW/HP0kZaHNbTY
	TakzhIDN7Cn5nuRBh3o6WfQkmwfgKV0m22g6YCCGOHkGAHdvjYsK6d9PPwrMSVTjbPATe6/+YIi
	AYOXCy7XyWBf45QukpaNdO+YTpdaESKldwH16Xg==
X-Google-Smtp-Source: AGHT+IF12FMQpgSacsvMJfXaH57exZcVdrXcTVSS3Xjq/IP0kmCZmWj8nzgcfH/Kp8QpD6oWbL2jBz3ac6XWQ05VSLQ=
X-Received: by 2002:a5b:acd:0:b0:de6:1c59:bdaa with SMTP id
 a13-20020a5b0acd000000b00de61c59bdaamr4064323ybr.40.1714767616600; Fri, 03
 May 2024 13:20:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org> <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
In-Reply-To: <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 May 2024 23:20:05 +0300
Message-ID: <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
> > In order to validate drm/msm register definition files against schema,
> > reuse the nodebugfs build step. The validation entry is guarded by
> > the EXPERT Kconfig option and we don't want to enable that option for
> > all the builds.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/ci/build.sh  | 3 +++
> >   drivers/gpu/drm/ci/build.yml | 1 +
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > index 106f2d40d222..28a495c0c39c 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
> >   apt-get update
> >   apt-get install -y libssl-dev
> >
> > +# for msm header validation
> > +apt-get install -y python3-lxml
> > +
> >   if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> >       GCC_ARCH="aarch64-linux-gnu"
> >       DEBIAN_ARCH="arm64"
> > diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> > index 17ab38304885..9c198239033d 100644
> > --- a/drivers/gpu/drm/ci/build.yml
> > +++ b/drivers/gpu/drm/ci/build.yml
> > @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
> >     extends: .build:arm64
> >     variables:
> >       DISABLE_KCONFIGS: "DEBUG_FS"
> > +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
> >
>
> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
>
> Cant we make this build rule msm specific?

No need to. We just need to validate the files at least once during
the whole pipeline build.

-- 
With best wishes
Dmitry

