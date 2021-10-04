Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFA9421313
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 17:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbhJDPwu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 11:52:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:31396 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234391AbhJDPwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 11:52:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633362660; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=UFJF7rvcWoXxeHRWJ7Q4jnW0oWuIdJoL6fGNh6XQlR4=; b=kM8zvD8P5613PrPWWzCjZbzQEVxa/BPWbx5x/CAwuH/4DLO85MoxPDyMOVet2QCwdeG2J/32
 g/apD7xFb01/RIeBjU3324Aow7ieZLlbO4lwYRGFamgliHsIupHuNmQ51EvK5L0g0IxJqfkZ
 7F7KzEadR0L4/p6sl3VtQ/lRExg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615b22dba5a9bab6e83320aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 15:50:51
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 522A2C4361A; Mon,  4 Oct 2021 15:50:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.102] (unknown [157.48.255.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23BA0C4338F;
        Mon,  4 Oct 2021 15:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 23BA0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 4/8] ASoC: qcom: Add lapss CPU driver for codec dma
 control
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
 <1633087292-1378-5-git-send-email-srivasam@codeaurora.org>
 <YVcuzEXA4Ej3HpHH@google.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <8c5484d9-eb78-102f-c4bc-7ce9e9c1b573@codeaurora.org>
Date:   Mon, 4 Oct 2021 21:20:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVcuzEXA4Ej3HpHH@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/1/2021 9:22 PM, Matthias Kaehlcke wrote:
Thanks for Your time Matthias!!!
> On Fri, Oct 01, 2021 at 04:51:28PM +0530, Srinivasa Rao Mandadapu wrote:
>> Subject: ASoC: qcom: Add lapss CPU driver for codec dma control
> nit: s/lapss/lpass/
Okay. Will change.
>> Add lpass cpu driver to support audio over codec dma for
>> ADSP bypass usecase.
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-cdc-dma.c | 263 +++++++++++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass.h         |   1 +
>>   2 files changed, 264 insertions(+)
>>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
>>
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
>> new file mode 100644
>> index 0000000..56b3791
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
>> @@ -0,0 +1,263 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021 The Linux Foundation. All rights reserved.
>> + *
>> + * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <sound/soc.h>
>> +#include <sound/soc-dai.h>
>> +
>> +#include "lpass-lpaif-reg.h"
>> +#include "lpass.h"
>> +
>> +static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
>> +					 struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +	struct snd_pcm_runtime *rt = substream->runtime;
>> +	struct lpass_pcm_data *pcm_data = rt->private_data;
>> +	struct lpass_variant *v = drvdata->variant;
>> +	struct lpaif_dmactl *dmactl;
>> +	struct regmap *map;
>> +	int dir = substream->stream;
>> +	int ret, id;
>> +	unsigned int dai_id = cpu_dai->driver->id;
>> +
>> +	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> s/ ==  / == /
Okay. Will change it.
>> +		dmactl = drvdata->rxtx_rd_dmactl;
>> +		map = drvdata->rxtx_lpaif_map;
>> +		id = pcm_data->dma_ch;
>> +	} else {
>> +		if (dai_id == LPASS_CDC_DMA_TX3) {
>> +			dmactl = drvdata->rxtx_wr_dmactl;
>> +			map = drvdata->rxtx_lpaif_map;
>> +			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>> +		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +			dmactl = drvdata->va_wr_dmactl;
>> +			map = drvdata->va_lpaif_map;
>> +			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>> +		}
>> +	}
> 'map' is assigned here, but not used in the rest of the function, drop it.
Okay. will remove it.
>> +
>> +	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> s/ ==  / == /
Okay. Will change it.
>> +		ret = regmap_fields_write(dmactl->codec_intf, id, LPASS_CDC_DMA_RX0_INTERFACE);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to rdmactl reg: %d\n", ret);
> Some of the logs print the register name, others don't, why not log it
> always?
>
>> +			return ret;
>> +		}
>> +	    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
> fix indentation
Okay. will change it.
>
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to rdmactl reg: %d\n", ret);
>> +			return ret;
>> +		}
>> +		ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to rdmactl codec_fs_delay reg field: %d\n", ret);
>> +			return ret;
>> +		}
>> +		ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to rdmactl codec_pack reg field: %d\n", ret);
>> +			return ret;
>> +		}
>> +		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to rdmactl reg: %d\n", ret);
>> +			return ret;
>> +		}
>> +
> Remove empty line
Okay. will remove it.
>
>> +	} else {
>> +		ret = regmap_fields_write(dmactl->codec_intf, id, LPASS_CDC_DMA_INTERFACE(dai_id));
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to wrdmactl codec_intf reg field: %d\n", ret);
>> +			return ret;
>> +		}
>> +	    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
> fix indentation
Okay. Will change it.
>
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to wrdmactl codec_fs_sel reg field: %d\n", ret);
>> +			return ret;
>> +		}
>> +		ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to wrdmactl codec_fs_delay reg field: %d\n", ret);
>> +			return ret;
>> +		}
>> +		ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to wrdmactl codec_pack reg field: %d\n", ret);
>> +			return ret;
>> +		}
>> +		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to wrdmactl codec_enable reg field: %d\n", ret);
>> +			return ret;
>> +		}
> The last four register writes are exactly the same in both branches, only the
> logging distinguishes between 'rdmactl' and 'wrdmactl'. Those should be in the
> main branch, if you really need to distinguish between 'rdmactl' and 'wrdmactl'
> in the logging you can assign a string pointer in the 'if (dir == SNDRV_PCM_STREAM_PLAYBACK)'
> branches.
Okay. Will optimize code. I don't think rdmactl/wrdmactl is distinguish 
required.
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int lpass_wcd_daiops_startup(struct snd_pcm_substream *substream,
>> +		struct snd_soc_dai *dai)
>> +{
>> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +	int ret, i;
>> +
>> +	for (i = 0; i < drvdata->cdc_num_clks; i++) {
>> +		ret = clk_prepare_enable(drvdata->cdc_dma_clks[i]);
>> +		if (ret) {
>> +			dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
>> +			return ret;
> Disable clocks that have been enabled previously?
Okay. will use bulk clock API here.
>
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream *substream,
>> +		struct snd_soc_dai *dai)
>> +{
>> +	int i;
>> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +
>> +	for (i = 0; i < drvdata->cdc_num_clks; i++)
>> +		clk_disable_unprepare(drvdata->cdc_dma_clks[i]);
>> +}
>> +
>> +static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream *substream,
>> +		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
>> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +	struct lpaif_dmactl *dmactl;
>> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +	struct snd_pcm_runtime *rt = substream->runtime;
>> +	struct lpass_pcm_data *pcm_data = rt->private_data;
>> +	struct lpass_variant *v = drvdata->variant;
>> +	struct regmap *map;
>> +	int dir = substream->stream;
>> +	unsigned int ret, regval;
>> +	unsigned int channels = params_channels(params);
>> +	int id;
>> +	unsigned int dai_id = cpu_dai->driver->id;
>> +
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		dmactl = drvdata->rxtx_rd_dmactl;
>> +		map = drvdata->rxtx_lpaif_map;
>> +		id = pcm_data->dma_ch;
>> +	} else {
>> +		if (dai_id == LPASS_CDC_DMA_TX3) {
>> +			dmactl = drvdata->rxtx_wr_dmactl;
>> +			map = drvdata->rxtx_lpaif_map;
>> +			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>> +		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +			dmactl = drvdata->va_wr_dmactl;
>> +			map = drvdata->va_lpaif_map;
>> +			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>> +		}
>> +	}
> The exact same code block is used 3 times in this driver. Add a helper with
> 'substream' and 'dai' as parameters, which determines 'dmactl and 'id'.
> That would also make the variable declaration/assignment section of these
> functions signifcantly shorter.
Okay. will optimize it.
>> +
>> +	switch (channels) {
>> +	case 1:
>> +		regval = LPASS_CDC_DMA_INTF_ONE_CHANNEL;
>> +		break;
>> +	case 2:
>> +		regval = LPASS_CDC_DMA_INTF_TWO_CHANNEL;
>> +		break;
>> +	case 4:
>> +		regval = LPASS_CDC_DMA_INTF_FOUR_CHANNEL;
>> +		break;
>> +	case 6:
>> +		regval = LPASS_CDC_DMA_INTF_SIX_CHANNEL;
>> +		break;
>> +	case 8:
>> +		regval = LPASS_CDC_DMA_INTF_EIGHT_CHANNEL;
>> +		break;
>> +	default:
>> +		dev_err(soc_runtime->dev, "invalid PCM config\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = regmap_fields_write(dmactl->codec_channel, id, regval);
>> +	if (ret) {
>> +		dev_err(soc_runtime->dev,
>> +			"error writing to rdmactl codec_channel reg field: %d\n", ret);
> not necessarily 'rdmactl'.
Okay. will change it.
>> +		return ret;
>> +	}
>> +	return ret;
> 	return 0
>
>> +}
>> +
>> +static int lpass_wcd_daiops_trigger(struct snd_pcm_substream *substream,
>> +		int cmd, struct snd_soc_dai *dai)
>> +{
>> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +	struct snd_pcm_runtime *rt = substream->runtime;
>> +	struct lpass_pcm_data *pcm_data = rt->private_data;
>> +	struct lpass_variant *v = drvdata->variant;
>> +	int dir = substream->stream;
>> +	struct lpaif_dmactl *dmactl;
>> +	struct regmap *map;
>> +	unsigned int dai_id = cpu_dai->driver->id;
>> +	int ret = 0, id;
>> +
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		dmactl = drvdata->rxtx_rd_dmactl;
>> +		map = drvdata->rxtx_lpaif_map;
>> +		id = pcm_data->dma_ch;
>> +	} else {
>> +		if (dai_id == LPASS_CDC_DMA_TX3) {
>> +			dmactl = drvdata->rxtx_wr_dmactl;
>> +			map = drvdata->rxtx_lpaif_map;
>> +			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>> +		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +			dmactl = drvdata->va_wr_dmactl;
>> +			map = drvdata->va_lpaif_map;
>> +			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>> +		}
>> +	}
> see above
okay.
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		__lpass_platform_codec_intf_init(dai, substream);
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev,
>> +				"error writing to rdmactl reg: %d\n", ret);
> not necessarily rdmactl, better log that it's the codec enable reg.
okay. will change it.
>
>> +			return ret;
>> +		}
>> +
>> +		break;
>> +	}
>> +	return ret;
>> +}
>> +
>> +const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops = {
>> +	.startup	= lpass_wcd_daiops_startup,
>> +	.shutdown	= lpass_wcd_daiops_shutdown,
>> +	.hw_params	= lpass_wcd_daiops_hw_params,
>> +	.trigger	= lpass_wcd_daiops_trigger,
>> +};
>> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_wcd_dai_ops);
>> +
>> +MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 058b42d..e0ea698 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -418,5 +418,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>>   int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>>   				struct snd_soc_dai *dai);
>> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
>>   
>>   #endif /* __LPASS_H__ */
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

