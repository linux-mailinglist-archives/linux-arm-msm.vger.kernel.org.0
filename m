Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743C7666E53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238303AbjALJeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240187AbjALJdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:33:43 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764F45FFB
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:28:50 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g10so12738162wmo.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s8MnoAgHkId9FhPokT3fVKmzeGfpbg3aesfKGqPuYv0=;
        b=AkpX+ZYdchxDwwgBxbr+n8PmtV0bju6ssjP4M3zeUx8mx33QmuEeyLr83nAHoN2lBc
         1G4FbjvwUVn8y41Ef3+nCAD4Emgh/63BeZQIfyo4j3QVteSjziYUJmLq5uqJ+gFvWKYR
         h5LhfAhC9rE3by5Nd+0sbVYUHK5UTesZWm9N7D0bdBG5TvVLsBY1P1Vxs9y9TVEDZFuf
         avwCdxB+QbFjZrSN4hFIF5AEtDBI22+5HVQdm4gl2trl1vl2PmfIjPQ9UWxUuACPk0zT
         O8Bu1NF1fs4Mlo0DCTbNCVg/FQ7X07hq2sE/ApQShzUfI5000IZ50mkgmbiY2C9ewBkQ
         kOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8MnoAgHkId9FhPokT3fVKmzeGfpbg3aesfKGqPuYv0=;
        b=DcE4W6VxGVGg8kUiEK4gFNR9SO7d+Wl+r5CtdyJvPWwAkhcOQToHX1/tAvck8x8eq3
         k+mGgS0bRqIK9zXaM3lt71PrIkSVZ64n9c9CqIbjpTscJwGZUCe/Jk6L659CzC/WOhPS
         DBD+T24QkpSrDEphDOolzMuXplV2rwDD2dMW+DB62ZqlVg+4jKmFGI4ShSt8mArbR2V1
         i7FGssk1YqtwP1WHBxtl+wg8IhOagO+/9y7M2emhLFl8vLywOic3qT5TeWiFI2GEnJ2m
         xn+LaXXKkWoCGHoH6DAN7yqj2x/3LNdxtJJwl6FP6oW6riek/ZI1hmfGqIn5dcSEuUM5
         X+mA==
X-Gm-Message-State: AFqh2krsitxuzVeqwr1mnaj/TNCh6B6cnyUkooI5v0DucCR00LnPmbha
        CaKdYtc9siDwVNYLF5CqVxiPwg==
X-Google-Smtp-Source: AMrXdXvPhGqBJ7gPwDPysTQvNsKyKcE6+HRyCIFIsQRwLbeNgsJ4Hgx6gSrg69x7V/J0BUH4wpsotQ==
X-Received: by 2002:a05:600c:4fd4:b0:3d3:4877:e556 with SMTP id o20-20020a05600c4fd400b003d34877e556mr57211597wmq.29.1673515728997;
        Thu, 12 Jan 2023 01:28:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b003c21ba7d7d6sm22960243wmn.44.2023.01.12.01.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:28:48 -0800 (PST)
Message-ID: <595efc95-0df7-a8d0-73ae-903b8ca013fe@linaro.org>
Date:   Thu, 12 Jan 2023 10:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 09/13] drm/bridge: lt9611: fix sync polarity for DVI
 output
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
 <20230108165656.136871-10-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-10-dmitry.baryshkov@linaro.org>
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
> Attaching DVI sink to the lt9611 requires different setup. Fix the
> register write to make the DVI displays sync onto the correct sync
> pulse.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 773d7a56f86f..7f9be74acf0d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -352,13 +352,16 @@ static int lt9611_video_check(struct lt9611 *lt9611)
>   	return temp;
>   }
>   
> -static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611)
> +static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
>   {
>   	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
>   	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
>   	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
>   
> -	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
> +	if (is_hdmi)
> +		regmap_write(lt9611->regmap, 0x82d6, 0x8c);
> +	else
> +		regmap_write(lt9611->regmap, 0x82d6, 0x0c);
>   	regmap_write(lt9611->regmap, 0x82d7, 0x04);
>   }
>   
> @@ -719,7 +722,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
>   	}
>   
>   	lt9611_mipi_input_analog(lt9611);
> -	lt9611_hdmi_tx_digital(lt9611);
> +	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
>   	lt9611_hdmi_tx_phy(lt9611);
>   
>   	msleep(500);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
