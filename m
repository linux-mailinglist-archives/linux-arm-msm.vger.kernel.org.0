Return-Path: <linux-arm-msm+bounces-61140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D20BFAD78BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 19:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BE7D7AF924
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 17:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3728A29B8CE;
	Thu, 12 Jun 2025 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3zu8YcO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7229B777
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749748430; cv=none; b=idxsdHS4dKWMoTOiL9EPMuRFA2pdtEKfCXOC+MYhLNSoKwyYeYKhlrBPntrELZ3IsAmhXHhLYrc6w7FMIbVtyD++HDSpUhBmelGgYi1o6ak9fmjHMjSaGcUWL8p21uW3O0OdK29dyF5e/06YTJGLkcQV/d9SyGGvFzFgCOXUhbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749748430; c=relaxed/simple;
	bh=cj8Jh9DqsJ5fqw/H1m8bixhL9/G9a1WDO8UzNyUCzRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfRRYzF7ZTNalNWJlbEaLhigbnV8pYnzJ7DyftVv5yHCRF3rFj64dCkTHdt8oLJy8e7011WQooZESssC55XdGowj6jpBKuFZwHh53q1tsoNXUwV67ml5DhRUpKgB8AUV64Sfesm1ZBDgVmeSBIKtSkg/I0+ni+G9E6+6wkaVe1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3zu8YcO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553645133f0so57797e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749748425; x=1750353225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miLQfxMr/GSEoS4YeSmomgD6V8a4V0XPRVLmZRphmCc=;
        b=b3zu8YcOX1pATQGEan53bXPr7FqingaIheb6XZpjDXqqVb1E+H/P3SKU3KNJTayRfp
         ddahX+zG9fMwpdyKZfWWE8pWbm4qJ/HRBSVQd8tu6dQAouUU/F5AQvaBoVcFZubT5FlK
         3CiU6T15AWgDYUsdYZo6Z/jE9FW6+MgtXejgWiCjB6+tEAq150qLH0lkWKh/NEFpyPo+
         QxT5f20uQNIUXghezBigdJ54hVaRZaPPTei2YGkwr75lIt5DV3pXKLOnrHp0v4YcD4lB
         fo4jf3oZ1gxpdZdfQwkTsSbypQrKbl5egKVFIaABmgb2VH/T8qVjCikMYPEULfqzTTH1
         +sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749748425; x=1750353225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miLQfxMr/GSEoS4YeSmomgD6V8a4V0XPRVLmZRphmCc=;
        b=BjB872KIG7KpKHwbfLNvoIaD7XWPZIQp7UyrqXTYgF2sZNspNdRxU946n+aUxByfca
         XGwPY55LodYesVVxifPg8N6VlU/t48DMnaL5tAbBLV+S4CA3VNmnD2yK1v9JqAT/Pb4V
         0LoM55I16XvXBt4kef/EN8jZXK7CN8FzIA16mzOBxpNQ35h89CP+Q6QvVExv+5WJ0RL4
         1QzLIGR3faSNvFUaQYt976sQq8/YzIcffp6d8+nPHs8cpwXbcl/lq/5sNhbx5DyxUj2X
         +iTGYEmFJzAKM5Qw1/NO1ZYqKnQigWJmR7+DK2i6LQmiNMN2Nllyr1eGXWnf9aYHK8yJ
         yN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUym1rL6Dpr7kyA+9FK3x9M8Gue+S/sSZnzsOCf2tCTsKGmUDX+UFHy74w+m7bYeStuGt/W1C6TWHqo3lMf@vger.kernel.org
X-Gm-Message-State: AOJu0YxYvelnIYS7mVL4sEYziz+nqoD1mrGthYmzAvE6u7LqnLtB0Zy5
	XUM4Ebel55yjLMFCGYd5tDusxyucXLsqRgDFwuE8mzgm9u7YdvxNhhlWmdPI52YEAOg=
X-Gm-Gg: ASbGncuyn2PS4SZW00Xmjk72Vd5fBAqTtPfApoCORsbC0+JdiVXuZqd94VdXAH+Df7O
	NzkRj31pybaFlWIIFqlhZSrC0TQSvgOHeTMmSO/w1rE2eqUZizEsE2vqt5uzXWifESvnhfBmCSb
	Pazb3TeODQNLn1V+8X2LDMVygkI0JqZ37zplkh8xnZMVDXDyLIgtz0das4oTd3wJt7dR0bYng6Y
	XFHdKPIvXK1egGOByqRDkL9n2DWDlbcT4hh4cQ8gL6r5H/qi1qyoGDV9d84PlzRiVbHa3ZzVGh2
	caWZicnrTghyLW7l8ComIX8M1XgJtlTpL3ZJhzDg86G5qVyTa29fGNRmwQBeg5Kqxd17Bcypb9G
	Wkdmq//g2KCUxq99HmDZFpVXuhyo8PLaFZVl/iEmqwZuGidDHW0Y=
X-Google-Smtp-Source: AGHT+IHaNuD9NsHG1tZmuJd4mwG3PJ8P6NuLLrOdaveasm0jgsZFK6boCKQqEsoa6Ja0AXmOOZRjaw==
X-Received: by 2002:ac2:485b:0:b0:553:ad1b:374d with SMTP id 2adb3069b0e04-553ad1b3963mr171377e87.5.1749748425510;
        Thu, 12 Jun 2025 10:13:45 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c1d1csm167821e87.160.2025.06.12.10.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:13:45 -0700 (PDT)
Message-ID: <e9afdd0f-7842-4780-9044-d5afa6a09d7f@linaro.org>
Date: Thu, 12 Jun 2025 20:13:44 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 10:38, Krzysztof Kozlowski wrote:
> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---

<snip>

>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: csiphy
>> +      - const: csiphy_timer
> 
> Drop csiphy from both, redundant. And this points to the first clock
> name not having any useful name. Name equal to device name is not useful.
> 

I got the rationale, but I have no idea how to correct it, since it's
literally the case, the first clock name on the list in 'csiphy'.

What could be an alternative name then?..

>> +
>> +    patternProperties:
>> +      "^endpoint@[0-1]$":
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
> 
> Your schema does not allow this.
> 

That's the catched defect, thank you.

>> +      - required:
>> +          - endpoint@0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#phy-cells"
> 
> port is not required? I expect it to be - how this can work without
> wiring to the sensor?

'port' is required here, you catched the defect.

> You also miss to update the schema using it as a child - camss or
> whatever is there.
> 

Agreed, some or even any currently present in the upstream CAMSS
schemas should be updated to account a new possible child device
node.

The pointed by you problem of MMIO/non-MMIO mix of children on CAMSS
side is still outstanding, apparently the usage of 'ports' or 'phys'
should be mutually exclusive.

Thank you so much for review!

--
Best wishes,
Vladimir

