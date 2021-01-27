Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257283058F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 11:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbhA0K6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 05:58:11 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:63830 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236156AbhA0Kzs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 05:55:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611744921; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=/qNmclXhxwVXmVl4tjdqIraPRX5cu7590EP4VSPq95g=; b=kvN+nQFuw2owpu0uNGVB1j74CdWIU2qLPZSGnvyn1HXUn+aoPsMhgiT5TSTRShkGfxz2LoX1
 /gGmYlzCRykngWJnq20fRdIfDwCGz0YTcjt2PXVFFhyroFWCdAnHOrTFCduWK9wSYrJ6gwR1
 eidv79GS/8V/Q2P1wK8k2r5ye0c=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60114674362ca03da6cece11 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 10:54:44
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0D5B0C43461; Wed, 27 Jan 2021 10:54:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.2] (unknown [49.37.158.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8EBD2C433ED;
        Wed, 27 Jan 2021 10:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8EBD2C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Remove bit clock state check
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210127063038.1399-1-srivasam@codeaurora.org>
 <16199fa8-7a87-6e7f-9db6-1d5cd8493d4c@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <d33fd359-9dbf-b03c-ccd1-d93c7d207ccf@codeaurora.org>
Date:   Wed, 27 Jan 2021 16:24:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <16199fa8-7a87-6e7f-9db6-1d5cd8493d4c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Srinivas For Your time!!!

On 1/27/2021 3:21 PM, Srinivas Kandagatla wrote:
>
>
> On 27/01/2021 06:30, Srinivasa Rao Mandadapu wrote:
>> No need of BCLK state maintenance from driver side as
>> clock_enable and clk_disable API's maintaing state counter.
>>
>> One of the major issue was spotted when Headset jack inserted
>> while playback continues, due to same PCM device node opens twice
>> for playaback/capture and closes once for capture and playback 
>> continues.
>>
>> It can resolve the errors in such scenarios.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>
> Thanks for the cleanup, yes clk core will take care of this by 
> enable_count check!
>
> You should add
>
> Fixes: b1824968221c ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF 
> invalid state")
>
Okay. I will do in next patch.
>
>> ---
>>   sound/soc/qcom/lpass-cpu.c       | 22 ++++++++--------------
>>   sound/soc/qcom/lpass-lpaif-reg.h |  3 ---
>>   sound/soc/qcom/lpass.h           |  1 -
>>   3 files changed, 8 insertions(+), 18 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index ae8efbc89af2..a669202e0001 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -286,16 +286,12 @@ static int lpass_cpu_daiops_trigger(struct 
>> snd_pcm_substream *substream,
>>               dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
>>                   ret);
>>   -        if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_DISABLE) {
>> -            ret = clk_enable(drvdata->mi2s_bit_clk[id]);
>> -            if (ret) {
>> -                dev_err(dai->dev, "error in enabling mi2s bit clk: 
>> %d\n", ret);
>> -                clk_disable(drvdata->mi2s_osr_clk[id]);
>> -                return ret;
>> -            }
>> -            drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_ENABLE;
>> +        ret = clk_enable(drvdata->mi2s_bit_clk[id]);
>> +        if (ret) {
>> +            dev_err(dai->dev, "error in enabling mi2s bit clk: 
>> %d\n", ret);
>> +            clk_disable(drvdata->mi2s_osr_clk[id]);
>
> Can you also remove this unnecessary disable here!
>
>
Actually this is MI2S OSR clock disable on failure of bit clock enable.

Do You think it's redundant?

> -srini
>
>> +            return ret;
>>           }
>> -
>>           break;
>>       case SNDRV_PCM_TRIGGER_STOP:
>>       case SNDRV_PCM_TRIGGER_SUSPEND:
>> @@ -310,10 +306,9 @@ static int lpass_cpu_daiops_trigger(struct 
>> snd_pcm_substream *substream,
>>           if (ret)
>>               dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
>>                   ret);
>> -        if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_ENABLE) {
>> - clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
>> -            drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_DISABLE;
>> -        }
>> +
>> + clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
>> +
>>           break;
>>       }
>>   @@ -861,7 +856,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct 
>> platform_device *pdev)
>>                   PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>>               return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>>           }
>> -        drvdata->bit_clk_state[dai_id] = LPAIF_BIT_CLK_DISABLE;
>>       }
>>         /* Allocation for i2sctl regmap fields */
>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>> b/sound/soc/qcom/lpass-lpaif-reg.h
>> index 405542832e99..c8e1d75340b2 100644
>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>> @@ -60,9 +60,6 @@
>>   #define LPAIF_I2SCTL_BITWIDTH_24    1
>>   #define LPAIF_I2SCTL_BITWIDTH_32    2
>>   -#define LPAIF_BIT_CLK_DISABLE        0
>> -#define LPAIF_BIT_CLK_ENABLE        1
>> -
>>   #define LPAIF_I2SCTL_RESET_STATE    0x003C0004
>>   #define LPAIF_DMACTL_RESET_STATE    0x00200000
>>   diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 2d68af0da34d..83b2e08ade06 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -68,7 +68,6 @@ struct lpass_data {
>>       unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
>>       unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
>>       int hdmi_port_enable;
>> -    int bit_clk_state[LPASS_MAX_MI2S_PORTS];
>>         /* low-power audio interface (LPAIF) registers */
>>       void __iomem *lpaif;
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

