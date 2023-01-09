Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB47B66237E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 11:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbjAIKv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 05:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237046AbjAIKvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 05:51:16 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D044565D7
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 02:51:15 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bu8so12316594lfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsN84k15cdPMCz3ZH4kBmEUN31+4Ir3WQAaxa6Z7nLc=;
        b=g1ZHrjlo39rJcrZJp9CuGlAXd/oFYOjR3UgdFUknYfDi4oDlj60YlStINtQAZbnk41
         eQpI6Lf6PI6swybRHz9UUMlE+DdfmS2NmpXbFm9hfVR3QU+0jKB3WvqNSkProht5xSAc
         OkwLBizkeIC2JVs3cMuMMOOlEm0804Nq4aMuTuVtqDDql1ofQH6WCtgTWZYWx8HAI2Ul
         e4iYINSuS9J1V7/sRogZKmqhPDXROOzmK9+a6rhc0k6QyIskM8jlPEiIEY9PdtJ7IQvi
         LU5NI5pnYt6qvAMLqwh5wAZyMYV2g8L4UzyCVR3/EHe3YCD0vg+TqmMFdwzww+7kFBbV
         Jscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsN84k15cdPMCz3ZH4kBmEUN31+4Ir3WQAaxa6Z7nLc=;
        b=gIMWfAsTi8Imud6cGxrJD9KdJweK8NjQJXIRtr85t/EQsuZHJJPAeHZKHXOEB06x8B
         xrQa20OPooctDtxbeftMT1wR1RTsErMX8mic8OMK2toX2Y2xfofdDdSYmZ/SjBvPqcS/
         RcYSjFVu0FxChdIjghF0wSBXTt6nYG9yFjtYpW7g3LeKwrLmnjvxI1yvcmJy8PgVfPLV
         WVAtQg44d7WBe7l9VoPTldWstiRQAfURYfWjsdXz+fKeLD6I4w4HG90JX0BAZ6pr+VJL
         J3Qgv2KPlgeNYZTxp8+4RiB14BSlwXsr2fjlbaJPZ/MxRe0fdlUdLb9HA62Vi5JUXTiL
         8AmA==
X-Gm-Message-State: AFqh2krb5q9ts+/CDAop90x1g1H9E89T1bZRN8mYLedbJI1Gppuae3ci
        idF3xrXCWlVZAA1jRsr2gJKFbA==
X-Google-Smtp-Source: AMrXdXvmChGvCpuGZwA6ctO/x9l6DNGCK7ykdPtIirR/uRRH6Niih5JBU7Gpn1I52db012aJ7gZUnw==
X-Received: by 2002:a05:6512:2828:b0:4b9:f5e5:8fbc with SMTP id cf40-20020a056512282800b004b9f5e58fbcmr23740622lfb.30.1673261473945;
        Mon, 09 Jan 2023 02:51:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m5-20020a056512114500b004b6f00832cesm1555838lfg.166.2023.01.09.02.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 02:51:13 -0800 (PST)
Message-ID: <5a58eabc-08ba-57da-290d-b432f3f99268@linaro.org>
Date:   Mon, 9 Jan 2023 12:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: add core clock to the
 mdss bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
 <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
 <3414e686-9f8d-a29d-6cc1-f073b70a9f1c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3414e686-9f8d-a29d-6cc1-f073b70a9f1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 12:35, Krzysztof Kozlowski wrote:
> On 09/01/2023 01:52, Dmitry Baryshkov wrote:
>> Add (optional) core clock to the mdss bindings to let the MDSS driver
>> access harware registers before MDP driver probes.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
>>   1 file changed, 26 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> index ba0460268731..0647fc5a7d94 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> @@ -45,17 +45,11 @@ properties:
>>   
>>     clocks:
>>       minItems: 1
>> -    items:
>> -      - description: Display abh clock
>> -      - description: Display axi clock
> 
> Not related to this patch, but it is a bit surprising to see AXI clock
> optional.

Hmm, There is one defined downstream. Probably we should fix that (but 
yes, it's a separate issue).

>> -      - description: Display vsync clock
>> +    maxItems: 4
>>   
>>     clock-names:
>>       minItems: 1
>> -    items:
>> -      - const: iface
>> -      - const: bus
>> -      - const: vsync
>> +    maxItems: 4
>>   
>>     "#address-cells":
>>       const: 1
>> @@ -69,6 +63,30 @@ properties:
>>       items:
>>         - description: MDSS_CORE reset
>>   
>> +oneOf:
>> +  - properties:
>> +      clocks:
>> +        minItems: 3
>> +        maxItems: 4
>> +
>> +      clock-names:
>> +        minItems: 3
>> +        items:
>> +          - const: iface
>> +          - const: bus
> 
> BTW, sc7180-mdss uses here ahb name and calls it "AHB clock from dispcc".
> 
> SM8250 won't match here either. Maybe this should be reworked to specify
> limits here but not the names and actual clocks? IOW, drop entire oneOf?

SC7180 and SM8250 use platform-specific bindings (qcom,sc7180-mdss.yaml 
and qcom,sm8250-mdss.yaml). This file is used only for older platforms 
(msm8916, msm8996, etc).

> 
> There were a lot, a lot of changes to MDSS/DPU bindings recently, so I
> am really loosing track what is done where and when.
> 
> There are also few separate patchsets from you on the lists. Could they
> be combined into one cleanup?

Ack, I'll merge them into a single patchset.

> I understand that sometimes new cleanup is needed after old cleanup
> finished (I had the same with pinctrl), so it is not a complain.
> 
> Another problem (and this time I complain) is that several of your
> patchsets were sent, discussed and then without any notice applied. No
> message that a patchset was applied to some tree. Look:
> 
> https://lore.kernel.org/all/20221124001708.25720-2-a39.skl@gmail.com/
> https://lore.kernel.org/all/09ed16e1-4af2-8fce-dab4-f6c0f09e688c@linaro.org/
> 
> Nothing. Silent application. If you are the maintainer which picks up
> the patch, please always, always send message that they are applied.
> Patchwork does it automatically, b4 can do it easily as well. If you use
> other tools - use other tools for sending it. Otherwise things are
> discussed on mailing lists, receive several comments and there is never
> a resubmit but instead they show in the tree.

Unfortunately freedreno uses patchwork-fdo, which doesn't send 
notifications. And the fdo fork is not supported by b4. I checked what 
would be necessary to enable support in b4. Unfortunately several API 
changes would be necessary. So this is a long process. But we are open 
to any suggestions on how to improve the process. Currently all three 
maintainers (Rob, Abhinav and me) keep the patch status in the 
patchwork, but that's all.

-- 
With best wishes
Dmitry

