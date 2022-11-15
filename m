Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33544629B06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 14:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237818AbiKONs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 08:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiKONs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 08:48:26 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC7C24F10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:48:21 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id l12so24484335lfp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PyQQsmdB9p1iCbGlgrbpIM/umuy2agle/uOgcxWJaw0=;
        b=ifGbpBcqd+1nCUiyTrYte34kDBWXyRIYNmNA/HCI0elOYiAzLvI010U5mZ1NaqUCIr
         PO/fHVmh7JB+FX+3TAHtpuM0QWLqfRib8Ymr3wAauhli56Dm77ENoOYnzuinHPc3H1cV
         B9TY/9dQbZi2UcigQna6+JW6cvs6SYJjKXj8peTnDPLMT1cszxjjTIBBwjXHfSnkNwTA
         9P0ZNihkfIEwMSr7/bIhf23XcMgXqi7v1gr/Q8aWCAe5KlBXny9Fx3GHdUW/TD88wsgg
         1U6kX5uHrW47sF0n6w99xKMwCP1/w+sWvmuCqTuxz/MdeW6QRCy3rSBUgNEATjjB3mxd
         GtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PyQQsmdB9p1iCbGlgrbpIM/umuy2agle/uOgcxWJaw0=;
        b=x7/zDSLeElSVxtjtWQaudsAEL6DkkOGl3j88HCxTDWVbJkW977r2+rSIFWFFgymQUm
         hLwVpDTGeT37zffG4mxMDBs9HKOVe7+7U6rEkaO0KdsvJDnCDYrb1g9EdeDiwLBAugPB
         iQk1XtHrpjrJOKh4UcAI4ibl7mYkPbWDREmKRfll8HzYAygqua3yogQZkqiMPXDVz2N6
         fWX87YpfjJ0tzmLwsOXU+TfOOiv2t1Ofv99QfIZ5S0rA2UcAyy/iwDTGn3b4JjHHVpdd
         ut+GmG6aEoB5nta2EWQ2eF2G2SKY/a5jhloIdiqKw+Bt6qHcWpJ1eb66rbeIReqtC/Vm
         7RGg==
X-Gm-Message-State: ANoB5plnml4Zv2AS0FZ/mrUOz5XaeJ3ACLC7fflX+x9StppHw9XBqmZA
        7o1XS9FssI7yVttfxvMschpntg==
X-Google-Smtp-Source: AA0mqf7NzmaJ1S8z7UNAq0GcGiVsV6Ak7vPyFfGsvevSVpg2e8K8g3+r2D+3QVfW/6/DuccuYbUTvg==
X-Received: by 2002:a19:5051:0:b0:499:8e29:2763 with SMTP id z17-20020a195051000000b004998e292763mr6406317lfj.137.1668520100303;
        Tue, 15 Nov 2022 05:48:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c8-20020ac24148000000b00492c663bba2sm2207122lfi.124.2022.11.15.05.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:48:19 -0800 (PST)
Message-ID: <3fd767c3-84c3-7155-9e05-cc124e3b3d2f@linaro.org>
Date:   Tue, 15 Nov 2022 14:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/9] dt-bindings: arm-smmu: Allow up to 3 power-domains
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
 <20221114104222.36329-2-konrad.dybcio@linaro.org>
 <6fa8e3ea-2113-d930-96bc-3726d53e5bcd@linaro.org>
 <a4b160d8-0faa-3f4c-a925-0beaf6ace721@linaro.org>
 <0121fc03-b027-7659-5e6e-b42089c9888d@linaro.org>
 <12578e05-ced9-e5f7-7922-0af2f2159333@linaro.org>
 <878402e7-7f80-31c7-3a6b-989a6ca29841@linaro.org>
 <f59ddce1-c2e1-4055-3bce-1319c68ddf94@linaro.org>
 <4b4ca3ba-8e4d-088e-8b3e-a47ad6ecb965@linaro.org>
 <cff269c8-f944-9277-9df8-653522efbba0@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cff269c8-f944-9277-9df8-653522efbba0@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 15/11/2022 14:06, Konrad Dybcio wrote:>> diff --git
a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> index 28f5720824cd..55759aebc4a0 100644
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -200,7 +200,7 @@ properties:
>>>        maxItems: 7
>>>
>>>      power-domains:
>>
>> As I mentioned before - minItems: 1.
> But not all SMMUs require a power domain :/

It does not matter. This does not require power-domains.

> 
>>
>> Just like the link I gave you.
>>
>>> -    maxItems: 1
>>> +    maxItems: 3
>>>
>>>      nvidia,memory-controller:
>>>        description: |
>>> @@ -364,6 +364,26 @@ allOf:
>>>                - description: interface clock required to access smmu's
>>> registers
>>>                    through the TCU's programming interface.
>>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: qcom,sm6375-smmu-500
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: SNoC MMU TBU RT GDSC
>>> +            - description: SNoC MMU TBU NRT GDSC
>>> +            - description: SNoC TURING MMU TBU0 GDSC
>>> +
>>> +      required:
>>> +        - power-domains
>>> +    else:
>>> +      properties:
>>> +        power-domains:
>>> +          maxItems: 1
>>> +
>>>    examples:
>>>      - |+
>>>        /* SMMU with stream matching or stream indexing */
>>>
>>>
>>> In my eyes, this should work, but I still get errors like:
>>>
>>> /home/konrad/linux/arch/arm64/boot/dts/qcom/sm8250-hdk.dtb:
>>> iommu@3da0000: power-domains: [[108, 0]] is too short
>>>
>>> as if the else: path was never taken..
>>
>> It was, but the top-level property said that minItems=3 (implicitly), so
>> it is too short.
> So the top-level properties take precedence over the ones that come from 
> the if-then-else?? Ugh.

It's a sum of them. Top level is expected to define the widest
constraints and if-then-else narrows them per variants.

Best regards,
Krzysztof

