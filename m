Return-Path: <linux-arm-msm+bounces-14842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF5886D81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0BE21C232C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCEA524DD;
	Fri, 22 Mar 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9oZnKah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3E47A74
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114268; cv=none; b=NRp5LAveh6JlYPP6ehK+uSmVfZoCV4DswasIwMPakP0s1hgLUnW7b/mqCj7eysYI1Q7Fm3OjwlH5ao7SHL4m4/r0mA9l4DtQDM/tlKTWoRIm0k6hQZuVUCS16KXcazk4jDLqRguynxt6M0R2t2nEdXLUhVSNDZ8XBI6LCqrV+bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114268; c=relaxed/simple;
	bh=fjlEwvkpQII5i2bDla7lCnCyEwxFpi5Bc5TaAal25w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUYYEhVP8ZTYxznTr+wkoygRvkGVFGG1xamD8bLlFgBAjg1uMcwOpiPXXFmQkI5d9vv9Q5T52j9nOP2XnSOCyPpczsFSKHQdQQIRddjmQPlN719mLR7kxWXDdOb8uAJK5TiodwMuQvGx42rRiXdGCHf3STEsrC1Iwvmg5WNJaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9oZnKah; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so2202674276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711114265; x=1711719065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nKSrfsCzVcwON1miF/nJghTVlXIY9BQztSw13EPVqsY=;
        b=m9oZnKahXY3EoyEJbdwisIQJszHqgXEYiTYam02+GPyhHUX4X8W1TVuTyVZ81huOrb
         TIjNhYJNVs0Sn+dEQgJqlelZNBltyBB1PFO2AClDk2yo1RaNeOwhUWq76b+7Io5BCK2x
         fha5Sbpw2Kja2I0aY9nsswtuMsvjGcI/GpTCxyvqDO760FqmFDKJeZ4RPrv6Ol33WvwF
         ycDxAaOyo1nGjrPGtjEekAwNqa5lvYUHAeyyF5NeUekSvaNO9ZOkqrADG4x0OsxpjksI
         v4fCmROtaEpoBu7Z2/fiDVjsZfi1gMOn0IoXUKV8D1lmphDMiw7iwNHFNsZPL6whI+3R
         ekxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711114265; x=1711719065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKSrfsCzVcwON1miF/nJghTVlXIY9BQztSw13EPVqsY=;
        b=LTtVhHp48AMWqpMHkUgMntSXajNh9SGEc9jfmiNUU7mr4Er1rBYIXpeM7DbRfzTbhN
         tbydEWNXg+JmvSKuHRWMRahd+fcScafw/0hzomIhPppirt9uk7oiUqSLA09hv0XEy7qk
         pLfp1PdG8Pw1E1Rv3m4DcRnYYj5xmvVOFWRPDjud6zt4/P9tzqCrui0KD3fL+3qd2oTO
         EHZJavW6eZyQ9m0hlo78lcPn3feKYMo4N2tmNSnXSHOeL6dvclJtoZvpGXPdj7zDmcu7
         2QRpwWhm3uceUfuJgBivY/Y2uASS04pkbajUaQNZCwTwe8DYVy+f0MC9QRTAVVIDr6ca
         JeGg==
X-Forwarded-Encrypted: i=1; AJvYcCWlnOKJAzb/5D688+lerGaeRfhhN0cX/UQMhS1EwI/UaJTcRjBrNpz3ECZ8uaVH5oLEYRgdIdkaVyQhgvbYIOLHAxANzcLUJ/h6bIxduQ==
X-Gm-Message-State: AOJu0YwsnVDtTh3owLDQDk6dxhG9bYgPUXs8Ldn3uXvFj5UbzP2kxZ4z
	xyamCfeHOWnTXVZZlGaBpC8gtq33DCjFBteLsRJSo284HTKYc6mZFXMG4UFO3FhcrJMRHMl6HZA
	gUePEIxk2h1s8JbpTkXGdpZEA1Bp5PZvyjrsGWw==
X-Google-Smtp-Source: AGHT+IH5D7oINyyS4I7mJfjQsUG8tjEnZb27UduJJvC4NRi0Ic4EVPL4891T5fcpIsZnAyGZGlX1vXTstxDaw+yL7Vk=
X-Received: by 2002:a25:84ca:0:b0:dcc:d694:b4a6 with SMTP id
 x10-20020a2584ca000000b00dccd694b4a6mr2044325ybm.15.1711114265437; Fri, 22
 Mar 2024 06:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
In-Reply-To: <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:30:54 +0200
Message-ID: <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Instead of relying on different compatibles for eDP and DP, lookup
> the panel node in devicetree to figure out the connector type and
> then pass on that information to the PHY. External DP is not described

Nit: External DP doesn't have a panel described in DT...

> in DT, therefore, assume it's eDP if panel node is present.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c4cb82af5c2f..c9763f77c832 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>         if (IS_ERR(phy))
>                 return PTR_ERR(phy);
>
> +       rc = phy_set_mode_ext(phy, PHY_MODE_DP,
> +                             dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> +       if (rc) {
> +               DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
> +               dp->catalog = NULL;
> +               goto error;
> +       }
> +
>         dp->catalog = dp_catalog_get(dev);
>         if (IS_ERR(dp->catalog)) {
>                 rc = PTR_ERR(dp->catalog);
> @@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>                 goto error;
>         }
>
> -       dp->aux = dp_aux_get(dev, dp->catalog,
> -                            phy,
> -                            dp->dp_display.is_edp);
> +       dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);

Unrelated

>         if (IS_ERR(dp->aux)) {
>                 rc = PTR_ERR(dp->aux);
>                 DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
> @@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
>         return dp_display_probe_tail(aux->dev);
>  }
>
> +static int dp_display_get_connector_type(struct platform_device *pdev,
> +                                        const struct msm_dp_desc *desc)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *aux_bus;
> +       struct device_node *panel;
> +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> +
> +       /* legacy platforms specify connector type in match data */
> +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)

misaligned

> +               return desc->connector_type;

Can we drop this part completely?

> +
> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +       if (!aux_bus)
> +               goto out;
> +
> +       panel = of_get_child_by_name(aux_bus, "panel");
> +       if (!panel)
> +               goto out;
> +
> +       ret = DRM_MODE_CONNECTOR_eDP;
> +
> +out:
> +       of_node_put(panel);
> +       of_node_put(aux_bus);
> +       return ret;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
> @@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
>         dp->dp_display.pdev = pdev;
>         dp->name = "drm_dp";
>         dp->id = desc->id;
> -       dp->dp_display.connector_type = desc->connector_type;
> +       dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
>         dp->wide_bus_supported = desc->wide_bus_supported;
>         dp->dp_display.is_edp =
>                 (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

