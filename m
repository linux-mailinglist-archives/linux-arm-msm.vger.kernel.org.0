Return-Path: <linux-arm-msm+bounces-12240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C5860427
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0E51C2568F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699BD73F02;
	Thu, 22 Feb 2024 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="niQ4RIXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4C71754
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708635441; cv=none; b=Mk423dcEBF0dQ2+kkRrT+N0EEsGCFbnpEPuARJjWoJjI7dLVSlIojxkfULD9vLIRrlW5VMCS8BgRMuRL9BYVM5OS79mCjTnEc2HAUn4WcyW19MUTkQSHKLRgQjIQFSIjgwi4Jn1AYjwCKYPw7UBQ9fztPgGUXwwOEALHeHyouN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708635441; c=relaxed/simple;
	bh=ufdH6B8/rFT8IRC/cAJUrHfnqbjrFfr8TztNNQKuELM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMjEPHEvwVmvKR0R0aFBqQr3STPOLd2ag7Ihok1uyYEClWCZK/yaonxN6i3wmBGGk2mSC5Btmpouk2Fzkfg6uBlOIla4sOFdFXTKiBgcOjsFv60QfypUjRrqxMVq5VX5GPfENkzy81GTBp7RcSXNIROV9ezM1p6Jevp0Vx3Z9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=niQ4RIXt; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so125662276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 12:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708635438; x=1709240238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OlJfxZ2HGOqHH+yFuLajdP34OkZJP17T5eZUptvz6hk=;
        b=niQ4RIXtXfyViIO5GpeNw4XRuHgqhOQ2bXiRDrgFMpUcbgmIVJZkr+N2zE072GZ/Ba
         cBPs5GAPukKmr7H4cs3wuGeT8PV9VwsbraKzMBf25CrbSqTVXda4fMRyVc5kEMD9hvTP
         E2xZVdk0ponihS+HuGBy+aYBNZXkzzM/iyrKEaegwU2Q8HpnQe6FX5Q8APPRtf24G9YP
         3blVVCMs77570PhgPLw93bq2K++wnpRMu6orqGrS7xK+D5bKwxR5t2MJk5UywSe02z6P
         2DOSg3t88m6btP0jugSqpytM/eqeqkA82jf6qJ5pJYFv+KYP7O5Ksn6d8djG9mepKmkF
         gEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635438; x=1709240238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlJfxZ2HGOqHH+yFuLajdP34OkZJP17T5eZUptvz6hk=;
        b=FV3OM41yFgr9PaRZhIQ0qoc2LbtWnPDt+WiBndmPKM2YyYVhaIv6L6mxv3dUECbiei
         CyVkxzf2EQctaIojF2llV55gK6Dv3MfyInaEFp3jxDblZ4Vzry9t0X+CtiPk4BN/bfzY
         5Ozp/HNAaMYl+qbT7uil9VoT0r0F2JJRWYTI34JIV8fBKzPH78OFCCN+MBRET5CSYYKD
         XpQH18qAU7rsSEoovJN1prIm/kyHNu4AP8ZLrL/yJJweaUai0qtxZEyUTtjcXoX7OOgY
         H/hbH9FzPovCdu1XqNyZpBSxadh2h5+/S//kQkYMTm9+LGmVVHHlz1FvMxiTjrqJSzbU
         1+Og==
X-Forwarded-Encrypted: i=1; AJvYcCX2xUn8HeFsmfMmjTBO/MXaPHeOGr1L7r2Or1R3dhTXjgcjRbPj28tcR+NjsSfAy2fwi5d2z+QeSkYCWA+mfSW6GsdWANegvZshxWnibA==
X-Gm-Message-State: AOJu0YxbbVboDfsNfakMaLRzq4mD9DiwvTonLqXJlgR7o/HFSHes2IPA
	ZV6XynosibM5Rg1xLDDugkyjlN3NOlR2qRjrT5FoiVODYt5boXsue/9YIek1G6bTwEFmu2lmss4
	0cT9Yqe3IE/KKDyboABrCNJDGrETxvdHR8I0/CA==
X-Google-Smtp-Source: AGHT+IF9m9jtm1VhqusuJFTiM5ycZ++n/P7+1F1EuJXuTvXHhKSiWFPXHEQ5HDRo4FRo3P5x6Rtq6q/o2h0aRnvCjLo=
X-Received: by 2002:a25:1589:0:b0:dcd:b624:3e55 with SMTP id
 131-20020a251589000000b00dcdb6243e55mr261141ybv.54.1708635438473; Thu, 22 Feb
 2024 12:57:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org> <20240217150228.5788-3-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-3-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 22:57:07 +0200
Message-ID: <CAA8EJpoxe8BmyFqMC5yrqdx-Sx2VR_2gT3x6WT9MyhdLuw+xmA@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/bridge: aux-hpd: separate allocation and registration
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Combining allocation and registration is an anti-pattern that should be
> avoided. Add two new functions for allocating and registering an dp-hpd
> bridge with a proper 'devm' prefix so that it is clear that these are
> device managed interfaces.
>
>         devm_drm_dp_hpd_bridge_alloc()
>         devm_drm_dp_hpd_bridge_add()
>
> The new interface will be used to fix a use-after-free bug in the
> Qualcomm PMIC GLINK driver and may prevent similar issues from being
> introduced elsewhere.
>
> The existing drm_dp_hpd_bridge_register() is reimplemented using the
> above and left in place for now.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> ---
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c | 67 +++++++++++++++++++------
>  include/drm/bridge/aux-bridge.h         | 15 ++++++
>  2 files changed, 67 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 9e71daf95bde..6886db2d9e00 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -30,16 +30,13 @@ static void drm_aux_hpd_bridge_release(struct device *dev)
>         kfree(adev);
>  }
>
> -static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
> +static void drm_aux_hpd_bridge_free_adev(void *_adev)
>  {
> -       struct auxiliary_device *adev = _adev;
> -
> -       auxiliary_device_delete(adev);
> -       auxiliary_device_uninit(adev);
> +       auxiliary_device_uninit(_adev);
>  }
>
>  /**
> - * drm_dp_hpd_bridge_register - Create a simple HPD DisplayPort bridge
> + * devm_drm_dp_hpd_bridge_alloc - allocate a HPD DisplayPort bridge
>   * @parent: device instance providing this bridge
>   * @np: device node pointer corresponding to this bridge instance
>   *
> @@ -47,11 +44,9 @@ static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
>   * DRM_MODE_CONNECTOR_DisplayPort, which terminates the bridge chain and is
>   * able to send the HPD events.
>   *
> - * Return: device instance that will handle created bridge or an error code
> - * encoded into the pointer.
> + * Return: bridge auxiliary device pointer or an error pointer
>   */
> -struct device *drm_dp_hpd_bridge_register(struct device *parent,
> -                                         struct device_node *np)
> +struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np)
>  {
>         struct auxiliary_device *adev;
>         int ret;
> @@ -82,13 +77,55 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
>                 return ERR_PTR(ret);
>         }
>
> -       ret = auxiliary_device_add(adev);
> -       if (ret) {
> -               auxiliary_device_uninit(adev);
> +       ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_free_adev, adev);
> +       if (ret)
>                 return ERR_PTR(ret);
> -       }
>
> -       ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_unregister_adev, adev);
> +       return adev;
> +}
> +EXPORT_SYMBOL_GPL(devm_drm_dp_hpd_bridge_alloc);
> +
> +static void drm_aux_hpd_bridge_del_adev(void *_adev)
> +{
> +       auxiliary_device_delete(_adev);
> +}
> +
> +/**
> + * devm_drm_dp_hpd_bridge_add - register a HDP DisplayPort bridge
> + * @dev: struct device to tie registration lifetime to
> + * @adev: bridge auxiliary device to be registered
> + *
> + * Returns: zero on success or a negative errno
> + */
> +int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev)
> +{
> +       int ret;
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret)
> +               return ret;
> +
> +       return devm_add_action_or_reset(dev, drm_aux_hpd_bridge_del_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(devm_drm_dp_hpd_bridge_add);
> +
> +/**
> + * drm_dp_hpd_bridge_register - allocate and register a HDP DisplayPort bridge
> + * @parent: device instance providing this bridge
> + * @np: device node pointer corresponding to this bridge instance
> + *
> + * Return: device instance that will handle created bridge or an error pointer
> + */
> +struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_node *np)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = devm_drm_dp_hpd_bridge_alloc(parent, np);
> +       if (IS_ERR(adev))
> +               return ERR_CAST(adev);
> +
> +       ret = devm_drm_dp_hpd_bridge_add(parent, adev);
>         if (ret)
>                 return ERR_PTR(ret);
>
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index c4c423e97f06..4453906105ca 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -9,6 +9,8 @@
>
>  #include <drm/drm_connector.h>
>
> +struct auxiliary_device;
> +
>  #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
>  int drm_aux_bridge_register(struct device *parent);
>  #else
> @@ -19,10 +21,23 @@ static inline int drm_aux_bridge_register(struct device *parent)
>  #endif
>
>  #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
> +struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np);
> +int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);

I had a pretty close idea during prototyping, but I ended up doing it
as a single function for the following reasons:

First, this exports the implementation detail that internally the code
uses an aux device.
Also, by exporting the aux device the code becomes less type-safe. By
mistake one can call devm_drm_dp_hpd_bridge_add() on any aux device,
which is not necessarily the HPD bridge.
I'd prefer to see an opaque device-specific structure instead. WDYT?

>  struct device *drm_dp_hpd_bridge_register(struct device *parent,
>                                           struct device_node *np);
>  void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
>  #else
> +static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
> +                                                                   struct device_node *np)
> +{
> +       return NULL;
> +}
> +
> +static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
> +{
> +       return 0;
> +}
> +
>  static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
>                                                         struct device_node *np)
>  {
> --
> 2.43.0
>


-- 
With best wishes
Dmitry

