Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D493231F27A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 23:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhBRWqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 17:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhBRWqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 17:46:23 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1668C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 14:45:42 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id s6so3431877otk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 14:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q8iqMVx6Dg74exXv38GXyFaVv7jsBPfbgKsDTdg0Ea0=;
        b=m64ezNhmQzoOpqlHl6GmRZUY3QWJKK6fjiZS77ie20BbqGiMHf0PRa7wu00aBiBXds
         /85WgVSoxforV6x9Y3tu7cJkpMNSHer/d2dZU0yhhde2RZPFUUpSe4S3KHNpo6edZVvY
         shbpdhe7pTQ8izs+CqWV6hu8SXMBlVc27Vrumiz5w0/IY/vHs/nDq877Pl7IFTJEuZoH
         xHgFR39pYGiUw3kZ9OLd20EO4J/Sycwc6yl/txchCAa+1e9tf8f6hIltYU9wZPxTA5LY
         HfKQAsxlkbbKvPYXpmef9Q5ko0Amy4mRckwX28c4VzSX7WRfdK9BvNqzXpe1alw//OQ+
         gcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q8iqMVx6Dg74exXv38GXyFaVv7jsBPfbgKsDTdg0Ea0=;
        b=Gt0oEuC90K2ZPH92BmgznGDYnhGlPtTmg/dFl6MN7PMB8PAhWeq63+cBUhcR2TESJv
         Z5JYzFj+tfJpq1DxNuKcD1Mb4BfSFUasLN7W2QrBA4cex0meaSQ5abuyQH7lPDIauA+A
         pXBN7OE9C55uzLpj3gNiEzx3mi2zvXa/Ly6Le/TXZdfupSlDT4XQqavNYufbJ3R5cBCO
         38CEvgFKMaELvopQTCgl5FyhBHWHg2SA9+mj32Jc5jym483VRKKV/LHvMav2noVYaVTO
         D5sfjSGmss/fD9pj/SrZA5YYrsGwcoJ5ODNjZ0ZEziID9S+oIjFVKgaD0USE9kZePzoy
         w+eA==
X-Gm-Message-State: AOAM530khUWpAPzqPZqMD19QMHtnXF5rdbkzQ5JKECnaanNXCOnMzmbZ
        XVKR2vq348xPL0yWLzkpwA3QRQ==
X-Google-Smtp-Source: ABdhPJzY/4W2jwoAlMKtsJ34nQ1f1e77HuZhCMBT8SuZtSCu8kW5k9jIy5Cs9QxoJapykP6wapXcsw==
X-Received: by 2002:a9d:705e:: with SMTP id x30mr4637067otj.168.1613688341938;
        Thu, 18 Feb 2021 14:45:41 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w10sm1324973ote.29.2021.02.18.14.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 14:45:41 -0800 (PST)
Date:   Thu, 18 Feb 2021 16:45:39 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified
 from dtsi
Message-ID: <YC7uE2L3TPPQhAfS@builder.lan>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 18 Feb 14:55 CST 2021, Kuogee Hsieh wrote:

> Allow supported link rate to be limited to the value specified at
> dtsi. If it is not specified, then link rate is derived from dpcd
> directly. Below are examples,
> link-rate = <162000> for max link rate limited at 1.62G
> link-rate = <270000> for max link rate limited at 2.7G
> link-rate = <540000> for max link rate limited at 5.4G
> link-rate = <810000> for max link rate limited at 8.1G
> 
> Changes in V2:
> -- allow supported max link rate specified from dtsi
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  7 ++++---
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
>  5 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..f633ba6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -322,6 +322,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>  	struct edid *edid;
>  
>  	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
> +	dp->panel->max_link_rate = dp->parser->max_link_rate;
>  
>  	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
>  	if (rc)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 9cc8166..be7f102 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -76,9 +76,10 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>  	if (link_info->num_lanes > dp_panel->max_dp_lanes)
>  		link_info->num_lanes = dp_panel->max_dp_lanes;
>  
> -	/* Limit support upto HBR2 until HBR3 support is added */
> -	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> -		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> +	/* Limit support of ink rate if specified */
> +	if (dp_panel->max_link_rate &&

Make the parser always initialize max_link_rate to something reasonable
and just compare against that here.

> +			(link_info->rate > dp_panel->max_link_rate))

No need for the (), nor for line breaking this.

> +		link_info->rate = dp_panel->max_link_rate;
>  
>  	DRM_DEBUG_DP("version: %d.%d\n", major, minor);
>  	DRM_DEBUG_DP("link_rate=%d\n", link_info->rate);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5b..1876f5e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -51,6 +51,7 @@ struct dp_panel {
>  	u32 vic;
>  	u32 max_pclk_khz;
>  	u32 max_dp_lanes;
> +	u32 max_link_rate;
>  
>  	u32 max_bw_code;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 0519dd3..d8b6898 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -87,6 +87,8 @@ static int dp_parser_misc(struct dp_parser *parser)
>  	struct device_node *of_node = parser->pdev->dev.of_node;
>  	int len = 0;
>  	const char *data_lane_property = "data-lanes";
> +	const char *link_rate_property = "link-rate";

There's no reason for stashing these in local variables.

> +	u32 rate = 0;
>  
>  	len = of_property_count_elems_of_size(of_node,
>  			 data_lane_property, sizeof(u32));
> @@ -97,6 +99,17 @@ static int dp_parser_misc(struct dp_parser *parser)
>  	}
>  
>  	parser->max_dp_lanes = len;
> +
> +	len = of_property_count_elems_of_size(of_node,
> +			 link_rate_property, sizeof(u32));

I'm afraid I don't see the reason for this, simply rely on the return
value of of_property_read_u32(), i.e.

	ret = of_property_read_u32(node, "link-rate", &rate);
	if (!ret)
		parser->max_link_rate = rate;

Or if you want to give it some default value:

	rate = 1234;
	of_property_read_u32(node, "link-rate", &rate);
	
Which either will overwrite the rate with the value of the property, or
leave it untouched.

Regards,
Bjorn

> +
> +	if (len == 1) {
> +		of_property_read_u32_index(of_node,
> +				link_rate_property, 0, &rate);
> +
> +		parser->max_link_rate = rate;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 34b4962..7046fce 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -116,6 +116,7 @@ struct dp_parser {
>  	struct dp_display_data disp_data;
>  	const struct dp_regulator_cfg *regulator_cfg;
>  	u32 max_dp_lanes;
> +	u32 max_link_rate;
>  
>  	int (*parse)(struct dp_parser *parser);
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
