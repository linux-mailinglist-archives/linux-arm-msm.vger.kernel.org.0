Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5A03D7D3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhG0SPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhG0SPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:15:35 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7393CC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:15:34 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m9so17064163ljp.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yfV0E1rFabhIiXO9mindIm1FyA1NTfSqirbLb3xTqOM=;
        b=DlQr/72gW8MiFQvMBhpXLWKModG5pDJz2nzPZrcdGRnR88A89nMLgO4ndvwzrVq7MP
         j7gZFNytWI/9VYzjv4xheudGu5EJWnvxo2bhB9HsbpID6s4B3XBM7PZZgMisTJk6JcD5
         hlmu7KANSwGCvc8sLV8gGPfifnt0qfeeV4uWn/NrH02WERF/w43wzyNVfrdDWf3mF6wR
         TyacZiX1f8ZeAm35CRunH0HK6dmaWmaHR5doB98IY/vyYVh62bFc25iDHqhr7OxGHZ/i
         LU83saIa6jUFvE36kcfdIDc+fg4neF0E52ZNZ910DsrczrIWTvRZwibsgaffHpeAmcHd
         lTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yfV0E1rFabhIiXO9mindIm1FyA1NTfSqirbLb3xTqOM=;
        b=t92YS21GI3YzlFyn7W3wZEkT66vxQNr9eNg0nb5L5mGjwQJRaLT9ARWCl3rdJSWYD+
         7bd9uHJ77taxgfdRYpQij/GjKcJ/tn2ZNoL/3zF3giXVYpGzL3IYzUxFqZUoOo5f+vDi
         42vPKlggJVyVbLbN+8bnkAUwrN/jiAzsIcwsAJYkNKS7vgaNIbIUreMWROfdWNOAQRkg
         HJvOZQx04SKkF8UDKkZ+6U5/4PhoJy8KzVQ1o5/IHIJnd1QVAr6yND6AZOJwSCaBoKxW
         U9bylI9SnmyVCtpkQt++5cebQe1QDOH4GiD/g9YG//xhxV+e9ztNLGqB0UjWnVsn0avk
         pEsg==
X-Gm-Message-State: AOAM532r5zz66MeIG2VHTRvdcVABqYxP0O4qS6Y4AuRHc1ifk3HfhGZw
        dXX+7D15qSCG84uK+ZaTTvuv978BBOVvsg==
X-Google-Smtp-Source: ABdhPJyD/9m/5S9B1FvDkmMVokgEniXNgjTh2QqES4iZRHkZQDQxjd6Ec63exkhRYlvRkShkmwa9lw==
X-Received: by 2002:a2e:b541:: with SMTP id a1mr16208316ljn.445.1627409732683;
        Tue, 27 Jul 2021 11:15:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k10sm355234lfg.35.2021.07.27.11.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 11:15:32 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/msm/dp: Remove global g_dp_display variable
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-2-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <026a84c3-c2d2-0ea7-0bf6-a6580abad0ef@linaro.org>
Date:   Tue, 27 Jul 2021 21:15:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2021 07:24, Bjorn Andersson wrote:
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
> 
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 78 ++++++++++++++---------------
>   1 file changed, 37 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 70b319a8fe83..8696b36d30e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -27,7 +27,6 @@
>   #include "dp_audio.h"
>   #include "dp_debug.h"
>   
> -static struct msm_dp *g_dp_display;
>   #define HPD_STRING_SIZE 30
>   
>   enum {
> @@ -122,6 +121,13 @@ static const struct of_device_id dp_dt_match[] = {
>   	{}
>   };
>   
> +static struct dp_display_private *dev_to_dp_display_private(struct device *dev)

dev_get_dp_display_private() ?

> +{
> +	struct msm_dp *dp = dev_get_drvdata(dev);
> +
> +	return container_of(dp, struct dp_display_private, dp_display);
> +}
> +

As a matter of preference, it might be cleaner to inline dev_get_drvdata 
and then define msm_dp_get_private to convert from msm_dp to 
dp_display_private, see below.

>   static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>   						u32 data, u32 delay)
>   {
> @@ -198,14 +204,16 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   			   void *data)
>   {
>   	int rc = 0;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
>   	struct drm_device *drm;
>   	struct msm_drm_private *priv;
>   
>   	drm = dev_get_drvdata(master);
>   
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	if (!dp) {

This is not correct, if I'm not mistaken. you wanted to check if dev's 
private data is NULL (correct check), but ended up checking whether the 
result of container_of is NULL (incorrect).

> +		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
> +		return -EINVAL;
> +	}
>   
>   	dp->dp_display.drm_dev = drm;
>   	priv = drm->dev_private;
> @@ -240,12 +248,14 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   static void dp_display_unbind(struct device *dev, struct device *master,
>   			      void *data)
>   {
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
>   	struct drm_device *drm = dev_get_drvdata(master);
>   	struct msm_drm_private *priv = drm->dev_private;
>   
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	if (!dp) {
> +		DRM_ERROR("Invalid DP driver data\n");
> +		return;
> +	}
>   
>   	dp_power_client_deinit(dp->power);
>   	dp_aux_unregister(dp->aux);
> @@ -376,17 +386,14 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>   static int dp_display_usbpd_configure_cb(struct device *dev)
>   {
>   	int rc = 0;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
>   
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		rc = -EINVAL;
> +	if (!dp) {
> +		DRM_ERROR("no driver data found\n");
> +		rc = -ENODEV;
>   		goto end;
>   	}
>   
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> -
>   	dp_display_host_init(dp, false);
>   
>   	rc = dp_display_process_hpd_high(dp);
> @@ -397,17 +404,14 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>   static int dp_display_usbpd_disconnect_cb(struct device *dev)
>   {
>   	int rc = 0;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
>   
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		rc = -EINVAL;

`!dev` check should remain in place. And dp should be fetched 
afterwards. This applies to all the checks in the patch.

> +	if (!dp) {
> +		DRM_ERROR("no driver data found\n");
> +		rc = -ENODEV;
>   		return rc;
>   	}
>   
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> -
>   	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>   
>   	return rc;
> @@ -466,15 +470,15 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>   {
>   	int rc = 0;
>   	u32 sink_request;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
> +	struct dp_usbpd *hpd;
>   
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		return -EINVAL;
> +	if (!dp) {
> +		DRM_ERROR("no driver data found\n");
> +		return -ENODEV;
>   	}
>   
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	hpd = dp->usbpd;
>   
>   	/* check for any test request issued by sink */
>   	rc = dp_link_process_request(dp->link);
> @@ -638,7 +642,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
>   
>   	/* signal the disconnect event early to ensure proper teardown */
> -	dp_display_handle_plugged_change(g_dp_display, false);
> +	dp_display_handle_plugged_change(&dp->dp_display, false);
>   
>   	/* enable HDP plug interrupt to prepare for next plugin */
>   	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
> @@ -832,9 +836,7 @@ static int dp_display_prepare(struct msm_dp *dp)
>   static int dp_display_enable(struct dp_display_private *dp, u32 data)
>   {
>   	int rc = 0;
> -	struct msm_dp *dp_display;
> -
> -	dp_display = g_dp_display;
> +	struct msm_dp *dp_display = &dp->dp_display;
>   
>   	if (dp_display->power_on) {
>   		DRM_DEBUG_DP("Link already setup, return\n");
> @@ -869,9 +871,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
>   
>   static int dp_display_disable(struct dp_display_private *dp, u32 data)
>   {
> -	struct msm_dp *dp_display;
> -
> -	dp_display = g_dp_display;
> +	struct msm_dp *dp_display = &dp->dp_display;
>   
>   	if (!dp_display->power_on)
>   		return 0;
> @@ -1229,14 +1229,13 @@ static int dp_display_probe(struct platform_device *pdev)
>   	}
>   
>   	mutex_init(&dp->event_mutex);
> -	g_dp_display = &dp->dp_display;
>   
>   	/* Store DP audio handle inside DP display */
> -	g_dp_display->dp_audio = dp->audio;
> +	dp->dp_display.dp_audio = dp->audio;
>   
>   	init_completion(&dp->audio_comp);
>   
> -	platform_set_drvdata(pdev, g_dp_display);
> +	platform_set_drvdata(pdev, &dp->dp_display);
>   
>   	rc = component_add(&pdev->dev, &dp_display_comp_ops);
>   	if (rc) {
> @@ -1249,10 +1248,7 @@ static int dp_display_probe(struct platform_device *pdev)
>   
>   static int dp_display_remove(struct platform_device *pdev)
>   {
> -	struct dp_display_private *dp;
> -
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	struct dp_display_private *dp = platform_get_drvdata(pdev);

dev_to_dp_display_private() rather than just get_drvdata?

>   
>   	dp_display_deinit_sub_modules(dp);
>   
> 


-- 
With best wishes
Dmitry
