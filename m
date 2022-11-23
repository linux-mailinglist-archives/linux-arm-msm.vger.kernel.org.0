Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5CE635A8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236167AbiKWKwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237318AbiKWKvu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:51:50 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7178710071
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:38:28 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id l8so20869754ljh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=seTGGYFc6lGg3lbS4N83LE8Bp6OtFcacLrP8CTGacMo=;
        b=YRPv1aLHrpgKQyrWWKzzTrcXxqQfxYuqxsSGd7uEuq981X7hksZLz+TdvyLWfdn03b
         6tjf/0pxtl1DkIn+/I4f3EOVM3m0BqaTnD4az6qT0cdntEcAdK7LlUw2zJIgNvNBwdRj
         K3LPnJQIhvo/IEvR5kEs1mCeh6qrckKtXskuE4x8s5VoFfsCf1H2QzEw2BlgMTgrOS5s
         xz0OTdERJOvpVGfS7LBXdqImjfZ7YDC6FyBTZiiB7mnIjyTSwZjEMxWbTs1fPAi7lNAW
         2vJPP6rntVFftTJdo2BlYNIJxSxLohBEWkdkpMYYe4rwVABXIAU+FuA14/6A68qcsTU9
         hIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seTGGYFc6lGg3lbS4N83LE8Bp6OtFcacLrP8CTGacMo=;
        b=Sq6m2kNn6eWXFYhrD1fK0OczWDUFamhAXOyakXoNVO74BMS0XP/AmNGqeuUxxguSnM
         DHKv6oGHnx2mSN/maKffEHmV+OybzovXgXsBsEpVN6IY+96pRVEVN5dA68XnKvNEiKM2
         yvaxvqaI+TCJ1vHJLb5WxNazLPCsDqD1ucwX6f7to0V+3fPWaj4MP3HS9kreZ8oEEylJ
         ABsvqaLEEke4+25X9ruMBaeKi12uIkra660oL5cb4v6YrsyyrBK1QfWSzE+UNOruT4S4
         57gfOTQeLJAUh6qj/0Jhlfafs5+7aa6VNGcN5EJ5dfas/Dj4cbawAHNq9+R2I+56tluB
         NHsw==
X-Gm-Message-State: ANoB5pnc0uOA1Wzs9F9cpJWpdD9jfPRCVIzo0naILRHNAmFR0cOWZnfz
        YTwqUdlf8PvyChGe7Pd6fsyJRzjJZYA8/w==
X-Google-Smtp-Source: AA0mqf4uRdVYTYJT9FcrmT33/8lfD0TV26DGvjJ+0jndv4ZddyX2v3XPAYCmZFruP3JnzGP+yTAgKw==
X-Received: by 2002:a2e:9d50:0:b0:26f:db16:4735 with SMTP id y16-20020a2e9d50000000b0026fdb164735mr9017224ljj.323.1669199906750;
        Wed, 23 Nov 2022 02:38:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a302:5f12::1? (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id bt26-20020a056512261a00b004ab2cb8deb5sm2834451lfb.18.2022.11.23.02.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:38:26 -0800 (PST)
Message-ID: <fc3bec1d-8e07-d890-c84c-39b7cec8769d@linaro.org>
Date:   Wed, 23 Nov 2022 12:38:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 05/11] dt-bindings: display/msm: add support for the
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
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-6-dmitry.baryshkov@linaro.org>
 <1d32c6d0-c6dc-cd24-ba52-ecb597553ef9@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1d32c6d0-c6dc-cd24-ba52-ecb597553ef9@linaro.org>
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

On 23/11/2022 12:32, Krzysztof Kozlowski wrote:
> On 23/11/2022 00:12, Dmitry Baryshkov wrote:
>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>> SM8450 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,sm8450-dpu.yaml | 139 +++++++
>>   .../display/msm/qcom,sm8450-mdss.yaml         | 352 ++++++++++++++++++
>>   2 files changed, 491 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>
> 
> 
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>> new file mode 100644
>> index 000000000000..8e25d456e5e9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>> @@ -0,0 +1,139 @@
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
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
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
>> index 000000000000..73f8c5caf637
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>> @@ -0,0 +1,352 @@
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
>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> +  bindings of MDSS are mentioned for SM8450 target.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> I don't understand this patchset. Some tags were present, then gone.
> Items was never here, now it is... and you explicitly received such
> feedback long time ago, therefore I suspect you sent or rebased
> something old.
> 
> Go through all previous comments.

Let me check, what went wrong on my side.

> 
>> +      - const: qcom,sm8450-mdss
>> +
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

