Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D997743148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 01:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjF2X6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 19:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjF2X6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 19:58:17 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4382D52
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 16:58:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6985de215so20947441fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 16:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688083093; x=1690675093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueD+uH6+uolSqOb/KOmer89E0lbuYFQXR9mvlSuuqO4=;
        b=EZJ1yF3JTqqdMIP2Bl6er2+KH9NIdrA5bBXjC33uNQB2xxfAyAzSpdenCoJj5Z5IkF
         CVEnCgdL4qwujUBCYTea0RtlpvmSYPU5/6s6DikQRqsmWgzPxxYmc+vOSHxeac1iSEo9
         wO6UNnMDT+HgIrabYKRE4vD3QQ/8ewNZDMoIsUCB3R1wYJS7bZsgSvQwWqR6Kmz5sj1J
         T6dtjbQa3uQ5JNao5vqBjjITJ9691f9p4U0LnBISCP3QMiW1U83iutQDyfV1+pnuC/ha
         uasVS6KpQdlyEJAXZPMY7qGMKxu8gEmMw3G9oYSnx+qHTcB5K4Dl62aQEeg4AVx66hKw
         JwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688083093; x=1690675093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueD+uH6+uolSqOb/KOmer89E0lbuYFQXR9mvlSuuqO4=;
        b=YGX6820+yVQtEYYQM5J05lYEyuUvko9mLzap7PjY8ivCns4UPqoepU8nrxz/CjWAO7
         l95szhpM6u0mg3L1G9MVvk0QftQklvMyhhLSL+NDoNiMueH0YBoykp4j3RO2PsUlvo2k
         ffRx7Z9BvKnGogx57ZI/AXYHUAoX0iWGzgPQlRAM89qHi/vSJIpc4VR4kXhbodJIQBV/
         +Fl48pVMJsr4RFVfaxcwFQ1FcSS+Z5d7RzSeGRixIEbR0S84x0blZ7Uwd7GOQn7Cvfla
         Z2Qv3cxNBlm1IWiOg3tNnTsL/Spjy6qFlufGCW5wlwBuSPnJcK5WeOMSTOZqTpH0KxKX
         yNRA==
X-Gm-Message-State: ABy/qLY47GwzyOMnXhKoxZdiiAxuTdXa666KIDjGCmUOaHIwmMJtrbI/
        kU0kAxu0xOTTQe/DyLJBgQXssw==
X-Google-Smtp-Source: APBJJlEU7owUCp3Ouj0l00PmFkoHYwQVcVoX+ns3jwEmm+267n22cDF2Cf9DhR6TPZdSpXcFMJ272A==
X-Received: by 2002:a05:6512:2216:b0:4fb:97e8:ed8c with SMTP id h22-20020a056512221600b004fb97e8ed8cmr1201823lfu.4.1688083092898;
        Thu, 29 Jun 2023 16:58:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t24-20020ac243b8000000b004f625831d85sm2508524lfl.126.2023.06.29.16.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 16:58:12 -0700 (PDT)
Message-ID: <7f4a4264-c0d3-312a-3e1b-93d9dd768d7e@linaro.org>
Date:   Fri, 30 Jun 2023 02:58:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/7] dt-bindings: soc: qcom: Add qcom-pbs bindings
Content-Language: en-GB
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        Rob Herring <robh@kernel.org>
Cc:     pavel@ucw.cz, lee@kernel.org, thierry.reding@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        u.kleine-koenig@pengutronix.de, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20230621185949.2068-1-quic_amelende@quicinc.com>
 <20230621185949.2068-2-quic_amelende@quicinc.com>
 <20230626135857.GA3118929-robh@kernel.org>
 <2e871e21-a81d-0d7d-993b-9a9d7bd9d962@quicinc.com>
 <f274247c-f45b-8a48-92f2-cff4597aff15@linaro.org>
 <fa12dd5d-af9d-235d-a6c7-3dcf690dcd67@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <fa12dd5d-af9d-235d-a6c7-3dcf690dcd67@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2023 00:53, Anjelique Melendez wrote:
> 
> 
> On 6/29/2023 1:45 AM, Dmitry Baryshkov wrote:
>> On 29/06/2023 04:19, Anjelique Melendez wrote:
>>>
>>>
>>> On 6/26/2023 6:58 AM, Rob Herring wrote:
>>>> On Wed, Jun 21, 2023 at 11:59:45AM -0700, Anjelique Melendez wrote:
>>>>> Add binding for the Qualcomm Programmable Boot Sequencer device.
>>>>>
>>>>> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
>>>>> ---
>>>>>    .../bindings/soc/qcom/qcom-pbs.yaml           | 41 +++++++++++++++++++
>>>>>    1 file changed, 41 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..0a89c334f95c
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml
>>>>> @@ -0,0 +1,41 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/soc/qcom/qcom-pbs.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm Technologies, Inc. PBS
>>>>> +
>>>>> +maintainers:
>>>>> +  - Anjelique Melendez <quic_amelende@quicinc.com>
>>>>> +
>>>>> +description: |
>>>>> +  Qualcomm PBS (programmable boot sequencer) supports triggering sequences
>>>>> +  for clients upon request.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,pbs
>>>>> +
>>>>> +  reg:
>>>>> +    description: |
>>>>> +      Base address of the PBS peripheral.
>>>>> +    maxItems: 1
>>>>> +
>>>>> +required:
>>>>> + - compatible
>>>>> + - reg
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    pmic {
>>>>> +      #address-cells = <1>;
>>>>> +      #size-cells = <0>;
>>>>> +
>>>>> +      qcom,pbs@7400 {
>>>>> +        compatible = "qcom,pbs";
>>>>> +        reg = <0x7400>;
>>>>> +      };
>>>>
>>>> Why do you need a child node for this? Is there more than 1 instance in
>>>> a PMIC? Every sub-function of a PMIC doesn't have to have a DT node.
>>>>
>>>
>>> We currently have another downstream driver (which is planned to get upstreamed)
>>> which also needs a handle to a pbs device in order to properly trigger events.
>>
>> Does it have to be a separate driver? Or is it a part of the LPG driver, just being artificially split away?
> 
> Sure, I just discussed with team and we are ok with removing this as a separate driver. Will have that
> for next version.

I saw that the PBS can also be used with the haptics device. Will it 
talk to the LPG driver?

>>
>>>
>>>> Rob
>>>
>>>
>>>
>>

-- 
With best wishes
Dmitry

