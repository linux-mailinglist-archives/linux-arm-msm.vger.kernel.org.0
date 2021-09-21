Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF514133AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 15:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbhIUNEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 09:04:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37984 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhIUNEQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 09:04:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632229368; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qH2l5wCnZnelf0eU2pGiDEZnMruL9bfu6QZc4HulXxE=; b=BnbJZ7mRZv1aEqPxi7Az0whTJKS58+RmKA3T83QeWVWz/38n9YLaA8U9PZ5AsgfbREXycy6s
 Tw58hzX3+GB/vtGIc4XhPrRlXJCkLmHfjezxZiLj34siKllzDYkUDlTr16BhDLkL4m3YNmba
 Mk+vzN60z0Y0gUlOVnnB3zIUCpI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6149d7ddec62f57c9a213e40 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 13:02:21
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C83CC43616; Tue, 21 Sep 2021 13:02:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [157.48.153.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3A5CC4338F;
        Tue, 21 Sep 2021 13:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D3A5CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 3/7] ASoC: codecs: tx-macro: Change mic control registers
 to volatile
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-4-git-send-email-srivasam@codeaurora.org>
 <c1c7b1e8-98f5-99a3-1374-11d1d61535b4@linaro.org>
 <b442ee2b-622c-674d-3abe-b1fbbfa5aeb9@codeaurora.org>
 <e87ef6e1-0c10-beaa-81ad-2c0ceae6bbcc@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <62c85130-df75-5aa6-8954-d1a55167827f@codeaurora.org>
Date:   Tue, 21 Sep 2021 18:32:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e87ef6e1-0c10-beaa-81ad-2c0ceae6bbcc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/21/2021 2:18 PM, Srinivas Kandagatla wrote:
>
>
> On 21/09/2021 08:30, Srinivasa Rao Mandadapu wrote:
>>
>> On 9/20/2021 6:54 PM, Srinivas Kandagatla wrote:
>> Thanks for your time Srini!!
>>>
>>> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>>>> Update amic and dmic related tx macro control registers to volatile
>>>>
>>>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>>>> lpass tx macro)
>>>>
>>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> ---
>>>>   sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++++
>>>>   1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>>>> b/sound/soc/codecs/lpass-tx-macro.c
>>>> index 9273724..e65b592 100644
>>>> --- a/sound/soc/codecs/lpass-tx-macro.c
>>>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>>>> @@ -423,6 +423,13 @@ static bool tx_is_volatile_register(struct 
>>>> device *dev, unsigned int reg)
>>>>       case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
>>>>       case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
>>>>       case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
>>>> +    case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
>>>> +    case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
>>>> +    case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
>>>> +    case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
>>>> +    case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
>>>> +    case CDC_TX_TOP_CSR_SWR_CTRL:
>>>> +    case CDC_TX0_TX_PATH_SEC7:
>>>
>>> Why are these marked as Volatile?
>>> Can you provide some details on the issue that you are seeing?
>>>
>>> --srini
>>
>> Without volatile these registers are not reflecting in Hardware and 
>> playback and capture is not working.
>>
>> Will do recheck and keep only required registers as volatile.
>
> This sounds like a total hack to me,
>
> this might be happening in your case:
>
> The default values for this register are different to actual defaults.
> Ex: CDC_TX_TOP_CSR_SWR_AMIC0_CTL default is 0x00
> so writing 0x0 to this register will be no-op as there is no change in 
> the register value as compared to default value as per regmap.
>
> In you case make sure the hardware default values are correctly 
> reflected in tx_defaults array.

The default values in tx_defaults are proper. But same value is not 
reflecting in Hardware, but In Cache it's reflecting set value.

>
> Then setting the desired value should work.
>
>
> --srini
>
>
>
>>
>>>
>>>
>>>>           return true;
>>>>       }
>>>>       return false;
>>>> @@ -1674,6 +1681,12 @@ static int tx_macro_component_probe(struct 
>>>> snd_soc_component *comp)
>>>>         snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 
>>>> 0x3F,
>>>>                         0x0A);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0xFF, 0x00);
>>>>         return 0;
>>>>   }
>>>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

