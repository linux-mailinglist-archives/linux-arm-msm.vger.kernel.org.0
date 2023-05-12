Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCF9701010
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 23:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238616AbjELVGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 17:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237769AbjELVGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 17:06:37 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7405F3596
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:06:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f00d41df22so55415168e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683925595; x=1686517595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EsiWgLFZscJzjm/g92UOpjZeba02UZH+himRJmD+dtQ=;
        b=n7IF88ZdZYqRZGDuqB/Dv/16wx9vbg/x6e6+WHnd+UnbMzZqXokFm4Zq4gQP1BbKnN
         tNLJwgsQfXJS6GMaLTz0LhuaVvVZCSlr8kSJXGdZ8vnh8u+/g2XgwzFX+lqHFgyHn+QZ
         Rt2CtSAwpZtGyeFxSXT0dpr72NRG/FXJ4mpk7iYevcaub0dspdK5RE+yZY6xSC0Pp/SB
         B3U5gGJCnXn8knfNef6eKHQ7y89OGuYPouv63+OGgG4EuBIx3+88ekszxw9oNwQ0CBIC
         O3HWeP5vLiM7afGd+dPZzyXZoRa8t5+MJ4CtOqGoZ8ycbTOnYIF89rGIr2kn0SUoSSpy
         72xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683925595; x=1686517595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsiWgLFZscJzjm/g92UOpjZeba02UZH+himRJmD+dtQ=;
        b=ReGB+ICzDYH6213Sdg3U7rE3Z560DyER1YeL6IxjN9wcGEFVNKCtKdHoPHMAJL1Nu0
         AYdF618KJcDd9fiRqCxxeeHFlt1kUFRgKaQ4RFgbE9r6Brj0qhPk9axmOcm+mIbMGE6P
         9spxlaAuvH0IgVsHLAebaVTmcg3yyXR3DanUCYem9Pg5qpWOJWrs+Jvr7GIAt/sd7SlH
         ZBRe/5EH/yJXCcnC5t+mo7W0e0Rv5BKK2SQF/U+LzVjKxbO9j5NJiQOm7EFZLpZpYQid
         Tt9FFkG7Z2Y1/OwqZIfBOWIgKA5fiHJizVceZmo2kYd757mg9ovXkQWB6deiRJeYnOV4
         ROhw==
X-Gm-Message-State: AC+VfDynjCusmmFZ5vlaAX3o03/vcAgYzoR8G0pHnu3PZARBv51zqeUY
        yItq1HEKxbcfmHegL5RrPwuMq5NSfcjmHPGoJIl/Ew==
X-Google-Smtp-Source: ACHHUZ4CwKOHCsRb0bfIwwJbnr+PWrGViaDjdBuMWsTm/HnJwmySw0sQnF4fsrwMPM5AfAloglKfUg==
X-Received: by 2002:a2e:a377:0:b0:2ac:826a:efae with SMTP id i23-20020a2ea377000000b002ac826aefaemr4628424ljn.5.1683925594723;
        Fri, 12 May 2023 14:06:34 -0700 (PDT)
Received: from [192.168.2.40] ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id g9-20020a2eb0c9000000b002ac8164d77fsm2895728ljl.86.2023.05.12.14.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 14:06:34 -0700 (PDT)
Message-ID: <1351c7b9-ab70-f6ec-3d0e-2b56af42c5c8@linaro.org>
Date:   Sat, 13 May 2023 00:06:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: provide separate bindings
 for qcom,gcc-mdm9615
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
 <20230512003230.3043284-4-dmitry.baryshkov@linaro.org>
 <d3daccb6-8b4e-7016-5545-097dba2188b2@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d3daccb6-8b4e-7016-5545-097dba2188b2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 09:52, Krzysztof Kozlowski wrote:
> On 12/05/2023 02:32, Dmitry Baryshkov wrote:
>> The global clock controller on MDM9615 uses external CXO and PLL7
>> clocks. Split the qcom,gcc-mdm9615 to the separate schema file.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,gcc-mdm9615.yaml      | 48 +++++++++++++++++++
>>   .../bindings/clock/qcom,gcc-other.yaml        |  3 --
>>   2 files changed, 48 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
>> new file mode 100644
>> index 000000000000..bc9786f2c1d5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9615.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on MDM9615
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
>> +  - Taniya Das <quic_tdas@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on MDM9615.
>> +
>> +  See also::
>> +    include/dt-bindings/clock/qcom,gcc-mdm9615.h
>> +    include/dt-bindings/reset/qcom,gcc-mdm9615.h
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,gcc-mdm9615
>> +
>> +  clocks:
>> +    maxItems: 2
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Indeed. I did this when preparing v1 and then skipped it when sending 
v2. Mea culpa.

-- 
With best wishes
Dmitry

