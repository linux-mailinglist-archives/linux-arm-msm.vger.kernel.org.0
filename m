Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 692BA151374
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 00:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgBCXnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 18:43:06 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36277 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbgBCXnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 18:43:06 -0500
Received: by mail-pl1-f194.google.com with SMTP id a6so6474824plm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 15:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T0mU1oroPJ0HY0dNzcxXAcfNPatT+YGlRxX9kH7dcIM=;
        b=eOnQlBMZeFlZMZhMg5K5rXBW4GCRyvsE9wnChJZOKBLvUruSaKtCQrMI8SAP92lorM
         2Nk5VUOs4fjtWeV7bHpp5Nzqejkk2tR5i20g82K83aj6fc0qA68dU7gctigC+mekpeas
         dattNjYNvwKTsp5mKYr9D9zyM12iaahkJhpme1FfknvksKFoY0vNBraIwp5Ra4/xVRZo
         Q1AoSxdkQ7HlODEofCi8sRsrlFSiio9aF3rUHydH+Jotqob1nLedAzrOOEJaSehshlwg
         OZwHcRsJWdldrWoJA4yypQrYfzFWcqpLmaH2teaoF/fckIxOszU98/Ha+nWLVcBvARap
         jvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T0mU1oroPJ0HY0dNzcxXAcfNPatT+YGlRxX9kH7dcIM=;
        b=oOTharO43Rg+KsuU+aiy2GoVO+6AZTo2a+PMmMs6A6mEonx+HVCzg036TICDfVKklf
         rm2zJVqOnCbkXNorlYmecwc/KlogovIb4TIycc/ORcY3v/L6PLD6jPh3yOxTma08T6K9
         9deVvMyBRTSfACOICSa0c3/GESZQiW4LsU9jgn05JRZ2osbLhnHQ1tbWWFNT4LzQUV3t
         CD8a0llFF1kjb73+cR376zEfjVUSNuCJd5InxQv1oznffh+7PNhn5NbgiIrUBJrB8KTk
         XGS8+nSTNQH1PqCZL60ABaA7lRl0dJAgaRrT7ZoAgCKy2gA3mFC2X7Mw2BqomtczLpj+
         i72A==
X-Gm-Message-State: APjAAAU8Z2GN1SDZ3KbsfYkkRZKoITAItgOTtMzCPXJQjCQRxz+12sb3
        +Ks9cMg459CknDxdb0tzrUusAA==
X-Google-Smtp-Source: APXvYqzmKejF7h24aEIn3bKKAXldqS9ubKBjs2a9h5aypFZz0uySrK09eGtkxT0ayDJJRn2uphRKEA==
X-Received: by 2002:a17:902:7687:: with SMTP id m7mr25751409pll.136.1580773383601;
        Mon, 03 Feb 2020 15:43:03 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g21sm22460189pfb.126.2020.02.03.15.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 15:43:03 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:43:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
Message-ID: <20200203234300.GI311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>,
> Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, and
> Rob Clark <robdclark@chromium.org>.
> 
> Let's read the SUPPORTED_LINK_RATES and/or MAX_LINK_RATE (depending on
> the eDP version of the sink) to figure out what eDP rates are
> supported and pick the ideal one.
> 
> NOTE: I have only personally tested this code on eDP panels that are
> 1.3 or older.  Code reading SUPPORTED_LINK_RATES for DP 1.4+ was
> tested by hacking the code to pretend that a table was there.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> Changes in v3:
> - Init rate_valid table, don't rely on stack being 0 (oops).
> - Rename rate_times_200khz to rate_per_200khz.
> - Loop over the ti_sn_bridge_dp_rate_lut table, making code smaller.
> - Use 'true' instead of 1 for bools.
> - Added note to commit message noting DP 1.4+ isn't well tested.
> 
> Changes in v2:
> - Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 100 +++++++++++++++++++-------
>  1 file changed, 75 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index e1b817ccd9c7..a57c6108cb1f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -475,39 +475,85 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>  	return i;
>  }
>  
> -static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
> +static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> +					  bool rate_valid[])
>  {
> -	u8 data;
> +	unsigned int rate_per_200khz;
> +	unsigned int rate_mhz;
> +	u8 dpcd_val;
>  	int ret;
> +	int i, j;
> +
> +	ret = drm_dp_dpcd_readb(&pdata->aux, DP_EDP_DPCD_REV, &dpcd_val);
> +	if (ret != 1) {
> +		DRM_DEV_ERROR(pdata->dev,
> +			      "Can't read eDP rev (%d), assuming 1.1\n", ret);
> +		dpcd_val = DP_EDP_11;
> +	}
> +
> +	if (dpcd_val >= DP_EDP_14) {
> +		/* eDP 1.4 devices must provide a custom table */
> +		__le16 sink_rates[DP_MAX_SUPPORTED_RATES];
> +
> +		ret = drm_dp_dpcd_read(&pdata->aux, DP_SUPPORTED_LINK_RATES,
> +				       sink_rates, sizeof(sink_rates));
> +
> +		if (ret != sizeof(sink_rates)) {
> +			DRM_DEV_ERROR(pdata->dev,
> +				"Can't read supported rate table (%d)\n", ret);
> +
> +			/* By zeroing we'll fall back to DP_MAX_LINK_RATE. */
> +			memset(sink_rates, 0, sizeof(sink_rates));
> +		}
> +
> +		for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
> +			rate_per_200khz = le16_to_cpu(sink_rates[i]);
> +
> +			if (!rate_per_200khz)
> +				break;
> +
> +			rate_mhz = rate_per_200khz * 200 / 1000;
> +			for (j = 0;
> +			     j < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
> +			     j++) {
> +				if (ti_sn_bridge_dp_rate_lut[j] == rate_mhz)
> +					rate_valid[j] = true;
> +			}
> +		}
> +
> +		for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
> +			if (rate_valid[i])
> +				return;
> +		}
> +		DRM_DEV_ERROR(pdata->dev,
> +			      "No matching eDP rates in table; falling back\n");
> +	}
>  
> -	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
> +	/* On older versions best we can do is use DP_MAX_LINK_RATE */
> +	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &dpcd_val);
>  	if (ret != 1) {
>  		DRM_DEV_ERROR(pdata->dev,
>  			      "Can't read max rate (%d); assuming 5.4 GHz\n",
>  			      ret);
> -		return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
> +		dpcd_val = DP_LINK_BW_5_4;
>  	}
>  
> -	/*
> -	 * Return an index into ti_sn_bridge_dp_rate_lut.  Just hardcode
> -	 * these indicies since it's not like the register spec is ever going
> -	 * to change and a loop would just be more complicated.  Apparently
> -	 * the DP sink can only return these few rates as supported even
> -	 * though the bridge allows some rates in between.
> -	 */
> -	switch (data) {
> -	case DP_LINK_BW_1_62:
> -		return 1;
> -	case DP_LINK_BW_2_7:
> -		return 4;
> +	switch (dpcd_val) {
> +	default:
> +		DRM_DEV_ERROR(pdata->dev,
> +			      "Unexpected max rate (%#x); assuming 5.4 GHz\n",
> +			      (int)dpcd_val);
> +		/* fall through */
>  	case DP_LINK_BW_5_4:
> -		return 7;
> +		rate_valid[7] = 1;
> +		/* fall through */
> +	case DP_LINK_BW_2_7:
> +		rate_valid[4] = 1;
> +		/* fall through */
> +	case DP_LINK_BW_1_62:
> +		rate_valid[1] = 1;
> +		break;
>  	}
> -
> -	DRM_DEV_ERROR(pdata->dev,
> -		      "Unexpected max data rate (%#x); assuming 5.4 GHz\n",
> -		      (int)data);
> -	return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
>  }
>  
>  static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
> @@ -609,9 +655,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
>  	const char *last_err_str = "No supported DP rate";
>  	int dp_rate_idx;
> -	int max_dp_rate_idx;
>  	unsigned int val;
>  	int ret = -EINVAL;
>  
> @@ -655,11 +701,15 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
>  			   val);
>  
> +	ti_sn_bridge_read_valid_rates(pdata, rate_valid);
> +
>  	/* Train until we run out of rates */
> -	max_dp_rate_idx = ti_sn_bridge_get_max_dp_rate_idx(pdata);
>  	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> -	     dp_rate_idx <= max_dp_rate_idx;
> +	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>  	     dp_rate_idx++) {
> +		if (!rate_valid[dp_rate_idx])
> +			continue;
> +
>  		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
>  		if (!ret)
>  			break;
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
