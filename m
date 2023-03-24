Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482766C7934
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 08:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjCXHsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 03:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjCXHsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 03:48:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFB1D333
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:48:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C6BB62992
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEAAC433D2;
        Fri, 24 Mar 2023 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679644098;
        bh=ezIPyaV3SHPL5slDDp0WIRR+mYAyZy37iYqDUGkfrpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sKz8F+W5UWGGhj6Lr8+5aMFJwUycfi2tcqpVMbXS2CcAAQOagaeZpBowB+1e9w1mX
         kach64W1QJ7+guawSyDeppPcw7mxiprOJXLCg8MDLWNEMKA1s7bJw1Po+xqgmHlzUb
         Dj2eqAKnAN9CV7VJFjI6GpHpAm8pQSLK/QiH194P9q5NPZjCW6QskTMy9VDohNpYW2
         eVpCkHp9/e5LEXfX4Pn0HuT2l7Ai9S88sT/MfZkap8cmlATfJewiEDrnRyiCEAeIrL
         mbugujZzO9Zc0C9mcYA1Ovq8PrLcphuL0xBR+vQVmHqxb1LPhEbmztdGpiJQhZCbHU
         I/13JMz2hPSEA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pfc9p-00039S-83; Fri, 24 Mar 2023 08:48:17 +0100
Date:   Fri, 24 Mar 2023 08:48:17 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 01/41] dt-bindings: phy: migrate QMP USB PHY bindings to
 qcom,sc8280xp-qmp-usb3-uni-phy.yaml
Message-ID: <ZB1VwTRhgURGKuUB@hovoldconsulting.com>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
 <20230324022514.1800382-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324022514.1800382-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 05:24:34AM +0300, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,msm8996-qmp-usb3-phy.yaml)
> to qcom,sc8280xp-qmp-usb3-uni-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.

This needs to be done more care, rather than just dumping the old mess
we have in the new schema file.

Same comment for the other conversions.

NAK for the whole series for now.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 394 ------------------
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 236 ++++++++++-
>  2 files changed, 226 insertions(+), 404 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> deleted file mode 100644
> index e81a38281f8c..000000000000
> --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> +++ /dev/null
> @@ -1,394 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/phy/qcom,msm8996-qmp-usb3-phy.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Qualcomm QMP PHY controller (USB, MSM8996)
> -
> -maintainers:
> -  - Vinod Koul <vkoul@kernel.org>
> -
> -description:
> -  QMP PHY controller supports physical layer functionality for a number of
> -  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> -
> -  Note that these bindings are for SoCs up to SC8180X. For newer SoCs, see
> -  qcom,sc8280xp-qmp-usb3-uni-phy.yaml.
> -
> -properties:
> -  compatible:
> -    enum:
> -      - qcom,ipq6018-qmp-usb3-phy
> -      - qcom,ipq8074-qmp-usb3-phy
> -      - qcom,msm8996-qmp-usb3-phy
> -      - qcom,msm8998-qmp-usb3-phy
> -      - qcom,qcm2290-qmp-usb3-phy
> -      - qcom,sc7180-qmp-usb3-phy
> -      - qcom,sc8180x-qmp-usb3-phy
> -      - qcom,sdm845-qmp-usb3-phy
> -      - qcom,sdm845-qmp-usb3-uni-phy
> -      - qcom,sdx55-qmp-usb3-uni-phy
> -      - qcom,sdx65-qmp-usb3-uni-phy
> -      - qcom,sm6115-qmp-usb3-phy
> -      - qcom,sm8150-qmp-usb3-phy
> -      - qcom,sm8150-qmp-usb3-uni-phy
> -      - qcom,sm8250-qmp-usb3-phy
> -      - qcom,sm8250-qmp-usb3-uni-phy
> -      - qcom,sm8350-qmp-usb3-phy
> -      - qcom,sm8350-qmp-usb3-uni-phy
> -      - qcom,sm8450-qmp-usb3-phy
> -
> -  reg:
> -    minItems: 1
> -    items:
> -      - description: serdes
> -      - description: DP_COM
> -
> -  "#address-cells":
> -    enum: [ 1, 2 ]
> -
> -  "#size-cells":
> -    enum: [ 1, 2 ]
> -
> -  ranges: true
> -
> -  clocks:
> -    minItems: 3
> -    maxItems: 4
> -
> -  clock-names:
> -    minItems: 3
> -    maxItems: 4
> -
> -  power-domains:
> -    maxItems: 1
> -
> -  resets:
> -    maxItems: 2
> -
> -  reset-names:
> -    maxItems: 2
> -
> -  vdda-phy-supply: true
> -
> -  vdda-pll-supply: true
> -
> -  vddp-ref-clk-supply: true
> -
> -patternProperties:
> -  "^phy@[0-9a-f]+$":
> -    type: object
> -    description: single PHY-provider child node
> -    properties:
> -      reg:
> -        minItems: 3
> -        maxItems: 6
> -
> -      clocks:
> -        items:
> -          - description: PIPE clock
> -
> -      clock-names:
> -        deprecated: true
> -        items:
> -          - const: pipe0
> -
> -      "#clock-cells":
> -        const: 0
> -
> -      clock-output-names:
> -        maxItems: 1
> -
> -      "#phy-cells":
> -        const: 0
> -
> -    required:
> -      - reg
> -      - clocks
> -      - "#clock-cells"
> -      - clock-output-names
> -      - "#phy-cells"
> -
> -    additionalProperties: false
> -
> -required:
> -  - compatible
> -  - reg
> -  - "#address-cells"
> -  - "#size-cells"
> -  - ranges
> -  - clocks
> -  - clock-names
> -  - resets
> -  - reset-names
> -  - vdda-phy-supply
> -  - vdda-pll-supply
> -
> -additionalProperties: false
> -
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sc7180-qmp-usb3-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 4
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: cfg_ahb
> -            - const: ref
> -            - const: com_aux
> -        resets:
> -          maxItems: 1
> -        reset-names:
> -          items:
> -            - const: phy
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sdm845-qmp-usb3-uni-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 4
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: cfg_ahb
> -            - const: ref
> -            - const: com_aux
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy
> -            - const: common
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,ipq8074-qmp-usb3-phy
> -              - qcom,msm8996-qmp-usb3-phy
> -              - qcom,msm8998-qmp-usb3-phy
> -              - qcom,sdx55-qmp-usb3-uni-phy
> -              - qcom,sdx65-qmp-usb3-uni-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 3
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: cfg_ahb
> -            - const: ref
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy
> -            - const: common
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sm8150-qmp-usb3-phy
> -              - qcom,sm8150-qmp-usb3-uni-phy
> -              - qcom,sm8250-qmp-usb3-uni-phy
> -              - qcom,sm8350-qmp-usb3-uni-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 4
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: ref_clk_src
> -            - const: ref
> -            - const: com_aux
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy
> -            - const: common
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sm8250-qmp-usb3-phy
> -              - qcom,sm8350-qmp-usb3-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 3
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: ref_clk_src
> -            - const: com_aux
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy
> -            - const: common
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,qcm2290-qmp-usb3-phy
> -              - qcom,sm6115-qmp-usb3-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 3
> -        clock-names:
> -          items:
> -            - const: cfg_ahb
> -            - const: ref
> -            - const: com_aux
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy_phy
> -            - const: phy
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sdm845-qmp-usb3-phy
> -              - qcom,sm8150-qmp-usb3-phy
> -              - qcom,sm8350-qmp-usb3-phy
> -              - qcom,sm8450-qmp-usb3-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX lane 1
> -                - description: RX lane 1
> -                - description: PCS
> -                - description: TX lane 2
> -                - description: RX lane 2
> -                - description: PCS_MISC
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,msm8998-qmp-usb3-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX lane 1
> -                - description: RX lane 1
> -                - description: PCS
> -                - description: TX lane 2
> -                - description: RX lane 2
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,ipq6018-qmp-usb3-phy
> -              - qcom,ipq8074-qmp-usb3-phy
> -              - qcom,qcm2290-qmp-usb3-phy
> -              - qcom,sc7180-qmp-usb3-phy
> -              - qcom,sc8180x-qmp-usb3-phy
> -              - qcom,sdx55-qmp-usb3-uni-phy
> -              - qcom,sdx65-qmp-usb3-uni-phy
> -              - qcom,sm6115-qmp-usb3-phy
> -              - qcom,sm8150-qmp-usb3-uni-phy
> -              - qcom,sm8250-qmp-usb3-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX
> -                - description: RX
> -                - description: PCS
> -                - description: PCS_MISC
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,msm8996-qmp-usb3-phy
> -              - qcom,sm8250-qmp-usb3-uni-phy
> -              - qcom,sm8350-qmp-usb3-uni-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX
> -                - description: RX
> -                - description: PCS
> -
> -examples:
> -  - |
> -    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> -    usb_2_qmpphy: phy-wrapper@88eb000 {
> -        compatible = "qcom,sdm845-qmp-usb3-uni-phy";
> -        reg = <0x088eb000 0x18c>;
> -        #address-cells = <1>;
> -        #size-cells = <1>;
> -        ranges = <0x0 0x088eb000 0x2000>;
> -
> -        clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK >,
> -                 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> -                 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> -                 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
> -        clock-names = "aux", "cfg_ahb", "ref", "com_aux";
> -
> -        resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
> -                 <&gcc GCC_USB3_PHY_SEC_BCR>;
> -        reset-names = "phy", "common";
> -
> -        vdda-phy-supply = <&vdda_usb2_ss_1p2>;
> -        vdda-pll-supply = <&vdda_usb2_ss_core>;
> -
> -        usb_2_ssphy: phy@200 {
> -                reg = <0x200 0x128>,
> -                      <0x400 0x1fc>,
> -                      <0x800 0x218>,
> -                      <0x600 0x70>;
> -
> -                clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
> -
> -                #clock-cells = <0>;
> -                clock-output-names = "usb3_uni_phy_pipe_clk_src";
> -
> -                #phy-cells = <0>;
> -            };
> -        };
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index 16fce1038285..29a417fb7af1 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -16,20 +16,37 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,ipq6018-qmp-usb3-phy
> +      - qcom,ipq8074-qmp-usb3-phy
> +      - qcom,msm8996-qmp-usb3-phy
> +      - qcom,msm8998-qmp-usb3-phy
> +      - qcom,qcm2290-qmp-usb3-phy
> +      - qcom,sc7180-qmp-usb3-phy
> +      - qcom,sc8180x-qmp-usb3-phy
>        - qcom,sc8280xp-qmp-usb3-uni-phy
> +      - qcom,sdm845-qmp-usb3-phy
> +      - qcom,sdm845-qmp-usb3-uni-phy
> +      - qcom,sdx55-qmp-usb3-uni-phy
> +      - qcom,sdx65-qmp-usb3-uni-phy
> +      - qcom,sm6115-qmp-usb3-phy
> +      - qcom,sm8150-qmp-usb3-phy
> +      - qcom,sm8150-qmp-usb3-uni-phy
> +      - qcom,sm8250-qmp-usb3-phy
> +      - qcom,sm8250-qmp-usb3-uni-phy
> +      - qcom,sm8350-qmp-usb3-phy
> +      - qcom,sm8350-qmp-usb3-uni-phy
> +      - qcom,sm8450-qmp-usb3-phy
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 5
>  
>    clock-names:
> -    items:
> -      - const: aux
> -      - const: ref
> -      - const: com_aux
> -      - const: pipe
> +    minItems: 4
> +    maxItems: 5
>  
>    power-domains:
>      maxItems: 1
> @@ -38,9 +55,7 @@ properties:
>      maxItems: 2
>  
>    reset-names:
> -    items:
> -      - const: phy
> -      - const: phy_phy
> +    maxItems: 2
>  
>    vdda-phy-supply: true
>  
> @@ -60,7 +75,6 @@ required:
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains
>    - resets
>    - reset-names
>    - vdda-phy-supply
> @@ -71,6 +85,179 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: com_aux
> +            - const: pipe
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          items:
> +            - const: phy

This is just a subset of the next entrie's resets and could possibly be
merged.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: pipe
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: phy_phy
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: com_aux
> +            - const: pipe
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common

Is this really a DP-USB phy? Then it does not belong in this schema,
otherwise the phy name looks wrong.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-qmp-usb3-phy
> +              - qcom,msm8996-qmp-usb3-phy
> +              - qcom,msm8998-qmp-usb3-phy
> +              - qcom,sdx55-qmp-usb3-uni-phy
> +              - qcom,sdx65-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
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

Same here.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8150-qmp-usb3-phy
> +              - qcom,sm8150-qmp-usb3-uni-phy
> +              - qcom,sm8250-qmp-usb3-uni-phy
> +              - qcom,sm8350-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref_clk_src

As we've discussed before, this clock does not belong in the binding and
this should definitely not be reproduced in the new one.

> +            - const: ref
> +            - const: com_aux
> +            - const: pipe
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8250-qmp-usb3-phy
> +              - qcom,sm8350-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref_clk_src

Same here, was this supposed to be ref?

> +            - const: com_aux
> +            - const: pipe
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common

Another combo PHY?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcm2290-qmp-usb3-phy
> +              - qcom,sm6115-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: com_aux
> +            - const: pipe
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy_phy
> +            - const: phy

You should be able to get rid of most of the above by looking at the
various platforms and recognising that there are just two sets of
clocks, and probably just two sets of resets where one is a subset of
the other.

As you're introducing a new binding this should all be fixed here and
now rather than do another quick hack.

And if you don't have the time and motivation to fix this up now, then
it's better to leave the old half-broken bindings where they are for
now.

> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
> @@ -100,3 +287,32 @@ examples:
>  
>        #phy-cells = <0>;
>      };
> +  - |
> +    #define GCC_USB3_SEC_CLKREF_CLK       156
> +    #define GCC_USB_PHY_CFG_AHB2PHY_CLK   161
> +
> +    phy@88eb000 {
> +        compatible = "qcom,sdm845-qmp-usb3-uni-phy";
> +        reg = <0x088eb000 0x18c>;
> +
> +        clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK >,
> +                 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> +                 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
> +                 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
> +        clock-names = "aux", "cfg_ahb", "ref", "com_aux", "pipe";
> +
> +        resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
> +                 <&gcc GCC_USB3_PHY_SEC_BCR>;
> +        reset-names = "phy", "common";

It looks like these resets should have been named 'phy_phy' and 'phy'
(and order reversed).

> +
> +        vdda-phy-supply = <&vdda_usb2_ss_1p2>;
> +        vdda-pll-supply = <&vdda_usb2_ss_core>;
> +
> +

Stray newline.

> +        #clock-cells = <0>;
> +        clock-output-names = "usb3_uni_phy_pipe_clk_src";
> +
> +        #phy-cells = <0>;
> +    };

But what is the purpose of adding this example? It looks essentially the
same as the current one and is thus redundant.

> +...

Johan
