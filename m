Return-Path: <linux-arm-msm+bounces-51071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA8A5D21E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 22:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ECEA7A73C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 21:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D2E264FAA;
	Tue, 11 Mar 2025 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/4EFY6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B5D264A8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 21:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741730215; cv=none; b=oOEE8WKtOOQb3vdvWEQVNsiCW8JwO2e14/TDRkSyst4kq1vA0x+uaFsg0pENMe8eiVbTPrHX3E92BeNd9paUkNMqmbnGRMm/pN0ngS2iXlzeQh44Z4XWrEOxqWlU+V+PE+flOCqTL1S5BbPIBUgAfi4b/Dzg6ZFqnHQBwWKRF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741730215; c=relaxed/simple;
	bh=avNY8ak+JQWmkFVsZS0aeZyCgTV7dWit3U7qT7O+ZI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bq3wcVhV5PF9SHjPJMw/wb4tJdCmaBjPiXCFdxCBbdIyHaIv8sIC3wPL8yuaAuZZTUqZQ8Y27xscYquIdcBVqSMKI3hEX4EYvG0G5U9+oq5ZdGl2cg5lnkWLqM1Lny0XGSV8P+1LO1p46zwWYMpOeR0wFQOugqQW6Unq3vVMqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/4EFY6c; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf4be81e3so3741171fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741730211; x=1742335011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXfL2talT+3Pc3/IEr/DhQxuVz1xDl6VWwKjRxG3X98=;
        b=M/4EFY6cIVYvdw2LILkLrz9hi5jz+hEd0WxqKe2+e2uXEhWds1c8wNc2TUGmnDd3F8
         bvF+yC8mu3usy+jlHfhVXFZF+Smn4TSKgjHxWS7xgfJC/msJ7kJoamlnTfhDziUUPCe5
         njbxjOMWOc84SrvU9qwyrO4/rCZ1moRke350leqQ2147BDUlevwfTEMyP43eKyVrLlPA
         LDUEalgs8XfrRcYrlJulv2k77ZUSeXlGPzO9d+ImhM+ca2U+OePyOZ8GK3dLsTGrp9Se
         nM3KAXw3aMM+jc/NpoIavEonN/HT32Nl8gUuAr6i6r7eI3G3LktTTa77Gh7HGIWKeXGe
         Q4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730211; x=1742335011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXfL2talT+3Pc3/IEr/DhQxuVz1xDl6VWwKjRxG3X98=;
        b=XIJPSiVN/rUk7YBywgzBt4RqZ9WpQ0xV5Xma+DHeYcPoxyANt1KcnBQOXylAjSIP1w
         Qwo2Fb7U0b3ctZaAYqcWMqAowyUlpJxgT9GNOtkPnAv8rL/fuT6nwEGmSs0jwpr3TDCi
         Cjw6jmkHdUWd+DiVNDLfDEb/aDtueDgZrZI+YQmcPG/RNA7/TmGdyNTc0BnyAxHB5Frc
         sh1um51tNZaNtuHOWoo0okGVha53OY7i0NTueN+sQtd9TggbavPNSs2toC170VxAwLpR
         9LKvZUSs7nY1v4ME3krB6xmRtNT+vfB7pasudcRACOHYRmZbC0WXhlkJTzhX75Juc4BH
         vFOg==
X-Forwarded-Encrypted: i=1; AJvYcCVqzUCLL/bq/wCcXSrLIy41qJzDk/SWVchQ7dMh//UCWaPhq0KX5kwtXb7lTmOIxqh7ImP5wDcixB5R8yrY@vger.kernel.org
X-Gm-Message-State: AOJu0YwePpUpOBHSG671Kl1980g4KAkCVQHFgwcKXjhPSKI1mw/kDhw4
	x43r9vh8oJ1DdhI41l2wsURypdPZf6BvK+dK/C/dHa9tjF5GiSNlgEISHLNo/qU=
X-Gm-Gg: ASbGncutqzVO9N1P17XniAkNRzsqEzKmW0XzN8lfZAOF1vDbPMjDJAexgAZO7Mx8UXT
	XJu3AcwPkVnbYb/td8Qj8Mk3Lml/jmD4K82osAo583Q2U2hEGV8rde6TWI4/PTAXc04EkCxW7jc
	muLkQZCwvLdidKcOfqWPPjpks3tFUPY/H+uKbJI9wpI/kYVcYz0YXGJtK7MNlZk7Vcmh1I14LMJ
	0/xmkgwPmFubseyMEdaEF6SyJSQybeuAZQhbdp4B0yCdPIPqmrkEibU9aTGX4UUm+mXfTHYdouX
	P6pgGIc4D9+XJP8OLLBMWE4EnsOmPY/sJN0UKYDxE/3YM9hEcQL75exyslSODt99kT/mgdG8Gyj
	9mMsT708r5MO0RjphUU0WaQc=
X-Google-Smtp-Source: AGHT+IEYO4fmrspVYYrTHdjMDWmEnFADk1AWRMVfCLAiR2Kql+MwftBAWZmi1W1b6z3wGvyZYMCvEg==
X-Received: by 2002:a05:6512:158e:b0:549:8b24:9889 with SMTP id 2adb3069b0e04-549ababf63cmr763732e87.6.1741730210970;
        Tue, 11 Mar 2025 14:56:50 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd5b5sm1901122e87.158.2025.03.11.14.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 14:56:49 -0700 (PDT)
Message-ID: <3caf6aa5-32d4-4e2a-8872-87e5ddadd7c4@linaro.org>
Date: Tue, 11 Mar 2025 23:56:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

<snip>

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]+$":
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
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +

bus-type property of the endpoint is missing.

--
Best wishes,
Vladimir

