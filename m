Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA48656265D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 01:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbiF3XCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 19:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbiF3XCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 19:02:52 -0400
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBF757215;
        Thu, 30 Jun 2022 16:02:50 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id i17so332265ils.12;
        Thu, 30 Jun 2022 16:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=78y5qJDO6pJSFpasjcheOE7uiGrOFiGiTGrzj5Dkico=;
        b=HNBnYWOJD0eLutTA03JJQdkPWHVIsgvKgOacrWVuNeWkoYwc4m5IsGqLQLEO4MvN5S
         +uw1mzULtR5m4pK1fLBw6iBiB6acC/5v4ilYhu7tsrA+h+XT2rC+Exk/Owlck5y2IhvB
         qjYZS7lc/zTLRdp2Yb3Xj3BesfdOa4b3/9Dp3vPTU+25g7gYapHkhjTPnkhY98mfNNmG
         FRM+DFTB4ykt/PFq7TDZ5qsR0WN6MZC6MwdYSRILPGKl6szwRos1HngsKg3itWHiBCaj
         Fps0PGbmUcHzFEVO1JtekVTLSQIrFHPPI9snr85bVscGdHTjs4gVpFfSmzp1i8QQW4a4
         CXng==
X-Gm-Message-State: AJIora8TdQU8hyN9TtwcZ/ZAP6FlZDP5Z3g6l2dRUBIxnQ92tENkpwKU
        XYG03bzFbCpqwxp69rTAiONkc2XpPg==
X-Google-Smtp-Source: AGRyM1tqEXNZpw7HLMbBdIYxDrB6CxcY73AS+c2lporP+LArJBRbESm6Vhm0VZiiVwAIbWFvFRN0mQ==
X-Received: by 2002:a05:6e02:214a:b0:2da:a56a:c1cf with SMTP id d10-20020a056e02214a00b002daa56ac1cfmr6771918ilv.5.1656630169809;
        Thu, 30 Jun 2022 16:02:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q3-20020a02a983000000b0033be74df72csm8082208jam.3.2022.06.30.16.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 16:02:49 -0700 (PDT)
Received: (nullmailer pid 3491449 invoked by uid 1000);
        Thu, 30 Jun 2022 23:02:47 -0000
Date:   Thu, 30 Jun 2022 17:02:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 02/11] dt-bindings: display/msm: move qcom,sdm845-mdss
 schema to mdss.yaml
Message-ID: <20220630230247.GA3476825-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232513.522599-3-dmitry.baryshkov@linaro.org>
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

On Sun, Jun 26, 2022 at 02:25:04AM +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,sdm845-mdss from dpu-sdm845.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> While we are at it, rename display-controller node to mdp to reflect
> actual node name in the sdm845.dtsi file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sdm845.yaml      | 137 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml | 112 ++++++++++++--
>  2 files changed, 135 insertions(+), 114 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index 2bb8896beffc..9253e0ca9fca 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -10,139 +10,74 @@ maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
>  description: |
> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> -  bindings of MDSS and DPU are mentioned for SDM845 target.
> +  Device tree bindings for the DPU display controller for SDM845 target.
>  
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sdm845-mdss
> +      - const: qcom,sdm845-dpu
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
>  
>    reg-names:
> -    const: mdss
> -
> -  power-domains:
> -    maxItems: 1
> +    items:
> +      - const: mdp
> +      - const: vbif
>  
>    clocks:
>      items:
> -      - description: Display AHB clock from gcc
> +      - description: Display ahb clock
> +      - description: Display axi clock
>        - description: Display core clock
> +      - description: Display vsync clock
>  
>    clock-names:
>      items:
>        - const: iface
> +      - const: bus
>        - const: core
> +      - const: vsync
>  
>    interrupts:
>      maxItems: 1
>  
> -  interrupt-controller: true
> -
> -  "#address-cells": true
> -
> -  "#size-cells": true
> -
> -  "#interrupt-cells":
> -    const: 1
> -
> -  iommus:
> -    items:
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> -
> -  ranges: true
> -
> -  resets:
> -    items:
> -      - description: MDSS_CORE reset
> +  power-domains:
> +    maxItems: 1
>  
> -patternProperties:
> -  "^display-controller@[0-9a-f]+$":
> -    type: object
> -    description: Node containing the properties of DPU.
> +  operating-points-v2: true
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc. Each output port contains an endpoint that
> +      describes how it is connected to an external interface.
>  
>      properties:
> -      compatible:
> -        items:
> -          - const: qcom,sdm845-dpu
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
> -          - description: Display ahb clock
> -          - description: Display axi clock
> -          - description: Display core clock
> -          - description: Display vsync clock
> -
> -      clock-names:
> -        items:
> -          - const: iface
> -          - const: bus
> -          - const: core
> -          - const: vsync
> -
> -      interrupts:
> -        maxItems: 1
> -
> -      power-domains:
> -        maxItems: 1
> -
> -      operating-points-v2: true
> -      ports:
> -        $ref: /schemas/graph.yaml#/properties/ports
> -        description: |
> -          Contains the list of output ports from DPU device. These ports
> -          connect to interfaces that are external to the DPU hardware,
> -          such as DSI, DP etc. Each output port contains an endpoint that
> -          describes how it is connected to an external interface.
> -
> -        properties:
> -          port@0:
> -            $ref: /schemas/graph.yaml#/properties/port
> -            description: DPU_INTF1 (DSI1)
> -
> -          port@1:
> -            $ref: /schemas/graph.yaml#/properties/port
> -            description: DPU_INTF2 (DSI2)
> -
> -        required:
> -          - port@0
> -          - port@1
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF1 (DSI1)
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF2 (DSI2)
>  
>      required:
> -      - compatible
> -      - reg
> -      - reg-names
> -      - clocks
> -      - interrupts
> -      - power-domains
> -      - operating-points-v2
> -      - ports
> +      - port@0
> +      - port@1
>  
>  required:
>    - compatible
>    - reg
>    - reg-names
> -  - power-domains
>    - clocks
>    - interrupts
> -  - interrupt-controller
> -  - iommus
> -  - ranges
> +  - power-domains
> +  - operating-points-v2
> +  - ports
>  
>  additionalProperties: false
>  
> @@ -173,7 +108,7 @@ examples:
>                     <&apps_smmu 0xc80 0x8>;
>            ranges;
>  
> -          display-controller@ae01000 {
> +          mdp@ae01000 {

The idea was to fix the dts files. Does something depend on the 'mdp' 
name?

>                      compatible = "qcom,sdm845-dpu";
>                      reg = <0x0ae01000 0x8f000>,
>                            <0x0aeb0000 0x2008>;
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> index 55c70922361d..1cfdec9e349b 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> @@ -8,6 +8,7 @@ title: Qualcomm Mobile Display SubSystem (MDSS) dt properties
>  
>  maintainers:
>    - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
>    - Rob Clark <robdclark@gmail.com>
>  
>  description: |
> @@ -17,18 +18,16 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,sdm845-mdss
>        - qcom,mdss
>  
>    reg:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    reg-names:
> -    minItems: 2
> -    items:
> -      - const: mdss_phys
> -      - const: vbif_phys
> -      - const: vbif_nrt_phys
> +    minItems: 1
> +    maxItems: 3
>  
>    interrupts:
>      maxItems: 1
> @@ -50,17 +49,13 @@ properties:
>  
>    clock-names:
>      minItems: 1
> -    items:
> -      - const: iface
> -      - const: bus
> -      - const: vsync
> -      - const: core
> +    maxItems: 4
>  
>    "#address-cells":
> -    const: 1
> +    enum: [1, 2]
>  
>    "#size-cells":
> -    const: 1
> +    enum: [1, 2]
>  
>    ranges:
>      true
> @@ -69,6 +64,96 @@ properties:
>      items:
>        - description: MDSS_CORE reset
>  
> +  interconnects:
> +    minItems: 2
> +    items:
> +      - description: MDP port 0
> +      - description: MDP port 1
> +      - description: Rotator
> +
> +  interconnect-names:
> +    minItems: 2
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: rotator-mem
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss

const: qcom,mdss

> +    then:
> +      properties:
> +        reg-names:
> +          minItems: 2
> +          items:
> +            - const: mdss_phys
> +            - const: vbif_phys
> +            - const: vbif_nrt_phys
> +    else:
> +      properties:
> +        regs:
> +          maxItems: 1
> +
> +        reg-names:
> +          items:
> +            - const: mdss
> +
> +        interconnects:
> +          maxItems: 2
> +
> +        interconnect-names:
> +          maxItems: 2
> +
> +      required:
> +        - iommus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss

The same if condition again?

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 4
> +
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: vsync
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-mdss
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Display AHB clock from gcc
> +            - description: Display core clock
> +
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: core
> +
>  required:
>    - compatible
>    - reg
> @@ -90,6 +175,7 @@ patternProperties:
>        compatible:
>          enum:
>            - qcom,mdp5
> +          - qcom,sdm845-dpu

As mentioned, this should be a $ref instead.

You should be able to do:

oneOf:
  - $ref: qcom,sdm845-dpu.yaml#
  - $ref: qcom,???-dpu.yaml#
  - ...

Rob
