Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA679413351
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 14:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbhIUM2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 08:28:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45293 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbhIUM2O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 08:28:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632227206; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QQnp2gt83t8CyCzKB1ItXy9MO51UgrMq0pX7KEZfIt4=; b=eADjSjK6puZa/VyhrxqW1OJNJjJKIs8ap1qKbnP1Ho14by2NQajM+WWL/u98+tod9xm18taD
 GsqxGce7+tmJLr3etszV3zFCGgSHwnYOYn7kUIjrTfVkHpS5uQARN8kcFEGMyfE0xJlBTo+d
 WDzUSZTK4BgQuryg2qU5B3OexEo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6149cf59e0f78151d65a83d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 12:26:01
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D071C4360D; Tue, 21 Sep 2021 12:26:01 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 860C9C4338F;
        Tue, 21 Sep 2021 12:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 860C9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 4/7] ASoC: codecs: lpass-va-macro: Change bulk voting to
 individual clock voting
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
 <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
 <5f915592-0ca6-2839-43fc-6d9aef1484b7@linaro.org>
 <2378b5b1-fe45-171d-f8f9-373f8cece37f@codeaurora.org>
 <a29cfafc-5a29-0760-2578-f1c52cdb1e42@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <460bdea5-d6f9-5c37-1e19-555bc5ce0074@codeaurora.org>
Date:   Tue, 21 Sep 2021 17:55:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a29cfafc-5a29-0760-2578-f1c52cdb1e42@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/21/2021 2:20 PM, Srinivas Kandagatla wrote:
>
>
> On 21/09/2021 09:14, Srinivasa Rao Mandadapu wrote:
>>
>> On 9/20/2021 6:55 PM, Srinivas Kandagatla wrote:
>>>
>>>
>> Thanks for Your time Srini!!!
>>> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>>>> Change bulk clock frequency voting to individual voting.
>>>>
>>> Can you please explain why do we need to move out using clk bulk apis?
>>>
>>> Am not seeing any thing obvious behavior changing as part of this 
>>> patch, more details please..
>>
>> In ADSP bypass use case, few clocks like macro and decode, are 
>> optional. So is the main reason for move out.
>
>
> Have you tried using clk_bulk_get_optional()
Tried with above API. It's working fine. Do you suggest to use this 
optional API?
>
> --srini
>>
>> And sometimes we are seeing bulk voting failed in Kodiak setup.
>>
>>>> Fixes: 908e6b1df26e (ASoC: codecs: lpass-va-macro: Add support to 
>>>> VA Macro)
>>>
>>> Why this has Fixes tag? Are we fixing any bug with this patch?
>> Okay. As such we are not fixing any bug. Will remove this fixes tag 
>> on your suggestion.
>>>
>>>>
>>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> ---
>>>>   sound/soc/codecs/lpass-va-macro.c | 46 
>>>> ++++++++++++++++++++++++---------------
>>>>   1 file changed, 28 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-va-macro.c 
>>>> b/sound/soc/codecs/lpass-va-macro.c
>>>> index d312a14..0ea39ae 100644
>>>> --- a/sound/soc/codecs/lpass-va-macro.c
>>>> +++ b/sound/soc/codecs/lpass-va-macro.c
>>>> @@ -193,7 +193,10 @@ struct va_macro {
>>>>         int dec_mode[VA_MACRO_NUM_DECIMATORS];
>>>>       struct regmap *regmap;
>>>> -    struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
>>>> +    struct clk *mclk;
>>>> +    struct clk *macro;
>>>> +    struct clk *dcodec;
>>>> +
>>>>       struct clk_hw hw;
>>>>         s32 dmic_0_1_clk_cnt;
>>>> @@ -1321,7 +1324,7 @@ static const struct clk_ops fsgen_gate_ops = {
>>>>     static int va_macro_register_fsgen_output(struct va_macro *va)
>>>>   {
>>>> -    struct clk *parent = va->clks[2].clk;
>>>> +    struct clk *parent = va->mclk;
>>>>       struct device *dev = va->dev;
>>>>       struct device_node *np = dev->of_node;
>>>>       const char *parent_clk_name;
>>>> @@ -1404,15 +1407,18 @@ static int va_macro_probe(struct 
>>>> platform_device *pdev)
>>>>           return -ENOMEM;
>>>>         va->dev = dev;
>>>> -    va->clks[0].id = "macro";
>>>> -    va->clks[1].id = "dcodec";
>>>> -    va->clks[2].id = "mclk";
>>>>   -    ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
>>>> -    if (ret) {
>>>> -        dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
>>>> -        return ret;
>>>> -    }
>>>> +    va->macro = devm_clk_get_optional(dev, "macro");
>>>> +    if (IS_ERR(va->macro))
>>>> +        return PTR_ERR(va->macro);
>>>> +
>>>> +    va->dcodec = devm_clk_get_optional(dev, "dcodec");
>>>> +    if (IS_ERR(va->dcodec))
>>>> +        return PTR_ERR(va->dcodec);
>>>> +
>>>> +    va->mclk = devm_clk_get(dev, "mclk");
>>>> +    if (IS_ERR(va->mclk))
>>>> +        return PTR_ERR(va->mclk);
>>>>         ret = of_property_read_u32(dev->of_node, 
>>>> "qcom,dmic-sample-rate",
>>>>                      &sample_rate);
>>>> @@ -1426,10 +1432,11 @@ static int va_macro_probe(struct 
>>>> platform_device *pdev)
>>>>       }
>>>>         /* mclk rate */
>>>> -    clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
>>>> -    ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
>>>> -    if (ret)
>>>> -        return ret;
>>>> +    clk_set_rate(va->mclk, VA_MACRO_MCLK_FREQ);
>>>> +
>>>> +    clk_prepare_enable(va->mclk);
>>>> +    clk_prepare_enable(va->macro);
>>>> +    clk_prepare_enable(va->dcodec);
>>>>         base = devm_platform_ioremap_resource(pdev, 0);
>>>>       if (IS_ERR(base)) {
>>>> @@ -1457,8 +1464,9 @@ static int va_macro_probe(struct 
>>>> platform_device *pdev)
>>>>       return ret;
>>>>     err:
>>>> -    clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
>>>> -
>>>> +    clk_disable_unprepare(va->mclk);
>>>> +    clk_disable_unprepare(va->macro);
>>>> +    clk_disable_unprepare(va->dcodec);
>>>>       return ret;
>>>>   }
>>>>   @@ -1466,8 +1474,10 @@ static int va_macro_remove(struct 
>>>> platform_device *pdev)
>>>>   {
>>>>       struct va_macro *va = dev_get_drvdata(&pdev->dev);
>>>>   -    clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
>>>> -
>>>> +    of_clk_del_provider(pdev->dev.of_node);
>>>
>>> fsgen clk is registered using devm_* variant of clk apis, so why do 
>>> we need this here?
>>>
>> Okay. Will remove it and post new patch.
>>>
>>> --srini
>>>> + clk_disable_unprepare(va->mclk);
>>>> +    clk_disable_unprepare(va->macro);
>>>> +    clk_disable_unprepare(va->dcodec);
>>>>       return 0;
>>>>   }
>>>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

