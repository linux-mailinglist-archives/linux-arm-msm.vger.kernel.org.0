Return-Path: <linux-arm-msm+bounces-57977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D57AB75E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 515E017B3A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B8F28E616;
	Wed, 14 May 2025 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvfv43iy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A8193402
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747251050; cv=none; b=kKL6Q/PqL4s22LfswnJ3IsGaJphlo6gl/ZhUoOO/4hnPjBqnUoRpAncwetKo3+Sxcw6DYYtUU+1dzUB7haHXAlqd7bE9UWTuIMl9nAH1PUeSl7f5NiS26GIr2YniuuZWCgtSiyxteoHyW4hyK3LUQd73VnQHkDEkvwZXAHVzntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747251050; c=relaxed/simple;
	bh=ZDw3zXdwWUjhBcMzp1OiH0fhDtsrm9j+nPvpSWy+8FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tz2mXFiYRAG77QRfAGYSLpGSkmkz7OJXYLUfOE6vymKd2crLIc4s2frK8e0cFWHqoST3bO90avC56evblSmRrsBGee3px56wyys3xe9xq4KWL/uBZ3arnLzDbnHyPXpTZjUws1EM/8xWk+JkRVs66aMZEJjbzj/tXl67R8elsG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvfv43iy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441c0d42233so263805e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747251046; x=1747855846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wu8CYbxrZGvQTelT4Z4uIdtuj7A0yMOmk3v2JdGPTT0=;
        b=fvfv43iyyPQBfIl2Y6vN4idk774ACI5rT+jVnLN5m64Xry4BIdcfm4LDS4fk5tv6Se
         L3kSECHZjB+A2cZrAP7X2UCfTbPQtWy4MYIXbRuTMJiPhQt3aEo9DLv6yGt8fT9fCA/2
         AMCCcbjU3n8+KoeK9LnIh7qe7epPY3VAHS3uj/o55RvE2PwKnCRZDb75IJ+Rrj3909rw
         dxs0I8zhSPGKWOdCcX3IKgJU7GbZXt3B6cZhg/qQN+5jPxJsLvuZx2NjKJc422piJ34c
         peropkix4VZ8B8UxgfS4VBt2PZEi6ovlQZCI9v5+zHShvFRepx8J4RRgxmoZlmvNTo9o
         +ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747251046; x=1747855846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wu8CYbxrZGvQTelT4Z4uIdtuj7A0yMOmk3v2JdGPTT0=;
        b=pxgeg694KMHZfTXfbucHXhjzLlQ62dFgUELpK6I63jcLWvWBPCtFzeTndaFisVffcF
         rIaJEvlegwRif07oU4y0SscGvENPuLIbhPhB1LxAwJhg8o2DDNphWJbbDgf1KjorA/qh
         WA03GKRMbZ3Rf8NunipP+b0gE4zYuPwFAnRIqOe9WqAvMYeqh42OAyRFvhEsRvkjCozS
         lek+5cFQEb8NOK9npI01KsaMw1TDDDD0UmYA7NZ9wzExltVRsDfEhSOqlfZT+Szz8Azm
         8cu4em96s+Oj315KxxG+HoYDnEhzhGREaYVtcmLEesVtjbBj9yq9A6pHCewjvdcUpc4R
         UNeg==
X-Forwarded-Encrypted: i=1; AJvYcCU79WO1axZrGbT326CiIwR8wCPJjziX0RW6181k9jsQ9dr2PZazGnTPl27cWlngJD9xSSyXfQUBF4MobXvV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3tw8pnj1A1VatFGCUuxh4SOHcnjni5qplW0+AM/QEukfTfws
	OJ20ZQWE4eowSEfzA2XaQEfUuTe68w4A/DTA/RA3IUyj5A/4uItBpY2YWJVAvJM=
X-Gm-Gg: ASbGncuvlXKdXImrA4dveV6C0jM2/hijEHrzVErW0DfHP2a+V67QLNbdLM8tIM3atJE
	mZBq5BeLnaaX8UTT16mRM5SOhZzsfLKnfXaAYmnEZ5/v5NLFVNyBakAV80wTTmTEWlcEreWNcad
	ggfx5aIfSWfC7fFA07aaJe616zhgdvgpMBTCNTCXvWsyOldhvGLhvvDMBwpPZyeKvHEIDwJ8nLl
	lHUF730IkEkyTPxbVYYZRXKb9R3TdqKXeQEsJiDU5O12vKVij4aau/D9BN15MR9DR4ZklZTbA3H
	LMTDO6iIzregM5JkH3U21nLXsCLScchSxehsGZuqQt8yze/pqXDllW7w6/IIVHiNG8v99iFfJuZ
	Ff3dReKpqPnWLfrlQ
X-Google-Smtp-Source: AGHT+IFvXW9lDEbATxNOLcqkk2qKYmb2LjJaI24O9bk39OdZTYE2y1+5m007eE4YtTFHo4ArFYYXmA==
X-Received: by 2002:a05:600c:1c8e:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-442f21905eemr15565055e9.8.1747251045917;
        Wed, 14 May 2025 12:30:45 -0700 (PDT)
Received: from [10.61.0.68] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33691bbsm44060495e9.7.2025.05.14.12.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 12:30:45 -0700 (PDT)
Message-ID: <634e9d0d-fbab-4101-b968-d335b656e099@linaro.org>
Date: Wed, 14 May 2025 22:30:26 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
 <959b9c65-50d7-426d-9c2a-64e143e28ded@kernel.org>
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <959b9c65-50d7-426d-9c2a-64e143e28ded@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Krzysztof.

On 5/14/25 13:25, Krzysztof Kozlowski wrote:
> On 13/05/2025 16:39, Vladimir Zapolskiy wrote:
>> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
>> MIPI C-/D-PHY interfaces on Qualcomm SoCs.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>>   1 file changed, 110 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 
> 
> Looks like not tested, so limited review follows.
> 
> Filename matching compatible.
> 

Thank you for the review, the change is deliberately tagged as RFC.

I read this review comment as the displayed generic compatible 'qcom,csiphy'
shall be added to the list of compatibles.

>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
>> new file mode 100644
>> index 000000000000..ef712c5442ec
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 
> Please post the driver or any other user. Or explain why this is RFC or
> what you expect here from us.
> 

The CSIPHY driver agnostic CAMSS changes are on the linux-media list [1], the CSIPHY
driver specific changes will be added on top of these changes, however I believe
it makes sense to review these two different CAMSS changesets independently.

Here the RFC tag is given explicitly to get change reviews for the dt binding
documentation part, and the first user is the example embedded into the change.

>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,csiphy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CSI PHY
> 
> SM8250 ?
> 

It's supposed to be a generic device tree binding, and it covers SM8250
CAMSS CSIPHY IP as well, which could be quite handly for testing/review.

>> +
>> +maintainers:
>> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 

Ack.

>> +  Qualcomm SoCs equipped with a number of MIPI CSI PHY IPs, which
>> +  supports D-PHY or C-PHY interfaces to camera sensors.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8250-csiphy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
> 
> Need to list the items instead
> 

Ack.

>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  vdda-csi-0p9-supply:
>> +    description: Voltage supply, 0.9V
>> +
>> +  vdda-csi-1p2-supply:
>> +    description: Voltage supply, 1.2V
>> +
>> +  '#phy-cells':
>> +    const: 0
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    description: CAMSS CSIPHY input port
>> +
>> +    patternProperties:
>> +      "^endpoint@[0-1]$":
> 
> Keep consistent quotes, either " or '
> 

Ack.

>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            minItems: 1
>> +            maxItems: 4
>> +
>> +          bus-type:
>> +            enum:
>> +              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +        required:
>> +          - data-lanes
>> +
>> +    oneOf:
>> +      - required:
>> +          - endpoint
>> +      - required:
>> +          - endpoint@0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - '#phy-cells'
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm8250-csiphy
>> +    then:
>> +      required:
>> +        - vdda-csi-0p9-supply
>> +        - vdda-csi-1p2-supply
> 
> This makes no sense - it is only sm8250 - so this if is always true.
> 

Ack, thank you for the review comments.

--
Best wishes,
Vladimir

