Return-Path: <linux-arm-msm+bounces-36696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 674AE9B8CB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 09:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26DC12851E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FD0157476;
	Fri,  1 Nov 2024 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvikfbaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0841156F3B;
	Fri,  1 Nov 2024 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448780; cv=none; b=QMJ4EvmU7CG8wxF9jaygOwSyeu/LA8H5qL3EAqTYGuqcmRgrKMzWiwAcA9G/7L9R2etfHY3ISJJuAsY9DwyzjkSzVjFHQKzGW3k1njp323VTpbYSLBV/WhEFGM9cCaCSNMmc1EzlsvsJichXGoCn570VGgb9aKCWhB8XoaXx0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448780; c=relaxed/simple;
	bh=KNXRmtegvtYDFQlWEKb1lsAhJx2U17yDfkpLygKNNt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VquzEbJEQ+tKTQkV1ybcLmOC8tNWUMvpK9l+mVk/9M3bJey37YXbC8VcPl31a6D7n/Z0c8eHsRpmJDz1RMsRcdXyMVZ1riddJNBIdupEkU6vLwEoExMIqyiD3bnk82EU4SUajD3hABEoEojrD0lsXZbo0bREhcuzzSl2ag4iMcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvikfbaU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F408C4CED1;
	Fri,  1 Nov 2024 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730448780;
	bh=KNXRmtegvtYDFQlWEKb1lsAhJx2U17yDfkpLygKNNt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvikfbaUPuWSpi1yXfTibo3+0Zd0PCYXqCBxKk8PSYRW+vIe8aq1U6mfsdBrIp881
	 Fhdf8EPYz55gOpX7wwcEAXo3I+g973GFwDL8QlaiBlunw0LAItfJM2GfKcMHF6u+up
	 ENFi/y29/UZ3iFt26SB8KnzO4epkUcNJb1okWKHMCdOluFg9Bm9WWJFhYYJ+AU9AOU
	 xnNISSXcmSYipgTIQC7KDnnMUhjD7DzT5UbCsBaIFQYwo+Fua2asc864zguHqFKvCR
	 vAEPNs/rJQIFYG0K6p+KTnyvpt7QbAtMicKTnaQ0CKROA4HzU26Ra2uq1wGyt/7LPr
	 4B6wHXnzjY6Bg==
Date: Fri, 1 Nov 2024 09:12:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/10] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
Message-ID: <jqsa7lsypf62uqjydqbyspvtnt7iuwxclfwuyatgee2zgduwvd@4wwagvovam4k>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-8-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101053154.497550-8-alexey.klimov@linaro.org>

On Fri, Nov 01, 2024 at 05:31:51AM +0000, Alexey Klimov wrote:
> Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
> family of amplifiers. Such amplifiers is primarily interfaced with
> SoundWire but they also support analog mode which is configurable
> by setting one of the pins to high/low. In such case the WSA881X
> amplifier is configurable only using i2c.
> 
> To have stereo two WSA881X amplifiers are required but mono
> configurations are also possible.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/Kconfig          |   11 +
>  sound/soc/codecs/Makefile         |    2 +
>  sound/soc/codecs/wsa881x-common.h |   19 +
>  sound/soc/codecs/wsa881x-i2c.c    | 1454 +++++++++++++++++++++++++++++
>  4 files changed, 1486 insertions(+)
>  create mode 100644 sound/soc/codecs/wsa881x-i2c.c
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index b8ea8cf73d63..3d7868977262 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -350,6 +350,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_WM9712
>  	imply SND_SOC_WM9713
>  	imply SND_SOC_WSA881X
> +	imply SND_SOC_WSA881X_I2C
>  	imply SND_SOC_WSA883X
>  	imply SND_SOC_WSA884X
>  	imply SND_SOC_ZL38060
> @@ -2484,6 +2485,16 @@ config SND_SOC_WSA881X
>  	  This enables support for Qualcomm WSA8810/WSA8815 Class-D
>  	  Smart Speaker Amplifier.
>  
> +config SND_SOC_WSA881X_I2C
> +	tristate "WSA881X Codec - Analog mode"
> +	depends on I2C
> +	select REGMAP_I2C
> +	select SND_SOC_WSA881X_COMMON
> +	help
> +	  This enables support for Qualcomm WSA8810/WSA8815 Class-D Smart
> +	  Speaker Amplifier that works in analog mode and configurable
> +	  via I2C.
> +
>  config SND_SOC_WSA883X
>  	tristate "WSA883X Codec"
>  	depends on SOUNDWIRE
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index bc1498cedf08..682bdf63abea 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -399,6 +399,7 @@ snd-soc-wm9713-y := wm9713.o
>  snd-soc-wm-hubs-y := wm_hubs.o
>  snd-soc-wsa881x-y := wsa881x.o
>  snd-soc-wsa881x-common-y := wsa881x-common.o
> +snd-soc-wsa881x-i2c-y := wsa881x-i2c.o
>  snd-soc-wsa883x-y := wsa883x.o
>  snd-soc-wsa884x-y := wsa884x.o
>  snd-soc-zl38060-y := zl38060.o
> @@ -821,6 +822,7 @@ obj-$(CONFIG_SND_SOC_WM_ADSP)	+= snd-soc-wm-adsp.o
>  obj-$(CONFIG_SND_SOC_WM_HUBS)	+= snd-soc-wm-hubs.o
>  obj-$(CONFIG_SND_SOC_WSA881X)	+= snd-soc-wsa881x.o
>  obj-$(CONFIG_SND_SOC_WSA881X_COMMON)	+= snd-soc-wsa881x-common.o
> +obj-$(CONFIG_SND_SOC_WSA881X_I2C)	+= snd-soc-wsa881x-i2c.o
>  obj-$(CONFIG_SND_SOC_WSA883X)	+= snd-soc-wsa883x.o
>  obj-$(CONFIG_SND_SOC_WSA884X)	+= snd-soc-wsa884x.o
>  obj-$(CONFIG_SND_SOC_ZL38060)	+= snd-soc-zl38060.o
> diff --git a/sound/soc/codecs/wsa881x-common.h b/sound/soc/codecs/wsa881x-common.h
> index cf8643e1f7f7..1b9c20cd3807 100644
> --- a/sound/soc/codecs/wsa881x-common.h
> +++ b/sound/soc/codecs/wsa881x-common.h
> @@ -2,6 +2,7 @@
>  #ifndef __WSA881x_COMMON_H__
>  #define __WSA881x_COMMON_H__
>  
> +#include <linux/i2c.h>
>  #include <linux/soundwire/sdw.h>
>  #include <sound/soc.h>
>  
> @@ -193,6 +194,24 @@ struct wsa881x_priv {
>  	bool port_enable[WSA881X_MAX_SWR_PORTS];
>  #endif
>  
> +#if IS_ENABLED(CONFIG_SND_SOC_WSA881X_I2C)
> +	/* i2c interace for analog mode */
> +	struct regmap *regmap_analog;
> +	/* First client is for digital part, the second is for analog part */
> +	struct i2c_client *client[2];
> +	struct snd_soc_component *component;
> +	struct snd_soc_dai_driver *dai_driver;
> +	struct snd_soc_component_driver *driver;
> +	struct gpio_desc *mclk_pin;
> +	struct clk *wsa_mclk;
> +	bool boost_enable;
> +	int spk_pa_gain;
> +	struct i2c_msg xfer_msg[2];
> +	bool regmap_flag;
> +	bool wsa_active;
> +	int index;
> +	int version;
> +#endif
>  	struct gpio_desc *sd_n;
>  	/*
>  	 * Logical state for SD_N GPIO: high for shutdown, low for enable.
> diff --git a/sound/soc/codecs/wsa881x-i2c.c b/sound/soc/codecs/wsa881x-i2c.c
> new file mode 100644
> index 000000000000..74fa85306ad9
> --- /dev/null
> +++ b/sound/soc/codecs/wsa881x-i2c.c
> @@ -0,0 +1,1454 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2016, 2018-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024, Linaro Limited
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/device.h>
> +#include <linux/printk.h>
> +#include <linux/bitops.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/gpio.h>
> +#include <linux/regmap.h>
> +#include "wsa881x-common.h"
> +
> +#define I2C_ANALOG_OFFSET		0x36
> +#define SPK_GAIN_12DB			4
> +
> +#define WSA881X_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
> +			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
> +			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
> +			SNDRV_PCM_RATE_384000)
> +/* Fractional Rates */
> +#define WSA881X_FRAC_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 |\
> +				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
> +
> +#define WSA881X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
> +			SNDRV_PCM_FMTBIT_S24_LE |\
> +			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
> +
> +#define WSA881X_I2C_DRV_NAME	"wsa881x_i2c_codec"
> +
> +#define WSA881X_I2C_SPK0_SLAVE0_ADDR	0x0E
> +#define WSA881X_I2C_SPK0_SLAVE1_ADDR	0x44
> +#define WSA881X_I2C_SPK1_SLAVE0_ADDR	0x0F
> +#define WSA881X_I2C_SPK1_SLAVE1_ADDR	0x45
> +#define WSA881X_I2C_SPK0_SLAVE0		0
> +#define WSA881X_I2C_SPK1_SLAVE0		1
> +
> +#define MAX_WSA881X_DEVICE		2
> +#define WSA881X_DIGITAL_SLAVE		0
> +#define WSA881X_ANALOG_SLAVE		1
> +
> +enum {
> +	WSA881X_1_X = 0,
> +	WSA881X_2_0,
> +};
> +
> +#define WSA881X_IS_2_0(ver)		((ver == WSA881X_2_0) ? 1 : 0)
> +
> +struct reg_default wsa881x_ana_reg_defaults[] = {

Not const?

Same question everywhere further.

> +	{WSA881X_CHIP_ID0, 0x00},
> +	{WSA881X_CHIP_ID1, 0x00},
> +	{WSA881X_CHIP_ID2, 0x00},
> +	{WSA881X_CHIP_ID3, 0x02},
> +	{WSA881X_BUS_ID, 0x00},
> +	{WSA881X_CDC_RST_CTL, 0x00},
> +	{WSA881X_CDC_TOP_CLK_CTL, 0x03},
> +	{WSA881X_CDC_ANA_CLK_CTL, 0x00},
> +	{WSA881X_CDC_DIG_CLK_CTL, 0x00},
> +	{WSA881X_CLOCK_CONFIG, 0x00},
> +

...

> +static const struct i2c_device_id wsa881x_i2c_id[];
> +
> +static void wsa881x_reset(struct wsa881x_priv *pdata, bool enable);
> +static int wsa881x_startup(struct wsa881x_priv *pdata);
> +static void wsa881x_shutdown(struct wsa881x_priv *pdata);
> +
> +static int delay_array_msec[] = {10, 20, 30, 40, 50};

Not const?

> +
> +static const char * const wsa881x_spk_pa_gain_text[] = {
> +"POS_13P5_DB", "POS_12_DB", "POS_10P5_DB", "POS_9_DB", "POS_7P5_DB",
> +"POS_6_DB", "POS_4P5_DB", "POS_3_DB", "POS_1P5_DB", "POS_0_DB"};
> +
> +static const struct soc_enum wsa881x_spk_pa_gain_enum[] = {
> +		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa881x_spk_pa_gain_text),
> +				    wsa881x_spk_pa_gain_text),
> +};
> +
> +static int wsa881x_spk_pa_gain_get(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +			snd_soc_kcontrol_component(kcontrol);
> +	struct wsa881x_priv *wsa881x =
> +			snd_soc_component_get_drvdata(component);
> +
> +	ucontrol->value.integer.value[0] = wsa881x->spk_pa_gain;
> +
> +	dev_dbg(component->dev, "spk_pa_gain = %ld\n",
> +		ucontrol->value.integer.value[0]);
> +	return 0;
> +}

...

> +
> +static unsigned int wsa881x_i2c_read(struct snd_soc_component *component,
> +				     unsigned int reg)
> +{
> +	struct wsa881x_priv *wsa881x;
> +
> +	wsa881x = snd_soc_component_get_drvdata(component);
> +	if (!wsa881x->wsa_active)
> +		return 0;
> +
> +	return wsa881x_i2c_read_device(wsa881x, reg);
> +}
> +
> +static int wsa881x_i2c_write(struct snd_soc_component *component,
> +			     unsigned int reg, unsigned int val)
> +{
> +	struct wsa881x_priv *wsa881x;
> +
> +	wsa881x = snd_soc_component_get_drvdata(component);
> +	if (!wsa881x->wsa_active)
> +		return 0;

This looks like buggy driver: you do not know when your driver is
pwoerdown. DAPM code knows, so should the driver.

> +
> +	return wsa881x_i2c_write_device(wsa881x, reg, val);
> +}
> +
> +static int wsa881x_i2c_get_client_index(struct i2c_client *client,
> +					int *wsa881x_index)
> +{
> +	int ret = 0;
> +
> +	switch (client->addr) {
> +	case WSA881X_I2C_SPK0_SLAVE0_ADDR:
> +	case WSA881X_I2C_SPK0_SLAVE1_ADDR:
> +		*wsa881x_index = WSA881X_I2C_SPK0_SLAVE0;
> +	break;
> +	case WSA881X_I2C_SPK1_SLAVE0_ADDR:
> +	case WSA881X_I2C_SPK1_SLAVE1_ADDR:
> +		*wsa881x_index = WSA881X_I2C_SPK1_SLAVE0;
> +	break;
> +	default:
> +		ret = -EINVAL;
> +	break;
> +	}
> +	return ret;
> +}
> +

...

> +static void wsa881x_clk_ctrl(struct snd_soc_component *component, bool enable)
> +{
> +	struct wsa881x_priv *wsa881x =
> +				snd_soc_component_get_drvdata(component);
> +
> +	dev_dbg(component->dev, "%s:ss enable:%d\n", __func__, enable);

Please drop all tracing-like debugs from final code.

...

> +static int wsa881x_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct wsa881x_priv *wsa881x;
> +	int wsa881x_index = 0;
> +	int ret;
> +
> +	ret = wsa881x_probe_common(&wsa881x, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = wsa881x_i2c_get_client_index(client, &wsa881x_index);
> +	if (ret) {
> +		dev_err(dev, "get codec I2C client failed\n");
> +		return ret;
> +	}
> +	wsa881x->index = wsa881x_index;

I cannot find how this is used. Your entire I2C address detection seems
odd and not used at all. None of the I2C drivers are supposed to do
this.

> +
> +	wsa881x->mclk_pin = devm_gpiod_get(dev, "mclk",
> +					   GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> +	if (IS_ERR(wsa881x->mclk_pin))
> +		dev_err_probe(dev, PTR_ERR(wsa881x->mclk_pin),
> +			      "MCLK GPIO not found\n");
> +
> +	wsa881x->wsa_mclk = devm_clk_get(&client->dev, "wsa_mclk");
> +	if (IS_ERR(wsa881x->wsa_mclk))
> +		return dev_err_probe(dev, PTR_ERR(wsa881x->wsa_mclk),
> +				     "failed to get wsa_mclk\n");
> +	clk_set_rate(wsa881x->wsa_mclk, 9600000);
> +
> +	wsa881x->regmap = devm_regmap_init_i2c(client,
> +			&wsa881x_ana_regmap_config[WSA881X_DIGITAL_SLAVE]);
> +	if (IS_ERR(wsa881x->regmap)) {
> +		dev_err(dev, "digital regmap init failed %d\n", ret);
> +		return PTR_ERR(wsa881x->regmap);
> +	}
> +	regcache_cache_bypass(wsa881x->regmap, true);
> +
> +	wsa881x_reset(wsa881x, true);
> +
> +	wsa881x->client[WSA881X_DIGITAL_SLAVE] = client;
> +	ret = check_wsa881x_presence(wsa881x);
> +	if (ret < 0) {
> +		dev_err(&client->dev,
> +			"failed to ping wsa with addr:%x, ret = %d\n",
> +			client->addr, ret);
> +		return -ENODEV;
> +	}
> +
> +	wsa881x->version = wsa881x_i2c_read_device(wsa881x, WSA881X_CHIP_ID1);
> +	if (wsa881x->version == WSA881X_2_0) {
> +		wsa881x_update_reg_defaults_2_0();
> +		wsa881x_update_regmap_2_0(wsa881x->regmap,
> +					  WSA881X_DIGITAL_SLAVE);
> +	}
> +
> +	dev_dbg(dev, "i2c addr=%x, index = %d\n", client->addr, wsa881x_index);
> +	/*
> +	 * If we reached this point, then device is present and we're good to
> +	 * go to initialise analog part of codec
> +	 */
> +	wsa881x->client[WSA881X_ANALOG_SLAVE] =
> +		devm_i2c_new_dummy_device(&client->dev, client->adapter,
> +					  client->addr + I2C_ANALOG_OFFSET);
> +	if (IS_ERR(wsa881x->client[WSA881X_ANALOG_SLAVE])) {
> +		dev_err(dev,
> +			"failed to register i2c device for analog part\n");
> +		return PTR_ERR(wsa881x->client[WSA881X_ANALOG_SLAVE]);
> +	}
> +
> +	wsa881x->regmap_analog = devm_regmap_init_i2c(wsa881x->client[1],
> +			&wsa881x_ana_regmap_config[WSA881X_ANALOG_SLAVE]);
> +	if (IS_ERR(wsa881x->regmap_analog)) {
> +		dev_err(dev, "analog regmap init failed %d\n", ret);
> +		return PTR_ERR(wsa881x->regmap_analog);
> +	}
> +	regcache_cache_bypass(wsa881x->regmap_analog, true);
> +	wsa881x->client[WSA881X_ANALOG_SLAVE]->dev.platform_data = wsa881x;
> +	i2c_set_clientdata(wsa881x->client[WSA881X_ANALOG_SLAVE], wsa881x);
> +	wsa881x->regmap_flag = true;
> +	if (wsa881x->version == WSA881X_2_0)
> +		wsa881x_update_regmap_2_0(wsa881x->regmap_analog,
> +					  WSA881X_ANALOG_SLAVE);
> +	/* finished initialising analog part */
> +
> +	wsa881x->driver = devm_kzalloc(dev, sizeof(*wsa881x->driver),
> +				       GFP_KERNEL);
> +	if (!wsa881x->driver)
> +		return -ENOMEM;
> +
> +	memcpy(wsa881x->driver, &soc_codec_dev_wsa881x,
> +	       sizeof(*wsa881x->driver));

Why not devm_kmemdump?

> +	wsa881x->dai_driver = devm_kzalloc(dev,
> +					   sizeof(struct snd_soc_dai_driver),
> +					   GFP_KERNEL);
> +	if (!wsa881x->dai_driver)
> +		return -ENOMEM;
> +	memcpy(wsa881x->dai_driver, wsa_dai, sizeof(struct snd_soc_dai_driver));
> +
> +	wsa881x->driver->name = devm_kasprintf(dev, GFP_KERNEL,
> +					       "wsa-codec%d", wsa881x_index);
> +	if (!wsa881x->driver->name)
> +		return -ENOMEM;
> +
> +	wsa881x->dai_driver->name = devm_kasprintf(dev, GFP_KERNEL,
> +						   "wsa_rx%d", wsa881x_index);
> +	if (!wsa881x->dai_driver->name)
> +		return -ENOMEM;
> +
> +	wsa881x->dai_driver->playback.stream_name = devm_kasprintf(dev,
> +			GFP_KERNEL, "WSA881X_AIF%d Playback", wsa881x_index);
> +	if (!wsa881x->dai_driver->playback.stream_name)
> +		return -ENOMEM;
> +
> +	return devm_snd_soc_register_component(dev,
> +					       wsa881x->driver,
> +					       wsa881x->dai_driver,
> +					       ARRAY_SIZE(wsa_dai));
> +}
> +
> +static int __maybe_unused wsa881x_i2c_suspend(struct device *dev)
> +{
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
> +
> +	gpiod_direction_output(wsa881x->sd_n, wsa881x->sd_n_val);
> +	return 0;
> +}
> +
> +static int __maybe_unused wsa881x_i2c_resume(struct device *dev)
> +{
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
> +
> +	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops wsa881x_i2c_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(wsa881x_i2c_suspend, wsa881x_i2c_resume)
> +};
> +
> +static const struct i2c_device_id wsa881x_i2c_id[] = {
> +	{"wsa881x-i2c-dev", WSA881X_I2C_SPK0_SLAVE0_ADDR},
> +	{"wsa881x-i2c-dev", WSA881X_I2C_SPK1_SLAVE0_ADDR},

I don't understand why:
1. Two entries, instead of one
2. How are you using the match data
3. To which device the driver binds (to first one always?)
4. Why this is different than compatible - these are supposed to be in
sync, which will also point to redundant and actually not even correct "i2c-dev".

> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, wsa881x_i2c_id);
> +
> +static const struct of_device_id wsa881x_i2c_driver_table[] = {
> +	{.compatible = "qcom,qrb4210-wsa881x-i2c-codec"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, wsa881x_i2c_driver_table);
> +
> +static struct i2c_driver wsa881x_codec_driver = {
> +	.driver = {
> +		.name = "wsa881x-i2c-codec",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.pm = &wsa881x_i2c_pm_ops,
> +		.of_match_table = wsa881x_i2c_driver_table,
> +	},
> +	.id_table = wsa881x_i2c_id,
> +	.probe = wsa881x_i2c_probe,
> +};
> +
> +static int __init wsa881x_codec_init(void)
> +{
> +	return i2c_add_driver(&wsa881x_codec_driver);
> +}
> +module_init(wsa881x_codec_init);
> +
> +static void __exit wsa881x_codec_exit(void)
> +{
> +	i2c_del_driver(&wsa881x_codec_driver);
> +}
> +
> +module_exit(wsa881x_codec_exit);

Why this is just not module_i2c_driver?

Best regards,
Krzysztof


