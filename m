Return-Path: <linux-arm-msm+bounces-79158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B970C1418C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CDB44F79EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D87302158;
	Tue, 28 Oct 2025 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojAk/8oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A807276051
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761647056; cv=none; b=iyRHYFGZE1Nh6xf6PWPS03IEdyFsvi0Terx5IgI6+d6yGTIwyLpeVVFWLd9EOVx5jc9gr0ctwRzKYWMozS8GTKeElR/V6DFizV1Lrq1jKPqz5lJUCHsCNmdVQ8I59wUxN2aTZ48UX0OTbPM4rzqgkRf8n3BFOrfnWydtmVmeKuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761647056; c=relaxed/simple;
	bh=EL5sc4Geev4x+fvpuOCTZdXy/2d70RTa1mtpThD3oD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lj3g9BlQE2XIltn4Olt3pe7An79FNYri7U7oaPzanl9bJtNpec2ImhqYQo1dCyHOHWge+lcLjDksQDynel2BYvBD20fEMIhzCtjM0uhfmYxVa+8gqHiMgzSQyb25mXno5KmTQcuqIoLTfIsU/4j/FQttnJSW3qBp4WRLedTpZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojAk/8oc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so3672809f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761647052; x=1762251852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VJok45Nt3q/TDUcEtsKTirjSQJi6dBAwOmqzr+WbBo=;
        b=ojAk/8ocervYZa/5GvWAdV139epv9rlShWhHNY7KSMf5Y00ocoerYMtLqJRsmgs++q
         M1LCbCoU7uvJNJ/ekZ9gWUnqIOU1n0AtLvFfTvZxWv4UfS70fL2h+OU0lO7IZzFrqiQ4
         GEaQlBCqeUSP9BtLKzDyekw/8sEIhdSGv582TJKE7eyUXfjdKHdCUy4vMvHWxe5VQJcC
         7DLxW8hgO9GE2jRg366JS6xtNHH0iiUPnDuBL0ppqQoSwMIZm25gopP7eQ/ipDwYZM9t
         BOrCFvfx+0hmDXT4MT6MFtJSNKAVt/m5FMXXxmIxXfkNhzuZ2MMhA1JvVyEUT6BX/hqs
         kYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761647052; x=1762251852;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VJok45Nt3q/TDUcEtsKTirjSQJi6dBAwOmqzr+WbBo=;
        b=E/+IJ6H3Y9QmvW+nxe4jOSGLBashK3vb9oVwJdN4U/rpbsypgA/k61TIBr4yZzR0iD
         nES3fLX9eHNeU9FGjX6D6PUrF15B3BW0OuCf0doDm4grfskD7mNcRjSRHeOr3Jh/XiIW
         rB6W1pE9RQHR5/2tdsuFeLnlLhWRgggYdRcQuTiCcSVDK6Ydc4XofaqkcN3GGxaLPRtr
         DRwyEvsg7LkOLLaMsW6HwH70N4B82LMqvvd1JlSMzChPqwCZugJhvV1OjepSI5P1Owos
         caT2ProkQnOCFljj2E22i22uCG8wPDOmEJoa1bHJqjvfRNdX9bpAUbPM2s3Jc2ycUrLp
         OXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhjkamP5zUGXY8jv2kmovMC3Dwy4BPnq6STeUG9cbP0qr1w+qj/GzWjVcdiyIAZ+825PbHhHcosc0EMCPV@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7fFmqPSrMC91aBxxrYTnkzhXLnbiKWr5S7CVgM5Bv5Vcc/mN
	6PYC5M7JJI+7MrGKA1WSWwFosNG6dFSb3HcQ61P74iK3jsKRHmApPOWgHFONvKfdPsc=
X-Gm-Gg: ASbGncvTARZMQs7ltjr0B3ew/BkSHK71AHO2lybdrIA/DnEYcYzOCPbH7nHkgdtZarY
	oMyHcRLUj9l52j22/Xd9Ti7IDu1aEepUz24WuU+n9c097y5Uga/bCylCnPxxTZIS+PK1j/HMYKV
	5VU4zCAxsttRJDNdKJlLrmRwL7SdKRDjBmZPXHm0CQsHM9ciBKHvTJPSqhJKUXclFE4nZFfqdFK
	Btfe1GjyL7KvOG1oNfE4bimuq/QDERxv1wjDMRXFzIH7xd2n+h85+5KlaZsoP0mJ+TN0EhJrq+h
	G/13vWYgV9s6DQJMAdRmbP912bhoMnSkPKP0TjXbundpmKuET4aGV2NdRhAAWIvkrGFH59+sI5H
	czYhfU8JL3VgwScKf//vHsRY3Zcw5saXebw91oqGwSdtrPYCAHs6MoRAPhksNeZmqoDOhn+y/2P
	SS4Pcwewq0hgGHDbh1xmR+OcnRUYLBKeGibxtI7x2RNh0=
X-Google-Smtp-Source: AGHT+IEW6jnKStLoBQEjVC10xDA/sEUNafyP+ddUhg13U6lTe/41VGR5b+Ux9xIvwfx/4vyZeYspcA==
X-Received: by 2002:a5d:5d05:0:b0:3ea:e0fd:290a with SMTP id ffacd0b85a97d-429a7e36d88mr2380269f8f.12.1761647052499;
        Tue, 28 Oct 2025 03:24:12 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df62dsm21236416f8f.45.2025.10.28.03.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:24:12 -0700 (PDT)
Message-ID: <936ecaf4-8b48-4c93-a666-153a13ee9e16@linaro.org>
Date: Tue, 28 Oct 2025 10:24:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
 <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
 <0bf4ab2e-9846-4f8b-ad72-e9db6fb7d08e@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <0bf4ab2e-9846-4f8b-ad72-e9db6fb7d08e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2025 09:46, Krzysztof Kozlowski wrote:
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: ife0
>>>> +      - const: ife1
>>>> +      - const: ife2
>>>> +      - const: top
>>> Uh, not your fault, but who came with this list in previous generations?
>>> Instead of simple and obvious "top+ifeX" which allows growing/shrinking,
>>> someone put "top" at the end which means this cannot follow same order
>>> as X1E for example... Heh, it follows at least sm8550.
>> Shall we put top as first power-domain? I don't think it's an issue to
>> change the order.
> Well, it matches sm8550, so I am just grumpy complaining. It's fine.

The provenance here is "top" was required to be added last because the 
code depended on magic indexing in dtb to know which was the TOP GDSC.

But since power-domain names are now required, you can have any order 
you want.

> 
>>>
>>>> +
>>>> +  vdda-0.9-supply:
>>> There are no dots in property names. Are you sure these are called
>>> VDDA_0.9 in the device datasheet (not schematics)? Please look at other
>>> bindings how this is being named, depending whether this is PHY or PLL
>>> supply (or only PHY).
>> The following power supplies are mentioned:
>>
>> * VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
>>      (not referenced in downstream kernel, connected to vreg_s5a in
>>      schematics)
> So that's vdda-pll-supply
> 
>> * VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
>>      With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9
> vdd-csiphy-0p9-supply
> 
>> * VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
>>      With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25
> vdd-csiphy-1p25-supply

@Luca

VDD_A_CSI_X_0P9
VDD_A_CSI_X_1P25

Agree see this on schematics.

and look indeed there it is VDD_CAMSS_PLL_0P9

but if you look at where that rail comes from its SM_VDD_MX

So I believe the MX power-domain should cover this instead of having a 
new separate rail defined in CAMSS for this.

---
bod

