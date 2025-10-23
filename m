Return-Path: <linux-arm-msm+bounces-78615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 009CCC0208E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 17:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 720EA4E61BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C57330B35;
	Thu, 23 Oct 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHoWth0I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B673D315766
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761232115; cv=none; b=b6ibp5IA7fqExgd58ofjkPHv3kPE4Dd/PXhAnHwcWiWjkO8odUeRH6rmoLzsPlsLAmAQVy91GV/0DQz4Bg0cMz+qCI3V1lGgy/XQBY3N1cCs2fw7g0R8sE7hjywkfYPaFqnqbMe1nctbq5VqkO0XqthkgfDBlU8eyQQjSHVSjOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761232115; c=relaxed/simple;
	bh=rZTWzREGkX784Q4awaY/bP7E3IXK6Bn5u+3yJGuiOLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scfcCALlwwwPe85KPgS/cb/RyHAyTXPUJwMvDSxNIvCrua/PrJnow5PnzOsJp0tnC9RA1smAIJVLOyvoG8Fljg+n6jf07LgddV32WZ5BsIdtp3iPvBjMQqTEbVixwhBLfhEJ1R0SgxcRaBBAPNMb/jlL1/Y3BZ+mIhhizIZtY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHoWth0I; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso1596769a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761232112; x=1761836912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2YS221MdzWR5Kp4JEIOmh2NOryuUIwg3TP8nSF36uI=;
        b=dHoWth0IDbRJukK/NXGJo1irzSIJ+ROxLCg7pilTAdOBxm1JNmFH2RURyoGkRsiRqz
         szVS64mTyLJAlOsj/ive/JSF2yhuB5DWmytpcGrohq9ByKgdPmeEJFL7TTxc6En14JqI
         oFdZG9RViwzboKfUKLfhzr9FfDe1x4ikXLeshhpYNscu3moj8SlWl00s/xPfmFkJldsT
         MrNXW1b9J51WdCzehecVMhluyEIavks3aU6FuI4tEGxetA1rL85W8tpJHHO4KoYBax5V
         r+JSJNXVE67N2C2HikBjlCssqih4kcQkRqeprkEcCXCL2l2rCVUsoTsM6Zyuzv97iT1k
         mnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232112; x=1761836912;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2YS221MdzWR5Kp4JEIOmh2NOryuUIwg3TP8nSF36uI=;
        b=We2VqzCVAB7MpxxzR/mSxIKyupwxM0zTAEGnT3SeY97Q9PI7WptCbh++LuAJ8T6xow
         cc9iyhlHuMugqW7mJ28gyacbxIdwNYMzXtjQZd3M/XJuwmWWuLgpx2lBcGh09ufToGUW
         vAm0ySUWA/SAFhg6hN/nzKkwG1ggjMvJpiwHkOg9L36Wxdz4oXwmqdBZBnFluBOCSMDq
         wWSsYzbUH+6AF92smjyT27ZPkTdaSMZ/cj7MnRBH9ND7S2qQwyvAVP9zC1p0PWi3dxLQ
         /XITXX/MlPRjwWnkMqIPNeEZ4c8M56NdXvoKkjqV4nKuQaJCE0m96R4KPAc6cdS/vDNT
         rvYg==
X-Forwarded-Encrypted: i=1; AJvYcCXbu8HZUznDWY6vPV1lp9PG3midmHcSXIgWeS+eWqwVwl7HHNVhMkmWidFqrLpNP5buJmSXLSsqKa9mR0bk@vger.kernel.org
X-Gm-Message-State: AOJu0YxTLYthqdzYSbLiQWEx9XxkRQNcAc4T4JcKZXRjQzzDmD1Rhib6
	tHVWzL3K6OA3BxkRX3fUf5FkHHhQM8D+T8V0g+89YQsDhV233N6hvjK1rtg74O5/mPI=
X-Gm-Gg: ASbGncus0tBdMkY5IqnmeX9Rncx5PPnxIQpc4Kfc8a9DSA9sJUdH0htTPmbSWhEnVIj
	tqv5oRLBsy92QrLFOmm9SHRcilGwP0+z/rlwOjMrobIruA7S+e9DKO+z4QgJc7FMWj6adLtp5ld
	L3L/ETxiT7svPG91lM9npYieAPPAHLCURIM7lk/UCp9ZFKz8mfOKPX8UfKoHVjhcjxFAsrJcXTN
	bJvOHCBJ+sMlr1M60FV9zRLACcpXocItk5hnuS7wN7nNHFxKqspP6ktMFVZ8ICzL0pC/NX/oCYi
	x4wlbba70a0On3/iyB0FZ4XSCCX1VLEsVe4GAR8DrvZzONb4V49jYCqTUq0lIy3Y4ztivgajZWI
	ONdbsxIczLfO9Mbq1shXU08LOviDyRUzBprrusuyzaIn34qLPqBAcsYn+wIdxkMeefdVD5Qr2zD
	5RlS5q7NoSlmgJ8BxT2pxLGQsvfDLcFu1ZZmR1+rHt5yo=
X-Google-Smtp-Source: AGHT+IES4FShd2sGuOdKH5///DJyoTF0xUy5PATJ9l3jNFl9msjhjOIVLFTNC8gfd8W7HWnUVbFhKg==
X-Received: by 2002:a05:6402:90d:b0:63c:8123:9d46 with SMTP id 4fb4d7f45d1cf-63c8123a082mr13221886a12.11.1761232111943;
        Thu, 23 Oct 2025 08:08:31 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3eddc3c2sm1879617a12.17.2025.10.23.08.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:08:31 -0700 (PDT)
Message-ID: <1fce8193-8c00-45bc-9156-d85269dbf8a4@linaro.org>
Date: Thu, 23 Oct 2025 16:08:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: media: Describe Qualcomm SM8650 CAMSS
 IP
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
 <SMpWHKL4Mxi6bKSoXpNT_nltVaZZI2bKxWlfmkmxaKOF8__1wIFKb8kCpr60KxlfAb8DgpBqi2Hm8ifboD3mUA==@protonmail.internalid>
 <20251017031131.2232687-2-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017031131.2232687-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 04:11, Vladimir Zapolskiy wrote:
> Add device tree bindings for Qualcomm SM8650 camera subsystem.
> 
> Qualcomm SM8650 CAMSS IP contains the next subdevices:
> * 6 x CSIPHY,
> * 3 x CSID, 2 x CSID Lite,
> * 3 x IFE, 2 x IFE Lite.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../bindings/media/qcom,sm8650-camss.yaml     | 375 ++++++++++++++++++
>   1 file changed, 375 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> new file mode 100644
> index 000000000000..9c8de722601e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> @@ -0,0 +1,375 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8650-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8650 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8650-camss
> +
> +  reg:
> +    maxItems: 17
> +
> +  reg-names:
> +    items:
> +      - const: csid_wrapper
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 33
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe2
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: qdss_debug_xo
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +
> +  iommus:
> +    maxItems: 3
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +
> +  vdd-csiphy01-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
> +
> +  vdd-csiphy01-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
> +
> +  vdd-csiphy24-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
> +
> +  vdd-csiphy24-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
> +
> +  vdd-csiphy35-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
> +
> +  vdd-csiphy35-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8650-camcc.h>
> +    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@acb6000 {
> +            compatible = "qcom,sm8650-camss";
> +            reg = <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0acb8000 0 0x1000>,
> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acbc000 0 0x1000>,
> +                  <0 0x0accb000 0 0x1000>,
> +                  <0 0x0acd0000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x2000>,
> +                  <0 0x0ace6000 0 0x2000>,
> +                  <0 0x0ace8000 0 0x2000>,
> +                  <0 0x0acea000 0 0x2000>,
> +                  <0 0x0acec000 0 0x2000>,
> +                  <0 0x0acee000 0 0x2000>,
> +                  <0 0x0ac62000 0 0xf000>,
> +                  <0 0x0ac71000 0 0xf000>,
> +                  <0 0x0ac80000 0 0xf000>,
> +                  <0 0x0accc000 0 0x2000>,
> +                  <0 0x0acd1000 0 0x2000>;
> +            reg-names = "csid_wrapper",
> +                        "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "csiphy5",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_2_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY5_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_2_CLK>,
> +                     <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +            clock-names = "camnoc_axi",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe2",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "csiphy5",
> +                          "csiphy5_timer",
> +                          "csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "qdss_debug_xo",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "csiphy5",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0
> +                             &config_noc SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0
> +                             &mc_virt SLAVE_EBI1 0>;
> +            interconnect-names = "ahb", "hf_mnoc";
> +            iommus = <&apps_smmu 0x800 0x20>,
> +                     <&apps_smmu 0x18a0 0x40>,
> +                     <&apps_smmu 0x1860 0x00>;
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_IFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0", "ife1", "ife2", "top";
> +            vdd-csiphy01-0p9-supply = <&vreg_0p9>;
> +            vdd-csiphy01-1p2-supply = <&vreg_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    csiphy1_ep: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&camera_sensor>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --
> 2.49.0
> 

I don't think the squashing down of \n is necesary.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

