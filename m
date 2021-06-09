Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FC13A0D59
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 09:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhFIHOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 03:14:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62843 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235698AbhFIHOh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 03:14:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623222763; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=yGggwcGCgMNBKDHzpYRGadeZXnkBj5hEP/vFR0XE154=; b=Ry1F3E9M3D6pJkxKd2VP3zQwDhOqORjuSESgjJOPr6jlCefGrleyEjWz8DxFPJU4qqTYIIC3
 qypU9Z1zsGCAMzDwHKbqsyC0g6sGXebpiXeIeScUzEl/wMvmZfHINYd5cEkFkoN5v8FtRDly
 4aU3BuoOh8hDMXUuifQpwNE89qs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60c069dbe27c0cc77f38ce02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 07:12:27
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1D09C43460; Wed,  9 Jun 2021 07:12:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.144.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D78A3C433F1;
        Wed,  9 Jun 2021 07:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D78A3C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] Asoc: qcom: Add four speaker support on MI2S secondary
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210527073309.28661-1-srivasam@codeaurora.org>
 <213e1133-0164-03da-1740-c7ca39f3fd8c@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <8483cafd-8dbd-c603-7290-de666376649d@codeaurora.org>
Date:   Wed, 9 Jun 2021 12:42:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <213e1133-0164-03da-1740-c7ca39f3fd8c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srini,

Thanks for your review comments!!!.

On 5/28/2021 2:06 PM, Srinivas Kandagatla wrote:
> Hi Srinivasa,
>
> On 27/05/2021 08:33, Srinivasa Rao Mandadapu wrote:
>> Add four speaker support on MI2S secondary block
>> by using I2S SD1 line on gpio52 pin, and add channel map
>> control support in the lpass-cpu audio driver.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-cpu.c    | 106 +++++++++++++++++++++++++++++++++-
>>   sound/soc/qcom/lpass-sc7180.c |   1 +
>>   sound/soc/qcom/lpass.h        |   5 ++
>>   3 files changed, 111 insertions(+), 1 deletion(-)
>>
>
> This patch looks totally redundant to set_channel_map/get_channel_map 
> implementation. You should probably consider adding that support to 
> the qcom_lpass_cpu_dai_ops. And let the machine driver set the channel 
> map.
>
> --srini
Yes we will do changes accordingly and Post next patch.
>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index c62d2612e8f5..88a038a107a7 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -28,6 +28,19 @@
>>   #define LPASS_CPU_I2S_SD2_3_MASK    GENMASK(3, 2)
>>   #define LPASS_CPU_I2S_SD0_1_2_MASK    GENMASK(2, 0)
>>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK    GENMASK(3, 0)
>> +#define LPASS_CHMAP_IDX_UNKNOWN        -1
>> +
>> +/*
>> + * Channel maps for multi-channel playbacks on MI2S Secondary, up to 
>> 4 n_ch
>> + */
>> +static struct snd_pcm_chmap_elem lpass_chmaps[] = {
>> +    { .channels = 2,
>> +      .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
>> +    { .channels = 4,
>> +      .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
>> +                SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
>> +    { }
>> +};
>>     static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>>               struct lpaif_i2sctl *i2sctl, struct regmap *map)
>> @@ -86,6 +99,9 @@ static int lpass_cpu_daiops_startup(struct 
>> snd_pcm_substream *substream,
>> clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>>           return ret;
>>       }
>> +    if (drvdata->chmap_info && drvdata->chmap_info->max_channels == 4)
>> +        drvdata->chmap_info->chmap = lpass_chmaps;
>> +
>>       return 0;
>>   }
>>   @@ -96,6 +112,7 @@ static void lpass_cpu_daiops_shutdown(struct 
>> snd_pcm_substream *substream,
>> clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>> clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
>> +    drvdata->chmap_idx = LPASS_CHMAP_IDX_UNKNOWN;
>>   }
>>     static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream 
>> *substream,
>> @@ -224,9 +241,14 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>                   ret);
>>               return ret;
>>           }
>> -        if (channels >= 2)
>> +        if (channels >= 2) {
>>               ret = regmap_fields_write(i2sctl->spkmono, id,
>>                            LPAIF_I2SCTL_SPKMONO_STEREO);
>> +            if (channels == 4)
>> +                drvdata->chmap_idx = 1;
>> +            else
>> +                drvdata->chmap_idx = 0;
>> +        }
>>           else
>>               ret = regmap_fields_write(i2sctl->spkmono, id,
>>                            LPAIF_I2SCTL_SPKMONO_MONO);
>> @@ -324,6 +346,84 @@ const struct snd_soc_dai_ops 
>> asoc_qcom_lpass_cpu_dai_ops = {
>>   };
>>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>>   +static int lpass_cpu_chmap_ctl_get(struct snd_kcontrol *kcontrol,
>> +                struct snd_ctl_elem_value *ucontrol)
>> +{
>> +    unsigned const char *map;
>> +    unsigned int i;
>> +    struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
>> +    struct lpass_data *drvdata = info->private_data;
>> +
>> +    if (info->max_channels == 2)
>> +        map = &lpass_chmaps[0].map[0];
>> +    else if (info->max_channels == 4)
>> +        map = &lpass_chmaps[1].map[0];
>> +
>> +    for (i = 0; i < info->max_channels; i++) {
>> +        if (drvdata->chmap_idx == LPASS_CHMAP_IDX_UNKNOWN)
>> +            ucontrol->value.integer.value[i] = 0;
>> +        else
>> +            ucontrol->value.integer.value[i] = map[i];
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int lpass_cpu_chmap_ctl_set(struct snd_kcontrol *kcontrol,
>> +                struct snd_ctl_elem_value *ucontrol)
>> +{
>> +    unsigned int i;
>> +    struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
>> +    struct lpass_data *drvdata = info->private_data;
>> +    unsigned char *map;
>> +
>> +    if (info->max_channels == 2)
>> +        map = &lpass_chmaps[0].map[0];
>> +    else if (info->max_channels == 4)
>> +        map = &lpass_chmaps[1].map[0];
>> +
>> +    for (i = 0; i < info->max_channels; i++) {
>> +        if (drvdata->chmap_idx == LPASS_CHMAP_IDX_UNKNOWN)
>> +            map[i] = 0;
>> +        else
>> +            map[i] = ucontrol->value.integer.value[i];
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>> +                  struct snd_soc_dai *dai)
>> +{
>> +    int ret;
>> +
>> +    struct snd_soc_dai_driver *drv = dai->driver;
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +
>> +    ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
>> +            snd_pcm_alt_chmaps, drv->playback.channels_max, 0,
>> +            &drvdata->chmap_info);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +
>> +    /*
>> +     * override handlers
>> +     */
>> +    drvdata->chmap_info->private_data = drvdata;
>> +    drvdata->chmap_info->kctl->get = lpass_cpu_chmap_ctl_get;
>> +    drvdata->chmap_info->kctl->put = lpass_cpu_chmap_ctl_set;
>> +
>> +    /*
>> +     * default chmap supported is stereo
>> +     */
>> +    drvdata->chmap_info->chmap = lpass_chmaps;
>> +    drvdata->chmap_idx = LPASS_CHMAP_IDX_UNKNOWN;
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
>> +
>>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> @@ -856,6 +956,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct 
>> platform_device *pdev)
>>                   PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>>               return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>>           }
>> +        if (drvdata->mi2s_playback_sd_mode[dai_id] == 
>> LPAIF_I2SCTL_MODE_QUAD01) {
>> + variant->dai_driver[dai_id].playback.channels_min = 4;
>> + variant->dai_driver[dai_id].playback.channels_max = 4;
>> +        }
>>       }
>>         /* Allocation for i2sctl regmap fields */
>> diff --git a/sound/soc/qcom/lpass-sc7180.c 
>> b/sound/soc/qcom/lpass-sc7180.c
>> index 8c168d3c589e..77a556b27cf0 100644
>> --- a/sound/soc/qcom/lpass-sc7180.c
>> +++ b/sound/soc/qcom/lpass-sc7180.c
>> @@ -58,6 +58,7 @@ static struct snd_soc_dai_driver 
>> sc7180_lpass_cpu_dai_driver[] = {
>>           },
>>           .probe    = &asoc_qcom_lpass_cpu_dai_probe,
>>           .ops    = &asoc_qcom_lpass_cpu_dai_ops,
>> +        .pcm_new = lpass_cpu_pcm_new,
>>       }, {
>>           .id = LPASS_DP_RX,
>>           .name = "Hdmi",
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 83b2e08ade06..fb82591d550c 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -76,6 +76,9 @@ struct lpass_data {
>>       /* regmap backed by the low-power audio interface (LPAIF) 
>> registers */
>>       struct regmap *lpaif_map;
>>       struct regmap *hdmiif_map;
>> +    struct snd_pcm_chmap *chmap_info;
>> +
>> +    int chmap_idx;
>>         /* interrupts from the low-power audio interface (LPAIF) */
>>       int lpaif_irq;
>> @@ -259,5 +262,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct 
>> platform_device *pdev);
>>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
>>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>> +                struct snd_soc_dai *dai);
>>     #endif /* __LPASS_H__ */
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

