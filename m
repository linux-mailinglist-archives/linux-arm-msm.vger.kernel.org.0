Return-Path: <linux-arm-msm+bounces-69389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7640B28308
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 17:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE445AE870F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806C1303CB9;
	Fri, 15 Aug 2025 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9YjMcxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39A303CA7;
	Fri, 15 Aug 2025 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272204; cv=none; b=gE47tYGwwE4Yw2VxtY9lOKHQa8H8MlZ6AWcLf2TIbeNgQ5EhmlnnojYE5vJ2xyQnB6+1BeQnep58b5LnYRJy3MoMnnK/sP6O7CEtEO1Sg/3DucvKGnVM9kAOt1+da6/+H7sZCcgIzmITnWvADIKXKqnkR18x2zumYszQHKFLdVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272204; c=relaxed/simple;
	bh=67KcHBHjlpa1J1h+XHDKPaiYr4cBCa4wqSJaMUyHjTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iD+/xyxeU7NzgqNy9swPHGxzoNSUW8sketLUrUbd1xddiJPjHTfMz3C+7yMO9W9Nwm8SbzzvNtnB3bnloOEVQ4FqaTlMfw0OMhUw+BjrSoyvx1Bu/IOHsXZaCvPLahddFQStWL0/5aSDw9N2ouSRJlK0bBptAhNuctBTGHbo5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9YjMcxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FD4C4CEEB;
	Fri, 15 Aug 2025 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755272204;
	bh=67KcHBHjlpa1J1h+XHDKPaiYr4cBCa4wqSJaMUyHjTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b9YjMcxbU+3u52qQ8LzOspepLb2mjXu2Bb6iyBX2SVvJYOXKG4wQhYfGGgeVU4hwF
	 tYIC0D5ntUNXctBIWS0ZdFsGTniPU4cqQVqdidFv8bYtdTpQqqehTq4EPF+1I94oEv
	 2ZN7Uzc+jh+VeOC5BmxuR5oe8q06NW11aC0jMCTrBVlAVy4uTWaKZt06IC18z7ryUY
	 AWRnIc6rwZ5ZEzs9Sq8F2ADMpeDhhypACqPBE2VSFk6vKjqOXFij16vDg8+A/zByed
	 27aNxkXFgNBPF4s0S4UZ18KzieWzEcYo5x03WswXVfSkmmt2sB6kvGNchKY+m2Oett
	 /tfUzgIUKn1fA==
Message-ID: <df884334-c850-4ae9-b5e8-63cb834ae259@kernel.org>
Date: Fri, 15 Aug 2025 16:36:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: codecs: add new pm4125 audio codec driver
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
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 christophe.jaillet@wanadoo.fr
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
 <20250814-pm4125_audio_codec_v1-v3-2-31a6ea0b368b@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250814-pm4125_audio_codec_v1-v3-2-31a6ea0b368b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/14/25 1:14 AM, Alexey Klimov wrote:
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
> 

I manged to test this one, found 2 issues.

1. incorrect mic bias handling, results in recording stop working.
2. memory corruption leading to kernel crash.

More details below..

> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/Kconfig      |   18 +
>  sound/soc/codecs/Makefile     |    8 +
>  sound/soc/codecs/pm4125-sdw.c |  547 +++++++++++++
>  sound/soc/codecs/pm4125.c     | 1793 +++++++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/pm4125.h     |  313 +++++++
>  5 files changed, 2679 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 099b4ce4f910d53f6c0e366dee4348084aab76bd..063051168266d094f073f759a54b63f9cb5c70df 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -193,6 +193,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_PCM512x_SPI
>  	imply SND_SOC_PCM6240
>  	imply SND_SOC_PEB2466
> +	imply SND_SOC_PM4125_SDW
>  	imply SND_SOC_RK3308
>  	imply SND_SOC_RK3328
>  	imply SND_SOC_RK817
> @@ -1559,6 +1560,23 @@ config SND_SOC_PEB2466
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-soc-peb2466.
>  
> +config SND_SOC_PM4125
> +	depends on SND_SOC_PM4125_SDW
> +	tristate
> +	depends on SOUNDWIRE || !SOUNDWIRE
> +
> +config SND_SOC_PM4125_SDW
> +	tristate "PM4125 audio codec - SDW"
> +	select SND_SOC_PM4125
> +	select SND_SOC_WCD_MBHC
> +	select REGMAP_IRQ
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE
> +	help
> +	  The PMIC PM4125 has an in-built audio codec IC used with SoCs
> +	  like QCM2290, and it is connected via soundwire and SPMI.
> +	  To compile this codec driver say Y or m.
> +
>  config SND_SOC_RK3308
>  	tristate "Rockchip RK3308 audio CODEC"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 3f97afaaaed877cb1a7b46bc37cf4ad09bb98a5c..ff771ff8a1e93db1af8550d419c1339356a895dd 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -224,6 +224,8 @@ snd-soc-pcm512x-i2c-y := pcm512x-i2c.o
>  snd-soc-pcm512x-spi-y := pcm512x-spi.o
>  snd-soc-pcm6240-y := pcm6240.o
>  snd-soc-peb2466-y := peb2466.o
> +snd-soc-pm4125-y := pm4125.o
> +snd-soc-pm4125-sdw-y := pm4125-sdw.o
>  snd-soc-rk3308-y := rk3308_codec.o
>  snd-soc-rk3328-y := rk3328_codec.o
>  snd-soc-rk817-y := rk817_codec.o
> @@ -646,6 +648,12 @@ obj-$(CONFIG_SND_SOC_PCM512x_I2C)	+= snd-soc-pcm512x-i2c.o
>  obj-$(CONFIG_SND_SOC_PCM512x_SPI)	+= snd-soc-pcm512x-spi.o
>  obj-$(CONFIG_SND_SOC_PCM6240)	+= snd-soc-pcm6240.o
>  obj-$(CONFIG_SND_SOC_PEB2466)	+= snd-soc-peb2466.o
> +obj-$(CONFIG_SND_SOC_PM4125_SDW) += snd-soc-pm4125-sdw.o
> +obj-$(CONFIG_SND_SOC_PM4125)   += snd-soc-pm4125.o
> +ifdef CONFIG_SND_SOC_PM4125_SDW
> +# avoid link failure by forcing sdw code built-in when needed
> +obj-$(CONFIG_SND_SOC_PM4125) += snd-soc-pm4125-sdw.o
> +endif
>  obj-$(CONFIG_SND_SOC_RK3308)	+= snd-soc-rk3308.o
>  obj-$(CONFIG_SND_SOC_RK3328)	+= snd-soc-rk3328.o
>  obj-$(CONFIG_SND_SOC_RK817)	+= snd-soc-rk817.o
> diff --git a/sound/soc/codecs/pm4125-sdw.c b/sound/soc/codecs/pm4125-sdw.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..776f5998f3e9a9ae5834a8e179c22ed43405c3c0
> --- /dev/null
> +++ b/sound/soc/codecs/pm4125-sdw.c
> @@ -0,0 +1,547 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> +// Copyright, 2025 Linaro Ltd


> +
> +static struct pm4125_sdw_ch_info pm4125_sdw_rx_ch_info[] = {
> +	WCD_SDW_CH(PM4125_HPH_L, PM4125_HPH_PORT, BIT(0)),
> +	WCD_SDW_CH(PM4125_HPH_R, PM4125_HPH_PORT, BIT(1)),
> +	WCD_SDW_CH(PM4125_COMP_L, PM4125_COMP_PORT, BIT(0)),
> +	WCD_SDW_CH(PM4125_COMP_R, PM4125_COMP_PORT, BIT(1)),
Issue 1: we are adding only 4 channels here however the mixer Switches
that lookup this table is more than 4.
> +};
> +
> +static struct pm4125_sdw_ch_info pm4125_sdw_tx_ch_info[] = {
> +	WCD_SDW_CH(PM4125_ADC1, PM4125_ADC_1_2_DMIC1L_BCS_PORT, BIT(0)),
> +	WCD_SDW_CH(PM4125_ADC2, PM4125_ADC_1_2_DMIC1L_BCS_PORT, BIT(1)),

Same issue here,
> +};
> +


> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fc320152b9254e4412cbf593cdc456ee159d071f
> --- /dev/null
> +++ b/sound/soc/codecs/pm4125.c
> @@ -0,0 +1,1793 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> +// Copyright (c) 2025, Linaro Ltd
> +

> +static int pm4125_rx_clk_enable(struct snd_soc_component *component)
> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	if (atomic_read(&pm4125->rx_clk_cnt))
> +		return 0;
> +
> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
> +				      PM4125_DIG_SWR_RX_CLK_ENABLE);
> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      PM4125_DIG_SWR_ANA_RX_DIV2_CLK_EN_MASK,
> +				      PM4125_DIG_SWR_RX_CLK_ENABLE);
> +	usleep_range(5000, 5100);
> +
> +	pm4125_global_mbias_enable(component);

Please remove handing of mbias calls directly this is racing, Please
handle it via dapm widgets directly. If not we will endup with switching
off micbias off while recording is in progress or recording will
continue assuming that micbias is on, but some path can switch it off.


> +
> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
> +				      PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
> +				      PM4125_ANA_HPHPA_FSM_DIV_RATIO_68);
> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_EN_MASK,
> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_ENABLE);
> +	snd_soc_component_update_bits(component, PM4125_ANA_NCP_VCTRL, 0x07, 0x06);
> +	snd_soc_component_write_field(component, PM4125_ANA_NCP_EN,
> +				      PM4125_ANA_NCP_ENABLE_MASK,
> +				      PM4125_ANA_NCP_ENABLE);
> +	usleep_range(500, 510);
> +
> +	atomic_inc(&pm4125->rx_clk_cnt);
> +
> +	return 0;
> +}
> +
> +static int pm4125_rx_clk_disable(struct snd_soc_component *component)
> +{
> +	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
> +
> +	if (!atomic_read(&pm4125->rx_clk_cnt)) {
> +		dev_err(component->dev, "clk already disabled\n");
> +		return 0;
> +	}
> +
> +	atomic_dec(&pm4125->rx_clk_cnt);
> +
> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_EN_MASK,
> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_DISABLE);
> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
> +				      PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
> +				      0x00);
> +	snd_soc_component_write_field(component, PM4125_ANA_NCP_EN,
> +				      PM4125_ANA_NCP_ENABLE_MASK,
> +				      PM4125_ANA_NCP_DISABLE);
> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      PM4125_DIG_SWR_ANA_RX_DIV2_CLK_EN_MASK,
> +				      PM4125_DIG_SWR_RX_CLK_DISABLE);
> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL,
> +				      PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
> +				      PM4125_DIG_SWR_RX_CLK_DISABLE);
> +	pm4125_global_mbias_disable(component);
> +
> +	return 0;
> +}
> +
> +

%s/^\n\n/\r/

> +static int pm4125_codec_enable_rxclk(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
> +				     int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> 
> +static const struct snd_kcontrol_new pm4125_snd_controls[] = {
> +	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,

    SOC_SINGLE_EXT("HPHL_COMP Switch", PM4125_COMP_L, 0, 1, 0, ?

> +		       pm4125_get_compander, pm4125_set_compander),
> +	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,

       SOC_SINGLE_EXT("HPHR_COMP Switch", PM4125_COMP_R, 1, 1, 0,?

> +		       pm4125_get_compander, pm4125_set_compander),

This is same issue in one of the WCD codec, which am going to send fixes
along with my original wcd fixes series.


> +
> +	SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
> +		       line_gain),
> +	SOC_SINGLE_TLV("HPHR Volume", PM4125_ANA_HPHPA_R_GAIN, 0, 20, 1,
> +		       line_gain),
> +	SOC_SINGLE_TLV("ADC1 Volume", PM4125_ANA_TX_AMIC1, 0, 8, 0,
> +		       analog_gain),
> +	SOC_SINGLE_TLV("ADC2 Volume", PM4125_ANA_TX_AMIC2, 0, 8, 0,
> +		       analog_gain),
> +
> +	SOC_SINGLE_EXT("HPHL Switch", PM4125_HPH_L, 0, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("HPHR Switch", PM4125_HPH_R, 0, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),

<---
> +	SOC_SINGLE_EXT("LO Switch", PM4125_LO, 0, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),--->

> +
> +	SOC_SINGLE_EXT("ADC1 Switch", PM4125_ADC1, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("ADC2 Switch", PM4125_ADC2, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
<-----------------
> +	SOC_SINGLE_EXT("DMIC0 Switch", PM4125_DMIC0, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("DMIC1 Switch", PM4125_DMIC1, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("MBHC Switch", PM4125_MBHC, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> +	SOC_SINGLE_EXT("DMIC2 Switch", PM4125_DMIC2, 1, 1, 0,
> +		       pm4125_get_swr_port, pm4125_set_swr_port),
-------------->
Please delete these entires as there are no entires for any of this
channels in pm4125_sdw_rx_ch_info or pm4125_sdw_tx_ch_info.

Side effect of this out of boundary array access is memory corruption as
we will set port_config values based on port index which could be
negative in this cases resulting in writing to othe members of
pm4125_sdw_priv struct.


> +};
> +
> +static const struct snd_kcontrol_new adc1_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new adc2_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new dmic1_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new dmic2_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +
> +static const struct snd_kcontrol_new ear_rdac_switch[] = {
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
> +};
> +

during my test i had to do below code changes to get things working.
Please feel free to wrap it into your next version.

----------------------->cut<----------------------------------
diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index fc320152b925..12d4be1f7149 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -264,8 +264,6 @@ static int pm4125_rx_clk_enable(struct
snd_soc_component *component)
                                      PM4125_DIG_SWR_RX_CLK_ENABLE);
        usleep_range(5000, 5100);

-       pm4125_global_mbias_enable(component);
-
        snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
                                      PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
                                      PM4125_ANA_HPHPA_FSM_DIV_RATIO_68);
@@ -309,8 +307,6 @@ static int pm4125_rx_clk_disable(struct
snd_soc_component *component)
        snd_soc_component_write_field(component,
PM4125_DIG_SWR_CDC_RX_CLK_CTL,
                                      PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
                                      PM4125_DIG_SWR_RX_CLK_DISABLE);
-       pm4125_global_mbias_disable(component);
-
        return 0;
 }

@@ -670,7 +666,6 @@ static int pm4125_codec_enable_adc(struct
snd_soc_dapm_widget *w,
                        !(snd_soc_component_read(component,
PM4125_ANA_TX_AMIC2) & 0x10)) {
                        set_bit(AMIC2_BCS_ENABLE, &pm4125->status_mask);
                }
-               pm4125_global_mbias_enable(component);
                if (w->shift)
                        snd_soc_component_write_field(component,
PM4125_DIG_SWR_CDC_TX_ANA_MODE_0_1,

PM4125_DIG_SWR_TX_ANA_TXD1_MODE_MASK,
@@ -692,7 +687,6 @@ static int pm4125_codec_enable_adc(struct
snd_soc_dapm_widget *w,
                        snd_soc_component_write_field(component,
PM4125_DIG_SWR_CDC_TX_ANA_MODE_0_1,

PM4125_DIG_SWR_TX_ANA_TXD0_MODE_MASK,
                                                      0x00);
-               pm4125_global_mbias_disable(component);
                break;
        };

@@ -1042,9 +1036,9 @@ static void pm4125_mbhc_deinit(struct
snd_soc_component *component)
 }

 static const struct snd_kcontrol_new pm4125_snd_controls[] = {
-       SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
+       SOC_SINGLE_EXT("HPHL_COMP Switch", PM4125_COMP_L, 0, 1, 0,
                       pm4125_get_compander, pm4125_set_compander),
-       SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
+       SOC_SINGLE_EXT("HPHR_COMP Switch", PM4125_COMP_R, 1, 1, 0,
                       pm4125_get_compander, pm4125_set_compander),

        SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
@@ -1060,21 +1054,11 @@ static const struct snd_kcontrol_new
pm4125_snd_controls[] = {
                       pm4125_get_swr_port, pm4125_set_swr_port),
        SOC_SINGLE_EXT("HPHR Switch", PM4125_HPH_R, 0, 1, 0,
                       pm4125_get_swr_port, pm4125_set_swr_port),
-       SOC_SINGLE_EXT("LO Switch", PM4125_LO, 0, 1, 0,
-                      pm4125_get_swr_port, pm4125_set_swr_port),

        SOC_SINGLE_EXT("ADC1 Switch", PM4125_ADC1, 1, 1, 0,
                       pm4125_get_swr_port, pm4125_set_swr_port),
        SOC_SINGLE_EXT("ADC2 Switch", PM4125_ADC2, 1, 1, 0,
                       pm4125_get_swr_port, pm4125_set_swr_port),
-       SOC_SINGLE_EXT("DMIC0 Switch", PM4125_DMIC0, 1, 1, 0,
-                      pm4125_get_swr_port, pm4125_set_swr_port),
-       SOC_SINGLE_EXT("DMIC1 Switch", PM4125_DMIC1, 1, 1, 0,
-                      pm4125_get_swr_port, pm4125_set_swr_port),
-       SOC_SINGLE_EXT("MBHC Switch", PM4125_MBHC, 1, 1, 0,
-                      pm4125_get_swr_port, pm4125_set_swr_port),
-       SOC_SINGLE_EXT("DMIC2 Switch", PM4125_DMIC2, 1, 1, 0,
-                      pm4125_get_swr_port, pm4125_set_swr_port),
 };

 static const struct snd_kcontrol_new adc1_switch[] = {

------------------------------------>cut<--------------------


