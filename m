Return-Path: <linux-arm-msm+bounces-34046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0959C999D9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AC831C203E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C4E20899B;
	Fri, 11 Oct 2024 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwW1ZoVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CC920721D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630897; cv=none; b=djrJD53ZtnHyyxOOGVIpX/hd1Cx77W0W8PcDmtvsHtBQkNDvS78dUpVPPTV5p/adFDELACG3sR/7Q6OU6jHxfHQvAh6TvkQ+VxCZWSzw3LiPJXItJ5skhMOmcBWCPwlXgjcGywny53eI7iGMO47bnfSiI63IKIDIOBxdVQYuljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630897; c=relaxed/simple;
	bh=mWkqLAfaF9iejDfisKHhbsIOBq/70ZXRB4fKgfKXN40=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cy63ytAnbH5/nMhOnaKdQRts+J0gr+DmJev/7rhSkEUXLMpicBnlmFEpkCfGO3qBgM6LYKa5vF7GrGI190YYmpsf2kCImeEiaDzVImNmNGYNnSZ4TwDA9KIiFFX8saKkZdxX2c4yqjIARYy9SOA0YuFiW96sMAvK2tK1hqP39bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwW1ZoVz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398cbab46cso172714e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728630894; x=1729235694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZK7ae0vS67lOfg1e9nrTDJlKMyW88XZtxlWgkOFzMI=;
        b=JwW1ZoVzCRO83S0cXzVLYIxBw2HGo3kcfwaMQI5Xt5yrAAq1NVD/xY6T3XpEFwyTC9
         EpMVOr5g84KomhyiomC/YPr9PRu9l4zMhMcUU4FllMnavZKK+S4vhRHItMEYntBo3zRI
         PJwU5RWFDxcFky79oKt9kyYTfW4xj+7XLWh0w+C88erw2dqgV2hjwUAGF7gpGf5S7vXa
         5+0HXOMOZ48tVHNxCRqBqeUVVtBRDMJpAhWCk2IKb9jVLySFjWq09heHFQudRUOhSmJa
         DMDeM6eAGknsBhadRQVIpRZln7Vcc0oa+/AhgnW2hnqYG9I6G7NfS3q64muJ82Vv4uPY
         XOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630894; x=1729235694;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZK7ae0vS67lOfg1e9nrTDJlKMyW88XZtxlWgkOFzMI=;
        b=RsLs1xdlY17VpyzeF0DDeInPAFn/P+8FWg79rCwPXu5f92h6vCwBOkMbcN5dEQpM99
         4vjebnTMxF9HxgwjAJtrAW+e+VBhNxwIVPUSBlsO2HxhwPsxAPN5EYRWeoGEU/OznaSO
         rlKIJl4i+2IgZHiVPAITZcIXy6wZjYh5sjaNOy5/JkW+CDJE2trcca7OTPIpxvzwofYF
         gXs0jOyzyQcNQx0SePWYUP8AcEgipXQPIcNrI89l3xU2QNckZC5gT3YKha/90NKQTyv6
         5zpgVCP+1epNf4bAzMv84UmZMxCIphvWysqGHxbrfBzZNUBgbKWKUee3Z3zwYeGPUMz6
         6Ljg==
X-Forwarded-Encrypted: i=1; AJvYcCXrQRuj4Lv4CD/bMg02+kfXVf4SykCUk62/KuWHz17RG53Vv1TPx1GUDRxghrTiZ+fgMAGDgzvmzarwwS+5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5BxWkNbtgQe3JCHob42CNp4H6jeU1CFumsLlYdOgZaW+BRGup
	kiKD6F9LdJkjmSj169jzty7cLS4aq6Z93phZn/iFHjEe8u2RZQI2DJGqFC3rR7o=
X-Google-Smtp-Source: AGHT+IF0ESZci0ymYxZ6lnO3rMAGrq8ZlWndKx+H3wJ66Iss30yD1kAsWTnjaq1zn6UJaJ0sNx9CTw==
X-Received: by 2002:a2e:a595:0:b0:2fa:cf48:14a3 with SMTP id 38308e7fff4ca-2fb329afbe7mr1793981fa.7.1728630893885;
        Fri, 11 Oct 2024 00:14:53 -0700 (PDT)
Received: from [192.168.43.55] (85-76-116-253-nat.elisa-mobile.fi. [85.76.116.253])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb245799d5sm4309581fa.18.2024.10.11.00.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:14:52 -0700 (PDT)
Message-ID: <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
Date: Fri, 11 Oct 2024 10:14:49 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241011023724.614584-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Richard,

On 10/11/24 05:37, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
>   1 file changed, 318 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> new file mode 100644
> index 000000000000..670502532d28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SDM670 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sdm670-camss
> +
> +  reg:
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  clocks:
> +    maxItems: 22
> +
> +  clock-names:
> +    items:
> +      - const: gcc_camera_ahb
> +      - const: gcc_camera_axi
> +      - const: soc_ahb
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csi0
> +      - const: csi1
> +      - const: csi2
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +
> +  interrupts:
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY1.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY2.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - reg
> +  - reg-names
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@ac65000 {
> +            compatible = "qcom,sdm670-camss";
> +
> +            reg = <0 0x0acb3000 0 0x1000>,

This is immediately wrong, unit address shall be the same as the address of the
first value of reg property.

I still object to the sorting order of reg values dictated by reg-names property.

There are a few recently added CAMSS device tree binding descriptions, where
reg values are sorted by address values without a connection to another property
values, and I believe this is the correct way to go.

Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe from now on
it should be assumed that all subsequently added CAMSS IP descriptions to follow
the same established policy.

I vote for it.

> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acc8000 0 0x1000>,
> +                  <0 0x0ac65000 0 0x1000>,
> +                  <0 0x0ac66000 0 0x1000>,
> +                  <0 0x0ac67000 0 0x1000>,
> +                  <0 0x0acaf000 0 0x4000>,
> +                  <0 0x0acb6000 0 0x4000>,
> +                  <0 0x0acc4000 0 0x4000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe_lite";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite";
> +
> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAM_CC_SOC_AHB_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> +            clock-names = "gcc_camera_ahb",
> +                          "gcc_camera_axi",
> +                          "soc_ahb",
> +                          "camnoc_axi",
> +                          "cpas_ahb",
> +                          "csi0",
> +                          "csi1",
> +                          "csi2",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx";
> +
> +            iommus = <&apps_smmu 0x808 0x0>,
> +                     <&apps_smmu 0x810 0x8>,
> +                     <&apps_smmu 0xc08 0x0>,
> +                     <&apps_smmu 0xc10 0x8>;
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "top";
> +
> +            vdda-phy-supply = <&vreg_l1a_1p225>;
> +            vdda-pll-supply = <&vreg_l8a_1p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        clock-lanes = <7>;



> +                        data-lanes = <0 1 2 3>;
> +                        remote-endpoint = <&front_sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };

--
Best wishes,
Vladimir

