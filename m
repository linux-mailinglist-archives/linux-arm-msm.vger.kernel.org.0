Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428F1562642
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 00:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbiF3WxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 18:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiF3WxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 18:53:03 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEE85073B;
        Thu, 30 Jun 2022 15:53:02 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id h5so351094ili.3;
        Thu, 30 Jun 2022 15:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9hv5oNcNK2+cdyG2/zQ0DP6reJJ+TytST3AKiSEqkZ4=;
        b=sl3DQ4x4n5ayoc3fn8NkjObeOivntIzfMijCA+mAX6rsZYDoaoEaqL4VWYVO5XBdoP
         Yp/hNkUohmYwtvdP4f5EBb7GKnWrqoff1GyFJYJTqvRX0X6ZOqYOX0T6XYQ0rzJoa53R
         0ktUKTJHGcGNkpmRbcQeWvyLNX7fCWiq1hznnZw/lH67ALciHNALx16ZYmPccLrp9/VW
         kOxwADGQkFhvMIHCaTrqOh9DKnR2uv1h1jNqHhkSAKArPhH+HVYeuvlSN29AhTElmyBq
         yXqWKyO6YRDvjszFd8HPk1/2F/V9ALMr2O/C+KZUHV21DzEVocHIuXL/iSahCyDKJsGi
         sGdw==
X-Gm-Message-State: AJIora+wJN4Xwy+yjs1XsdNjTsWnbpCcHUkl9pGh48JEj9LSqSEX+9fL
        G/oFKZipace9GC32ZDkc+3gRCjH2dg==
X-Google-Smtp-Source: AGRyM1s/HZ+kLEhLlwXvQwmAE1qhv2MrusAGfXIf/YxcTBBEnYQjNN30/6l30rdtW3qqeFI5bgt33Q==
X-Received: by 2002:a05:6e02:1c0e:b0:2da:87c1:5f17 with SMTP id l14-20020a056e021c0e00b002da87c15f17mr6618379ilh.133.1656629581407;
        Thu, 30 Jun 2022 15:53:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q189-20020a6b8ec6000000b0065a47e16f4esm9483823iod.32.2022.06.30.15.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 15:53:01 -0700 (PDT)
Received: (nullmailer pid 3476577 invoked by uid 1000);
        Thu, 30 Jun 2022 22:52:59 -0000
Date:   Thu, 30 Jun 2022 16:52:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 01/11] dt-bindings: display/msm: split qcom, mdss bindings
Message-ID: <20220630225259.GA3449913-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232513.522599-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 26, 2022 at 02:25:03AM +0300, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Add optional "vbif_nrt_phys" region used by msm8996
>  - Make "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Add (optional) "core" clock added recently to the mdss driver
>  - Add optional resets property referencing MDSS reset
>  - Define child nodes together with compatibles
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +--
>  .../devicetree/bindings/display/msm/mdss.yaml | 173 ++++++++++++++++++
>  2 files changed, 174 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> index 43d11279c925..65d03c58dee6 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> @@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
>  
>  Description:
>  
> -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> -encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
> +This is the bindings documentation for the MDP5 display
>  controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
>  
> -MDSS:
> -Required properties:
> -- compatible:
> -  * "qcom,mdss" - MDSS
> -- reg: Physical base address and length of the controller's registers.
> -- reg-names: The names of register regions. The following regions are required:
> -  * "mdss_phys"
> -  * "vbif_phys"
> -- interrupts: The interrupt signal from MDSS.
> -- interrupt-controller: identifies the node as an interrupt controller.
> -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> -  source, should be 1.
> -- power-domains: a power domain consumer specifier according to
> -  Documentation/devicetree/bindings/power/power_domain.txt
> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
> -- clock-names: the following clocks are required.
> -  * "iface"
> -  * "bus"
> -  * "vsync"
> -- #address-cells: number of address cells for the MDSS children. Should be 1.
> -- #size-cells: Should be 1.
> -- ranges: parent bus address space is the same as the child bus address space.
> -
> -Optional properties:
> -- clock-names: the following clocks are optional:
> -  * "lut"

What happened to lut?

> -
>  MDP5:
>  Required properties:
>  - compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> new file mode 100644
> index 000000000000..55c70922361d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Mobile Display SubSystem (MDSS) dt properties

s/dt properties//

> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |

Don't need '|'.

> +  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> +  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,mdss
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 3
> +
> +  reg-names:
> +    minItems: 2
> +    items:
> +      - const: mdss_phys
> +      - const: vbif_phys
> +      - const: vbif_nrt_phys

Let's not continue with the _phys silliness.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller:
> +    true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description: |
> +      The MDSS power domain provided by GCC
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: vsync
> +      - const: core
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    true
> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "^mdp@(0|[1-9a-f][0-9a-f]*)$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,mdp5

These child nodes need to reference child schemas or be complete. If 
they aren't converted, then just 'type: object' and be done with it.

> +
> +  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,mdss-dsi-ctrl
> +
> +  "^dsi-phy@(0|[1-9a-f][0-9a-f]*)$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,dsi-phy-7nm
> +          - qcom,dsi-phy-7nm-8150
> +          - qcom,dsi-phy-10nm
> +          - qcom,dsi-phy-10nm-8998
> +          - qcom,dsi-phy-14nm
> +          - qcom,dsi-phy-14nm-660
> +          - qcom,dsi-phy-14nm-8953
> +          - qcom,dsi-phy-20nm
> +          - qcom,dsi-phy-28nm-8960
> +          - qcom,dsi-phy-28nm-hpm
> +          - qcom,dsi-phy-28nm-lp
> +          - qcom,sc7280-dsi-phy-7nm
> +
> +  "^hdmi-phy@(0|[1-9a-f][0-9a-f]*)$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,hdmi-phy-8660
> +          - qcom,hdmi-phy-8960
> +          - qcom,hdmi-phy-8974
> +          - qcom,hdmi-phy-8084
> +          - qcom,hdmi-phy-8996
> +
> +  "^hdmi-tx@(0|[1-9a-f][0-9a-f]*)$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,hdmi-tx-8084
> +          - qcom,hdmi-tx-8660
> +          - qcom,hdmi-tx-8960
> +          - qcom,hdmi-tx-8974
> +          - qcom,hdmi-tx-8994
> +          - qcom,hdmi-tx-8996
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdss@1a00000 {
> +      compatible = "qcom,mdss";
> +      reg = <0x1a00000 0x1000>,
> +            <0x1ac8000 0x3000>;
> +      reg-names = "mdss_phys", "vbif_phys";
> +
> +      power-domains = <&gcc MDSS_GDSC>;
> +
> +      clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +               <&gcc GCC_MDSS_AXI_CLK>,
> +               <&gcc GCC_MDSS_VSYNC_CLK>;
> +      clock-names = "iface",
> +                    "bus",
> +                    "vsync";
> +
> +      interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +    };
> +...
> -- 
> 2.35.1
> 
> 
