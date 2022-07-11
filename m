Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FEA56FC0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 11:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbiGKJiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 05:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbiGKJh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 05:37:29 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C181083F2B
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:19:35 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m16so5440896ljh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=32wASOhF7C0nSith5ux7plZj1n7jiCkz2vIC8UPSsGI=;
        b=kGb++c0k9t18KPosCgLz2wI+HsehDa9nmlxjSunaQfx5zIfNdwx/g9+idyYm2kT5Iq
         qs02IRmY7MenQnLnofnNl4RdgvwyPuLQH25P63l73y6rQLjwbNSG9KIiJg2y5CBcWvGM
         B1JpJrV2N6USaG+bXDQKcaUdpTumv4J2N3OPvQsPWdNiNbSldo9k3Xbs7YtVRfCeMYER
         sDAl/DsWmPQ4oCUwU5lmimzROtMJ5F0X06OaqO1DXr1HUlcM/+7vFpaJCo4SsXAXTq/2
         K8UdGx+hWs+Up8H+FhUQTwqP8JyF/Ov4maWK68cRnmD7sh5hV83x74dCv2CAGYMr/H2h
         WWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=32wASOhF7C0nSith5ux7plZj1n7jiCkz2vIC8UPSsGI=;
        b=kFaPaue5/HEI70u7sbbcnfZqDkmZLETuyCMkVlBBOPWQ/CPwKTulBn+DsVIZLKeSD5
         g2JVTxxtuUmqObnuw7Bbe6uZnRsPeilXukLy6sp/jKNGfTLJcWuYPzGu9nQfelCKM3YQ
         OM+m2AHMwRlVNAcVkWQcXigahwho/F/eSOQ/0ENw7bfbdUJEqFoWKXSOLcTMZAG7Ib34
         5VynRvrf8laBb1jRkEzP6WF4mdNKQMorEXayKfF0/iKpv0gYRBhKwRd3xu9JsS0pypn/
         PaaA5tXCpPZVq/kJAVm6OGiuezKcOgCZH2eYwkbypViaOi6CODI9K9zhNwnHmy1KiHVd
         o7cw==
X-Gm-Message-State: AJIora+6WFnEmgwW7QSQip28Bd+Ouq5dSXJ7lICrEToIWYDXFrjYsJim
        Q9SQUycjs+MemkDO8CYx4Okoow==
X-Google-Smtp-Source: AGRyM1u2PVbzAbxiCDUAUEczN1Bdj4jPNYqAkq2JHMrIhHlnDhZgMOzPhRVpp5a0yiXOznFrI07DAQ==
X-Received: by 2002:a2e:9dcf:0:b0:25d:4759:7c00 with SMTP id x15-20020a2e9dcf000000b0025d47597c00mr9054832ljj.268.1657531174001;
        Mon, 11 Jul 2022 02:19:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q24-20020a194318000000b0048928d4317esm1423757lfa.283.2022.07.11.02.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 02:19:33 -0700 (PDT)
Message-ID: <c7254a5d-bbca-8280-1570-3f1fa375a8a3@linaro.org>
Date:   Mon, 11 Jul 2022 12:19:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v2 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
Content-Language: en-GB
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
 <20220711073733.312266-2-dmitry.baryshkov@linaro.org>
 <YsvpHFeQpjQbQa4Q@ravnborg.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YsvpHFeQpjQbQa4Q@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2022 12:10, Sam Ravnborg wrote:
> Hi Dmitry,
> 
> On Mon, Jul 11, 2022 at 10:37:32AM +0300, Dmitry Baryshkov wrote:
>> Rather than reading the pdata->connector directly, fetch the connector
>> using drm_atomic_state. This allows us to make pdata->connector optional
>> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>>
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>>   1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index d6dd4d99a229..b1b6ed3a8acc 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>>   	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>>   }
>>   
>> -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
>> +static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
>>   {
>> -	if (pdata->connector->display_info.bpc <= 6)
>> +	if (connector->display_info.bpc <= 6)
>>   		return 18;
>>   	else
>>   		return 24;
>> @@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>>   	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>>   };
>>   
>> -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
>> +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
>>   {
>>   	unsigned int bit_rate_khz, dp_rate_mhz;
>>   	unsigned int i;
>> @@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
>>   		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>>   
>>   	/* Calculate minimum bit rate based on our pixel clock. */
>> -	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
>> +	bit_rate_khz = mode->clock * bpp;
>>   
>>   	/* Calculate minimum DP data rate, taking 80% as per DP spec */
>>   	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
>> @@ -1016,12 +1016,21 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>>   				       struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>> +	struct drm_connector *connector;
>>   	const char *last_err_str = "No supported DP rate";
>>   	unsigned int valid_rates;
>>   	int dp_rate_idx;
>>   	unsigned int val;
>>   	int ret = -EINVAL;
>>   	int max_dp_lanes;
>> +	unsigned int bpp;
>> +
>> +	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
>> +							     bridge->encoder);
>> +	if (!connector) {
>> +		DRM_DEV_ERROR_RATELIMITED(pdata->dev, "Could not get the connector\n");
> 
>  From the documentation of DRM_DEV_ERROR_RATELIMITED:
>   * NOTE: this is deprecated in favor of drm_err_ratelimited() or
>   * dev_err_ratelimited().
> 
> Can you fix this, so we do not introduce deprecated functions/macros.

Ack. I hesitated between the DRM_DEV and dev_ functions, but decided to 
use the family that was used by the rest of the driver. Will change this 
call to the dev_err in v3.

> 
> 	Sam
> 
> 
>> +		return;
>> +	}
>>   
>>   	max_dp_lanes = ti_sn_get_max_lanes(pdata);
>>   	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
>> @@ -1047,8 +1056,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>>   	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>>   			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
>>   
>> +	bpp = ti_sn_bridge_get_bpp(connector);
>>   	/* Set the DP output format (18 bpp or 24 bpp) */
>> -	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
>> +	val = bpp == 18 ? BPP_18_RGB : 0;
>>   	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
>>   
>>   	/* DP lane config */
>> @@ -1059,7 +1069,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>>   	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
>>   
>>   	/* Train until we run out of rates */
>> -	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
>> +	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
>>   	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>>   	     dp_rate_idx++) {
>>   		if (!(valid_rates & BIT(dp_rate_idx)))
>> -- 
>> 2.35.1


-- 
With best wishes
Dmitry
