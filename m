Return-Path: <linux-arm-msm+bounces-29073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6669581DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511F8283DB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 09:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A8918B496;
	Tue, 20 Aug 2024 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUEAPxSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1B18A955
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145355; cv=none; b=PSX4kn1dOJ8OxEDnjGYzDoYRIitn9mC5Al66oiRVm7QDzKNedRkj7Kpf1k/4QyAlnpJY+8U4iBonORrALBtcy5ubv2VSeQB5BU8N878ApQBjGi10OSf5IBE1b8ZEvGS9Jx6+ehdX+oOudOqEI3XbLGBVnprqUrS5vKPfIZr4Ta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145355; c=relaxed/simple;
	bh=rwaQz3BKiBGVuSAWQ2ZcF9Lf9lCZhThLyWQteoblgrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y4I5cg/9PvX5ozZhYKDBVDn44fY65mEU4XtmuZ66xbrGYMlMsAZxCn+LMFKVAcxBj7EF9WOoHxXJ+Fpca5UkW975Bf0QTI644KJWJj0pRLRiy1zMrE4ZkjMW4VHyRwv1Y40rKQgAkpxiQUhkd9Kq0fVQAEpdZobRniZA0MoVOE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUEAPxSE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-533446e53b5so53336e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724145351; x=1724750151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrMn7CdPTrUtR7mBJzGNqTeAsOaGVFLncwafAGHWucQ=;
        b=SUEAPxSE7xyeHNDjvpbugWNNGpCJUiCOXAHQhY4FBM3IFXR39LwyNGXw7gJMDhtjE+
         LznmB2DsgtTkz7/xD76m03qmdOQ+FiYzceYMk2MNwkv5XgNRTCuTIhA6ZTihqcL8+PEH
         0tZgc9Hr2ZCW5Gtstec+SfdTXQ+P92vhesX2E1LaGrr8jFvZmpLskFD/oqDAn7q1D/IK
         MZJexxIsTcsYrTRlX/DKo/YtlvIZAxnhWuni0BF6aGruo54OKFxM/mGsQMKpum6N2TJe
         FfS00glW+BwWgNTLUIXq3n0ouF1miUiP6WdJbZ7P8nFla9W9sipaXhofk4WXtjEyEOFG
         5J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724145351; x=1724750151;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrMn7CdPTrUtR7mBJzGNqTeAsOaGVFLncwafAGHWucQ=;
        b=rkzS9bN0LxDbC/4kLxnTKA3elD2rCd502jlVPVjgc222aWvpo2dyEpKx15tBsbiLgp
         phZs9JthyxDVfDD6n/FCDkc3xf7fYQP2J4vKWvg47kq+/BqxVCc0c1hofzgmnaubGwO0
         JP09+RwR4bPDDvRZhmKgyGuIRcxm4G2SDoXFltCG0ruX282c7101+TOKCCMfHD3I/Rgh
         R9hhxcRbukGJ0GyM46I5Y7m8C6MiS3OdQCqnKrmmRr+7orDtTjb0DDhiPI5aNAyGaIXn
         UTEJLm8LD0+N3s1Tubt9XNxHIrbswkYYRSvGPtFHdVmsJVzz7H4Cj8U7WpbKiobIkVzB
         Qlyg==
X-Forwarded-Encrypted: i=1; AJvYcCV8T2N+7lQv+pUKgZSLBYcd4GQ3DxQUqd5h0jUi99+H0/wcp+UUIlLjprvdY225NJ8SpX1iPo0oULKAATUs@vger.kernel.org
X-Gm-Message-State: AOJu0YzhkrELtmbThLOXM9xOg12pac9djEvN+DZegMuUD59s39jdBFvu
	xFYoIIWPA4lQnmVZ4L9rgS3AfmtrxPUzJmux0t2Bm8R7Z21nXSEHrTRRb2Gh/m8=
X-Google-Smtp-Source: AGHT+IF+TpfTDXx1EeW9kg9C7oLZhNIk1YVVwLG5PhQWyckkYSJaCx4y8/Yeg26WOWhCaBB15fIbFQ==
X-Received: by 2002:a05:6512:10c2:b0:52f:287:a083 with SMTP id 2adb3069b0e04-5331c61d5e3mr5593813e87.0.1724145350746;
        Tue, 20 Aug 2024 02:15:50 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3b8c4asm1713625e87.74.2024.08.20.02.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:15:50 -0700 (PDT)
Message-ID: <3b3774de-3aeb-4a58-8c0e-e494a2f2aaf8@linaro.org>
Date: Tue, 20 Aug 2024 12:15:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-9-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240819221051.31489-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

On 8/20/24 01:10, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/qcom,sdm670-camss.yaml     | 319 ++++++++++++++++++
>   1 file changed, 319 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> new file mode 100644
> index 000000000000..5789cf66a516
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -0,0 +1,319 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
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
> +  clocks:

Please add

minItems: 22

> +    maxItems: 22> +
> +  clock-names:
> +    items:
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
> +      - const: gcc_camera_ahb
> +      - const: gcc_camera_axi
> +      - const: soc_ahb
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

Please add

minItems: 9

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

Please add

minItems: 4

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
> +  reg:

Please add

minItems: 9

> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: csid0
> +      - const: vfe1
> +      - const: csid1
> +      - const: vfe_lite
> +      - const: csid2

Additionally I would suggest to put descriptions of 'reg' and 'reg-names'
properties right after 'compatible' one, this is in accordance to DTS Coding Style.

> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>

Okay.

> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@ac65000 {
> +            compatible = "qcom,sdm670-camss";
> +
> +            reg = <0 0x0ac65000 0 0x1000>,
> +                  <0 0x0ac66000 0 0x1000>,
> +                  <0 0x0ac67000 0 0x1000>,
> +                  <0 0x0acaf000 0 0x4000>,
> +                  <0 0x0acb3000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x4000>,
> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acc4000 0 0x4000>,
> +                  <0 0x0acc8000 0 0x1000>;
> +            reg-names = "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "vfe0",
> +                        "csid0",
> +                        "vfe1",
> +                        "csid1",
> +                        "vfe_lite",
> +                        "csid2";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
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
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
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
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAM_CC_SOC_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> +            clock-names = "camnoc_axi",
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
> +                          "gcc_camera_ahb",
> +                          "gcc_camera_axi",
> +                          "soc_ahb",
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

