Return-Path: <linux-arm-msm+bounces-76666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2C4BC9578
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381931899087
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43442E7F0B;
	Thu,  9 Oct 2025 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRVb4KH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159D2D9EDF;
	Thu,  9 Oct 2025 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017208; cv=none; b=Ytf6Zq09EPvvE9StU6xDCAXfEVpVlv70Z4uWye9peE/OwG5MAcTgd8otxFKhshxMFc78nuV+/6h/cMt7XyF2rKQmIL9x56/4uvpQNhyXB199Uy4k/ozXGf5i6Xunh9KYnMe48xAqXb7Z2Gs3Gwo4rrgHgASvad3UyM1EzPShlxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017208; c=relaxed/simple;
	bh=VdC27hcOKbdtLbSsb9cJummxioaXko1mxh4mEQYafBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQMjjSvXznfzyXujiQCl+Q/40GjBRGkJ8E/h0Q++iw5Y83Ju/eTyh/MmzcFtfclW0KRKHaI4fkNkeL5820IIJlBvUEPit+Jhj6xMUIc20h1bggH0VI9PNBSdiozKvFcVa6UqdSypU9T28t8z+vfwiG2JHwOnIwKdzBOkdsaxAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRVb4KH3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055E6C4CEE7;
	Thu,  9 Oct 2025 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760017207;
	bh=VdC27hcOKbdtLbSsb9cJummxioaXko1mxh4mEQYafBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FRVb4KH3hfrnISJC494JzKrQMJAuJhT5pnqtdf/RycXc93hEhAt9UTgMjXJuT55yn
	 XjyCGBgt9bdVNLoRTOQmUiWvbC1XLP+i4fOZFI6wLwi00t8b3V34uc2/TwK19AJHqy
	 6hxRJXVeylUrFKOO/vG8tXTYXpCmquBtNprR2+Z1LNaO67UtkXhOVBqAAczulY7SBl
	 Rr53GfNoThhTecicbEDIFfi4m/U+zIqro9gsLi6uQqaVmmBBVrp2hizVYaHlxEtOi3
	 8FjUTU/+WrZZyyHh8z6bb3cLs+avlWvuxL/1ibXoAYZqIcX+tQZulPDwUQKCleve0W
	 76MVuRSZ7hanA==
Message-ID: <5aa30c94-33f1-4f40-9013-dfbac249ce91@kernel.org>
Date: Thu, 9 Oct 2025 14:40:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/8/25 7:56 PM, Neil Armstrong wrote:
> Add support for getting the I2S clocks used for the MI2S
> interfaces, and enable/disable the clocks on the PCM
> startup and shutdown card callbacks.
> 
> The rate can be easily calculated since the card forces 48Hz,
> 2 channels at 16bit slot size.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/sc8280xp.c | 132 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 78e327bc2f07767b1032f09af7f45b947e7eb67a..82b173c2dabbd1478df49ba9f0cc53e82bf2f8d2 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -4,6 +4,8 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/of_clk.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/pcm.h>
> @@ -15,15 +17,47 @@
>  #include "common.h"
>  #include "sdw.h"
>  
> +#define I2S_MAX_CLKS	5
> +
> +#define I2S_MCLKFS	256
> +#define I2S_SLOTSIZE	16
> +#define I2S_MCLK_RATE(rate, channels) \
> +		((rate) * (channels) * I2S_MCLKFS)
> +#define I2S_BIT_RATE(rate, channels) \
> +		((rate) * (channels) * I2S_SLOTSIZE)
> +
> +#define I2S_DEFAULT_RATE	48000
> +#define I2S_DEFAULT_CHANNELS	2
> +

Sorry for not providing this feedback on v1, we should use
snd_soc_dai_set_sysclk to do this whole clk handling.

and implment this set_sysclk in q6i2s_ops of q6apm-lpass-dais.c  like
q6afe-lpass-dais.c


--srini

>  struct sc8280xp_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
>  	struct snd_soc_card *card;
>  	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack dp_jack[8];
> +	struct clk *i2s_clk[I2S_MAX_CLKS];
> +	struct clk *i2s_mclk[I2S_MAX_CLKS];
>  	bool jack_setup;
>  };
>  
> +static int sc8280xp_snd_i2s_index(struct snd_soc_dai *dai)
> +{
> +	switch (dai->id) {
> +	case PRIMARY_MI2S_RX...PRIMARY_MI2S_TX:
> +		return 0;
> +	case  SECONDARY_MI2S_RX...SECONDARY_MI2S_TX:
> +		return 1;
> +	case TERTIARY_MI2S_RX...TERTIARY_MI2S_TX:
> +		return 2;
> +	case QUATERNARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +		return 3;
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		return 4;
> +	default:
> +		return -1;
> +	}
> +}
> +
>  static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> @@ -31,10 +65,22 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	struct snd_soc_card *card = rtd->card;
>  	struct snd_soc_jack *dp_jack  = NULL;
>  	int dp_pcm_id = 0;
> +	int index, ret;
>  
>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>  	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		index = sc8280xp_snd_i2s_index(cpu_dai);
> +		ret = clk_set_rate(data->i2s_mclk[index],
> +				   I2S_MCLK_RATE(I2S_DEFAULT_RATE,
> +						 I2S_DEFAULT_CHANNELS));
> +		if (ret)
> +			dev_err(data->card->dev, "Unable to set mclk rate\n");
> +		ret = clk_set_rate(data->i2s_clk[index],
> +				   I2S_BIT_RATE(I2S_DEFAULT_RATE,
> +						I2S_DEFAULT_CHANNELS));
> +		if (ret)
> +			dev_err(data->card->dev, "Unable to set bit rate\n");
>  		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
>  		break;
>  	case WSA_CODEC_DMA_RX_0:
> @@ -68,12 +114,54 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }
>  
> +static int sc8280xp_snd_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
> +				     SND_SOC_DAIFMT_NB_NF |
> +				     SND_SOC_DAIFMT_I2S;
> +	int index, ret;
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		index = sc8280xp_snd_i2s_index(cpu_dai);
> +		ret = clk_prepare_enable(pdata->i2s_mclk[index]);
> +		if (ret)
> +			dev_err(pdata->card->dev, "Unable to enable bit clock\n");
> +		ret = clk_prepare_enable(pdata->i2s_clk[index]);
> +		if (ret)
> +			dev_err(pdata->card->dev, "Unable to enable master clock\n");
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return qcom_snd_sdw_startup(substream);
> +}
> +
>  static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>  	struct sdw_stream_runtime *sruntime = pdata->sruntime[cpu_dai->id];
> +	int index;
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...TERTIARY_MI2S_RX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		index = sc8280xp_snd_i2s_index(cpu_dai);
> +		clk_disable_unprepare(pdata->i2s_clk[index]);
> +		clk_disable_unprepare(pdata->i2s_mclk[index]);
> +		break;
> +	default:
> +		break;
> +	}
>  
>  	pdata->sruntime[cpu_dai->id] = NULL;
>  	sdw_release_stream(sruntime);
> @@ -141,7 +229,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
>  }
>  
>  static const struct snd_soc_ops sc8280xp_be_ops = {
> -	.startup = qcom_snd_sdw_startup,
> +	.startup = sc8280xp_snd_startup,
>  	.shutdown = sc8280xp_snd_shutdown,
>  	.hw_params = sc8280xp_snd_hw_params,
>  	.hw_free = sc8280xp_snd_hw_free,
> @@ -162,6 +250,44 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>  	}
>  }
>  
> +static const char * const i2s_bus_names[I2S_MAX_CLKS] = {
> +	"primary",
> +	"secondary",
> +	"tertiary",
> +	"quaternary",
> +	"quinary",
> +};
> +
> +static int sc8280xp_get_i2s_clocks(struct platform_device *pdev,
> +				   struct sc8280xp_snd_data *data)
> +{
> +	struct device *dev = &pdev->dev;
> +	int i;
> +
> +	if (!device_property_present(dev, "clocks"))
> +		return 0;
> +
> +	for (i = 0; i < I2S_MAX_CLKS; ++i) {
> +		char name[32];
> +
> +		snprintf(name, 32, "%s-mi2s", i2s_bus_names[i]);
> +		data->i2s_clk[i] = devm_clk_get_optional(dev, name);
> +		if (IS_ERR(data->i2s_clk[i]))
> +			return dev_err_probe(dev, PTR_ERR(data->i2s_clk[i]),
> +					     "unable to get %s clock\n",
> +					     name);
> +
> +		snprintf(name, 32, "%s-mclk", i2s_bus_names[i]);
> +		data->i2s_mclk[i] = devm_clk_get_optional(dev, name);
> +		if (IS_ERR(data->i2s_mclk[i]))
> +			return dev_err_probe(dev, PTR_ERR(data->i2s_mclk[i]),
> +					     "unable to get %s clock\n",
> +					     name);
> +	}
> +
> +	return 0;
> +}
> +
>  static int sc8280xp_platform_probe(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card;
> @@ -185,6 +311,10 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = sc8280xp_get_i2s_clocks(pdev, data);
> +	if (ret)
> +		return ret;
> +
>  	card->driver_name = of_device_get_match_data(dev);
>  	sc8280xp_add_be_ops(card);
>  	return devm_snd_soc_register_card(dev, card);
> 


