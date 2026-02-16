Return-Path: <linux-arm-msm+bounces-92951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDV8CZcdk2mM1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:37:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B3143E3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AADB3008D69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FB230EF6D;
	Mon, 16 Feb 2026 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwxS7QnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A53016F1;
	Mon, 16 Feb 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771248865; cv=none; b=nAgwVf/UfHOucbYv2bNalzC1qXBdaM7xnFb7jTI/wq+kZjmaioKZ2ZzyKh+TXNZDA7cEJ1YwHhL8OTU+EmmTIpE26hRt5ZZ0JOi/MTutPNd1Lf1gEa4Yty3zrL6hNtT9/pApq2++6/d+lr8AlTFZcvjcQLck9aYWC8X7rXpwyP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771248865; c=relaxed/simple;
	bh=y0fQTQo6X8umeZ/M7VxvcuIfs0YY6Q0TYhb3UdnM1CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVEA4FQHCdSlxNcbVV1kbmKz0UAMtUZ+Z7KHmqzIopYIjCBw+MFCkINRkJzfPKFYnHUxcwLNHriNAsYglitlOr3ly30M+AoioUOx3zfgQj/awr+Y45QyPs+E/TPskt9149iVS15/bpvST+DXrsxt1uRYBb4e55rbFCLBgbQiL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwxS7QnZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8395C116C6;
	Mon, 16 Feb 2026 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771248864;
	bh=y0fQTQo6X8umeZ/M7VxvcuIfs0YY6Q0TYhb3UdnM1CQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IwxS7QnZAuAnm+0K4bsO2QA2PNHJ7y1v77ekOdLUkC0cg4rdQZ5YKdzF/13vwNy+I
	 yfb7ufPWgkEn9keP5ytodVXXNvMAh84iGL2mJ5VBbWfMdZsw3bXlI1hXPGIM2wE02a
	 +y5gmFEucDPtEgq/0QpkPSV+Upy7kRcGWeTRrA3agdUwhmiMgoH+siftToI7zlHtWf
	 EG4lFG5Aoe/CqNxgzsucm0MMe4fA8yAyDJNl3lsJsb3xoSxf7GwyLwjzqdp9TjEheh
	 6uC/QeXP/ANUmkeNRvr2ytfpDM5EvA/caaBCYYn+wZhUfnracZxfbv3UtfpvmObqUM
	 b/w4HzHIr4B1A==
Message-ID: <05873ad7-ca35-4542-b064-5b401f7bd069@kernel.org>
Date: Mon, 16 Feb 2026 13:34:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] ASoC: qcom: add sdm660 internal sound card support
To: Richard Acayan <mailingradian@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-10-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260211020302.2674-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92951-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 013B3143E3D
X-Rspamd-Action: no action



On 2/11/26 2:03 AM, Richard Acayan wrote:
> The Snapdragon 670 and Snapdragon 660 both share the same drivers for
> the sound cards. These different sound cards are tasha, tavil, and
tasha, tavil are codecs, most of differences is pretty much taken care
at dt level.

> internal. Add support for the internal sound card.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  sound/soc/qcom/Kconfig           |  12 ++
>  sound/soc/qcom/Makefile          |   2 +
>  sound/soc/qcom/sdm660-internal.c | 271 +++++++++++++++++++++++++++++++
>  3 files changed, 285 insertions(+)
>  create mode 100644 sound/soc/qcom/sdm660-internal.c
internal name really looks odd.

Any reason why totally new driver without resusing the existing ones or
even the helper functions from existing code?


> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index e6e24f3b9922..86b2778adc1a 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -167,6 +167,18 @@ config SND_SOC_MSM8996
>  	  APQ8096 SoC-based systems.
>  	  Say Y if you want to use audio device on this SoCs
>  
> +config SND_SOC_SDM660_INT
> +	tristate "SoC Machine driver for SDM660 and SDM670 boards"
> +	depends on QCOM_APR
> +	depends on OF
> +	depends on PM
> +	select SND_SOC_QDSP6
> +	select SND_SOC_QCOM_COMMON
> +	help
> +	  This adds support for audio on Qualcomm Technologies Inc.
> +	  SDM660 and SDM670 SoC-based systems.
> +	  Say Y if you want to use audio devices on these SoCs.
> +
>  config SND_SOC_SDM845
>  	tristate "SoC Machine driver for SDM845 boards"
>  	depends on QCOM_APR && I2C && SOUNDWIRE
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 985ce2ae286b..9a0da6279299 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -24,6 +24,7 @@ snd-soc-apq8016-sbc-y := apq8016_sbc.o
>  snd-soc-apq8096-y := apq8096.o
>  snd-soc-sc7180-y := sc7180.o
>  snd-soc-sc7280-y := sc7280.o
> +snd-soc-sdm660-int-y := sdm660-internal.o
>  snd-soc-sdm845-y := sdm845.o
>  snd-soc-sm8250-y := sm8250.o
>  snd-soc-sc8280xp-y := sc8280xp.o
> @@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
>  obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
>  obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
> +obj-$(CONFIG_SND_SOC_SDM660_INT) += snd-soc-sdm660-int.o
>  obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
>  obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
>  obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> diff --git a/sound/soc/qcom/sdm660-internal.c b/sound/soc/qcom/sdm660-internal.c
> new file mode 100644
> index 000000000000..beb810aa4eb9
> --- /dev/null
> +++ b/sound/soc/qcom/sdm660-internal.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Richard Acayan. All rights reserved.
> + */
> +
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/jack.h>
> +#include <sound/soc.h>
> +#include <sound/soc-card.h>
> +#include <sound/soc-dai.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/soc-jack.h>
> +
> +#include "common.h"
> +#include "qdsp6/q6afe.h"
> +
> +#define DEFAULT_SAMPLE_RATE_48K		48000
> +#define DEFAULT_INT_MCLK_RATE		9600000
> +#define MI2S_BCLK_RATE			1536000
> +
> +struct sdm660_int_snd_data {
> +	struct snd_soc_jack jack;
> +	bool jack_setup;
> +	uint32_t int0_mi2s_clk_count;
> +	uint32_t int3_mi2s_clk_count;
> +};
> +
> +static int snd_sdm660_int_startup(struct snd_pcm_substream *stream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(stream);
> +	struct sdm660_int_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu->id) {
> +	case INT0_MI2S_RX:
> +		data->int0_mi2s_clk_count++;
> +		if (data->int0_mi2s_clk_count == 1)
> +			snd_soc_dai_set_sysclk(cpu,
> +				Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +
> +		/*
> +		 * Downstream specifies that the AFE is a clock consumer, but
> +		 * the sound is distorted (loud on the right channel and sped
> +		 * up) unless we set it as a producer.
This comment does not make any value, Who is driving the bit clk and
frame clock is totally depended on the hw setup on the platform, Driving
incorrect clock would lead to such issues. Does the codec drive on the
platform that you are testing?

> +		 */
> +		snd_soc_dai_set_fmt(cpu, SND_SOC_DAIFMT_CBP_CFP);
> +
> +		break;
> +	case INT3_MI2S_TX:
> +		data->int3_mi2s_clk_count++;
> +		if (data->int3_mi2s_clk_count == 1)
> +			snd_soc_dai_set_sysclk(cpu,
> +				Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +
> +		/*
> +		 * Downstream specifies that the AFE is a clock consumer, but
> +		 * the sound is distorted (slowed down) unless we set it as a
> +		 * producer.
> +		 */
> +		snd_soc_dai_set_fmt(cpu, SND_SOC_DAIFMT_CBP_CFP);
> +
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void snd_sdm660_int_shutdown(struct snd_pcm_substream *stream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(stream);
> +	struct sdm660_int_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu->id) {
> +	case INT0_MI2S_RX:
> +		data->int0_mi2s_clk_count--;
> +		if (data->int0_mi2s_clk_count == 0)
> +			snd_soc_dai_set_sysclk(cpu,
> +				Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +
> +		break;
> +	case INT3_MI2S_TX:
> +		data->int3_mi2s_clk_count--;
> +		if (data->int3_mi2s_clk_count == 0)
> +			snd_soc_dai_set_sysclk(cpu,
> +				Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu->id);
> +		break;
> +	}
> +}
> +
> +static int snd_sdm660_int_hw_free(struct snd_pcm_substream *stream)
> +{
> +	return 0;
> +}
> +
> +static int snd_sdm660_int_prepare(struct snd_pcm_substream *stream)
> +{
> +	return 0;
> +}

Why dummy functions?

> +
> +static const struct snd_soc_ops sdm660_int_ops = {
> +	.startup = snd_sdm660_int_startup,
> +	.shutdown = snd_sdm660_int_shutdown,
> +	.hw_free = snd_sdm660_int_hw_free,
> +	.prepare = snd_sdm660_int_prepare,
> +};
> +
> +static int sdm660_int_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +					 struct snd_pcm_hw_params *params)
> +{
> +	struct snd_interval *rate = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_interval *channels = hw_param_interval(params,
> +			SNDRV_PCM_HW_PARAM_CHANNELS);
> +	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +
> +	rate->min = rate->max = DEFAULT_SAMPLE_RATE_48K;
> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +
> +	channels->min = channels->max = 2;
> +
> +	return 0;
> +}
> +
> +static void sdm660_int_jack_free(struct snd_jack *jack)
> +{
> +	struct snd_soc_component *component = jack->private_data;
> +
> +	snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sdm660_int_dai_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct sdm660_int_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu = snd_soc_rtd_to_cpu(rtd, 0);
> +	/* first codec on INT0_MI2S_RX must be the analog codec */
> +	struct snd_soc_dai *codec = snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_jack *jack;
> +	int ret;
> +
> +	if (!data->jack_setup) {
> +		/* headset buttons not tested */
> +		ret = snd_soc_card_jack_new(card, "Headset Jack",
> +					    SND_JACK_HEADSET | SND_JACK_BTN_0
> +					  | SND_JACK_BTN_1 | SND_JACK_BTN_2
> +					  | SND_JACK_BTN_3 | SND_JACK_BTN_4,
> +					    &data->jack);
> +		if (ret < 0) {
> +			dev_err(card->dev, "could not create headset jack\n");
> +			return ret;
> +		}
> +
> +		data->jack_setup = true;
> +	}
> +
> +	switch (cpu->id) {
> +	case INT0_MI2S_RX:
> +		jack = data->jack.jack;
> +
> +		jack->private_data = codec->component;
> +		jack->private_free = sdm660_int_jack_free;
> +
> +		ret = snd_soc_component_set_jack(codec->component,
> +						 &data->jack,
> +						 NULL);
> +		if (ret < 0) {
> +			dev_err(card->dev, "could not set headset jack\n");
> +			return ret;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
looks like common.c has something pretty much identicaly, can you not
use it or make it usable?

> +
> +static void snd_sdm660_int_add_ops(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, link) {
> +		if (link->no_pcm == 1) {
> +			link->ops = &sdm660_int_ops;
> +			link->be_hw_params_fixup = sdm660_int_be_hw_params_fixup;
> +		}
> +
> +		link->init = sdm660_int_dai_init;
> +	}
> +}
> +
> +static const struct snd_soc_dapm_widget snd_sdm660_int_dapm_widgets[] = {
> +};
> +
??

> +static int snd_sdm660_int_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct sdm660_int_snd_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	card = devm_kzalloc(dev, sizeof(struct snd_soc_card), GFP_KERNEL);
> +	if (!card)
> +		return -ENOMEM;
> +
> +	data = devm_kzalloc(dev, sizeof(struct sdm660_int_snd_data), GFP_KERNEL);
> +	if (!card)
> +		return -ENOMEM;
> +
> +	card->driver_name = "sdm660-internal";
> +	card->dapm_widgets = snd_sdm660_int_dapm_widgets;
> +	card->num_dapm_widgets = ARRAY_SIZE(snd_sdm660_int_dapm_widgets);
> +	card->dev = dev;
> +	card->owner = THIS_MODULE;
> +
> +	ret = qcom_snd_parse_of(card);
> +	if (ret)
> +		return ret;
> +
> +	snd_soc_card_set_drvdata(card, data);
> +
> +	snd_sdm660_int_add_ops(card);
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static void snd_sdm660_int_remove(struct platform_device *pdev)
> +{
> +}
Why do we need this empty function.
> +
> +static const struct of_device_id snd_sdm660_int_device_id[] = {
> +	{ .compatible = "qcom,sdm660-internal-sndcard", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, snd_sdm660_int_device_id);
> +
> +static struct platform_driver snd_sdm660_int_driver = {
> +	.probe = snd_sdm660_int_probe,
> +	.remove = snd_sdm660_int_remove,
> +	.driver = {
> +		.name = "sdm660-int-sndcard",
> +		.of_match_table = snd_sdm660_int_device_id,
> +		.pm = &snd_soc_pm_ops,
> +	},
> +};
> +module_platform_driver(snd_sdm660_int_driver);
> +
> +MODULE_DESCRIPTION("sdm660 Internal ASoC Machine Driver");
> +MODULE_LICENSE("GPL");


