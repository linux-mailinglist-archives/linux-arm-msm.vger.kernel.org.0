Return-Path: <linux-arm-msm+bounces-55234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC565A99B80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 00:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B208C1898CA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 22:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F326C1624E9;
	Wed, 23 Apr 2025 22:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2xpcNJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F612A1C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745447192; cv=none; b=QQwDETodI5O8Prk8A6gami1Npo1HBM8SQVfpo8z8v4oJDI2lWW0rXkUhRH8bCJbLiZVtPv/LwRUosBi2RR688wnkf/csAmggg13iM4UOboM1SFV5xkmqR650Q71lNiZCGCGchTP8iZRoJ64kouTswiWCatGXf6YuFCE89IVgxWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745447192; c=relaxed/simple;
	bh=0xRBWCQGNf4Ysg6iCndRJVM+FIXxTLyW+OoHcsDHin0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b443DSBaQCUkYj4mensl2zZawTjb8QL6w0tRMaU7w6eLDv1PS7Z4jzEJ8Kr6KIVq7RDG2pP4mi8BCxZ6+ZJjmsFcyp3Zc2tiSSoyhyVO5tbK/sqBvcReb6D20oSSAQAzV7h6ab1vqH2nCk/wzXk73qrNmseJvDVgBgQwODIFWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2xpcNJD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so211098f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745447188; x=1746051988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BowqXwYD7wswl0V7OpWZoj0YZ+stXkq5xyYsEilrvWU=;
        b=B2xpcNJDi+i3ztJjVdzbigcTliGhwxw2DJ8QnWXS7QIpo/Tslhl3nAgi7z/2GoXTYn
         IS8q+mexD3cBTMYAz6m/q5cKC81YwZv8FHl/nu6uUOuM+8TdDMfeQlzX2WkPd6xwIaMJ
         USBZST/LFLyugdbRT4EBkcMobyDS0BesYejYKffSKP0TQ34dUySA3F8qwr+FaLLKkdLH
         wrKYWkonVkkzFA8StY1ZlbJQzLUzTFIbKxKKdrRIWQPBV/7EGGOxr5vV+6akd/B4eGOy
         jo+otwaGe2IsVh00CiDq7lsGul9p14zOulOgBtpr1EANvNbKaWpfQz7+RAWq6lz0gUh3
         nQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745447188; x=1746051988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BowqXwYD7wswl0V7OpWZoj0YZ+stXkq5xyYsEilrvWU=;
        b=LQzp+QyNprzB916KLbyvnBgkWVxx+8/xDJF3HbSg66GOz+QjOwkFlv7hZZ9MZ45nwu
         up7w5uh2yQEaeXW+ITSV3yp26Xb3c/TVreto6pBsu3tbsOH1FeuUxi6k4Tje6+kRiWDw
         6DclMvGw+BxdifouA7Zg2bN1p9NfezEajPtg7BImszbhzy14ziK7jWzrzqLBk3z3dxs1
         FER2kG+7Csb8H89EiTIcrg/CUJGDk6QJxNdrSR6R25G5wPK5EcVWhRDhv9noB1uJMfIt
         5q0eXqDmIT/aXxV2mjd8qVQ5Nz1aukeYcwgCgDpyDHXGpZpmwIfo0JS70Jx8VDPEmJkn
         RlPg==
X-Forwarded-Encrypted: i=1; AJvYcCXOSP8qUZMpHaTXExGsTAJofU8rrGFyidCEmCKH0YuDutkwxGtIVMcfoPAUBIsaJCrAnTDzBZzgSeO+Rnwf@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGbPMPfTrLHUVi6c4dAqoRGBHvhheEYYlhXId0B9Nd/mpwVV1
	byvlpv8lHnMKi5AZokcFhBm95SJiwUrqTzFdJYUIr/Sl9yTGKv+dhDpjFmoaZ88=
X-Gm-Gg: ASbGnct5hZ2wVpGGfZaE9Dqv6lBmWEE7ZWmH74XIzvBQdI2ToPJrMKSZNHIVt8KYr1m
	DlFUp0mXFLmJT11cR1+VV/yowGVMDV+lQHOEtk3Ac2P8K1/Wy6KsH1hWEy2fxVfwvpwQOAz0nKK
	gsgvQiIQfPdqavIsdAfkjnXB4ZNe7GaCHJ0UHCB/rt1tEwfP1Yq5L0TSBhZr/fX3JpOznccEmUG
	YrIPJ8RpyUNIm2naKkJdN0aeGJU3VPs9D0aDCyitiuRQFgloyFO4gYeQTdaUFK4m0hqjP0Dm3PC
	XpiDXt8OQaLDWCYS2BUQH3Wivle3IHfODK2q0mLl3x9GRn+DO2DCFaP1G+l7fn4fIm2G5rC+CvP
	4ly2EZw==
X-Google-Smtp-Source: AGHT+IGafA49x1XvO14q2L7GUJB8YTZ/FbNomct5D1wU5/3Q8ZjVClGybTq6hbB7aFffIYQKBmRgyQ==
X-Received: by 2002:a05:6000:40c9:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-3a06cf60ab6mr149880f8f.23.1745447187962;
        Wed, 23 Apr 2025 15:26:27 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092db2ba6sm39464415e9.31.2025.04.23.15.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 15:26:27 -0700 (PDT)
Message-ID: <1ed915a1-dd7c-4174-8ea2-07271b47bd21@linaro.org>
Date: Wed, 23 Apr 2025 23:26:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS
 IP
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
 <20250423221954.1926453-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250423221954.1926453-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 23:19, Vladimir Zapolskiy wrote:
> Add device tree bindings for Qualcomm SM8650 camera subsystem.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../bindings/media/qcom,sm8650-camss.yaml     | 394 ++++++++++++++++++
>   1 file changed, 394 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> new file mode 100644
> index 000000000000..2a7c243993c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> @@ -0,0 +1,394 @@
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
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_wrapper
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
> +    maxItems: 36
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi_nrt
> +      - const: camnoc_axi_rt
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
> +      - const: gcc_ahb_clk
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
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
> +  iommus:
> +    maxItems: 3
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0_mnoc
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
> +              clock-lanes:
> +                maxItems: 1
> +
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
> +              - clock-lanes
> +              - data-lanes
> +
> +  vdda-csi01-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
> +
> +  vdda-csi24-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
> +
> +  vdda-csi35-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
> +
> +  vdda-csi01-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
> +
> +  vdda-csi24-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
> +
> +  vdda-csi35-1p2-supply:
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
> +        isp@acb8000 {
> +            compatible = "qcom,sm8650-camss";
> +            reg = <0 0x0acb8000 0 0x1000>,
> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acbc000 0 0x1000>,
> +                  <0 0x0accb000 0 0x1000>,
> +                  <0 0x0acd0000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x1000>,
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
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csid_wrapper",
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
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
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
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
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
> +            clock-names = "camnoc_axi_nrt",
> +                          "camnoc_axi_rt",
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
> +                          "gcc_ahb_clk",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
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
> +
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
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
> +            interconnect-names = "ahb",
> +                                 "hf_0_mnoc";
> +
> +            iommus = <&apps_smmu 0x800 0x20>,
> +                     <&apps_smmu 0x18a0 0x40>,
> +                     <&apps_smmu 0x1860 0x00>;
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_IFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0", "ife1", "ife2", "top";
> +
> +            vdda-csi01-0p9-supply = <&vreg_0p9>;
> +            vdda-csi01-1p2-supply = <&vreg_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    csiphy1_ep: endpoint {
> +                        clock-lanes = <4>;
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&camera_sensor>;
> +                    };
> +                };
> +            };
> +        };
> +    };

Fine by me I have no real objection/concern with extending out the 
regulator names - as we've discussed, this is a more accurate 
description of the underlying hardware than we have thus far had.

Please add in the csitpg to the description too though.

csitpg0
csitpg1
...
csitpgX

Then you can add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

to this and the dts that accompanies.

---
bod

