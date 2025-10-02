Return-Path: <linux-arm-msm+bounces-75809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD6BB3A04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 12:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F9816347E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 10:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FABC2FB0BE;
	Thu,  2 Oct 2025 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8ldR8TU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19DB27146B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400529; cv=none; b=oj6FmKiSjxNNIyWt1bGTlV8GKpDNVcKk7fC2iM+flW6fRCeTnhpKAAgs9plTVEWtRLs1589RG3sNCpwISTxxg93b3CR9PgnaVwfs81MpBm1oDL2MUqx8BYBDdFeAOa1gcLuJ29EeNMAIkbFZ9ELZYBt05rrjPFiOSmVPSLf5YfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400529; c=relaxed/simple;
	bh=KFPLhcvce8+mQ4obDysEFr7M9Qqhm83pW1HLWuVCrzA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H/KysPm8hPwyQnTJLfJqaiVfN6vtWfSRXoTOa5m8Yz9mBDdsLcVYv+uDYw/plr/LUuulyqPFeOy2pdqUl9fS7aGiIX3gpenoZxUbKZwXBVf40ROhEIwqJzgDCJx10332Cs0QlRaFX1t9IgmjFIOrJsaPZg6pyreKZ/XIi8Od8vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8ldR8TU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6366b7fd337so1533186a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759400526; x=1760005326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oeiyxphdp3FpXWm94GNIfpVrA+00q3hmgfltim/4eOU=;
        b=k8ldR8TUbFvKY3dMRUsPS24Lnck8Na262IB5DDqDcXCNiDJxzCnK6wCd62lyJ1lAn1
         nxQMvpFsRu+GyhZI/ZzyBjMLSIbbhX22ykRklm8VYTOJSl3G5dnqkh8HlYcLSRIBOYU2
         ZUsxdWsDhQLWlBOGHa8uIW/BEUvgd3sVirEjWSbejcB65XEnvxhATcB339y/GDzrsDKa
         wPtSarzNiYTBv1mOfE99Xdpv9HZHD39Jn9sQdCiSR9LnYlMcWI+2dGEDqxwvWkK9vwHp
         vc6QZlUxPV30GR5Wp45uHawfjK5/cki9rG9CVc6mqC5rELQCLoBeUdntwRzTQckSyGjt
         md1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400526; x=1760005326;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeiyxphdp3FpXWm94GNIfpVrA+00q3hmgfltim/4eOU=;
        b=pArL4mmmvDmWnN2HJ7BvYMc/M3pDbGvHa7CnlHVFx9mL5OvfpsKliOp/RZlmAY7tT+
         b/r7AkYC5BB/JfE9Dj4swjogpLR6zTILjTpDDMZlS7DkeXHmDCscOrgIdXVpdNgZSQFT
         kh2uKoJeee/j4lNR+vg9gcTAASfsTWBQ5xk9llDstDWAzdssUsnB/bsDnrFM9ZiA3BHY
         yEU13RMZkHxur/ZqovR58oQ0byCrw1PttXLp5AL4s6Dff+e6KzAcRAOOcINVAmzE+u1C
         VGJYwqgzQTe/SAE2NR+Fs3VkJ3VPbvRBnBM35+GRSYnCjqaVsvRtgckMtlN7NpEkIG76
         0jiw==
X-Forwarded-Encrypted: i=1; AJvYcCVRr6pmcrt7sif8puss95QdzrI97vr/s7EJ/pSf29a+P1oq98+QfRniSMLXWVmTW4OP2CTugdT83Amh3Yvd@vger.kernel.org
X-Gm-Message-State: AOJu0YwQMjH0WtNjVcCw0LgQq2ki9YE8t30JZRqDMNZRsCX3jR0CMhrk
	1JYVaR/SZzTCr0BYMQPSjCAaKQDBXs/dXdYvJfL9YuwbREJTOJ2tjASDpfV0zRJBXO8=
X-Gm-Gg: ASbGncukM/Pp84MeGLHWRCGneuXc/zufZvvlJNCxDWbhQ/G6pAStz3FxIs0p6xvvq3B
	7f5otRSja06BFq03rkqPyUXM3vQSNt365G/fL43pRxu9/Vru5oCmvQs29+j6wID4gZRDopKCf9X
	QMAp0IPCb4SFhJ6tByMWxMjjZZ5BKQSobO07qnqvn14o2p29ItNrAOjxVCzHKDeofH2GDahenBJ
	xCutShRoMXRmea88sM1U8X4N79x5sj/Ci86TztaRqsfsEVcsJjwKDwurTqSciOtoJ0FvkZixnCo
	lzPy+20WilJWsvPbIUeFeu19NLDjhDzl6mIk6nwp19clMPLXEv1GqZSLB4YGpeZ+KbUo/8UtZGs
	PELejvtJN8kvMPWIYThKCaUmNh0hqNT0+riH6UKkx2l0Tp1AZE73wMWGPznSPE5qeVW4nuGV3VX
	byr+H6x8HGHEw3TcJRzid1l37Q4A8=
X-Google-Smtp-Source: AGHT+IFlPW8rmREopOYD1ffL5rQR075BadaUVl2h1wYxunv5yBlFe80ZtrFLuMWhLlswGcWI/Kz3KQ==
X-Received: by 2002:a17:907:d14:b0:b10:4355:2e63 with SMTP id a640c23a62f3a-b46e516b397mr787392666b.46.1759400526066;
        Thu, 02 Oct 2025 03:22:06 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8b7sm172388266b.40.2025.10.02.03.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 03:22:05 -0700 (PDT)
Message-ID: <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
Date: Thu, 2 Oct 2025 11:22:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Content-Language: en-US
In-Reply-To: <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2025 13:55, Bryan O'Donoghue wrote:
> On 24/09/2025 11:43, Dikshita Agarwal wrote:
>>>> I understand your concern. To clarify, we are not removing support 
>>>> for the
>>>> existing Gen1 firmware, so backward compatibility remains intact.
>>>>
>>>> We are simply adding support for Gen2 firmware for this 
>>>> architecture. As a
>>>> result, QCM6490 will support both Gen1 firmware (with the Venus 
>>>> driver) and
>>>> Gen2 firmware (via Qualcomm's video driver [1]).
> 
> I agree with Dmitry here.
> 
> Its not possible to disjunct upstream HFI6xx @ the firmware level 
> between Venus and Iris because the DTS would have to point to a 
> particular firmware depending on which driver you wanted to run, which 
> would make the DT dependent on the driver, which is not allowed.
> 
>>>> Additionally, as part of our plan to transition all Venus-supported 
>>>> targets
>>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 
>>>> firmware
>>>> to maintain backward compatibility.
>>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
>>> interchangeable for the hardware they both support, until the venus
>>> driver drops support for V6 hardware. At that point it's expected that
>>> there will be no V6 support in Venus driver.
>>>
>>> You can not simply upgrade to Gen2 firmware as if nothing happened.
>>> Consider a device node on SC7280 / QCS6490 with the firmware-name
>>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
>>> happily consume the device node and try to work with it. One will work,
>>> another one will fail. This is definitely not what we have agreed upon,
>>> when you started adding Iris driver.
>> @Vikash, could you please chime in?
> 
> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a 
> new SoC that doesn't appear upstream yet but, that's not the case with 
> 7280/6490.
> 
> ---
> bod

So discussing this with Vikash and some other qcom folks, I realised the 
DT binding at the moment doesn't depend on the firmware name, so my 
concern making the DT depend on the driver is not a real problem.

I think in fact it should be possible to point venus @ the gen1 firmware 
file while pointing iris @ the gen2 file.

Unless there's something here I'm missing, that should work for the 
update and the agreement.

Dmitry ?

---
bod

