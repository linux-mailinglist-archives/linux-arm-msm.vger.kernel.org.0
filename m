Return-Path: <linux-arm-msm+bounces-54702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF65CA93334
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3C82175CAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4DC26A08C;
	Fri, 18 Apr 2025 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkOUrKN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB8A269817
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960088; cv=none; b=kPZh4zsgNyulE7laV6RK/SBqjU9KlnK57KJmpEJ57hI4wnptAmrJjwtjC16z9TVpdWLWfLv8uaoHboSDINbvZP558lQFW2bU9tTEqOtUczMfkTxAqjsSzcdqSIPRD1TQFRtxHwFxAR09SqzBeVrKzG4dy2XPKMrfFlGut/cqRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960088; c=relaxed/simple;
	bh=MjTcnivbppFuWDxiJMyMXQle7rxti96tn0uQEqxDf6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H54QfIchpDd6DACX2awY2e9RDv7NwzVpdF+U/oDfF8HxlXtiT1sMV+eRu+QJWzGH9Xrra619kjvGdo7+Mt7RMFb4CrCP+uR/F41hvS1FUuBjdOSHO/dwbJz/2DbNSyLX4z5pTU48Is6qc0uA955MEyzfAmNT4UH0y+uqjkE2zHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkOUrKN6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1028006f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744960084; x=1745564884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWjp8y8vFcOu+OSEBcB4uctMZzi0CJU4vWPxTMamQ/Q=;
        b=lkOUrKN6oVbIv4nKYBD0yYQiDqytiez2cv5X5pNkwD+jLIdkNe5VWDJSEj5Bbo/hzR
         RMAIVwIkNLCWs9f9HRkBKJn7Y6GreRx+gVhi/ETP+NYDCiv7mr1Um9nAix9RxFncAWaM
         cZv18m6IIQK2Vd5Gex+iMHJoJhC5O1nN42TE8zeq+4grNQzCmhBM96eQSWa7P/fR4BsA
         MG7Ojemy8dSeAf2ZaJc+lxPN8roJ7/4jIkdggytmn0+j34Ll45zYMwWUIBkUwbJHCymD
         5UZ6Ef7qoJw0Me2MW7QjonJZdE6CC54f5bjsvjBVfl5mJerGd51RYDQRZePHZgehklsa
         pjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960084; x=1745564884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWjp8y8vFcOu+OSEBcB4uctMZzi0CJU4vWPxTMamQ/Q=;
        b=ZnhaT/7GeLB4FNQbl9kFBQ9AVpOk2eyXWbT6QMcK+TMHJdlZ+gPsVma1Cp3MlO+b/R
         G7+LJI8cubWDJbAvsIpOLZL09ud7mnhzcU3fWA/vvY8D3IzypR3OaMNAoij172WiQ6Hc
         Ok7c60zF+sY+sa+lQC0KrLyaCj6Um+GI7LSnW7TFhxY+GhcVuARLadiNpvHJqu95Abo2
         4H81z5ypqf8TLFyMCTx/BLv3++Kbzrr+B3JB6qUjuDgcNz4tbJ5tazN2TI10WdcovKKd
         oUShhxlCarwRL79Amt+Gu39L4yXb+p0LpK8PwM8ZWnxCcGg7P9QHmwfEwazjdCjnGgmb
         Oj0A==
X-Gm-Message-State: AOJu0YxqoHxQbbF3Lyxdu4/RL3ym805wtd79xYYN8jZa1BChEqmkq+Ug
	8jxh7B4xrS6ebfpPXDT12ItK3gZ2i9U7AdPGA9DdH8BlEenPRhsD7PO3+Pp1QTQ=
X-Gm-Gg: ASbGnctHFIXCt5ZX6lvLq/cSnBer92LX5mUjZjiJblsGQLF7WYrIXKcXCrOxjFNnPtO
	qanSOIy6veGGeW3ZBQtj8k6YEX/EP01tbzfiJq5OnHXBiBYPtGWrKI490DJDnsm6pQvlxR10MrN
	RnoZnryWkgbOqhu8EEuULHQVfbA9xgPhj6ve3/4KAafhG3iGAo59ArVVBmXmt75fvRDBNyn9JlG
	sHfg5r3kQ17HgSyh0jzT02rHFIGxhNdWSXgGwUTdWecxP8su+03w7d6uLu7qRikEG8G4pZUAmYb
	BJfU3kGryK8kYnVDIUOszkAvQkCr+XEtuval63cpSTvvHFoTtwMSH8mSFqJ/+r1aK68+Qhk2pmD
	Q0DQ1OQ==
X-Google-Smtp-Source: AGHT+IGnTH5vOZF2u4It+TIDbYVDJ9lOX/4CXNAQQY4+Sw+Dr3UKWjzq+JbcKdHZOf/M/NXavbawLA==
X-Received: by 2002:a05:6000:40df:b0:39c:1401:679c with SMTP id ffacd0b85a97d-39efba4e291mr1224722f8f.21.1744960083940;
        Fri, 18 Apr 2025 00:08:03 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43315esm1856612f8f.26.2025.04.18.00.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 00:08:03 -0700 (PDT)
Message-ID: <ae4492fe-1b1b-444e-a4f3-4b99258a1ee0@linaro.org>
Date: Fri, 18 Apr 2025 08:08:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: camss: Add
 qcom,qcm2290-camss binding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
 <20250417145819.626733-6-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250417145819.626733-6-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/2025 15:58, Loic Poulain wrote:
> Add bindings for qcom,qcm2290-camss in order to support the camera
> subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,qcm2290-camss.yaml    | 261 ++++++++++++++++++
>   1 file changed, 261 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> new file mode 100644
> index 000000000000..1af6ed298c66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Loic Poulain <loic.poulain@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-camss
> +
> +  reg:
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: tpg0
> +      - const: tpg1
> +      - const: top
> +
> +  clocks:
> +    maxItems: 15
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: axi
> +      - const: top_ahb
> +      - const: csi0
> +      - const: csi1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe0_cphy_rx
> +      - const: vfe1_cphy_rx
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +
> +  interrupts:
> +    maxItems: 8
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: tpg0
> +      - const: tpg1
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to CAMSS refclk pll block.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.

patternProperties would be nicer here

https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml?ref_type=heads#L129

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - vdda-phy-supply
> +  - vdda-pll-supply

Similarly we are looking for the voltage level on these rails as part of 
the name.

https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml?ref_type=heads#L173

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@5c6e000 {
> +            compatible = "qcom,qcm2290-camss";
> +
> +            reg = <0 0x5c6e000 0 0x1000>,
> +                  <0 0x5c75000 0 0x1000>,
> +                  <0 0x5c52000 0 0x1000>,
> +                  <0 0x5c53000 0 0x1000>,
> +                  <0 0x5c6f000 0 0x4000>,
> +                  <0 0x5c76000 0 0x4000>,
> +                  <0 0x5c66000 0 0x400>,
> +                  <0 0x5c68000 0 0x400>,
> +                  <0 0x5c11000 0 0x1000>;

Recent guidance is for <0x0 0x5c11000 0x0 0x1000> i.e. using hex for 
both values instead of mixing base 10 and base 16.

> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "vfe0",
> +                        "vfe1",
> +                        "tpg0",
> +                        "tpg1",

csitpg0,
csitpg1

alphabetise the regs by name too please

https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml?ref_type=heads#L213

https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml?ref_type=heads

> +                        "top";
> +
> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMSS_AXI_CLK>,
> +                     <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
> +                     <&gcc GCC_CAMSS_CPHY_0_CLK>,
> +                     <&gcc GCC_CAMSS_CPHY_1_CLK>,
> +                     <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_0_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_1_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>,
> +                     <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +                     <&gcc GCC_CAMSS_RT_AXI_CLK>;
> +            clock-names = "ahb",
> +                          "axi",
> +                          "top_ahb",
> +                          "csi0",
> +                          "csi1",
> +                          "csiphy0",
> +                          "csiphy1",
> +                          "csiphy0_timer",
> +                          "csiphy1_timer",
> +                          "vfe0",
> +                          "vfe1",
> +                          "vfe0_cphy_rx",
> +                          "vfe1_cphy_rx",
> +                          "camnoc_nrt_axi",
> +                          "camnoc_rt_axi";

here too

> +
> +            interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "vfe0",
> +                              "vfe1",
> +                              "tpg0",
> +                              "tpg1";
> +
> +            interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +                             &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +                            <&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
> +                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> +                            <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc";
> +
> +            iommus = <&apps_smmu 0x400 0x0>,
> +                     <&apps_smmu 0x800 0x0>,
> +                     <&apps_smmu 0x820 0x0>,
> +                     <&apps_smmu 0x840 0x0>;
> +
> +            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +            vdda-phy-supply = <&pm4125_l5>;
> +            vdda-pll-supply = <&pm4125_l13>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
---bod

