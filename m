Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A800841F31A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355407AbhJARaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355340AbhJARaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:30:16 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E6DC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:28:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y23so2239524lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SXD/dhTGRzLIJNIJHPxlcHALOO5cR+ta5YocZSpUDMc=;
        b=W4C54TU577sWSJ4nGNktuMxuuxsYRp8tqsS48uEkCA5pm1bmo3NfwTsk9mm6eIJGcI
         LsNB7btWyqE+fnMjAOVYKhS+Fd+nHLzHBwe/tBUqN9C7RdW8wkkL3FkDW9Hmj4DjQqda
         6HD+7R2whwyv2/NwoWkaUw1o71ylC1v19gX8lnMGFbfUR08QVN+ilLPHnBH54MSda6Cs
         CB1moVwccgEIJ21iZgoT1DytQD3YfqOpDXaMy036UGx46MhOHf/e1CmWIdyZCYHgIHQR
         mOYbCmQT6tV6agrK04fVY70kJ/8STIY2udXnnMx8RDMgx5Gr+sP0Eb7b2ZlYc2oFm+d5
         Loug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SXD/dhTGRzLIJNIJHPxlcHALOO5cR+ta5YocZSpUDMc=;
        b=lzQnq0yFJU+EK7fAdj4NcYKVqfNPaByKrDu1pcp0kUALYQ4gN5p5s7MwooO/rcoYNI
         6x5a3ZXHD7BZ/Lm8BeaoSLwbFxH8Xo3xtEGNbJSMwuFx/qnfeOw09JJxBOQrkcekUaJ6
         UdTXFcNJJ/IyUddAHRCKPyOOhSGcE8UgOXqVjfipcM9pSzXejmuUB18vCeE3/m8EMkJy
         JS9nsMVF1LUn+9c7v0DUaPUx1XPbpGaSrfgf2Kp48I7/t7tETfpzCCl2xnc3htI4SPdh
         Qdjm6srvUqcWsq77pdfxXsednLC8+1PEIFxq9Z5rGxrO4MPZ2ayZg6JSbZlOuABW1m4f
         bBgw==
X-Gm-Message-State: AOAM530jNgr1nBOsBMUedNenJQfJwy21ieXBP4g59n/J0iRCYCl/YVSf
        TaFDWov8f8xBKQTONJDYHygyBg==
X-Google-Smtp-Source: ABdhPJxrmfprjqGO+7bREO2hzyzs5Eer1fEYYEYzh7OREwAsozmlMafhZTDhGm+ZNv7Z18fIrU2yIg==
X-Received: by 2002:a05:6512:3f87:: with SMTP id x7mr6703806lfa.129.1633109309855;
        Fri, 01 Oct 2021 10:28:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m29sm793507lfj.236.2021.10.01.10.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 10:28:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] drm/msm/dsi: Support NO_CONNECTOR bridges
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <bbcf5361-32e7-a2db-ffcc-986e012f000d@linaro.org>
Date:   Fri, 1 Oct 2021 20:28:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210920225801.227211-2-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2021 01:57, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For now, since we have a mix of bridges which support this flag, which
> which do *not* support this flag, or work both ways, try it once with
> NO_CONNECTOR and then fall back to the old way if that doesn't work.
> Eventually we can drop the fallback path.
> 
> v2: Add missing drm_connector_attach_encoder() so display actually comes
>      up when the bridge properly handles the NO_CONNECTOR flag
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I think this patch can go through the drm/msm, while two other patches 
would need to through the drm-misc. Is it correct?

> ---
>   drivers/gpu/drm/msm/Kconfig           |  2 ++
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 50 ++++++++++++++++++++-------
>   2 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index e9c6af78b1d7..36e5ba3ccc28 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -14,6 +14,8 @@ config DRM_MSM
>   	select REGULATOR
>   	select DRM_KMS_HELPER
>   	select DRM_PANEL
> +	select DRM_BRIDGE
> +	select DRM_PANEL_BRIDGE
>   	select DRM_SCHED
>   	select SHMEM
>   	select TMPFS
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index c41d39f5b7cf..e25877073d31 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>    */
>   
> +#include "drm/drm_bridge_connector.h"
> +
>   #include "msm_kms.h"
>   #include "dsi.h"
>   
> @@ -688,10 +690,10 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>   {
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct drm_device *dev = msm_dsi->dev;
> +	struct drm_connector *connector;
>   	struct drm_encoder *encoder;
>   	struct drm_bridge *int_bridge, *ext_bridge;
> -	struct drm_connector *connector;
> -	struct list_head *connector_list;
> +	int ret;
>   
>   	int_bridge = msm_dsi->bridge;
>   	ext_bridge = msm_dsi->external_bridge =
> @@ -699,22 +701,44 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>   
>   	encoder = msm_dsi->encoder;
>   
> -	/* link the internal dsi bridge to the external bridge */
> -	drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> -
>   	/*
> -	 * we need the drm_connector created by the external bridge
> -	 * driver (or someone else) to feed it to our driver's
> -	 * priv->connector[] list, mainly for msm_fbdev_init()
> +	 * Try first to create the bridge without it creating its own
> +	 * connector.. currently some bridges support this, and others
> +	 * do not (and some support both modes)
>   	 */
> -	connector_list = &dev->mode_config.connector_list;
> +	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
> +			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret == -EINVAL) {
> +		struct drm_connector *connector;
> +		struct list_head *connector_list;
> +
> +		/* link the internal dsi bridge to the external bridge */
> +		drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> +
> +		/*
> +		 * we need the drm_connector created by the external bridge
> +		 * driver (or someone else) to feed it to our driver's
> +		 * priv->connector[] list, mainly for msm_fbdev_init()
> +		 */
> +		connector_list = &dev->mode_config.connector_list;
>   
> -	list_for_each_entry(connector, connector_list, head) {
> -		if (drm_connector_has_possible_encoder(connector, encoder))
> -			return connector;
> +		list_for_each_entry(connector, connector_list, head) {
> +			if (drm_connector_has_possible_encoder(connector, encoder))
> +				return connector;
> +		}
> +
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	connector = drm_bridge_connector_init(dev, encoder);
> +	if (IS_ERR(connector)) {
> +		DRM_ERROR("Unable to create bridge connector\n");
> +		return ERR_CAST(connector);
>   	}
>   
> -	return ERR_PTR(-ENODEV);
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	return connector;
>   }
>   
>   void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
> 


-- 
With best wishes
Dmitry
