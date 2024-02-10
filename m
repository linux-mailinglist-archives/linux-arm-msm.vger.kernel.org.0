Return-Path: <linux-arm-msm+bounces-10509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D852E850439
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 12:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0414D1C20E34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A979364B8;
	Sat, 10 Feb 2024 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZGIkPN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDBF2EAF9
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707564825; cv=none; b=s5Mdg4UQc99K7p55D7TYA1xk5jl3LsqwQZjN/2PCNOZiDdQSxsAE9pOFkDS8ReqfImSn6wso06E7oVtMCtyafa6BsQbZbfdUXhUrGlrzpVUMX7y340LuhrTbr6fGmUj2t3T/ZcHLsfqyeAJpVTVxrvHdcLg3+VOO7bCi2BSDlLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707564825; c=relaxed/simple;
	bh=wYKSZwnYIbfKwg0ZuBn22caui56hIb8WHxO/4nvwAj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEIPiI1ZsPpTu7ApZOKPwBdYNw1llvywnzs4WcVgRjUqS9uTen9HepozFRyHAnpbK9jIw0lTfZM0YxKQP6n2nknsZHAl/JXzeTCOzpIKz8kE0OisgIAk9MaE4H63VjS8NQ3wyggdaO/reOHT2iSlm2TxQ55X5lED13n72jkAw2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZGIkPN1; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc7510bcf22so1310999276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 03:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707564822; x=1708169622; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O56nX6gJID+KyV2fDe81//nmM2wB8OEZn8QrSqYoKNg=;
        b=vZGIkPN1HOJICOrypP0LgrFxEP6aZ6x0lvDcsluSftngxjb/qiSffWXR0qs9L0CnDC
         yl01s2IamI4/SjaSnOnR66VOeyS3IOGmtA/W7qI7c19sknZJeevfxHjxcJNnDuBIF8VZ
         BBRznbs1FAzkdoCmU1oeKXKvM612k3SbnAcIYMFbNCZBk37Zypl3fXsrMiE9miygiWQE
         AvslKMIEJ9PLVp96r24WwmRuiOq032d2mxjQVPO7Ophr3dGAdlNaFs6+BFQN5phClarC
         FKXG2l25LKtIPm7g83hTfQtmG7cqFCeorcQ/EC/M04GOi8ah8pkNq4lFVLCW6G1wOBKu
         LSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707564822; x=1708169622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O56nX6gJID+KyV2fDe81//nmM2wB8OEZn8QrSqYoKNg=;
        b=Hyk/MNwlahNiDdySf0JuoxjZPdp0e+DnjWPTGgzq+4fAFQLhh2u5MDy/5wET08I6cV
         02yupyZhrDBaAZ8eZLwSIhjbMWG7cshS1e9N2Whh2RmMqmbh1DLSxN/TJnpAXWfrhYk1
         t/j5Fea62NVoR3SZm6OVnXPf8w64YQJwmMcs7cFtFtxiDw5BYGp18U/TU997bV4tMu0n
         6zAodgsZjQJxoaUywBRyVBxjcEYstQ4hMCwHCEg8b2jAtVwugykjkIwIsQ1xemX1MN9D
         Grf5E/n9/oOIsyCiEg16xth5RMxuqQH1WuEyjAiBbJbskb7dlQgZzq0yFXcAadCOsQfK
         r3vg==
X-Forwarded-Encrypted: i=1; AJvYcCVq2xK++2N9P4YStOIaR7866+L7Px/55LIYr6+Z2vypouhau6V7awmKwJfxaD+//If88yY9SiymRtoE+JQIO369pIV1tCZYhjL68A5u9A==
X-Gm-Message-State: AOJu0YwA6XbpJlN6H1Wok0k+zanXqf02sESfpLRdiwNUG4UXyfE4ZGEn
	VRbzH3Vub6p4NctOS0/Rfr4yIQ9f6q9jb8NMmkjOahR5RqXjbrAsdpLVtRnEyuN9PZz+Su9pAu1
	jJIwAPSMUOhLwaYZ9j6fSj5S7i1UYCc1qhuNH9w==
X-Google-Smtp-Source: AGHT+IEVspeMhPBXLY0ZGYrZ1jpuuWSoZJq4+qjdF5Vil/sLu/iuDRAlCLNWCszwEvuLEHfGnrLZGkAzoYEh8bcMxGo=
X-Received: by 2002:a5b:90d:0:b0:dc6:c669:9914 with SMTP id
 a13-20020a5b090d000000b00dc6c6699914mr1476768ybq.15.1707564822553; Sat, 10
 Feb 2024 03:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-20-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-20-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:33:31 +0200
Message-ID: <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> All the components of YUV420 over DP are added. Therefore, let's mark the
> connector property as true for DP connector when the DP type is not eDP
> and when there is a CDM block available.
>
> Changes in v2:
>         - Check for if dp_catalog has a CDM block available instead of
>           checking if VSC SDP is allowed when setting the dp connector's
>           ycbcr_420_allowed parameter
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
>  drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
>  drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
>  5 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 723cc1d821431..beeaabe499abf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> +       bool yuv_supported;
>         int rc;
>         int i;
>
> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>                         return PTR_ERR(encoder);
>                 }
>
> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> +               yuv_supported = !!(dpu_kms->catalog->cdm);

Drop parentheses please.

> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
>                 if (rc) {
>                         DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>                         return rc;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ebcc76ef1d590..9b9f5f2921903 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>  }
>
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> -                       struct drm_encoder *encoder)
> +                       struct drm_encoder *encoder, bool yuv_supported)
>  {
>         struct dp_display_private *dp_priv;
>         int ret;
> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                 return ret;
>         }
>
> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
>         if (IS_ERR(dp_display->connector)) {
>                 ret = PTR_ERR(dp_display->connector);
>                 DRM_DEV_ERROR(dev->dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 46e6889037e88..ab0d0d13b5e2c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>  }
>
>  /* connector initialization */
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> +                                           bool yuv_supported)
>  {
>         struct drm_connector *connector = NULL;
>
> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
>         if (IS_ERR(connector))
>                 return connector;
>
> -       if (!dp_display->is_edp)
> +       if (!dp_display->is_edp) {
>                 drm_connector_attach_dp_subconnector_property(connector);
> +               if (yuv_supported)
> +                       connector->ycbcr_420_allowed = true;

Is there any reason to disallow YUV420 for eDP connectors?

> +       }
>
>         drm_connector_attach_encoder(connector, encoder);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index b3d684db2383b..45e57ac25a4d9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -19,7 +19,8 @@ struct msm_dp_bridge {
>
>  #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
>
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> +                                           bool yuv_supported);
>  int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder);
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b876ebd48effe..37335777f5c09 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -385,7 +385,7 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
>  int __init msm_dp_register(void);
>  void __exit msm_dp_unregister(void);
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> -                        struct drm_encoder *encoder);
> +                        struct drm_encoder *encoder, bool yuv_supported);
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>  bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>                                const struct drm_display_mode *mode);
> @@ -403,7 +403,8 @@ static inline void __exit msm_dp_unregister(void)
>  }
>  static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>                                        struct drm_device *dev,
> -                                      struct drm_encoder *encoder)
> +                                      struct drm_encoder *encoder,
> +                                      bool yuv_supported)
>  {
>         return -EINVAL;
>  }
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

