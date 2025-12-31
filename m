Return-Path: <linux-arm-msm+bounces-87073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD13ACEB8C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35958300C1C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D292E22BA;
	Wed, 31 Dec 2025 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWlNSgs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E93128B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170105; cv=none; b=chZ/J/LkUPO5y+JD7mDrByLw41f9xO09LXmkarSWOa5gQBlxzfurj5dUwBBVIu7lKcRF8+uQVDnBaXy9ToMYs9ZsAQSbKwNUYvH1wWK8TbFPFs3NvcwQLBSoDDzQRD9gcyLy7HbCMr/eDtwwX9xku9ZJ1pIldXYaYkeG5gmWCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170105; c=relaxed/simple;
	bh=JDWS9/pcDlSo5dcHYgDW+IDEa86kz1UK7AomgxHRh0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRlKhlAMqURFa+HEWQoHE+VmSOKdR6typSBJhr//4e8JJOMVKiyH7rf9agpHfIbAHk38Y52KcmC0227iLv4k8DS6OGfRxk+EbVF81E3i6sMy88o1hVbpH7P7ps03wKzWb/f1o0uN+gZNMlCgG7fRpxShXTbkwHPz87O+yenV3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWlNSgs0; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37baf2d159bso21913931fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767170101; x=1767774901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpp/z+J+tsEiwPe2KgJPeWCipeCjqxXWZmlQtlixZvA=;
        b=qWlNSgs08vpR8ThI71PV4rGNUsQvAaGPFLkuh0h2BdSEMF+CPezRQLG1fDIPc3fd7i
         49EgcvKy8+Oj2T/rvbJrCZRSkTr3u70dfPKtG2xqOVe1XCEHPHxJq5nAmELMXgJ2uypv
         n+PY4E+OIySYVzMDHKs9rlQTFLJc62EEjjsJ+DCqtIjTWbul2WZai5xg0QQggRpa/c/o
         q5zHFXEQfJZAPxAv7n12cBxSYN8+Fm2GsrQUlk9o4iVTfdTXnAaZzyGkgc08UXegTCXq
         TKAvkRGgH1CtXTjZEYQv6cC/GPVAI3z2vzejomNcymDANROMS8UW3Dh4HVDSDq2n8bUt
         Yr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170101; x=1767774901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpp/z+J+tsEiwPe2KgJPeWCipeCjqxXWZmlQtlixZvA=;
        b=nXtqw+QqPk09mGNadXe/jR32QdW5c/ZfjbU1QS+y1hfByIjpVaEOEW0yp4Ih8+lKtr
         dMZpfNWrNc8142wBbNAC4kb9E2shRdt4YXLLYDD9hnI4aBEi/zPH8ocgvFUbR3TTQA1c
         ldfjkaa/CBktaV3miekQ+sMV510DUKTYAyCTEu+UqVXxp36/5gRiLX6XBAj3Yg54w+ML
         whM2/+S4ILrbFmxXUkUI6HD7qOwWfXN3bLVm025WRVataIm/8CjGd1PCaaLM07SMV1yd
         iUk7IviZTCNGotYW7m1w1KFKgn9Z1YKsLQecmFEYeSFHgdKTglOioIkZzyXj8+aNITmD
         9uiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTAozW7NtxjVWuSvDvTyUC2Iri7OZyoZKLGRJdlqc2lcE0DDaWRTrp69jpkAcVyXwKv0ZWnpztMmAq+IEy@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHdBeocosxkssRnEhv9/FOtOmlTvUoMnLrISbH/wE84PdUpq6
	vncSKV7vRLOwKnSW1+glFWvJFUuwLGu6ZVsMG7CEDZtrytfjZZq4vHvNonQaROoN/7g=
X-Gm-Gg: AY/fxX6UAJqWj2QNw8XFZ8JTnsTNzCKb8qP9CD+Vj+PZHjaKfa5ANc5uOB7n4Mv1xG2
	kB63SHFv8eLGJcE5iHJQipu0UQv15R4oUGC12TDqJGjEQk5ZhWow+Nzue9fQS0o8qJCMHERngiF
	k/MvA31vip27dbyatjD6PH5BJBH1LakXFsW2r6M9Nc/b6rK57g1TL+pnn8i7zv3VWRE8sh6p4rL
	AkIjLGlFIxr2wsRyO1Z6eKsTYmUekWsNKpcYJIfCf/tpo9CeDMCW2DfJ51xTETWNKQ6f3OqOSkQ
	2Ub9YU/X2B1794nZgywfWnR53+Bl/WBPpdSUsfQfLEmiF225baoIdwgzIfIpElBP58kxKKclU0k
	xY2lkOZSgHTvjBzgweCzNg82aDGxwpGG3+JjnjbYR+3gXxAG4IqTcyc3RneA7gJcLoLltJuXwy2
	FUjQeNHcUnLvtE7UKo8G34jZ12Kk3e75KiDPii8gPVZNarxj3TNrlG7496v0rTEtaFcQ==
X-Google-Smtp-Source: AGHT+IHMK7CiqyMcRO6mPySQIRVNL4guO+avS82BCcU/vB06uk+9kxXjB6+ZtfSaA4TXhkYwNr1bmA==
X-Received: by 2002:a05:6512:3e1b:b0:594:5607:3b1a with SMTP id 2adb3069b0e04-59a17cbfb40mr6988752e87.0.1767170101072;
        Wed, 31 Dec 2025 00:35:01 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd252sm10637734e87.24.2025.12.31.00.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 00:35:00 -0800 (PST)
Message-ID: <8a0083a8-cc5f-4f08-ac8e-7a4516e0de54@linaro.org>
Date: Wed, 31 Dec 2025 10:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org> <aVSSNGCtvcYCTylu@rdacayan>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aVSSNGCtvcYCTylu@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/25 05:02, Richard Acayan wrote:
> On Tue, Dec 30, 2025 at 10:18:39AM +0200, Vladimir Zapolskiy wrote:
>> On 12/30/25 04:27, Richard Acayan wrote:
>>> This series adds support for empty endpoint nodes. It is currently RFC
>>> because it continues an ongoing discussion on how to selectively connect
>>> some CAMSS ports to cameras and leave others disconnected.
>>>
>>> The SDM670 patches are for a full example. If agreed on, this should
>>> expand to SoCs that have CAMSS.
>>>
>>> Example SoC dtsi:
>>>
>>> 	camss: isp@00000000 {
>>> 		...
>>>
>>> 		status = "disabled";
>>>
>>> 		ports {
>>> 			#address-cells = <1>;
>>> 			#size-cells = <0>;
>>>
>>> 			port@0 {
>>> 				reg = <0>;
>>>
>>> 				camss_endpoint0: endpoint {
>>> 				};
>>> 			};
>>
>> I do not see this device tree node layout as a valid one. A 'port' provides
>> an interface description (an option), and an 'endpoint' declares a connection
>> over a port (the accepted option).
>>
>>  From dtschema/schemas/graph.yaml:
>>
>>      Each port node contains an 'endpoint' subnode for each remote device port
>>      connected to this port.
>>
>> This is violated in the example given by you above, when a remote device along
>> with its ports is just missing, thus there is no connection. A forced alternative
>> reading may (or will) break the legacy, so in this particular case you shall
>> start from making a change to the shared graph.yaml documentation, since it's
>> all not about CAMSS or even linux-media specifics.
> 
> So, if endpoints MUST/SHALL (in IETF RFC 2119 terms) have a remote, then
> would it be acceptable to label the ports instead, so a board DTS can
> specify its own fully connected endpoint(s) under the port labels?

It could be done. For the record, the solution is not to "label the ports
instead", but the preliminary added endpoints should be gone, and it implies
that the labels to the endpoints are gone also.

> 
> The labels to ports aren't looking as "excessive"[1] as they used to be.
> Is the original review comment on port labels still relevant?
> 
> [1] https://lore.kernel.org/r/565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org

It's relevant with a modulus of 'likely', it's so secondary that I've issued
my RB at that time. You can write a proper dt graph layout without using dt
labels, and since it's expected that you touch &camss anyway to change its
'status' property value etc., you may add ports and endpoints under the same
labelled &camss device tree node at once. There is no rule to use some labels
no matter what, but technically you may introduce port labels and add endpoints
by a port label, this approach is practically found e.g. with Rockchip or
TI ISP device tree nodes.

-- 
Best wishes,
Vladimir

