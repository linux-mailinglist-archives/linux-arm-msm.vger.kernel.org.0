Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06342025CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 20:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgFTSFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 14:05:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:51140 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbgFTSFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 14:05:32 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 0CCC6804C8;
        Sat, 20 Jun 2020 20:05:17 +0200 (CEST)
Date:   Sat, 20 Jun 2020 20:05:16 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200620180516.GA27870@ravnborg.org>
References: <20200617105950.3165360-1-vkoul@kernel.org>
 <20200617105950.3165360-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617105950.3165360-4-vkoul@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
        a=jz-d6lpmba6S2KcqA0oA:9 a=0v66MvY54_KTIE8Z:21 a=jdXhBKns-g5RsDTu:21
        a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod.

Looks good but some some of small nits.
And a few larger things in the following.
The larger things is releated to prepare the bridge driver to live in a
world with chained bridges.

	Sam

On Wed, Jun 17, 2020 at 04:29:50PM +0530, Vinod Koul wrote:
> Lontium Lt9611 is a DSI to HDMI bridge which supports two DSI ports and
> I2S port as an input and HDMI port as output
> 
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig          |   13 +
>  drivers/gpu/drm/bridge/Makefile         |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 1219 +++++++++++++++++++++++
>  3 files changed, 1233 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 43271c21d3fc..c7f0dacfb57a 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -48,6 +48,19 @@ config DRM_DISPLAY_CONNECTOR
>  	  on ARM-based platforms. Saying Y here when this driver is not needed
>  	  will not cause any issue.
>  
> +config DRM_LONTIUM_LT9611
> +	tristate "Lontium LT9611 DSI/HDMI bridge"
> +	select SND_SOC_HDMI_CODEC if SND_SOC
> +	depends on OF
> +	select DRM_PANEL_BRIDGE
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  Driver for Lontium LT9611 DSI to HDMI bridge
> +	  chip driver that converts dual DSI and I2S to
> +	  HDMI signals
> +	  Please say Y if you have such hardware.
> +
>  config DRM_LVDS_CODEC
>  	tristate "Transparent LVDS encoders and decoders support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index d63d4b7e4347..7d7c123a95e4 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
> +obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> new file mode 100644
> index 000000000000..c38f89f28651
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -0,0 +1,1219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-2020. Linaro Limited.
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <sound/hdmi-codec.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>
Please add empty lines between each group of includes.
They are already sorted within each group and in preferred order - good.

> +
> +#define EDID_SEG_SIZE	256
> +#define EDID_LEN	32
> +#define EDID_LOOP	8
> +#define KEY_DDC_ACCS_DONE 0x02
> +#define DDC_NO_ACK	0x50
> +
> +#define LT9611_4LANES	0
> +
> +struct lt9611 {
> +	struct device *dev;
> +	struct drm_bridge bridge;
> +	struct drm_connector connector;
> +
> +	struct regmap *regmap;
> +
> +	struct device_node *dsi0_node;
> +	struct device_node *dsi1_node;
> +	struct mipi_dsi_device *dsi0;
> +	struct mipi_dsi_device *dsi1;
> +	struct platform_device *audio_pdev;
> +
> +	bool ac_mode;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
> +
> +	bool power_on;
> +	bool sleep;
> +
> +	struct regulator_bulk_data supplies[2];
> +
> +	struct i2c_client *client;
> +
> +	enum drm_connector_status status;
> +
> +	u8 edid_buf[EDID_SEG_SIZE];
> +	u32 vic;
> +};
> +
> +#define LT9611_PAGE_CONTROL	0xff
> +
> +static const struct regmap_range_cfg lt9611_ranges[] = {
> +	{
> +		.name = "register_range",
> +		.range_min =  0,
> +		.range_max = 0x85ff,
> +		.selector_reg = LT9611_PAGE_CONTROL,
> +		.selector_mask = 0xff,
> +		.selector_shift = 0,
> +		.window_start = 0,
> +		.window_len = 0x100,
> +	},
> +};
> +
> +static const struct regmap_config lt9611_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xffff,
> +	.ranges = lt9611_ranges,
> +	.num_ranges = ARRAY_SIZE(lt9611_ranges),
> +};
> +
> +struct lt9611_mode {
> +	u16 hdisplay;
> +	u16 vdisplay;
> +	u8 vrefresh;
> +	u8 lanes;
> +	u8 intfs;
> +};
> +
> +static struct lt9611_mode lt9611_modes[] = {
> +	{ 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
> +	{ 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
> +	{ 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
> +	{ 1920, 1080, 24, 3, 1 },
> +	{ 720, 480, 60, 4, 1 },
> +	{ 720, 576, 50, 2, 1 },
> +	{ 640, 480, 60, 2, 1 },
> +};
> +
> +static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct lt9611, bridge);
> +}
> +
> +static struct lt9611 *connector_to_lt9611(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct lt9611, connector);
> +}
> +
> +static int lt9611_mipi_input_analog(struct lt9611 *lt9611)
> +{
> +	const struct reg_sequence reg_cfg[] = {
> +		{ 0x8106, 0x40 }, /*port A rx current*/
> +		{ 0x810a, 0xfe }, /*port A ldo voltage set*/
> +		{ 0x810b, 0xbf }, /*enable port A lprx*/
> +		{ 0x8111, 0x40 }, /*port B rx current*/
> +		{ 0x8115, 0xfe }, /*port B ldo voltage set*/
> +		{ 0x8116, 0xbf }, /*enable port B lprx*/
> +
> +		{ 0x811c, 0x03 }, /*PortA clk lane no-LP mode*/
> +		{ 0x8120, 0x03 }, /*PortB clk lane with-LP mode*/
Add space after "/*" and before closing "*/".
Like is done a few lines up in lt9611_modes[]

> +	};
> +
> +	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +}
> +
> +static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
> +				     const struct drm_display_mode *mode)
> +{
> +	struct reg_sequence reg_cfg[] = {
> +		{ 0x8300, LT9611_4LANES },
> +		{ 0x830a, 0x00 },
> +		{ 0x824f, 0x80 },
> +		{ 0x8250, 0x10 },
> +		{ 0x8302, 0x0a },
> +		{ 0x8306, 0x0a },
> +	};
> +
> +	if (mode->hdisplay == 3840)
> +		reg_cfg[1].def = 0x03;
Please check if some of these constants be replaced by something readable
from the datasheet.
Same goes for other places where constants are used.

> +
> +	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +}
> +
> +static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
> +				    const struct drm_display_mode *mode)
> +{
> +	u32 h_total, h_act, hpw, hfp, hss;
> +	u32 v_total, v_act, vpw, vfp, vss;
> +
> +	h_total = mode->htotal;
> +	v_total = mode->vtotal;
> +
> +	h_act = mode->hdisplay;
> +	hpw = mode->hsync_end - mode->hsync_start;
> +	hfp = mode->hsync_start - mode->hdisplay;
> +	hss = (mode->hsync_end - mode->hsync_start) +
> +	      (mode->htotal - mode->hsync_end);
> +
> +	v_act = mode->vdisplay;
> +	vpw = mode->vsync_end - mode->vsync_start;
> +	vfp = mode->vsync_start - mode->vdisplay;
> +	vss = (mode->vsync_end - mode->vsync_start) +
> +	      (mode->vtotal - mode->vsync_end);
Using the names from display_timings would make this easier to recognize
for the reader.
Examples:
vfp versus vfront_porch
vss versus vsync_len

I do not say the names from display_timing are much better, only that they
are more recognizeable.

> +
> +	regmap_write(lt9611->regmap, 0x830d, (u8)(v_total / 256));
> +	regmap_write(lt9611->regmap, 0x830e, (u8)(v_total % 256));
> +
> +	regmap_write(lt9611->regmap, 0x830f, (u8)(v_act / 256));
> +	regmap_write(lt9611->regmap, 0x8310, (u8)(v_act % 256));
> +
> +	regmap_write(lt9611->regmap, 0x8311, (u8)(h_total / 256));
> +	regmap_write(lt9611->regmap, 0x8312, (u8)(h_total % 256));
> +
> +	regmap_write(lt9611->regmap, 0x8313, (u8)(h_act / 256));
> +	regmap_write(lt9611->regmap, 0x8314, (u8)(h_act % 256));
> +
> +	regmap_write(lt9611->regmap, 0x8315, (u8)(vpw % 256));
> +	regmap_write(lt9611->regmap, 0x8316, (u8)(hpw % 256));
> +
> +	regmap_write(lt9611->regmap, 0x8317, (u8)(vfp % 256));
> +
> +	regmap_write(lt9611->regmap, 0x8318, (u8)(vss % 256));
> +
> +	regmap_write(lt9611->regmap, 0x8319, (u8)(hfp % 256));
> +
> +	regmap_write(lt9611->regmap, 0x831a, (u8)(hss / 256));
> +	regmap_write(lt9611->regmap, 0x831b, (u8)(hss % 256));
> +}
> +
> +static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> +{
> +	const struct reg_sequence reg_cfg[] = {
> +		{ 0x830b, 0x01 },
> +		{ 0x830c, 0x10 },
> +		{ 0x8348, 0x00 },
> +		{ 0x8349, 0x81 },
> +
> +		/* stage 1 */
> +		{ 0x8321, 0x4a },
> +		{ 0x8324, 0x71 },
> +		{ 0x8325, 0x30 },
> +		{ 0x832a, 0x01 },
> +
> +		/* stage 2 */
> +		{ 0x834a, 0x40 },
> +		{ 0x831d, 0x10 },
> +
> +		/* MK limit */
> +		{ 0x832d, 0x38 },
> +		{ 0x8331, 0x08 },
> +	};
> +	const struct reg_sequence reg_cfg2[] = {
> +			{ 0x830b, 0x03 },
> +			{ 0x830c, 0xd0 },
> +			{ 0x8348, 0x03 },
> +			{ 0x8349, 0xe0 },
> +			{ 0x8324, 0x72 },
> +			{ 0x8325, 0x00 },
> +			{ 0x832a, 0x01 },
> +			{ 0x834a, 0x10 },
> +			{ 0x831d, 0x10 },
> +			{ 0x8326, 0x37 },
> +	};
> +
> +	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +
> +	switch (mode->hdisplay) {
> +	case 640:
> +		regmap_write(lt9611->regmap, 0x8326, 0x14);
> +		break;
> +	case 1920:
> +		regmap_write(lt9611->regmap, 0x8326, 0x37);
> +		break;
> +	case 3840:
> +		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
> +		break;
> +	}
> +
> +	/* pcr rst */
> +	regmap_write(lt9611->regmap, 0x8011, 0x5a);
> +	regmap_write(lt9611->regmap, 0x8011, 0xfa);
> +}
> +
> +static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> +{
> +	unsigned int pclk = mode->clock;
> +	const struct reg_sequence reg_cfg[] = {
> +		/* txpll init */
> +		{ 0x8123, 0x40 },
> +		{ 0x8124, 0x64 },
> +		{ 0x8125, 0x80 },
> +		{ 0x8126, 0x55 },
> +		{ 0x812c, 0x37 },
> +		{ 0x812f, 0x01 },
> +		{ 0x8126, 0x55 },
> +		{ 0x8127, 0x66 },
> +		{ 0x8128, 0x88 },
> +	};
> +
> +	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +
> +	if (pclk > 150000)
> +		regmap_write(lt9611->regmap, 0x812d, 0x88);
> +	else if (pclk > 70000)
> +		regmap_write(lt9611->regmap, 0x812d, 0x99);
> +	else
> +		regmap_write(lt9611->regmap, 0x812d, 0xaa);
> +
> +	/*
> +	 * first divide pclk by 2 first
> +	 *  - write divide by 64k to 19:16 bits which means shift by 17
> +	 *  - write divide by 256 to 15:8 bits which means shift by 9
> +	 *  - write remainder to 7:0 bits, which means shift by 1
> +	 */
> +	regmap_write(lt9611->regmap, 0x82e3, pclk >> 17); /* pclk[19:16] */
> +	regmap_write(lt9611->regmap, 0x82e4, pclk >> 9);  /* pclk[15:8]  */
> +	regmap_write(lt9611->regmap, 0x82e5, pclk >> 1);  /* pclk[7:0]   */
> +
> +	regmap_write(lt9611->regmap, 0x82de, 0x20);
> +	regmap_write(lt9611->regmap, 0x82de, 0xe0);
> +
> +	regmap_write(lt9611->regmap, 0x8016, 0xf1);
> +	regmap_write(lt9611->regmap, 0x8016, 0xf3);
> +
> +	return 0;
> +}
> +
> +static int lt9611_read_video_check(struct lt9611 *lt9611, unsigned int reg)
> +{
> +	unsigned int temp, temp2;
> +	int ret;
> +
> +	ret = regmap_read(lt9611->regmap, reg, &temp);
> +	if (ret)
> +		return ret;
> +	temp <<= 8;
> +	ret = regmap_read(lt9611->regmap, reg + 1, &temp2);
> +	if (ret)
> +		return ret;
> +
> +	return (temp + temp2);
> +}
> +
> +static int lt9611_video_check(struct lt9611 *lt9611)
> +{
> +	u32 v_total, v_act, h_act_a, h_act_b, h_total_sysclk;
> +	int temp;
> +
> +	/* top module video check */
> +
> +	/* v_act */
> +	temp = lt9611_read_video_check(lt9611, 0x8282);
> +	if (temp < 0)
> +		goto end;
> +	v_act = temp;
> +
> +	/* v_total */
> +	temp = lt9611_read_video_check(lt9611, 0x826c);
> +	if (temp < 0)
> +		goto end;
> +	v_total = temp;
> +
> +	/* h_total_sysclk */
> +	temp = lt9611_read_video_check(lt9611, 0x8286);
> +	if (temp < 0)
> +		goto end;
> +	h_total_sysclk = temp;
> +
> +	/* h_act_a */
> +	temp = lt9611_read_video_check(lt9611, 0x8382);
> +	if (temp < 0)
> +		goto end;
> +	h_act_a = temp / 3;
> +
> +	/* h_act_b */
> +	temp = lt9611_read_video_check(lt9611, 0x8386);
> +	if (temp < 0)
> +		goto end;
> +	h_act_b = temp / 3;
> +
> +	dev_info(lt9611->dev,
> +		 "video check: h_act_a=%d, h_act_b=%d, v_act=%d, v_total=%d, h_total_sysclk=%d\n",
> +		 h_act_a, h_act_b, v_act, v_total, h_total_sysclk);
> +
> +	return 0;
> +
> +end:
> +	dev_err(lt9611->dev, "read video check error\n");
> +	return temp;
> +}
> +
> +static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611)
> +{
> +	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
> +	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
> +	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
> +
> +	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
> +	regmap_write(lt9611->regmap, 0x82d7, 0x04);
> +}
> +
> +static void lt9611_hdmi_tx_phy(struct lt9611 *lt9611)
> +{
> +	struct reg_sequence reg_cfg[] = {
> +		{ 0x8130, 0x6a },
> +		{ 0x8131, 0x44 }, /* HDMI DC mode */
> +		{ 0x8132, 0x4a },
> +		{ 0x8133, 0x0b },
> +		{ 0x8134, 0x00 },
> +		{ 0x8135, 0x00 },
> +		{ 0x8136, 0x00 },
> +		{ 0x8137, 0x44 },
> +		{ 0x813f, 0x0f },
> +		{ 0x8140, 0xa0 },
> +		{ 0x8141, 0xa0 },
> +		{ 0x8142, 0xa0 },
> +		{ 0x8143, 0xa0 },
> +		{ 0x8144, 0x0a },
> +	};
> +
> +	/* HDMI AC mode */
> +	if (lt9611->ac_mode)
> +		reg_cfg[2].def = 0x73;
> +
> +	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +}
> +
> +static irqreturn_t lt9611_irq_thread_handler(int irq, void *dev_id)
> +{
> +	struct lt9611 *lt9611 = dev_id;
> +	unsigned int irq_flag0 = 0;
> +	unsigned int irq_flag3 = 0;
> +
> +	regmap_read(lt9611->regmap, 0x820f, &irq_flag3);
> +	regmap_read(lt9611->regmap, 0x820c, &irq_flag0);
> +
> +	pr_debug("%s() irq_flag0: %#x irq_flag3: %#x\n",
> +		 __func__, irq_flag0, irq_flag3);
debug artifact you can delete now?

> +
> +	 /* hpd changed low */
Drop extra space in indent of this comment and following comments as
well.

> +	if (irq_flag3 & 0x80) {
> +		dev_info(lt9611->dev, "hdmi cable disconnected\n");
> +
> +		regmap_write(lt9611->regmap, 0x8207, 0xbf);
> +		regmap_write(lt9611->regmap, 0x8207, 0x3f);
> +	}
> +	 /* hpd changed high */
> +	if (irq_flag3 & 0x40) {
> +		dev_info(lt9611->dev, "hdmi cable connected\n");
> +
> +		regmap_write(lt9611->regmap, 0x8207, 0x7f);
> +		regmap_write(lt9611->regmap, 0x8207, 0x3f);
> +	}
> +
> +	if (irq_flag3 & 0xc0 && lt9611->bridge.dev)
> +		drm_kms_helper_hotplug_event(lt9611->bridge.dev);
> +
> +	/* video input changed */
> +	if (irq_flag0 & 0x01) {
> +		dev_info(lt9611->dev, "video input changed\n");
> +		regmap_write(lt9611->regmap, 0x829e, 0xff);
> +		regmap_write(lt9611->regmap, 0x829e, 0xf7);
> +		regmap_write(lt9611->regmap, 0x8204, 0xff);
> +		regmap_write(lt9611->regmap, 0x8204, 0xfe);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void lt9611_enable_hpd_interrupts(struct lt9611 *lt9611)
> +{
> +	unsigned int val;
> +
> +	dev_dbg(lt9611->dev, "enabling hpd interrupts\n");
debug artifact you can delete now?
> +
> +	regmap_read(lt9611->regmap, 0x8203, &val);
> +
> +	val &= ~0xc0;
> +	regmap_write(lt9611->regmap, 0x8203, val);
> +	regmap_write(lt9611->regmap, 0x8207, 0xff); //clear
Some people are not happy with c++ comments.
Also add space.

> +	regmap_write(lt9611->regmap, 0x8207, 0x3f);
> +}
> +
> +static void lt9611_sleep_setup(struct lt9611 *lt9611)
> +{
> +	const struct reg_sequence sleep_setup[] = {
> +		{ 0x8024, 0x76 },
> +		{ 0x8023, 0x01 },
> +		{ 0x8157, 0x03 }, //set addr pin as output
> +		{ 0x8149, 0x0b },
> +		{ 0x8151, 0x30 }, //disable IRQ
> +		{ 0x8102, 0x48 }, //MIPI Rx power down
> +		{ 0x8123, 0x80 },
> +		{ 0x8130, 0x00 },
> +		{ 0x8100, 0x01 }, //bandgap power down
> +		{ 0x8101, 0x00 }, //system clk power down
> +	};
Ditto, both c++ comments and space.

> +
> +	dev_dbg(lt9611->dev, "sleep\n");
debug artifact?
I will not repeat this, but evaluate all the deb_dbg() uses.

> +
> +	regmap_multi_reg_write(lt9611->regmap,
> +			       sleep_setup, ARRAY_SIZE(sleep_setup));
> +	lt9611->sleep = true;
> +}
> +
> +static int lt9611_power_on(struct lt9611 *lt9611)
> +{
> +	int ret;
> +	const struct reg_sequence seq[] = {
> +		/* LT9611_System_Init */
> +		{ 0x8101, 0x18 }, /* sel xtal clock */
> +
> +		/* timer for frequency meter */
> +		{ 0x821b, 0x69 }, /*timer 2*/
> +		{ 0x821c, 0x78 },
> +		{ 0x82cb, 0x69 }, /*timer 1 */
> +		{ 0x82cc, 0x78 },
> +
> +		/* irq init */
> +		{ 0x8251, 0x01 },
> +		{ 0x8258, 0x0a }, /* hpd irq */
> +		{ 0x8259, 0x80 }, /* hpd debounce width */
> +		{ 0x829e, 0xf7 }, /* video check irq */
> +
> +		/* power consumption for work */
> +		{ 0x8004, 0xf0 },
> +		{ 0x8006, 0xf0 },
> +		{ 0x800a, 0x80 },
> +		{ 0x800b, 0x40 },
> +		{ 0x800d, 0xef },
> +		{ 0x8011, 0xfa },
> +	};
> +
> +	if (lt9611->power_on)
> +		return 0;
> +
> +	dev_dbg(lt9611->dev, "power on\n");
> +
> +	ret = regmap_multi_reg_write(lt9611->regmap, seq, ARRAY_SIZE(seq));
> +	if (!ret)
> +		lt9611->power_on = true;
> +
> +	return ret;
> +}
> +
> +static int lt9611_power_off(struct lt9611 *lt9611)
> +{
> +	int ret;
> +
> +	dev_dbg(lt9611->dev, "power off\n");
> +
> +	ret = regmap_write(lt9611->regmap, 0x8130, 0x6a);
> +	if (!ret)
> +		lt9611->power_on = false;
> +
> +	return ret;
> +}
> +
> +static void lt9611_reset(struct lt9611 *lt9611)
> +{
> +	gpiod_set_value_cansleep(lt9611->reset_gpio, 1);
> +	msleep(20);
> +	gpiod_set_value_cansleep(lt9611->reset_gpio, 0);
> +	msleep(20);
> +	gpiod_set_value_cansleep(lt9611->reset_gpio, 1);
> +	msleep(100);
> +}
> +
> +static void lt9611_assert_5v(struct lt9611 *lt9611)
> +{
> +	if (!lt9611->enable_gpio)
> +		return;
> +
> +	gpiod_set_value_cansleep(lt9611->enable_gpio, 1);
> +	msleep(20);
> +}
> +
> +static int lt9611_regulator_init(struct lt9611 *lt9611)
> +{
> +	int ret;
> +
> +	lt9611->supplies[0].supply = "vdd";
> +	lt9611->supplies[1].supply = "vcc";
> +	ret = devm_regulator_bulk_get(lt9611->dev, 2, lt9611->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regulator_set_load(lt9611->supplies[0].consumer, 300000);
> +}
> +
> +static int lt9611_regulator_enable(struct lt9611 *lt9611)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(lt9611->supplies[0].consumer);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(1000, 10000);
> +
> +	ret = regulator_enable(lt9611->supplies[1].consumer);
> +	if (ret < 0) {
> +		regulator_disable(lt9611->supplies[0].consumer);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
> +		if (lt9611_modes[i].hdisplay == mode->hdisplay &&
> +		    lt9611_modes[i].vdisplay == mode->vdisplay &&
> +		    lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
> +			return &lt9611_modes[i];
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +/* connector funcs */
> +static enum drm_connector_status
> +lt9611_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct lt9611 *lt9611 = connector_to_lt9611(connector);
> +	unsigned int reg_val = 0;
> +	int connected = 0;
> +
> +	regmap_read(lt9611->regmap, 0x825e, &reg_val);
> +	connected  = (reg_val & BIT(2));
> +	dev_dbg(lt9611->dev, "connected = %x\n", connected);
> +
> +	lt9611->status = connected ?  connector_status_connected :
> +				connector_status_disconnected;
> +
> +	return lt9611->status;
> +}
> +
> +static int lt9611_read_edid(struct lt9611 *lt9611)
> +{
> +	unsigned int temp;
> +	int ret = 0;
> +	int i, j;
> +
> +	/* memset to clear old buffer, if any */
> +	memset(lt9611->edid_buf, 0, sizeof(lt9611->edid_buf));
> +
> +	regmap_write(lt9611->regmap, 0x8503, 0xc9);
> +
> +	/* 0xA0 is EDID device address */
> +	regmap_write(lt9611->regmap, 0x8504, 0xa0);
> +	/* 0x00 is EDID offset address */
> +	regmap_write(lt9611->regmap, 0x8505, 0x00);
> +	/* length for read */
> +	regmap_write(lt9611->regmap, 0x8506, EDID_LEN);
> +	regmap_write(lt9611->regmap, 0x8514, 0x7f);
> +
> +	for (i = 0; i < EDID_LOOP; i++) {
> +		/* offset address */
> +		regmap_write(lt9611->regmap, 0x8505, i * EDID_LEN);
> +		regmap_write(lt9611->regmap, 0x8507, 0x36);
> +		regmap_write(lt9611->regmap, 0x8507, 0x31);
> +		regmap_write(lt9611->regmap, 0x8507, 0x37);
> +		usleep_range(5000, 10000);
> +
> +		regmap_read(lt9611->regmap, 0x8540, &temp);
> +
> +		if (temp & KEY_DDC_ACCS_DONE) {
> +			for (j = 0; j < EDID_LEN; j++) {
> +				regmap_read(lt9611->regmap, 0x8583, &temp);
> +				lt9611->edid_buf[i * EDID_LEN + j] = temp;
> +			}
> +		} else if (temp & DDC_NO_ACK) { /* DDC No Ack or Abitration lost */
> +			dev_err(lt9611->dev, "read edid failed: no ack\n");
> +			ret = -EIO;
> +			goto end;
> +		} else {
> +			dev_err(lt9611->dev, "read edid failed: access not done\n");
> +			ret = -EIO;
> +			goto end;
> +		}
> +	}
> +
> +	dev_dbg(lt9611->dev, "read edid succeeded, checksum = 0x%x\n",
> +		lt9611->edid_buf[EDID_SEG_SIZE - 1]);
> +
> +end:
> +	regmap_write(lt9611->regmap, 0x8507, 0x1f);
> +	return ret;
> +}
> +
> +static int
> +lt9611_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct lt9611 *lt9611 = data;
> +	int ret;
> +
> +	dev_dbg(lt9611->dev, "get edid block: block=%d, len=%d\n",
> +		block, (int)len);
> +
> +	if (len > 128)
> +		return -EINVAL;
> +
> +	/* supports up to 1 extension block */
> +	/* TODO: add support for more extension blocks */
> +	if (block > 1)
> +		return -EINVAL;
> +
> +	if (block == 0) {
> +		ret = lt9611_read_edid(lt9611);
> +		if (ret) {
> +			dev_err(lt9611->dev, "edid read failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	block %= 2;
> +	memcpy(buf, lt9611->edid_buf + (block * 128), len);
> +
> +	return 0;
> +}
> +
> +static int lt9611_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct lt9611 *lt9611 = connector_to_lt9611(connector);
> +	unsigned int count;
> +	struct edid *edid;
> +
> +	dev_dbg(lt9611->dev, "get modes\n");
> +
> +	lt9611_power_on(lt9611);
> +	edid = drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
> +	drm_connector_update_edid_property(connector, edid);
> +	count = drm_add_edid_modes(connector, edid);
> +	kfree(edid);
> +
> +	return count;
> +}
> +
> +static enum drm_mode_status
> +lt9611_connector_mode_valid(struct drm_connector *connector,
> +			    struct drm_display_mode *mode)
> +{
> +	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> +
> +	return lt9611_mode ? MODE_OK : MODE_BAD;
> +}
> +
> +/* bridge funcs */
> +static void lt9611_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +
> +	dev_dbg(lt9611->dev, "bridge enable\n");
> +
> +	if (lt9611_power_on(lt9611)) {
> +		dev_err(lt9611->dev, "power on failed\n");
> +		return;
> +	}
> +
> +	dev_dbg(lt9611->dev, "video on\n");
> +
> +	lt9611_mipi_input_analog(lt9611);
> +	lt9611_hdmi_tx_digital(lt9611);
> +	lt9611_hdmi_tx_phy(lt9611);
> +
> +	msleep(500);
> +
> +	lt9611_video_check(lt9611);
> +
> +	/* Enable HDMI output */
> +	regmap_write(lt9611->regmap, 0x8130, 0xea);
> +}
> +
> +static void lt9611_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	int ret;
> +
> +	dev_dbg(lt9611->dev, "bridge disable\n");
> +
> +	/* Disable HDMI output */
> +	ret = regmap_write(lt9611->regmap, 0x8130, 0x6a);
> +	if (ret) {
> +		dev_err(lt9611->dev, "video on failed\n");
> +		return;
> +	}
> +
> +	if (lt9611_power_off(lt9611)) {
> +		dev_err(lt9611->dev, "power on failed\n");
> +		return;
> +	}
> +}
> +
> +static struct
> +drm_connector_helper_funcs lt9611_bridge_connector_helper_funcs = {
> +	.get_modes = lt9611_connector_get_modes,
> +	.mode_valid = lt9611_connector_mode_valid,
> +};
> +
> +static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.detect = lt9611_connector_detect,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
> +						 struct device_node *dsi_node)
> +{
> +	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host;
> +	int ret;
> +
> +	host = of_find_mipi_dsi_host_by_node(dsi_node);
> +	if (!host) {
> +		dev_err(lt9611->dev, "failed to find dsi host\n");
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	dsi = mipi_dsi_device_register_full(host, &info);
> +	if (IS_ERR(dsi)) {
> +		dev_err(lt9611->dev, "failed to create dsi device\n");
> +		return dsi;
> +	}
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			  MIPI_DSI_MODE_VIDEO_HSE;
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(lt9611->dev, "failed to attach dsi to host\n");
> +		mipi_dsi_device_unregister(dsi);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dsi;
> +}
> +
> +static void lt9611_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +
> +	if (lt9611->dsi1) {
> +		mipi_dsi_detach(lt9611->dsi1);
> +		mipi_dsi_device_unregister(lt9611->dsi1);
> +	}
> +
> +	mipi_dsi_detach(lt9611->dsi0);
> +	mipi_dsi_device_unregister(lt9611->dsi0);
> +}
> +
> +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	int ret;
> +
> +	dev_dbg(lt9611->dev, "bridge attach\n");
> +
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		DRM_ERROR("Fix bridge driver to make connector optional!");
> +		return -EINVAL;
> +	}
Please fix bridge so connector creation is optional.
for new bridge driver this is mandatory.

> +
> +	ret = drm_connector_init(bridge->dev, &lt9611->connector,
> +				 &lt9611_bridge_connector_funcs,
> +				 DRM_MODE_CONNECTOR_HDMIA);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector with drm\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(&lt9611->connector,
> +				 &lt9611_bridge_connector_helper_funcs);
> +	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
> +
> +	if (!bridge->encoder) {
> +		DRM_ERROR("Parent encoder object not found");
> +		return -ENODEV;
> +	}
> +
> +	/* Attach primary DSI */
> +	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
> +	if (IS_ERR(lt9611->dsi0))
> +		return PTR_ERR(lt9611->dsi0);
> +
> +	/* Attach secondary DSI, if specified */
> +	if (lt9611->dsi1_node) {
> +		lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
> +		if (IS_ERR(lt9611->dsi1)) {
> +			ret = PTR_ERR(lt9611->dsi1);
> +			goto err_unregister_dsi0;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_unregister_dsi0:
> +	lt9611_bridge_detach(bridge);
> +	drm_connector_cleanup(&lt9611->connector);
> +	mipi_dsi_device_unregister(lt9611->dsi0);
> +
> +	return ret;
> +}
> +
> +static enum drm_mode_status
> +lt9611_bridge_mode_valid(struct drm_bridge *bridge, const struct drm_display_mode *mode)
> +{
> +	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +
> +	if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
> +		return MODE_PANEL;
> +	else
> +		return MODE_OK;
> +}
> +
> +static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +
> +	dev_dbg(lt9611->dev, "bridge pre_enable\n");
> +
> +	if (!lt9611->sleep)
> +		return;
> +
> +	lt9611_reset(lt9611);
> +	regmap_write(lt9611->regmap, 0x80ee, 0x01);
> +
> +	lt9611->sleep = false;
> +}
> +
> +static void lt9611_bridge_post_disable(struct drm_bridge *bridge)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +
> +	dev_dbg(lt9611->dev, "bridge post_disable\n");
> +
> +	lt9611_sleep_setup(lt9611);
> +}
> +
> +static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adj_mode)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	struct hdmi_avi_infoframe avi_frame;
> +	int ret;
> +
> +	dev_dbg(lt9611->dev, "bridge mode_set: hdisplay=%d, vdisplay=%d, vrefresh=%d, clock=%d\n",
> +		adj_mode->hdisplay, adj_mode->vdisplay,
> +		adj_mode->vrefresh, adj_mode->clock);
> +
> +	lt9611_bridge_pre_enable(bridge);
> +
> +	lt9611_mipi_input_digital(lt9611, mode);
> +	lt9611_pll_setup(lt9611, mode);
> +	lt9611_mipi_video_setup(lt9611, mode);
> +	lt9611_pcr_setup(lt9611, mode);
> +
> +	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
> +						       &lt9611->connector,
> +						       mode);
> +	if (!ret)
> +		lt9611->vic = avi_frame.video_code;
> +}
> +
> +static const struct drm_bridge_funcs lt9611_bridge_funcs = {
> +	.attach = lt9611_bridge_attach,
> +	.detach = lt9611_bridge_detach,
> +	.mode_valid = lt9611_bridge_mode_valid,
> +	.enable = lt9611_bridge_enable,
> +	.disable = lt9611_bridge_disable,
> +	.post_disable = lt9611_bridge_post_disable,
> +	.mode_set = lt9611_bridge_mode_set,

Add relevant bridge functions - .get_edid, .detect looks like
candidates.
See other bridge drivers for inspiration.


> +};
> +
> +static int lt9611_parse_dt(struct device *dev,
> +			   struct lt9611 *lt9611)
> +{
> +	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 1, -1);
> +	if (!lt9611->dsi0_node) {
> +		DRM_DEV_ERROR(dev, "failed to get remote node for primary dsi\n");
In other places dev_xxx is used, please be consistent and use dev_err()
here.

> +		return -ENODEV;
> +	}
> +
> +	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 2, -1);
> +
> +	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
> +	dev_dbg(lt9611->dev, "ac_mode=%d\n", lt9611->ac_mode);
> +
> +	return 0;
> +}
> +
> +static int lt9611_gpio_init(struct lt9611 *lt9611)
> +{
> +	struct device *dev = lt9611->dev;
> +
> +	lt9611->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(lt9611->reset_gpio)) {
> +		dev_err(dev, "failed to acquire reset gpio\n");
> +		return PTR_ERR(lt9611->reset_gpio);
> +	}
> +
> +	lt9611->enable_gpio = devm_gpiod_get_optional(dev, "enable",
> +						      GPIOD_OUT_LOW);
> +	if (IS_ERR(lt9611->enable_gpio)) {
> +		dev_err(dev, "failed to acquire enable gpio\n");
> +		return PTR_ERR(lt9611->enable_gpio);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611_read_device_rev(struct lt9611 *lt9611)
> +{
> +	unsigned int rev;
> +	int ret;
> +
> +	regmap_write(lt9611->regmap, 0x80ee, 0x01);
> +	ret = regmap_read(lt9611->regmap, 0x8002, &rev);
> +	if (ret)
> +		dev_err(lt9611->dev, "failed to read revision: %d\n", ret);
> +	else
> +		dev_info(lt9611->dev, "LT9611 revision: 0x%x\n", rev);
> +
> +	return ret;
> +}
> +
> +static int lt9611_hdmi_hw_params(struct device *dev, void *data,
> +				 struct hdmi_codec_daifmt *fmt,
> +				 struct hdmi_codec_params *hparms)
> +{
> +	struct lt9611 *lt9611 = data;
> +
> +	if (hparms->sample_rate == 48000)
> +		regmap_write(lt9611->regmap, 0x840f, 0x2b);
> +	else if (hparms->sample_rate == 96000)
> +		regmap_write(lt9611->regmap, 0x840f, 0xab);
> +	else
> +		return -EINVAL;
> +
> +	regmap_write(lt9611->regmap, 0x8435, 0x00);
> +	regmap_write(lt9611->regmap, 0x8436, 0x18);
> +	regmap_write(lt9611->regmap, 0x8437, 0x00);
> +
> +	return 0;
> +}
> +
> +static int lt9611_audio_startup(struct device *dev, void *data)
> +{
> +	struct lt9611 *lt9611 = data;
> +
> +	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
> +	regmap_write(lt9611->regmap, 0x82d7, 0x04);
> +
> +	regmap_write(lt9611->regmap, 0x8406, 0x08);
> +	regmap_write(lt9611->regmap, 0x8407, 0x10);
> +
> +	regmap_write(lt9611->regmap, 0x8434, 0xd5);
> +
> +	return 0;
> +}
> +
> +static void lt9611_audio_shutdown(struct device *dev, void *data)
> +{
> +	struct lt9611 *lt9611 = data;
> +
> +	regmap_write(lt9611->regmap, 0x8406, 0x00);
> +	regmap_write(lt9611->regmap, 0x8407, 0x00);
> +}
> +
> +static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> +				      struct device_node *endpoint)
> +{
> +	struct of_endpoint of_ep;
> +	int ret;
> +
> +	pr_debug("In %s: %d\n", __func__, __LINE__);
> +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * HDMI sound should be located as reg = <2>
> +	 * Then, it is sound port 0
> +	 */
> +	if (of_ep.port == 2)
> +		return 0;
> +
> +	return -EINVAL;
> +}
> +
> +static const struct hdmi_codec_ops lt9611_codec_ops = {
> +	.hw_params	= lt9611_hdmi_hw_params,
> +	.audio_shutdown = lt9611_audio_shutdown,
> +	.audio_startup	= lt9611_audio_startup,
> +	.get_dai_id	= lt9611_hdmi_i2s_get_dai_id,
> +};
> +
> +static struct hdmi_codec_pdata codec_data = {
> +	.ops = &lt9611_codec_ops,
> +	.max_i2s_channels = 8,
> +	.i2s = 1,
> +};
> +
> +static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
> +{
> +	codec_data.data = lt9611;
> +	lt9611->audio_pdev =
> +		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> +					      PLATFORM_DEVID_AUTO,
> +					      &codec_data, sizeof(codec_data));
> +
> +	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
> +}
> +
> +static void lt9611_audio_exit(struct lt9611 *lt9611)
> +{
> +	if (lt9611->audio_pdev) {
> +		platform_device_unregister(lt9611->audio_pdev);
> +		lt9611->audio_pdev = NULL;
> +	}
> +}
> +
> +static int lt9611_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct lt9611 *lt9611;
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "device doesn't support I2C\n");
> +		return -ENODEV;
> +	}
> +
> +	lt9611 = devm_kzalloc(dev, sizeof(*lt9611), GFP_KERNEL);
> +	if (!lt9611)
> +		return -ENOMEM;
> +
> +	lt9611->dev = &client->dev;
> +	lt9611->client = client;
> +	lt9611->sleep = false;
> +
> +	lt9611->regmap = devm_regmap_init_i2c(client, &lt9611_regmap_config);
> +	if (IS_ERR(lt9611->regmap)) {
> +		DRM_ERROR("regmap i2c init failed\n");
> +		return PTR_ERR(lt9611->regmap);
> +	}
> +
> +	ret = lt9611_parse_dt(&client->dev, lt9611);
> +	if (ret) {
> +		dev_err(dev, "failed to parse device tree\n");
> +		return ret;
> +	}
> +
> +	ret = lt9611_gpio_init(lt9611);
> +	if (ret < 0)
> +		goto err_of_put;
> +
> +	ret = lt9611_regulator_init(lt9611);
> +	if (ret < 0)
> +		goto err_of_put;
> +
> +	lt9611_assert_5v(lt9611);
> +
> +	ret = lt9611_regulator_enable(lt9611);
> +	if (ret)
> +		goto err_of_put;
> +
> +	lt9611_reset(lt9611);
> +
> +	ret = lt9611_read_device_rev(lt9611);
> +	if (ret) {
> +		dev_err(dev, "failed to read chip rev\n");
> +		goto err_disable_regulators;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					lt9611_irq_thread_handler,
> +					IRQF_ONESHOT, "lt9611", lt9611);
> +	if (ret) {
> +		dev_err(dev, "failed to request irq\n");
> +		goto err_disable_regulators;
> +	}
> +
> +	i2c_set_clientdata(client, lt9611);
> +
> +	lt9611->bridge.funcs = &lt9611_bridge_funcs;
> +	lt9611->bridge.of_node = client->dev.of_node;
> +
> +	drm_bridge_add(&lt9611->bridge);
> +
> +	lt9611_enable_hpd_interrupts(lt9611);
> +
> +	return lt9611_audio_init(dev, lt9611);
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);
> +
> +err_of_put:
> +	of_node_put(lt9611->dsi1_node);
> +	of_node_put(lt9611->dsi0_node);
> +
> +	return ret;
> +}
> +
> +static int lt9611_remove(struct i2c_client *client)
> +{
> +	struct lt9611 *lt9611 = i2c_get_clientdata(client);
> +
> +	disable_irq(client->irq);
> +	lt9611_audio_exit(lt9611);
> +	drm_bridge_remove(&lt9611->bridge);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);
> +
> +	of_node_put(lt9611->dsi1_node);
> +	of_node_put(lt9611->dsi0_node);
> +
> +	return 0;
> +}
> +
> +static struct i2c_device_id lt9611_id[] = {
> +	{ "lontium,lt9611", 0 },
> +	{}
> +};
> +
> +static const struct of_device_id lt9611_match_table[] = {
> +	{ .compatible = "lontium,lt9611" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lt9611_match_table);
> +
> +static struct i2c_driver lt9611_driver = {
> +	.driver = {
> +		.name = "lt9611",
> +		.of_match_table = lt9611_match_table,
> +	},
> +	.probe = lt9611_probe,
> +	.remove = lt9611_remove,
> +	.id_table = lt9611_id,
> +};
> +module_i2c_driver(lt9611_driver);
> +
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
