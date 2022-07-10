Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2788256D1AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 23:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiGJVaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 17:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiGJVah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 17:30:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E778E12625
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 14:29:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFF9B4F7;
        Sun, 10 Jul 2022 23:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657488552;
        bh=ZNRmaHC5alSI5DfkA+wNlu4+XmdJG4Qv4Rbv1EPifLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qnkz7vqaHVpWVecV2jK0ScAKxdqfJGY4bqYaMrnsG49RQXDcmPEBp9hmAga79vMIq
         2yV2kU/t+2GLKZ5xkFWKak5gQIrm7lRX9Q9+TjMBJnkd/IhPUOV+LC4QeONOZRnij0
         A1a/T9YSEjIzkSZH8PAu3smjaWVNpk4w45M+hCzU=
Date:   Mon, 11 Jul 2022 00:28:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
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
Subject: Re: [RFC PATCH 2/3] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
Message-ID: <YstEjNY5hY52E4Gm@pendragon.ideasonboard.com>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thank you for the patch.

On Sun, Jul 10, 2022 at 09:45:35PM +0300, Dmitry Baryshkov wrote:
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 01171547f638..df08207d6223 100644
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
> @@ -1016,12 +1016,19 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
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
> +	if (!connector)

As Sam mentioned, a dev_err() would be good here if you think this can
happen. If there's no risk that connector will be null, you could drop
the check.

> +		return;
>  
>  	max_dp_lanes = ti_sn_get_max_lanes(pdata);
>  	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> @@ -1047,8 +1054,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>  			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
>  
> +	bpp = ti_sn_bridge_get_bpp(connector);
>  	/* Set the DP output format (18 bpp or 24 bpp) */
> -	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> +	val = (bpp == 18) ? BPP_18_RGB : 0;

You can drop the parentheses.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
>  
>  	/* DP lane config */
> @@ -1059,7 +1067,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
>  
>  	/* Train until we run out of rates */
> -	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> +	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
>  	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>  	     dp_rate_idx++) {
>  		if (!(valid_rates & BIT(dp_rate_idx)))

-- 
Regards,

Laurent Pinchart
