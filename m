Return-Path: <linux-arm-msm+bounces-76127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB789BBFB0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26D23C629A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4ED81E51EC;
	Mon,  6 Oct 2025 22:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFNfrcD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942002B9A7;
	Mon,  6 Oct 2025 22:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789275; cv=none; b=W5xjS3P5BAY57gyryFqcVWsNWF7zqQBNu/Hd+z5hIhJdj3D4W3XKbE9qj6Yi2RfpjDKnEvy2NGd92nd+0HTGECsdIiZY/6Qr4g3CY8SRhfyxnO/tB7MRFG2o4z9RPcfpUf5ek5ug6on6aghlBWuD7LPNeX4GlkoaE6a1oeIbudM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789275; c=relaxed/simple;
	bh=y9HkAkMswhuhnlObmY879hYAYn5iP/hSOUaR/NYB2Ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqxWTElAmumunWxUNWntifnHQEouz+5yNZ/41u8BInjL2cFAStQsaeGjQ4RmkhL1at45c6xcrEjEQl8q+MyuFFNx9tzHHKfhcdrhTYgOAGelJgSy8xVufEsLC/bJmVGYjI9eGhgFFJOZUc4hrohlxyGt0j9UsQ+kA+G1RfnlbHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFNfrcD2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC2CC4CEF5;
	Mon,  6 Oct 2025 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759789275;
	bh=y9HkAkMswhuhnlObmY879hYAYn5iP/hSOUaR/NYB2Ms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VFNfrcD2/2boUqakycWq4TlbFMTApjkUYi8DjvsiDpzm85PyxuQiuWX9Qkv3mlqwf
	 7T8UZVNdBAPTbG2eELOgBrrBZ6I0jqDAjMLw7aVeqF4QGVfqlyGBBNbwY0/BfX2Mpr
	 NOD6rPyi4OmcgOqxcT8golJ7xV73/9WTIGTu2IY/zfx2AR0SZODIRAKVqvQIc6LGHO
	 kGF4XsN/Oa61ChgQmX0etTDTarcF1Nw2E2hdKZdTw9I6BQ/SHx/xJB+ib1V1kIJyGC
	 /BSxGwNIUnaC2xi0psmWHIopi5S4NMEpNbpapuwdsdX7uMxYvMS5shyQ2P9mOp3muH
	 tmx7NwjI2FWEw==
Message-ID: <6492e444-4196-4900-a741-a74a8c506a6d@kernel.org>
Date: Mon, 6 Oct 2025 23:21:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
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
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/6/25 7:37 PM, Neil Armstrong wrote:
> Add support for getting the I2S clocks used for the MI2S
> interfaces, and enable/disable the clocks on the PCM
> startup and shutdown card callbacks.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/sc8280xp.c | 104 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 78e327bc2f07767b1032f09af7f45b947e7eb67a..ad4ee5c6fab8994f18de572842f3dab6f4f5397e 100644
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
> @@ -15,12 +17,16 @@
>  #include "common.h"
>  #include "sdw.h"
>  
> +#define I2S_MAX_CLKS	5
> +
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
> @@ -68,12 +74,66 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }
>  
> +static int sc8280xp_snd_i2s_index(struct snd_soc_dai *dai)
> +{
> +	switch (dai->id) {
> +	case PRIMARY_MI2S_RX..PRIMARY_MI2S_TX:
> +		return 0;
> +	case  SECONDARY_MI2S_RX.. SECONDARY_MI2S_TX:
> +		return 1;
> +	case TERTIARY_MI2S_RX..TERTIARY_MI2S_TX:
> +		return 2;
> +	case QUATERNARY_MI2S_RX..QUATERNARY_MI2S_TX:
> +		return 3;
> +	case QUINARY_MI2S_RX..QUINARY_MI2S_TX:
> +		return 4;
> +	default:
> +		return -1;
> +	}
> +}
> +
> +static int sc8280xp_snd_startup(struct snd_pcm_substream *substream)
> +{
> +	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	int index;
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		index = sc8280xp_snd_i2s_index(cpu_dai);

What is the mclk and bitclk rate set here, we can not rely on the
default rate.
--srini
> +		clk_enable(pdata->i2s_mclk[index]);
> +		clk_enable(pdata->i2s_clk[index]);
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
> +	case PRIMARY_MI2S_RX..TERTIARY_MI2S_RX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		index = sc8280xp_snd_i2s_index(cpu_dai);
> +		clk_disable(pdata->i2s_clk[index]);
> +		clk_disable(pdata->i2s_mclk[index]);
> +		break;
> +	default:
> +		break;
> +	}
>  
>  	pdata->sruntime[cpu_dai->id] = NULL;
>  	sdw_release_stream(sruntime);
> @@ -141,7 +201,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
>  }
>  
>  static const struct snd_soc_ops sc8280xp_be_ops = {
> -	.startup = qcom_snd_sdw_startup,
> +	.startup = sc8280xp_snd_startup,
>  	.shutdown = sc8280xp_snd_shutdown,
>  	.hw_params = sc8280xp_snd_hw_params,
>  	.hw_free = sc8280xp_snd_hw_free,
> @@ -162,6 +222,44 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
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
> +static int sc8280xp_get_i2c_clocks(struct platform_device *pdev,
> +				   struct sc8280xp_snd_data *data)
> +{
> +	struct device *dev = &pdev->dev;
> +	int i;
> +
> +	if (!device_property_present(dev))
> +		return 0;
> +
> +	for (i = 0; i < I2S_MAX_CLKS; ++i) {
> +		char name[16];
> +
> +		snprintf(name, 16, "%s-mi2s", i2s_bus_names, i);
> +		data->i2s_clk[i] = devm_clk_get_optional_prepared(dev, name);
> +		if (IS_ERR(data->i2s_clk[i]))
> +			return dev_err_probe(dev, PTR_ERR(data->i2s_clk[i]),
> +					     "unable to get %s clock\n",
> +					     name);
> +
> +		snprintf(name, 16, "%s-mclk", i2s_bus_names, i);
> +		data->i2s_mclk[i] = devm_clk_get_optional_prepared(dev, name);
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
> @@ -185,6 +283,10 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = sc8280xp_get_i2c_clocks(pdev, data);
> +	if (ret)
> +		return ret;
> +
>  	card->driver_name = of_device_get_match_data(dev);
>  	sc8280xp_add_be_ops(card);
>  	return devm_snd_soc_register_card(dev, card);
> 


