Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6959756FA60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 11:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiGKJQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 05:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbiGKJPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 05:15:14 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF746109E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=fEJBpRwk3k2E3zD9UZiHC1tC4h7mhdL6EpUzmbEV2+8=;
        b=u02u+fYFOA3G02gQMewoiqU38kPlPvj8YUoD8n6t3Oh6mO7h25GbugddsbmFjw8VVtDlQEISxciA0
         zNL3o9Q7z5omZH9n7RPxvdlv5kkZs9Bk/8KRdCUqNgaJ8DGicd4H2iKz++pAehPEMPfsB285+6DKIg
         fd+6IAy7KWjTCrwDpa9QJ3HSTCRaV7tZVSpt7e/eNrBCCeiUWUJ2wu0k+p8G/n2ihTvCbFYt/OQ1Wd
         1rd1uXKbNv5a9Zgen5onshrDwZ1i9/juf1zOEBGGwe4iMbYc8DjUgerzrI2HjV4MqvZXZwEWbYJOZS
         yHXOdefX7bTZm6K+q8WCTpoddmwLvkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=fEJBpRwk3k2E3zD9UZiHC1tC4h7mhdL6EpUzmbEV2+8=;
        b=k7w7t2ViXl/5hXMyH71zmHywqkuKkrOch5wU3+IwIlQUFD/f4e7o7YVXZ+RCAU0nV20ph6K0YWJTZ
         bIsKgcTBQ==
X-HalOne-Cookie: 16942583f6b7f7346b8d33f64030369eef09c474
X-HalOne-ID: 5e0cbc9a-00f9-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 5e0cbc9a-00f9-11ed-be7e-d0431ea8bb03;
        Mon, 11 Jul 2022 09:10:54 +0000 (UTC)
Date:   Mon, 11 Jul 2022 11:10:52 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [RFC PATCH v2 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
Message-ID: <YsvpHFeQpjQbQa4Q@ravnborg.org>
References: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
 <20220711073733.312266-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711073733.312266-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Mon, Jul 11, 2022 at 10:37:32AM +0300, Dmitry Baryshkov wrote:
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index d6dd4d99a229..b1b6ed3a8acc 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>  	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>  
> -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> +static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
>  {
> -	if (pdata->connector->display_info.bpc <= 6)
> +	if (connector->display_info.bpc <= 6)
>  		return 18;
>  	else
>  		return 24;
> @@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>  };
>  
> -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
>  {
>  	unsigned int bit_rate_khz, dp_rate_mhz;
>  	unsigned int i;
> @@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  
>  	/* Calculate minimum bit rate based on our pixel clock. */
> -	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
> +	bit_rate_khz = mode->clock * bpp;
>  
>  	/* Calculate minimum DP data rate, taking 80% as per DP spec */
>  	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
> @@ -1016,12 +1016,21 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	struct drm_connector *connector;
>  	const char *last_err_str = "No supported DP rate";
>  	unsigned int valid_rates;
>  	int dp_rate_idx;
>  	unsigned int val;
>  	int ret = -EINVAL;
>  	int max_dp_lanes;
> +	unsigned int bpp;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
> +							     bridge->encoder);
> +	if (!connector) {
> +		DRM_DEV_ERROR_RATELIMITED(pdata->dev, "Could not get the connector\n");

From the documentation of DRM_DEV_ERROR_RATELIMITED:
 * NOTE: this is deprecated in favor of drm_err_ratelimited() or
 * dev_err_ratelimited().

Can you fix this, so we do not introduce deprecated functions/macros.

	Sam


> +		return;
> +	}
>  
>  	max_dp_lanes = ti_sn_get_max_lanes(pdata);
>  	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> @@ -1047,8 +1056,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>  			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
>  
> +	bpp = ti_sn_bridge_get_bpp(connector);
>  	/* Set the DP output format (18 bpp or 24 bpp) */
> -	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> +	val = bpp == 18 ? BPP_18_RGB : 0;
>  	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
>  
>  	/* DP lane config */
> @@ -1059,7 +1069,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
>  
>  	/* Train until we run out of rates */
> -	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> +	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
>  	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>  	     dp_rate_idx++) {
>  		if (!(valid_rates & BIT(dp_rate_idx)))
> -- 
> 2.35.1
