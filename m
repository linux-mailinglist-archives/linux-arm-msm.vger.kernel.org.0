Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA885B0E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiIGUV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiIGUV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:21:58 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E650A3449;
        Wed,  7 Sep 2022 13:21:57 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 92-20020a9d0be5000000b0063946111607so11014673oth.10;
        Wed, 07 Sep 2022 13:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2U6d2Qid73yh3Rdnn6a6LubqffyglKVJNPUisWHqSUc=;
        b=DW6Y2qKZtSe+Clmav3+KKupnkraQl2RpBp2XjFdtOxNlnxpX+INm/0bVlxo7HPtmg+
         CvXjA5nX8b2qTYdf73WgsTOTHsXFuS4SrjrCaUYPZa+Y1CztI6UcCkTUWEZtFvN71rU1
         fV4oeNJ2rfsbKF7awheIYX23MpXMeEvn/IFtl8cBZ3eje8KW8Ufyz7o5gi6Yu1ggS1Lc
         GeEQXCIHGYXsi4injdPfx6gGDp/9mAfPBdNw3wh5nJ6/qAOTs1GnrYDNWYRjwlLLgcY0
         vZ6RZjFfeh4emGiey01597uvyEddeVyurpLQP3e327Klo0Gh7hUFsb9uaZcxpzI4Q47H
         85Eg==
X-Gm-Message-State: ACgBeo0tLC/5WWR30DQRgbpqm3Vopu4+dN1INE4RVTB5aU1TeZAFPStw
        ipHf8a2OtpeVI9KhYgWwPw==
X-Google-Smtp-Source: AA6agR5danNmNgoWoDE2ASwhAZyME3DY1WK0lLob6U5qZhvPEvqxt2Ob3ARjJ9IoOyfH0JkCqjMEBg==
X-Received: by 2002:a05:6830:2095:b0:638:f0eb:f44d with SMTP id y21-20020a056830209500b00638f0ebf44dmr2170081otq.288.1662582116245;
        Wed, 07 Sep 2022 13:21:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d132-20020aca368a000000b00342fc99c5cbsm6842958oia.54.2022.09.07.13.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:21:55 -0700 (PDT)
Received: (nullmailer pid 229841 invoked by uid 1000);
        Wed, 07 Sep 2022 20:21:55 -0000
Date:   Wed, 7 Sep 2022 15:21:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 12/12] dt-bindings: display/msm: add support for the
 display on SM8250
Message-ID: <20220907202155.GA216714-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-13-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-13-dmitry.baryshkov@linaro.org>
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

On Thu, Sep 01, 2022 at 01:23:12PM +0300, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8250 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sm8250.yaml      |  96 ++++++++++++++++
>  .../bindings/display/msm/mdss-common.yaml     |   4 +-
>  .../bindings/display/msm/mdss-sm8250.yaml     | 106 ++++++++++++++++++
>  3 files changed, 204 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
> new file mode 100644
> index 000000000000..9bc2ee4a6589
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sm8250.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SM8250

Qualcomm SM8250 Display DPU

> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description: |
> +  Device tree bindings for the DPU display controller for SM8250 target.

If you don't have more to say than the title, then just drop.

> +
> +allOf:
> +  - $ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-dpu
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
> +      - description: Display ahb clock
> +      - description: Display hf axi clock
> +      - description: Display core clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +      - const: vsync
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@ae01000 {
> +      compatible = "qcom,sm8250-dpu";
> +      reg = <0x0ae01000 0x8f000>,
> +            <0x0aeb0000 0x2008>;
> +      reg-names = "mdp", "vbif";
> +
> +      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +               <&gcc GCC_DISP_HF_AXI_CLK>,
> +               <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +               <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +      clock-names = "iface", "bus", "core", "vsync";
> +
> +      assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +      assigned-clock-rates = <19200000>;
> +
> +      operating-points-v2 = <&mdp_opp_table>;
> +      power-domains = <&rpmhpd SM8250_MMCX>;
> +
> +      interrupt-parent = <&mdss>;
> +      interrupts = <0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          endpoint {
> +            remote-endpoint = <&dsi0_in>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          endpoint {
> +            remote-endpoint = <&dsi1_in>;
> +          };
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index 053c1e889552..a0a54cd63100 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -27,11 +27,11 @@ properties:
>  
>    clocks:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>  
>    interrupts:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
> new file mode 100644
> index 000000000000..d581d10fea2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss-sm8250.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display MDSS dt properties for SM8250 target

Same comment here.

> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SM8250 target.
> +
> +allOf:
> +  - $ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sm8250-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock
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
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm8250-dpu
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdss-dsi-ctrl
> +
> +  "^dsi-phy@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,dsi-phy-7nm
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +      compatible = "qcom,sm8250-mdss";
> +      reg = <0x0ae00000 0x1000>;
> +      reg-names = "mdss";
> +
> +      interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
> +                      <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
> +      interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +      power-domains = <&dispcc MDSS_GDSC>;
> +
> +      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +               <&gcc GCC_DISP_HF_AXI_CLK>,
> +               <&gcc GCC_DISP_SF_AXI_CLK>,
> +               <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +      clock-names = "iface", "bus", "nrt_bus", "core";
> +
> +      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +
> +      iommus = <&apps_smmu 0x820 0x402>;
> +
> +      status = "disabled";

Drop

> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +    };
> +...
> -- 
> 2.35.1
> 
> 
