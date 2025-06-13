Return-Path: <linux-arm-msm+bounces-61171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD13AD8593
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 10:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82773165B39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 08:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A8E2727E4;
	Fri, 13 Jun 2025 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nv5VzOI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F026B774
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803358; cv=none; b=fBWypE5hElT9pP712LfgfNcm5Ka1kJIeCTml01Kku6h/hBQsRxVUgUvE9jEp13chxy3ljXuBPKQhIo6wbyOkgO5kiNsaKaI3SXlEl2IGG45o9DxQ7aGfM3KelygvZ4KE+5xF3/rOgwuq/pAbA2ZZpeS/4/niKaC8X2wzKntekd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803358; c=relaxed/simple;
	bh=Vi0J4BWVo4/yZAh4O85rz7hQS/0Ru9uo6RUM0lQSxIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N67mltyceLgh5yqQKdumSfzrA85rh622PiFo4Af0SHZYuCVnyOFn0w0z26Mg6LdqHvAzhhsg6f6T0xxMgWzs5clpchcb6U1B/l3ThMGQeDS45LbveonZYwtMnswu+wziEqe7elrSDhQbHfq8OkKrdW3kh5SXAyxRstyO8yc1i/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nv5VzOI8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so15292945e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749803353; x=1750408153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E7k/xsir1wVQr9r0KZkIIKRxBUWWN+0FYHXZ4USuT9E=;
        b=Nv5VzOI86ADdr/sMIMD0HY9zRipv6CgwPIVINKOolwPtc+WqB7liDtUvKcuX5+ofFQ
         AHXa4GG7DpdEv1smNtA44kKAl3m1DhpNLHg2nlWRrrSzlrxoqAvC3fHN1H+wa5ntiHsb
         +VsqYPcZsF7Fnhb/mAlk8EJkt3GcTHaUWu44YcgBhD4THAZ8ZQz+Tbldn+J82w0RD80m
         LsFyXs81Udo/Pfq/E8MuIqNLK6fXxKmLxK+My0ZYy4urMI0VJdMhLlccpB3YxGKkROqH
         ZTlXb4anmMs1/LEaKT7s1DXceVp78tx8OtTV4gh2WyHU6whzu0aphpwJXmAChxJ7Io/H
         qNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803353; x=1750408153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7k/xsir1wVQr9r0KZkIIKRxBUWWN+0FYHXZ4USuT9E=;
        b=rBrpFR4Ace178kdERb2UZqb7u3XXMp9xsxs+nqX5eliUb90DVto6MeB/okeTog7uIK
         1Mz16ni14l1eGe5cVYK1Xz6McDKLOAFiqp1a0eWE8foehltESdjVbEPoIlsUNpWaqcnD
         bUHSMqroT3/LbJEs3WnibiyspKqkPYi3tPVovQrav52zsE/u2AVGfHCAkY2gMSMqLou3
         RBoXAFZ8dho6hruaFZ590IGjOzbMC53mRN95ZHcPH4W1F14xLBgoH4joBrGVb4oXWcxp
         AWeANttAlGIPoQl/vf9FT5TGzJ3RwVT0IGAJ/eWOwb8ZLp6TOZq8zxKg0+xu9mUqipLU
         QH0w==
X-Forwarded-Encrypted: i=1; AJvYcCWMnKWWUvJkgNG6tZBuPBdxJEv1ydpRRSNcfc4mFYqouRA4n2hsYpRef/3bCyAZSGeTy7JETKMAAU5GbL7D@vger.kernel.org
X-Gm-Message-State: AOJu0YwpE1hPVYNaoPAAezNlzGvPnLKRm7vJtN4UDKC/3XBt1nzJQ46I
	TbA5SVO5Us7s0rj7uDXRLHEfjvui6Q0BSSYleWxVyc7ccQuJcjf+ZamTjSX0w8aL/1U=
X-Gm-Gg: ASbGncuMAS9eI1CmM6UkyDsaoSdDntDL5DmR3Hk++pXIXww+iBLjUBprxFp2zgJRW0M
	jJM14+r3DIG13XAwGVraBVq2uG5G1gd5LB8lWL/VzgHWe7jjPtRq9jTfdg+NDpK71/59qrwhChR
	Nwie9vclCC9OHKw/P9GKsMPg85o1ukz2HNi8YRfRBli3Ln/42K3nN2Fkhho3oWF6igeLUcyaoI9
	VR9Lsi91XxrQFt9WazEN1lfmWhSIhlt8zGmYOZtLMZTrLnaC4GW8b2cBq5RDZKnxlUCAEiPjI/9
	GAynP86i2jp7MW+cu8O8zxoIxbsU70yk+7eVHEEaB8vuwFx5F5DWPGW8es2si83UIv2O8Ms/wES
	KZdlLB5GWe2DJZMAUWS3OoRPxOWM=
X-Google-Smtp-Source: AGHT+IEZOXL3CgHF0n7GTP+G3NCxxNOm9fw0HqRF5HC4682dzPgI/R7gazsLuY96P9WAU0XN4HhRTg==
X-Received: by 2002:a05:600c:4fd6:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-45334ae6432mr21678585e9.16.1749803352868;
        Fri, 13 Jun 2025 01:29:12 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532f2ca228sm42833945e9.13.2025.06.13.01.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:29:12 -0700 (PDT)
Message-ID: <ed1cb7f2-493d-471e-9fab-ba10462b8977@linaro.org>
Date: Fri, 13 Jun 2025 09:29:10 +0100
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
 <Gg_cB8nN6ZFBd8h0pO-uksSnWqFk5ICQdbub8-lPxKxNBGc8puChvSwKU4psL0V1NTjZokEnT5uWM1iK3vfVmw==@protonmail.internalid>
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
I think we should just do this

+  vdd-csiphy-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to a PHY.
+
+  vdd-csiphy-1p2-supply:
+    description:
+      Phandle to 1.8V regulator supply to a PHY.

and loop back to add multiple rails later.

Please consider doing a V3 of this along these lines so we can unblock 
this submission.

---
bod

