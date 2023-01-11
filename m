Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428ED665972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 11:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237970AbjAKKxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 05:53:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238694AbjAKKxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 05:53:22 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A1413FB5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:53:19 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id ay12-20020a05600c1e0c00b003d9ea12bafcso8644369wmb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oEARfl1xpNXNnlyTzuct91oct8bbc7rpBw3zDPeOoQA=;
        b=fr+oKTwkGn/sYB8fxNCbuv0jR98SWOheR8T9aOaZS9h+6sFfB+yTWXghHJ12ZnhoaK
         zxnf83F1ZPBz8RuMS/6716iTVyZMvw21y6GQclD/VeoF0g1gn18n8ckXW0w11F3z7jo4
         06mZdoqmdkH+YtCIsCFrcAgcpSTsOXdZAdCSkHRpwbZ5GQoXMokkV0Dkb3lzAZl4gNKd
         lvMdhlSoF5FeAmLFBqhiMjh3N+3WDGKJC7ZCIcZ69iU2xXVGbguyIvAP9hDf0wVfR5K9
         JHkq5KiIXm3UznwFKtDMH+GEMkERte/nTCUIcgoU98ncXkWHlgMTfzn6ftSA9HIvHM5m
         KDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEARfl1xpNXNnlyTzuct91oct8bbc7rpBw3zDPeOoQA=;
        b=AKyIL+mX+o5Ke1LRJYdQmJIYe3ZQlLU751hPyAthT9LCZ09kaywBnR43t8g1Yxe/3k
         CM+9vJAwzvmP99I8d+bYs6d+v65emVmkzqVvjpx9QhRQorCkca6J2QQE8/3RHhFhxmUp
         HrTnHTdbeVBNK3dm1rJIfD27THDjUPLBCBHLvETKWKpx/K5utoNnEdwgcedeD44xYLyJ
         BQvlRbvXL7i4cjfFSHvjLYtAAR9Lkng9NYZVjprHDsG2B54Ml9rRXz6fHkOR5dxMKYHt
         d1Lxf/T2kwYFOTnq2lmPDd+LydxiUjeGl1qVs2KGgjfziN5KO9qdDT6Lb/YNCglNEbKc
         FeIg==
X-Gm-Message-State: AFqh2kqzUIYJAhji7up4XmFSnN0DLUrETD3RA73xDBBLRhCJY3YGftAG
        VuTuaIPykh9ylzAzRvhA0Rwq/w==
X-Google-Smtp-Source: AMrXdXsCHUURC2DANH/T4dg723n3fwwzRwXdK9ISjRMbm+tjETBLbExCTH+sN9qCq9+w8hSyS7JLkw==
X-Received: by 2002:a05:600c:2844:b0:3da:4e:8dfe with SMTP id r4-20020a05600c284400b003da004e8dfemr2809580wmb.38.1673434397580;
        Wed, 11 Jan 2023 02:53:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5? ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
        by smtp.gmail.com with ESMTPSA id p15-20020a1c544f000000b003b4fe03c881sm22093781wmi.48.2023.01.11.02.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 02:53:17 -0800 (PST)
Message-ID: <6f234a3d-5a59-ea47-225d-9360213427cd@linaro.org>
Date:   Wed, 11 Jan 2023 11:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 07/13] drm/bridge: lt9611: rework the mode_set function
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
 <20230108165656.136871-8-dmitry.baryshkov@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-8-dmitry.baryshkov@linaro.org>
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
> The mode_set callback is deprectated for drm_bridges in favour of using
> atomic_enable callback. Move corresponding code into the function
> lt9611_bridge_atomic_enable() and turn lt9611_bridge_pre_enable() into
> the proper atomic_pre_enable callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 61 +++++++++++++++----------
>   1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 3b77238ca4af..1b65a573be27 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -713,6 +713,39 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
>   			    struct drm_bridge_state *old_bridge_state)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *mode;
> +	struct hdmi_avi_infoframe avi_frame;
> +	unsigned int postdiv;
> +	int ret;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
> +	mode = &crtc_state->adjusted_mode;
> +
> +	lt9611_mipi_input_digital(lt9611, mode);
> +	lt9611_pll_setup(lt9611, mode, &postdiv);
> +	lt9611_mipi_video_setup(lt9611, mode);
> +	lt9611_pcr_setup(lt9611, mode, postdiv);
> +
> +	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
> +						       connector,
> +						       mode);
> +	if (!ret)
> +		lt9611->vic = avi_frame.video_code;
>   
>   	if (lt9611_power_on(lt9611)) {
>   		dev_err(lt9611->dev, "power on failed\n");
> @@ -856,7 +889,8 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>   		return MODE_OK;
>   }
>   
> -static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> +static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *old_bridge_state)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   	static const struct reg_sequence reg_cfg[] = {
> @@ -884,29 +918,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	lt9611_sleep_setup(lt9611);
>   }
>   
> -static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
> -				   const struct drm_display_mode *mode,
> -				   const struct drm_display_mode *adj_mode)
> -{
> -	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> -	struct hdmi_avi_infoframe avi_frame;
> -	unsigned int postdiv;
> -	int ret;
> -
> -	lt9611_bridge_pre_enable(bridge);
> -
> -	lt9611_mipi_input_digital(lt9611, mode);
> -	lt9611_pll_setup(lt9611, mode, &postdiv);
> -	lt9611_mipi_video_setup(lt9611, mode);
> -	lt9611_pcr_setup(lt9611, mode, postdiv);
> -
> -	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
> -						       &lt9611->connector,
> -						       mode);
> -	if (!ret)
> -		lt9611->vic = avi_frame.video_code;
> -}
> -
>   static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
>   {
>   	return __lt9611_detect(bridge_to_lt9611(bridge));
> @@ -957,11 +968,11 @@ lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>   static const struct drm_bridge_funcs lt9611_bridge_funcs = {
>   	.attach = lt9611_bridge_attach,
>   	.mode_valid = lt9611_bridge_mode_valid,
> -	.mode_set = lt9611_bridge_mode_set,
>   	.detect = lt9611_bridge_detect,
>   	.get_edid = lt9611_bridge_get_edid,
>   	.hpd_enable = lt9611_bridge_hpd_enable,
>   
> +	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
>   	.atomic_enable = lt9611_bridge_atomic_enable,
>   	.atomic_disable = lt9611_bridge_atomic_disable,
>   	.atomic_post_disable = lt9611_bridge_atomic_post_disable,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
