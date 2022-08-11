Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3674D58F8FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 10:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiHKIZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 04:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbiHKIZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 04:25:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709534506A
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:25:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s9so18583545ljs.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=E3DYBIoLfeLOkyJKxGqB277XbVTVlylmEyqrX+2n1PU=;
        b=kwIQPe6uwez+/w4ii7wDZKXLQSjekYFbFtoTXSGUrYbdg/in3iovurlPSELHPhqzfe
         t+F39hF4MkAMwmuhThw48f61F2snOf94rk2zly5OUzqWyVWz2/973mkOep2l8WPUbLr3
         pBjPkH9OFhnNgsH8Y34oQmddRlGPQHPCI9D2RJOJXM/lW380mRX1xwfVvlV/sFVZXD/8
         t9dfSCz2LsQUBvAet9jzZRl6wKxXFwBU/VArhLtiyPazj07wtLMZmEt+NHWammqcZ4x1
         UG67e0P71pIKPbdaLeQ9nrwhVzICOKCkCb4hZCuddxNST+dUebZM7jgIFuYzqpR8IjPQ
         fIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=E3DYBIoLfeLOkyJKxGqB277XbVTVlylmEyqrX+2n1PU=;
        b=xQR8bihqCvLAcjzhKBJvriMDJtK7ijS+nCwmRUvEL8t4380doB9DGhengVJPnK+aVb
         YUgczjv496G4hdS/ZG0SeqR6/eNHihkmn4w44CXvpz7Zyg3s1SrPCubxtBug0e2H8LpN
         1HPKNWBwVc4CyuxRbNz5XXAIP2Kt4NMMwxnqHoqWgPqPBjkLUiRW/kqFNIvj4GP/jki0
         Z76KRpNdPxPgoc+Z4WioBsu6JU6Sz2xJ0SZ+IwLPyowpydehE4rSm8Fy8HQa/3+uxWdb
         r9vcQi54xsXjvjHkRwT7ZErB/GaQ6ASLOHg3PjfGWQLVypbIHUOAaoNwHmBYzsDKId/i
         wh7Q==
X-Gm-Message-State: ACgBeo1qI7YqoyMkG3vPdSZhc0YybW8sfgOCt+jG1S5YsiRsZ6pHttrn
        TYw/cR5evcf9JjsNqBpIaxg/RA==
X-Google-Smtp-Source: AA6agR6pkNti9KxFRCrbdIYp/ANGyoY5fau7rgtkri+44sjR4dNy/Ucivd5YuXaYoiPwmtCauswR6A==
X-Received: by 2002:a05:651c:2120:b0:25e:5145:38b0 with SMTP id a32-20020a05651c212000b0025e514538b0mr10429398ljq.191.1660206335625;
        Thu, 11 Aug 2022 01:25:35 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id v23-20020ac258f7000000b00489f0c8bddesm621501lfo.207.2022.08.11.01.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 01:25:35 -0700 (PDT)
Message-ID: <37bf0f7f-e555-7ae9-7d2b-e05a9e8db6a4@linaro.org>
Date:   Thu, 11 Aug 2022 11:25:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 06/11] dt-bindings: display/msm: move qcom,sc7180-mdss
 schema to mdss.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2022 12:00, Dmitry Baryshkov wrote:
> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  45 +++++-
>  2 files changed, 80 insertions(+), 114 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> index d3c3e4b07897..9d4ec0b60c25 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -10,151 +10,78 @@ maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
>  description: |
> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> -  bindings of MDSS and DPU are mentioned for SC7180 target.
> +  Device tree bindings for the DPU display controller for SC7180 target.
>  
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sc7180-mdss
> +      - const: qcom,sc7180-dpu
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
> -
> -  ranges: true
> -
> -  interconnects:
> -    items:
> -      - description: Interconnect path specifying the port ids for data bus
> -
> -  interconnect-names:
> -    const: mdp0-mem
> +  power-domains:
> +    maxItems: 1
>  
> -  resets:
> -    items:
> -      - description: MDSS_CORE reset
> +  operating-points-v2: true
>  
> -patternProperties:
> -  "^display-controller@[0-9a-f]+$":
> -    type: object
> -    description: Node containing the properties of DPU.
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
> -
> -      interrupts:
> -        maxItems: 1
> -
> -      power-domains:
> -        maxItems: 1
> -
> -      operating-points-v2: true
> -
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
> -          port@2:
> -            $ref: /schemas/graph.yaml#/properties/port
> -            description: DPU_INTF0 (DP)
> -
> -        required:
> -          - port@0
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF1 (DSI1)
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF0 (DP)
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
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> index 7d4ab3d71d2d..98f1f2501291 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> @@ -17,6 +17,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,sc7180-mdss
>        - qcom,sdm845-mdss
>        - qcom,mdss
>  
> @@ -64,20 +65,21 @@ properties:
>        - description: MDSS_CORE reset
>  
>    interconnects:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - description: MDP port 0
>        - description: MDP port 1
>        - description: Rotator
>  
>    interconnect-names:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - const: mdp0-mem
>        - const: mdp1-mem
>        - const: rotator-mem
>  
>    iommus:
> +    minItems: 1
>      items:
>        - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
>        - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> @@ -129,9 +131,11 @@ allOf:
>              - const: mdss
>  
>          interconnects:
> +          minItems: 1
>            maxItems: 2
>  
>          interconnect-names:
> +          minItems: 1
>            maxItems: 2
>  
>        required:
> @@ -157,6 +161,29 @@ allOf:
>          iommus:
>            minItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-mdss
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Display AHB clock from gcc
> +            - description: Display AHB clock from dispcc
> +            - description: Display core clock
> +
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: ahb
> +            - const: core
> +
> +        iommus:
> +          maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -177,7 +204,19 @@ patternProperties:
>      # TODO: add reference once the mdp5 is converted
>  
>    "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
> -    $ref: dpu-sdm845.yaml
> +    oneOf:
> +      - $ref: dpu-sc7180.yaml
> +      - $ref: dpu-sdm845.yaml

I don't think this is good approach. These are strictly tied, so you
should have rather per SoC MDSS schema pulling in:
1. common MDSS
2. specific children schemas

This makes it quite obvious and specific. Your setup now allows putting
sc7180-dpu under sdm845-dpu.

Best regards,
Krzysztof
