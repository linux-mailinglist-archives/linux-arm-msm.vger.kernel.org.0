Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350F3662410
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 12:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbjAILVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 06:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236418AbjAILU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 06:20:58 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603B321A9
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 03:20:56 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso6400146wmq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 03:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/e2tqkMyAFlhiJWdNdwbmjPbRefooIpDJoX+MaYwlrQ=;
        b=rMpr6VcwwZ/daeCxWlkkOcsvpMMep2WhkBnk+IpvDYNXDs+xVkeZ9tSd1NsXWYMyXn
         ZWeP8XEaeJRnkteKbZ07/QpoL5j7R6O9ikYEK03nosc1NWGFG+GAjubN/Z/Obz26+8ZE
         f7AxVBEUAHXQPpHbmRtEv+1K7P698C5TEIL9qwUgprXRcDPIFuIwNbOk+nzEYTXqDjyO
         00w97cgIImpgv2WiNMkFS4NAxS1MUdSHOHUWvwCDgQcjPJ4+xrbFtUrsJb+OtPeLdL8T
         DouQQKGA+6UYrApwBXrsFTcmNkP+6mNN3W7e7klYLVyx7ER49UTS6J59FR/S1LiwbXZW
         AmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/e2tqkMyAFlhiJWdNdwbmjPbRefooIpDJoX+MaYwlrQ=;
        b=yO5bKNPv4MsxQVJX6v+pjUiABAGFtU4uFOnrEXluyRY7J9OdRZpwnqweWoCXSNRCOf
         y9Ky06JaCEOxtC8YwkRr6X2pp5XtlwpCiHwmwvqflEkezAsH2S+iuCo/7xofoSKBOdKV
         azytzlqi7PDwKRehqW5Cup2UU4pmX6N+Xkc46h8O/gJKq06p2905vjoa2OzottXOTFsg
         7HiWuylMrlOc+YrvAzvlCF0KEJJeCbDGhqsxuD4TvAdnw+ksLeKnifHii+mMD4IYOOMN
         Pl9YiBUOLifRchlWha7qmngCvt0OeFTHkqDbWpRPxvE9czhjZBiO9rvA7LoGP0sgcL7d
         AIGw==
X-Gm-Message-State: AFqh2kpHsIfLwMtY5RpuVPm9dRJ2nmCD4wtBQN8RS1/fsIhMSSwlJmmW
        SwghFD8yMn1d6rjmEyBDOX2vbg==
X-Google-Smtp-Source: AMrXdXvvKQd6UH9GH0DAL0TwUACiPKgYay+KZ4zYEwL4plygXjsVaupjKecFaHHcj+M3hf6ijOqNqg==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id n20-20020a05600c501400b003d3446ab46amr48910897wmr.38.1673263254937;
        Mon, 09 Jan 2023 03:20:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b003d34faca949sm11160495wmb.39.2023.01.09.03.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 03:20:54 -0800 (PST)
Message-ID: <0b630735-c3fd-d71f-ce90-f20046c38879@linaro.org>
Date:   Mon, 9 Jan 2023 12:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: add core clock to the
 mdss bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
 <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
 <3414e686-9f8d-a29d-6cc1-f073b70a9f1c@linaro.org>
 <5a58eabc-08ba-57da-290d-b432f3f99268@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5a58eabc-08ba-57da-290d-b432f3f99268@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 11:51, Dmitry Baryshkov wrote:
> On 09/01/2023 12:35, Krzysztof Kozlowski wrote:
>> On 09/01/2023 01:52, Dmitry Baryshkov wrote:
>>> Add (optional) core clock to the mdss bindings to let the MDSS driver
>>> access harware registers before MDP driver probes.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
>>>   1 file changed, 26 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>>> index ba0460268731..0647fc5a7d94 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>>> @@ -45,17 +45,11 @@ properties:
>>>   
>>>     clocks:
>>>       minItems: 1
>>> -    items:
>>> -      - description: Display abh clock
>>> -      - description: Display axi clock
>>
>> Not related to this patch, but it is a bit surprising to see AXI clock
>> optional.
> 
> Hmm, There is one defined downstream. Probably we should fix that (but 
> yes, it's a separate issue).
> 
>>> -      - description: Display vsync clock
>>> +    maxItems: 4
>>>   
>>>     clock-names:
>>>       minItems: 1
>>> -    items:
>>> -      - const: iface
>>> -      - const: bus
>>> -      - const: vsync
>>> +    maxItems: 4
>>>   
>>>     "#address-cells":
>>>       const: 1
>>> @@ -69,6 +63,30 @@ properties:
>>>       items:
>>>         - description: MDSS_CORE reset
>>>   
>>> +oneOf:
>>> +  - properties:
>>> +      clocks:
>>> +        minItems: 3
>>> +        maxItems: 4
>>> +
>>> +      clock-names:
>>> +        minItems: 3
>>> +        items:
>>> +          - const: iface
>>> +          - const: bus
>>
>> BTW, sc7180-mdss uses here ahb name and calls it "AHB clock from dispcc".
>>
>> SM8250 won't match here either. Maybe this should be reworked to specify
>> limits here but not the names and actual clocks? IOW, drop entire oneOf?
> 
> SC7180 and SM8250 use platform-specific bindings (qcom,sc7180-mdss.yaml 
> and qcom,sm8250-mdss.yaml). This file is used only for older platforms 
> (msm8916, msm8996, etc).

Ah, right. It's a bit confusing to have bindings split into files:
1. mdss-common
2. mdss
3. device specific

but I guess fixing this would be another chunk of work.

> 
>>
>> There were a lot, a lot of changes to MDSS/DPU bindings recently, so I
>> am really loosing track what is done where and when.
>>
>> There are also few separate patchsets from you on the lists. Could they
>> be combined into one cleanup?
> 
> Ack, I'll merge them into a single patchset.
> 
>> I understand that sometimes new cleanup is needed after old cleanup
>> finished (I had the same with pinctrl), so it is not a complain.
>>
>> Another problem (and this time I complain) is that several of your
>> patchsets were sent, discussed and then without any notice applied. No
>> message that a patchset was applied to some tree. Look:
>>
>> https://lore.kernel.org/all/20221124001708.25720-2-a39.skl@gmail.com/
>> https://lore.kernel.org/all/09ed16e1-4af2-8fce-dab4-f6c0f09e688c@linaro.org/
>>
>> Nothing. Silent application. If you are the maintainer which picks up
>> the patch, please always, always send message that they are applied.
>> Patchwork does it automatically, b4 can do it easily as well. If you use
>> other tools - use other tools for sending it. Otherwise things are
>> discussed on mailing lists, receive several comments and there is never
>> a resubmit but instead they show in the tree.
> 
> Unfortunately freedreno uses patchwork-fdo, which doesn't send 
> notifications. And the fdo fork is not supported by b4. I checked what 
> would be necessary to enable support in b4. Unfortunately several API 
> changes would be necessary. So this is a long process. But we are open 
> to any suggestions on how to improve the process. Currently all three 
> maintainers (Rob, Abhinav and me) keep the patch status in the 
> patchwork, but that's all.

And how other freedesktop.org patchwork users notify? Manually or is
there some hook? I notice only Exynos DRM where maintainer sends manual
"Applied" messages.

Best regards,
Krzysztof

