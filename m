Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2BE5B20C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbiIHOin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbiIHOim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:38:42 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2275C46637
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:38:40 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id z23so20191635ljk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zhDS9KW7sHnj2SLt+jmcaCzMtxvUOZtFt25clbGHtkY=;
        b=fUundy2rLCNtVjL2ivpaZrq0KS9s4lvGmQUzywYHHgCLaXfAPbOHWd9FVCy2ktr25d
         odNznrQiMl8TqKL03Fa4DGvcJXprQk22h+zOpAMReZ0CTjpWkTQxrIfSFkfRvx9LHvgP
         lKcZw4uhVvG3YLYYRJfAT2ht2AKcH9WAKomYAHYX0hECQE+xJ4VrM8G7MtvjqLoZIBYG
         oxxnBDhXODk1bd6XBj2UHYvwSq4GkepYvwtofh6/9gzYS/k4+9yRwmdk8QDu99mL9tmi
         4gYUJOcy8Wm5wb0nHfgh18Nua4r38r6ngIr0XdXRyCBsVih38CyhNh3nsJlIGwbMcCVJ
         ZmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zhDS9KW7sHnj2SLt+jmcaCzMtxvUOZtFt25clbGHtkY=;
        b=fnUv5MbjVUadO5lzJQLQf2HeEdn2G2K2kZJCzNwnWu64HZVxX01PUrO9W3GZpIvXU/
         +2jqw0cJRtbjWO9eybJyJaff19WboN8NdoUxxmQjSXNMRsSx3OJtgcBi7I0VF/pp419z
         EP5cbK1OHOUQUItZXHA7JMfFyUp91qlc2XtAYqD2AYK8a4YmNfIoMo6/QRpZiYvOamXU
         xuz5hkxdybzvTKYVYVRSW5qMP1U0p8cIehblUg+6J5MplRUe3yS9XZhbI5wSC8VV/pZQ
         sif3zH4Gy9Vm/kmbmI7bQVyETCHclgyUv8IpD/MadeUp+bQUlC3Sxow8O7rvumHRo1Ga
         HAQQ==
X-Gm-Message-State: ACgBeo1r66iF49+RfBZ/5PaRLuPYoDRMtv/Fp60yx6LckyByoipSBfdI
        0fgGm184cTD6GFw9ZKQMzxuHpQ==
X-Google-Smtp-Source: AA6agR5vzAdc+cJBeuLjAIRqX7VvNEKr+wlj1jiYaG17K2Q5ux+bjEGvv33Sp1ddDP7w0YhErAgaOA==
X-Received: by 2002:a2e:a549:0:b0:25f:e5b8:a826 with SMTP id e9-20020a2ea549000000b0025fe5b8a826mr2714575ljn.207.1662647917912;
        Thu, 08 Sep 2022 07:38:37 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m9-20020a056512358900b004979df1c1fasm1582163lfr.61.2022.09.08.07.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:38:37 -0700 (PDT)
Message-ID: <dcf449f5-ad28-d262-98d5-72c6ba2b7aea@linaro.org>
Date:   Thu, 8 Sep 2022 16:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dt-bindings: net: qcom,ethqos: Convert bindings to
 yaml
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
References: <20220907204924.2040384-1-bhupesh.sharma@linaro.org>
 <20220907204924.2040384-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907204924.2040384-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 22:49, Bhupesh Sharma wrote:
> Convert Qualcomm ETHQOS Ethernet devicetree binding to YAML.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> ---
>  .../devicetree/bindings/net/qcom,ethqos.txt   |  66 ---------
>  .../devicetree/bindings/net/qcom,ethqos.yaml  | 139 ++++++++++++++++++

You need to update maintainers - old path.

>  2 files changed, 139 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
>  create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.txt b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
> deleted file mode 100644
> index 1f5746849a71..000000000000
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Qualcomm Ethernet ETHQOS device
> -
> -This documents dwmmac based ethernet device which supports Gigabit
> -ethernet for version v2.3.0 onwards.
> -
> -This device has following properties:
> -
> -Required properties:
> -
> -- compatible: Should be one of:
> -		"qcom,qcs404-ethqos"
> -		"qcom,sm8150-ethqos"
> -
> -- reg: Address and length of the register set for the device
> -
> -- reg-names: Should contain register names "stmmaceth", "rgmii"
> -
> -- clocks: Should contain phandle to clocks
> -
> -- clock-names: Should contain clock names "stmmaceth", "pclk",
> -		"ptp_ref", "rgmii"
> -
> -- interrupts: Should contain phandle to interrupts
> -
> -- interrupt-names: Should contain interrupt names "macirq", "eth_lpi"
> -
> -Rest of the properties are defined in stmmac.txt file in same directory
> -
> -
> -Example:
> -
> -ethernet: ethernet@7a80000 {
> -	compatible = "qcom,qcs404-ethqos";
> -	reg = <0x07a80000 0x10000>,
> -		<0x07a96000 0x100>;
> -	reg-names = "stmmaceth", "rgmii";
> -	clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
> -	clocks = <&gcc GCC_ETH_AXI_CLK>,
> -		<&gcc GCC_ETH_SLAVE_AHB_CLK>,
> -		<&gcc GCC_ETH_PTP_CLK>,
> -		<&gcc GCC_ETH_RGMII_CLK>;
> -	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> -			<GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -	interrupt-names = "macirq", "eth_lpi";
> -	snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
> -	snps,reset-active-low;
> -
> -	snps,txpbl = <8>;
> -	snps,rxpbl = <2>;
> -	snps,aal;
> -	snps,tso;
> -
> -	phy-handle = <&phy1>;
> -	phy-mode = "rgmii";
> -
> -	mdio {
> -		#address-cells = <0x1>;
> -		#size-cells = <0x0>;
> -		compatible = "snps,dwmac-mdio";
> -		phy1: phy@4 {
> -			device_type = "ethernet-phy";
> -			reg = <0x4>;
> -		};
> -	};
> -
> -};
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> new file mode 100644
> index 000000000000..f05df9b0d106
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device
> +
> +maintainers:
> +  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +
> +description:
> +  This binding describes the dwmmac based Qualcomm ethernet devices which
> +  support Gigabit ethernet (version v2.3.0 onwards).
> +
> +  So, this file documents platform glue layer for dwmmac stmmac based Qualcomm
> +  ethernet devices.
> +
> +allOf:
> +  - $ref: "snps,dwmac.yaml#"

No need for quotes.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs404-ethqos
> +      - qcom,sm8150-ethqos
> +
> +  reg: true

I think both devices use two reg spaces.

> +
> +  reg-names:
> +    minItems: 1

Why allowing only one item?

> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts: true

This should be specific/fixed.

> +
> +  interrupt-names: true

This should be specific/fixed.


> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4

Why such flexibility?

> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: stmmaceth
> +      - const: pclk
> +      - const: ptp_ref
> +      - const: rgmii
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 2

Aren't we using only one MMU?

> +
> +  mdio: true
> +
> +  phy-handle: true
> +
> +  phy-mode: true
> +
> +  snps,reset-gpio: true
> +
> +  snps,tso:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Enables the TSO feature otherwise it will be managed by MAC HW capability register.
> +
> +  power-domains: true
> +
> +  resets: true
> +
> +  rx-fifo-depth: true
> +
> +  tx-fifo-depth: true

You do not list all these properties, because you use
unevaluatedProperties. Drop all of these "xxx :true".
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names


Best regards,
Krzysztof
