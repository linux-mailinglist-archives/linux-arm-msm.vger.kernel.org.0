Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B0B5B0DE7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiIGUQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiIGUQt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:16:49 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA27883CD;
        Wed,  7 Sep 2022 13:16:48 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id t8-20020a9d5908000000b0063b41908168so11007526oth.8;
        Wed, 07 Sep 2022 13:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=enY4tvnb4NWmG+6LhXqvkCPl75t+GMfAhei7Lrc9BIA=;
        b=JY3Z4UxY2ZHGe3GLYNL7JTA0417I3iRmXFKAJ0XAi6c6ru4jDJfqIub5kM2QJZbyjD
         cZayb0WeSAWKto7u352b2/AjNbMrgm87/Jj60bN5GsvTfSch4br/dg1pNyJypYC0m+t8
         tyhn3OeI317ZgMNO5azkxiuCTC5mdZkqnSV2axFRYpH/H1PKkkv40IUFjmyLkIlTqWxh
         EmvcOQyPPFjCM+7SBGelp6OEdvMlhxeun/65FVbea+pI58uwD4Q7P+CDLVzscRnD4Wfj
         tdCQ9Q1ojDdbw+CtLsIy4E6vHHRUDgNe37BUxSp6rQeGylqdtKuOFrtsHy5ddKnVwwot
         2kLg==
X-Gm-Message-State: ACgBeo2tVVXj0P8TrBue2RfLG6LxyHFu2wwZCKIsmno2m7ZM8BOgy2Nj
        EQ+CvcFDtsg0Q97JGBjM/A==
X-Google-Smtp-Source: AA6agR6U7ArPByNqZmFMVwzNxkHK6UYi7zEi0MXlhoTyPURoRWU6GzZpa7Cz6NJrzd1b/VQJlnQeLg==
X-Received: by 2002:a9d:4814:0:b0:639:2e6c:d86e with SMTP id c20-20020a9d4814000000b006392e6cd86emr2220717otf.320.1662581807914;
        Wed, 07 Sep 2022 13:16:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w9-20020a056830280900b00638a1c49383sm7397726otu.78.2022.09.07.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:16:47 -0700 (PDT)
Received: (nullmailer pid 198119 invoked by uid 1000);
        Wed, 07 Sep 2022 20:16:46 -0000
Date:   Wed, 7 Sep 2022 15:16:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v6 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
Message-ID: <20220907201646.GA119130-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 01:23:06PM +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sc7180 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 185 ++++++------------
>  .../bindings/display/msm/mdss-sc7180.yaml     |  85 ++++++++
>  2 files changed, 146 insertions(+), 124 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> index 47e74f78e939..0ed64fe065c2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -9,81 +9,43 @@ title: Qualcomm Display DPU dt properties for SC7180 target
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -description: |
> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> -  bindings of MDSS and DPU are mentioned for SC7180 target.
> +description: Device tree bindings for the SC7180 DPU display controller.

I assume this doesn't say anything more than the title, so just drop it.

>  
>  allOf:
> -  - $ref: /schemas/display/msm/mdss-common.yaml#
> +  - $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sc7180-mdss
> +      - const: qcom,sc7180-dpu
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
>  
>    clocks:
>      items:
> -      - description: Display AHB clock from gcc
> -      - description: Display AHB clock from dispcc
> +      - description: Display hf axi clock
> +      - description: Display ahb clock
> +      - description: Display rotator clock
> +      - description: Display lut clock
>        - description: Display core clock
> +      - description: Display vsync clock
>  
>    clock-names:
>      items:
> +      - const: bus
>        - const: iface
> -      - const: ahb
> +      - const: rot
> +      - const: lut
>        - const: core
> -
> -  iommus:
> -    maxItems: 1
> -
> -  interconnects:
> -    maxItems: 1
> -
> -  interconnect-names:
> -    maxItems: 1
> -
> -patternProperties:
> -  "^display-controller@[0-9a-f]+$":
> -    type: object
> -    description: Node containing the properties of DPU.
> -    unevaluatedProperties: false
> -
> -    allOf:
> -      - $ref: /schemas/display/msm/dpu-common.yaml#
> -
> -    properties:
> -      compatible:
> -        items:
> -          - const: qcom,sc7180-dpu
> -
> -      reg:
> -        items:
> -          - description: Address offset and size for mdp register set
> -          - description: Address offset and size for vbif register set
> -
> -      reg-names:
> -        items:
> -          - const: mdp
> -          - const: vbif
> -
> -      clocks:
> -        items:
> -          - description: Display hf axi clock
> -          - description: Display ahb clock
> -          - description: Display rotator clock
> -          - description: Display lut clock
> -          - description: Display core clock
> -          - description: Display vsync clock
> -
> -      clock-names:
> -        items:
> -          - const: bus
> -          - const: iface
> -          - const: rot
> -          - const: lut
> -          - const: core
> -          - const: vsync
> +      - const: vsync
>  
>  unevaluatedProperties: false
>  
> @@ -91,71 +53,46 @@ examples:
>    - |
>      #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>      #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> -    #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/interconnect/qcom,sdm845.h>
>      #include <dt-bindings/power/qcom-rpmpd.h>
>  
> -    display-subsystem@ae00000 {
> -         #address-cells = <1>;
> -         #size-cells = <1>;
> -         compatible = "qcom,sc7180-mdss";
> -         reg = <0xae00000 0x1000>;
> -         reg-names = "mdss";
> -         power-domains = <&dispcc MDSS_GDSC>;
> -         clocks = <&gcc GCC_DISP_AHB_CLK>,
> -                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -         clock-names = "iface", "ahb", "core";
> -
> -         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> -         interrupt-controller;
> -         #interrupt-cells = <1>;
> -
> -         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> -         interconnect-names = "mdp0-mem";
> -
> -         iommus = <&apps_smmu 0x800 0x2>;
> -         ranges;
> -
> -         display-controller@ae01000 {
> -                   compatible = "qcom,sc7180-dpu";
> -                   reg = <0x0ae01000 0x8f000>,
> -                         <0x0aeb0000 0x2008>;
> -
> -                   reg-names = "mdp", "vbif";
> -
> -                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> -                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
> -                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> -                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                   clock-names = "bus", "iface", "rot", "lut", "core",
> -                                 "vsync";
> -
> -                   interrupt-parent = <&mdss>;
> -                   interrupts = <0>;
> -                   power-domains = <&rpmhpd SC7180_CX>;
> -                   operating-points-v2 = <&mdp_opp_table>;
> -
> -                   ports {
> -                           #address-cells = <1>;
> -                           #size-cells = <0>;
> -
> -                           port@0 {
> -                                   reg = <0>;
> -                                   dpu_intf1_out: endpoint {
> -                                                  remote-endpoint = <&dsi0_in>;
> -                                   };
> -                           };
> -
> -                            port@2 {
> -                                    reg = <2>;
> -                                    dpu_intf0_out: endpoint {
> -                                                   remote-endpoint = <&dp_in>;
> -                                    };
> -                            };
> -                   };
> -         };
> +    display-controller@ae01000 {
> +               compatible = "qcom,sc7180-dpu";
> +               reg = <0x0ae01000 0x8f000>,
> +                     <0x0aeb0000 0x2008>;
> +
> +               reg-names = "mdp", "vbif";
> +
> +               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +               clock-names = "bus", "iface", "rot", "lut", "core",
> +                             "vsync";
> +
> +               interrupt-parent = <&mdss>;
> +               interrupts = <0>;
> +               power-domains = <&rpmhpd SC7180_CX>;
> +               operating-points-v2 = <&mdp_opp_table>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               dpu_intf1_out: endpoint {
> +                                              remote-endpoint = <&dsi0_in>;
> +                               };
> +                       };
> +
> +                        port@2 {
> +                                reg = <2>;
> +                                dpu_intf0_out: endpoint {
> +                                               remote-endpoint = <&dp_in>;
> +                                };
> +                        };
> +               };
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
> new file mode 100644
> index 000000000000..27d944f0e471
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml

The preferred naming is using the compatible: qcom,sc7180-mdss.yaml

> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display MDSS dt properties for SC7180 target

Qualcomm SC7180 Display MDSS

> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SC7180 target.
> +
> +allOf:
> +  - $ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sc7180-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AHB clock from dispcc
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ahb
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sc7180-dpu
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +         #address-cells = <1>;
> +         #size-cells = <1>;
> +         compatible = "qcom,sc7180-mdss";
> +         reg = <0xae00000 0x1000>;
> +         reg-names = "mdss";
> +         power-domains = <&dispcc MDSS_GDSC>;
> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         clock-names = "iface", "ahb", "core";
> +
> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells = <1>;
> +
> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +         interconnect-names = "mdp0-mem";
> +
> +         iommus = <&apps_smmu 0x800 0x2>;
> +         ranges;
> +    };
> +...
> -- 
> 2.35.1
> 
> 
