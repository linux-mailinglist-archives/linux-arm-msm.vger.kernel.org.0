Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201B861966A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 13:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiKDMp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 08:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiKDMp2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 08:45:28 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C72248CD
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 05:45:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r12so7292841lfp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 05:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvboXhj8KjyqdPoeiCN2lb+BeTNUFPqnKJjE5L7Rgjw=;
        b=Ky42DZM27vCCbaHpCg7ZLJUC8lDtMRRqC/uSYDVINXUXFBVFEGtPQ4kqpXm7c2uhfv
         iq1Ohcn/p2LToIti84k3NebbF2pvxD5eeso6ZsGMrKspA1D8O+ZxtN1N4dbuHU1Da6kL
         pKRpfAtw8NoSYpyWENMzeUoHj6fI3SLGLj72W2YMIbdSeGcyZgF+ojDhlPj3UdkOHWSj
         v+PD30SOyhTlE3yNzYngKbBZ1hysbIQWV9+iP0dwKick3lo26e1PGDybZZnGzLoMQz3Y
         AEEYuSY9r+HZvJgrNRInHmeI652IBuQMtY0h7LbVAgeYRrmonY13x3d/Eq4ZNLDiZJoD
         oIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvboXhj8KjyqdPoeiCN2lb+BeTNUFPqnKJjE5L7Rgjw=;
        b=KF63XPR0WR+759gXCA7M41jwPOVQxiGNghvXPcrhmf6pSs47Tg7Ib4fHonc4vj2Eyg
         XOD2xDTEKJa1hyS73HotS3yYX8wdhUKc8X1JiQRp5HHVYRWI+7qPmws7iuJMwlXAlJqc
         eA2+2IxOwuw4cUx6tZbrU5PLEEtgIZtJQQeu77C5fLbW6VJbe6VtTMoq0Z9m2jfqqre5
         tBonOG/K+9FBHZCakAZBCxUumUPtOKnvEj0TJRcjBax8GXln1woTKLrd2ql6ErZZB6AN
         lWL2R1BeQ73m8n+f8/ZdnR5X+ugW/ACyPReNq2eSHp/+789VSAQGqBYq8piiTaTVs8BF
         2RBQ==
X-Gm-Message-State: ACrzQf2AsEIfYDiho73XHozUwPYd4/jvU5tBAfaOFsj8JiHRmOTEiC81
        t3AixPAjN/LY1Fr2da3o2oIg+Q==
X-Google-Smtp-Source: AMsMyM7hDTo71AcIhzG+IOWZbRcDh4kdE15oJZfFru4jRAk0CN+cc1oyqnCgMyTu8fcg5aLQv8kpgw==
X-Received: by 2002:a19:6a05:0:b0:4b0:291b:9487 with SMTP id u5-20020a196a05000000b004b0291b9487mr12680096lfu.623.1667565924980;
        Fri, 04 Nov 2022 05:45:24 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id x23-20020ac24897000000b0048aee825e2esm445984lfc.282.2022.11.04.05.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 05:45:24 -0700 (PDT)
Message-ID: <ec774d8b-b6b1-8dca-ec14-8e39e0a4f0f4@linaro.org>
Date:   Fri, 4 Nov 2022 15:45:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
 <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/11/2022 17:03, Krzysztof Kozlowski wrote:
> On 02/11/2022 19:13, Dmitry Baryshkov wrote:
>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>> SM8450 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>>   .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>>   2 files changed, 481 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>

[skipped]

>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:

[skipped]

>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: nrt_bus
>> +      - const: core
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    maxItems: 2
> 
> You need specific names here.
> 

The names are described in mdss-common.yaml


-- 
With best wishes
Dmitry

