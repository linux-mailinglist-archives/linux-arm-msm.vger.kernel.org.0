Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAD062F32C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 12:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbiKRLEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 06:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235183AbiKRLEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 06:04:43 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A256897A80
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 03:04:38 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p8so7623499lfu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 03:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDEupHU/FfDgOX1nmPiIZTZXZdNDm1UWPNtQrISlq08=;
        b=ZNmEafXaDxjVFiMpEPdZ5q5cXg+fC/mP8GF5ZPyYLIwd0A53SM0H0bjshoYBTPaank
         dUNBEwp8Id949nebnNUr0DbThGzZ0tkdY9BK3nHraTZCIyY0fjk6OfJ4Llu1eGL3zHaA
         sMS3zDi2oiiBx5ZbXXGj+rfvTPvZfHR8yIjCGK8mqpr09lqSi5OO3PHiTQSJsJksnX4h
         nYnQ9dA751ggdDbmKPvPyMXnW9+92ls3t7/b9uFOOzwGPuKOD/ll1H3Sd6+70iAV8npI
         1H5MhhJqi7Kr1ox19+s/juRF2CGQN4bdzUuopIFrAvxw08QMtNTxP6gqtiH52KIt98AX
         nKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDEupHU/FfDgOX1nmPiIZTZXZdNDm1UWPNtQrISlq08=;
        b=LiWy04Df7oY6A1kYnusD7R6cxT8KpTz2YbBjwLmMbIViocUo5rNGec5t21lNJ3RNwb
         X98/G5rNPvM6jNa3uOBK1VPQWMK2dBv6Q7TAwtkvcusbybmxTzvLpNf2JVXDOU6y4Trr
         4msxCiXJ11JSFamqJIKkWY++W1iiSZ82xoCKbPV373tq4D83UX2Ln8zKh6k+8Jdv0GVy
         83u8k1wWtp9qIAlSzWpE+BRUa8GbE3yfOtDnsm8o9ShkFCcdfTbqKVvJxD3p68LC54fc
         QATfDlP4B54zCdkXgFLp633sDdPBKd2xsXSTIFbqbg+0+iXewiRNl9O/Dpgix2dVlkpS
         rRyw==
X-Gm-Message-State: ANoB5pmDsseOCJ2wTyEWP1bn4WRcYgKW5RUVdAtTgky23Fe/2L8lsXeP
        vREuHGv7EUu/NkI1rq8a+TUXEg==
X-Google-Smtp-Source: AA0mqf7bRYo2Qgq/1w+U6fwg6mnbudNUl71DiT4VQnAyfq9JqXUuFw794wboTIk1dYvkitwKzP0QaA==
X-Received: by 2002:a05:6512:74d:b0:494:7551:b764 with SMTP id c13-20020a056512074d00b004947551b764mr2287605lfs.574.1668769476798;
        Fri, 18 Nov 2022 03:04:36 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k8-20020a05651210c800b0048a982ad0a8sm619364lfg.23.2022.11.18.03.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 03:04:36 -0800 (PST)
Message-ID: <8d75f389-9698-891f-5eff-2b76ddecad2b@linaro.org>
Date:   Fri, 18 Nov 2022 13:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/2] drm/msm/dp: add support of max dp link rate
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1668725369-6331-1-git-send-email-quic_khsieh@quicinc.com>
 <1668725369-6331-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668725369-6331-3-git-send-email-quic_khsieh@quicinc.com>
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

On 18/11/2022 01:49, Kuogee Hsieh wrote:
> dp_out endpoint contains both data-lanes and link-frequencies properties.
> This patch parser dp_out endpoint properties and acquire dp_max_lanes and
> dp_max_link_rate from respective property. Finally, comparing them against
> both data lane and link rate read back from sink to ensure both data lane
> and link rate are supported by platform.
> In the case there is no data-lanes or link-frequencies property defined at
> dp_out endpoint, the default value are 4 data lanes with 5.4 Ghz link rate.
> 
> Changes in v2:
> -- add max link rate from dtsi
> 
> Changes in v3:
> -- parser max_data_lanes and max_dp_link_rate from dp_out endpoint
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi |  1 +

Should not be a part of this patch.

>   drivers/gpu/drm/msm/dp/dp_display.c  |  4 ++++
>   drivers/gpu/drm/msm/dp/dp_panel.c    |  7 ++++---
>   drivers/gpu/drm/msm/dp/dp_panel.h    |  1 +
>   drivers/gpu/drm/msm/dp/dp_parser.c   | 30 ++++++++++++++++++++++--------
>   drivers/gpu/drm/msm/dp/dp_parser.h   |  2 ++
>   6 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 4afe53b..d456e76 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3897,6 +3897,7 @@
>   						reg = <0>;
>   						dp_in: endpoint {
>   							remote-endpoint = <&dpu_intf0_out>;
> +							data-lanes = <0 1 2 3>;
>   						};
>   					};
>   				};
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 29c9845..4fe2092 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -390,6 +390,10 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   	struct edid *edid;
>   
>   	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
> +	dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
> +
> +	drm_dbg_dp(dp->drm_dev, "max_lanes=%d max_link_rate=%d\n",
> +		dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
>   
>   	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
>   	if (rc)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 5149ceb..933fa9c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -75,12 +75,13 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	link_info->rate = drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
>   	link_info->num_lanes = dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
>   
> +	/* Limit data lanes from data-lanes of endpoint properity of dtsi */
>   	if (link_info->num_lanes > dp_panel->max_dp_lanes)
>   		link_info->num_lanes = dp_panel->max_dp_lanes;
>   
> -	/* Limit support upto HBR2 until HBR3 support is added */
> -	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> -		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> +	/* Limit link rate from link-frequencies of endpoint properity of dtsi */
> +	if (link_info->rate > dp_panel->max_dp_link_rate)
> +		link_info->rate = dp_panel->max_dp_link_rate;
>   
>   	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>   	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index d861197a..f04d021 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -50,6 +50,7 @@ struct dp_panel {
>   
>   	u32 vic;
>   	u32 max_dp_lanes;
> +	u32 max_dp_link_rate;
>   
>   	u32 max_bw_code;
>   };
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index dd73221..667981e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -94,16 +94,30 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
> -	int len;
> -
> -	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> -	if (len < 0) {
> -		DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
> -			 DP_MAX_NUM_DP_LANES);
> -		len = DP_MAX_NUM_DP_LANES;
> +	struct device_node *endpoint;
> +	int cnt;
> +	u32 frequence = 0;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0);
> +
> +	if (endpoint) {
> +		cnt = of_property_count_u32_elems(endpoint, "data-lanes");
> +		if (cnt < 0)
> +			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +		else
> +			parser->max_dp_lanes = cnt;

This should be a separate patch. And now what, 
drm_of_get_data_lanes_count() can be used here too. Why are you dropping 
the generic function for the sake of your custom implementatoin.

> +
> +		cnt = of_property_count_u32_elems(endpoint, "link-frequencies");
> +		if (cnt < 0) {
> +			parser->max_dp_link_rate = DP_LINK_FREQUENCY_HBR2; /* 54000 khz */
> +		} else {
> +			of_property_read_u32_array(endpoint, "link-frequencies", &frequence, 1);

link-frequencies is u64 array.

> +			parser->max_dp_link_rate = frequence;
> +		}
>   	}
>   
> -	parser->max_dp_lanes = len;
> +	pr_err("%s: kuogee, lane=%d frequency=%d\n", __func__, parser->max_dp_lanes, parser->max_dp_link_rate);
> +

Leftover?

>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 866c1a8..76ddb751 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -15,6 +15,7 @@
>   #define DP_LABEL "MDSS DP DISPLAY"
>   #define DP_MAX_PIXEL_CLK_KHZ	675000
>   #define DP_MAX_NUM_DP_LANES	4
> +#define DP_LINK_FREQUENCY_HBR2	540000
>   
>   enum dp_pm_type {
>   	DP_CORE_PM,
> @@ -119,6 +120,7 @@ struct dp_parser {
>   	struct dp_io io;
>   	struct dp_display_data disp_data;
>   	u32 max_dp_lanes;
> +	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
>   
>   	int (*parse)(struct dp_parser *parser);

-- 
With best wishes
Dmitry

