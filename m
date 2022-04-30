Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B593A51608F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 22:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245137AbiD3U6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 16:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245124AbiD3U6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 16:58:11 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938C1532D8
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 13:54:48 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q14so14277239ljc.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=ASoi6SXJEgdX0v1CZG7BViYCx8LRpIxKBcrDWBw+eZc=;
        b=k+cxk+OOpZiWbVyZY5zt5qC9Cqvm49Tu5Fj1LYPqapg3l5MqaTjMkU9eUhna5LEuds
         /eO99QqEGIWhOYTwZHukC58mO74dIJthIJ7gbS0nN4+62xBL7drxJjZHrRIkvNHkpxAr
         dXbtjS9PTWps91KK9NItnZapYFMXDmotdZ8qxoMPF9cb/dmlF0X2nlAQCtjrFbtv1iU7
         9Hg1o1Ai/96Jw9O9vPaR1Tg8rUFP5HTvTftFewCSX9Eer2JSwSVcDU/LyREI744+Aybu
         H7zlsvDotJcOVgqLaI2BmbOAazR9It++Xiq/IWF5ZGF7yNCdX3MbcJKU402vjxnjEAfV
         7EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=ASoi6SXJEgdX0v1CZG7BViYCx8LRpIxKBcrDWBw+eZc=;
        b=hscIz3gHjiY+W+YBreUb6G58RDBJ4Loah4bDnNB4CN2ALdVTw7nq2bvaFpDGVktmoO
         2TE615CcFcErGtJ83IyUBvYQKyxTb0NIFDBOgBlTUeYNlHfWBW9G5LPm3IiQwLy8t/l+
         apjbXtNk9McVdwEay7V9z7oN3f37dkL0WyUKHMDrPEty+5sXiKDw2qPzWQitJCK9UKHH
         VjIAn0/59dh+yXJDDu9czpgYIuSvWZTysxR27QoN82CsL4eDV/B11MUy+sdpbxgP3oaK
         nFGzildwsASJXFgnzkSWV9vo0D+eJxB2ldnQnmJcF6AW/VAr1TijgMa2LMy9wGxMhGV/
         QmBw==
X-Gm-Message-State: AOAM532WvCK7MdE+otflUrsNUdZEPJfL1++Jk1JIPSyRHY2NV0sP2O8O
        gUAwHJsYPF30GVUGQkctHrz2cw==
X-Google-Smtp-Source: ABdhPJwZuL/Pku9i0MT3xIj+aDGj1nGfmYNXoIlZqWPWElWD3DaCRKyYA5HMVMPMH/kOvoMOwl18IA==
X-Received: by 2002:a05:651c:1699:b0:24f:1529:38d0 with SMTP id bd25-20020a05651c169900b0024f152938d0mr3530975ljb.397.1651352086936;
        Sat, 30 Apr 2022 13:54:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y20-20020ac24214000000b0047255d21168sm271526lfh.151.2022.04.30.13.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 13:54:46 -0700 (PDT)
Message-ID: <384e2336-e6a3-28d6-4572-1534d418206b@linaro.org>
Date:   Sat, 30 Apr 2022 23:54:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Add binding for MSM8996
 DPU
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220430161529.605843-1-konrad.dybcio@somainline.org>
 <7e066b7f-943a-6a5e-7383-a05794d207dc@linaro.org>
In-Reply-To: <7e066b7f-943a-6a5e-7383-a05794d207dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/04/2022 22:33, Dmitry Baryshkov wrote:
> On 30/04/2022 19:15, Konrad Dybcio wrote:
>> Add yaml binding for MSM8996 DPU.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>>   .../bindings/display/msm/dpu-msm8996.yaml     | 221 ++++++++++++++++++
>>   1 file changed, 221 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml
>> new file mode 100644
>> index 000000000000..10b02423224d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml
>> @@ -0,0 +1,221 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-msm8996.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DPU dt properties for MSM8996 target
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>> +
>> +description: |
>> +  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that
>> +  encapsulates sub-blocks like DPU display controller, DSI 
>> interfaces, etc.
>> +  Device tree bindings of MDSS and DPU are mentioned for MSM8996 target.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,msm8996-mdss
> 
> With the unified MDSS driver there is no need to describe a separate 
> mdss bindings. Let's skip this part for now.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: mdss
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB clock
>> +      - description: Display core clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: core
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#address-cells": true
>> +
>> +  "#size-cells": true
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +
>> +  iommus:
>> +    items:
>> +      - description: Phandle to mdp_smmu node with SID mask for 
>> Hard-Fail port0
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    description: Node containing the properties of DPU.
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,msm8996-dpu
> 
> Okay. So, this is the most interesting part. Unlike MSM8998, which is 
> supported in the mdp5 driver, but was not used in the upstream DTS 
> files, for the MSM8996 the MDP5 part is described, used and widely 
> tested. And, unfortunately, the bindings use solely the generic 
> "qcom,mdp5" compat.
> 
> I would suggest the following plan:
> - Define a binding using both "qcom,msm8996-dpu" and "qcom,mdp5" 
> strings. Make sure that it is fully backwards-compatible with older dts.
> 
> - Update msm8996.dtsi to follow new binding.
> 
> - Let's have a Kconfig flip switch selecting which driver to be used for 
> 8996/8998.

Rob suggested a modparam here.


-- 
With best wishes
Dmitry
