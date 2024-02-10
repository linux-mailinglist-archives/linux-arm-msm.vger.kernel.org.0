Return-Path: <linux-arm-msm+bounces-10545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B1E850673
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 22:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C44401C20B09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 21:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7648C5F86C;
	Sat, 10 Feb 2024 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="prJAQwzz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE76125
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707599870; cv=none; b=VxgoyO35HZIcxglXpxGgTP5sfwpaH1v6E+u7Q6cUb07NzYAgjL9pLHaxOU8q+O6bIAdS/NSgZ7Mc9aMYn2fW5XsMmtpH/40KWSK3xhzx1U8VcpYH1uesA3j4cmM3f9SYTVPxun6sXZdNUwZy209Z72DmNMd43Hp+UV+b2TW7cyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707599870; c=relaxed/simple;
	bh=6HzInG0momt7899IHyT0XXM5BOwnm/vYvUYu7E9hn5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quMiGSM3MzfKB7dldU6eI6Dd1d/h8m7atY7ROPkEbo6uZUk7v8rpYavbzoYB4YIlYg5YskPPy2QpTJAzOYFF+UUsfYl8TVnj/+rs7s2y5FYb4HakhRZU24XwVJkWOROJWJGXLxc6Yh3fEg+CaUAAyWFbHVtymDeLnOMjKoCGj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=prJAQwzz; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc755832968so1388929276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 13:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707599867; x=1708204667; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=55zQ7x26tRThnlScVOXLS72ZEGRCLEQ9D4+DSgNh7Jw=;
        b=prJAQwzzgPd2cn4BBnmhjzStENBpGv+n7KijxUY8+2MYciw1nrA81erZOr/ZLQ2dP8
         Haox8Kj3R9MwdNJwBSwsQZna2ey8M3ZqEGfGgG0buy5QqWWZ5AbeGEVRTxAQMY/bUhDz
         O+x+Aw+vWeVF/otBwHztNHsuXn4FjicJkqKlVrRiaw58jAsxbj4H0MCP85jrhwTuGnfr
         Czl5jQcQmhUuolenoFf8ksEC+JEs5qUBnkSzUZR6NkjaGMlDT/XGWjOZOxHRsNBt7atk
         J/SNj8u83kuCWAzAVKwzj8BSEPDTLxkuR8vwCud5jl50nQoOeo2deVHNNIH2HBg+oQaz
         iV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707599867; x=1708204667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55zQ7x26tRThnlScVOXLS72ZEGRCLEQ9D4+DSgNh7Jw=;
        b=fKWqWIXSqu2MFnDQhZSZilDvLYn6l2Www+xZyxAkUAZjfhWBlZQc/dkLzIq/QNxPBW
         85/d7OWC/8s2YeUypGhh8O/XuJbTiB4IXRH4HWDr79yy82NzaZt4LjZUUPDFpckIdrmV
         IHxNXpbDZiu36BmDcE/8SePt0Se8U9+hPK8nkXsDRCA+gb3nNJMPeeZBOvUGtvnYmPUs
         UGh5vOJ66H2z9/HpIGyGqdioDaDWtsqPxIVtwB+3jDmisTzsKYEKMo0dDWIFGJy0W+5w
         sLGckFkMd2of4edagw8woM0X1zCVgrvg2BAJbRa6PGBQiC0qce7giZq+ki3g8E7BTN8s
         9QSA==
X-Forwarded-Encrypted: i=1; AJvYcCViBsqJs/3zv5NWuWq58fQl2RknctxKPqkcpG8+gEFLNGNxfZFtpcEKCYSlY1XB9wRcU0cksR/a/HjpSn/CO3g30IClNOkrYEnD7zcxqw==
X-Gm-Message-State: AOJu0YzW9c8+LpaYsqqhfyqC1FSJxv34u2J+G1PumKTR6ULtcY03UOqr
	3grjrF7+HpN2oLwyfw/tpgDxC6/6QZRnaFMR+noYtdkIOe2YQfTCnq75VttY5RpVmrbxAvpMFp+
	/fKTKX3Oq2nt3aWOTDTlm67uBnElGU8ISQOqNtg==
X-Google-Smtp-Source: AGHT+IGxAorJ/sM2MaFCSZ8ie9knRvIWkbmIr9beca0fdxoWSWDdjrQKZyPrx/1oLESTtdfwyFXhzvn4ZBbsimRIrRI=
X-Received: by 2002:a25:8745:0:b0:dc7:4776:e31 with SMTP id
 e5-20020a258745000000b00dc747760e31mr2326629ybn.24.1707599867357; Sat, 10 Feb
 2024 13:17:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com> <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
 <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
In-Reply-To: <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 23:17:36 +0200
Message-ID: <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 21:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 3:33 AM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> All the components of YUV420 over DP are added. Therefore, let's mark the
> >> connector property as true for DP connector when the DP type is not eDP
> >> and when there is a CDM block available.
> >>
> >> Changes in v2:
> >>          - Check for if dp_catalog has a CDM block available instead of
> >>            checking if VSC SDP is allowed when setting the dp connector's
> >>            ycbcr_420_allowed parameter
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
> >>   drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
> >>   drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
> >>   drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
> >>   drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
> >>   5 files changed, 16 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> index 723cc1d821431..beeaabe499abf 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>   {
> >>          struct drm_encoder *encoder = NULL;
> >>          struct msm_display_info info;
> >> +       bool yuv_supported;
> >>          int rc;
> >>          int i;
> >>
> >> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>                          return PTR_ERR(encoder);
> >>                  }
> >>
> >> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> >> +               yuv_supported = !!(dpu_kms->catalog->cdm);
> >
> > Drop parentheses please.
> >
> >> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
> >>                  if (rc) {
> >>                          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> >>                          return rc;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index ebcc76ef1d590..9b9f5f2921903 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
> >>   }
> >>
> >>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >> -                       struct drm_encoder *encoder)
> >> +                       struct drm_encoder *encoder, bool yuv_supported)
> >>   {
> >>          struct dp_display_private *dp_priv;
> >>          int ret;
> >> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>                  return ret;
> >>          }
> >>
> >> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
> >> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
> >>          if (IS_ERR(dp_display->connector)) {
> >>                  ret = PTR_ERR(dp_display->connector);
> >>                  DRM_DEV_ERROR(dev->dev,
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> >> index 46e6889037e88..ab0d0d13b5e2c 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>   }
> >>
> >>   /* connector initialization */
> >> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> >> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> >> +                                           bool yuv_supported)
> >>   {
> >>          struct drm_connector *connector = NULL;
> >>
> >> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
> >>          if (IS_ERR(connector))
> >>                  return connector;
> >>
> >> -       if (!dp_display->is_edp)
> >> +       if (!dp_display->is_edp) {
> >>                  drm_connector_attach_dp_subconnector_property(connector);
> >> +               if (yuv_supported)
> >> +                       connector->ycbcr_420_allowed = true;
> >
> > Is there any reason to disallow YUV420 for eDP connectors?
> >
> >> +       }
> >>
>
> Major reason was certainly validation but thinking about it more
> closely, I need to check whether CDM over eDP is even possible.
>
> Historically, CDM could output only to HDMI OR WB using the bit we
> program while setting up CDM and the same HDMI path is being used by DP
> as well. But I need to check whether CDM can even output to eDP with the
> same DP path. I dont have any documentation on this part yet.

I had the feeling that the DP / eDP difference on the chips is mostly
on the PHY and software side. So I assumed that it should be possible
to output YUV data to the eDP port in the same way as it is done for
the DP port.

-- 
With best wishes
Dmitry

