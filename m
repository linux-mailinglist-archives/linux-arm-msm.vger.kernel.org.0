Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02766ABFB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 13:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCFMit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 07:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjCFMis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 07:38:48 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9F220577
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 04:38:40 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so8085001wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678106319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yhOmJgcVtUjX4AZDns6YBklpfVzqtsQV67rhvEp3eI=;
        b=OR7LWTSNoXH3IeQrctqw8TkU9wgsDdXVChDKrhxA8J3CgRJrceNUjn3osYOwFrOrRN
         BqqlMX0IExW5kP5JBmTfrA9H6By8K1zl4rGuH1LTTyOpV5B8hGX8uTw2I8X2fD+RGPEA
         TBezyt2nk9lhD30IBNuJVbxD900xHxrW6/nzN1UwiGKAu5FHVTGUOlj/bKC/M4kdoYuh
         XrZfp6Fr9Unp7AGBU0X2aBck0rgdcZOe5CBXNixWbswNuXtub9Ll7ByzbpqSN63Rlj+B
         27YWkSWMquule9G7VP35cEtfD2mRLvx+suAdrWg6FWxZdVxw4OXauD5rIAeN7OX+ccjk
         s1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678106319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yhOmJgcVtUjX4AZDns6YBklpfVzqtsQV67rhvEp3eI=;
        b=fUGRXkXEHjriDV/QrM15let0sO947fE/ltRG0tCC9cPAHh7CIsz8p7FdOOXj0PKf1H
         dghVoaD9bDK7WM9jKGf4BHIodg4yk4xPFsUUnORnYESE/J97520327oVSIMoxvlbiyqZ
         u3fYy94VqG4knbGr9nUr12t/RRqWNF2ed6CTpkRv0jm+PJAkBS0sq0Zd9Y8kegf5aNjD
         Adxo38n0ShPrKztzWfeRfOm5PVNnoFOb+hMJFxtZU+SbXjb2K1sHH4SbUfjK+5/jdysU
         5s9eYhzHwC/UqHq5WA+tR8kidOOaD71M2paQwrvnftbyrQ0M/NwxfoLSd+vp6TepD/YV
         QS9Q==
X-Gm-Message-State: AO0yUKVUnayfMv5+bZVrDAjz2RCJcPFVaqj8jlVcYsCla8aJi4GjbU03
        qtFCjy+0+cfvf3V+++UJfYzFqA==
X-Google-Smtp-Source: AK7set9TvA7YNerqLQ/yes/5QTT3xBVyyZhcuMwk68DQMGSIOInAXFM8jDVPJH5zS95nzX34Pm6YEw==
X-Received: by 2002:a05:600c:468b:b0:3e2:589:2502 with SMTP id p11-20020a05600c468b00b003e205892502mr8583211wmo.28.1678106318988;
        Mon, 06 Mar 2023 04:38:38 -0800 (PST)
Received: from [10.203.3.194] ([185.202.34.81])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b003dfe549da4fsm14827701wmq.18.2023.03.06.04.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 04:38:38 -0800 (PST)
Message-ID: <26986caf-1245-88f2-60d0-5930c86ea31b@linaro.org>
Date:   Mon, 6 Mar 2023 14:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/10] drm/msm: use drmm_mode_config_init()
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-10-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-10-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/03/2023 12:07, Johan Hovold wrote:
> Switch to using drmm_mode_config_init() so that the mode config is
> released when the last reference to the DRM device is dropped rather
> than unconditionally at unbind() (which may be too soon).

This also means that drm_bridge_detach() might be called at some point 
after unbind(), which might be too late.

> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 73c597565f99..ade17947d1e5 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -247,8 +247,6 @@ static int msm_drm_uninit(struct device *dev)
>   	if (kms)
>   		msm_disp_snapshot_destroy(ddev);
>   
> -	drm_mode_config_cleanup(ddev);
> -
>   	for (i = 0; i < priv->num_bridges; i++)
>   		drm_bridge_remove(priv->bridges[i]);
>   	priv->num_bridges = 0;
> @@ -454,11 +452,13 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	might_lock(&priv->lru.lock);
>   	fs_reclaim_release(GFP_KERNEL);
>   
> -	drm_mode_config_init(ddev);
> +	ret = drmm_mode_config_init(ddev);
> +	if (ret)
> +		goto err_destroy_wq;
>   
>   	ret = msm_init_vram(ddev);
>   	if (ret)
> -		goto err_cleanup_mode_config;
> +		goto err_destroy_wq;
>   
>   	/* Bind all our sub-components: */
>   	ret = component_bind_all(dev, ddev);
> @@ -563,8 +563,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   err_deinit_vram:
>   	msm_deinit_vram(ddev);
> -err_cleanup_mode_config:
> -	drm_mode_config_cleanup(ddev);
> +err_destroy_wq:
>   	destroy_workqueue(priv->wq);
>   err_put_dev:
>   	drm_dev_put(ddev);

-- 
With best wishes
Dmitry

