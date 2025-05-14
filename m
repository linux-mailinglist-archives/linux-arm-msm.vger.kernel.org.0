Return-Path: <linux-arm-msm+bounces-57820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76808AB68D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 12:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B47A3BCD33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8A92701DC;
	Wed, 14 May 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wc/IYILC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959712701B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747218582; cv=none; b=Vn5x2N/BqDpTcrkIluu0rmM02vZyAmmTNTrJ2YI3nOrSPK/ZHa9PkLTBSkmB7EjpB0WkpkjbxmzdQ01DrK7OjjN9pomYo06TvmOdTyeHPkw3iZSx4Q3Wic6NQfKNTzwsXgv+XYYBR9Wv+spnd2mzr8L+IEZ5FbzIfQyYNL1rsNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747218582; c=relaxed/simple;
	bh=RJXzNpSAcHShZIk1m3pF10sKxteBO3dbbHyuTCEUET0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL+XyG77jZHIsUXuU/H/xw6EcIVFAyDkH2C1jW26K3Jmq8TUhmv6G0U+AB2CECl5/nI2rxnYjZKXLLDm77YIZ7NOSw2WT9eujEwFXKup7UyShHr1Ta139gmJkSn1NGxpYLuKlfL8JFU0zg50MqmQIufM5QT8GlhWECgQwlsS1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wc/IYILC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so3985204f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 03:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747218579; x=1747823379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePg3tJASnNM57hKgSxlRFPyIUggUvcLPatD9RWreDX0=;
        b=wc/IYILCdyTZwyYLsmj6LmxC1XzenpiBhXItxOi/vWPh6CUIQoI7MjkD7/v5g925oQ
         Uh9mHCGQKiqzDUH57dKUEImq8TlZ/QCTo/pC0n+Yn8UjmYVgmh0iv4637kGDqRqv6vDe
         TFCqmGNA/S3v9OANIxUcwqUSxWNOzHuf+XPBSoG50ZyB32pfgNM6TX78TcOPajEB52x5
         iPlZePEIgBrJ9eZRHPnZLrpiOWdUa1qayVTAJ6jLVs1HRKhVHgFiGrWuGT7d5ZdB0hwE
         r3zDMOybz4dmAYAi4b9cn3ll05eRDovlu/8YzWjgIQ9dI9FxpMzysmFS0zKyAmzUPyvi
         qBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747218579; x=1747823379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePg3tJASnNM57hKgSxlRFPyIUggUvcLPatD9RWreDX0=;
        b=a8zbSI3t5XDtZNn11klYT0oaekOGTRIx/r5TlJBVkLd/9hFpYxU0sgniW+YyXJ65Nt
         XUjynnNQZYJIK7aFoAytHyTVW5ivVlXboU495W8UlI3bO6iUOxfdU8kg5+QmAgfN+Heg
         3OAYgqUZAs6MxKgAy2Kb5s7p/qrUVOcmnWjT73LyDH0KICmXYL71dMfhFJ/C3o+GOPtY
         SmuQxkqhMz4+gXQfEZKNFsVQWDFf7fXxGdFlB3JBirlqFpKW8vmamNIgdfk+4qIiuHu9
         lBtWlPKqak0y3+h4RqsASTyCS8HCgrs/WlB4gPlEMRXuWC1JjcZQGbSe9+9RTCUoMOLC
         Z8gw==
X-Forwarded-Encrypted: i=1; AJvYcCVwUYxxTPjpodNmwvKs1ER+Vk4XKG4drwsEGm0stcZ26MS1wN8Ct1et0iifF7nfkb6ekLWFXiiPLzPhFJtz@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvWdFB+USX7MuBlSzykDQGy3DjJjYRnv71GOeQJKKx7kNk3Uc
	0AnA1FqRkt8odoo5y8LvFVJTexhxPtuaH21jchtz+FN4BC9krbqg2hmY+5dk2/M=
X-Gm-Gg: ASbGncv7DCdMaE9X/vO6OsXmUiC5JvXBzmHJgmQfgbtvtrTTmpN1L4a1fInyUnNKSTp
	XGZdxgLEKATTHK4+W2a7mvSG4WDCv4aBaRgwnzjp3vxwBp5NpqMVMDQcqKPF/KubTZy7MFwcDvA
	JDOCvU+klvTdYuHIU77Ce+upflOI+LQX2+fqNjn9d6eJD3PRWCSXz8W0t1EBtzIOxZUA5CYb2CQ
	3H33eX18KGGXknhljJ+63sx8wgozdxLeUbrpfdwebTUyQjxCk+4fx0CwMQndc0m/ZsK94TvLR4P
	TnOFV37GN50qhGgCx6cnE+GPvUl6aXfKeim/ogtiCnyyRBl30uwlOpkJU8preHM/NbiYyiHrHhM
	BkBX3cNgih0d4
X-Google-Smtp-Source: AGHT+IHjhoBaynMax8DR4vj3heXMVE+0fDfHEiV7SJCVMWgYWeESkB2IAbrN10SkOnXtoBTQY+++DQ==
X-Received: by 2002:a05:6000:18a5:b0:3a1:fd29:b892 with SMTP id ffacd0b85a97d-3a34994b07bmr2207420f8f.49.1747218578833;
        Wed, 14 May 2025 03:29:38 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm19583563f8f.15.2025.05.14.03.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 03:29:38 -0700 (PDT)
Message-ID: <5905cee1-9ad3-4984-86b4-1709aaed1c1c@linaro.org>
Date: Wed, 14 May 2025 11:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:39, Vladimir Zapolskiy wrote:
> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
> MIPI C-/D-PHY interfaces on Qualcomm SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>   1 file changed, 110 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> new file mode 100644
> index 000000000000..ef712c5442ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,csiphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI PHY
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description: |
> +  Qualcomm SoCs equipped with a number of MIPI CSI PHY IPs, which
> +  supports D-PHY or C-PHY interfaces to camera sensors.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-csiphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdda-csi-0p9-supply:
> +    description: Voltage supply, 0.9V
> +
> +  vdda-csi-1p2-supply:
> +    description: Voltage supply, 1.2V
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CAMSS CSIPHY input port
> +
> +    patternProperties:
> +      "^endpoint@[0-1]$":
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +          bus-type:
> +            enum:
> +              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +        required:
> +          - data-lanes
> +
> +    oneOf:
> +      - required:
> +          - endpoint
> +      - required:
> +          - endpoint@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - '#phy-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8250-csiphy
> +    then:
> +      required:
> +        - vdda-csi-0p9-supply
> +        - vdda-csi-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    phy@ac6e000 {
> +      compatible = "qcom,sm8250-csiphy";
> +      reg = <0x0ac6e000 0x1000>;
> +      clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +               <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
> +      interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +      vdda-csi-0p9-supply = <&vreg_l5a_0p88>;
> +      vdda-csi-1p2-supply = <&vreg_l9a_1p2>;
> +      #phy-cells = <0>;
> +
> +      port {
> +        csiphy_in: endpoint {
> +          data-lanes = <1 2 3 4>;
> +          remote-endpoint = <&sensor_out>;
> +        };
> +      };
> +    };

I have something similar in the csiphy rewrite I've been doing.

Lets sync up IRL to discuss.

---
bod

