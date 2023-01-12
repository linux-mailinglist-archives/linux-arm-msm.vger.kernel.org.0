Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B07C667397
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 14:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjALNwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 08:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbjALNvq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 08:51:46 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8085133E
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:51:43 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso15086967wms.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uZVrM4xUFkayhXE6NSF9Gkl0TT3lC5ZfZNa0nbaTN6Y=;
        b=HHwGOIu3aD762K0LbAmKYWEC0Dsf86kUXambp1U1u9MZ/n7el8sSohjjn6sezWS4V4
         YhHTIWyZW40n3vS64Sg+L/uxTwstpKURQI92ptYvQlO99OryNG3OI3khDaNtqnvSOGbr
         oozX3kbRRFtJhWtL1QJVQDUsaVF646LcPf1IfFtpKcCK3dpzcQRP/bMwbBPFk9DHG7qu
         wYuxqqQy1mtJ2bHfg4myEHY0RCJ+tRpw/9+/2+W4XKr39MdHLTTLPayUgLwXsoXg7K+Y
         toeoR5W1nIHbIpejX6VIGcHkDp49Q6CSzxgDAhKDAAnKUKJmGPzoRbrnb572YQCzdXDZ
         u3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZVrM4xUFkayhXE6NSF9Gkl0TT3lC5ZfZNa0nbaTN6Y=;
        b=erEW8hSxpJRuFGG9tXYRddmGBCOBb+27cgrbjltXUcbfiJuyoVb/OcSsktKMh5dbK8
         xU3i6gmXtcv6MpFmHOk5dw1TcMbXetgdBfaZ4oV3QBlf/rhybTgHXRzobF2kCkGYUicn
         gYv+83YMh2NRQFG/lLo/DCE4m7/AOTyNU45vcwLWp8pCcPzTRSumKyGnhbO0/farutfU
         Uj5G3PRsQc8uqbHW2KoRdBa3hr31m5l5WwO//mEDSx/sDJ2auFU8JQVQuzHslrLxNIGn
         L5daXP0JidrzgqX+7ZjbF/QgoClyZdAWpD67ucW2Lkeju94Xuv8HfVyzq9psxZfMX8b0
         GVKA==
X-Gm-Message-State: AFqh2kpSTNBJuTgS/qZVQic94IsjixOgWlUyeFTaUou8yDWdlseelhMk
        vImwE6LeQIZcLFiPjhIjczUl9w==
X-Google-Smtp-Source: AMrXdXtyA5e0okc8TN+9NvFsWNiRdJZbXapu8CD2bFc10KX8MwSVdrikqjK8pJcuKyPmnZ6gpGbx+Q==
X-Received: by 2002:a05:600c:b92:b0:3d9:779e:9788 with SMTP id fl18-20020a05600c0b9200b003d9779e9788mr46821236wmb.37.1673531502013;
        Thu, 12 Jan 2023 05:51:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id d6-20020a05600c3ac600b003da0dc39872sm4578569wms.6.2023.01.12.05.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 05:51:41 -0800 (PST)
Message-ID: <f65d21fa-96ba-9c37-5ac0-630d1c6a36a1@linaro.org>
Date:   Thu, 12 Jan 2023 14:51:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 11/13] drm/bridge: lt9611: rework infoframes handling
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
 <20230108165656.136871-12-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-12-dmitry.baryshkov@linaro.org>
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
> Rework handling infoframes:
> - Write full HDMI AVI infoframe instead of just fixing the VIC value
> - Also send the HDMI Vendor Specific infoframe, as recommended by the
>    HDMI spec.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 57 +++++++++++++++++++------
>   1 file changed, 44 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 1396ab081f61..82af1f954cc6 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -59,7 +59,6 @@ struct lt9611 {
>   	enum drm_connector_status status;
>   
>   	u8 edid_buf[EDID_SEG_SIZE];
> -	u32 vic;
>   };
>   
>   #define LT9611_PAGE_CONTROL	0xff
> @@ -352,12 +351,51 @@ static int lt9611_video_check(struct lt9611 *lt9611)
>   	return temp;
>   }
>   
> -static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
> +static void lt9611_hdmi_set_infoframes(struct lt9611 *lt9611,
> +				       struct drm_connector *connector,
> +				       struct drm_display_mode *mode)
>   {
> -	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
> -	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
> -	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
> +	union hdmi_infoframe infoframe;
> +	ssize_t len;
> +	u8 iframes = 0x0a; /* UD1 infoframe */
> +	u8 buf[32];
> +	int ret;
> +	int i;
> +
> +	ret = drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi,
> +						       connector,
> +						       mode);
> +	if (ret < 0)
> +		goto out;
> +
> +	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
> +	if (len < 0)
> +		goto out;
> +
> +	for (i = 0; i < len; i++)
> +		regmap_write(lt9611->regmap, 0x8440 + i, buf[i]);
> +
> +	ret = drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
> +							  connector,
> +							  mode);
> +	if (ret < 0)
> +		goto out;
> +
> +	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
> +	if (len < 0)
> +		goto out;
>   
> +	for (i = 0; i < len; i++)
> +		regmap_write(lt9611->regmap, 0x8474 + i, buf[i]);
> +
> +	iframes |= 0x20;
> +
> +out:
> +	regmap_write(lt9611->regmap, 0x843d, iframes); /* UD1 infoframe */
> +}
> +
> +static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
> +{
>   	if (is_hdmi)
>   		regmap_write(lt9611->regmap, 0x82d6, 0x8c);
>   	else
> @@ -687,9 +725,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
>   	struct drm_connector_state *conn_state;
>   	struct drm_crtc_state *crtc_state;
>   	struct drm_display_mode *mode;
> -	struct hdmi_avi_infoframe avi_frame;
>   	unsigned int postdiv;
> -	int ret;
>   
>   	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>   	if (WARN_ON(!connector))
> @@ -710,18 +746,13 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
>   	lt9611_mipi_video_setup(lt9611, mode);
>   	lt9611_pcr_setup(lt9611, mode, postdiv);
>   
> -	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
> -						       connector,
> -						       mode);
> -	if (!ret)
> -		lt9611->vic = avi_frame.video_code;
> -
>   	if (lt9611_power_on(lt9611)) {
>   		dev_err(lt9611->dev, "power on failed\n");
>   		return;
>   	}
>   
>   	lt9611_mipi_input_analog(lt9611);
> +	lt9611_hdmi_set_infoframes(lt9611, connector, mode);
>   	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
>   	lt9611_hdmi_tx_phy(lt9611);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
