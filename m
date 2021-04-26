Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6B336B100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 11:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbhDZJuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 05:50:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:55233 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232140AbhDZJuL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 05:50:11 -0400
IronPort-SDR: amIMc9JJK+7aVvPs3+47eY+ps9pXqYFt61rz5OYUqe2qkijYxAXaATg8SWTbQJlkEVXjHz+YY5
 mmVeGTssGpUQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="176426689"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="176426689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:49:27 -0700
IronPort-SDR: vs5BZcUq0OtRa5CxalVxssJS7zEAvmUK9TGBLlHoot0gHfr67UYB5QJ1E2qsMDGTSbtouCFgN6
 1vHMq0P8eCSQ==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="429335773"
Received: from unknown (HELO localhost) ([10.252.50.197])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:49:20 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Rajeev Nandan <rajeevny@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     mkrishn@codeaurora.org, Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
        dianders@chromium.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        Lyude Paul <lyude@redhat.com>,
        "Lankhorst\, Maarten" <maarten.lankhorst@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>,
        intel-gfx@lists.freedesktop.org
Subject: Re: [v3 2/2] backlight: Add DisplayPort aux backlight driver
In-Reply-To: <1619416756-3533-3-git-send-email-rajeevny@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org> <1619416756-3533-3-git-send-email-rajeevny@codeaurora.org>
Date:   Mon, 26 Apr 2021 12:49:16 +0300
Message-ID: <87zgxl5qar.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Apr 2021, Rajeev Nandan <rajeevny@codeaurora.org> wrote:
> Add backlight driver for the panels supporting backlight control
> using DPCD registers on the DisplayPort aux channel.

No, please don't do this.

I wrote you last week in reply to v1 why I thought merging this would
not be a good idea [1]. Why have you sent two versions since then
without replying to me, or Cc'ing me or Lyude?

I think it's an even worse idea to merge this to
drivers/video/backlight. With DP AUX backlight you can't pretend it's
just an independent aux interface for backlight without everything else
around it. It's not independent of eDP, and exposing it as a direct
backlight sysfs interface bypasses the encoder.

And it still remains that there is existing DP AUX backlight code in
use, in the tree, with more features than this, with plans and
previously submitted patches to lift from one driver to drm core, and
with patches to add support to another driver.

I don't say this lightly, or very often at all, but,

NAK.


BR,
Jani.


[1] https://lore.kernel.org/dri-devel/871rb5bcf9.fsf@intel.com/

>
> Changes in v2:
> - New (most of the code reused from drm_dp_aux_backlight.c of v1)
>
> Changes in v3:
> - Add missing ';' to fix module compilation (kernel test bot)
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  drivers/video/backlight/Kconfig            |   7 +
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/dp_aux_backlight.c | 245 +++++++++++++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 drivers/video/backlight/dp_aux_backlight.c
>
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d83c87b..82c88f0 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -456,6 +456,13 @@ config BACKLIGHT_LED
>  	  If you have a LCD backlight adjustable by LED class driver, say Y
>  	  to enable this driver.
>  
> +config BACKLIGHT_DP_AUX
> +       tristate "DisplayPort aux backlight driver"
> +       depends on DRM && DRM_KMS_HELPER
> +       help
> +         If you have a panel backlight controlled by DPCD registers
> +         on the DisplayPort aux channel, say Y to enable this driver.
> +
>  endif # BACKLIGHT_CLASS_DEVICE
>  
>  endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 685f3f1..ba23c7c 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>  obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>  obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
>  obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> +obj-$(CONFIG_BACKLIGHT_DP_AUX)		+= dp_aux_backlight.o
> diff --git a/drivers/video/backlight/dp_aux_backlight.c b/drivers/video/backlight/dp_aux_backlight.c
> new file mode 100644
> index 00000000..3398383
> --- /dev/null
> +++ b/drivers/video/backlight/dp_aux_backlight.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Backlight driver to control the brightness over DisplayPort aux channel.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <drm/drm_dp_helper.h>
> +
> +#define DP_AUX_MAX_BRIGHTNESS		0xffff
> +
> +/**
> + * struct dp_aux_backlight - DisplayPort aux backlight data
> + * @dev: pointer to our device.
> + * @aux: the DisplayPort aux channel.
> + * @enable_gpio: the backlight enable gpio.
> + * @enabled: true if backlight is enabled else false.
> + */
> +struct dp_aux_backlight {
> +	struct device *dev;
> +	struct drm_dp_aux *aux;
> +	struct gpio_desc *enable_gpio;
> +	bool enabled;
> +};
> +
> +static struct drm_dp_aux *i2c_to_aux(struct i2c_adapter *i2c)
> +{
> +	return container_of(i2c, struct drm_dp_aux, ddc);
> +}
> +
> +static int dp_aux_backlight_enable(struct dp_aux_backlight *aux_bl)
> +{
> +	u8 val = 0;
> +	int ret;
> +
> +	if (aux_bl->enabled)
> +		return 0;
> +
> +	/* Set backlight control mode */
> +	ret = drm_dp_dpcd_readb(aux_bl->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
> +				&val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
> +	val |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> +	ret = drm_dp_dpcd_writeb(aux_bl->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
> +				 val);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Enable backlight */
> +	ret = drm_dp_dpcd_readb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
> +				&val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val |= DP_EDP_BACKLIGHT_ENABLE;
> +	ret = drm_dp_dpcd_writeb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
> +				 val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (aux_bl->enable_gpio)
> +		gpiod_set_value(aux_bl->enable_gpio, 1);
> +
> +	aux_bl->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int dp_aux_backlight_disable(struct dp_aux_backlight *aux_bl)
> +{
> +	u8 val = 0;
> +	int ret;
> +
> +	if (!aux_bl->enabled)
> +		return 0;
> +
> +	if (aux_bl->enable_gpio)
> +		gpiod_set_value(aux_bl->enable_gpio, 0);
> +
> +	ret = drm_dp_dpcd_readb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
> +				&val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val &= ~DP_EDP_BACKLIGHT_ENABLE;
> +	ret = drm_dp_dpcd_writeb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
> +				 val);
> +	if (ret < 0)
> +		return ret;
> +
> +	aux_bl->enabled = false;
> +
> +	return 0;
> +}
> +
> +static int dp_aux_backlight_update_status(struct backlight_device *bd)
> +{
> +	struct dp_aux_backlight *aux_bl = bl_get_data(bd);
> +	u16 brightness = backlight_get_brightness(bd);
> +	u8 val[2] = { 0x0 };
> +	int ret = 0;
> +
> +	if (brightness > 0) {
> +		val[0] = brightness >> 8;
> +		val[1] = brightness & 0xff;
> +		ret = drm_dp_dpcd_write(aux_bl->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
> +					val, sizeof(val));
> +		if (ret < 0)
> +			return ret;
> +
> +		dp_aux_backlight_enable(aux_bl);
> +	} else {
> +		dp_aux_backlight_disable(aux_bl);
> +	}
> +
> +	return 0;
> +}
> +
> +static int dp_aux_backlight_get_brightness(struct backlight_device *bd)
> +{
> +	struct dp_aux_backlight *aux_bl = bl_get_data(bd);
> +	u8 val[2] = { 0x0 };
> +	int ret = 0;
> +
> +	if (backlight_is_blank(bd))
> +		return 0;
> +
> +	ret = drm_dp_dpcd_read(aux_bl->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
> +			       &val, sizeof(val));
> +	if (ret < 0)
> +		return ret;
> +
> +	return (val[0] << 8 | val[1]);
> +}
> +
> +static const struct backlight_ops aux_bl_ops = {
> +	.update_status = dp_aux_backlight_update_status,
> +	.get_brightness = dp_aux_backlight_get_brightness,
> +};
> +
> +
> +static int dp_aux_backlight_probe(struct platform_device *pdev)
> +{
> +	struct dp_aux_backlight *aux_bl;
> +	struct backlight_device *bd;
> +	struct backlight_properties bl_props = { 0 };
> +	struct device_node *np;
> +	struct i2c_adapter *ddc;
> +	int ret = 0;
> +	u32 val;
> +
> +	aux_bl = devm_kzalloc(&pdev->dev, sizeof(*aux_bl), GFP_KERNEL);
> +	if (!aux_bl)
> +		return -ENOMEM;
> +
> +	aux_bl->dev = &pdev->dev;
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> +	if (!np) {
> +		dev_err(&pdev->dev, "failed to get aux ddc I2C bus\n");
> +		return -ENODEV;
> +	}
> +
> +	ddc = of_find_i2c_adapter_by_node(np);
> +	of_node_put(np);
> +	if (!ddc)
> +		return -EPROBE_DEFER;
> +
> +	aux_bl->aux = i2c_to_aux(ddc);
> +	dev_dbg(&pdev->dev, "using dp aux %s\n", aux_bl->aux->name);
> +
> +	aux_bl->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> +					     GPIOD_OUT_LOW);
> +	if (IS_ERR(aux_bl->enable_gpio)) {
> +		ret = PTR_ERR(aux_bl->enable_gpio);
> +		goto free_ddc;
> +	}
> +
> +	val = DP_AUX_MAX_BRIGHTNESS;
> +	of_property_read_u32(pdev->dev.of_node, "max-brightness", &val);
> +	if (val > DP_AUX_MAX_BRIGHTNESS)
> +		val = DP_AUX_MAX_BRIGHTNESS;
> +
> +	bl_props.max_brightness = val;
> +	bl_props.brightness = val;
> +	bl_props.type = BACKLIGHT_RAW;
> +	bd = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
> +					    &pdev->dev, aux_bl,
> +					    &aux_bl_ops, &bl_props);
> +	if (IS_ERR(bd)) {
> +		ret = PTR_ERR(bd);
> +		dev_err(&pdev->dev,
> +			      "failed to register backlight (%d)\n", ret);
> +		goto free_ddc;
> +	}
> +
> +	platform_set_drvdata(pdev, bd);
> +
> +	return 0;
> +
> +free_ddc:
> +	if (ddc)
> +		put_device(&ddc->dev);
> +
> +	return ret;
> +}
> +
> +static int dp_aux_backlight_remove(struct platform_device *pdev)
> +{
> +	struct backlight_device *bd = platform_get_drvdata(pdev);
> +	struct dp_aux_backlight *aux_bl = bl_get_data(bd);
> +	struct i2c_adapter *ddc = &aux_bl->aux->ddc;
> +
> +	if (ddc)
> +		put_device(&ddc->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id dp_aux_bl_of_match_table[] = {
> +	{ .compatible = "dp-aux-backlight"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dp_aux_bl_of_match_table);
> +
> +static struct platform_driver dp_aux_backlight_driver = {
> +	.driver = {
> +		.name = "dp-aux-backlight",
> +		.of_match_table = dp_aux_bl_of_match_table,
> +	},
> +	.probe = dp_aux_backlight_probe,
> +	.remove = dp_aux_backlight_remove,
> +
> +};
> +module_platform_driver(dp_aux_backlight_driver);
> +
> +MODULE_DESCRIPTION("DisplayPort aux backlight driver");
> +MODULE_LICENSE("GPL v2");

-- 
Jani Nikula, Intel Open Source Graphics Center
