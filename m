Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDF9570D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 00:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiGKWKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 18:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiGKWKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 18:10:09 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C5213EA7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 15:10:07 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id o133so8338686oig.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=V4mk1W3OniljS8YPM11si/jZlWMggyziuS1oj31jQVM=;
        b=FQHRTU7ZvcqILN4Ud1+1ls+ML6DsKpf6hZvdi1PXkWJxoOm8WI58KO8JpBFOntcWco
         KLkuGGR19dZS2kAOzW8KECrJln5Ib/RMK4b+IS4VKtpM3oOHodOKTrFj/OFnFSRX36cv
         utAZO5uiRv/VMsJIRRr14CiAOUVBGa/lwUIJtXezQGrJsKeTy7Nc+wjc5ljEWPbBhtWj
         dng3N9KslipjBaJZi0jZzETTaa+dDsfiBguuFno6paGnM6Lm42CWxuJupiHzYShn8j7b
         uQ9LPFgCT6yLC3gtZCNHnhwHfCGvC2T4+bl1YjTnZ78KdKayAL2/JWVWk3jgzttIIrv+
         Fr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V4mk1W3OniljS8YPM11si/jZlWMggyziuS1oj31jQVM=;
        b=umFRKqien+S+IdcURrT6it2vfo9hLHLyP2E9GmjVBtTbfb4AdJs8kEfE/ukzZLoKl8
         I13ZnvoGVoocZAO4u9oo/vRJ6j82sE7MabLcuBrPK44MLDYeXIWxjeGmn7YPcP6XU0zr
         bOZbLTWVtMny++m2MDdHvqI3fRiW2btP3kKSRDf0QhrQwlKY+E1HrxBaM19QYYwVp55A
         flu/crpr+s4VjJdupT6jFyBw8C54J5l01zNOxWSEx5PkzZefx02Jnt0hNNIwsF85erEU
         riVeAmObK1nyyBvfVXKoMeKpPwT2PSb373mCcAMRlaUAP9fn/mRQbpf+VrsICmdZK04W
         Wxdw==
X-Gm-Message-State: AJIora8y4fXiixqC8FMZNUFkCKTh+ccesDqRhLmY+mp1/N4QGUR81SVm
        +HxYXJY1Jyf+pHAzbVW9xxF4xg==
X-Google-Smtp-Source: AGRyM1t140/a/OrsmWjfzbQXpBvjuOvtdzQsGzuy57X3fj66JnFKdgeE/F13jZWfyePITILiTg0Umw==
X-Received: by 2002:a05:6808:f89:b0:339:ce78:1ad8 with SMTP id o9-20020a0568080f8900b00339ce781ad8mr315866oiw.207.1657577406972;
        Mon, 11 Jul 2022 15:10:06 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id h4-20020a056870170400b000f5ccbb7d75sm3848978oae.1.2022.07.11.15.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 15:10:06 -0700 (PDT)
Message-ID: <958cb551-52da-615d-64e3-cf0c2da61789@kali.org>
Date:   Mon, 11 Jul 2022 17:10:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/11/22 4:21 AM, Dmitry Baryshkov wrote:
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index d6dd4d99a229..b362a7bf4d97 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>   	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>   }
>   
> -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> +static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
>   {
> -	if (pdata->connector->display_info.bpc <= 6)
> +	if (connector->display_info.bpc <= 6)
>   		return 18;
>   	else
>   		return 24;
> @@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>   	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>   };
>   
> -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
>   {
>   	unsigned int bit_rate_khz, dp_rate_mhz;
>   	unsigned int i;
> @@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
>   		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>   
>   	/* Calculate minimum bit rate based on our pixel clock. */
> -	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
> +	bit_rate_khz = mode->clock * bpp;
>   
>   	/* Calculate minimum DP data rate, taking 80% as per DP spec */
>   	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
> @@ -1016,12 +1016,21 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>   				       struct drm_bridge_state *old_bridge_state)
>   {
>   	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	struct drm_connector *connector;
>   	const char *last_err_str = "No supported DP rate";
>   	unsigned int valid_rates;
>   	int dp_rate_idx;
>   	unsigned int val;
>   	int ret = -EINVAL;
>   	int max_dp_lanes;
> +	unsigned int bpp;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
> +							     bridge->encoder);
> +	if (!connector) {
> +		dev_err_ratelimited(pdata->dev, "Could not get the connector\n");
> +		return;
> +	}
>   
>   	max_dp_lanes = ti_sn_get_max_lanes(pdata);
>   	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> @@ -1047,8 +1056,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>   	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>   			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
>   
> +	bpp = ti_sn_bridge_get_bpp(connector);
>   	/* Set the DP output format (18 bpp or 24 bpp) */
> -	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> +	val = bpp == 18 ? BPP_18_RGB : 0;
>   	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
>   
>   	/* DP lane config */
> @@ -1059,7 +1069,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>   	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
>   
>   	/* Train until we run out of rates */
> -	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> +	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
>   	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>   	     dp_rate_idx++) {
>   		if (!(valid_rates & BIT(dp_rate_idx)))

Tested on the Lenovo Yoga C630.  bpc is found to be 6, which I believe 
is correct.

Tested-by: Steev Klimaszewski <steev@kali.org>

