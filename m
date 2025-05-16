Return-Path: <linux-arm-msm+bounces-58160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD908AB93B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B99C189125C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 01:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D4722422A;
	Fri, 16 May 2025 01:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2dYN2jw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6451C21ABB4;
	Fri, 16 May 2025 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747359640; cv=none; b=HVhacS+FwmMPN2hjFaSuofoiRDfbuCbhVM5EwiLHxcDK33GCOF6PQhWfqJsiaQ0L32tfHokR0TPdGPtMoAuhbJ4vvQ/baXQnAqSdkdlRDKfEipv5d7Dya33+f3GlKsUkdR5zhxT9qAPJ6MkLnEAiO6Ei4GNWOcndOE3YFtq6tRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747359640; c=relaxed/simple;
	bh=HOWTaMr10Y//SBsq/knUx6OQEtcZK6r9ddhtzirgbQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJXl/j9Z7YI/bpc7KPP+5GLy/SXVwlGMDSJb0kgaXnScHqN4QGTKEticOQej5HqoeFIzxPSw0iYIQwtOz2ozz9NXHwk/Yu2sedRGrx6T7pdZNIPOZAOPqJHhyTwvHKJay3UAugehaJUlZrguMLbP8Lz86kSQNQRi5eF5cQWyxwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2dYN2jw; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f7f7b70aebso1498864b6e.2;
        Thu, 15 May 2025 18:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747359637; x=1747964437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbnWlrrlEA62ju+DNKq+Eh0Q+yGH2JwjMo6Br6ozAQQ=;
        b=k2dYN2jw3WSnsg6PaG5afZiNzrsvCGjGmeMa3JQVhT+N+8FI3pFwGWvJsEQ6uxyJY8
         6WjeiQ+7ZpNZodzeMW47QSh8u3LBu7734ec2H9PGRb5aXhdMRkaAwAQuscu++W1aN3FC
         zkdolObzn28gN/vK+j3TPHY9myiCR9KcUSQlgsK3LDMMid5RLuYqWbUgTtgrHv2ngc7U
         9d5HGs5s5K+yLCaC3T6chDhKFRM75yxsQX+SQSlTQ6v7BP0wfGWSY8mYQiPfx6EvhILP
         rlajHCb10d/R5Lhgt+FJFGNeA6cTiH/gp3BhMvdxkWD35O0vgsHhwrJ9ozl7GAS6DC1h
         YA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747359637; x=1747964437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbnWlrrlEA62ju+DNKq+Eh0Q+yGH2JwjMo6Br6ozAQQ=;
        b=oSm+9ecCCOxaWiVrGHJhv3FRlgcNna8R/a2HHufQYig1PQnx3Hez/2/tlEsoc+UYww
         3Re+GmSUk20PilrpXCj9PAECyFCaPM/kzk0YfzyxhETCvW9ETKOs+EAgMoVA9Yur2w1Y
         EIVRMPtAQrfdNbG4DGOkONAMgYxeDepVeTTj5/DtJL4PM4s89JpU4Cjm5VCNui6nZ8Qi
         QMZnV3UVX+xGQ3WoYox6FMmQ0tCDKcNOER1qIhyIV/1FtyNdUmXuGEgeoEjTd0U6g78G
         7t6YKXRCOpveuUP2YvgG+vbKFv+kyybSGLHQ+rs6itqBHqUGJNPPR6g4ZkZdfJqDoF38
         i3KA==
X-Forwarded-Encrypted: i=1; AJvYcCW8P++4cyoFY5Wb82dRphPTOqk8hwQyBmIY4OQADWvdXqsGPeRwQoSc0pTMge9/UEh8QGHCrY6c2Mv7@vger.kernel.org, AJvYcCWFFsYBfzkHpW9wOPfH/+zqsBbOPDekECvOVm3GZcd6CibHDPPCza5ykfOubW7szDD2Be9qmCjVTrXyFgkK@vger.kernel.org, AJvYcCX3IQ3cZTzcrpCN7zUtUy29BY4Zoqia+Yty9NtWfAUcgKQKxtdkGUE//UgXgmRXcM+FSoPGcutJJmBbkz2LgA==@vger.kernel.org, AJvYcCXGek8CMyFE2+kyAYMsiMj69EIXAYomoPCkgY+7Fx33rKcBg5Gf4xt0vwMqzcNfsM9GMUeWlsZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAJE31R0C7rP0uZmW6Z4JvhUyJAg01irveZVL73J1GjVfkE3l
	jWXOveHOZgHavXUN7TWFO24xmlhDmIQdoLImCJNy1dV6Cw1qT91oWgPF
X-Gm-Gg: ASbGnctSRhxWoxtwo0iVwojMIdBpTVXgHkyuBa5TpLmGar/M5rOCh/OSobTSaNJy/mg
	YijW3cAkedZLd5FgXEs2FVqnde2xcjBLAcc/OdRNs5PTHaOai1cp2bknbUAzP+TCjCNpVRPgrvX
	yKfdi5OPLNx/7Sxkj5yPrINR6c4uWBxclwTitD6COo47CTNgfNuGkN5Hna/TrE5R4Dsd82eayTH
	jamzuv9cckv/72Qw0Ci20L5MPib8cylKEqXYb+tZG11euNElrbfRxOyOGjApxX3TfHllUz3fKRf
	S1H8qV0B+toF7Lr81N0g+Zw9QAznLfNZn2MXAvdzJO7oN/fMOUebNpytM2xDC7c/pY1JvLvUNZA
	YOmmlkqZHwd8aJw==
X-Google-Smtp-Source: AGHT+IETLFoqkRb+eG0skJqyUnlAjIbWcsG/aqzYb4kHYSnQsR/l6nXXMDIKY2j37A0T02BKkdYMog==
X-Received: by 2002:a05:6808:80a9:b0:400:32b9:7926 with SMTP id 5614622812f47-404d863751cmr1331555b6e.6.1747359637153;
        Thu, 15 May 2025 18:40:37 -0700 (PDT)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d98b2785sm154670b6e.33.2025.05.15.18.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 18:40:35 -0700 (PDT)
Message-ID: <be7f0fda-ac21-4f94-a6cf-b4c3ca59630a@gmail.com>
Date: Thu, 15 May 2025 20:40:33 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
To: Lei Wei <quic_leiwei@quicinc.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
 quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com,
 quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org,
 bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com, john@phrozen.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
 <20250211195934.47943371@kernel.org> <Z6x1xD0krK0_eycB@shell.armlinux.org.uk>
 <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
 <0c1a0dbd-fd24-40d7-bec9-c81583be1081@gmail.com>
 <c6a78dd6-763c-41a0-8a6e-2e81723412be@quicinc.com>
 <62c98d4f-8f02-43cc-8af6-99edfa5f6c88@gmail.com>
 <df2fa427-00d9-4d74-adec-c81feda69df5@quicinc.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <df2fa427-00d9-4d74-adec-c81feda69df5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 10:27 AM, Lei Wei wrote:
> 
> 
> On 5/15/2025 10:32 AM, Alex G. wrote:
>> On 5/14/25 11:03, Lei Wei wrote:> On 5/13/2025 6:56 AM, 
>> mr.nuke.me@gmail.com wrote:
>>>> On 2/19/25 4:46 AM, Lei Wei wrote:
>>>>
>>>> I tried this PCS driver, and I am seeing a circular dependency in 
>>>> the clock init. If the clock tree is:
>>>>      GCC -> NSSCC -> PCS(uniphy) -> NSSCC -> PCS(mii)
>>>>
>>>> The way I understand it, the UNIPHY probe depends on the MII probe. 
>>>> If MII .probe() returns -EPROBE_DEFER, then so will the 
>>>> UNIPHY .probe(). But the MII cannot probe until the UNIPHY is done, 
>>>> due to the clock dependency. How is it supposed to work?
>>>>
>>>> The way I found to resolve this is to move the probing of the MII 
>>>> clocks to ipq_pcs_get().
>>>>
>>>> This is the kernel log that I see:
>>>>
>>>> [   12.008754] platform 39b00000.clock-controller: deferred probe 
>>>> pending: platform: supplier 7a00000.ethernet-pcs not ready
>>>> [   12.008788] mdio_bus 90000.mdio-1:18: deferred probe pending: 
>>>> mdio_bus: supplier 7a20000.ethernet-pcs not ready
>>>> [   12.018704] mdio_bus 90000.mdio-1:00: deferred probe pending: 
>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>> [   12.028588] mdio_bus 90000.mdio-1:01: deferred probe pending: 
>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>> [   12.038310] mdio_bus 90000.mdio-1:02: deferred probe pending: 
>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>> [   12.047943] mdio_bus 90000.mdio-1:03: deferred probe pending: 
>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>> [   12.057579] platform 7a00000.ethernet-pcs: deferred probe 
>>>> pending: ipq9574_pcs: Failed to get MII 0 RX clock
>>>> [   12.067209] platform 7a20000.ethernet-pcs: deferred probe 
>>>> pending: ipq9574_pcs: Failed to get MII 0 RX clock
>>>> [   12.077200] platform 3a000000.qcom-ppe: deferred probe pending: 
>>>> platform: supplier 39b00000.clock-controller not ready
>>>>
>>>>
>>>
>>> Hello, thanks for bringing this to our notice. Let me try to 
>>> understand the reason for the probe failure:
>>>
>>> The merged NSSCC DTS does not reference the PCS node directly in the 
>>> "clocks" property. It uses a placeholder phandle '<0>' for the 
>>> reference. Please see below patch which is merged.
>>> https://lore.kernel.org/all/20250313110359.242491-6- 
>>> quic_mmanikan@quicinc.com/
>>>
>>> Ideally there should be no direct dependency from NSSCC to PCS driver if
>>> we use this version of the NSSCC DTS.
>>>
>>> Hence it seems that you may have a modified patch here, and DTS 
>>> changes have been applied to enable all the Ethernet components 
>>> including PCS and NSSCC, and NSSCC modified to have a direct 
>>> reference to PCS? However even in this case, I think the driver probe 
>>> should work if the drivers are built as modules. Can you please 
>>> confirm if the NSSCC and PCS drivers are built-in to the kernel and 
>>> not built as modules
>>
>> The NSSCC and PCS built-in. I also added the uniphy PCS clocks to the 
>> NSSCC in order to expose the issue.
>>
>> I have a heavily patched tree with PPE driver and EDMA support. That's 
>> the final use case in order to support ethernet, right?
>>
> 
> Yes, all the drivers are eventually for enabling the Ethernet function
> on IPQ9574.
> 
>>
>>> For the case where the drivers are built-in to kernel, and the NSSCC DTS
>>> node has a direct reference to PCS node, we can use the below solution:
>>> [Note that the 'UNIPHY' PCS clocks are not needed for NSSCC clocks
>>> initialization/registration.]
>>>
>>>      Enable 'post-init-providers' property in the NSSCC DTS node to mark
>>>     'UNIPHY' PCS as post-initialization providers to NSSCC. This will
>>>      ensure following probe order by the kernel:
>>>
>>>      1.) NSSCC driver
>>>      2.) PCS driver.
>>>
>>> Please let me know if the above suggestion can help.
>>
>> I see. Adding the 'post-init-providers' property does fix the circular 
>> dependency. Thank you!
>>
>> I have another question. Do you have a public repository with the 
>> unmerged IPQ9574 patches, including, PCS, PPE, EDMA, QCA8084 ?
>>
> 
> May I know the source of your PPE/EDMA changes using which this issue
> is seen?

I use a mix of upstream submissions, and openwrt patches. As noted, 
using 'post-init-providers' takes care of the problem.

https://github.com/mrnuke/linux/commits/ipq95xx-devel-20250515/

> 
> The openwrt repository contains the unmerged IPQ9574 patches, Although
> this version will be updated very soon with latest code(with some 
> fixes), the version of the code in the repo currently is also functional 
> and tested.
> 
> https://github.com/CodeLinaro/openwrt/tree/main/target/linux/qualcommbe/ 
> patches-6.6


Will you be updating a clock example with IPQ9574 + QCA8084 to the repo?

Alex

>>
>>> Later once the IPQ PCS driver is merged, we are planning to push the 
>>> PCS DTS changes, along with an update of the NSSCC DTS to point to 
>>> the PCS node and mark the "post-init-providers" property. This should 
>>> work for all cases.
>>>
>>> Also, in my view, it is not suitable to move PCS MII clocks get to
>>> "ipq_pcs_get()" because the natural loading order for the drivers
>>> is as below:
>>>
>>> 1) NSSCC driver
>>> 2) PCS driver
>>> 3) Ethernet driver.
>>>
>>> Additionally, the community is currently working on an infrastructure to
>>> provide a common pcs get method. (Christian and Sean Anderson has 
>>> been working on this). Therefore, I expect "ipq_pcs_get" to be 
>>> dropped in the future and replaced with the common pcs get method 
>>> once this common infra is merged.
>>
>> That makes sense. Thank you for clarifying.
> 


