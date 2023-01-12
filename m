Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0D8666E49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240152AbjALJbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240144AbjALJas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:30:48 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA77E022
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:26:51 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id ay40so12739958wmb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eBlIHS2Zl7GF2Q8lPs3zV1BAKl5mMtukn1yC7tdNIEc=;
        b=oUin74EeEXy8maX+Y0SSB5hRgeW9wABT/oT86EoGEqxLuXKob3zkdJnkBRDgsakDN8
         pAtVG4W/XOu6zU9rGwtauco8o0J5rUdINLwjm7Xvsv0vuzd6ucYvCgtLjSyeTBb9gUmR
         X2eQfgrVtiV8njVXZnZa5D11qKwKHy+gBOSyGCLDqj7j+07fJkwl3LfnCTME+qALPJBi
         X3Q605jZmzextwUHvWn6coy29oyWYBl7jyRnRgzqIzAq/7O5ZDbMrGcrA0FcElSKNTUQ
         yeshcHJCpJaJkATWBKP4jftAb+Uk3BhoACqb6wDVQkF/4/QZoxrh5d4rCgdDTfSsjhPU
         zXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBlIHS2Zl7GF2Q8lPs3zV1BAKl5mMtukn1yC7tdNIEc=;
        b=X+K9HwOIQSOO+X7hdVzVp41oTsHolrIPjIj3sIc2YCRYU24GucqMWQT3DyynvDOllR
         oMM9x3EDMJWRDh/TLHoLVkNcOOaEOqfOFSIlpj5msyQzNZwdygwSCqBt5e+K2pVfGrfs
         obO3G4K5M5VLflXCRp3MWiEfpGf2n2/0stDr5CECA1M62SFW7XmR621TFM0G6WP/Go/R
         jgGB2MEKX6A10PoiDp8S8XsNnrQYC8BhZRaa+zmRFwxfQ/wAYhoWaTjIj6q0MjM31VZI
         ZlIUosORsb/22bYdTQiU81xnfaQdqCDvj0cAVFpmy875vc/HnvvKuODhOAeJppsv647M
         3FRQ==
X-Gm-Message-State: AFqh2kqYj7rCPwlGNwtT9zMvE1jmTnEhu95QVP4kYJZIlIWp4otoAGP2
        oxE6u0nR53FiBzsfwbOhaCZ26w==
X-Google-Smtp-Source: AMrXdXsV188Hle3fFVDUTr1Xo5oOGGtcvKq1uElQqAZitxGc5tTAwYA0K4zGmbjBegQEkYdXvYLNpA==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id k1-20020a05600c1c8100b003d1e90717cbmr55291627wms.1.1673515610497;
        Thu, 12 Jan 2023 01:26:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c35c500b003d98f92692fsm23349739wmq.17.2023.01.12.01.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:26:50 -0800 (PST)
Message-ID: <84f4f4ef-569c-c292-0b52-f15cd94a6853@linaro.org>
Date:   Thu, 12 Jan 2023 10:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 03/13] drm/bridge: lt9611: fix polarity programming
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-4-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-4-dmitry.baryshkov@linaro.org>
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

On 08/01/2023 17:56, Dmitry Baryshkov wrote:
> Fix programming of hsync and vsync polarities
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 58f39b279217..deb503ca956a 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -207,7 +207,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   
>   		/* stage 2 */
>   		{ 0x834a, 0x40 },
> -		{ 0x831d, 0x10 },
>   
>   		/* MK limit */
>   		{ 0x832d, 0x38 },
> @@ -222,11 +221,19 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   		{ 0x8325, 0x00 },
>   		{ 0x832a, 0x01 },
>   		{ 0x834a, 0x10 },
> -		{ 0x831d, 0x10 },
> -		{ 0x8326, 0x37 },
>   	};
> +	u8 pol = 0x10;
>   
> -	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		pol |= 0x2;
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		pol |= 0x1;
> +	regmap_write(lt9611->regmap, 0x831d, pol);
> +
> +	if (mode->hdisplay == 3840)
> +		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
> +	else
> +		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
>   
>   	switch (mode->hdisplay) {
>   	case 640:
> @@ -236,7 +243,7 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   		regmap_write(lt9611->regmap, 0x8326, 0x37);
>   		break;
>   	case 3840:
> -		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
> +		regmap_write(lt9611->regmap, 0x8326, 0x37);
>   		break;
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
