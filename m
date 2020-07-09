Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8BD219CF9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 12:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgGIKG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 06:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgGIKG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 06:06:56 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512BEC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 03:06:56 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j18so1193828wmi.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 03:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=mgJE0XoR5d83uGU1jCZHB+PytvN1N1Tmw76/eTcxBew=;
        b=pUotuoYOUIxjOoIzicmjbFiylS68wnrKTegL+jEsjCt0D85yzccOwtkSD3tc4tujEx
         SdokhcM9zFdv3aB4EXOyUzjXE4sHo62CmbSGPMy2lyrRhYt5ChcEg6QA7imGGuq3q0wG
         OOj2oyT6JWzBNNt3jrOrNzeZ8wZzYVGa2Ma8RZC2x08Q/oRKerEgI2HtVs51afftopy1
         nsXscmRzQCLQ2pFrQJasVzsJ/68WaK83El5rhn3r9sDerpmg9c4NdNyfzaVcW4uO3/kS
         2iCd+fH40EhNdYRxWi4BG+DMHuzKWpjWApOkrADA1bg5gSWfV4k2ghmNWQRE0EMDx6Qb
         GROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mgJE0XoR5d83uGU1jCZHB+PytvN1N1Tmw76/eTcxBew=;
        b=IyvcCBwN75seCbUTuWawhusKnXx9+8BXkA2BWgHjR6KK8vGJBW8M55Va8qRttl2Et4
         FqdvdXZQqL0DVbKSBatRqzPXi6ktay30EeACyZogFyH3uyHND2TgZmE2579nbGx3Nt5H
         ayMYCKWMw/Nr3Oro0twnz7vlqrN9Tgx3bG9zm0/HPdEyWd9UK2UVQNFrRL4I8iFSzajh
         SSkDslazLX41pYmBoAoEvH1WP0S18D+uj6RX+BCNkjq8Ce69sKTU894zcOP0GH9chM6L
         2xovBTve+sSwifIu7Ou3sZ7zaYY2xGV6gzarJh+u7DUXyO40md2w7Z2plWP4vCHIvyEY
         6Qhw==
X-Gm-Message-State: AOAM531CvjYPsj5mLW2+ZY9855NHMNaiC1upt4w1+yKWO/VpYMgWs8UG
        VB9NYrLlY4S+2utKBzbn4u+/Ww==
X-Google-Smtp-Source: ABdhPJzPmNy+2MBiwjS9kosjLSQW6esYGN0duAec40gVAKhLEMzHgAAEWYwQkfwWdJULE2AraSgX+w==
X-Received: by 2002:a1c:2041:: with SMTP id g62mr13205469wmg.172.1594289214586;
        Thu, 09 Jul 2020 03:06:54 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c11sm3675543wmb.45.2020.07.09.03.06.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 03:06:53 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
To:     Rohit Kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-4-git-send-email-rohitkr@codeaurora.org>
 <a59dc25f-cac2-5540-f1f4-78fd749c65c9@linaro.org>
 <3b849440-091e-bbd3-4944-8a196e181af7@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ac634d4d-527a-7262-2744-203c04ee0982@linaro.org>
Date:   Thu, 9 Jul 2020 11:06:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b849440-091e-bbd3-4944-8a196e181af7@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/07/2020 10:57, Rohit Kumar wrote:
> Thanks Srini for reviewing.
> 
> On 7/9/2020 2:56 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/07/2020 06:08, Rohit kumar wrote:
>>> I2SCTL and DMACTL registers has different bits alignment for newer
>>> LPASS variants of SC7180 soc. Use REG_FIELD_ID() to define the
>>> reg_fields in platform specific file and removed shifts and mask
>>> macros for such registers from header file.
>>>
>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>
>> Thanks Rohit for doing this, this looks much better now!
>> I have few minor comments..
>>
>>> ---
>>>   sound/soc/qcom/lpass-apq8016.c   |  24 ++++++
>>>   sound/soc/qcom/lpass-cpu.c       | 163 
>>> +++++++++++++++++++++++----------------
>>>   sound/soc/qcom/lpass-ipq806x.c   |  24 ++++++
>>>   sound/soc/qcom/lpass-lpaif-reg.h | 157 
>>> +++++++++++++++++++------------------
>>>   sound/soc/qcom/lpass-platform.c  | 151 
>>> +++++++++++++++++++++++++++---------
>>>   sound/soc/qcom/lpass.h           |  53 +++++++++++++
>>>   6 files changed, 398 insertions(+), 174 deletions(-)
>>>
>>
>> index f0c7e93..f358d12 100644
>>> --- a/sound/soc/qcom/lpass-cpu.c
>>> +++ b/sound/soc/qcom/lpass-cpu.c
>>> @@ -29,6 +29,32 @@
>>>   #define LPASS_CPU_I2S_SD0_1_2_MASK    GENMASK(2, 0)
>>>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK    GENMASK(3, 0)
>>
>>
>>>   }
>>>   -static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream 
>>> *substream,
>>> -        struct snd_soc_dai *dai)
>>> -{
>>> -    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>>> -    int ret;
>>> -
>>> -    ret = regmap_write(drvdata->lpaif_map,
>>> -               LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
>>> -               0);
>>> -    if (ret)
>>> -        dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>>> -
>>> -    return ret;
>>> -}
>>
>> Any particular reason why this function remove
> 
> This was causing issue in playback/capture concurrency. It sets I2SCTL 
> register value to 0
> 
> when usecase ends. However, playback/capture specific bits are already 
> cleared during trigger() stop
> 
> function. So, this is not needed.

This should be sent as separate fix with fixes tag!

> 
>
>>
>>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>>> b/sound/soc/qcom/lpass-lpaif-reg.h
>>> index 72a3e2f..5258e60 100644
>>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>>> @@ -12,15 +12,12 @@
>> ...
>>>   #endif /* __LPASS_LPAIF_REG_H__ */
>>> diff --git a/sound/soc/qcom/lpass-platform.c 
>>> b/sound/soc/qcom/lpass-platform.c
>>> index 34f7fd1..445ca193 100644
>>> --- a/sound/soc/qcom/lpass-platform.c
>>> +++ b/sound/soc/qcom/lpass-platform.c
>>> @@ -50,6 +50,53 @@ static const struct snd_pcm_hardware 
>>> lpass_platform_pcm_hardware = {
>>>       .fifo_size        =    0,
>>>   };
>> ...
>>>   static int lpass_platform_pcmops_open(struct snd_soc_component 
>>> *component,
>>>                         struct snd_pcm_substream *substream)
>>>   {
>>> @@ -59,9 +106,9 @@ static int lpass_platform_pcmops_open(struct 
>>> snd_soc_component *component,
>>>       struct lpass_data *drvdata = 
>>> snd_soc_component_get_drvdata(component);
>>>       struct lpass_variant *v = drvdata->variant;
>>>       int ret, dma_ch, dir = substream->stream;
>>> -    struct lpass_pcm_data *data;
>>> +    struct lpass_pcm_data *data = NULL;
>>>   -    data = devm_kzalloc(soc_runtime->dev, sizeof(*data), GFP_KERNEL);
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>
>> Does this change belong in this patch?
> 
> 
> As part of this change, I fixed memory leak too by adding kfree() in 
> close()
> 
> However, this was causing issue as memory was allocated using 
> devm_kzalloc().
> 
> Should I move it to different patch?

That would be the right thing to do, can also add fixes tag!


> 
>>
>>>       if (!data)
>>>           return -ENOMEM;
>>>   @@ -111,13 +158,13 @@ static int lpass_platform_pcmops_close(struct 
>>> snd_soc_component *component,
>>>       struct snd_pcm_runtime *runtime = substream->runtime;
>>>       struct lpass_data *drvdata = 
>>> snd_soc_component_get_drvdata(component);
>>>       struct lpass_variant *v = drvdata->variant;

>>
>> Above two along with rddma members can be removed, these become 
>> redundant after adding regmap field!
>>
> wrdma_channels is used in alloc_dma_channel() to get the channel id.
> 
> Also, both are used for other DMA registers such as LPAIF_RDMABASE_REG,
> 
> LPAIF_RDMABUFF_REG, LPAIF_RDMACURR_REG, etc.
> 
Ah I see we are still using this in lpass_cpu_regmap_writeable!
ignore my previous comments about removing them!

--srini
