Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92481666E52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjALJeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:34:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240090AbjALJc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:32:56 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307713AB2C
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:28:05 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso10146488wms.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bE4oQCcZATgYswFNXjiN1PSYvEeSqVFFTUEgVcCHRqY=;
        b=WLFz0SjPniOmuuhOSq+y9zKQAgHClwh20BdVYXd2Umlja+eunpiFmc7s4kRtI42i+d
         zsnRwdmemcr0uWpc5ln/7xC4tvfHa9q8taCiKhXFHVGwldR/cvFgYqkpQC+ApK+xYW5X
         E9k27xRHWDgSmWUl32GFnSYvceHlHhBpZNR6o7Rd8Q65PgYJuwfFeK3RMUnm7AmrgE8B
         v3HPtaqezo5VwCsQXK//0JgmLTlKD4monuuDMLiDIbOesJcEXoITlXHhRdKVOokTROSp
         nP8o+IqDYx+qgbRkN4BXC1sP2+v7bkxfUFDUnCBicq8WafK5E9RrOulGiHlW60hvuUoj
         WSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE4oQCcZATgYswFNXjiN1PSYvEeSqVFFTUEgVcCHRqY=;
        b=hCqs8Roj0/Kv9O3nODvjQoedV2SGTLaZ3pBgK9KFBn1x8pMIa7V+skPPcvIo7yfL2G
         EwjlbswhLsDNm71XSh/nUr+bGXxROCGZYbou58Gvo1zdrJJsBBmRSS3C7RROtv34hK6z
         VqMmwgymT5dyDJ6UIzboNhApEk26xrfvVgyvOaAS7i04Q3hBgBlEm4U1pT+xXeVEvE63
         uKnBxvfcQive7c43PRA1OpSZ/JcXMT2B+uBy/TEecn0eDutr4CY9hbE1eTFSkdVrcfZx
         YRvAAySgWKlC78aeE+2j06IbooWxuZ4lE2MggbeRJ31yChRlp5HUrWNO+N3Cwvw9btD0
         2WYA==
X-Gm-Message-State: AFqh2kqaSk0AjZlWa5YV/nw1/O6KRrwZzuHmgAIb453LZKq26LjN+Abm
        vSJBl6aDzAK5OWlugNtM6XsVEw==
X-Google-Smtp-Source: AMrXdXuPWI+yg3atLG0k05sqkYIWUkReEqRYzDSBlD2E+8z9mFSN57rM5bbZX3yhPmwmm9H3tSGnDg==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id be12-20020a05600c1e8c00b003d62952679bmr54348403wmb.34.1673515683704;
        Thu, 12 Jan 2023 01:28:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003d1f2c3e571sm28585178wmq.33.2023.01.12.01.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:28:03 -0800 (PST)
Message-ID: <1fc55e78-d5a2-c16d-0178-2195fe09d8ae@linaro.org>
Date:   Thu, 12 Jan 2023 10:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 05/13] drm/bridge: lt9611: fix clock calculation
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
 <20230108165656.136871-6-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-6-dmitry.baryshkov@linaro.org>
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
> Instead of having several fixed values for the pcr register, calculate
> it before programming. This allows the bridge to support most of the
> display modes.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 32 +++++++++++--------------
>   1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index f377052a45a4..e2799a0df8f8 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -192,8 +192,9 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
>   	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
>   }
>   
> -static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> +static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int postdiv)
>   {
> +	unsigned int pcr_m = mode->clock * 5 * postdiv / 27000;
>   	const struct reg_sequence reg_cfg[] = {
>   		{ 0x830b, 0x01 },
>   		{ 0x830c, 0x10 },
> @@ -236,24 +237,14 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   	else
>   		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
>   
> -	switch (mode->hdisplay) {
> -	case 640:
> -		regmap_write(lt9611->regmap, 0x8326, 0x14);
> -		break;
> -	case 1920:
> -		regmap_write(lt9611->regmap, 0x8326, 0x37);
> -		break;
> -	case 3840:
> -		regmap_write(lt9611->regmap, 0x8326, 0x37);
> -		break;
> -	}
> +	regmap_write(lt9611->regmap, 0x8326, pcr_m);
>   
>   	/* pcr rst */
>   	regmap_write(lt9611->regmap, 0x8011, 0x5a);
>   	regmap_write(lt9611->regmap, 0x8011, 0xfa);
>   }
>   
> -static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> +static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int *postdiv)
>   {
>   	unsigned int pclk = mode->clock;
>   	const struct reg_sequence reg_cfg[] = {
> @@ -271,12 +262,16 @@ static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode
>   
>   	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
>   
> -	if (pclk > 150000)
> +	if (pclk > 150000) {
>   		regmap_write(lt9611->regmap, 0x812d, 0x88);
> -	else if (pclk > 70000)
> +		*postdiv = 1;
> +	} else if (pclk > 70000) {
>   		regmap_write(lt9611->regmap, 0x812d, 0x99);
> -	else
> +		*postdiv = 2;
> +	} else {
>   		regmap_write(lt9611->regmap, 0x812d, 0xaa);
> +		*postdiv = 4;
> +	}
>   
>   	/*
>   	 * first divide pclk by 2 first
> @@ -895,14 +890,15 @@ static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   	struct hdmi_avi_infoframe avi_frame;
> +	unsigned int postdiv;
>   	int ret;
>   
>   	lt9611_bridge_pre_enable(bridge);
>   
>   	lt9611_mipi_input_digital(lt9611, mode);
> -	lt9611_pll_setup(lt9611, mode);
> +	lt9611_pll_setup(lt9611, mode, &postdiv);
>   	lt9611_mipi_video_setup(lt9611, mode);
> -	lt9611_pcr_setup(lt9611, mode);
> +	lt9611_pcr_setup(lt9611, mode, postdiv);
>   
>   	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
>   						       &lt9611->connector,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
