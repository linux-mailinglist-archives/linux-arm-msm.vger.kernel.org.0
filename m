Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1422F426C5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 16:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbhJHOJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 10:09:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10135 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhJHOJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 10:09:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633702045; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0AUwiHljy/Jsgx0Ckk5s71QCrmfpt6geV2aG8yQfxKQ=; b=pY23Zor1sokKSpHkFtTvhTUXiVO1IhydVVJf3tALMpUlO379O/yM7VfCz2m9evagJave0hXQ
 /AWoIo37OitaybeCOPNSZU6ogwqtyjnDT9pWRPIxIgjqoRBcYmSEE2gbDhBPKj+zKtP6+OVH
 Ob/+eiiIJWd70NJHfvM97H6SHRQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6160509bf3e5b80f1fde74a4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:07:23
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A06CFC43617; Fri,  8 Oct 2021 14:07:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [157.48.163.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7ADAEC43460;
        Fri,  8 Oct 2021 14:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7ADAEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz;
 tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
 swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
 <e65c77f4-766c-a5ce-9cbd-f1697c1be28c@linaro.org>
 <20ddc4ea-e99c-5492-1931-be1999655563@codeaurora.org>
 <da23bfce-23cd-0869-d752-b0713136072a@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <5748236d-7db2-9d19-a113-6e66b3dee81f@codeaurora.org>
Date:   Fri, 8 Oct 2021 19:37:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <da23bfce-23cd-0869-d752-b0713136072a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/28/2021 2:01 PM, Srinivas Kandagatla wrote:
>
>
> On 27/09/2021 17:42, Srinivasa Rao Mandadapu wrote:
>>
>> On 9/27/2021 4:12 PM, Srinivas Kandagatla wrote:
>> Thanks for your time Srini!!
>>>
>>> On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
>>>> Update mic control register default values to hardware reset values
>>>>
>>>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>>>> lpass tx macro)
>>>>
>>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> ---
>>>>   sound/soc/codecs/lpass-tx-macro.c | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>>>> b/sound/soc/codecs/lpass-tx-macro.c
>>>> index e980b2e..66c39fb 100644
>>>> --- a/sound/soc/codecs/lpass-tx-macro.c
>>>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>>>> @@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
>>>>       { CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>>>>       { CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
>>>>       { CDC_TX_TOP_CSR_ANC_CFG, 0x00},
>>>> -    { CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
>>>> +    { CDC_TX_TOP_CSR_SWR_CTRL, 0x60},
>>>
>>> This does not make sense as this register only has one bit to control.
>>> Why do we even need to change this, can you please explain what 
>>> happens if we do not change this?
>>
>> This register change is not making any impact. But when verified , 
>> reset state of this register is 0x60. so is the reason for change.
>>
>> Will revert it and post again.
>>
>>>
>>>>       { CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
>>>>       { CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
>>>>       { CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
>>>> @@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
>>>>       { CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
>>>>       { CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
>>>>       { CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
>>>> -    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
>>>> -    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
>>>> +    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
>>>> +    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},
>>>
>>> These two registers should have default value of 0x06 as this has 
>>> only one clk selection field with bits 2:1.
>>
>> In Kodiak document reset state 0x0E and clk selection field is with 
>> bits 3:1
>>
>> *LPASS_TX_TX_TOP_CSR_SWR_MIC1_CTL*|0x32200D4
>> Offset:     0x54     Reset State:     0x0000000E 
>
> In that case you should probably consider using 
> regmap_register_patch() for corrections to the default registers in 
> sm8250 case.
As regmap_register_patch() not working in this use case, updating 
defaults in probe for sc7280 specific differences.
>
> --srini
>
>>
>>>
>>> -srini
>>>
>>>
>>>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
>>>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
>>>>       { CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
>>>>
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation 
>> Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative 
>> Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

