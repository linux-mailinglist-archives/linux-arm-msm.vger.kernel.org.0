Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DCD45A292
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 13:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236597AbhKWMbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 07:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236527AbhKWMbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 07:31:44 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7451BC061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:36 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a18so2107563wrn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bGj9Uujhh4Y+W0ZchKUC79IB1rio1pBAkdGssaE6zOs=;
        b=HadL7mFa65Oo5davoaiwMInFWhmhlNYrNceYnL81aLGLQFDdhH908W1TRfzWjjew9v
         yaMQbJ4k9cOwp3erWCTrAWZLTn1F5aSQ6rE07ECtA9QPQeYc+96d0brBhXie6rUZDIIi
         qW9iT5dh4dB9GT5o2Gg/FLuE0hDquygCay5nwrp2TBQVuQrXMIEAFDrKuOaFhhks8K+k
         Kl5VpJsy+wt0Jw8CTzSpz47ndlb/bJoJLj+w+seXgRqdCvvLV7Df5spz7F1WJIfJOD24
         YzpProhCnwzUqq4bxhT2bx7MSqRgVASBidrNgR1arNHnHhPLuUCRNB/xBAkvI1cZvIWr
         IwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bGj9Uujhh4Y+W0ZchKUC79IB1rio1pBAkdGssaE6zOs=;
        b=gr6xQcGviNdqUDR+Fbvr9wv2V9gC5rWQB1qXezTlpUlxviH3n5O5tMQ9/sFnSYJV3x
         3sVyynMnp2cFcIF9w0k/e6EkH+4lvJEuSrrBwu0iVjNESYrtx7h/qnKD4hgE5MxD5XPw
         OB1OhKgo+qnbbSnTSjsbU186Nlr4aqf3jquphrVzUQH82rZrpiqVToMpXYH04NyDapXh
         EZzp83H8zaAzEHHjOCZIhdcCuIFk0+0P/ZblKPNRxg/1FrCz8ExLKV0wvEcil2/pM4xN
         UhmwBj0Bz4T7CfjZQELvIvgbhnGi/jeunEHESpS+A5GXrXPpGm3g76ZO2f4PJ/mUWbQ6
         3WRA==
X-Gm-Message-State: AOAM531eOM2jTdmrdTMZiVZTaztl+/7Pv1FOajguk3Lwam0olUMyXlrO
        Wz5Vl7cq7lCUlIirF5wrnT9kHeQ7PefyXA==
X-Google-Smtp-Source: ABdhPJwczTkwupGab3wyOc6MJNoGVGxUSPYsrLQaK1BuLC9yX21F+zT5G0m9mUBjUsw7sKV8dL0GMA==
X-Received: by 2002:a5d:452c:: with SMTP id j12mr6421219wra.430.1637670514860;
        Tue, 23 Nov 2021 04:28:34 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id z8sm12049598wrh.54.2021.11.23.04.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:28:34 -0800 (PST)
Subject: Re: [PATCH v5 06/10] ASoC: qcom: Add support for codec dma driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
 <1637581599-24120-2-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3900e628-4baf-ddc9-e033-adc07fdf66c1@linaro.org>
Date:   Tue, 23 Nov 2021 12:28:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637581599-24120-2-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/11/2021 11:46, Srinivasa Rao Mandadapu wrote:
> Upadate lpass cpu and platform driver to support audio over codec dma
> in ADSP bypass use case.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   sound/soc/qcom/common.c         |  39 ++++
>   sound/soc/qcom/common.h         |   1 +

common.c is mostly intended to be used by machine drivers, so I would 
suggest that you move it to lpass.h and make is_cdc_dma_port a static 
inlnie function.

>   sound/soc/qcom/lpass-cpu.c      |  60 +++++-
>   sound/soc/qcom/lpass-platform.c | 424 ++++++++++++++++++++++++++++++++++++++--
>   4 files changed, 508 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 09af007..26d3752 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -4,6 +4,7 @@
>   
>   #include <linux/module.h>
>   #include "common.h"
> +#include "lpass.h"
>   
>   int qcom_snd_parse_of(struct snd_soc_card *card)
>   {
> @@ -169,4 +170,42 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
>   }
>   EXPORT_SYMBOL(qcom_snd_parse_of);
>   
> +bool is_cdc_dma_port(int dai_id)
> +{
> +	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0:
> +	case LPASS_CDC_DMA_RX1:
> +	case LPASS_CDC_DMA_RX2:
> +	case LPASS_CDC_DMA_RX3:
> +	case LPASS_CDC_DMA_RX4:
> +	case LPASS_CDC_DMA_RX5:
> +	case LPASS_CDC_DMA_RX6:
> +	case LPASS_CDC_DMA_RX7:
> +	case LPASS_CDC_DMA_RX8:
> +	case LPASS_CDC_DMA_RX9:
> +	case LPASS_CDC_DMA_TX0:
> +	case LPASS_CDC_DMA_TX1:
> +	case LPASS_CDC_DMA_TX2:
> +	case LPASS_CDC_DMA_TX3:
> +	case LPASS_CDC_DMA_TX4:
> +	case LPASS_CDC_DMA_TX5:
> +	case LPASS_CDC_DMA_TX6:
> +	case LPASS_CDC_DMA_TX7:
> +	case LPASS_CDC_DMA_TX8:
> +	case LPASS_CDC_DMA_VA_TX0:
> +	case LPASS_CDC_DMA_VA_TX1:
> +	case LPASS_CDC_DMA_VA_TX2:
> +	case LPASS_CDC_DMA_VA_TX3:
> +	case LPASS_CDC_DMA_VA_TX4:
> +	case LPASS_CDC_DMA_VA_TX5:
> +	case LPASS_CDC_DMA_VA_TX6:
> +	case LPASS_CDC_DMA_VA_TX7:
> +	case LPASS_CDC_DMA_VA_TX8:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(is_cdc_dma_port);
> +
>   MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index f05c05b..a8fea4c 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
> @@ -7,5 +7,6 @@
>   #include <sound/soc.h>
>   
>   int qcom_snd_parse_of(struct snd_soc_card *card);
> +bool is_cdc_dma_port(int dai_id);
>   
>   #endif
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 3bd9eb3..9e6656c 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -17,6 +17,7 @@
>   #include <sound/soc.h>
>   #include <sound/soc-dai.h>
>   #include "lpass-lpaif-reg.h"
> +#include "common.h"
>   #include "lpass.h"
>   
>   #define LPASS_CPU_MAX_MI2S_LINES	4
> @@ -857,7 +858,9 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>   		}
>   		if (id == LPASS_DP_RX) {
>   			data->hdmi_port_enable = 1;
> -		} else {
> +		} else if (is_cdc_dma_port(id))
> +			data->codec_dma_enable = 1;
> +		else {
>   			data->mi2s_playback_sd_mode[id] =
>   				of_lpass_cpu_parse_sd_lines(dev, node,
>   							    "qcom,playback-sd-lines");
> @@ -872,6 +875,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   {
>   	struct lpass_data *drvdata;
>   	struct device_node *dsp_of_node;
> +	struct resource *res;
>   	struct lpass_variant *variant;
>   	struct device *dev = &pdev->dev;
>   	const struct of_device_id *match;
> @@ -897,6 +901,58 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>   
> +	drvdata->num_clks =  variant->num_clks;
> +	if (drvdata->codec_dma_enable) {
> +		drvdata->rxtx_lpaif =
> +				devm_platform_ioremap_resource_byname(pdev, "lpass-rxtx-lpaif");
> +		if (IS_ERR(drvdata->rxtx_lpaif))
> +			return PTR_ERR(drvdata->rxtx_lpaif);
> +
> +		drvdata->va_lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-va-lpaif");
> +		if (IS_ERR(drvdata->va_lpaif))
> +			return PTR_ERR(drvdata->va_lpaif);
> +
> +		lpass_rxtx_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
> +					variant->rxtx_wrdma_channels +
> +					variant->rxtx_wrdma_channel_start, LPASS_CDC_DMA_TX3);
> +
> +		drvdata->rxtx_lpaif_map = devm_regmap_init_mmio(dev, drvdata->rxtx_lpaif,
> +					&lpass_rxtx_regmap_config);
> +		if (IS_ERR(drvdata->rxtx_lpaif_map)) {
> +			dev_err(dev, "error initializing rxtx regmap: %ld\n",
> +				PTR_ERR(drvdata->rxtx_lpaif_map));
> +			return PTR_ERR(drvdata->rxtx_lpaif_map);
> +		}
> +		lpass_va_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
> +					variant->va_wrdma_channels +
> +					variant->va_wrdma_channel_start, LPASS_CDC_DMA_VA_TX0);
> +
> +		drvdata->va_lpaif_map = devm_regmap_init_mmio(dev, drvdata->va_lpaif,
> +					&lpass_va_regmap_config);
> +		if (IS_ERR(drvdata->va_lpaif_map)) {
> +			dev_err(dev, "error initializing va regmap: %ld\n",
> +				PTR_ERR(drvdata->va_lpaif_map));
there is a 100 chars limit now, so you can wrap this to a single line.

> +			return PTR_ERR(drvdata->va_lpaif_map);
> +		}
> +		drvdata->cdc_clks = devm_kcalloc(dev, variant->cdc_dma_num_clks,
> +					sizeof(*drvdata->cdc_clks), GFP_KERNEL);
> +		drvdata->cdc_num_clks =  variant->cdc_dma_num_clks;
double space after =

> +
> +		for (i = 0; i < drvdata->cdc_num_clks; i++)
> +			drvdata->cdc_clks[i].id = variant->cdc_dma_clk_names[i];
> +
> +		ret = devm_clk_bulk_get(dev, drvdata->cdc_num_clks, drvdata->cdc_clks);
> +		if (ret) {
> +			dev_err(dev, "Failed to get clocks %d\n", ret);
> +			return ret;
> +		}
> +
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
> +		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
> +
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
> +		drvdata->va_cdc_dma_lpm_buf = res->start;
> +	}
>   	drvdata->lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-lpaif");
>   	if (IS_ERR(drvdata->lpaif))
>   		return PTR_ERR(drvdata->lpaif);
> @@ -939,7 +995,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	for (i = 0; i < variant->num_dai; i++) {
>   		dai_id = variant->dai_driver[i].id;
> -		if (dai_id == LPASS_DP_RX)
> +		if (dai_id == LPASS_DP_RX || is_cdc_dma_port(dai_id))
>   			continue;
>   
>   		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 59c0884..4b79908 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -14,12 +14,15 @@
>   #include <linux/regmap.h>
>   #include <sound/soc.h>
>   #include "lpass-lpaif-reg.h"
> +#include "common.h"
>   #include "lpass.h"
>   
>   #define DRV_NAME "lpass-platform"
>   
>   #define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
>   #define LPASS_PLATFORM_PERIODS		2
> +#define LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE (24 * 1024)
> +#define LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE (12 * 1024)
>   
>   static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
>   	.info			=	SNDRV_PCM_INFO_MMAP |
> @@ -45,6 +48,103 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
>   	.fifo_size		=	0,
>   };
>   
> +static const struct snd_pcm_hardware lpass_platform_rxtx_hardware = {
> +	.info			=	SNDRV_PCM_INFO_MMAP |
> +					SNDRV_PCM_INFO_MMAP_VALID |
> +					SNDRV_PCM_INFO_INTERLEAVED |
> +					SNDRV_PCM_INFO_PAUSE |
> +					SNDRV_PCM_INFO_RESUME,
> +	.formats		=	SNDRV_PCM_FMTBIT_S16 |
> +					SNDRV_PCM_FMTBIT_S24 |
> +					SNDRV_PCM_FMTBIT_S32,
> +	.rates			=	SNDRV_PCM_RATE_8000_192000,
> +	.rate_min		=	8000,
> +	.rate_max		=	192000,
> +	.channels_min		=	1,
> +	.channels_max		=	8,
> +	.buffer_bytes_max	=	LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE,
> +	.period_bytes_max	=	LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
> +						LPASS_PLATFORM_PERIODS,
> +	.period_bytes_min	=	LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
> +						LPASS_PLATFORM_PERIODS,
> +	.periods_min		=	LPASS_PLATFORM_PERIODS,
> +	.periods_max		=	LPASS_PLATFORM_PERIODS,
> +	.fifo_size		=	0,
> +};
> +
> +static const struct snd_pcm_hardware lpass_platform_va_hardware = {
> +	.info			=	SNDRV_PCM_INFO_MMAP |
> +					SNDRV_PCM_INFO_MMAP_VALID |
> +					SNDRV_PCM_INFO_INTERLEAVED |
> +					SNDRV_PCM_INFO_PAUSE |
> +					SNDRV_PCM_INFO_RESUME,
> +	.formats		=	SNDRV_PCM_FMTBIT_S16 |
> +					SNDRV_PCM_FMTBIT_S24 |
> +					SNDRV_PCM_FMTBIT_S32,
> +	.rates			=	SNDRV_PCM_RATE_8000_192000,
> +	.rate_min		=	8000,
> +	.rate_max		=	192000,
> +	.channels_min		=	1,
> +	.channels_max		=	8,
> +	.buffer_bytes_max	=	LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE,
> +	.period_bytes_max	=	LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE /
> +						LPASS_PLATFORM_PERIODS,
> +	.period_bytes_min	=	LPSAS_VA_CDC_DMA_LPM_BUFF_SIZE /
> +						LPASS_PLATFORM_PERIODS,
> +	.periods_min		=	LPASS_PLATFORM_PERIODS,
> +	.periods_max		=	LPASS_PLATFORM_PERIODS,
> +	.fifo_size		=	0,
> +};
> +
> +static int lpass_platform_alloc_rxtx_dmactl_fields(struct device *dev,
> +					 struct regmap *map)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
> +	int rval;
> +
> +	drvdata->rxtx_rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
> +					  GFP_KERNEL);
> +	if (drvdata->rxtx_rd_dmactl == NULL)
> +		return -ENOMEM;
> +
> +	drvdata->rxtx_wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
> +					  GFP_KERNEL);
> +	if (drvdata->rxtx_wr_dmactl == NULL)
> +		return -ENOMEM;
> +
> +	rd_dmactl = drvdata->rxtx_rd_dmactl;
> +	wr_dmactl = drvdata->rxtx_wr_dmactl;

may be rewrite this to:

	rd_dmactl = devm_kzalloc(dev, sizeof(*rd_dmactl), GFP_KERNEL);
	if (rd_dmactl == NULL)
		return -ENOMEM;

	wr_dmactl = devm_kzalloc(dev, sizeof(*wr_dmactl), GFP_KERNEL);
	if (wr_dmactl == NULL)
		return -ENOMEM;

	drvdata->rxtx_rd_dmactl = rd_dmactl;
	drvdata->rxtx_wr_dmactl = wr_dmactl;


> +
> +	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
> +					    &v->rxtx_rdma_intf, 15);

can we define this magic number 15 properly?
> +	if (rval)
> +		return rval;
> +
> +	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
> +					    &v->rxtx_wrdma_intf, 15);
> +}
> +
> +static int lpass_platform_alloc_va_dmactl_fields(struct device *dev,
> +					 struct regmap *map)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	struct lpaif_dmactl *wr_dmactl;
> +
> +	drvdata->va_wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
> +					  GFP_KERNEL);
> +	if (drvdata->va_wr_dmactl == NULL)
> +		return -ENOMEM;
> +
> +	wr_dmactl = drvdata->va_wr_dmactl;
simillar comment.

> +
> +	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
> +					    &v->va_wrdma_intf, 15);
> +}
> +
> +
>   static int lpass_platform_alloc_dmactl_fields(struct device *dev,
>   					 struct regmap *map)
>   {
> @@ -126,22 +226,43 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   	if (cpu_dai->driver->id == LPASS_DP_RX) {
>   		map = drvdata->hdmiif_map;
>   		drvdata->hdmi_substream[dma_ch] = substream;
> +	} else if (dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) {
> +		map = drvdata->rxtx_lpaif_map;
> +		drvdata->rxtx_substream[dma_ch] = substream;
> +	} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
> +		map = drvdata->va_lpaif_map;
> +		drvdata->va_substream[dma_ch] = substream;
>   	} else {
>   		map = drvdata->lpaif_map;
>   		drvdata->substream[dma_ch] = substream;
>   	}
>   	data->dma_ch = dma_ch;
> -	ret = regmap_write(map,
> -			LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
> -	if (ret) {
> -		dev_err(soc_runtime->dev,
> -			"error writing to rdmactl reg: %d\n", ret);
> -		return ret;
> +	if (!(dai_id == LPASS_CDC_DMA_RX0 ||
> +		dai_id == LPASS_CDC_DMA_TX3 ||
> +		dai_id == LPASS_CDC_DMA_VA_TX0)) {
> +		ret = regmap_write(map, LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
> +		if (ret) {
> +			dev_err(soc_runtime->dev,
> +				"error writing to rdmactl reg: %d\n", ret);
> +			return ret;
> +		}
>   	}
> -	snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
> -
> -	runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
>   
> +	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0:
> +	case LPASS_CDC_DMA_TX3:
> +		snd_soc_set_runtime_hwparams(substream, &lpass_platform_rxtx_hardware);
> +		runtime->dma_bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +		break;
> +	case LPASS_CDC_DMA_VA_TX0:
> +		snd_soc_set_runtime_hwparams(substream, &lpass_platform_va_hardware);
> +		runtime->dma_bytes = lpass_platform_va_hardware.buffer_bytes_max;
> +		break;
> +	default:
> +		snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
> +		runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
> +		break;
> +	}
>   	ret = snd_pcm_hw_constraint_integer(runtime,
>   			SNDRV_PCM_HW_PARAM_PERIODS);
>   	if (ret < 0) {
> @@ -168,6 +289,10 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>   	data = runtime->private_data;
>   	if (dai_id == LPASS_DP_RX)
>   		drvdata->hdmi_substream[data->dma_ch] = NULL;
> +	else if (dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3)
> +		drvdata->rxtx_substream[data->dma_ch] = NULL;
> +	else if (dai_id == LPASS_CDC_DMA_VA_TX0)
> +		drvdata->va_substream[data->dma_ch] = NULL;
>   	else
>   		drvdata->substream[data->dma_ch] = NULL;
>   	if (v->free_dma_channel)
> @@ -198,14 +323,27 @@ static void __get_lpaif_handle(struct snd_pcm_substream *substream,
>   		if (dai_id == LPASS_DP_RX) {
>   			l_dmactl = drvdata->hdmi_rd_dmactl;
>   			l_map = drvdata->hdmiif_map;
> +		} else if (dai_id == LPASS_CDC_DMA_RX0) {
> +			l_map = drvdata->rxtx_lpaif_map;
> +			l_dmactl = drvdata->rxtx_rd_dmactl;
>   		} else {
>   			l_dmactl = drvdata->rd_dmactl;
>   			l_map = drvdata->lpaif_map;
>   		}
>   	} else {
> -		l_dmactl = drvdata->wr_dmactl;
> -		l_id = pcm_data->dma_ch - v->wrdma_channel_start;
> -		l_map = drvdata->lpaif_map;
> +		if (dai_id == LPASS_CDC_DMA_TX3) {
> +			l_dmactl = drvdata->rxtx_wr_dmactl;
> +			l_map = drvdata->rxtx_lpaif_map;
> +			l_id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
> +		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
> +			l_dmactl = drvdata->va_wr_dmactl;
> +			l_map = drvdata->va_lpaif_map;
> +			l_id = pcm_data->dma_ch - v->va_wrdma_channel_start;
> +		} else {
> +			l_dmactl = drvdata->wr_dmactl;
> +			l_id = pcm_data->dma_ch - v->wrdma_channel_start;
> +			l_map = drvdata->lpaif_map;
> +		}
>   	}
>   	if (dmactl)
>   		*dmactl = l_dmactl;
> @@ -256,6 +394,10 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   	}
>   
>   	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0:
> +	case LPASS_CDC_DMA_TX3:
> +	case LPASS_CDC_DMA_VA_TX0:

Is there a reason why we can not add support to other CDC_DMA dais as 
part of this patchset?

> +		break;
>   	case LPASS_DP_RX:
>   		ret = regmap_fields_write(dmactl->burst8, id,
>   							LPAIF_DMACTL_BURSTEN_INCR4);
> @@ -380,6 +522,10 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
>   
>   	if (dai_id == LPASS_DP_RX)
>   		map = drvdata->hdmiif_map;
> +	else if (dai_id == LPASS_CDC_DMA_RX0 ||
> +		dai_id == LPASS_CDC_DMA_TX3 ||
> +		dai_id == LPASS_CDC_DMA_VA_TX0)
> +		return 0;
>   	else
>   		map = drvdata->lpaif_map;
>   
> @@ -434,6 +580,16 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>   		return ret;
>   	}
>   
> +	if (dai_id == LPASS_CDC_DMA_RX0 ||
> +		dai_id == LPASS_CDC_DMA_TX3 ||
> +		dai_id == LPASS_CDC_DMA_VA_TX0) {
> +		ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error writing fifowm field to dmactl reg: %d, id: %d\n",
> +				ret, id);
> +			return ret;
> +		}
> +	}
>   	ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
>   	if (ret) {
>   		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
> @@ -476,6 +632,22 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   			return ret;
>   		}
>   		switch (dai_id) {
> +		case LPASS_CDC_DMA_RX0:
> +		case LPASS_CDC_DMA_TX3:
> +		case LPASS_CDC_DMA_VA_TX0:
> +			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
> +			if (ret) {
> +				dev_err(soc_runtime->dev,
> +					"error writing to rdmactl reg field: %d\n", ret);
> +				return ret;
> +			}
> +			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_irqclr = LPAIF_IRQ_ALL(ch);
> +
> +			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_mask = LPAIF_IRQ_ALL(ch);
> +			val_irqen = LPAIF_IRQ_ALL(ch);
> +			break;
>   		case LPASS_DP_RX:
>   			ret = regmap_fields_write(dmactl->dyncclk, id,
>   					 LPAIF_DMACTL_DYNCLK_ON);
> @@ -540,6 +712,24 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   			return ret;
>   		}
>   		switch (dai_id) {
> +		case LPASS_CDC_DMA_RX0:
> +		case LPASS_CDC_DMA_TX3:
> +		case LPASS_CDC_DMA_VA_TX0:
> +			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
> +			if (ret) {
> +				dev_err(soc_runtime->dev,
> +					"error writing to rdmactl reg field: %d\n", ret);
> +				return ret;
> +			}
> +
> +			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_irqclr = LPAIF_IRQ_ALL(ch);
> +
> +			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_mask = LPAIF_IRQ_ALL(ch);
> +			val_irqen = LPAIF_IRQ_ALL(ch);
> +
> +		break;
>   		case LPASS_DP_RX:
>   			ret = regmap_fields_write(dmactl->dyncclk, id,
>   					 LPAIF_DMACTL_DYNCLK_OFF);
> @@ -619,6 +809,38 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>   	return bytes_to_frames(substream->runtime, curr_addr - base_addr);
>   }
>   
> +static int lpass_platform_cdc_dma_mmap(struct snd_soc_component *component,
> +			struct snd_pcm_substream *substream,
> +			struct vm_area_struct *vma)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	unsigned long size, offset;
> +
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	size = vma->vm_end - vma->vm_start;
> +	offset = vma->vm_pgoff << PAGE_SHIFT;
> +	return io_remap_pfn_range(vma, vma->vm_start,
> +			(runtime->dma_addr + offset) >> PAGE_SHIFT,
> +			size, vma->vm_page_prot);
> +
> +}
> +
> +static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
> +				      struct snd_pcm_substream *substream,
> +				      struct vm_area_struct *vma)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	if (dai_id == LPASS_CDC_DMA_RX0 ||
> +		dai_id == LPASS_CDC_DMA_TX3 ||
> +		dai_id == LPASS_CDC_DMA_VA_TX0) {
> +		return lpass_platform_cdc_dma_mmap(component, substream, vma);
> +	}
> +	return 0;
> +}
> +
>   static irqreturn_t lpass_dma_interrupt_handler(
>   			struct snd_pcm_substream *substream,
>   			struct lpass_data *drvdata,
> @@ -635,6 +857,14 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   
>   	mask = LPAIF_IRQ_ALL(chan);
>   	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0:
> +	case LPASS_CDC_DMA_TX3:
> +	case LPASS_CDC_DMA_VA_TX0:
> +		map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
> +				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;
> +		reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +		val = 0;
> +		break;
>   	case LPASS_DP_RX:
>   		map = drvdata->hdmiif_map;
>   		reg = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
> @@ -758,18 +988,112 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>   				return rv;
>   		}
>   	}
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
> +{
> +	struct lpass_data *drvdata = data;
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int irqs;
> +	int rv, chan;
> +
> +	rv = regmap_read(drvdata->rxtx_lpaif_map,
> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_RX0), &irqs);
> +	if (rv)
> +		return IRQ_NONE;
> +	/* Handle per channel interrupts */
> +	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
> +			rv = lpass_dma_interrupt_handler(
> +						drvdata->rxtx_substream[chan],
> +						drvdata, chan, irqs);
> +			if (rv != IRQ_HANDLED)
> +				return rv;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
> +{
> +	struct lpass_data *drvdata = data;
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int irqs;
> +	int rv, chan;
>   
> +	rv = regmap_read(drvdata->va_lpaif_map,
> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST,
> +			LPASS_CDC_DMA_VA_TX0), &irqs);
> +	if (rv)
> +		return IRQ_NONE;
> +	/* Handle per channel interrupts */
> +	for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
> +			rv = lpass_dma_interrupt_handler(
> +						drvdata->va_substream[chan],
> +						drvdata, chan, irqs);
> +			if (rv != IRQ_HANDLED)
> +				return rv;
> +		}
> +	}
>   	return IRQ_HANDLED;
>   }
>   
> +static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
> +			struct snd_pcm *pcm, int dai_id)
> +{
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct snd_pcm_substream *substream;
> +	struct snd_dma_buffer *buf;
> +	int ret;
> +
> +	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
> +		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
> +	else
> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
> +
> +	ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return ret;
> +
> +	buf = &substream->dma_buffer;
> +	buf->dev.dev = pcm->card->dev;
> +	buf->private_data = NULL;
> +
> +	/* Assign Codec DMA buffer pointers */
> +	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
> +	if (dai_id == LPASS_CDC_DMA_RX0) {
> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
> +	} else if (dai_id == LPASS_CDC_DMA_TX3) {
> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +	} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
> +		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
> +		buf->addr = drvdata->va_cdc_dma_lpm_buf;
> +	}
> +
> +	buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
> +
> +	return 0;
> +}
> +
>   static int lpass_platform_pcm_new(struct snd_soc_component *component,
>   				  struct snd_soc_pcm_runtime *soc_runtime)
>   {
>   	struct snd_pcm *pcm = soc_runtime->pcm;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
>   	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
>   
> -	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> -					    component->dev, size);
> +	if (is_cdc_dma_port(dai_id))
> +		return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
May be a comment here would be nice for reader to understand why we 
allocate this buffer.

> +	else
> +		return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> +						component->dev, size);
>   }
>   
>   static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
> @@ -804,6 +1128,22 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
>   	return regcache_sync(map);
>   }
>   
> +int lpass_platform_copy(struct snd_soc_component *component,
> +			 struct snd_pcm_substream *substream, int channel,
> +			 unsigned long pos, void __user *buf, unsigned long bytes)
> +{
> +	struct snd_pcm_runtime *rt = substream->runtime;
> +
> +	unsigned char *dma_buf = rt->dma_area + pos +
> +				channel * (rt->dma_bytes / rt->channels);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		return copy_from_user_toio(dma_buf, buf, bytes);
> +	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> +		return copy_to_user_fromio(buf, dma_buf, bytes);
> +
> +	return 0;
> +}
>   
>   static const struct snd_soc_component_driver lpass_component_driver = {
>   	.name		= DRV_NAME,
> @@ -814,9 +1154,11 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>   	.prepare	= lpass_platform_pcmops_prepare,
>   	.trigger	= lpass_platform_pcmops_trigger,
>   	.pointer	= lpass_platform_pcmops_pointer,
> +	.mmap		= lpass_platform_pcmops_mmap,

isn't this just snd_pcm_lib_mmap_iomem for cdc dma.

>   	.pcm_construct	= lpass_platform_pcm_new,
>   	.suspend		= lpass_platform_pcmops_suspend,
>   	.resume			= lpass_platform_pcmops_resume,
> +	.copy_user		= lpass_platform_copy,

Why do we need this for other non cdc dma dais?


Am thinking that we shoudl have a seperate instance of this for dais 
that can only do dma with hardware buffers.

>   
>   };
>   
> @@ -854,6 +1196,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	if (drvdata->codec_dma_enable) {
> +		ret = regmap_write(drvdata->rxtx_lpaif_map,
> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_TX3), 0x0);
> +		if (ret) {
> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> +			return ret;
> +		}
> +		ret = regmap_write(drvdata->va_lpaif_map,
> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_VA_TX0), 0x0);
> +		if (ret) {
> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> +			return ret;
> +		}
> +		drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
> +		if (drvdata->rxtxif_irq < 0)
> +			return -ENODEV;
> +
> +		ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
> +				lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
> +				"lpass-irq-rxtxif", drvdata);
> +		if (ret) {
> +			dev_err(&pdev->dev, "rxtx irq request failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = lpass_platform_alloc_rxtx_dmactl_fields(&pdev->dev,
> +						 drvdata->rxtx_lpaif_map);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error initializing rxtx dmactl fields: %d\n", ret);
> +			return ret;
> +		}
> +
> +		drvdata->vaif_irq = platform_get_irq_byname(pdev, "lpass-irq-vaif");
> +		if (drvdata->vaif_irq < 0)
> +			return -ENODEV;
> +
> +		ret = devm_request_irq(&pdev->dev, drvdata->vaif_irq,
> +				lpass_platform_vaif_irq, IRQF_TRIGGER_RISING,
> +				"lpass-irq-vaif", drvdata);
> +		if (ret) {
> +			dev_err(&pdev->dev, "va irq request failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = lpass_platform_alloc_va_dmactl_fields(&pdev->dev,
> +						 drvdata->va_lpaif_map);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error initializing va dmactl fields: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>   	if (drvdata->hdmi_port_enable) {
>   		drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
>   		if (drvdata->hdmiif_irq < 0)
> 
