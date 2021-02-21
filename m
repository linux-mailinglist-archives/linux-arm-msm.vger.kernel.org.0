Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7397B320D0E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Feb 2021 20:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhBUTJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Feb 2021 14:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhBUTJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Feb 2021 14:09:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BA5C061574;
        Sun, 21 Feb 2021 11:08:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCF1EEF;
        Sun, 21 Feb 2021 20:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613934518;
        bh=3XmyzxGwzCd8W8K+XsKRw4jMy6r2jo1Zwca1NaO6OoI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rU/0UczNJb8ek+bqoP2wG/+erPunX3E0WsJAn/5u5zh4kO0nbOrlVzxBeb86MQ9nq
         2HWsnutcV1vvxluEATl5D3BLotKGqrxdDEDslPvR3hy8lFtyd+61M4zJeoqE8YCewe
         WUUvD/doI5P3nO9nSZnuSGW4unEacqXPxtDNrunw=
Date:   Sun, 21 Feb 2021 21:08:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
Message-ID: <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Nicolas,

Thank you for the patch.

On Thu, Feb 11, 2021 at 11:33:55AM +0800, Nicolas Boichat wrote:
> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

This looks good to me, it increases readability.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please however see the end of the mail for a comment.

> ---
> I considered adding _DISABLE_ instead, but that'd make the
> flag names a big too long.
> 
> Generated with:
> flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> (then minor format changes)

Ever tried coccinelle ? :-)

>  drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
>  drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
>  drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
>  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                   | 2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
>  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
>  drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
>  drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
>  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
>  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
>  drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
>  include/drm/drm_mipi_dsi.h                           | 8 ++++----
>  25 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index aa19d5a40e31..59d718bde8c4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -165,7 +165,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
>  	dsi->lanes = adv->num_dsi_lanes;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -			  MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
> +			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0) {
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc05982f82..beecfe6bf359 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1334,7 +1334,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
>  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> -		MIPI_DSI_MODE_EOT_PACKET	|
> +		MIPI_DSI_MODE_NO_EOT_PACKET	|
>  		MIPI_DSI_MODE_VIDEO_HSE;
>  
>  	if (mipi_dsi_attach(dsi) < 0) {
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 76373e31df92..34aa24269a57 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -829,7 +829,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  	tmp = DIV_ROUND_UP(dsi_cfg.htotal, nlanes) -
>  	      DIV_ROUND_UP(dsi_cfg.hsa, nlanes);
>  
> -	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		tmp -= DIV_ROUND_UP(DSI_EOT_PKT_SIZE, nlanes);
>  
>  	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
> @@ -902,7 +902,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  	tmp = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
>  	tmp &= ~(IF_VID_SELECT_MASK | HOST_EOT_GEN | IF_VID_MODE);
>  
> -	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		tmp |= HOST_EOT_GEN;
>  
>  	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 8ed8302d6bbb..320f95ae6077 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -825,7 +825,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>  		val |= TC358768_DSI_CONTROL_HSCKMD;
>  
> -	if (dsi_dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>  		val |= TC358768_DSI_CONTROL_EOTDIS;
>  
>  	tc358768_write(priv, TC358768_DSI_CONFW, val);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 83ab6b343f51..99249d0da330 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -809,15 +809,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>  			reg |= DSIM_AUTO_MODE;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
>  			reg |= DSIM_HSE_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HFP))
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
>  			reg |= DSIM_HFP_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HBP))
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
>  			reg |= DSIM_HBP_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSA))
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
>  			reg |= DSIM_HSA_MODE;
>  	}
>  
> -	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		reg |= DSIM_EOT_DISABLE;
>  
>  	switch (dsi->format) {
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 2314c8122992..f4cdc3cfd7d0 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
>  		DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
>  		DSI_MCTL_MAIN_DATA_CTL_READ_EN |
>  		DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> -	if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +	if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>  		val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>  	writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index a1ff152ef468..5c0c9180273a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -402,7 +402,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>  	}
>  
>  	tmp_reg |= (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) << 6;
> -	tmp_reg |= (dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET) >> 3;
> +	tmp_reg |= (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET) >> 3;
>  
>  	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ab281cba0f08..a97a7822e596 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -850,11 +850,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  	if (flags & MIPI_DSI_MODE_VIDEO) {
>  		if (flags & MIPI_DSI_MODE_VIDEO_HSE)
>  			data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
> -		if (flags & MIPI_DSI_MODE_VIDEO_HFP)
> +		if (flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
>  			data |= DSI_VID_CFG0_HFP_POWER_STOP;
> -		if (flags & MIPI_DSI_MODE_VIDEO_HBP)
> +		if (flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
>  			data |= DSI_VID_CFG0_HBP_POWER_STOP;
> -		if (flags & MIPI_DSI_MODE_VIDEO_HSA)
> +		if (flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
>  			data |= DSI_VID_CFG0_HSA_POWER_STOP;
>  		/* Always set low power stop mode for BLLP
>  		 * to let command engine send packets
> @@ -909,7 +909,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  			  DSI_T_CLK_PRE_EXTEND_INC_BY_2_BYTECLK);
>  
>  	data = 0;
> -	if (!(flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		data |= DSI_EOT_PACKET_CTRL_TX_EOT_APPEND;
>  	dsi_write(msm_host, REG_DSI_EOT_PACKET_CTRL, data);
>  
> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> index e95bc9f60b3f..44674ebedf59 100644
> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> @@ -302,7 +302,7 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_EOT_PACKET |
> +			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
>  			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
>  
>  	drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index af381d756ac1..178abfb1737c 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -571,7 +571,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 2;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -			  MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_NO_EOT_PACKET;
>  	dsi->hs_rate = ddata->panel_data->max_hs_rate;
>  	dsi->lp_rate = ddata->panel_data->max_lp_rate;
>  
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index bc36aa3c1123..ae3361ccccd5 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -265,7 +265,7 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 1;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> index 8f6ac1a40c31..a3ec4cbdbf7a 100644
> --- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
> +++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> @@ -809,7 +809,7 @@ static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	khadas_ts050 = devm_kzalloc(&dsi->dev, sizeof(*khadas_ts050),
>  				    GFP_KERNEL);
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index ed0d5f959037..a5a414920430 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -593,7 +593,7 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> index 3c00e4f8f803..21e48923836d 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> @@ -442,7 +442,7 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &ltk500hd1829_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index b9a0e56f33e2..9d9334656803 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>  	dsi->hs_rate = 349440000;
>  	dsi->lp_rate = 9600000;
>  	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -		MIPI_DSI_MODE_EOT_PACKET;
> +		MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	/*
>  	 * Every new incarnation of this display must have a unique
> diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> index 45b975dee587..198493a6eb6a 100644
> --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> +++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> @@ -184,7 +184,7 @@ static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>  			  MIPI_DSI_MODE_VIDEO_BURST |
>  			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -			  MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	osd101t2587 = devm_kzalloc(&dsi->dev, sizeof(*osd101t2587), GFP_KERNEL);
>  	if (!osd101t2587)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 4aac0d1573dd..b04b9975e9b2 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>  	 */
>  	dsi->mode_flags =
>  		MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -		MIPI_DSI_MODE_EOT_PACKET;
> +		MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	s6->supply = devm_regulator_get(dev, "vdd1");
>  	if (IS_ERR(s6->supply))
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> index b962c817fb30..ccc8ed6fe3ae 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> @@ -446,7 +446,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
>  
>  	dsi->lanes = 1;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_EOT_PACKET;
> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	ctx->supplies[0].supply = "vdd3";
>  	ctx->supplies[1].supply = "vci";
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> index eec74c10ddda..77289967d3e5 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
>  	dsi->hs_rate = 349440000;
>  	dsi->lp_rate = 9600000;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> -		MIPI_DSI_MODE_EOT_PACKET |
> +		MIPI_DSI_MODE_NO_EOT_PACKET |
>  		MIPI_DSI_MODE_VIDEO_BURST;
>  
>  	ret = s6e63m0_probe(dev, s6e63m0_dsi_dcs_read, s6e63m0_dsi_dcs_write,
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> index 527371120266..9b3599d6d2de 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> @@ -990,8 +990,8 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
> -		| MIPI_DSI_MODE_VIDEO_HFP | MIPI_DSI_MODE_VIDEO_HBP
> -		| MIPI_DSI_MODE_VIDEO_HSA | MIPI_DSI_MODE_EOT_PACKET
> +		| MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
> +		| MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET
>  		| MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
>  
>  	ret = s6e8aa0_parse_dt(ctx);
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> index 16dbf0f353ed..b937e24dac8e 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -282,7 +282,7 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>  			MIPI_DSI_MODE_VIDEO_HSE |
>  			MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -			MIPI_DSI_MODE_EOT_PACKET;
> +			MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	sharp_nt = devm_kzalloc(&dsi->dev, sizeof(*sharp_nt), GFP_KERNEL);
>  	if (!sharp_nt)
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..babc7a7f6844 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4745,7 +4745,7 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>  		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -		 MIPI_DSI_MODE_EOT_PACKET,
> +		 MIPI_DSI_MODE_NO_EOT_PACKET,
>  	.format = MIPI_DSI_FMT_RGB888,
>  	.lanes = 4,
>  };
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index 065efae213f5..6b706cbf2f9c 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
>  	else
>  		dsi->mode_flags =
>  			MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -			MIPI_DSI_MODE_EOT_PACKET;
> +			MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	acx->supply = devm_regulator_get(dev, "vddi");
>  	if (IS_ERR(acx->supply))
> diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> index 55172d63a922..d17aae8b71d7 100644
> --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> @@ -311,7 +311,7 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &xpp055c272_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 360e6377e84b..ba91cf22af51 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>  /* enable hsync-end packets in vsync-pulse and v-porch area */
>  #define MIPI_DSI_MODE_VIDEO_HSE		BIT(4)

We're mixing bits that enable a feature and bits that disable a feature.
Are these bits defined in the DSI spec, or internal to DRM ? In the
latter case, would it make sense to standardize on one "polarity" ? That
would be a more intrusive change in drivers though.

>  /* disable hfront-porch area */
> -#define MIPI_DSI_MODE_VIDEO_HFP		BIT(5)
> +#define MIPI_DSI_MODE_VIDEO_NO_HFP	BIT(5)
>  /* disable hback-porch area */
> -#define MIPI_DSI_MODE_VIDEO_HBP		BIT(6)
> +#define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
>  /* disable hsync-active area */
> -#define MIPI_DSI_MODE_VIDEO_HSA		BIT(7)
> +#define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
>  /* flush display FIFO on vsync pulse */
>  #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
>  /* disable EoT packets in HS mode */
> -#define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
> +#define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
>  /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
>  #define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
>  /* transmit data in low power */

-- 
Regards,

Laurent Pinchart
