Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995993A158E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 15:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234647AbhFIN2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 09:28:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:53755 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbhFIN2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 09:28:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623245176; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=DZYzep55GMVsKblHkPVsD6f4rzxsDJDWH6F3pGRGvBA=; b=TKyc80uFYPyvpbZIIvGTkrv+GWgUvflDnmXIrzrNdJZLhEKkbQ25ZTPMpUJ2MdSIPCoyZNur
 MI52P1nupg3bQP7h+AggUAEDaqV1+10VdYTgx0vI375CTTucSH1V7caPLounn92Px+AiWctE
 4kXU55qTFvMroWYaxQXABfvo+MA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60c0c165e27c0cc77fcdd4b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 13:25:57
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E6B6C433F1; Wed,  9 Jun 2021 13:25:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.144.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 473CEC433D3;
        Wed,  9 Jun 2021 13:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 473CEC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v2] ASoC: qcom: Add four speaker support on MI2S secondary
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210609071313.18206-1-srivasam@codeaurora.org>
 <d21e8951-583c-562b-421a-54ec206610ef@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <74b4f6d1-f5ae-5704-9728-790dfb1c4b33@codeaurora.org>
Date:   Wed, 9 Jun 2021 18:55:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d21e8951-583c-562b-421a-54ec206610ef@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srini,

Thanks for your Time!!!

On 6/9/2021 1:40 PM, Srinivas Kandagatla wrote:
>
>
> On 09/06/2021 08:13, Srinivasa Rao Mandadapu wrote:
>> Add four speaker support on MI2S secondary block
>> by using I2S SD1 line on gpio52 pin, and add channel map
>> control support in the lpass-cpu audio driver.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes Since V1:
>>     -- removed set_channel_map/get_channel_map implementation as 
>> default kcontrols
>>         added in pcm_new API.
>>
>>   sound/soc/qcom/lpass-cpu.c    | 32 ++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass-sc7180.c |  1 +
>>   sound/soc/qcom/lpass.h        |  2 ++
>>   3 files changed, 35 insertions(+)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index c62d2612e8f5..15d69e311b38 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -29,6 +29,14 @@
>>   #define LPASS_CPU_I2S_SD0_1_2_MASK    GENMASK(2, 0)
>>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK    GENMASK(3, 0)
>>   +/*
>> + * Channel maps for Quad channel playbacks on MI2S Secondary
>> + */
>> +static struct snd_pcm_chmap_elem lpass_quad_chmaps = {
>> +        .channels = 4,
>> +        .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL,
>> +                SNDRV_CHMAP_FR, SNDRV_CHMAP_RR }
>
> AFAIU, You would need an empty entry at the end of this list if not we 
> will endup in a dereferencing memory sitting right next to this array 
> which will lead to random memory corruptions...
>
> Have a look at some of the examples in existing codec drivers.
>
> Other than that patch looks good.
>
> --srini
Okay. Will change accordingly.
>
>
>> +};
>>   static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>>               struct lpaif_i2sctl *i2sctl, struct regmap *map)
>>   {
>> @@ -324,6 +332,25 @@ const struct snd_soc_dai_ops 
>> asoc_qcom_lpass_cpu_dai_ops = {
>>   };
>>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>>   +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>> +                struct snd_soc_dai *dai)
>> +{
>> +    int ret;
>> +    struct snd_soc_dai_driver *drv = dai->driver;
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +
>> +    if (drvdata->mi2s_playback_sd_mode[dai->id] == 
>> LPAIF_I2SCTL_MODE_QUAD01) {
>> +        ret =  snd_pcm_add_chmap_ctls(rtd->pcm, 
>> SNDRV_PCM_STREAM_PLAYBACK,
>> +                &lpass_quad_chmaps, drv->playback.channels_max, 0,
>> +                NULL);
>> +        if (ret < 0)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
>> +
>>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> @@ -856,6 +883,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct 
>> platform_device *pdev)
>>                   PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>>               return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>>           }
>> +        if (drvdata->mi2s_playback_sd_mode[dai_id] ==
>> +            LPAIF_I2SCTL_MODE_QUAD01) {
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
>> index 83b2e08ade06..623ddccdafff 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -259,5 +259,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct 
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

