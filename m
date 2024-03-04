Return-Path: <linux-arm-msm+bounces-13257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B887023B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 14:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB9EA1F22A57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 13:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3523D540;
	Mon,  4 Mar 2024 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTTCinR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406B33F8C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709557618; cv=none; b=DIPt0tkYKhjhQ/6hfELvVSqzXAQE/PFlkn64BmxklfMVcLCWsaLQXGQEgF5+N5nPDJmHmHznmpp2bQM06cHA0qSEmqoAndFyaTyVC2c6dM2pfpXXHB1GB91BrelPBmOoxY4jP+Vw2zuwZtA9Q3ztwvQDFpwGUYC220RuuYnq2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709557618; c=relaxed/simple;
	bh=YVZkshAZhkcuNqrSOesTmaPiOfvAz8zAKAbFCPcnxsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrZsQJH96l3VYy1lwIM2XUDQDrBbagNpo+o6cQccvlJ7In7lj+vSKOlRzb8c10rsAYct3LVdg0B4IVlzHTWn/Q1DLM7v+wlAVUh19QcHqD8SJKq3j46AhtsguRpgYUEdQWzdqUpQdGxJ6dahQCPV4EXI0bGwbqq4MpIRSd1JN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTTCinR6; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so4141662276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709557615; x=1710162415; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF5EHPeguAlmw8pt+rnW85Aj9ppqfHEoGqFfoa9ov8U=;
        b=vTTCinR6sMSysMwszdVZy8Undj9su1wcsF/qeq/rdZRXsPceEpao+/dCVJuHmQ4La/
         O39teMI5RHBU0nNIzyoGFcVBe6MRhYKYo9d58fljvCGnxnzPf2Us1GRhxWX2TIMmZa3U
         AgTtXFvmn122P65fKcvObIMlKVCtlL5aht/xek7q7yXZJg79RmdVJZ9pXVdYFTW86HJF
         vne8uNGweGHgTJwybEdSwdwCyKI40jFzMsofI0mYyUDAZVHM708n9p/86AwbZ5Rx3733
         M1UDEa9/0j8T+OAofOwsjU4CIY2zZCK+xF0k5stj0B1TuZ0ZvvHpRceN2i4Aa7Hw1ldH
         UzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709557615; x=1710162415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF5EHPeguAlmw8pt+rnW85Aj9ppqfHEoGqFfoa9ov8U=;
        b=gqPyieuqI2vlYRm99dsIbVJt+tdnyGqsThQYA25n3yRIZo6vzLLRAn4k6Nh5SBTwEd
         YAi1dWgqBKc2NQ+OnxWGsjgH1SQWRzwvHkkCIynYht07oODfyJLBD/uER0IL02wlwpz6
         g58E81ZFZRlNai/40cGvosxHMlD34Ltyxr/n92mG+NBsdN9VmWdTK5ohNtuTtvGu3/Hp
         1pey8oiWH0rKU35sTOngG9KmEmd3XTOkgOWBmMMtyq6aSNllks/VcposbGxfceuQyIVq
         1+4r7fJWZBY6/UoxdPV9AWsfisHYAbKCnDBjIxnZ6+QnSBQeLCArwNjrblbibIi7QZYJ
         ashw==
X-Forwarded-Encrypted: i=1; AJvYcCXAF3YJ+wJXbIAs+aV6W8yiGfMbHv/f7NQs+9D378hqnysN8rY+ZwQR3tfIwzR5yv+b3a9nzKXiCoVh1U27K5bWpO15XRWYussRcRPRBA==
X-Gm-Message-State: AOJu0YwA1uDk3kb9iiJj3Wq/Z1DnwVaDgKY30jZQUGiNtE6bc91WTebk
	aN+KQZd684N3CycN64iAYGL0uLqAjdqktv72Kwj8yK58VAPV9j/examgZB9MfUNgXrO1+n+h6vm
	OZ2UpULksWbu6o5QEr1kofHayy1yAxunMYDmyUA==
X-Google-Smtp-Source: AGHT+IHDoyrZSgo3d0pdsvjs58WMMhEuCQvAoO7S/07i8igiKmULNd3ZGDbVm0+XF7UvoNRUriBuP/dHX1xzq05mxT0=
X-Received: by 2002:a5b:b05:0:b0:dcd:13ba:cdd6 with SMTP id
 z5-20020a5b0b05000000b00dcd13bacdd6mr6132325ybp.47.1709557615168; Mon, 04 Mar
 2024 05:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 15:06:43 +0200
Message-ID: <CAA8EJppf0ebg+qnw7Z4P_6W4pgf0E4+KLGLEhU138f4k8+QxOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop unused dpu_kms from interface initialization
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Feb 2024 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_kms seems unused while initializing DSI, HDMI and DP through
> their respective _dpu_kms_initialize_* functions.
>
> Hence lets drop the parameter altogether.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2af62d8fa9a7..ab924ac78c9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -494,8 +494,7 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>  }
>
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> -                                   struct msm_drm_private *priv,
> -                                   struct dpu_kms *dpu_kms)
> +                                  struct msm_drm_private *priv)
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -558,8 +557,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  }
>
>  static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> -                                           struct msm_drm_private *priv,
> -                                           struct dpu_kms *dpu_kms)
> +                                          struct msm_drm_private *priv)

This breaks now on top of YUV patchset:

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function
'_dpu_kms_initialize_displayport':
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:583:35: error: 'dpu_kms'
undeclared (first use in this function)
583 | yuv_supported = !!dpu_kms->catalog->cdm;

As this requires adding of the yuv_supported argument, let's consider
moving it backwards: for  _dpu_kms_initialize_writeback() we can get
format_list and n_formats from the dpu_kms.


>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -592,8 +590,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  }
>
>  static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
> -                                   struct msm_drm_private *priv,
> -                                   struct dpu_kms *dpu_kms)
> +                                   struct msm_drm_private *priv)
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -671,19 +668,19 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>         int rc = 0;
>         int i;
>
> -       rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_dsi(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
>                 return rc;
>         }
>
> -       rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_displayport(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
>                 return rc;
>         }
>
> -       rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_hdmi(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
>                 return rc;
> --
> 2.34.1
>


--
With best wishes
Dmitry

