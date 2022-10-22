Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95135608BBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Oct 2022 12:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiJVKjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Oct 2022 06:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiJVKjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Oct 2022 06:39:07 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AFB2EBB96
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Oct 2022 02:56:33 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id q19so14324644edd.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Oct 2022 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KV5T4Ds36Pn5JJ9LvcyOc5p1G5ob4lljxOKtNSKGmMI=;
        b=SmS4Dp2bjzHIDfgevSzTDT8N9t7g25MnT2uUBAQ9QLZiE7y7RAxBRrrD+QrDp/8OcE
         1qLojZGCYk1TmHD47+QZ5QRxKUVFsiFhryvAiY0PLrcWWZ7b3S9CvUD66igkBINAElc8
         XE8g10/JjAnoDJ8pvM2eWg8yPQ6rE35JA5K2GE46lb7Hn6aome44rrwg6ZVf3A6F01on
         DYIzONRkjyTmEmo3rWTUnItfFRilXcz0ZEJvIxDfJyIGnP68pxNEa/0Hv27AkZpCZH1z
         BF2AIxyfuC+3pMTC6vIDAzBpP+Fp7ZZVVe7VkEonK4Z5vM4wACjQljpaWU3Ig+FbsKui
         3nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KV5T4Ds36Pn5JJ9LvcyOc5p1G5ob4lljxOKtNSKGmMI=;
        b=i8h/zhRaoQmvnohaH4M4fYUeSgv8JR/jZ+YzMoQpFF2933YpDTmk96zAgsrStyRMxa
         iYqRS8e6t4HyI+wsNdhJin3nF5AQLOj0gXaHtoGO8eg9lVRZirGfDYEWf1ZmpIrjVqN1
         euSRA0vvY+0pDMccdSzQ13ZGaQVHEu0/NdazzBaMyCgvLldB0/MIwwK2SmnrsjR5durS
         N/lVjL2/sLAfc6BAKaktloEFg1MjDFYCpXAVCv1yz8c57ajiLxp61ZHPlyQvweSJ7BoE
         pV9wpbDVugN3b+utq6K3aquIuwKu7Xgs3/YSwK8oDKMRzwTL7h1/IRqHC20P/obK+6HN
         ldVg==
X-Gm-Message-State: ACrzQf0X9DdKbD0b/b2H1ayzSO2KmVhqCjfcU39E7Hp26qlKh61gsC28
        8NSj4EeSY92VT/ka0S29jOCB4CEOcdppx0qm
X-Google-Smtp-Source: AMsMyM6gqIWCG3vTlrW4YgHYo9wuugLZiy0KoowKh2MbcU1t+un3BouhWEM72DvnvW3vQf9yB/0rtA==
X-Received: by 2002:a05:651c:883:b0:26d:d4ce:befa with SMTP id d3-20020a05651c088300b0026dd4cebefamr8091211ljq.180.1666430256014;
        Sat, 22 Oct 2022 02:17:36 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id f28-20020a05651c03dc00b0026dced9840dsm3669537ljp.61.2022.10.22.02.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 02:17:35 -0700 (PDT)
Message-ID: <48e13203-2588-618b-4fde-3004b2472783@linaro.org>
Date:   Sat, 22 Oct 2022 12:17:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 1/9] dt-bindings: arm-smmu: Add missing Qualcomm SMMU
 compatibles
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
 <a36ca97e-5e64-54a8-a571-e9b7f6da76e5@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a36ca97e-5e64-54a8-a571-e9b7f6da76e5@linaro.org>
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

On 22/10/2022 03:59, Krzysztof Kozlowski wrote:
> On 21/10/2022 12:55, Dmitry Baryshkov wrote:
>> Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
>> platforms and for the Qualcomm v2 SMMU used on SDM630 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 9066e6df1ba1..34ee33a62ba5 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -28,6 +28,7 @@ properties:
>>             - enum:
>>                 - qcom,msm8996-smmu-v2
>>                 - qcom,msm8998-smmu-v2
>> +              - qcom,sdm630-smmu-v2
> 
> So qcom,adreno-smmu is not compatible with Adreno? See below.
> 
>>             - const: qcom,smmu-v2
>>   
>>         - description: Qcom SoCs implementing "arm,mmu-500"
>> @@ -48,10 +49,20 @@ properties:
>>                 - qcom,sm8350-smmu-500
>>                 - qcom,sm8450-smmu-500
>>             - const: arm,mmu-500
>> +
>> +      - description: Qcom Adreno GPUs implementing "arm,smmu-500"
>> +        items:
>> +          - enum:
>> +              - qcom,sc7280-smmu-500
>> +              - qcom,sm8250-smmu-500
>> +          - const: qcom,adreno-smmu
>> +          - const: arm,mmu-500
>>         - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>>           items:
>>             - enum:
>> +              - qcom,msm8996-smmu-v2
>>                 - qcom,sc7180-smmu-v2
>> +              - qcom,sdm630-smmu-v2
> 
> This does not look correct. The same compatible should not be present in
> two different setups.
> 
> If qcom,msm8996-smmu-v2 is compatible with qcom,adreno-smmu, then your
> first hunk is not correct.

Currently the qcom,adreno-smmu compat string is used as a flag, telling 
the kernel that this SMMU instance needs some special setup to work with 
Adreno GPU driver

For example, we have the following compat lists in the existing DT files:
- "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
- "qcom,msm8996-smmu-v2", "qcom,smmu-v2" // not handled by arm-qcom-smmu

- "qcom,sdm630-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
- "qcom,sdm630-smmu-v2", "qcom,smmu-v2"

- "qcom,sdm845-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
- "qcom,sdm845-smmu-500", "arm,mmu-500"
- "qcom,sdm845-smmu-v2", "qcom,smmu-v2" // special setup used on Cheza

- "qcom,sm8250-smmu-500", "qcom,adreno-smmu", "arm,mmu-500"
- "qcom,sm8250-smmu-500", "arm,mmu-500"


As we are trying to refactor the IOMMU bindings, what would be your 
recommendation?

To introduce minimal changes, I wanted to have the following lists:
- "qcom,SOC-smmu-500", "qcom,adreno-smmu", "qcom,smmu-500", "arm,mmu-500"

- "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500"

However maybe you would prefer the following model:

- "qcom,SOC-adreno-smmu-500", "qcom,adreno-smmu-500", "arm,mmu-500"
- "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500"


Or:
- "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500" + 
'qcom,adreno-smmu' flag/property?


> 
>>                 - qcom,sdm845-smmu-v2
>>             - const: qcom,adreno-smmu
>>             - const: qcom,smmu-v2
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

