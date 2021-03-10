Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD54334AE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 23:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbhCJWDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 17:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbhCJWDC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 17:03:02 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11310C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 14:03:02 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id p7so30506445eju.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 14:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0UmOVRUp+YQT14lDPu2mgV7HIsQABmqO8T8WMEvGZZY=;
        b=SXJOgBvt/aCNAeZt7wXAmbWTaa2AJtAMY3ye+OaAdX5TfFCopTnYDKDp2UbC7efBh0
         sP535yQV1R7kGaGpISdxiIhxrNRwk1KszKRXwBJxL1s9R0kKlsUGwFoV8aGtoVN0gNJL
         D69TTMRwJ7r1yVy4OGtcUpKOdIH7q+DGDLyNZK926BNb1rd4ZP+BujY1wg6mJemhS4iN
         FXcqMJhJh130p3nAg95pW1EJ1CZkkuQ1hj54k3hIazFcoLipHjfPogNY0vMcw+GfJaZa
         y/B4kGx6ABWe3AqzS3gxtf6tJFdF7bXtzJWBaMMjqx6RxqW8Q5j4mWrqcqPFTNdDX19u
         kpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0UmOVRUp+YQT14lDPu2mgV7HIsQABmqO8T8WMEvGZZY=;
        b=DIx6eLXgW/4nhCBUEMCqsz+OgqsRsx3FjeA1OKMeUf8TwrjoztopU9YSO5uxyFZ8vP
         JQu+yPtp+kiasJr1HHPedYHICj+JPy7bQBI5p3cplShYEPhwekdszsIdoU7DRrXLrx81
         /DD0DK37ZCmna8436rE2s8C/LQNnZ3P0NtfTMpEU4/xjV2uhHcMMMZ1L35ug3d+a9h3U
         ckNHoKRoltml6K/BYjBTl3EEBPoqbJjx0yagMuJepu7y1Wrth38Lkg5HsbpxwAqRVICy
         jcMW0QLTiT5RXA5veLBmzaYzWrLc+f/AUmNKkkldrf9bi8yoHsDsNSQ9J8w3DDOhPgzM
         L5IA==
X-Gm-Message-State: AOAM5305K/jmLwbNwEO25QmC4Gu5Wm2TithX3wQ2wFJ+HCD3B1KwexUk
        dt0BMWdimOkcF9+zlhVBziD7gA==
X-Google-Smtp-Source: ABdhPJzbAC+cw2k8JRAMHI9yEJQRmoSQ9KxlZCuo5BCOtUFCEKuvNE/9iO/wST4RoqIxdOxh0rlSHQ==
X-Received: by 2002:a17:906:8043:: with SMTP id x3mr32660ejw.149.1615413780157;
        Wed, 10 Mar 2021 14:03:00 -0800 (PST)
Received: from [192.168.0.9] (hst-221-17.medicom.bg. [84.238.221.17])
        by smtp.googlemail.com with ESMTPSA id z17sm358948eju.27.2021.03.10.14.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 14:02:59 -0800 (PST)
Subject: Re: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during
 venus boot
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
 <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
 <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
 <c0ef2f92-ef80-adc4-3530-949e0a5b3e4e@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <eaffe256-14b7-1963-0d4e-29f94232e146@linaro.org>
Date:   Thu, 11 Mar 2021 00:02:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c0ef2f92-ef80-adc4-3530-949e0a5b3e4e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/10/21 7:33 PM, Bryan O'Donoghue wrote:
> On 06/03/2021 15:01, Stanimir Varbanov wrote:
>>
>>
>> On 2/23/21 3:25 PM, Stanimir Varbanov wrote:
>>>
>>>
>>> On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
>>>> From: Dikshita Agarwal <dikshita@codeaurora.org>
>>>>
>>>> Vote for min clk frequency for core clks during prepare and enable
>>>> clocks
>>>> at boot sequence. Without this the controller clock runs at very low
>>>> value
>>>> (9.6MHz) which is not sufficient to boot venus.
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>   drivers/media/platform/qcom/venus/pm_helpers.c | 14 ++++++++++++++
>>>>   1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> index 4f5d42662963..767cb00d4b46 100644
>>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> @@ -41,10 +41,24 @@ static int core_clks_get(struct venus_core *core)
>>>>   static int core_clks_enable(struct venus_core *core)
>>>>   {
>>>>       const struct venus_resources *res = core->res;
>>>> +    const struct freq_tbl *freq_tbl = NULL;
>>>> +    unsigned int freq_tbl_size = 0;
>>>> +    unsigned long freq = 0;
>>>
>>> no need to initialize to zero.
>>>
>>>>       unsigned int i;
>>>>       int ret;
>>>>   +    freq_tbl = core->res->freq_tbl;
>>>> +    freq_tbl_size = core->res->freq_tbl_size;
>>>
>>> could you initialize those at the variables declaration?
>>>
>>>> +    if (!freq_tbl)
>>>> +        return -EINVAL;
>>>> +
>>>> +    freq = freq_tbl[freq_tbl_size - 1].freq;
>>>> +
>>>>       for (i = 0; i < res->clks_num; i++) {
>>>> +        ret = clk_set_rate(core->clks[i], freq);
>>>
>>> I'm not sure that we have to set the rate for all core->clks[i] ?
>>
>> Confirmed. This produces regressions on db410c (I haven't tested on
>> other platforms yet).
>>
>>>
>>>> +        if (ret)
>>>> +            goto err;
>>>> +
>>>>           ret = clk_prepare_enable(core->clks[i]);
>>>>           if (ret)
>>>>               goto err;
>>>>
>>>
>>
> 
> OK, I have this now on db410c
> 
> I made a tree out of
> 
> svarbanov-linux-tv/venus-for-next-v5.13
> +
> svarbanov-linux-tv/venus-msm8916-fixes - minor fix here integrating on
> top of 5.13
> 
> and then put the sm8250 changes on top of that
> 
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=tracking-qcomlt-sm8250-venus-integrated-sm8250
> 
> 
> So confirm db410c works up to tag
> tracking-qcomlt-sm8250-venus-integrated-sm8250-02+svarbanov-linux-tv/venus-msm8916-fixes
> 
> 
> I'll work on fixing your feedback on that putative branch.

Thanks!

I fixed the regression on db410c by set the rate for the core->clks[0]
only, e.g. the clock at which the remote processor is running.

> 
> ---
> bod

-- 
regards,
Stan
