Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6A1619648
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 13:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbiKDMer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 08:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbiKDMeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 08:34:46 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0006D1583F
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 05:34:44 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id k19so6161037lji.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96Qe0EgZnFzMToe21cig+Frohj+QHzH0enkDQVaaBhI=;
        b=LhseJqBJRPVntuYrym1bTc9JixQrNmzt8OF+3PGS9TmO6XH5sR8DSHve9hHqKaMVOc
         1tmWuGrOOU15Jre/gVjP0uIBcfvgPL1hYAy+D8/G1WX0gBDiccUxNRyPZVCRgSPYS8T8
         TUhryAp0R+YiQg78uccqH92+npDlWQ9r740w/f4avVNVnsjYd8U+b/9fAjW0VyTPKSAP
         tlMeDmV51pGdXXw4j7dAw8Co6knOpoOmb+ZAzr1j2rkcQ/6OihTdmVEPwV1KdnXW5BOp
         lNcX8jAJq0Dph3zHHFlH4FkTUrTpYIfkiDgrzwSDC3t3AG4S/oZRU6PEnfYFIX2BWMLW
         VOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96Qe0EgZnFzMToe21cig+Frohj+QHzH0enkDQVaaBhI=;
        b=bRLBY8ZnNvCmUoYMr4WcUxUfcEXbUjNSIfKheNBAwM8TtP2Esm9iY43+trN+2dmRTj
         O5pfd9YJ0F/pWogWyEfeyX3sAgHITmVEIntsb5Cm5GNxFg7TPjY8xjYoH0pVYbhHL3xT
         fIVV/DWegZdZ8ZIXO0MYa9V1P9LEpiF2PyapMz73H9Pw5vxDTHt4kPw3+BoO1ecK/YJE
         4/oqef6pwxeTSIE+5Z+0wRl0ut2TSL/sfo8LCF/ukSUJI/cfhwGJpged44fPHVTGpamh
         DRecR4t0OmzQF217Er1/B2KnH53oHaiCWHSgZ93guE5Qok2x+wPQYFOMKnOx1Hw1pS23
         HWGw==
X-Gm-Message-State: ACrzQf1v1+xDfTWKlimXOa5m8n1Bawi64nT1cvxeuVq5qJGz4dy3/xw6
        AUtBeOhnBLkFCv5fDt9NM9Ugeg==
X-Google-Smtp-Source: AMsMyM6MOXvhfxrdstMXZvXUNNyG1mwUpWZeLi4PFzx4r1hzyrZkedQrNHKYkyTJcZ+2Fqv0jeg2wQ==
X-Received: by 2002:a2e:a786:0:b0:277:5302:905 with SMTP id c6-20020a2ea786000000b0027753020905mr10401454ljf.499.1667565283251;
        Fri, 04 Nov 2022 05:34:43 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id p21-20020a19f015000000b0049476667228sm455089lfc.65.2022.11.04.05.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 05:34:42 -0700 (PDT)
Message-ID: <ee0880ad-0513-ffea-d80a-9eaac3a85c90@linaro.org>
Date:   Fri, 4 Nov 2022 15:34:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
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
Content-Language: en-GB
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
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>> new file mode 100644
>> index 000000000000..b8c508c50bc5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>> @@ -0,0 +1,132 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-dpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM8450 Display DPU
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +
>> +$ref: /schemas/display/msm/dpu-common.yaml#
> 
> There is no such file and I could not fine any dependency mentioned in
> cover letter. I guess you miss link to your refactor series?

Excuse me, yes. However the refactoring should be already a part of 
linux-next, so I didn't think that I should especially point to it.

> This also means bot won't be able to test it...

How does bot detects the base commit? Should i use --base? Or does it 
work on top of linux-next?

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8450-dpu
>> +
>> +  reg:
>> +    items:
>> +      - description: Address offset and size for mdp register set
>> +      - description: Address offset and size for vbif register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mdp
>> +      - const: vbif
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display hf axi clock
>> +      - description: Display sf axi clock
>> +      - description: Display ahb clock
>> +      - description: Display lut clock
>> +      - description: Display core clock
>> +      - description: Display vsync clock
> 
> Drop "clock", less typing.

Ack

> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bus
>> +      - const: nrt_bus
>> +      - const: iface
>> +      - const: lut
>> +      - const: core
>> +      - const: vsync
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,sm8450.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    display-controller@ae01000 {
>> +        compatible = "qcom,sm8450-dpu";
>> +        reg = <0x0ae01000 0x8f000>,
>> +              <0x0aeb0000 0x2008>;
>> +        reg-names = "mdp", "vbif";
>> +
>> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                <&gcc GCC_DISP_SF_AXI_CLK>,
>> +                <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +        clock-names = "bus",
>> +                      "nrt_bus",
>> +                      "iface",
>> +                      "lut",
>> +                      "core",
>> +                      "vsync";
>> +
>> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +        assigned-clock-rates = <19200000>;
>> +
>> +        operating-points-v2 = <&mdp_opp_table>;
>> +        power-domains = <&rpmhpd SM8450_MMCX>;
>> +
>> +        interrupt-parent = <&mdss>;
>> +        interrupts = <0>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dpu_intf1_out: endpoint {
>> +                    remote-endpoint = <&dsi0_in>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                dpu_intf2_out: endpoint {
>> +                    remote-endpoint = <&dsi1_in>;
>> +                };
>> +            };
>> +        };
>> +
>> +        mdp_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-172000000{
>> +                opp-hz = /bits/ 64 <172000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs_d1>;
>> +            };
>> +
>> +            opp-200000000 {
>> +                opp-hz = /bits/ 64 <200000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-325000000 {
>> +                opp-hz = /bits/ 64 <325000000>;
>> +                required-opps = <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-375000000 {
>> +                opp-hz = /bits/ 64 <375000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-500000000 {
>> +                opp-hz = /bits/ 64 <500000000>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>> new file mode 100644
>> index 000000000000..05c606e6ada3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>> @@ -0,0 +1,349 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM8450 Display MDSS
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +
>> +description:
>> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> 
> Drop "Device tree bindings for" and rewrite the sentence (e.g. drop "that").
> 
>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> +  bindings of MDSS are mentioned for SM8450 target.
> 
> Drop last sentence.
> 
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> Drop items.
> 
>> +      - const: qcom,sm8450-mdss
> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB clock from gcc
>> +      - description: Display hf axi clock
>> +      - description: Display sf axi clock
>> +      - description: Display core clock
> 
> Drop trailing "clocks" (the first "AHB clock" is ok)

Hmm, not sure that I understand the difference, but fine with me.

> 
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

Ack

> 
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,sm8450-dpu
>> +
>> +  "^dsi@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,mdss-dsi-ctrl
>> +
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,dsi-phy-5nm-8450
>> +
>> +unevaluatedProperties: false
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

