Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3AEC54C815
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 14:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbiFOMEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 08:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245324AbiFOMEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 08:04:21 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F89377E2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:04:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y29so12996617ljd.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=iXTqTOe5xGmaUGe1huORsSfZpFx3XRNmNcB6WpH+6mw=;
        b=ec0g+iH2H1WZ6TAg373dSwMY7lpuvlaoeH0t+38efRrkBitZWDTOMV55aQR654l6t1
         PSwLA/CCuiRT9Hxi8oaGg3t6+4ZpUrptmsfvYrYTAiYvor9ucyxNz4+/zpQj8CtVFfXJ
         ZQt51/zeDGVbDBwYFKsX3/XmSlQqBK5t4YhuJmILIW33fRm3f/+9XK2Cw9VGaLydheN0
         +YWdcF8SPFtHIG0Cq2pd6wtdIPQwD6KtT+CaS/7zLUdoN2Z9Ib4DKrwxXSP02IHUuT+y
         iE0g/9YRvFZ3YCTrH9bMr0bx/vf9qFhU+FC923i4QVXcRGtR691AL/RLFZhinP0DS8ff
         /rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=iXTqTOe5xGmaUGe1huORsSfZpFx3XRNmNcB6WpH+6mw=;
        b=vfJYqfvT6k4Jmn7HP/d6BX+4RQdiA7jH07ePE7DUJwGsXFlovUAZ1fTAUi3qWgoI/1
         HTj6OSiqTd6IAfd1W5YvNv24KGqvoaKBablNjy5SOQ52j3S/PcNf269j9IZL9FgoD6em
         xiQmBd1gmEZUsRh0rsS9dWAwqVz4deiyqXgFgzcD/b1zo1DopOm7pxi5gI8esISdz82F
         Xxbt3q0ZtTiYQA/h9Ge/gfgLzqeLrCN3RQYxomRNrWTJj3pR7ipQ8vYZZXwdnce0s9hi
         ZT8i/idVRBJFd+Gw1Xk5+p3CqO1dS+rDhYb19wXm9TqNG7gFUK2HQvKlhn36cy+lDeZ7
         HM3g==
X-Gm-Message-State: AJIora+GfAs/2gTHTYK23VF1GXgXfLK4SswqbdxkFjQvJu3k59wnILZz
        +1asrp9M4gMiKU79RGEui9Z2mw==
X-Google-Smtp-Source: AGRyM1t0B8AvkM8FcmOy8Zu8YweVXPHtZP5xqhSG54spm9zJAqUPumOZFpD4TvA/3C3bBm/DhW7tBg==
X-Received: by 2002:a2e:bf14:0:b0:255:b789:576b with SMTP id c20-20020a2ebf14000000b00255b789576bmr5097964ljr.47.1655294657724;
        Wed, 15 Jun 2022 05:04:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 9-20020a2e0809000000b002557cc64de7sm1668179lji.71.2022.06.15.05.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 05:04:17 -0700 (PDT)
Message-ID: <da71cb6c-7512-d187-6ec0-d2d1a4eeaeba@linaro.org>
Date:   Wed, 15 Jun 2022 15:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] drm/mipi-dsi: pass DSC data through the struct
 mipi_dsi_device
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
 <20220501151220.3999164-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220501151220.3999164-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2022 18:12, Dmitry Baryshkov wrote:
> The commit 0f40ba48de3b ("drm/msm/dsi: Pass DSC params to drm_panel")
> added a pointer to the DSC data to the struct drm_panel. However DSC
> support is not limited to the DSI panels. MIPI DSI bridges can also
> consume DSC command streams. Thus add struct drm_dsc_config pointer to
> the struct mipi_dsi_device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Gracious ping for the review from the drm core

> ---
>   include/drm/drm_mipi_dsi.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 147e51b6d241..8b1c9be9b2a7 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -177,6 +177,7 @@ struct mipi_dsi_device_info {
>    * @lp_rate: maximum lane frequency for low power mode in hertz, this should
>    * be set to the real limits of the hardware, zero is only accepted for
>    * legacy drivers
> + * @dsc: panel/bridge DSC pps payload to be sent
>    */
>   struct mipi_dsi_device {
>   	struct mipi_dsi_host *host;
> @@ -189,6 +190,7 @@ struct mipi_dsi_device {
>   	unsigned long mode_flags;
>   	unsigned long hs_rate;
>   	unsigned long lp_rate;
> +	struct drm_dsc_config *dsc;
>   };
>   
>   #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"


-- 
With best wishes
Dmitry
