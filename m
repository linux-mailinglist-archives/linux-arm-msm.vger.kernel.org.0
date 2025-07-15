Return-Path: <linux-arm-msm+bounces-64983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E8B05622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B3017FBAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D522D5C74;
	Tue, 15 Jul 2025 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgoy+s79"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535D2D5C62
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752571206; cv=none; b=VrfAnxJ8Kphn1ba2mCmzUKLd9VKpajI2rzMn0HFhiINo/7ZrobLFFhysLIJ6s4cckXGRa1bQyakV/ecAqnsCl2Ut410QVQPhny2zUoF2VsdagOWwiZP/ZF3ZJmFG9AKG0fCsaWSKX2bXGVJuXJc3j27+JT6XljuEY9BFVPdMvtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752571206; c=relaxed/simple;
	bh=WJ0yyfeuefaQ3urFYkT/IqHAzlcYqFbbdEzN9k3/XAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFJorvVR6q73uTqpnBHo/pVzhnZnylEfzqC//xID0N+U7Nap9uCYSAYiSwb26w9isQ52R9aWBER3xNt+LtFp2t0L7VZ5nAFV7+rC8I/0Pl6BPz4V/aZyDJ/upkgxKZ2NBeK7fsDNz6DCPapwhfLVBMuozFI1SHGFklcKJ11XjDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgoy+s79; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55a1eced1abso12701e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752571203; x=1753176003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HNruVe4qBBDUZL0Lbc5vbGw4m9jJzAK3Orw+77L13s=;
        b=fgoy+s79h3rlWgIIY40XSBpLTYu/D+042IdparMa7BxPt1oZjqvcuLPoeuk68FRyH8
         oEUFxiHeinWZTWMKBXv0ls50+UitReQw9t+KQyQckvFTZZxqwOmnKgEKpVNRlcU4A/hO
         cp+1DM6rFrISUhwTo3szQWTZDMKbINkiovoaUeVdF39FAK9wSfIhbCossVlIzZLRM/62
         fqFICLiObWg+7+/qr8bMZ6x/pIXDPxabk9qDJXstehF1m4NwCZADOlR+/OpYOeLYthK6
         sWdBvf7w8sHHL/JAkMReVFPYwoVI0YwiaGTC4rEd3qk1u9DYgZ9TS7hYm1H8Tky7f5t0
         XmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752571203; x=1753176003;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HNruVe4qBBDUZL0Lbc5vbGw4m9jJzAK3Orw+77L13s=;
        b=pElrCSRUciW7HCQbrXuu8vG2NaewLPzpkBro645oaXnfVl3PQ1YRkU+7kvFm4eXkb8
         5W9euJVMJlOs0caqwT7uUWfSTuUSRg/sdY+jc1sGE0M0243F+3DaT/494HmCcseOwtNt
         /usBbpwIk2GhOGaYVRyYn0FVX9LgHFcxV8J1FjriqFYWYXrgOkqGnZl8b0pxqr27kTLE
         29TOMMi0FlVV3Df33ULJDx6V+vzCpnFoi/s8IJF/Wpc5OPwWrGYua2mju9fVTOS/Pzt8
         gK2up+lt4KpaX2Ugr/gkWSF+3N/IkWmy0cuxspbcBK2IhJpPfWH/+3KCxqyYRoG6QWyx
         CgZg==
X-Forwarded-Encrypted: i=1; AJvYcCUQoOIQkO+h/4HtM/Ld5Y4StVwJV/6yhiXnxFp0O9f/0TGLrsLc6b2RM2tMPKnmBCKLOxsr6768b56mbjO4@vger.kernel.org
X-Gm-Message-State: AOJu0YwNmMCt+HsEcffSm77GsSnDD9o2hT3/Rc84o/aU8pAFMukrkPud
	mldu0aFgtx2y63Hm2NQ1/6LP1Q4qO9U7I9Co9n6hwTnRpu1z8xAYaa5+mq4eIhVsIK4=
X-Gm-Gg: ASbGncsu26bMji76fNOQjGuFQI+G5gjK4r9tF8bl6rMiAeYo+ACndgTKX4Zf1pc2YBB
	U7zm4WtInbza/SV6VrEdNWlJEKNMd0BauaxnjbzPlyILHfP+nB/3BetRlMugL7W1abhyYztVA+H
	VTW+RDfJb5EbOT6CccY+SpTwI9AekvEKQ4Os647PK1BI3mHcVUKW0OsP9ciIxcmkGq9b9XHfdUb
	B8f2b/0QiTPMUh6mwNAf/RweqWWotHTsYfOr4XbJ1zfiGHMI7D9Pc4Q2Y0HbwlCGqB11ObSLhMo
	9UKXPlbCAL3Pw7CH8mBL0Vjk7X6VnMA91Bp3as+Bk47aPz7v0qol+I31C/PiCnffUr8TxTi7wjL
	ggTMwU8XjV5hVLb1qBCKHJSn7otHMkvq6Vlgn1XD5gUBTRoRd6SVmMRqUgCs+kRlbyi1/Xo00e0
	bmFHz2ZJJY9vw=
X-Google-Smtp-Source: AGHT+IEtlBg+zNyCSrOBvHI33+JpaeCaJB/UDUCJntM9+i8ejxLCPtnoDTFHXY1bC6tD2cE1QVQIRA==
X-Received: by 2002:a05:6512:3b1f:b0:553:2421:f5e5 with SMTP id 2adb3069b0e04-55a1fdd2b75mr99165e87.9.1752571202789;
        Tue, 15 Jul 2025 02:20:02 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6f497sm2192227e87.188.2025.07.15.02.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:20:02 -0700 (PDT)
Message-ID: <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
Date: Tue, 15 Jul 2025 12:20:01 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/25 12:01, Konrad Dybcio wrote:
> On 7/15/25 8:35 AM, Vladimir Zapolskiy wrote:
>> On 7/15/25 03:13, Bryan O'Donoghue wrote:
>>> On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>>>>
>>>>> I think that is genuinely something we should handle in camss-csid.c
>>>>> maybe with some meta-data inside of the ports/endpoints..
>>>>>
>>>>
>>>> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
>>>> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.
>>>
>>> All the PHY really needs to know is the # of lanes in aggregate, which
>>> physical lanes to map to which logical lanes and the pixel clock.
>>>
>>> We should add additional support to the Kernel's D-PHY API parameters
>>> mechanism to support that physical-to-logical mapping but, that's not
>>> required for this series or for any currently know upstream user of CAMSS.
>>>
>>>> Please share at least a device tree node description, which supports
>>>> a connection of two sensors to a single CSIPHY, like it shall be done
>>>> expectedly.
>>> &camss {
>>>        port@0 {
>>>            csiphy0_lanes01_ep: endpoint0 {
>>>                data-lanes = <0 1>;
>>>                remote-endpoint = <&sensor0_ep>;
>>>            };
>>>
>>>            csiphy0_lanes23_ep: endpoint0 {
>>>                data-lanes = <2 3>;
>>>                remote-endpoint = <&sensor1_ep>;
>>>            };
>>>         };
>>> };
>>
>> Don't you understand that this is broken?.. That's no good.
>>
>> Please listen and reread the messages given to you above, your proposed
>> "solution" does not support by design a valid hardware setup of two
>> sensors connected to the same CSIPHY.
>>
>> I would propose to stop force pushing an uncorrectable dt scheme, it
>> makes no sense.
> 
> If all you're asking for is an ability to grab an of_graph reference
> from the camss (v4l2) driver, you can simply do something along the
> lines of of_graph_get_remote_port(phy->dev->of_node)
> 

It's not about the driver specifics, my comment is about a proper
hardware description in dts notation, please see the device tree node
names.

-- 
Best wishes,
Vladimir

