Return-Path: <linux-arm-msm+bounces-10752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C34851F75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 22:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3D91C20C1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 21:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C80347A7A;
	Mon, 12 Feb 2024 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sovZvO1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95543AA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707772851; cv=none; b=W2hVS3eCg+g+NJeFgkSg3IA5+mWFD0hubj3EkKj62AFjHDQfHASjHWIi8NOUF5wTBXKTVoTU1VOCf4G8Pd/TSo6uypVKY/kWUrWxxFYl6q/8SYL3QQa6QbopUrltaceffagNJh8zOOM7NfEVS5pulPcNvTTabXJAmcY12/8Q5A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707772851; c=relaxed/simple;
	bh=rRFYj9QasQBmuaF4ddoDM2EyjDQEoOQb55Anv83h1mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExP3ua8Feb3ZacOn3mQWM3nyk078nCtVnPgww+pJFVgMiFjeEAQCPCdFpSSavnAf2TUUv3VyU8u27WpG6lfkatrdgVPb83jnCKiufSuSxavkouHiH2gzRy+u3Qjm7JDfYzsrGEG5eZ/eKLCi8i7ih43HQfaYI+ZCAFcm0s5r0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sovZvO1K; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso445141276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707772848; x=1708377648; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iV9U9eXYCJcvJrj6H/0WsRlgw1HkWWp0lw6ZqsXTu3w=;
        b=sovZvO1KNlsFAQ5hzFKzL08eheFP9+dFjiMFJQrhnApGSLUHwLSdXfl1RfGeMeAVYG
         qAVE/XI9nCj9X4KSFtPKMNfvlTLNmKpsddEg2JZvTS21FBhmD4FA+8Bua4mtIGHdyfCw
         1nsa0oIPBt4BRjsErs+ae66UJ1Os1Xx6oLxbt26ih07ek2YwXVJ30GroIH01kzyXLEDJ
         Z3B6aCuP1GTeTDQW+S1dhbdjXK3J14xliqn0Nk14RKlXwoGhzuHtz2EDxPUmN9hTa1VZ
         Kp3sAQ+eAnE/Cr5gpbb5LqMBHuwhJGTguBRs2AbDqhqrwJsgbxUvVeyn266MqMsvdzhf
         L3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707772848; x=1708377648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iV9U9eXYCJcvJrj6H/0WsRlgw1HkWWp0lw6ZqsXTu3w=;
        b=FWQiQDYMFWtoUbUyw92TpdSMvk7wrkXjY1HIMNdgPs8HmtNwz1lkiqFkKwIStVrzyY
         obSfxWiVvqtJzMIu7PYj4msgCtQAE2uwrID5tjypb2edKGuZZNiA8kFLLFEql/VwDk26
         yImQ2m6yYe/5+FU3udTjhfJGK6Sa6Zov1Do7OY4UxslwWQcWA08k1QyYSopdr09CE9wf
         8qDoEGt/QusxIZ5xRDwiBC+RlkkuXQEw2S5tuK8sz6mt4/Bs7iRjSe7GqX1dlDDjeXo3
         6vAsdUZQBqWwq6+CUXhKmIESng6Ps3z+i90jk9VzPoHIekjNEJS25uk3EWoO1fcHEfF2
         nlwA==
X-Forwarded-Encrypted: i=1; AJvYcCWq9Fn8uCrDlYGRqZu+oAwr/BEYz4GeU3dEye8mx5u1Q615LFtdyI/xJZ2jfCKVR4NqAhU9QjygRQmsaazBFtO6qwRwv4zeen4SWS0uyA==
X-Gm-Message-State: AOJu0YxeJrCQsB3OjZFEFJQGur4uDCWlNqMgGRWUeyHoSM3JxnoRNlF3
	KPkdJ8BOWqpkirjr7eUS/JwmbaANtqplQufghoyhml9eJ2AbusKaYp8uYArLKXxd6XOwZ+S3Oqm
	Wcu33jLIWRzl2ZLLwwVYu+xpNdqND2w3v5ycwPg==
X-Google-Smtp-Source: AGHT+IESmQ7wY2Dyevaw+NSSNF8ORzP3IV5t3PljHIorAJTXf9UszM0B7+uTaQmBATW5GJM+KBdolgUJ9P3K+CL8P/c=
X-Received: by 2002:a25:b11a:0:b0:dcc:32cb:cb3b with SMTP id
 g26-20020a25b11a000000b00dcc32cbcb3bmr657729ybj.44.1707772848660; Mon, 12 Feb
 2024 13:20:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com> <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
 <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com> <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
 <04df55f1-9430-727b-426b-81d762b3b2e6@quicinc.com>
In-Reply-To: <04df55f1-9430-727b-426b-81d762b3b2e6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Feb 2024 23:20:33 +0200
Message-ID: <CAA8EJpqZT+Z-1oH6pRs05kZj16XdUyzi15ko3W3cS1DGC36pew@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Feb 2024 at 23:13, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 1:17 PM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 21:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/10/2024 3:33 AM, Dmitry Baryshkov wrote:
> >>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>
> >>>> All the components of YUV420 over DP are added. Therefore, let's mark the
> >>>> connector property as true for DP connector when the DP type is not eDP
> >>>> and when there is a CDM block available.
> >>>>
> >>>> Changes in v2:
> >>>>           - Check for if dp_catalog has a CDM block available instead of
> >>>>             checking if VSC SDP is allowed when setting the dp connector's
> >>>>             ycbcr_420_allowed parameter
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
> >>>>    drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
> >>>>    drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
> >>>>    drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
> >>>>    drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
> >>>>    5 files changed, 16 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> index 723cc1d821431..beeaabe499abf 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>>>    {
> >>>>           struct drm_encoder *encoder = NULL;
> >>>>           struct msm_display_info info;
> >>>> +       bool yuv_supported;
> >>>>           int rc;
> >>>>           int i;
> >>>>
> >>>> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>>>                           return PTR_ERR(encoder);
> >>>>                   }
> >>>>
> >>>> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> >>>> +               yuv_supported = !!(dpu_kms->catalog->cdm);
> >>>
> >>> Drop parentheses please.
> >>>
> >>>> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
> >>>>                   if (rc) {
> >>>>                           DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> >>>>                           return rc;
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index ebcc76ef1d590..9b9f5f2921903 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
> >>>>    }
> >>>>
> >>>>    int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>>> -                       struct drm_encoder *encoder)
> >>>> +                       struct drm_encoder *encoder, bool yuv_supported)
> >>>>    {
> >>>>           struct dp_display_private *dp_priv;
> >>>>           int ret;
> >>>> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>>>                   return ret;
> >>>>           }
> >>>>
> >>>> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
> >>>> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
> >>>>           if (IS_ERR(dp_display->connector)) {
> >>>>                   ret = PTR_ERR(dp_display->connector);
> >>>>                   DRM_DEV_ERROR(dev->dev,
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>> index 46e6889037e88..ab0d0d13b5e2c 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>>>    }
> >>>>
> >>>>    /* connector initialization */
> >>>> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> >>>> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> >>>> +                                           bool yuv_supported)
> >>>>    {
> >>>>           struct drm_connector *connector = NULL;
> >>>>
> >>>> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
> >>>>           if (IS_ERR(connector))
> >>>>                   return connector;
> >>>>
> >>>> -       if (!dp_display->is_edp)
> >>>> +       if (!dp_display->is_edp) {
> >>>>                   drm_connector_attach_dp_subconnector_property(connector);
> >>>> +               if (yuv_supported)
> >>>> +                       connector->ycbcr_420_allowed = true;
> >>>
> >>> Is there any reason to disallow YUV420 for eDP connectors?
> >>>
> >>>> +       }
> >>>>
> >>
> >> Major reason was certainly validation but thinking about it more
> >> closely, I need to check whether CDM over eDP is even possible.
> >>
> >> Historically, CDM could output only to HDMI OR WB using the bit we
> >> program while setting up CDM and the same HDMI path is being used by DP
> >> as well. But I need to check whether CDM can even output to eDP with the
> >> same DP path. I dont have any documentation on this part yet.
> >
> > I had the feeling that the DP / eDP difference on the chips is mostly
> > on the PHY and software side. So I assumed that it should be possible
> > to output YUV data to the eDP port in the same way as it is done for
> > the DP port.
> >
>
> This is true. I was not worried about DP / eDP controller but mostly
> whether eDP spec really allows YUV. From what I can read, it does.
>
> So this check shall remain only because CDM has not been validated with eDP.
>
> Do you need a TODO here and if we ever get a eDP panel which supports
> that, we can validate and relax this.

Just move it out of the eDP check.

-- 
With best wishes
Dmitry

