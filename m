Return-Path: <linux-arm-msm+bounces-49125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B94A41609
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 08:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB094188B1CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF28D23F41D;
	Mon, 24 Feb 2025 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2qWAakO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E189F19ABB6;
	Mon, 24 Feb 2025 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740381258; cv=none; b=GoeO7T0KdhWQiUiYKR3sLzjHNGedRuRjLu9OLUOEgR/MgPvD4UaUZdLckZPxVy2jXChArYPX49j5OBlV3ggon57YcJh4rbgO82NwF/NjLdGgm9GSEE5qI//EiJxBz1jM9S8fBxR6SDiW44hZZ36s0XQHtAITEdwOfQkdy85OAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740381258; c=relaxed/simple;
	bh=3Rp0ZJHnJLGhisTv0hRmULsmiBB0mQ8CzYV+Cnn1s6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B76RtwO9HdqP4gNqN1/jwmijLf1xt50kadTVlE+6S7ByztmNVH+HQhUjVYn520YhzyvJWu7cW472Q3YQ0dPxIZwh8YdS01lpWGxttSHoABgx0vn/BRLDIXIFtWpkRjqDOa4P8SRk1+OnYLpvjuZ9YPe0FtecU+1FlLE+venpxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2qWAakO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f504f087eso3274562f8f.1;
        Sun, 23 Feb 2025 23:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740381255; x=1740986055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGDYyJHeIvbN67HiPEdMBYxe4lOwRgtICljAixydSZg=;
        b=g2qWAakOzAc0FXRbDedFR2IaQMSDAkVoObF/uPWhHu3ikwah0+H8pL5Da8GZYPZYk5
         Mt8pXhDL0JFOM17QYOHS9s/BzGC3fc4DDuw1kvctad54EQtwB0wwmSyhuQ+YjZYnD8pN
         0IucSQ0+QNE3ArhI57a+D1hZ4Cc2HrdQANFptbv6GE8BaRv5e14vVFgNkbPxgTELzm9N
         DQFbnTHv2Qg7c0aEZNTsrKZ6BnHoir1E5kWb/BjIJI6hHtuZiCDGYjGI7jKAZDobPAQe
         bG5m+o2Q23fXvciXwCn2aHBmt6sP4OGG1qWQuG8oVHp3hXcfj2bTNtlTrrvJbjNnaV75
         c5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740381255; x=1740986055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGDYyJHeIvbN67HiPEdMBYxe4lOwRgtICljAixydSZg=;
        b=gmKW1yeerQl4BUtkmn1uwpJEJhZXRxAug6K8qwvv3GFbfXkLQMcn74dm+Ylg29Fm3l
         jRvCLgGU5zxC4l6GqfJb8YpL0q0Y1sLskvZITuKgmuQmnLvyGmK3LDPcayTW5cIt2eDu
         6Je5myK+QooYWQwHfTo0kPe03yUteNKbuI4SSy2Z43+8L8WSAuquKPUzZJtwem61Fwqo
         45gUUKveWGmUpa26+b6vDeaLp9m/321mETf3aVSX+qe0I+nPzRUPB5n8/eMejMUcJE7D
         NaNEsBWCqu9+hjtqIoJdKbtt48B2jThwI15UqHs7ni3bL923jGQFQABTO/c6XHzWe8P2
         5csw==
X-Forwarded-Encrypted: i=1; AJvYcCUVZvThb7fIVtmaPud1j3x6cXnhZJ5y82pa2qJq+4/4fHJV40EbhnQ54Dt5foUSuxAy4xJw+FIVNGE4v/gCXQ6CJ7g=@vger.kernel.org, AJvYcCVULu76Uc6gtY0iZLOjYt9ktzMa/Rm6fmEoPxI36ew7xxJMwN9dxpirS0QyDMVosDiY21OE9vc06DTI@vger.kernel.org, AJvYcCWpa5IskDSo0NL7yh5PeiPffTE7SrSYIwiyIi+vZdX+tpx3bkPnIjMX0jIaeFBWclSa5y1XJ0oReXm09QQu@vger.kernel.org, AJvYcCX2dF6gjj3YIiOS49yRvJNkJ488iZdkVqwrCqGigaYjUdIdDhkZBgT8SS+D18pewzL2849SCi9ZVGngkJ0YTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwuvRWgDniP8YBRt20WoveO7I6oUZx4z0FoQH3BUt1zqv+UY+
	VAJLYBFmkCdOIcpguThXbPDcqWqIp+U1zfs8WQDt7gn4CVm6iJMJ
X-Gm-Gg: ASbGncvIn2f8Zkjj+RlATHuP8W1T5ZYndBWB9BZeVWba45FzOKFvX3nAyOlEW17zEWJ
	nYbB5KE0bEnJBno8IffLtHEy3Y4Yh18UEWpuxhnPi4WJIMy0p6wizKsm0/wuMmEUtSDuM5cVuC0
	ko3xQcM2gdSb15X0oDqA+0eQ9T9USjKd10TZwuBRQAge5PAo6b7TRXGSWIMBgyTH+PBLlVexSgC
	t4gLL0Br4TTrMJP3uyFKEJxc8f1nDFLOn/wOPd35kaiKaopJzvtxaPldLtot0Jf9NqV59M6Dgwu
	r1/CjLPRMUvZfmyAOvyHVxVrPKmSxGXWje1y+pjh
X-Google-Smtp-Source: AGHT+IGwNUNxA01WRc9bPdVz1GSmsf5EHfuq7knr43OKBQrWqaclxDJN2pEyp9jAXY6JIC3+Wo1lJg==
X-Received: by 2002:a5d:5885:0:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-38f7d1ffc25mr4536838f8f.4.1740381254826;
        Sun, 23 Feb 2025 23:14:14 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399be79d92sm111533745e9.0.2025.02.23.23.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 23:14:13 -0800 (PST)
Message-ID: <3d23ec54-6e55-4ee4-bc1a-179ca97878ef@gmail.com>
Date: Mon, 24 Feb 2025 09:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
 <4tvpl3pujnuw2qjwu7f7ryrr5dndxow7srkkp2223wmexr23bi@7nmgrpq6znpg>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <4tvpl3pujnuw2qjwu7f7ryrr5dndxow7srkkp2223wmexr23bi@7nmgrpq6znpg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/25 01:43, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 02:22:21PM +0200, Ivaylo Ivanov wrote:
>> Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
>> binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
>> reset lines for reset control and uses more clocks.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>
>> ---
>>  .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
>>  1 file changed, 57 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
>> index 22c77968f..f4164db71 100644
>> --- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
>> @@ -23,6 +23,7 @@ properties:
>>                - qcom,x1e80100-snps-eusb2-phy
>>            - const: qcom,sm8550-snps-eusb2-phy
>>        - const: qcom,sm8550-snps-eusb2-phy
>> +      - const: samsung,exynos2200-snps-eusb2-phy
>>  
>>    reg:
>>      maxItems: 1
>> @@ -31,12 +32,12 @@ properties:
>>      const: 0
>>  
>>    clocks:
>> -    items:
>> -      - description: ref
>> +    minItems: 1
>> +    maxItems: 3
>>  
>>    clock-names:
>> -    items:
>> -      - const: ref
>> +    minItems: 1
>> +    maxItems: 3
>>  
>>    resets:
>>      maxItems: 1
>> @@ -58,11 +59,60 @@ required:
>>    - compatible
>>    - reg
>>    - "#phy-cells"
>> -  - clocks
>> -  - clock-names
> Why? Clocks are required in both if clauses.

Right. And "ref" is a requirement. I'll fix that in the next revision.

Best regards,
Ivaylo

>
>>    - vdd-supply
>>    - vdda12-supply
>> -  - resets
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm8550-snps-eusb2-phy
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>> +        clocks:
>> +          items:
>> +            - description: ref
>> +
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - resets
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - samsung,exynos2200-snps-eusb2-phy
>> +
>> +    then:
>> +      properties:
>> +
>> +        clocks:
>> +          items:
>> +            - description: Reference clock
>> +            - description: Bus (APB) clock
>> +            - description: Control clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +            - const: bus
>> +            - const: ctrl
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>>  
>>  additionalProperties: false
>>  
>> -- 
>> 2.43.0
>>


