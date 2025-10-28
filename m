Return-Path: <linux-arm-msm+bounces-79164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE1FC1439D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70D31A683C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631C13081CB;
	Tue, 28 Oct 2025 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BF563+/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C75230E0EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648627; cv=none; b=Cs16i500g0mluyaoN9Di+pD+in3lgvCk2a184NzJApEILxKgTfYPCZE6Df+QOp9uGc9fhLnB06JMndzPgpq5/ltf1TxurwHmbOSX6yCeROuK1zmYYUVx5y3Md9qJ0h1m5TcBZ1GHxteuMRyPSilttHHXp9oVQT24x20Tx09uh14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648627; c=relaxed/simple;
	bh=BCtbbIefRxl8ETsCXIFJF+wlsHm3vUU5KSEZnsuKlYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1afXutZs05feSnXsaB4ItR/IIDQqGBXeNxBrq2Hh5AID3T20CDnemErei8oLSXqFLRvkNkxqvsXB4H8ZQENH0+TSxJ5CZ+mm4wAc9kj91clMDbJcNT8FUf33Wxgvanlc2h/k073YY58RyOLemdpkGcSTOkCzNyMVQbY10ggS7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BF563+/k; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47114a40161so65647315e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761648623; x=1762253423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmrMQdnFbXTRUvWSj6UdlngxWpZlUvtP+bCbfxielbc=;
        b=BF563+/kLFb3HWB/fBQR9NxO9fHkMUD0suIKa66ZBSA4qe6gJ8x/ktXlB/qeA0Bu6N
         1w8sxbd+cb5Elugj0ibkHMUM+oMfODpX1YXziu/AZg1+IHMtdrUFtf7u4nSvYMYG2wzT
         /hHR7zdhUabN2YhHutwMioF58VPMknth118aiDmr+RUyyE1d63C+bfk1msPyVT7nYc8/
         xdC0G8Z9CAERV50z4eq9frfz288a/fHvAV1P57SOk+4CvqTnzV2Hs1sw/WTUsHd++7Xv
         ziZAo4b2JSEChQ+1liHRsROOCuQXoEM0QQwdK3wRkkaPY1rj5w9gXBV7z+tBj4kA/avc
         kUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648623; x=1762253423;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmrMQdnFbXTRUvWSj6UdlngxWpZlUvtP+bCbfxielbc=;
        b=ssUTx5chWbFfe6Mjlf5IC8G1FB+YLHuGGnIY0MYAlCqkWsquxr6Z+eXM9VzJlfJcOH
         7117JKCGEcRoy5St8ERJgCeDX7xqxLCPYWzySQsYFBC03r0mgIb5OM1gEoca5h4KN9r3
         B/EIg2u9OZLsnnn2Qg7ydBNrMDtz//DaF9f/Cv/5B6XTS+QkYlI+t74A/uadAHcSlx+b
         mm4B9td6cG1ASYTkI5O/fE6nkhJG7JiEGwSrL2tu6LkcBYWiL5Bj4pzixJn3uuK5qpR6
         RGLg/HV/6ot0FdgyJW2Kb729kWpOwnunSPHPLjOCXW3u3gQvANTJ6mfABddId3BYPPlP
         Ou/w==
X-Forwarded-Encrypted: i=1; AJvYcCVH/NMlw+T+2EsT81xf/BS8RnKbFoCOxaPNXDZLOUIznn8jKmL2XgK8yhH7TgrV+3NKe9QLUfLCtLkpZHr7@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMOOozIAsa0+gwdIyu7oVTeQcUZJPfgz+PSWbrDHCzP4bHKJq
	AJSc7QJiuv5Hn0Q8vw/KfhAcLQHozlZsFKRLaffEBAiYBMisQuhfmrVYyFo4LhTaq5c=
X-Gm-Gg: ASbGncsvwE1918QRvLkgQIub8IW7j89PixR9jiMUwAPOkNv58zOdsz4jJVepKl2TsUX
	fV+TbE8NObOw9kKZU1tJKXqjxe6PyjsKRfM3MO4U2KX6Q7Kp0JYWGeZkk/9p2p513/xEl73Vc7m
	INWxLTaySQ+6vSRlYliv88BAolZzrS+lTn1ix3PO7wvmZf88arTytrP5N5PZ/9qEFbuZG3HS8uv
	SwrHZ/vtoNeCN6ZoxQqlBK/alMWADi3sWR1eCpOOwPAfs8Gni+mW/G5QtnM10CBdSITQkTK8Vvm
	ZhAXOHuLa7vAIpcm/oVcOR71GW7RyG4z/+F8VwwG9IifAnsA+899Nlp+d9wgFJC4b4JVw7AIBan
	YupTR7c2BEfl+CcrUR2D4QOCeo968YMjGyXbEq2pSg2jfWhJzheN+QJSdqiE/DCdvY8er5L6SMf
	MZvHOMddRe1MOmGH6+GIDZp16I6171uNQswjXxE6bd5+o=
X-Google-Smtp-Source: AGHT+IEW5Xn6pgsIVIQmh1ZteaU6fBGYQzaGzmRov8RIVgUKjWNp6avGgGE1oXye0/BWbWfHNJ1oGw==
X-Received: by 2002:a05:600c:5492:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-47717e37274mr21925335e9.21.1761648623445;
        Tue, 28 Oct 2025 03:50:23 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47793fsm191912885e9.3.2025.10.28.03.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:50:22 -0700 (PDT)
Message-ID: <56633bc4-5ef3-475a-9749-a6f455aad9c4@linaro.org>
Date: Tue, 28 Oct 2025 10:50:21 +0000
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
 <936ecaf4-8b48-4c93-a666-153a13ee9e16@linaro.org>
 <b8550097-76c5-4843-9b05-0802f3a4e3e6@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b8550097-76c5-4843-9b05-0802f3a4e3e6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2025 10:39, Krzysztof Kozlowski wrote:
> On 28/10/2025 11:24, Bryan O'Donoghue wrote:
>> On 28/10/2025 09:46, Krzysztof Kozlowski wrote:
>>>>>> +  power-domain-names:
>>>>>> +    items:
>>>>>> +      - const: ife0
>>>>>> +      - const: ife1
>>>>>> +      - const: ife2
>>>>>> +      - const: top
>>>>> Uh, not your fault, but who came with this list in previous generations?
>>>>> Instead of simple and obvious "top+ifeX" which allows growing/shrinking,
>>>>> someone put "top" at the end which means this cannot follow same order
>>>>> as X1E for example... Heh, it follows at least sm8550.
>>>> Shall we put top as first power-domain? I don't think it's an issue to
>>>> change the order.
>>> Well, it matches sm8550, so I am just grumpy complaining. It's fine.
>>
>> The provenance here is "top" was required to be added last because the
>> code depended on magic indexing in dtb to know which was the TOP GDSC.
> 
> 
> That's silly, because if it was first element would be much easier.
> 
> Best regards,
> Krzysztof

I'm sure it was an accident. A bug, we fixed it.

Anyway that's why.

---
bod

