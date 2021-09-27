Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD7E419E51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 20:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236158AbhI0SdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 14:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236012AbhI0Sc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 14:32:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A187C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 11:31:20 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u18so80024332lfd.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sWmqXMuBrucuIeakdjz9BORDR3vl7TbPCCWtbIs4HsQ=;
        b=qjbC3u4RvCRjqFP+IDqxbgDTZaId2dnGKxvHO5eeQyWsVWmbTQgLobqt/yAW+X0Ghn
         TajScg8JESA1H9S0+15RKB5n7gRpugUil1yVkZq4UgQ+xy0Qj9AZMUq6zZxddGPVytJq
         IZy+3rPID0+L31UtMNINPPx2F23HLf/jyda0MJC0n7LuSYyNEMpiorCUS0TEQ23RWqI3
         w8429B3XLM9pWb04fMen5yT1exU9mylBuRTgu3lcJ77hw/xQrnfEd3ROZlJ07IWaB6Xl
         0SqwaE3zB/KMh1AtJ4SNjbQAHhtG/rZVLoQ3EiTvD89/sgpZhe6hOWY6KTUQ62r4auFM
         xCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sWmqXMuBrucuIeakdjz9BORDR3vl7TbPCCWtbIs4HsQ=;
        b=QEpQU40zEV9rFzI5PJhKYEw+yO7kbOJFUDx49ELc/Uwtc4w9ZaD67PAwvd4aFu3ep3
         oi4W2nE+RgHQzlGdsHpo+U3L7zP2KoCpFVc8IH4EYvVAA3R4YHFLbSUkaI0B01gZ7wAL
         EonmINg2rFlwZ5FL7X7P9esJh7iFLXcypbdpXCSNJzbwLci+zvjyCrFmDzLxo+soOab8
         b7WqKD0y3Hyo5v7R0c8S90oRMQhJPfRve37zTiPxCjaQa4ij8GDpPrLIhbaFzxxldKMN
         vUIjzt7qrbrDBIdztRHa9mA2F9slf/3XtdSdzoqQECBfAp1n4HRgzXC0YQ5M9/afQVen
         HjoA==
X-Gm-Message-State: AOAM533eqgEltcJ1Kw96Q/+4eFpbBeet+Y44onUvVkqIL/VKV3te9Qn/
        voph80Vlm5Wrc5+9qFN2ZFXbcVS7NVCfvw==
X-Google-Smtp-Source: ABdhPJxwP05zdXBtU+0jDLh//7TLDHEPrVzDS70hOgJcCU4U2k6vSzc2JXdGoSf1+lT+28xAXHp4VQ==
X-Received: by 2002:a2e:bf1a:: with SMTP id c26mr1442559ljr.88.1632767476760;
        Mon, 27 Sep 2021 11:31:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r22sm2080554lji.5.2021.09.27.11.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 11:31:16 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge/lontium-lt9611uxc: fix provided connector
 suport
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
Message-ID: <e793810b-5e45-693f-8d72-b20e85b78f61@linaro.org>
Date:   Mon, 27 Sep 2021 21:31:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/07/2021 02:03, Dmitry Baryshkov wrote:
> - set DRM_CONNECTOR_POLL_HPD as the connector will generate hotplug
>    events on its own
> 
> - do not call drm_kms_helper_hotplug_event() unless mode_config.funcs
>    pointer is not NULL to remove possible kernel oops.
> 
> Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Gracious ping for review. It would be really nice to get this patch into 
5.16


>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 3cac16db970f..010657ea7af7 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -167,9 +167,10 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
>   	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
>   	bool connected;
>   
> -	if (lt9611uxc->connector.dev)
> -		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> -	else {
> +	if (lt9611uxc->connector.dev) {
> +		if (lt9611uxc->connector.dev->mode_config.funcs)
> +			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> +	} else {
>   
>   		mutex_lock(&lt9611uxc->ocm_lock);
>   		connected = lt9611uxc->hdmi_connected;
> @@ -339,6 +340,8 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
>   		return -ENODEV;
>   	}
>   
> +	lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +
>   	drm_connector_helper_add(&lt9611uxc->connector,
>   				 &lt9611uxc_bridge_connector_helper_funcs);
>   	ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
> 


-- 
With best wishes
Dmitry
