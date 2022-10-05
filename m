Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF0F5F55D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 15:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiJENuq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 09:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiJENup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 09:50:45 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF6B5C35A;
        Wed,  5 Oct 2022 06:50:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a26so35601380ejc.4;
        Wed, 05 Oct 2022 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7Jw/7QS61Dgc9YXSBwRgFOA/+i4BPGb1Saz418bmlzk=;
        b=H7Kf1btKe4ecZNI/GjNP0vyymgt+TmbwNrTCkPe+zJi5MJ+D72BAXdt8hGrgVpAmMJ
         WZZKKQfWvd7yuISWTwQUQNqPmneR3dRmy1Stg4ehYMPZiBztbJFTEJK4v8qOb9AZ7NzS
         6Lq3IDnD1HxhG6v1MsR1KAE4d+n1OC9/vflD2yjk9cL8PiH6Qlkp7IHd2wRrWRStDPZz
         1qNoN8SG2c7muZH2+PGIggMqelenm2ObfWc5hNlJDjeX1neVe2K+9ewOSqU1/b7blsV9
         /daXNzS5X9NhQIOtReq8DVREiah71IGV08JH4BDhG8hW42MI9f+rBRTJL27PoImVp2Fn
         sugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7Jw/7QS61Dgc9YXSBwRgFOA/+i4BPGb1Saz418bmlzk=;
        b=lfJ2n/fiFt41H09DnwWwmRcCrnJoXn+qOSirjFbHacMadLD9QymPKQKBNmZbHXD6JP
         ITVAUYzCm5h5czv7mQln58Yb5xMGcIdWq5MRCfCkRHO5r8rPnhE8mnIw4bEIXXYSScUv
         z3Fcws3LuwG/EXElnBQYioAjSXmPGXMgBCjGi4i/L2uqAi5UD01bULD9ud0EnQBYqFPC
         IIzUvetxx/PJrb54eVBhxvNrHCcuj616pwU9wq+9PFYyFzrmH9iZWQaEE1ZrJPifdYSK
         3k+CHEezGIiS44sgSeQr+2rZPxV8LKIuVb7G+372Ay2UZbnkpjvt9pSllY5/P4h5Lu3r
         yUAg==
X-Gm-Message-State: ACrzQf2+tw2pRzU95/umSMzwh7r2a2Lh2fgN7ge/z/SiFXbMkdxTYlgr
        XmqwJ2sidqjSpWMWDQ7KSsg=
X-Google-Smtp-Source: AMsMyM4T4bU7sZhH/PUQgMbynLZXdHeUrDW8h1NU8HKYK6VqmVnw5331cBv9QuqTd0ic2E0KvnLRqw==
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id dt14-20020a170907728e00b007828e9164c8mr24473496ejc.36.1664977839520;
        Wed, 05 Oct 2022 06:50:39 -0700 (PDT)
Received: from [192.168.3.32] (dh207-97-74.xnet.hr. [88.207.97.74])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0077086d2db8esm8789136ejf.140.2022.10.05.06.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 06:50:38 -0700 (PDT)
Message-ID: <4bc9033c-624e-bafb-a6f7-3915a1b27664@gmail.com>
Date:   Wed, 5 Oct 2022 15:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,spm: support regulator SAW2
 devics
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
 <a743d50f-fc59-161e-c98f-f10b26e2afe5@linaro.org>
 <CAA8EJpo9kSs_h28SneAwQ0FLHJ0PipmbQRm791hb-vHtGwXwDQ@mail.gmail.com>
From:   Robert Marko <robimarko@gmail.com>
In-Reply-To: <CAA8EJpo9kSs_h28SneAwQ0FLHJ0PipmbQRm791hb-vHtGwXwDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 02. 10. 2022. 14:20, Dmitry Baryshkov wrote:
> On Sun, 2 Oct 2022 at 11:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 01/10/2022 01:14, Dmitry Baryshkov wrote:
>>> Merge qcom,saw2.txt bindings to existing qcom,spm.yaml. This fixes
>>> compatibility of qcom,spm schema with regulator SAW2 devices.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
>>>   .../bindings/soc/qcom/qcom,spm.yaml           | 44 +++++++++-----
>> You need to update reference in
>> Documentation/devicetree/bindings/arm/cpus.yaml
> ack
>
>>>   2 files changed, 30 insertions(+), 72 deletions(-)
>>>   delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
>>> deleted file mode 100644
>>> index c0e3c3a42bea..000000000000
>>> --- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> [skipped]
>
>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
>>> index f433e6e0a19f..8fe35fde70b8 100644
>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
>>> @@ -16,23 +16,33 @@ description: |
>>>
>>>   properties:
>>>     compatible:
>>> -    items:
>>> -      - enum:
>>> -          - qcom,sdm660-gold-saw2-v4.1-l2
>>> -          - qcom,sdm660-silver-saw2-v4.1-l2
>>> -          - qcom,msm8998-gold-saw2-v4.1-l2
>>> -          - qcom,msm8998-silver-saw2-v4.1-l2
>>> -          - qcom,msm8909-saw2-v3.0-cpu
>>> -          - qcom,msm8916-saw2-v3.0-cpu
>>> -          - qcom,msm8226-saw2-v2.1-cpu
>>> -          - qcom,msm8974-saw2-v2.1-cpu
>>> -          - qcom,apq8084-saw2-v2.1-cpu
>>> -          - qcom,apq8064-saw2-v1.1-cpu
>>> +    oneOf:
>>>         - const: qcom,saw2
>> I understand old bindings had it, but I don't think we really want to
>> support the generic compatible on its own. Even old bindings indicated
>> that there are several differences between SAWs.
>>
>> Especially confusing is that once qcom,saw2 can be alone and in other
>> cases must be preceded by specific compatible. IOW, you allow for
>> apq8064 two cases:
>>
>> 1. qcom,apq8064-saw2-v1.1-cpu, qcom,saw2
>> 2. qcom,saw2
>>
>> I think we should instead add everywhere specific compatibles.
> I see your point. Yes, it's probably worth doing that.
>
> Robert, Christian, can you possibly check the version of the SAW2 used
> on ipq4019 and ipq8064? It can be read from the SPM block at the
> register offset 0xfd0.

Hi, I completely missed this so far, sorry about that.

I checked from U-boot on multiple SAW blocks on IPQ4019 and it looks to 
be v3.0:
(IPQ40xx) # md.l 0xB0B9FD0 1
0b0b9fd0: 30000000    ...0
(IPQ40xx) # md.l 0xB089FD0 1
0b089fd0: 30000000    ...0
(IPQ40xx) # md.l 0xB099FD0 1
0b099fd0: 30000000    ...0
(IPQ40xx) # md.l 0xB0A9FD0 1
0b0a9fd0: 30000000    ...0

IPQ8064 is a bit weird, both SAW-s from DTS show all zeros:
(IPQ) # md.l 0x2089FD0 1
02089fd0: 00000000    ....
(IPQ) # md.l 0x2099FD0 1
02099fd0: 00000000    ....

However some old datasheet says: 0x02011FD0 APCS_VERSION

(IPQ) # md.l 0x02011FD0 1
02011fd0: 10010000    ....

But It also says that minor and step are both bits 15:0 which makes no 
sense.

Hope this helps,
Robert

>
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,sdm660-gold-saw2-v4.1-l2
>>> +              - qcom,sdm660-silver-saw2-v4.1-l2
>>> +              - qcom,msm8998-gold-saw2-v4.1-l2
>>> +              - qcom,msm8998-silver-saw2-v4.1-l2
>>> +              - qcom,msm8909-saw2-v3.0-cpu
>>> +              - qcom,msm8916-saw2-v3.0-cpu
>>> +              - qcom,msm8226-saw2-v2.1-cpu
>>> +              - qcom,msm8974-saw2-v2.1-cpu
>>> +              - qcom,apq8084-saw2-v2.1-cpu
>>> +              - qcom,apq8064-saw2-v1.1-cpu
>>> +          - const: qcom,saw2
>>>
>>>     reg:
>>> -    description: Base address and size of the SPM register region
>>> -    maxItems: 1
>>> +    description: Base address and size of the SPM register region. An optional
>>> +      second element specifies the base address and size of the alias register
>>> +      region.
>>> +    minItems: 1
>>> +    maxItems: 2
>> And it seems second region is not present on some variants?
> The second region is a bit of a puzzle for me as it doesn't seem to be
> used at all.
>
