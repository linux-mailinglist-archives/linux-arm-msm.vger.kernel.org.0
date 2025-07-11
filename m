Return-Path: <linux-arm-msm+bounces-64620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA00BB02060
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 17:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDA457AD615
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8252EA475;
	Fri, 11 Jul 2025 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="at/Xr9lZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C02D9798;
	Fri, 11 Jul 2025 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752247524; cv=none; b=TvlJEBGfD4ox/u0dHKEiMFQOVYACIlB6UXAgawly0x2Snb4XQvdYVPwbZrfPVtclus6hGGqmJHnzNu19becX8wEY9UpN3znY0gWKWqW8A/Rm72QW2SQcf+CUkL6YiI24N23/JwY9gEo1QDbHFt2RIbYv/RlvZ/nqYXKRE5wdhl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752247524; c=relaxed/simple;
	bh=Wf3JWwN8081TtjrLl6vJ2R2VgeFGwG8YzPP5eev7rGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dta0q3FFfAO9frN/rTatQrSvXa0xClhudbqKYeNf20h3DqMGymJUCvAS9W9UpDeDvrZ9JQ84ckgp7/0cBlbjwFd8wMq0+O6T0uqh6Zj8+P7zBUW/2YSMBGTuD1EEAg3uIkQdjfBGXLuekAo0VURjwGBURz3q03ySvo+ulbohbuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=at/Xr9lZ; arc=none smtp.client-ip=80.12.242.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id aFTiuzGQNILtwaFTiuBCqB; Fri, 11 Jul 2025 17:16:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1752246960;
	bh=nN7qPQP5pp6kCV7tadKRbnGGNhznnTzU1ksIiuQDnGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=at/Xr9lZ8WmJepdNd5EHNd1CYfSbz+k6x1+4LOYrs7Oonuxkrk5kRpG2zgl3EO/yr
	 r9CKj79p6vNLrNA34t9n9kchtvybRlgxBBU1oO0prY1xtbX0vdNo5FodYPnb6c5alE
	 FXC6tPLCHponbDyIw0dQ/fxYI/XddDqtEhJcuF6mPsLp9SRsFXlfNvFSkPwWytVP4O
	 caPRpZTp3vBbFok/HXlw6INc+vlJYnC+0YMRciQMOzDzP0vrIdBF2t8JM6CeRnM9iI
	 s53pY8aug2lkxyxE51uMYHuW9NLbTUW5ABWcl1za4kLRrWEjBLKVp95hgW3cyR7Z8J
	 MhWVOTcPHJvqA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 11 Jul 2025 17:16:00 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <0acde3b4-a437-4fa1-b5bd-fe1810309bb8@wanadoo.fr>
Date: Fri, 11 Jul 2025 17:15:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/07/2025 à 05:00, Alexey Klimov a écrit :
> The audio codec is found in Qualcomm PM2250/PM4125 PMICs and is used on
> platforms like Qualcomm QCM2290. It has soundwire interface and
> corresponding RX and TX slave devices.
> 
> It has only two input channels: HPH left and right. The line output (LO)
> is linked to HPHL so the hardware has some limitations regarding concurrent
> playback via HPH and LO for instance.
> 
> The codec driver also uses WCD MBCH framework. The MBHC functionality is
> implemented in a minimalistic way to enable IRQs and avoid different
> issues with IRQs.

Hi,
...

> +static int pm4125_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pm4125_sdw_priv *priv;
> +	u8 master_ch_mask[PM4125_MAX_SWR_CH_IDS];
> +	int master_ch_mask_size = 0;
> +	int ret, i;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Port map index starts at 0, however the data port for this codec starts at index 1 */
> +	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
> +		priv->is_tx = true;
> +		ret = of_property_read_u32_array(dev->of_node, "qcom,tx-port-mapping",
> +						 &pdev->m_port_map[1], PM4125_MAX_TX_SWR_PORTS);
> +	} else
> +		ret = of_property_read_u32_array(dev->of_node, "qcom,rx-port-mapping",
> +						 &pdev->m_port_map[1], PM4125_MAX_SWR_PORTS);

Nitpick: If a branch of an if needs { }, I think that both should have.

> +
> +	if (ret < 0)
> +		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
> +			 priv->is_tx ? "TX" : "RX", ret);
> +
> +	priv->sdev = pdev;
> +	dev_set_drvdata(dev, priv);

...

> +static const struct sdw_device_id pm4125_slave_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x10c, 0), /* Soundwire pm4125 RX/TX Device ID */
> +	{ },

No need for a trailing comma after a terminator

> +};
> +MODULE_DEVICE_TABLE(sdw, pm4125_slave_id);

...

> +#include <linux/component.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <sound/jack.h>

Maybe, keep alphabetical order?

> +#include <sound/pcm_params.h>
> +#include <sound/pcm.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>

...

> +static int pm4125_bind(struct device *dev)

If an error occures at some point, should things be undone before returning?

> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Give the soundwire subdevices some more time to settle */
> +	usleep_range(15000, 15010);
> +
> +	ret = component_bind_all(dev, pm4125);
> +	if (ret) {
> +		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm4125->rxdev = pm4125_sdw_device_get(pm4125->rxnode);
> +	if (!pm4125->rxdev) {
> +		dev_err(dev, "could not find rxslave with matching of node\n");
> +		return -EINVAL;
> +	}
> +
> +	pm4125->sdw_priv[AIF1_PB] = dev_get_drvdata(pm4125->rxdev);
> +	pm4125->sdw_priv[AIF1_PB]->pm4125 = pm4125;
> +
> +	pm4125->txdev = pm4125_sdw_device_get(pm4125->txnode);
> +	if (!pm4125->txdev) {
> +		dev_err(dev, "could not find txslave with matching of node\n");
> +		return -EINVAL;
> +	}
> +
> +	pm4125->sdw_priv[AIF1_CAP] = dev_get_drvdata(pm4125->txdev);
> +	pm4125->sdw_priv[AIF1_CAP]->pm4125 = pm4125;
> +
> +	pm4125->tx_sdw_dev = dev_to_sdw_dev(pm4125->txdev);
> +	if (!pm4125->tx_sdw_dev) {
> +		dev_err(dev, "could not get txslave with matching of dev\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * As TX is the main CSR reg interface, which should not be suspended first.
> +	 * expicilty add the dependency link
> +	 */
> +	if (!device_link_add(pm4125->rxdev, pm4125->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink TX and RX\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!device_link_add(dev, pm4125->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink PM4125 and TX\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!device_link_add(dev, pm4125->rxdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink PM4125 and RX\n");
> +		return -EINVAL;
> +	}
> +
> +	pm4125->regmap = dev_get_regmap(&pm4125->tx_sdw_dev->dev, NULL);
> +	if (!pm4125->regmap) {
> +		dev_err(dev, "could not get TX device regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = pm4125_irq_init(pm4125, dev);
> +	if (ret) {
> +		dev_err(dev, "IRQ init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm4125->sdw_priv[AIF1_PB]->slave_irq = pm4125->virq;
> +	pm4125->sdw_priv[AIF1_CAP]->slave_irq = pm4125->virq;
> +
> +	ret = pm4125_set_micbias_data(pm4125);
> +	if (ret < 0) {
> +		dev_err(dev, "Bad micbias pdata\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_register_component(dev, &soc_codec_dev_pm4125,
> +					 pm4125_dais, ARRAY_SIZE(pm4125_dais));
> +	if (ret)
> +		dev_err(dev, "Codec registration failed\n");
> +
> +	return ret;
> +}
> +
> +static void pm4125_unbind(struct device *dev)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dev);
> +
> +	snd_soc_unregister_component(dev);
> +	device_link_remove(dev, pm4125->txdev);
> +	device_link_remove(dev, pm4125->rxdev);
> +	device_link_remove(pm4125->rxdev, pm4125->txdev);
> +	component_unbind_all(dev, pm4125);
> +}
> +
> +static const struct component_master_ops pm4125_comp_ops = {
> +	.bind = pm4125_bind,
> +	.unbind = pm4125_unbind,
> +};
> +
> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125, struct device *dev,
> +				       struct component_match **matchptr)
> +{
> +	struct device_node *np = dev->of_node;
> +
> +	pm4125->rxnode = of_parse_phandle(np, "qcom,rx-device", 0);
> +	if (!pm4125->rxnode)
> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,rx-device\n");
> +	component_match_add_release(dev, matchptr, component_release_of, component_compare_of,
> +				    pm4125->rxnode);
> +	of_node_put(pm4125->rxnode);
> +
> +	pm4125->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
> +	if (!pm4125->txnode)
> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,tx-device\n");
> +	component_match_add_release(dev, matchptr, component_release_of, component_compare_of,
> +				    pm4125->txnode);
> +	of_node_put(pm4125->txnode);
> +
> +	return 0;
> +}
> +
> +static int pm4125_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct pm4125_priv *pm4125;
> +	struct wcd_mbhc_config *cfg;
> +	int ret;
> +
> +	pm4125 = devm_kzalloc(dev, sizeof(*pm4125), GFP_KERNEL);
> +	if (!pm4125)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, pm4125);
> +
> +	pm4125->supplies[0].supply = "vdd-io";
> +	pm4125->supplies[1].supply = "vdd-cp";
> +	pm4125->supplies[2].supply = "vdd-mic-bias";
> +	pm4125->supplies[3].supply = "vdd-pa-vpos";
> +
> +	ret = devm_regulator_bulk_get(dev, PM4125_MAX_BULK_SUPPLY, pm4125->supplies);

devm_regulator_bulk_get_enable() could certainly be used to save a few 
lines of code after fix the missing regulator_bulk_disable() in the 
error handling of the probe.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get supplies\n");
> +
> +	ret = regulator_bulk_enable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
> +
> +	pm4125->spmi_regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!pm4125->spmi_regmap)
> +		return -ENXIO;
> +
> +	pm4125_reset(pm4125);
> +
> +	pm4125_dt_parse_micbias_info(dev, pm4125);
> +
> +	cfg = &pm4125->mbhc_cfg;
> +	cfg->mbhc_micbias = MIC_BIAS_2;
> +	cfg->anc_micbias = MIC_BIAS_2;
> +	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
> +	cfg->num_btn = PM4125_MBHC_MAX_BUTTONS;
> +	cfg->micb_mv = pm4125->micb2_mv;
> +	cfg->linein_th = 5000;
> +	cfg->hs_thr = 1700;
> +	cfg->hph_thr = 50;
> +
> +	wcd_dt_parse_mbhc_data(dev, &pm4125->mbhc_cfg);
> +
> +	ret = pm4125_add_slave_components(pm4125, dev, &match);
> +	if (ret)
> +		return ret;
> +
> +	ret = component_master_add_with_match(dev, &pm4125_comp_ops, match);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +}
> +
> +static void pm4125_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dev);
> +
> +	component_master_del(&pdev->dev, &pm4125_comp_ops);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +	regulator_bulk_disable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);

Is it correct? (it looks related to devm_regulator_bulk_get())

> +}

CJ

