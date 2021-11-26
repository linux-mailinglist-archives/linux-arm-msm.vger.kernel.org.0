Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187D945ECD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 12:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347847AbhKZLqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 06:46:24 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:41614 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350443AbhKZLoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 06:44:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637926870; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/ZEuKj4bQJYJW9WhSqQR5z/eUKnybN7H2nOzwjPZXXs=; b=fUQl5M5FOs9Hk3SoGlvmpO2jXldG0Hzt4Rz7yWyaly8HVbFbMKNAISUAB3Eaoz+u9Rd3k8kv
 ODPTuamHq08SrowRY5w6jUz5LHD7BkvuPJ9Uw1lWDFccEo5+izKPsolNOnjDzXRvyFjisaLz
 +46eKXJT24QnMsZlg+Ho+qyP+rg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61a0c7d31abc6f02d0e06df5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 11:41:07
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8310C43618; Fri, 26 Nov 2021 11:41:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BBA9DC4338F;
        Fri, 26 Nov 2021 11:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BBA9DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v5 04/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
 <1637239714-11211-5-git-send-email-srivasam@codeaurora.org>
 <03051fc7-5f52-2a09-4136-6a1c717c3e75@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <f880d9e3-62cf-4045-99a0-8baddc0119f4@codeaurora.org>
Date:   Fri, 26 Nov 2021 17:10:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <03051fc7-5f52-2a09-4136-6a1c717c3e75@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/23/2021 5:57 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!
>
> On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
>> Add lpass cpu driver to support audio over codec dma for
>> ADSP bypass usecase.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-cdc-dma.c | 195 
>> +++++++++++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass.h         |   1 +
>>   2 files changed, 196 insertions(+)
>>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
>>
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c 
>> b/sound/soc/qcom/lpass-cdc-dma.c
>> new file mode 100644
>> index 0000000..f5bfda9
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
>> @@ -0,0 +1,195 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021 The Linux Foundation. All rights reserved.
>> + *
>> + * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/module.h>
>> +#include <sound/soc.h>
>> +#include <sound/soc-dai.h>
>> +
>> +#include "lpass-lpaif-reg.h"
>> +#include "lpass.h"
>> +
>> +static void __get_dmactl_handle(struct snd_pcm_substream *substream, 
>> struct snd_soc_dai *dai,
>> +                    struct lpaif_dmactl **dmactl, int *id)
>
> Please rename this with an lpass prefix, Also indentation looks bit 
> off here.
Okay.
>
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct snd_pcm_runtime *rt = substream->runtime;
>> +    struct lpass_pcm_data *pcm_data = rt->private_data;
>> +    struct lpass_variant *v = drvdata->variant;
>> +    int dir = substream->stream;
>> +    unsigned int dai_id = cpu_dai->driver->id;
>> +
>> +    if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
>> +        *dmactl = drvdata->rxtx_rd_dmactl;
>> +        *id = pcm_data->dma_ch;
>> +    } else {
>> +        if (dai_id == LPASS_CDC_DMA_TX3) {
>> +            *dmactl = drvdata->rxtx_wr_dmactl;
>> +            *id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>> +        } else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +            *dmactl = drvdata->va_wr_dmactl;
>> +            *id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>> +        }
>
> use switch case here, also something like this makes more sense rather 
> that just dealing with TX3 and VA TX0
okay. will change accordingly and add other cdc dma ports.
>
> switch (dai_id) {
> case: LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX8:
>     *dmactl = drvdata->rxtx_wr_dmactl;
>     *id = pcm_data->dma_ch;
>     break;
> case: LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>     *dmactl = drvdata->rxtx_wr_dmactl;
>     *id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>     break;
> case LPASS_CDC_DMA_VA_TX0 ...  LPASS_CDC_DMA_VA_TX8:
>     *dmactl = drvdata->rxtx_wr_dmactl;
>     *id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>     break;
> default:
>     dev_err(dev, "Invalid dai id for dma ctl\n");
>     break;
> }
>
>> +    }
>> +}
>> +
>> +static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
>> +                     struct snd_pcm_substream *substream)
>
> Indentation is off, I think most of the code has simillar issue.
Okay. will change in all places.
>
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +    struct lpaif_dmactl *dmactl;
>> +    int dir = substream->stream;
>> +    int ret, id, codec_intf;
>> +    unsigned int dai_id = cpu_dai->driver->id;
>> +
>> +    if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +        codec_intf = LPASS_CDC_DMA_RX0_INTERFACE;
>
> Why are we limiting this to just RX0, it should be trivial to add 
> support to other RX and TX dais.
>
> Add a helper to convert the dai ids to interface indexs
Okay. will change accordingly.
>
>> +    else
>> +        codec_intf = LPASS_CDC_DMA_INTERFACE(dai_id);
>> +
>> +    __get_dmactl_handle(substream, dai, &dmactl, &id);
>
> We are not checking if dmactl is valid or not, best is to have a error 
> returned from __get_dmactl_handle() and handle it properly here.
Okay. will add error handling.
>> +
>> +    ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
> Why not use a local declare a local dev pointer and use it here, it 
> will save lines here.
Okay.
>> +            "error writing to dmactl codec_intf reg field: %d\n", ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_fs_sel reg field: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_fs_delay reg field: 
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_pack reg field: %d\n", ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_enable, id, 
>> LPAIF_DMACTL_ENABLE_ON);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_enable reg field: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int lpass_wcd_daiops_startup(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_soc_dai *dai)
>> +{
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    int ret;
>> +
>> +    ret = clk_bulk_prepare_enable(drvdata->cdc_num_clks, 
>> drvdata->cdc_clks);
>> +    if (ret) {
>> +        dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>
> may be just do
> return clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);
>
> soc_dai_ret() should print an error if startup fails.
>
Okay.
>
>
>> +}
>> +
>> +static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_soc_dai *dai)
>> +{
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +
>> +    clk_bulk_disable_unprepare(drvdata->cdc_num_clks, 
>> drvdata->cdc_clks);
>> +}
>> +
>> +static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct lpaif_dmactl *dmactl;
>> +    unsigned int ret, regval;
>> +    unsigned int channels = params_channels(params);
>> +    int id;
>> +
>> +    __get_dmactl_handle(substream, dai, &dmactl, &id);
>
> may be move it after switch case and handle the errors.
Okay. will move it below.
>> +
>> +    switch (channels) {
>> +    case 1:
>> +        regval = LPASS_CDC_DMA_INTF_ONE_CHANNEL;
>> +        break;
>> +    case 2:
>> +        regval = LPASS_CDC_DMA_INTF_TWO_CHANNEL;
>> +        break;
>> +    case 4:
>> +        regval = LPASS_CDC_DMA_INTF_FOUR_CHANNEL;
>> +        break;
>> +    case 6:
>> +        regval = LPASS_CDC_DMA_INTF_SIX_CHANNEL;
>> +        break;
>> +    case 8:
>> +        regval = LPASS_CDC_DMA_INTF_EIGHT_CHANNEL;
>> +        break;
>> +    default:
>> +        dev_err(soc_runtime->dev, "invalid PCM config\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = regmap_fields_write(dmactl->codec_channel, id, regval);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_channel reg field: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int lpass_wcd_daiops_trigger(struct snd_pcm_substream 
>> *substream,
>> +        int cmd, struct snd_soc_dai *dai)
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct lpaif_dmactl *dmactl;
>> +    int ret = 0, id;
>> +
>> +    __get_dmactl_handle(substream, dai, &dmactl, &id);
>
> move it inside the case where this is really used.
Okay.
>
>> +
>> +    switch (cmd) {
>> +    case SNDRV_PCM_TRIGGER_START:
>> +    case SNDRV_PCM_TRIGGER_RESUME:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +        __lpass_platform_codec_intf_init(dai, substream);
>> +        break;
>> +    case SNDRV_PCM_TRIGGER_STOP:
>> +    case SNDRV_PCM_TRIGGER_SUSPEND:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +        ret = regmap_fields_write(dmactl->codec_enable, id, 
>> LPAIF_DMACTL_ENABLE_OFF);
>> +        if (ret) {
>> +            dev_err(soc_runtime->dev,
>> +                "error writing to dmactl codec_enable reg: %d\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        break;
>
> missing default:
Okay. will add it.
>
>> +    }
>> +    return ret;
>> +}
>> +
>> +const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops = {
>> +    .startup    = lpass_wcd_daiops_startup,
>> +    .shutdown    = lpass_wcd_daiops_shutdown,
>> +    .hw_params    = lpass_wcd_daiops_hw_params,
>> +    .trigger    = lpass_wcd_daiops_trigger,
>> +};
>> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_wcd_dai_ops);
>> +
>> +MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
>> +MODULE_LICENSE("GPL v2");
>
> use
> MODULE_LICENSE("GPL");
>
> more info in ./Documentation/process/license-rules.rst
>
> --srini
Okay.
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index b068534..f912425 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -414,5 +414,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct 
>> snd_soc_dai *dai);
>>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>>   int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>>                   struct snd_soc_dai *dai);
>> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
>>     #endif /* __LPASS_H__ */
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

