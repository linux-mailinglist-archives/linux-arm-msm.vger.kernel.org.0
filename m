Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399386C7953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 09:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjCXIE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 04:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjCXIET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 04:04:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BEC2386A
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 01:04:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A14B2B822F1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 08:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C987C433D2;
        Fri, 24 Mar 2023 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679645054;
        bh=2K/slDnR4IfjpiOGtIogZtO+BX/WGlJNuHWsirhnpmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kh7FhJf9qECLiGxLEzChbAa/IhiRDumUvlvOAjIZQ4GJRemH1OtpjngiLH/ys4jED
         2mPnbO/mv9nBw4EiyOO2QWH5YWUR1P+XbBRlnpFSOalLKuyxGUDI6Vf35pcrVI57rx
         D8gSluQExvNSizmYXBQCeiRVj8f4oIZBd/808ZdLYIFRnTn1aSRX74kmbJA/5rT59c
         cnApfkG4F79wdmlTmZ9fbSMapUJHQFFkfYzqkLarOr9LrFCNYBZwKfoVqM11BHgG+g
         5SznNTkPKUUQxGdguZMKeKLtU4ov6qkxdbTCmy4v1TOFpeJoC2eUWkTQa8RnjHipJk
         fQS7ubKvKKaqw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pfcPF-0003Fo-F8; Fri, 24 Mar 2023 09:04:13 +0100
Date:   Fri, 24 Mar 2023 09:04:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 04/41] dt-bindings: phy: migrate QMP PCIe PHY bindings to
 qcom,sc8280xp-qmp-pcie-phy.yaml
Message-ID: <ZB1ZfUCzgcd47VrM@hovoldconsulting.com>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
 <20230324022514.1800382-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324022514.1800382-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 05:24:37AM +0300, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,ipq8074-qmp-pcie-phy.yaml)
> to qcom,sc8280xp-qmp-pcie-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 299 ------------------
>  .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 213 +++++++++++--
>  2 files changed, 187 insertions(+), 325 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index ef49efbd0a20..328588448c6b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -16,10 +16,23 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,ipq6018-qmp-pcie-phy
> +      - qcom,ipq8074-qmp-gen3-pcie-phy
> +      - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,msm8998-qmp-pcie-phy
> +      - qcom,sc8180x-qmp-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x1-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x2-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x4-pcie-phy
> +      - qcom,sdm845-qhp-pcie-phy
> +      - qcom,sdm845-qmp-pcie-phy
> +      - qcom,sdx55-qmp-pcie-phy
> +      - qcom,sm8250-qmp-gen3x1-pcie-phy
> +      - qcom,sm8250-qmp-gen3x2-pcie-phy
> +      - qcom,sm8250-qmp-modem-pcie-phy
>        - qcom,sm8350-qmp-gen3x1-pcie-phy
> +      - qcom,sm8450-qmp-gen3x1-pcie-phy
> +      - qcom,sm8450-qmp-gen4x2-pcie-phy
>        - qcom,sm8550-qmp-gen3x2-pcie-phy
>        - qcom,sm8550-qmp-gen4x2-pcie-phy
>  
> @@ -28,18 +41,12 @@ properties:
>      maxItems: 2
>  
>    clocks:
> -    minItems: 5
> +    minItems: 3
>      maxItems: 6
>  
>    clock-names:
> -    minItems: 5
> -    items:
> -      - const: aux
> -      - const: cfg_ahb
> -      - const: ref
> -      - const: rchng
> -      - const: pipe
> -      - const: pipediv2
> +    minItems: 3
> +    maxItems: 6
>  
>    power-domains:
>      maxItems: 1
> @@ -50,9 +57,7 @@ properties:
>  
>    reset-names:
>      minItems: 1
> -    items:
> -      - const: phy
> -      - const: phy_nocsr
> +    maxItems: 2
>  
>    vdda-phy-supply: true
>  
> @@ -83,11 +88,8 @@ required:
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains
>    - resets
>    - reset-names
> -  - vdda-phy-supply
> -  - vdda-pll-supply
>    - "#clock-cells"
>    - clock-output-names
>    - "#phy-cells"
> @@ -119,21 +121,116 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,sm8350-qmp-gen3x1-pcie-phy
> -              - qcom,sm8550-qmp-gen3x2-pcie-phy
> -              - qcom,sm8550-qmp-gen4x2-pcie-phy
> +              - qcom,msm8998-qmp-pcie-phy
>      then:
>        properties:
>          clocks:
> -          maxItems: 5
> +          maxItems: 4
>          clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: pipe
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common

Reset name looks wrong here too.

> +      required:
> +        - vdda-phy-supply
> +        - vdda-pll-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq6018-qmp-pcie-phy
> +              - qcom,ipq8074-qmp-gen3-pcie-phy
> +              - qcom,ipq8074-qmp-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: pipe
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common

Same here.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8180x-qmp-pcie-phy
> +              - qcom,sdm845-qhp-pcie-phy
> +              - qcom,sdm845-qmp-pcie-phy
> +              - qcom,sdx55-qmp-pcie-phy
> +              - qcom,sm8250-qmp-gen3x1-pcie-phy
> +              - qcom,sm8250-qmp-gen3x2-pcie-phy
> +              - qcom,sm8250-qmp-modem-pcie-phy
> +              - qcom,sm8450-qmp-gen3x1-pcie-phy
> +              - qcom,sm8450-qmp-gen4x2-pcie-phy
> +    then:
> +      properties:
> +        clocks:
>            maxItems: 5
> -    else:
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: refgen

This one should be named 'rchng' and this set a strict subset of the
sc8280xp clocks.

> +            - const: pipe
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          items:
> +            - const: phy
> +      required:
> +        - vdda-phy-supply
> +        - vdda-pll-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8350-qmp-gen3x1-pcie-phy
> +              - qcom,sm8550-qmp-gen3x2-pcie-phy
> +        resets:
> +          minItems: 1
> +        reset-names:
> +          items:
> +            - const: phy
> +    then:
>        properties:
>          clocks:
> -          minItems: 6
> +          maxItems: 5
>          clock-names:
> -          minItems: 6
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: rchng
> +            - const: pipe
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          items:
> +            - const: phy
> +      required:
> +        - vdda-phy-supply
> +        - vdda-pll-supply
>  
>    - if:
>        properties:
> @@ -143,16 +240,53 @@ allOf:
>                - qcom,sm8550-qmp-gen4x2-pcie-phy
>      then:
>        properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: rchng
> +            - const: pipe
>          resets:
>            minItems: 2
>          reset-names:
> -          minItems: 2
> -    else:
> +          items:
> +            - const: phy
> +            - const: phy_nocsr
> +      required:
> +        - vdda-phy-supply
> +        - vdda-pll-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-qmp-gen3x1-pcie-phy
> +              - qcom,sc8280xp-qmp-gen3x2-pcie-phy
> +              - qcom,sc8280xp-qmp-gen3x4-pcie-phy
> +    then:
>        properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: rchng
> +            - const: pipe
> +            - const: pipediv2
>          resets:
> -          maxItems: 1
> +          minItems: 1
>          reset-names:
> -          maxItems: 1
> +          items:
> +            - const: phy
> +      required:
> +        - vdda-phy-supply
> +        - vdda-pll-supply
>  
>  examples:
>    - |
> @@ -213,3 +347,30 @@ examples:
>  
>        #phy-cells = <0>;
>      };
> +  - |
> +    #define GCC_PCIE1_PHY_REFGEN_CLK   47
> +    #define GCC_PCIE_PHY_AUX_CLK       71
> +    #define GCC_PCIE_WIGIG_CLKREF_EN   74
> +
> +    phy@1c0e000 {
> +        compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
> +        reg = <0x01c0e000 0x1c0>;
> +
> +        clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> +                 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +                 <&gcc GCC_PCIE_WIGIG_CLKREF_EN>,
> +                 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>,
> +                 <&gcc GCC_PCIE_1_PIPE_CLK>;
> +        clock-names = "aux", "cfg_ahb", "ref", "refgen", "pipe";
> +
> +        resets = <&gcc GCC_PCIE_1_PHY_BCR>;
> +        reset-names = "phy";
> +
> +        vdda-phy-supply = <&vreg_l10c_0p88>;
> +        vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +        #clock-cells = <0>;
> +        clock-output-names = "pcie_1_pipe_clk";
> +
> +        #phy-cells = <0>;
> +    };

This example also looks redundant.

Johan
