Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A1D1BE6EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 21:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgD2TGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 15:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727078AbgD2TGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 15:06:05 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E76C035494
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 12:06:05 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a32so1156061pje.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 12:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0ej7eO6xezytl/ixLAF23HOWuLN9CZlAmr/HkPLdgmU=;
        b=GGDHJj9bgiNlGj+2ph+cSE5NfReadrZdt/F8ox7Z5acHW02wQJya+JvuraYIdP8xe7
         QQibXfAGeQOsv3TW+mnN2pVCOeugdF4KSfc9mp+S8YlUR0i6BOVuG6eJMIBMlW8vPpos
         O6LjTutMiqi1dHkkSotRqCcYRAAef0DJj1PhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0ej7eO6xezytl/ixLAF23HOWuLN9CZlAmr/HkPLdgmU=;
        b=PQ9BoqWNJQvNQDw3Fu5sa3mKgILX5VC9cVg6K5Qu7T7tY/mlYaIhYq/fHiE71+70+Y
         G/l4zCqha3yPkbHppzUMMbWdWhQOin7Ai2DaraJmT9llmHnDKiXv5fw10c5AxF9S8c7B
         Qh/y/aYnNJBDF6VjI6jEfhrkJwoffjtc+LftmXoDztZfzb2a7YDstFKVSnofGQpco3uG
         bdS0wdG3hlZgRx9aCzBN+4+HR89UXWt7RH231JSKMYHiTsoa0Vbp8tff8l0Gm1bPhpv6
         nvNubkNwlVvI5rZLWisF7oKLeKqvkBOPid7+ii9L8An/2uzBDq1RuJwTNkbJWsRQyn7S
         n4Yg==
X-Gm-Message-State: AGi0PuZPTQG3IVGLJt4UB7x/YN6CLi5BdzbT6vTE2Gfn+bbAnZ+PAmfr
        vJvKkny8JQZkc2NHaHF7zo5t6A==
X-Google-Smtp-Source: APiQypLibexlLpc3KEYlgw0ToEgr1knuLpajMzcYRNfR79FYiu3XGFYHhXznbfajT9lgcwiEIX+Scg==
X-Received: by 2002:a17:902:9a82:: with SMTP id w2mr35233468plp.117.1588187164736;
        Wed, 29 Apr 2020 12:06:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id i15sm1576108pgj.30.2020.04.29.12.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 12:06:03 -0700 (PDT)
Date:   Wed, 29 Apr 2020 12:06:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: phy: qcom,qmp: Convert QMP PHY
 bindings to yaml
Message-ID: <20200429190602.GU4525@google.com>
References: <1588082775-19959-1-git-send-email-sanm@codeaurora.org>
 <1588082775-19959-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588082775-19959-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 28, 2020 at 07:36:12PM +0530, Sandeep Maheswaram wrote:
> Convert QMP PHY bindings to DT schema format using json-schema.

NACK (not sure if that carries any weight ;-)

v6 of this patch removes the binding of USB3 DP PHY during the conversion,
which is then added again as .yaml by "[2/4] dt-bindings: phy: qcom,qmp-usb3-dp:
Add dt bindings for USB3 DP PHY" (https://patchwork.kernel.org/patch/11514767/).
See my reply on that patch for what to do instead.

> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 311 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 242 ----------------
>  2 files changed, 311 insertions(+), 242 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> new file mode 100644
> index 0000000..7da2be6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -0,0 +1,311 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qmp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QMP PHY controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QMP phy controller supports physical layer functionality for a number of
> +  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,msm8996-qmp-pcie-phy
> +      - qcom,msm8996-qmp-ufs-phy
> +      - qcom,msm8996-qmp-usb3-phy
> +      - qcom,msm8998-qmp-pcie-phy
> +      - qcom,msm8998-qmp-ufs-phy
> +      - qcom,msm8998-qmp-usb3-phy
> +      - qcom,sdm845-qhp-pcie-phy
> +      - qcom,sdm845-qmp-pcie-phy
> +      - qcom,sdm845-qmp-ufs-phy
> +      - qcom,sdm845-qmp-usb3-uni-phy
> +      - qcom,sm8150-qmp-ufs-phy
> +
> +  reg:
> +    items:
> +      - description: Address and length of PHY's common serdes block.
> +
> +  "#clock-cells":
> +     enum: [ 1, 2 ]
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 3
> +
> +  vdda-phy-supply:
> +    description:
> +        Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +        Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  vddp-ref-clk-supply:
> +    description:
> +        Phandle to a regulator supply to any specific refclk
> +        pll block.
> +
> +#Required nodes:
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Each device node of QMP phy is required to have as many child nodes as
> +      the number of lanes the PHY has.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Phy aux clock.
> +            - description: Phy config clock.
> +            - description: 19.2 MHz ref clk.
> +            - description: Phy common block aux clock.
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: com_aux
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +            - description: phy common block reset.
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8996-qmp-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Phy aux clock.
> +            - description: Phy config clock.
> +            - description: 19.2 MHz ref clk.
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +            - description: phy common block reset.
> +            - description: phy's ahb cfg block reset.
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common
> +            - const: cfg
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8996-qmp-usb3-phy
> +              - qcom,msm8998-qmp-pcie-phy
> +              - qcom,msm8998-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Phy aux clock.
> +            - description: Phy config clock.
> +            - description: 19.2 MHz ref clk.
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +            - description: phy common block reset.
> +        reset-names:
> +          items:
> +             - const: phy
> +             - const: common
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8996-qmp-ufs-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: 19.2 MHz ref clk.
> +        clock-names:
> +          items:
> +            - const: ref
> +        resets:
> +          items:
> +            - description: PHY reset in the UFS controller.
> +        reset-names:
> +          items:
> +            - const: ufsphy
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8998-qmp-ufs-phy
> +              - qcom,sdm845-qmp-ufs-phy
> +              - qcom,sm8150-qmp-ufs-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: 19.2 MHz ref clk.
> +            - description: Phy reference aux clock.
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: ref_aux
> +        resets:
> +          items:
> +            - description: PHY reset in the UFS controller.
> +        reset-names:
> +          items:
> +            - const: ufsphy
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-qmp-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: pipe clk.
> +        clock-names:
> +          items:
> +            - const: pipe_clk
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +            - description: phy common block reset.
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-qhp-pcie-phy
> +              - qcom,sdm845-qmp-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Phy aux clock.
> +            - description: Phy config clock.
> +            - description: 19.2 MHz ref clk.
> +            - description: Phy refgen clk.
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg_ahb
> +            - const: ref
> +            - const: refgen
> +        resets:
> +          items:
> +            - description: reset of phy block.
> +        reset-names:
> +          items:
> +            - const: phy
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    usb_2_qmpphy: phy-wrapper@88eb000 {
> +        compatible = "qcom,sdm845-qmp-usb3-uni-phy";
> +        reg = <0 0x088eb000 0 0x18c>;
> +        #clock-cells = <1>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
> +                 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> +                 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
> +        clock-names = "aux", "cfg_ahb", "ref", "com_aux";
> +
> +        resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
> +                 <&gcc GCC_USB3_PHY_SEC_BCR>;
> +        reset-names = "phy", "common";
> +
> +        vdda-phy-supply = <&vdda_usb2_ss_1p2>;
> +        vdda-pll-supply = <&vdda_usb2_ss_core>;
> +
> +            usb_2_ssphy: phy@88eb200 {
> +                reg = <0 0x088eb200 0 0x128>,
> +                      <0 0x088eb400 0 0x1fc>,
> +                      <0 0x088eb800 0 0x218>,
> +                      <0 0x088eb600 0 0x70>;
> +                #clock-cells = <0>;
> +                #phy-cells = <0>;
> +                clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
> +                clock-names = "pipe0";
> +                clock-output-names = "usb3_uni_phy_pipe_clk_src";
> +            };
> +        };
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> deleted file mode 100644
> index 54d6f8d..0000000
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ /dev/null
> @@ -1,242 +0,0 @@
> -Qualcomm QMP PHY controller
> -===========================
> -
> -QMP phy controller supports physical layer functionality for a number of
> -controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> -
> -Required properties:
> - - compatible: compatible list, contains:
> -	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
> -	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
> -	       "qcom,msm8996-qmp-ufs-phy" for 14nm UFS phy on msm8996,
> -	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
> -	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
> -	       "qcom,msm8998-qmp-ufs-phy" for UFS QMP phy on msm8998,
> -	       "qcom,msm8998-qmp-pcie-phy" for PCIe QMP phy on msm8998,
> -	       "qcom,sdm845-qhp-pcie-phy" for QHP PCIe phy on sdm845,
> -	       "qcom,sdm845-qmp-pcie-phy" for QMP PCIe phy on sdm845,
> -	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
> -	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
> -	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
> -	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
> -
> -- reg:
> -  - index 0: address and length of register set for PHY's common
> -             serdes block.
> -  - index 1: address and length of the DP_COM control block (for
> -             "qcom,sdm845-qmp-usb3-phy" only).
> -
> -- reg-names:
> -  - For "qcom,sdm845-qmp-usb3-phy":
> -    - Should be: "reg-base", "dp_com"
> -  - For all others:
> -    - The reg-names property shouldn't be defined.
> -
> - - #address-cells: must be 1
> - - #size-cells: must be 1
> - - ranges: must be present
> -
> - - clocks: a list of phandles and clock-specifier pairs,
> -	   one for each entry in clock-names.
> - - clock-names: "cfg_ahb" for phy config clock,
> -		"aux" for phy aux clock,
> -		"ref" for 19.2 MHz ref clk,
> -		"com_aux" for phy common block aux clock,
> -		"ref_aux" for phy reference aux clock,
> -
> -		For "qcom,ipq8074-qmp-pcie-phy": no clocks are listed.
> -		For "qcom,msm8996-qmp-pcie-phy" must contain:
> -			"aux", "cfg_ahb", "ref".
> -		For "qcom,msm8996-qmp-ufs-phy" must contain:
> -			"ref".
> -		For "qcom,msm8996-qmp-usb3-phy" must contain:
> -			"aux", "cfg_ahb", "ref".
> -		For "qcom,msm8998-qmp-usb3-phy" must contain:
> -			"aux", "cfg_ahb", "ref".
> -		For "qcom,msm8998-qmp-ufs-phy" must contain:
> -			"ref", "ref_aux".
> -		For "qcom,msm8998-qmp-pcie-phy" must contain:
> -			"aux", "cfg_ahb", "ref".
> -		For "qcom,sdm845-qhp-pcie-phy" must contain:
> -			"aux", "cfg_ahb", "ref", "refgen".
> -		For "qcom,sdm845-qmp-pcie-phy" must contain:
> -			"aux", "cfg_ahb", "ref", "refgen".
> -		For "qcom,sdm845-qmp-usb3-phy" must contain:
> -			"aux", "cfg_ahb", "ref", "com_aux".
> -		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
> -			"aux", "cfg_ahb", "ref", "com_aux".
> -		For "qcom,sdm845-qmp-ufs-phy" must contain:
> -			"ref", "ref_aux".
> -		For "qcom,sm8150-qmp-ufs-phy" must contain:
> -			"ref", "ref_aux".
> -
> - - resets: a list of phandles and reset controller specifier pairs,
> -	   one for each entry in reset-names.
> - - reset-names: "phy" for reset of phy block,
> -		"common" for phy common block reset,
> -		"cfg" for phy's ahb cfg block reset,
> -		"ufsphy" for the PHY reset in the UFS controller.
> -
> -		For "qcom,ipq8074-qmp-pcie-phy" must contain:
> -			"phy", "common".
> -		For "qcom,msm8996-qmp-pcie-phy" must contain:
> -			"phy", "common", "cfg".
> -		For "qcom,msm8996-qmp-ufs-phy": must contain:
> -			"ufsphy".
> -		For "qcom,msm8996-qmp-usb3-phy" must contain
> -			"phy", "common".
> -		For "qcom,msm8998-qmp-usb3-phy" must contain
> -			"phy", "common".
> -		For "qcom,msm8998-qmp-ufs-phy": must contain:
> -			"ufsphy".
> -		For "qcom,msm8998-qmp-pcie-phy" must contain:
> -			"phy", "common".
> -		For "qcom,sdm845-qhp-pcie-phy" must contain:
> -			"phy".
> -		For "qcom,sdm845-qmp-pcie-phy" must contain:
> -			"phy".
> -		For "qcom,sdm845-qmp-usb3-phy" must contain:
> -			"phy", "common".
> -		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
> -			"phy", "common".
> -		For "qcom,sdm845-qmp-ufs-phy": must contain:
> -			"ufsphy".
> -		For "qcom,sm8150-qmp-ufs-phy": must contain:
> -			"ufsphy".
> -
> - - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
> - - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> -
> -Optional properties:
> - - vddp-ref-clk-supply: Phandle to a regulator supply to any specific refclk
> -			pll block.
> -
> -Required nodes:
> - - Each device node of QMP phy is required to have as many child nodes as
> -   the number of lanes the PHY has.
> -
> -Required properties for child nodes of PCIe PHYs (one child per lane):
> - - reg: list of offset and length pairs of register sets for PHY blocks -
> -	tx, rx, pcs, and pcs_misc (optional).
> - - #phy-cells: must be 0
> -
> -Required properties for a single "lanes" child node of non-PCIe PHYs:
> - - reg: list of offset and length pairs of register sets for PHY blocks
> -	For 1-lane devices:
> -		tx, rx, pcs, and (optionally) pcs_misc
> -	For 2-lane devices:
> -		tx0, rx0, pcs, tx1, rx1, and (optionally) pcs_misc
> - - #phy-cells: must be 0
> -
> -Required properties for child node of PCIe and USB3 qmp phys:
> - - clocks: a list of phandles and clock-specifier pairs,
> -	   one for each entry in clock-names.
> - - clock-names: Must contain following:
> -		 "pipe<lane-number>" for pipe clock specific to each lane.
> - - clock-output-names: Name of the PHY clock that will be the parent for
> -		       the above pipe clock.
> -	For "qcom,ipq8074-qmp-pcie-phy":
> -		- "pcie20_phy0_pipe_clk"	Pipe Clock parent
> -			(or)
> -		  "pcie20_phy1_pipe_clk"
> - - #clock-cells: must be 0
> -    - Phy pll outputs pipe clocks for pipe based PHYs. These clocks are then
> -      gate-controlled by the gcc.
> -
> -Required properties for child node of PHYs with lane reset, AKA:
> -	"qcom,msm8996-qmp-pcie-phy"
> - - resets: a list of phandles and reset controller specifier pairs,
> -	   one for each entry in reset-names.
> - - reset-names: Must contain following:
> -		 "lane<lane-number>" for reset specific to each lane.
> -
> -Example:
> -	phy@34000 {
> -		compatible = "qcom,msm8996-qmp-pcie-phy";
> -		reg = <0x34000 0x488>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> -			<&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
> -			<&gcc GCC_PCIE_CLKREF_CLK>;
> -		clock-names = "aux", "cfg_ahb", "ref";
> -
> -		vdda-phy-supply = <&pm8994_l28>;
> -		vdda-pll-supply = <&pm8994_l12>;
> -
> -		resets = <&gcc GCC_PCIE_PHY_BCR>,
> -			<&gcc GCC_PCIE_PHY_COM_BCR>,
> -			<&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>;
> -		reset-names = "phy", "common", "cfg";
> -
> -		pciephy_0: lane@35000 {
> -			reg = <0x35000 0x130>,
> -				<0x35200 0x200>,
> -				<0x35400 0x1dc>;
> -			#clock-cells = <0>;
> -			#phy-cells = <0>;
> -
> -			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
> -			clock-names = "pipe0";
> -			clock-output-names = "pcie_0_pipe_clk_src";
> -			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
> -			reset-names = "lane0";
> -		};
> -
> -		pciephy_1: lane@36000 {
> -		...
> -		...
> -	};
> -
> -	phy@88eb000 {
> -		compatible = "qcom,sdm845-qmp-usb3-uni-phy";
> -		reg = <0x88eb000 0x18c>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
> -			 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> -			 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> -			 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
> -		clock-names = "aux", "cfg_ahb", "ref", "com_aux";
> -
> -		resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
> -			 <&gcc GCC_USB3_PHY_SEC_BCR>;
> -		reset-names = "phy", "common";
> -
> -		lane@88eb200 {
> -			reg = <0x88eb200 0x128>,
> -			      <0x88eb400 0x1fc>,
> -			      <0x88eb800 0x218>,
> -			      <0x88eb600 0x70>;
> -			#clock-cells = <0>;
> -			#phy-cells = <0>;
> -			clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
> -			clock-names = "pipe0";
> -			clock-output-names = "usb3_uni_phy_pipe_clk_src";
> -		};
> -	};
> -
> -	phy@1d87000 {
> -		compatible = "qcom,sdm845-qmp-ufs-phy";
> -		reg = <0x1d87000 0x18c>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -		clock-names = "ref",
> -			      "ref_aux";
> -		clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
> -			 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> -
> -		lanes@1d87400 {
> -			reg = <0x1d87400 0x108>,
> -			      <0x1d87600 0x1e0>,
> -			      <0x1d87c00 0x1dc>,
> -			      <0x1d87800 0x108>,
> -			      <0x1d87a00 0x1e0>;
> -			#phy-cells = <0>;
> -		};
> -	};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
