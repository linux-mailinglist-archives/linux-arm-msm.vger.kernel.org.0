Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1521D712DC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237475AbjEZTmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237506AbjEZTmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:42:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81BD194
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:41:57 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f1411e8111so1294258e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130116; x=1687722116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FSe8dTaK8x4aBUD/jMFuOWtPgrWFHesEVp3wlm3KGkk=;
        b=ha1QwaR1QQdIGvTgl7YfQKTBclcjdV8nvj4Meclx31HBbHsAPMAqdge8vlskJcF97f
         YA9NDySXWPE5zGwNGWbPLR67cmLh3F2mv2OTW+D7V8Pi7jXuztbkX+gnb2F8/vEv0pZY
         pu7BPT1Wckyr565XhI9Ckk/rtz6wjqGxZ97ZR8C4a32IfRXg0PbDHYLZo18glGZqK27x
         llnkzsuJ+UaTIgdoC2LAqRYfc5eVT0RqV5ZE7vd+t2QaowwmevzOIWyitJUG7QhkcU/f
         mHRcFVOwTvBpqKBWP64uLhxnknXCYVVX174j3czZ9UbeuUIBCQLe4m0k8GgfQvFcJFnw
         51lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130116; x=1687722116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSe8dTaK8x4aBUD/jMFuOWtPgrWFHesEVp3wlm3KGkk=;
        b=GgVky4E9m5l8N9GA4qn4f87UyxpKYYYhDPwoz4M1MXRrWkdS+2dYX55e/5R5+bcSQF
         WRGD38LWevIcbP89YNj7Hk6KbxptYb4Hq/WAxqSPA5S7z4md5tT8bOUSJIbu2tBp2lb1
         k5ZRwKKES4TJBHpxkfg63Cii3x4xLfeW/nyrSlNG+k71a+JBb1/jxXlQfn6TIvC+CHuS
         HjA4fdGuKZEOTsuIzvOkPgZi2cwoTN2T7Zd8EjoHM73tJR27UK0IJQuQnCOgliiJc0sc
         j3tMACzmDNzSKb8D7HktuLdhkOoRsqihjWW7FRhwyU+aA0Bg05MkA2ufYhEBLrw9mDAx
         pnWg==
X-Gm-Message-State: AC+VfDxw42ou2cVQosfW6qzl1XtQKhf+TgQhRa9uifKd/cPsA0iIZyqd
        CtEc2dMOUY71224YKH3MNdwbvg==
X-Google-Smtp-Source: ACHHUZ6T1cUYaGXiFt+9m4Oaj8GpUS+9Sh/LhkT7fJ1Q60tcGrFF4cp3WGcLFm7trLws+/urkErSjg==
X-Received: by 2002:a19:f715:0:b0:4f2:40dd:e2cf with SMTP id z21-20020a19f715000000b004f240dde2cfmr875000lfe.55.1685130115941;
        Fri, 26 May 2023 12:41:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b004f387d97dafsm754263lfo.147.2023.05.26.12.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:41:55 -0700 (PDT)
Message-ID: <de0512b1-a8c7-2dc9-ab48-158a47e6d5a6@linaro.org>
Date:   Fri, 26 May 2023 21:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: Add OXILICX_GDSC for msm8226
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230506-msm8226-oxilicx-v1-1-52e34b94ff22@z3ntu.xyz>
 <2528191.PYKUYFuaPT@z3ntu.xyz>
 <275c997a-a09d-113f-631d-bb677a05ac5f@linaro.org>
 <2679976.mvXUDI8C0e@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2679976.mvXUDI8C0e@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.05.2023 22:44, Luca Weiss wrote:
> On Dienstag, 16. Mai 2023 02:15:06 CEST Konrad Dybcio wrote:
>> On 9.05.2023 18:57, Luca Weiss wrote:
>>> On Montag, 8. Mai 2023 13:35:07 CEST Konrad Dybcio wrote:
>>>> On 8.05.2023 13:32, Dmitry Baryshkov wrote:
>>>>> On 08/05/2023 10:23, Konrad Dybcio wrote:
>>>>>> On 6.05.2023 23:20, Luca Weiss wrote:
>>>>>>> On msm8226 we also have OXILICX_GDSC but we need a slighly different
>>>>>>> config, with a .cxcs defined for clock but with no parent.
>>>>>>
>>>>>> Hm, on newer (a5xx+) GPUs, CX needs to be turned on first and
>>>>>> to achieve that, we sometimes define it to be the GX's (also
>>>>>> implicitly known as "oxili-non-CX" in before-a6xx-times) parent..
>>>>>>
>>>>>> Roughly speaking CX powers the "GPU hardware owned by the broader
>>>>>> SoC that may not need the GPU core clock to be up" and GX powers
>>>>>> the "GPU hardware owned strictly by the GPU that needs at least some
>>>>>> GPU clocks to be enabled"
>>>>>>
>>>>>> Maybe 8974 simply has a bug in the driver that would do the reverse?
>>>>>> Could you (and perhaps Dmitry on his shiny new 13yo board) test that
>>>>>> theory, preferably on both SoCs?
>>>>>>
>>>>>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>>>>>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>>>>>> @@ -2431,6 +2431,7 @@ static struct gdsc oxili_gdsc = {
>>>>>>
>>>>>>          .pd = {
>>>>>>          
>>>>>>                  .name = "oxili",
>>>>>>          
>>>>>>          },
>>>>>>
>>>>>> +       .parent = &oxili_gdsc.pd,
>>>>>>
>>>>>>          .pwrsts = PWRSTS_OFF_ON,
>>>>>>   
>>>>>>   };
>>>>>
>>>>> Are you declaring oxili_gdsc to be a parent of itself?
>>>>
>>>> lol.. nice catch of course this line should have been
>>>>
>>>> +       .parent = &oxilicx_gdsc.pd,
>>>>
>>>> and the definitions would need to be swapped
>>>
>>> The 0x4024 oxili_gdsc (downstream name gdsc_oxili_gx) is disabled in 8226
>>> dts.
>>>
>>> Only in downstream msm8974.dtsi this gdsc gets "parent-supply =
>>> <&pm8841_s4_corner>;", on 8226 there's no parent-supply. And the gdsc
>>> parent doesn't even seem to be described there.
>>>
>>> Should I still try?
>>
>> No, nevermind, this SoC is cut down more than I had initially thought.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> with a minor nit: oxilicx -> oxili_cx
> 
> Hi Konrad,
> 
> where do you want this changed? Just the .name field?
Yes and maybe the struct name. We shouldn't be messing with bindings
since it's cosmetic.

 But even that one is now 
> matching the other oxilicx variant. And there's also gdscs like 
> oxilicx_ahb_clk.
oxilicx literally means "the CX side of OXILI", or translating from
Qualcommish to English "GPU registers accessible from the AP, not
necessarily the GPU itself"

Konrad
> 
> Let me know.
> 
> Regards
> Luca
> 
>>
>> Konrad
>>
>>>> Konrad
>>>>
>>>>>>   @@ -2439,7 +2440,6 @@ static struct gdsc oxilicx_gdsc = {
>>>>>>   
>>>>>>          .pd = {
>>>>>>          
>>>>>>                  .name = "oxilicx",
>>>>>>          
>>>>>>          },
>>>>>>
>>>>>> -       .parent = &oxili_gdsc.pd,
>>>>>>
>>>>>>          .pwrsts = PWRSTS_OFF_ON,
>>>>>>   
>>>>>>   };
>>>>>>
>>>>>> Konrad
>>>>>>
>>>>>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>>>>>> ---
>>>>>>>
>>>>>>>   drivers/clk/qcom/mmcc-msm8974.c | 11 +++++++++++
>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c
>>>>>>> b/drivers/clk/qcom/mmcc-msm8974.c index 4273fce9a4a4..39ee3953567c
>>>>>>> 100644
>>>>>>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>>>>>>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>>>>>>> @@ -2443,6 +2443,16 @@ static struct gdsc oxilicx_gdsc = {
>>>>>>>
>>>>>>>       .pwrsts = PWRSTS_OFF_ON,
>>>>>>>   
>>>>>>>   };
>>>>>>>   +static struct gdsc oxilicx_gdsc_msm8226 = {
>>>>>>>
>>>>>>> +    .gdscr = 0x4034,
>>>>>>> +    .cxcs = (unsigned int []){ 0x4028 },
>>>>>>> +    .cxc_count = 1,
>>>>>>> +    .pd = {
>>>>>>> +        .name = "oxilicx",
>>>>>>> +    },
>>>>>>> +    .pwrsts = PWRSTS_OFF_ON,
>>>>>>> +};
>>>>>>> +
>>>>>>>
>>>>>>>   static struct clk_regmap *mmcc_msm8226_clocks[] = {
>>>>>>>   
>>>>>>>       [MMSS_AHB_CLK_SRC] = &mmss_ahb_clk_src.clkr,
>>>>>>>       [MMSS_AXI_CLK_SRC] = &mmss_axi_clk_src.clkr,
>>>>>>>
>>>>>>> @@ -2533,6 +2543,7 @@ static struct gdsc *mmcc_msm8226_gdscs[] = {
>>>>>>>
>>>>>>>       [MDSS_GDSC] = &mdss_gdsc,
>>>>>>>       [CAMSS_JPEG_GDSC] = &camss_jpeg_gdsc,
>>>>>>>       [CAMSS_VFE_GDSC] = &camss_vfe_gdsc,
>>>>>>>
>>>>>>> +    [OXILICX_GDSC] = &oxilicx_gdsc_msm8226,
>>>>>>>
>>>>>>>   };
>>>>>>>   
>>>>>>>     static const struct regmap_config mmcc_msm8226_regmap_config = {
>>>>>>>
>>>>>>> ---
>>>>>>> base-commit: dd9e11d6477a52ede9ebe575c83285e79e823889
>>>>>>> change-id: 20230506-msm8226-oxilicx-7f3f0f8e491d
>>>>>>>
>>>>>>> Best regards,
> 
> 
> 
> 
