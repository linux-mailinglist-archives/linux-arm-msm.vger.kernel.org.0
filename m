Return-Path: <linux-arm-msm+bounces-62582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD3AE9609
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 08:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBA0D7A5547
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 06:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E325E218EB1;
	Thu, 26 Jun 2025 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWfqdQRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD87E84D08;
	Thu, 26 Jun 2025 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918760; cv=none; b=RPU+sa1doMtDzWZDAJrB2YacKp8XLDRHSkgWoeykDx/0Z1REn9HmTmUUutSgashxs2nvJ9mhZ5/BZ9S0vRZtHJyaXPnMyfuf8gL7ltD3m8oANm6Kb0OotNbasf2n3wkJQT3EIwOi4onJj41GRF/EJI3Oz1b3pMJuFTzWAxwIkME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918760; c=relaxed/simple;
	bh=157V8rfjdPcHbSLGF7APh7M4LJRuUMf5w6H0TmCvdJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxgWK1TcNNwltEg0xNz2gnjMW6c03lKm3pGph2OeoxIXUA3B5k7m9LNtWUay6BAor3YUBpzqSz/Uu456eFCAsiIeap+Plga59BcRFWw20U0k9Dtu0f3m+UQMFy81L2yrt08RKjvqeANWLyTugjJKnxeUo8D8aI8C/lOcdJBF7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWfqdQRi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5193C4CEEB;
	Thu, 26 Jun 2025 06:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750918760;
	bh=157V8rfjdPcHbSLGF7APh7M4LJRuUMf5w6H0TmCvdJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWfqdQRisJ7ARrNz9x2/UdJudHttt0O4K4yKSs/IO8q5jVDtngmh2ykOHK+F30nRI
	 WC2Lydzs/VxgxJh/UBIwGJrgcuV9rEtgfCJPlM+AjcOFrpbuLTfyxenMAnY6loaKoJ
	 o0NVSOOzM4kexOFWKwKqUocms7klszjKgAWkkUMFlqQfW22E3hBf9sLUPfaBAQpQMh
	 q7eIqLxgRdGGfSLYn3kZ+p2zbYcJX7riPg5nwDKOtuo7W1n4LyGhnsUeNXNhzsK/u+
	 Yb5St3QUfbGh14Wk4aYA+9DpJLkba7rh5wdhO00VGcdHNHJ0sS7J9qqvmuMwQU6WzG
	 S2wpFR88Pk6kQ==
Date: Thu, 26 Jun 2025 08:19:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
Message-ID: <rr2qf7hw7lkwqozguz3cv4tg7eewzk4jkxx5bieydukemjko2h@pwtrakslklvn>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>

On Thu, Jun 26, 2025 at 12:50:31AM +0100, Alexey Klimov wrote:
> +
> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125,
> +				       struct device *dev,
> +				       struct component_match **matchptr)
> +{
> +	struct device_node *np = dev->of_node;
> +
> +	pm4125->rxnode = of_parse_phandle(np, "qcom,rx-device", 0);
> +	if (!pm4125->rxnode) {
> +		dev_err(dev, "Couldn't parse phandle to qcom,rx-device!\n");
> +		return -ENODEV;
> +	}
> +	of_node_get(pm4125->rxnode);

Where  do you clean this up?

> +	component_match_add_release(dev, matchptr, component_release_of,
> +				    component_compare_of, pm4125->rxnode);
> +
> +	pm4125->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
> +	if (!pm4125->txnode) {
> +		dev_err(dev, "Couldn't parse phandle to qcom,tx-device\n");
> +			return -ENODEV;

Messed indent. This should be anyway just one line as always - return
dev_err_probe.

> +	}
> +	of_node_get(pm4125->txnode);

And this?

> +	component_match_add_release(dev, matchptr, component_release_of,
> +				    component_compare_of, pm4125->txnode);
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
> +	cfg = &pm4125->mbhc_cfg;
> +	cfg->swap_gnd_mic = pm4125_swap_gnd_mic;
> +
> +	pm4125->supplies[0].supply = "vdd-io";
> +	pm4125->supplies[1].supply = "vdd-cp";
> +	pm4125->supplies[2].supply = "vdd-mic-bias";
> +	pm4125->supplies[3].supply = "vdd-pa-vpos";
> +
> +	ret = devm_regulator_bulk_get(dev, PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get supplies\n");
> +
> +	ret = regulator_bulk_enable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	if (ret) {
> +		regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);

Double free.

> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
> +	}
> +
> +	pm4125_dt_parse_micbias_info(dev, pm4125);
> +
> +	cfg->mbhc_micbias = MIC_BIAS_2;
> +	cfg->anc_micbias = MIC_BIAS_2;
> +	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
> +	cfg->num_btn = PM4125_MBHC_MAX_BUTTONS;
> +	cfg->micb_mv = pm4125->micb2_mv;
> +	cfg->linein_th = 5000;
> +	cfg->hs_thr = 1700;
> +	cfg->hph_thr = 50;
> +
> +	pm4125->spmi_regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!pm4125->spmi_regmap)
> +		return -ENXIO;
> +
> +	pm4125_reset(pm4125);
> +
> +	wcd_dt_parse_mbhc_data(dev, &pm4125->mbhc_cfg);
> +
> +	ret = pm4125_add_slave_components(pm4125, dev, &match);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	ret = component_master_add_with_match(dev, &pm4125_comp_ops, match);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +	regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
> +
> +	return ret;
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
> +}
> +
> +#if defined(CONFIG_OF)
> +static const struct of_device_id pm4125_of_match[] = {
> +	{ .compatible = "qcom,pm4125-codec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pm4125_of_match);
> +#endif
> +
> +static struct platform_driver pm4125_codec_driver = {
> +	.probe = pm4125_probe,
> +	.remove = pm4125_remove,
> +	.driver = {
> +		.name = "pm4125_codec",
> +		.of_match_table = of_match_ptr(pm4125_of_match),

Drop of_match_ptr and #if. We just removed it (or trying to )
everywhere, so why re-introducing it...

> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +module_platform_driver(pm4125_codec_driver);
> +MODULE_DESCRIPTION("PM4125 audio codec driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/pm4125.h b/sound/soc/codecs/pm4125.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2c5e8218202d92a0adc493413368991a406471b0
> --- /dev/null
> +++ b/sound/soc/codecs/pm4125.h
> @@ -0,0 +1,375 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _PM4125_REGISTERS_H
> +#define _PM4125_REGISTERS_H
> +
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +
> +#define PM4125_ANA_BASE_ADDR	0x3000
> +#define PM4125_DIG_BASE_ADDR	0x3400
> +
> +#define PM4125_REG(reg)	((reg > PM4125_DIG_BASE_ADDR) ? \
> +			 (reg - PM4125_DIG_BASE_ADDR) : \
> +			 (reg - PM4125_ANA_BASE_ADDR))
> +
> +enum {
> +	REG_NO_ACCESS,
> +	RD_REG,
> +	WR_REG,
> +	RD_WR_REG
> +};
> +
> +#define PM4125_ANA_MICBIAS_MICB_1_2_EN		(PM4125_ANA_BASE_ADDR+0x040)
> +#define PM4125_ANA_MICBIAS_MICB_3_EN		(PM4125_ANA_BASE_ADDR+0x041)
> +#define PM4125_ANA_MICBIAS_LDO_1_SETTING	(PM4125_ANA_BASE_ADDR+0x042)
> +#define PM4125_ANA_MICBIAS_LDO_1_CTRL		(PM4125_ANA_BASE_ADDR+0x043)
> +#define PM4125_ANA_TX_AMIC1			(PM4125_ANA_BASE_ADDR+0x047)
> +#define PM4125_ANA_TX_AMIC2			(PM4125_ANA_BASE_ADDR+0x048)
> +#define PM4125_ANA_MBHC_MECH			(PM4125_ANA_BASE_ADDR+0x05A)
> +#define PM4125_ANA_MBHC_ELECT			(PM4125_ANA_BASE_ADDR+0x05B)
> +#define PM4125_ANA_MBHC_ZDET			(PM4125_ANA_BASE_ADDR+0x05C)
> +#define PM4125_ANA_MBHC_RESULT_1		(PM4125_ANA_BASE_ADDR+0x05D)
> +#define PM4125_ANA_MBHC_RESULT_2		(PM4125_ANA_BASE_ADDR+0x05E)
> +#define PM4125_ANA_MBHC_RESULT_3		(PM4125_ANA_BASE_ADDR+0x05F)
> +#define PM4125_ANA_MBHC_BTN0_ZDET_VREF1		(PM4125_ANA_BASE_ADDR+0x060)
> +#define PM4125_ANA_MBHC_BTN1_ZDET_VREF2		(PM4125_ANA_BASE_ADDR+0x061)
> +#define PM4125_ANA_MBHC_BTN2_ZDET_VREF3		(PM4125_ANA_BASE_ADDR+0x062)
> +#define PM4125_ANA_MBHC_BTN3_ZDET_DBG_400	(PM4125_ANA_BASE_ADDR+0x063)
> +#define PM4125_ANA_MBHC_BTN4_ZDET_DBG_1400	(PM4125_ANA_BASE_ADDR+0x064)
> +#define PM4125_ANA_MBHC_MICB2_RAMP		(PM4125_ANA_BASE_ADDR+0x065)
> +#define PM4125_ANA_MBHC_CTL_1			(PM4125_ANA_BASE_ADDR+0x066)
> +#define PM4125_ANA_MBHC_CTL_2			(PM4125_ANA_BASE_ADDR+0x067)
> +#define PM4125_ANA_MBHC_PLUG_DETECT_CTL		(PM4125_ANA_BASE_ADDR+0x068)
> +#define PM4125_ANA_MBHC_ZDET_ANA_CTL		(PM4125_ANA_BASE_ADDR+0x069)
> +#define PM4125_ANA_MBHC_ZDET_RAMP_CTL		(PM4125_ANA_BASE_ADDR+0x06A)
> +#define PM4125_ANA_MBHC_FSM_STATUS		(PM4125_ANA_BASE_ADDR+0x06B)
> +#define PM4125_ANA_MBHC_ADC_RESULT		(PM4125_ANA_BASE_ADDR+0x06C)
> +#define PM4125_ANA_MBHC_CTL_CLK			(PM4125_ANA_BASE_ADDR+0x06D)
> +#define PM4125_ANA_MBHC_ZDET_CALIB_RESULT	(PM4125_ANA_BASE_ADDR+0x072)
> +#define PM4125_ANA_NCP_EN			(PM4125_ANA_BASE_ADDR+0x077)
> +#define PM4125_ANA_NCP_VCTRL			(PM4125_ANA_BASE_ADDR+0x07C)
> +#define PM4125_ANA_HPHPA_CNP_CTL_1		(PM4125_ANA_BASE_ADDR+0x083)
> +#define PM4125_ANA_HPHPA_CNP_CTL_2		(PM4125_ANA_BASE_ADDR+0x084)
> +#define PM4125_ANA_HPHPA_PA_STATUS		(PM4125_ANA_BASE_ADDR+0x087)
> +#define PM4125_ANA_HPHPA_FSM_CLK		(PM4125_ANA_BASE_ADDR+0x088)
> +#define PM4125_ANA_HPHPA_L_GAIN			(PM4125_ANA_BASE_ADDR+0x08B)
> +#define PM4125_ANA_HPHPA_R_GAIN			(PM4125_ANA_BASE_ADDR+0x08C)
> +#define PM4125_ANA_HPHPA_SPARE_CTL		(PM4125_ANA_BASE_ADDR+0x08E)
> +#define PM4125_SWR_HPHPA_HD2			(PM4125_ANA_BASE_ADDR+0x090)
> +#define PM4125_ANA_SURGE_EN			(PM4125_ANA_BASE_ADDR+0x097)
> +#define PM4125_ANA_COMBOPA_CTL			(PM4125_ANA_BASE_ADDR+0x09B)
> +#define PM4125_ANA_COMBOPA_CTL_4		(PM4125_ANA_BASE_ADDR+0x09F)
> +#define PM4125_ANA_COMBOPA_CTL_5		(PM4125_ANA_BASE_ADDR+0x0A0)
> +#define PM4125_ANA_RXLDO_CTL			(PM4125_ANA_BASE_ADDR+0x0B2)
> +#define PM4125_ANA_MBIAS_EN			(PM4125_ANA_BASE_ADDR+0x0B4)
> +
> +#define PM4125_DIG_SWR_CHIP_ID0			(PM4125_DIG_BASE_ADDR+0x001)
> +#define PM4125_DIG_SWR_CHIP_ID1			(PM4125_DIG_BASE_ADDR+0x002)
> +#define PM4125_DIG_SWR_CHIP_ID2			(PM4125_DIG_BASE_ADDR+0x003)
> +#define PM4125_DIG_SWR_CHIP_ID3			(PM4125_DIG_BASE_ADDR+0x004)
> +#define PM4125_DIG_SWR_SWR_TX_CLK_RATE		(PM4125_DIG_BASE_ADDR+0x040)
> +#define PM4125_DIG_SWR_CDC_RST_CTL		(PM4125_DIG_BASE_ADDR+0x041)
> +#define PM4125_DIG_SWR_TOP_CLK_CFG		(PM4125_DIG_BASE_ADDR+0x042)
> +#define PM4125_DIG_SWR_CDC_RX_CLK_CTL		(PM4125_DIG_BASE_ADDR+0x043)
> +#define PM4125_DIG_SWR_CDC_TX_CLK_CTL		(PM4125_DIG_BASE_ADDR+0x044)
> +#define PM4125_DIG_SWR_SWR_RST_EN		(PM4125_DIG_BASE_ADDR+0x045)
> +#define PM4125_DIG_SWR_CDC_RX_RST		(PM4125_DIG_BASE_ADDR+0x047)
> +#define PM4125_DIG_SWR_CDC_RX0_CTL		(PM4125_DIG_BASE_ADDR+0x048)
> +#define PM4125_DIG_SWR_CDC_RX1_CTL		(PM4125_DIG_BASE_ADDR+0x049)
> +#define PM4125_DIG_SWR_CDC_TX_ANA_MODE_0_1	(PM4125_DIG_BASE_ADDR+0x04B)
> +#define PM4125_DIG_SWR_CDC_COMP_CTL_0		(PM4125_DIG_BASE_ADDR+0x04F)
> +#define PM4125_DIG_SWR_CDC_RX_DELAY_CTL		(PM4125_DIG_BASE_ADDR+0x052)
> +#define PM4125_DIG_SWR_CDC_RX_GAIN_0		(PM4125_DIG_BASE_ADDR+0x053)
> +#define PM4125_DIG_SWR_CDC_RX_GAIN_1		(PM4125_DIG_BASE_ADDR+0x054)
> +#define PM4125_DIG_SWR_CDC_RX_GAIN_CTL		(PM4125_DIG_BASE_ADDR+0x057)
> +#define PM4125_DIG_SWR_CDC_TX0_CTL		(PM4125_DIG_BASE_ADDR+0x060)
> +#define PM4125_DIG_SWR_CDC_TX1_CTL		(PM4125_DIG_BASE_ADDR+0x061)
> +#define PM4125_DIG_SWR_CDC_TX_RST		(PM4125_DIG_BASE_ADDR+0x063)
> +#define PM4125_DIG_SWR_CDC_REQ0_CTL		(PM4125_DIG_BASE_ADDR+0x064)
> +#define PM4125_DIG_SWR_CDC_REQ1_CTL		(PM4125_DIG_BASE_ADDR+0x065)
> +#define PM4125_DIG_SWR_CDC_RST			(PM4125_DIG_BASE_ADDR+0x067)
> +#define PM4125_DIG_SWR_CDC_AMIC_CTL		(PM4125_DIG_BASE_ADDR+0x06A)
> +#define PM4125_DIG_SWR_CDC_DMIC_CTL		(PM4125_DIG_BASE_ADDR+0x06B)
> +#define PM4125_DIG_SWR_CDC_DMIC1_CTL		(PM4125_DIG_BASE_ADDR+0x06C)
> +#define PM4125_DIG_SWR_CDC_DMIC1_RATE		(PM4125_DIG_BASE_ADDR+0x06D)
> +#define PM4125_DIG_SWR_PDM_WD_CTL0		(PM4125_DIG_BASE_ADDR+0x070)
> +#define PM4125_DIG_SWR_PDM_WD_CTL1		(PM4125_DIG_BASE_ADDR+0x071)
> +#define PM4125_DIG_SWR_INTR_MODE		(PM4125_DIG_BASE_ADDR+0x080)
> +#define PM4125_DIG_SWR_INTR_MASK_0		(PM4125_DIG_BASE_ADDR+0x081)
> +#define PM4125_DIG_SWR_INTR_MASK_1		(PM4125_DIG_BASE_ADDR+0x082)
> +#define PM4125_DIG_SWR_INTR_MASK_2		(PM4125_DIG_BASE_ADDR+0x083)
> +#define PM4125_DIG_SWR_INTR_STATUS_0		(PM4125_DIG_BASE_ADDR+0x084)
> +#define PM4125_DIG_SWR_INTR_STATUS_1		(PM4125_DIG_BASE_ADDR+0x085)
> +#define PM4125_DIG_SWR_INTR_STATUS_2		(PM4125_DIG_BASE_ADDR+0x086)
> +#define PM4125_DIG_SWR_INTR_CLEAR_0		(PM4125_DIG_BASE_ADDR+0x087)
> +#define PM4125_DIG_SWR_INTR_CLEAR_1		(PM4125_DIG_BASE_ADDR+0x088)
> +#define PM4125_DIG_SWR_INTR_CLEAR_2		(PM4125_DIG_BASE_ADDR+0x089)
> +#define PM4125_DIG_SWR_INTR_LEVEL_0		(PM4125_DIG_BASE_ADDR+0x08A)
> +#define PM4125_DIG_SWR_INTR_LEVEL_1		(PM4125_DIG_BASE_ADDR+0x08B)
> +#define PM4125_DIG_SWR_INTR_LEVEL_2		(PM4125_DIG_BASE_ADDR+0x08C)
> +#define PM4125_DIG_SWR_CDC_CONN_RX0_CTL		(PM4125_DIG_BASE_ADDR+0x093)
> +#define PM4125_DIG_SWR_CDC_CONN_RX1_CTL		(PM4125_DIG_BASE_ADDR+0x094)
> +#define PM4125_DIG_SWR_LOOP_BACK_MODE		(PM4125_DIG_BASE_ADDR+0x097)
> +#define PM4125_DIG_SWR_DRIVE_STRENGTH_0		(PM4125_DIG_BASE_ADDR+0x0A0)
> +#define PM4125_DIG_SWR_DIG_DEBUG_CTL		(PM4125_DIG_BASE_ADDR+0x0AB)
> +#define PM4125_DIG_SWR_DIG_DEBUG_EN		(PM4125_DIG_BASE_ADDR+0x0AC)
> +#define PM4125_DIG_SWR_DEM_BYPASS_DATA0		(PM4125_DIG_BASE_ADDR+0x0B0)
> +#define PM4125_DIG_SWR_DEM_BYPASS_DATA1		(PM4125_DIG_BASE_ADDR+0x0B1)
> +#define PM4125_DIG_SWR_DEM_BYPASS_DATA2		(PM4125_DIG_BASE_ADDR+0x0B2)
> +#define PM4125_DIG_SWR_DEM_BYPASS_DATA3		(PM4125_DIG_BASE_ADDR+0x0B3)
> +
> +#define PM4125_ANALOG_REGISTERS_MAX_SIZE	(PM4125_ANA_BASE_ADDR+0x0B5)
> +#define PM4125_DIGITAL_REGISTERS_MAX_SIZE	(PM4125_DIG_BASE_ADDR+0x0B4)
> +#define PM4125_ANALOG_MAX_REGISTER	(PM4125_ANALOG_REGISTERS_MAX_SIZE - 1)
> +#define PM4125_DIGITAL_MAX_REGISTER	(PM4125_DIGITAL_REGISTERS_MAX_SIZE - 1)
> +#define PM4125_MAX_REGISTER			PM4125_DIGITAL_MAX_REGISTER
> +
> +#define PM4125_MAX_MICBIAS			3
> +#define PM4125_MAX_BULK_SUPPLY			4
> +#define PM4125_MAX_SWR_CH_IDS			15
> +#define PM4125_SWRM_CH_MASK(ch_idx)		BIT(ch_idx - 1)
> +
> +enum pm4125_tx_sdw_ports {
> +	PM4125_ADC_1_PORT = 1,
> +	PM4125_DMIC_0_3_MBHC_PORT,
> +	PM4125_MAX_TX_SWR_PORTS = PM4125_DMIC_0_3_MBHC_PORT,
> +};
> +
> +enum pm4125_rx_sdw_ports {
> +	PM4125_HPH_PORT = 1,
> +	PM4125_COMP_PORT,
> +	PM4125_MAX_SWR_PORTS = PM4125_COMP_PORT,
> +};
> +
> +struct pm4125_sdw_ch_info {
> +	int port_num;
> +	unsigned int ch_mask;
> +	unsigned int master_ch_mask;
> +};
> +
> +#define WCD_SDW_CH(id, pn, cmask)	\
> +	[id] = {			\
> +		.port_num = pn,		\
> +		.ch_mask = cmask,	\
> +		.master_ch_mask = cmask,	\
> +	}
> +
> +struct pm4125_priv;
> +struct pm4125_sdw_priv {
> +	struct sdw_slave *sdev;
> +	struct sdw_stream_config sconfig;
> +	struct sdw_stream_runtime *sruntime;
> +	struct sdw_port_config port_config[PM4125_MAX_SWR_PORTS];
> +	struct pm4125_sdw_ch_info *ch_info;
> +	bool port_enable[PM4125_MAX_SWR_CH_IDS];
> +	unsigned int master_channel_map[SDW_MAX_PORTS];
> +	int active_ports;
> +	int num_ports;
> +	bool is_tx;
> +	struct pm4125_priv *pm4125;
> +	struct irq_domain *slave_irq;
> +	struct regmap *regmap;
> +};
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_PM4125_SDW)
> +int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125,
> +		    struct snd_pcm_substream *substream,
> +		    struct snd_soc_dai *dai);
> +int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125,
> +			      struct snd_soc_dai *dai,
> +			      void *stream, int direction);
> +int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125,
> +			 struct snd_pcm_substream *substream,
> +			 struct snd_pcm_hw_params *params,
> +			 struct snd_soc_dai *dai);
> +
> +struct device *pm4125_sdw_device_get(struct device_node *np);
> +
> +#else
> +int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125,
> +		    struct snd_pcm_substream *substream,
> +		    struct snd_soc_dai *dai)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125,
> +			      struct snd_soc_dai *dai,
> +			      void *stream, int direction)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125,
> +			 struct snd_pcm_substream *substream,
> +			 struct snd_pcm_hw_params *params,
> +			 struct snd_soc_dai *dai)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
> +enum {
> +	/* INTR_CTRL_INT_MASK_0 */
> +	PM4125_IRQ_MBHC_BUTTON_PRESS_DET = 0,
> +	PM4125_IRQ_MBHC_BUTTON_RELEASE_DET,
> +	PM4125_IRQ_MBHC_ELECT_INS_REM_DET,
> +	PM4125_IRQ_MBHC_ELECT_INS_REM_LEG_DET,
> +	PM4125_IRQ_MBHC_SW_DET,
> +	PM4125_IRQ_HPHR_OCP_INT,
> +	PM4125_IRQ_HPHR_CNP_INT,
> +	PM4125_IRQ_HPHL_OCP_INT,
> +
> +	/* INTR_CTRL_INT_MASK_1 */
> +	PM4125_IRQ_HPHL_CNP_INT,
> +	PM4125_IRQ_EAR_CNP_INT,
> +	PM4125_IRQ_EAR_SCD_INT,
> +	PM4125_IRQ_AUX_CNP_INT,
> +	PM4125_IRQ_AUX_SCD_INT,
> +	PM4125_IRQ_HPHL_PDM_WD_INT,
> +	PM4125_IRQ_HPHR_PDM_WD_INT,
> +	PM4125_IRQ_AUX_PDM_WD_INT,
> +
> +	/* INTR_CTRL_INT_MASK_2 */
> +	PM4125_IRQ_LDORT_SCD_INT,
> +	PM4125_IRQ_MBHC_MOISTURE_INT,
> +	PM4125_IRQ_HPHL_SURGE_DET_INT,
> +	PM4125_IRQ_HPHR_SURGE_DET_INT,
> +	PM4125_NUM_IRQS,
> +};
> +
> +enum pm4125_tx_sdw_channels {
> +	PM4125_ADC1,
> +	PM4125_ADC2,
> +	PM4125_ADC3,
> +	PM4125_DMIC0,
> +	PM4125_DMIC1,
> +	PM4125_MBHC,
> +	PM4125_DMIC2,
> +	PM4125_DMIC3,
> +	PM4125_DMIC4,
> +	PM4125_DMIC5,
> +	PM4125_DMIC6,
> +};
> +
> +enum pm4125_rx_sdw_channels {
> +	PM4125_HPH_L,
> +	PM4125_HPH_R,
> +	PM4125_CLSH,
> +	PM4125_COMP_L,
> +	PM4125_COMP_R,
> +	PM4125_LO,
> +	PM4125_DSD_R,
> +	PM4125_DSD_L,
> +};
> +
> +const u8 pm4125_reg_access_analog[

No, you cannot have data defined in the header. This is neither style of
C, nor Linux kernel, nor makes any sense. What if this will be included
by some other unit? This is some terrible downstream style.

Heh... you actually do include it twice, so you would see all the
duplicated data for no reason at all.

Best regards,
Krzysztof


