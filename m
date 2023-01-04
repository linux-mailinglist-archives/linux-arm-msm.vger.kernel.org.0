Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C650865DC0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 19:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbjADSZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 13:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbjADSZT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 13:25:19 -0500
Received: from out-111.mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7461BEA1
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 10:25:15 -0800 (PST)
Message-ID: <8c8d0276-61a8-71d6-17b0-f6b384ab9d94@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1672856712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YA77oMQK9dnhf7Oks42BIC4ztoRLvubvmAH6B2dZmTI=;
        b=Vvuiryv2nwN3gI5tONEXZkQ+cZOgnxmoMysvuRzO9rBLNvOnUOGas27u90oW7gZQhwTZAd
        HLkZWlhanczaZR6/NZDIljo518A6EuQtEbaHH2T/VZrCJR0TRpwuNd/KFkd80PZD4qQBgA
        JP0DKUWM7kSlrMoxOwQgnr/W2sEniHI=
Date:   Wed, 4 Jan 2023 18:25:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/panel: add visionox vtdr6130 DSI panel driver
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-2-9b746b858378@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-2-9b746b858378@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,
I am not a maintainer, but I thought I might give a few comments.

On 03/01/2023 14:22, Neil Armstrong wrote:
> Add support for the 1080x2400 Visionox VTDR6130 AMOLED DSI panel
> found on the Qualcomm SM8550 MTP board.
> 
> By default the the panel is configured to work with DSI compressed
> streams, but can work in uncompressed video mode since 1080x2400 in
> RGB888 fits in the 4 DSI lanes bandwidth.
> 
> While display compression is preferred for performance and power
> reasons, let's start with the uncompressed video mode support and
> add the DSC support later on.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                   |   8 +
>   drivers/gpu/drm/panel/Makefile                  |   1 +
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 366 ++++++++++++++++++++++++
>   3 files changed, 375 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 737edcdf9eef..fd1d7e6f536b 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -717,6 +717,14 @@ config DRM_PANEL_VISIONOX_RM69299
>   	  Say Y here if you want to enable support for Visionox
>   	  RM69299  DSI Video Mode panel.
>   
> +config DRM_PANEL_VISIONOX_VTDR6130
> +	tristate "Visionox VTDR6130"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	help
> +	  Say Y here if you want to enable support for Visionox
> +	  VTDR6130 1080x2400 AMOLED DSI panel.
> +
>   config DRM_PANEL_WIDECHIPS_WS2401
>   	tristate "Widechips WS2401 DPI panel driver"
>   	depends on SPI && GPIOLIB
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f8f9d9f6a307..1966404fcf7a 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -73,5 +73,6 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
>   obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
>   obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> new file mode 100644
> index 000000000000..94ad2a32efc9
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -0,0 +1,366 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2023, Linaro Limited
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/display/drm_dsc.h>
> +#include <linux/regulator/consumer.h>
> +
> +struct visionox_vtdr6130 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[3];
> +	bool prepared;
> +};
> +
> +static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_vtdr6130, panel);
> +}
> +
> +static inline int visionox_vtdr6130_dsi_write(struct mipi_dsi_device *dsi, const void *seq,
> +					      size_t len)
> +{
> +	return mipi_dsi_dcs_write_buffer(dsi, seq, len);
> +}
> +
> +#define dsi_dcs_write_seq(dsi, seq...)					\
> +	{								\
> +		const u8 d[] = { seq };					\
> +		visionox_vtdr6130_dsi_write(dsi, d, ARRAY_SIZE(d));	\
> +	}
> +
> +static void visionox_vtdr6130_reset(struct visionox_vtdr6130 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	dsi_dcs_write_seq(dsi, 0x03, 0x01);
> +	dsi_dcs_write_seq(dsi, 0x35, 0x00);
> +	dsi_dcs_write_seq(dsi, 0x53, 0x20);
> +	dsi_dcs_write_seq(dsi, 0x51, 0x00, 0x00);
> +	dsi_dcs_write_seq(dsi, 0x59, 0x09);
> +	dsi_dcs_write_seq(dsi, 0x6c, 0x01);
> +	dsi_dcs_write_seq(dsi, 0x6d, 0x00);
> +	dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +	dsi_dcs_write_seq(dsi, 0x70,
> +			  0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
> +			  0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> +			  0x02, 0x0e, 0x00, 0x20, 0x03, 0xdd, 0x00, 0x07, 0x00,
> +			  0x0c, 0x02, 0x77, 0x02, 0x8b, 0x18, 0x00, 0x10, 0xf0,
> +			  0x07, 0x10, 0x20, 0x00, 0x06, 0x0f, 0x0f, 0x33, 0x0e,
> +			  0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62, 0x69, 0x70, 0x77,
> +			  0x79, 0x7b, 0x7d, 0x7e, 0x02, 0x02, 0x22, 0x00, 0x2a,
> +			  0x40, 0x2a, 0xbe, 0x3a, 0xfc, 0x3a, 0xfa, 0x3a, 0xf8,
> +			  0x3b, 0x38, 0x3b, 0x78, 0x3b, 0xb6, 0x4b, 0xb6, 0x4b,
> +			  0xf4, 0x4b, 0xf4, 0x6c, 0x34, 0x84, 0x74, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x10);
> +	dsi_dcs_write_seq(dsi, 0xb1,
> +			  0x01, 0x38, 0x00, 0x14, 0x00, 0x1c, 0x00, 0x01, 0x66,
> +			  0x00, 0x14, 0x00, 0x14, 0x00, 0x01, 0x66, 0x00, 0x14,
> +			  0x05, 0xcc, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x13);
> +	dsi_dcs_write_seq(dsi, 0xce,
> +			  0x09, 0x11, 0x09, 0x11, 0x08, 0xc1, 0x07, 0xfa, 0x05,
> +			  0xa4, 0x00, 0x3c, 0x00, 0x34, 0x00, 0x24, 0x00, 0x0c,
> +			  0x00, 0x0c, 0x04, 0x00, 0x35);
> +	dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x14);
> +	dsi_dcs_write_seq(dsi, 0xb2, 0x03, 0x33);
> +	dsi_dcs_write_seq(dsi, 0xb4,
> +			  0x00, 0x33, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x00, 0x00,
> +			  0x3e, 0x00, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xb5,
> +			  0x00, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x06, 0x01);
> +	dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0x00, 0x08, 0x09, 0x09, 0x09);
> +	dsi_dcs_write_seq(dsi, 0xbc,
> +			  0x10, 0x00, 0x00, 0x06, 0x11, 0x09, 0x3b, 0x09, 0x47,
> +			  0x09, 0x47, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xbe,
> +			  0x10, 0x10, 0x00, 0x08, 0x22, 0x09, 0x19, 0x09, 0x25,
> +			  0x09, 0x25, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x80);
> +	dsi_dcs_write_seq(dsi, 0x65, 0x14);
> +	dsi_dcs_write_seq(dsi, 0xfa, 0x08, 0x08, 0x08);
> +	dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x81);
> +	dsi_dcs_write_seq(dsi, 0x65, 0x05);
> +	dsi_dcs_write_seq(dsi, 0xf3, 0x0f);
> +	dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x82);
> +	dsi_dcs_write_seq(dsi, 0xf9, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xff, 0x51, 0x83);
> +	dsi_dcs_write_seq(dsi, 0x65, 0x04);
> +	dsi_dcs_write_seq(dsi, 0xf8, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x00);
> +	dsi_dcs_write_seq(dsi, 0x65, 0x01);
> +	dsi_dcs_write_seq(dsi, 0xf4, 0x9a);
> +	dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x00);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
> +
> +	return 0;
> +}
> +
> +static int visionox_vtdr6130_off(struct visionox_vtdr6130 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	return 0;
> +}
> +
> +static int visionox_vtdr6130_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
> +				    ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	visionox_vtdr6130_reset(ctx);
> +
> +	ret = visionox_vtdr6130_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	/* Explicitly disable DSC since compression is on by default on the panel */
> +	mipi_dsi_compression_mode(ctx->dsi, false);
> +
> +	ctx->prepared = true;
> +	return 0;
> +}
> +
> +static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = visionox_vtdr6130_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode visionox_vtdr6130_mode = {
> +	.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 20,
> +	.hsync_end = 1080 + 20 + 2,
> +	.htotal = 1080 + 20 + 2 + 20,
> +	.vdisplay = 2400,
> +	.vsync_start = 2400 + 20,
> +	.vsync_end = 2400 + 20 + 2,
> +	.vtotal = 2400 + 20 + 2 + 18,
> +	.width_mm = 0,
> +	.height_mm = 0,
> +};
> +
> +static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
> +				       struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &visionox_vtdr6130_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
> +	.prepare = visionox_vtdr6130_prepare,
> +	.unprepare = visionox_vtdr6130_unprepare,
> +	.get_modes = visionox_vtdr6130_get_modes,
> +};
> +
> +static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, cpu_to_le16(brightness));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops visionox_vtdr6130_bl_ops = {
> +	.update_status = visionox_vtdr6130_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +visionox_vtdr6130_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 4095,
> +		.max_brightness = 4095,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &visionox_vtdr6130_bl_ops, &props);
> +}
> +
> +static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_vtdr6130 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supplies[0].supply = "vddio";
> +	ctx->supplies[1].supply = "vci";
> +	ctx->supplies[2].supply = "vdd";
> +
> +	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ctx->panel.backlight = visionox_vtdr6130_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void visionox_vtdr6130_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_vtdr6130 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id visionox_vtdr6130_of_match[] = {
> +	{ .compatible = "visionox,vtdr6130" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
> +
> +static struct mipi_dsi_driver visionox_vtdr6130_driver = {
> +	.probe = visionox_vtdr6130_probe,
> +	.remove = visionox_vtdr6130_remove,
> +	.driver = {
> +		.name = "panel-visionox-vtdr6130",
> +		.of_match_table = visionox_vtdr6130_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(visionox_vtdr6130_driver);
> +
> +MODULE_AUTHOR("Neil Armstron <neil.armstrong@linaro.org>");

Missed a "g" here :-)

> +MODULE_DESCRIPTION("Panel driver for the visionox VTDR6130 AMOLED DSI panel");

I am not sure how the company capitalises the name, but to keep it 
consistent with the other mentions, I think it should be "Visionox".

> +MODULE_LICENSE("GPL");
> 

-- 
Rayyan Ansari
https://ansari.sh

