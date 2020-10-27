Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228E929A91E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 11:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897362AbgJ0KIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 06:08:10 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43561 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897360AbgJ0KIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 06:08:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id g12so1158646wrp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0EHvgCNrgvcXDm16RwWLmpbp6fZVh/2gRxXz60HJJfw=;
        b=AXtJi7wOUmEWuxK0Guadm/npFj7ioygK+aVqN1F1zn2b1HcT3cI/Amy5yDp0rr5K1A
         w57IQGfGD/jEdN7VCMrHhwBU4qtV4q4pMVJ4IkdFeBuz2ZpQAnbEWH1XEOh6m2XquuvE
         j4aKfN84yUQSDC0HIZmAmwV7DriVBLJwnAGJngwSCTKFdCXxVcosJc2USxTfw2gxJ7Av
         PtB4snzbSEqVXy5oIGFJJq4+9IYyymfEJfqQ6bq348iK9cmqkBh9xrIn78Lm0LYSFYFT
         MTYUN0PXIcvi2mkhvdyOZPIIaRFjP2poewN87s28xUXvxULQREwQ+1lSRAA+RNpfhLCe
         W4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0EHvgCNrgvcXDm16RwWLmpbp6fZVh/2gRxXz60HJJfw=;
        b=DvxHRe4KzyMb0+bFiiygAQbL+MYp1glbQjUozcx51Sa5B5TfAH9RyIIB/WE9QILP6U
         qIP7PJ3EgsEMTjhGhdvxhisn5lRvfr8oZrkWtDyK3AFejGSbkm9k6541vIJT6x89LVMe
         6BOhVXKayUhGa8MODp8bDkBFSR8pGnppVjttrGw2zksZ1r6r2iQ0V7P5J76eOnb+55wt
         YXH8GC2D3c0c/Uct7fWNf9+c0mfFLSGJ0rwGm82WwPlDnMqCLoqLeO2Kf+l1CREkQ0eH
         YFQ+1uZO0/EEBr0wyvkvb1k3GMv8fq6gQ/Le5zYPpZOyUQjg88ZyDN/Q9Lv+3YB/FPxy
         gKfg==
X-Gm-Message-State: AOAM531BMbR7XCM19Lrhq/jLTMULj0tZTyvMzermylMfYXohkVfWe1Cx
        sYX40tueHPOe8n8RWV/jY8RhXA==
X-Google-Smtp-Source: ABdhPJwpT/flkol7foxjtt5TuSdDvj4hG5XYuxH4oMMiopLlnd2lZTrk+9sX2Vb7TM/CRcs0pRcdhw==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr1865897wrv.224.1603793285943;
        Tue, 27 Oct 2020 03:08:05 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u195sm1532952wmu.18.2020.10.27.03.08.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 03:08:05 -0700 (PDT)
Subject: Re: [PATCH v12 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     Cheng-Yi Chiang <cychiang@chromium.org>,
        linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        xuyuqing@huaqin.corp-partner.google.com, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, Ajit Pandey <ajitp@codeaurora.org>
References: <20201027032234.1705835-1-cychiang@chromium.org>
 <20201027032234.1705835-3-cychiang@chromium.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ee4b5e84-cb1e-b2d5-a309-0f03a4e643e2@linaro.org>
Date:   Tue, 27 Oct 2020 10:08:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201027032234.1705835-3-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27/10/2020 03:22, Cheng-Yi Chiang wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add new driver to register sound card on sc7180 trogdor board and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S interfaces.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>

Looks good to me,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> Changes from v11 to v12
> - Machine driver:
>   - Use the definitaion of index LPASS_DP_RX in sc7180-lpass.h.
>   - Fix compatible string.
>   - Replace a comma with semicolon.
> 
>   sound/soc/qcom/Kconfig  |  12 ++
>   sound/soc/qcom/Makefile |   2 +
>   sound/soc/qcom/sc7180.c | 266 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 280 insertions(+)
>   create mode 100644 sound/soc/qcom/sc7180.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 484cad31da25..41cb08bd5588 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -138,4 +138,16 @@ config SND_SOC_SM8250
>   	  SM8250 SoC-based systems.
>   	  Say Y if you want to use audio device on this SoCs.
>   
> +config SND_SOC_SC7180
> +	tristate "SoC Machine driver for SC7180 boards"
> +	depends on I2C
> +	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_LPASS_SC7180
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_RT5682_I2C
> +	help
> +	  To add support for audio on Qualcomm Technologies Inc.
> +	  SC7180 SoC-based systems.
> +	  Say Y if you want to use audio device on this SoCs.
> +
>   endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index effa4b3f58fa..1600ae55bd34 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
>   snd-soc-storm-objs := storm.o
>   snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>   snd-soc-apq8096-objs := apq8096.o
> +snd-soc-sc7180-objs := sc7180.o
>   snd-soc-sdm845-objs := sdm845.o
>   snd-soc-sm8250-objs := sm8250.o
>   snd-soc-qcom-common-objs := common.o
> @@ -25,6 +26,7 @@ snd-soc-qcom-common-objs := common.o
>   obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>   obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>   obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
> +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>   obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
>   obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
>   obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> new file mode 100644
> index 000000000000..b391f64c3a80
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +//
> +// sc7180.c -- ALSA SoC Machine driver for SC7180
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +#include "../codecs/rt5682.h"
> +#include "common.h"
> +#include "lpass.h"
> +
> +#define DEFAULT_MCLK_RATE		19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
> +
> +#define DRIVER_NAME "SC7180"
> +
> +struct sc7180_snd_data {
> +	struct snd_soc_card card;
> +	u32 pri_mi2s_clk_count;
> +	struct snd_soc_jack hs_jack;
> +	struct snd_soc_jack hdmi_jack;
> +};
> +
> +static void sc7180_jack_free(struct snd_jack *jack)
> +{
> +	struct snd_soc_component *component = jack->private_data;
> +
> +	snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct snd_jack *jack;
> +	int rval;
> +
> +	rval = snd_soc_card_jack_new(
> +			card, "Headset Jack",
> +			SND_JACK_HEADSET |
> +			SND_JACK_HEADPHONE |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +			&pdata->hs_jack, NULL, 0);
> +
> +	if (rval < 0) {
> +		dev_err(card->dev, "Unable to add Headset Jack\n");
> +		return rval;
> +	}
> +
> +	jack = pdata->hs_jack.jack;
> +
> +	snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +	snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +	snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +	jack->private_data = component;
> +	jack->private_free = sc7180_jack_free;
> +
> +	return snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
> +}
> +
> +static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct snd_jack *jack;
> +	int rval;
> +
> +	rval = snd_soc_card_jack_new(
> +			card, "HDMI Jack",
> +			SND_JACK_LINEOUT,
> +			&pdata->hdmi_jack, NULL, 0);
> +
> +	if (rval < 0) {
> +		dev_err(card->dev, "Unable to add HDMI Jack\n");
> +		return rval;
> +	}
> +
> +	jack = pdata->hdmi_jack.jack;
> +	jack->private_data = component;
> +	jack->private_free = sc7180_jack_free;
> +
> +	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
> +}
> +
> +static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
> +		return sc7180_headset_init(rtd);
> +	case MI2S_SECONDARY:
> +		return 0;
> +	case LPASS_DP_RX:
> +		return sc7180_hdmi_init(rtd);
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	int ret;
> +
> +	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
> +		if (++data->pri_mi2s_clk_count == 1) {
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       LPASS_MCLK0,
> +					       DEFAULT_MCLK_RATE,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
> +		}
> +
> +		snd_soc_dai_set_fmt(codec_dai,
> +				    SND_SOC_DAIFMT_CBS_CFS |
> +				    SND_SOC_DAIFMT_NB_NF |
> +				    SND_SOC_DAIFMT_I2S);
> +
> +		/* Configure PLL1 for codec */
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> +					  DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> +		if (ret) {
> +			dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/* Configure sysclk for codec */
> +		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> +					     RT5682_PLL1_FREQ,
> +					     SND_SOC_CLOCK_IN);
> +		if (ret)
> +			dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +				ret);
> +
> +		break;
> +	case MI2S_SECONDARY:
> +		break;
> +	case LPASS_DP_RX:
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
> +		if (--data->pri_mi2s_clk_count == 0) {
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       LPASS_MCLK0,
> +					       0,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
> +		}
> +		break;
> +	case MI2S_SECONDARY:
> +		break;
> +	case LPASS_DP_RX:
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		break;
> +	}
> +}
> +
> +static const struct snd_soc_ops sc7180_ops = {
> +	.startup = sc7180_snd_startup,
> +	.shutdown = sc7180_snd_shutdown,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static void sc7180_add_ops(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, link) {
> +		link->ops = &sc7180_ops;
> +		link->init = sc7180_init;
> +	}
> +}
> +
> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct sc7180_snd_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	/* Allocate the private data */
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	card = &data->card;
> +	snd_soc_card_set_drvdata(card, data);
> +
> +	card->owner = THIS_MODULE;
> +	card->driver_name = DRIVER_NAME;
> +	card->dev = dev;
> +	card->dapm_widgets = sc7180_snd_widgets;
> +	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
> +
> +	ret = qcom_snd_parse_of(card);
> +	if (ret)
> +		return ret;
> +
> +	sc7180_add_ops(card);
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id sc7180_snd_device_id[]  = {
> +	{ .compatible = "google,sc7180-trogdor"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
> +
> +static struct platform_driver sc7180_snd_driver = {
> +	.probe = sc7180_snd_platform_probe,
> +	.driver = {
> +		.name = "msm-snd-sc7180",
> +		.of_match_table = sc7180_snd_device_id,
> +	},
> +};
> +module_platform_driver(sc7180_snd_driver);
> +
> +MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
> +MODULE_LICENSE("GPL v2");
> 
