Return-Path: <linux-arm-msm+bounces-29115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DEC9585F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 013DCB2132B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EEF18E74A;
	Tue, 20 Aug 2024 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y3exv8Rl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3A18C02C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153856; cv=none; b=iRmUqt4kZdn4raHj6oeyJLuQCzkK/pp+9bAjz7mLafk5FJbL8YDaEb5BgpkY7WFJ9GSEfW4M/PIUEN7t8zMDy7P4LGT+C3hziWDzcwQ89oNq2fZQ8VvZnPHaaVxBqDBOMP1mjU54OliQgcamBJ7SQDdwTLvpJ+dizjO0bicr0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153856; c=relaxed/simple;
	bh=IvZBJUxFElI7oSzZMmvS6vB7Efvt3Xy4SUpSkkCUtPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nC9n2HlHnxfPSZBgfmyJrhGzqhV2P2YOwyaDRtp0xeOJj2woVFL4A76ibNzF+1SOJLRE6SVPoxtydwI0bjxItA8+ko6lQrSKBdSKgcAcXUcQH2RFUi8GhRN9KnEhoheJH8vK+A6PtTHIWOFYow51Tta1mF9NLOuxdGZWyB9yXiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y3exv8Rl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533446e53b5so75717e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724153853; x=1724758653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvQ5KNXMJMLakdVv034VXkUY0ogpNTCoT/KgikaWz60=;
        b=y3exv8Rlk35ck1be4h47L1GST7T85+FbRXn6gLLsPaAp2C9tiWn8gUGw8y7kPZXBz1
         zFu52SWFjzeLKrzj+qzE64sc+QFn6bCFCXulmh001pc87MfNdLmYwM5vf2iZB2Zd75xv
         nVtRrZiRrbPFLh0JPiftMt681mWbkVHh5dK0Ju2/HbO0w0xtch5NcdUDd2aPJCm2/4Pz
         dADiO9lwyoHCIpLCz9nMpDaEo4mtghvFomSNIHJkgYY9689ilc/HpHgccIzOKnm6icY0
         8MJVqxdIh/a1/8MDHPndtnzWJNLMjmDHdMn1EDbgUjFZGrCokeHvffhcFOm3ar3VZEh/
         Zi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724153853; x=1724758653;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvQ5KNXMJMLakdVv034VXkUY0ogpNTCoT/KgikaWz60=;
        b=YBBp+QOP5QUuZ7MtQ5K0ee5NgKYETqmGnOOiIQPtQf5dPnFLnG8M8ViQ3nPyGdmwjV
         vn95i9+2gksyweOftNsLfLfHDA1c1Y9GRjowDLa20PycJLq43tPzMQEKnEvsq6/7G7kn
         +gp+bXrzYz8Z3zj4Vk/Kc2LL8Qj3Q/e4uqFwB0Q7UcXkM4UaO2ASFpQ6OT0/BW3ojRYM
         gU+/X595U4FUBlUq0ZNgbxGjJEE5Lqx7wOagMhNQda2WGlfmvk0SWrv3Mzrm53mlGIHt
         EQ+xN250Xjyr/B3v480rCRVdl8zCVaTkpBXwNnrgRv4McRhZA4//UWPp/ImgJXE19DCV
         UkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Nf9Fed8+IHFV5pJ9Pv3HyHF5KlUOMDsLhEuWGTP3PcOrUs6TXYSvG3ulXPMIGx7i5DBYS99R3fFetu6R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy92rOfwbBhWk3g+0yfJSd6RvyCTmTE/RNP4vk7dhjglrsITOO
	2G3rguwu05tSlVYakjJTSSftXskM2qJQIBYhuYSLTqJ5O9ObP7qA3qzBSa6320Q=
X-Google-Smtp-Source: AGHT+IEnAtcUPnLPniIn1G+PY8BSHGTXyXnIRA/xgiJW0ArDYm/MnZ9Zgqj+xLtJoMXC1pXKYENaLg==
X-Received: by 2002:a05:6512:4007:b0:533:d28:b9f5 with SMTP id 2adb3069b0e04-5331c6f621amr5321803e87.9.1724153852473;
        Tue, 20 Aug 2024 04:37:32 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d420357sm1758134e87.231.2024.08.20.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 04:37:32 -0700 (PDT)
Message-ID: <48127e98-f489-4c62-a7e2-f207c875c77b@linaro.org>
Date: Tue, 20 Aug 2024 14:37:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>,
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
 <3b3774de-3aeb-4a58-8c0e-e494a2f2aaf8@linaro.org>
 <e34dd20c-e67e-4b69-88df-b4d34e01f8b8@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e34dd20c-e67e-4b69-88df-b4d34e01f8b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 8/20/24 12:56, Krzysztof Kozlowski wrote:
> On 20/08/2024 11:15, Vladimir Zapolskiy wrote:
>> Hi Richard,
>>
> 
> ...
> 
>>> +
>>> +  clocks:
>>
>> Please add
>>
>> minItems: 22
>>
>>> +    maxItems: 22> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: camnoc_axi
>>> +      - const: cpas_ahb
>>> +      - const: csi0
>>> +      - const: csi1
>>> +      - const: csi2
>>> +      - const: csiphy0
>>> +      - const: csiphy0_timer
>>> +      - const: csiphy1
>>> +      - const: csiphy1_timer
>>> +      - const: csiphy2
>>> +      - const: csiphy2_timer
>>> +      - const: gcc_camera_ahb
>>> +      - const: gcc_camera_axi
>>> +      - const: soc_ahb
>>> +      - const: vfe0_axi
>>> +      - const: vfe0
>>> +      - const: vfe0_cphy_rx
>>> +      - const: vfe1_axi
>>> +      - const: vfe1
>>> +      - const: vfe1_cphy_rx
>>> +      - const: vfe_lite
>>> +      - const: vfe_lite_cphy_rx
>>> +
>>> +  interrupts:
>>
>> Please add
>>
>> minItems: 9
>>
>>> +    maxItems: 9
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: vfe0
>>> +      - const: vfe1
>>> +      - const: vfe_lite
>>> +
>>> +  iommus:
>>
>> Please add
>>
>> minItems: 4>
>>> +    maxItems: 4
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: ife0
>>> +      - const: ife1
>>> +      - const: top
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    description:
>>> +      CSI input ports.
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data from CSIPHY0.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data from CSIPHY1.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +      port@2:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data from CSIPHY2.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +  reg:
>>
>> Please add
>>
>> minItems: 9
> 
> 
> None of above are necessary and this contradicts review we give to drop
> these...

Thank you for the correction, I will memorize it.

--
Best wishes,
Vladimir

