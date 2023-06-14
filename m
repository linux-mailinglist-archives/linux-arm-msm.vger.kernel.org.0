Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC26772FA3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 12:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbjFNKTX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 06:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234350AbjFNKTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 06:19:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56679E4A
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 03:19:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f63ab1ac4aso8195154e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686737959; x=1689329959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQe+NFt7B0UVaI4ziKbiKUwhFEd8qjh4iYjfaMDfcCQ=;
        b=pK8Vi3ZJtI8VkufPsnXlzADdX5c3p8CSQAVVy6EvWzvPODzGJxLM6n3iZovxdW1G0g
         L4v6VeVgYaJz++2WxdCrBDGNtnhIL31b0b7xO4l2OZym+Ut2lS5ua//PRpgvn9UhJ2xD
         zXQrIDO1YIULVpXNYP+aC1UgasSXPDdGBDxQIYd1E9w2LRqccdH4CG1YzjGAXCNM9BLD
         Rf2B6kD/nn18+JPVxKr0dODjJhMZkFfuHRjA/ezuhBnnlnoOigJHzMTZrb3Si5M+Pgfh
         gcnWhsdYF/l24B8BTIfJywa8s+fhnniRuOtO3K54o7IQTyYC4eenR3nFsQoFgTqKkiPr
         yxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686737959; x=1689329959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQe+NFt7B0UVaI4ziKbiKUwhFEd8qjh4iYjfaMDfcCQ=;
        b=PdI1Mxnpg7yykoISzfDplRRahQGbkPWkHPLZNEZlWnrMHWQWxm9iKZX4RHrnABrteW
         e1IiW6LK7cUzG/eRVUxgwBBISgH7V+6fP6Og/5n8XKnuaw05N6FGkMBVDmwn8Ct0N7KF
         vvrvoS8t/TGaF41aVmpNsqmewb+gDekHHOS/8pxwvD0Hd63TFrPm4pc4WRvcQ6cU4eDp
         bQafKs5AOQursstWCPN1B38ypJpZJqMmBpyA6HDlcKL34h518D/vnRi2kOSQD7AZ4J5P
         wE4SftQSuk00beEqnH/dyY1ODldUGVzJRCmq9glRENQlsgEZ2MUfFqfrjK7bDanI9d/l
         1HpA==
X-Gm-Message-State: AC+VfDzO4X1dq3M8O5omQBdqnyzUxypEsnJOH76npi+N+R3WdDrZwGeY
        CQTaGZxHYcTFWM/lu4FsSe693w==
X-Google-Smtp-Source: ACHHUZ6Re4blXYdUc+Gk2gxfYU85bxkKdrDnIH1eCo0kfK2tyqfw2qHajIP753VW1YbYr7tHajKQWg==
X-Received: by 2002:a05:6512:329c:b0:4f6:3c67:ddfc with SMTP id p28-20020a056512329c00b004f63c67ddfcmr7667066lfe.23.1686737959483;
        Wed, 14 Jun 2023 03:19:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id q29-20020ac2515d000000b004f39868bef1sm2074383lfd.209.2023.06.14.03.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 03:19:19 -0700 (PDT)
Message-ID: <11bfe8ad-8ddd-87b4-3171-94f895af8fa8@linaro.org>
Date:   Wed, 14 Jun 2023 12:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
 <20230509055044.GA4823@thinkpad>
 <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
 <20230511081504.GA12021@thinkpad>
 <d4e8f17b-78a2-b6c6-36e2-ccc526430df1@linaro.org>
 <CAA8EJpp6ekkMWyzri9uSXD4L=w7UcFnRp-3CpJ3h535++uWqwg@mail.gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpp6ekkMWyzri9uSXD4L=w7UcFnRp-3CpJ3h535++uWqwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.06.2023 08:05, Dmitry Baryshkov wrote:
> On Tue, 30 May 2023 at 02:47, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 11/05/2023 11:15, Manivannan Sadhasivam wrote:
>>> On Tue, May 09, 2023 at 02:20:07PM +0300, Dmitry Baryshkov wrote:
>>>> On Tue, 9 May 2023 at 08:50, Manivannan Sadhasivam
>>>> <manivannan.sadhasivam@linaro.org> wrote:
>>>>>
>>>>> On Sun, May 07, 2023 at 08:53:35PM +0300, Dmitry Baryshkov wrote:
>>>>>> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
>>>>>> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
>>>>>> flags to PWRSTS_OFF_ON.
>>>>>>
>>>>>
>>>>> What does "stop working" implies? Does it work during boot and randomly stopped
>>>>> working or it stopped working after resume from suspend?
>>>>
>>>> It stops working during the boot. I observed the MDP not starting up
>>>> properly. Mea culpa, I did not look deep enough into the details, just
>>>> stomped upon this change which fixes the problem for me.
>>>>
>>>
>>> IIUC, GDSC will be transitioned to retention mode only if the parent domain goes
>>> to low power mode. So if the MDSS GDSC goes to retention mode during boot, then
>>> it suggests that the parent domain is not voted properly. Unless I misunderstood
>>> something...
>>
>> Not sure, what is the parent domain here. Note, it is a pretty old
>> implementation.
> 
> Colleagues, any further feedback on this? I'd like to note that all
> other platforms use PWRSTS_OFF_ON for the MDSS_GDSC,
> I do not think that msm8974 is particularly different here.
I'd say it's ok for now.

Konrad
> 
>>
>>>
>>> Or is the GDSC behavior changes between RPM and RPMh?
>>>
>>> - Mani
>>>
>>>>>
>>>>> Even though reverting to non-retention mode works, I think the issue might be
>>>>> somewhere else. Like the vote might be missing to get the GDSC out of retention
>>>>> mode.
>>>>
>>>> I don't think there is a vote missing. The driver votes on MDSS_GDSC
>>>> before enabling access to any of the registers from the MDSS region.
>>>>
>>>>>
>>>>> - Mani
>>>>>
>>>>>> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>   drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
>>>>>> index aa29c79fcd55..277ef0065aae 100644
>>>>>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>>>>>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>>>>>> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
>>>>>>        .pd = {
>>>>>>                .name = "mdss",
>>>>>>        },
>>>>>> -     .pwrsts = PWRSTS_RET_ON,
>>>>>> +     .pwrsts = PWRSTS_OFF_ON,
>>>>>>   };
>>>>>>
>>>>>>   static struct gdsc camss_jpeg_gdsc = {
>>>>>> --
>>>>>> 2.39.2
>>>>>>
>>>>>
>>>>> --
>>>>> மணிவண்ணன் சதாசிவம்
>>>>
>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>>
>>
>> --
>> With best wishes
>> Dmitry
>>
> 
> 
