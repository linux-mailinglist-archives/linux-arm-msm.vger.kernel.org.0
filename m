Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFCD2C6AE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 18:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732348AbgK0RtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 12:49:15 -0500
Received: from z5.mailgun.us ([104.130.96.5]:49679 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730603AbgK0RtP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 12:49:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606499353; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=pUPCU+QayI1Qx+sBFoJcvK5sgEvyc418pyh2vbWzEQE=; b=n2A2o7QMJxm54VgTwu3eivobNjroD/6RqMNxPA32MkWUIj6V9AuERNK8Hv2KFX/q4d6X0PKW
 q/AU0LdYmqS0z6Dn6M0vCuMM0sU0B9x+A+banNQzcE/VB6eDBW2K4ZSxe8Wy2EucHvA+eKNX
 5H3BK6mQgszNt/EACoRxdzBR9RY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fc13c0c22377520ee21a797 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 17:49:00
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0C85C433C6; Fri, 27 Nov 2020 17:49:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [172.20.10.2] (unknown [27.59.128.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9F65C433C6;
        Fri, 27 Nov 2020 17:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9F65C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3] ASoC: qcom: Fix playback recover problem in suspend
 resume
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
 <1146040c-5559-f4bf-fafe-eb7468e577a0@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <0055cc2e-87f1-bcc3-247b-8a4bd1bea883@codeaurora.org>
Date:   Fri, 27 Nov 2020 23:18:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1146040c-5559-f4bf-fafe-eb7468e577a0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks a lot  Srinivas for your valuable review comments and for your 
time!!!

On 11/27/2020 5:39 PM, Srinivas Kandagatla wrote:
>
>
> On 27/11/2020 09:56, Srinivasa Rao Mandadapu wrote:
>> To support playback continuation after hard suspend(bypass powerd)
>>   and resume:
>> Prepare device in  platform trigger callback.
>> Make I2s and DMA control registers as non volatile.
> Looks like there are two changes here, One is fixing the volatile 
> registers!
>
>
> Other is preparing device after suspend!
>
> Consider splitting them!
>
Okay will split and share.
>>
>
> Fixes tag is missing here?
>
Actually fixing volatile registers is just partial reversal of commit 
b1824968221c ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid 
state")

Will revert and share the patch separately.

>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes Since v1 and v2:
>>    -- Subject lines changed
>>
>>   sound/soc/qcom/lpass-cpu.c      | 8 ++------
>>   sound/soc/qcom/lpass-platform.c | 5 +++--
>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index af684fd..c99be03 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -454,20 +454,16 @@ static bool lpass_cpu_regmap_volatile(struct 
>> device *dev, unsigned int reg)
>>       struct lpass_variant *v = drvdata->variant;
>>       int i;
>>   -    for (i = 0; i < v->i2s_ports; ++i)
>> -        if (reg == LPAIF_I2SCTL_REG(v, i))
>> -            return true;
>>       for (i = 0; i < v->irq_ports; ++i)
>>           if (reg == LPAIF_IRQSTAT_REG(v, i))
>>               return true;
>>         for (i = 0; i < v->rdma_channels; ++i)
>> -        if (reg == LPAIF_RDMACURR_REG(v, i) || reg == 
>> LPAIF_RDMACTL_REG(v, i))
>> +        if (reg == LPAIF_RDMACURR_REG(v, i))
>>               return true;
>>         for (i = 0; i < v->wrdma_channels; ++i)
>> -        if (reg == LPAIF_WRDMACURR_REG(v, i + 
>> v->wrdma_channel_start) ||
>> -            reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
>> +        if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
>>               return true;
>>         return false;
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index 80b09de..2b0a7c1 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -481,8 +481,9 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>           return -ENOTRECOVERABLE;
>>       }
>>       switch (cmd) {
>> -    case SNDRV_PCM_TRIGGER_START:
>>       case SNDRV_PCM_TRIGGER_RESUME:
>> +        lpass_platform_pcmops_prepare(component, substream);
>
> Can you elaborate the actual issue here?
>
> Are any other registers needs to re-programmed??
>
> Does it make sense to use
> regcache_mark_dirty()
> regcache_sync() in pm suspend resume path,
> instead of calling prepare explicitly?
>
>
> --srini
>
Yes it's working fine with regcache APIs. will update the patch.
>
>> +    case SNDRV_PCM_TRIGGER_START:
>>       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>           ret = regmap_fields_write(dmactl->enable, id,
>>                            LPAIF_DMACTL_ENABLE_ON);
>> @@ -592,7 +593,7 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>           break;
>>       }
>>   -    return 0;
>> +    return ret;
>>   }
>>     static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

