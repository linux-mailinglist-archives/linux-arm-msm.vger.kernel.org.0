Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6886BE3AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 09:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbjCQIeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 04:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjCQIdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 04:33:41 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBCB30CA
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:32:33 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id y4so17424762edo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679041952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oDOcNIcbSN9Lk2htsV80EHwrNf4UOCNV6ZaL1McyWuk=;
        b=Nb0YDCUjo8OyvolKZu7uS9pixhnVmAjS/JIK0BCtKNVk1/oMea0jrQd3l/lFz6bVCR
         USIyJRSbW3jZp8FOUyQrA+revcu9mDP2Gj82GWbNeC8+Syck8Y8va4gbH2ni+Y80SYaB
         wxZC/laPoSIONRF9xS3gye6DieykFm/d/QeR1Cw9Q3qSmG2znVuLWufS7iZlhuoVeqTM
         xYrRKzIq1JBntBrTw73UYZQ7rSc2HusEYilpAYzIPc8CJjEpkul1g0ctguduBCb144kf
         QzN71abPTQv/RaiIIdaIK2ySfGwINZfJzFD5FMzCKD/1k7mmENVlYtkB71ke8LSKmAc0
         2DVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679041952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDOcNIcbSN9Lk2htsV80EHwrNf4UOCNV6ZaL1McyWuk=;
        b=upvn4w5DHR/uY2LL2KGUdiLlqFxzF9m/oqfVQApmn30hOjAsPNKlQA7EeAZkMvuR5y
         02IZzNmWfwb/tMOG/3sFKP62ZO/vkCUTIXgj+6frbvLx/fuWhBcVyxRvQmoE96Iycq4N
         HswCU9r3wJDc8lQBW3ph/pSM1LP3s+VUO6XE6kq2UKw7Tev5L3Q34XJnrsetjJLa3cks
         rBz9U5z1f5e8pRRO7sfMGfD06uAQo8Qylvht5gpcsP5dNLEWwWVjT2H94HuPvcgcU2Qs
         FyO9retbZWg2FOBEOfHMj6Cslk7ONf3QhN8NkWfMLDMbCpdSi96PER9v4JoFEG3NwiM8
         oh9w==
X-Gm-Message-State: AO0yUKWa9pFvnHfP0/M2u9NCQ7cnYMQ+6TNjPnnMVZ7gBxMKVCPzkeWq
        SaJdkA1hqtqtnbi37S1E8ssahg==
X-Google-Smtp-Source: AK7set/64No4okniI9+o2EC5df5JYtg/Ur5By37PIJVSfElLEiA0wNITxxOCYNOCOgrpQmgmHOSDJg==
X-Received: by 2002:a17:907:3fa6:b0:878:7189:a457 with SMTP id hr38-20020a1709073fa600b008787189a457mr16572865ejc.51.1679041952687;
        Fri, 17 Mar 2023 01:32:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id mj4-20020a170906af8400b008ca8b62cda6sm699999ejb.177.2023.03.17.01.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:32:32 -0700 (PDT)
Message-ID: <0edf6829-3a23-7a75-a225-d69222ae2788@linaro.org>
Date:   Fri, 17 Mar 2023 09:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Document SM61[12]5 GPU SMMU
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230315-topic-kamorta_adrsmmu-v1-0-d1c0dea90bd9@linaro.org>
 <20230315-topic-kamorta_adrsmmu-v1-1-d1c0dea90bd9@linaro.org>
 <f09e93e1-235a-ea0a-902d-4f41a8c90ee5@linaro.org>
 <d260b390-f6f2-493a-071c-f88c36582881@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d260b390-f6f2-493a-071c-f88c36582881@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/03/2023 22:59, Konrad Dybcio wrote:
> 
> 
> On 16.03.2023 20:29, Krzysztof Kozlowski wrote:
>> On 15/03/2023 11:52, Konrad Dybcio wrote:
>>> Both of these SoCs have a Qualcomm MMU500 implementation of SMMU
>>> in front of their GPUs that expect 3 clocks. Both of them also have
>>> an APPS SMMU that expects no clocks. Remove qcom,sm61[12]5-smmu-500
>>> from the "no clocks" list (intentionally 'breaking' the schema checks
>>> of APPS SMMU, as now it *can* accept clocks - with the current
>>> structure of this file it would have taken a wastefully-long time to
>>> sort this out properly..) and add necessary yaml to describe the
>>> clocks required by the GPU SMMUs.
>>
>>
>>> +      properties:
>>> +        compatible:
>>> +          items:
>>> +            - enum:
>>> +                - qcom,sm6115-smmu-500
>>> +                - qcom,sm6125-smmu-500
>>> +            - const: qcom,adreno-smmu
>>> +            - const: qcom,smmu-500
>>> +            - const: arm,mmu-500
>>
>> If you drop the hunk later (from allOf:if), then what clocks do you
>> expect for non-GPU SMMU?
> Both 6115 and 6125 require no clocks under the APPS (non-GPU) SMMU.
> However, the list below uses a `contains:` which means I'd have
> to add a whole another hunk like
> 
> 	- items:
>             - enum:
>                 - qcom,sm6115-smmu-500
>                 - qcom,sm6125-smmu-500
>             - const: qcom,smmu-500
>             - const: arm,mmu-500
> 
> and add another level of indentation to the previous one
> 
> I figured skipping that was less messy (I think we discussed this
> once as well), but if you prefer to keep it strict, I can.

Nah, ok, it's fine.

Best regards,
Krzysztof

