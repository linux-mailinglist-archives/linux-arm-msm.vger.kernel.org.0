Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C84617ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 15:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbiKCOEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 10:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiKCODj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 10:03:39 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3622F582
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 07:03:37 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id n18so1141276qvt.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHAYd9v806CHYxGjbJi/tWpPyfof1VR6bfZw5V0SGN8=;
        b=djX1EUWpsYPLPOQttoRQjnZ4MwqP3I9oeB9pKHR8NmUrEO0cbwvxdWgdM9cZcIzp0u
         ROebyE5PWFXfoDCLcJwpg2sGBPiQKG86orzMmzyCQ6M+W9dbs9ePmql5L+8QrQBMpBII
         wU5xDgXfxpPtYLooaSMe8qAvvCsg+EgkwI/UxGhqjPea/Q6z0b4zJ2/x2ezyjmFcw9zG
         91+0+FTCLTbpffKBm9yhKNLFj9oW27m7lTS9i6O2VqSiCXgaRQ1vfpjh+/jy0DyLcnw7
         fvDnp8Vr3/G4S5tNsDn8scO5/J9bpcGPlXggs2/RHwuKOqpfwC0m9wx8R/FB9dmXW2GI
         2m2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHAYd9v806CHYxGjbJi/tWpPyfof1VR6bfZw5V0SGN8=;
        b=e4RwnsFLwHp52jcV6ry5vhdUKNiVXg1Hw4kPsNVjXSEIQ/5p//zK0gTZAgjor7rI2d
         qj5S+kM4IWMuj3BIQO9m6LMTNymyHNvL6n3pgJaOO3lz4BS8IXK6Lz6vroRL3HlaWoAX
         g+fI6iBhUvj7Ln6zVyUq3gJNHFbYfztJtzxyveUqOxBIUY2iR0axMFUis1B8Ml7hMVMb
         W9AT1igxvQf4rTF3nY23pDiZolmpebHdyZVRkIk3kmdaz76NhzuXBg4EdNFL7qoeDe/i
         0OxcuYLdo9tsEGfWegQfGuv9f3Ufbid312lxC/QGTH4Xxl4YhIUr/9KF2ZiB20tVwM6p
         Rrlw==
X-Gm-Message-State: ACrzQf2b0jZBou5BnUsaQV1gzoMLvFMK884W5iqq/sEHEP47pRODBxi7
        sKgwuQFkzUsqGKR5R1NY/u1fPA==
X-Google-Smtp-Source: AMsMyM52xpyvoyN9D6luNsPa1lr9VyMio+bUKMfR5s6jFKIXz6gt9D3Uhqks8mwAhi7q94kMRG3ofg==
X-Received: by 2002:a05:6214:2b0b:b0:4bc:27a3:f43f with SMTP id jx11-20020a0562142b0b00b004bc27a3f43fmr6937438qvb.8.1667484216984;
        Thu, 03 Nov 2022 07:03:36 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id bl12-20020a05620a1a8c00b006ed61f18651sm839183qkb.16.2022.11.03.07.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 07:03:35 -0700 (PDT)
Message-ID: <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
Date:   Thu, 3 Nov 2022 10:03:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/11/2022 19:13, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>  .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>  2 files changed, 481 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
> new file mode 100644
> index 000000000000..b8c508c50bc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8450 Display DPU
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#

There is no such file and I could not fine any dependency mentioned in
cover letter. I guess you miss link to your refactor series?

This also means bot won't be able to test it...

> +
> +properties:
> +  compatible:
> +    const: qcom,sm8450-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display ahb clock
> +      - description: Display lut clock
> +      - description: Display core clock
> +      - description: Display vsync clock

Drop "clock", less typing.

> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: nrt_bus
> +      - const: iface
> +      - const: lut
> +      - const: core
> +      - const: vsync
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8450.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,sm8450-dpu";
> +        reg = <0x0ae01000 0x8f000>,
> +              <0x0aeb0000 0x2008>;
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                <&gcc GCC_DISP_SF_AXI_CLK>,
> +                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        clock-names = "bus",
> +                      "nrt_bus",
> +                      "iface",
> +                      "lut",
> +                      "core",
> +                      "vsync";
> +
> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        assigned-clock-rates = <19200000>;
> +
> +        operating-points-v2 = <&mdp_opp_table>;
> +        power-domains = <&rpmhpd SM8450_MMCX>;
> +
> +        interrupt-parent = <&mdss>;
> +        interrupts = <0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dpu_intf1_out: endpoint {
> +                    remote-endpoint = <&dsi0_in>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dpu_intf2_out: endpoint {
> +                    remote-endpoint = <&dsi1_in>;
> +                };
> +            };
> +        };
> +
> +        mdp_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-172000000{
> +                opp-hz = /bits/ 64 <172000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz = /bits/ 64 <200000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-325000000 {
> +                opp-hz = /bits/ 64 <325000000>;
> +                required-opps = <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-375000000 {
> +                opp-hz = /bits/ 64 <375000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-500000000 {
> +                opp-hz = /bits/ 64 <500000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> new file mode 100644
> index 000000000000..05c606e6ada3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> @@ -0,0 +1,349 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8450 Display MDSS
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates

Drop "Device tree bindings for" and rewrite the sentence (e.g. drop "that").

> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SM8450 target.

Drop last sentence.

> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:

Drop items.

> +      - const: qcom,sm8450-mdss

> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock

Drop trailing "clocks" (the first "AHB clock" is ok)

> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: nrt_bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2

You need specific names here.

> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm8450-dpu
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdss-dsi-ctrl
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,dsi-phy-5nm-8450
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

