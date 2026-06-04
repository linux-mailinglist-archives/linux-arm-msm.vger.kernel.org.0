Return-Path: <linux-arm-msm+bounces-111178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W4bCE4xeIWrUFAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:16:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D21063F57E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:16:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=egzYeACY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111178-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111178-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66D8330437A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 11:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304154014A9;
	Thu,  4 Jun 2026 11:04:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8A3E1CF0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 11:04:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571045; cv=none; b=C92JlIPJgsulnWhUbx9BXEdXGgvlAx5dWQ/mh7M0IrrXheTeJI1aMwW0UpPBwV0yYvaqWDsPbTmmwEqWK0e+X3PoA6rUyBfgr+pzEAnYhgNIsk2ksG+P3YB24dpiQi2kGECnTTbd4OD1UsadS+j/0JWgQbyMFEOa8L6UydWHmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571045; c=relaxed/simple;
	bh=B/gjocXEAZZGmLbh3FhqexUI+meJYXHmU7OgkVbES/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUycPdT/SyewWmJP/oOeeDBD4C0Wyp7Swkw1nvTDIcqz2CWFpxvyHt5BA6sVYzY9v1qImOaTN2GBiPqX+vzZ9Bcs47auli9z0DJrSjghejPzH2+cs5eFCorzbpcmFkkXHHilzIm4V+uC/dBl5JEki5hdf4PlEs3VxI+fNOAhfkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egzYeACY; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso1097923a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780571042; x=1781175842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrF+chW03A8IR47Oi/Ih5ziYJf7j0S60VPCDD4Eshmo=;
        b=egzYeACY/cONw7OtjXY7yu5siA2UTWV/K0rYaoBh+KK42Bt4hbXMaTSmyvSURtFfl6
         8HfdqpDHtDDGic9XQmrWdJ7bwiR0xoCClRtjhwZQO9gNDRkAg/tXOkrVo32JWGeS9DSo
         GE0Tv/6gSbU1xM1SwBptsp6UxopG3cnoJGbFuhonWKkWOzd9DLinpT5GeWi8XOWN2AAf
         uF3UESuyavQuhU2UgqNYyE+PxDI3m8BvKPBUCn3lf4KPFj7AXmGA3JDkjzqpMSo8A7cq
         wSb3I7Sb+/3FHmLIM51JAZSBY0qnHJuaftxSW9gy+EEtoVCtUeB/T9YPZf1NSYYpD9no
         oT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571042; x=1781175842;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrF+chW03A8IR47Oi/Ih5ziYJf7j0S60VPCDD4Eshmo=;
        b=M+1GhaFPOCOR5BU7vqtIRIYwMNUyJa39bd5omgETDANJgvn84ZgTNH9ybTJfzJwzjA
         CG0cqosjWb3NFAv5+xstFYs/9QM3ikpOpHR27X+sIa6opSaOh0QwzLxViZFcE2tQR9Df
         1iiKSP3brd+tVDhYLQPOkL5gVLqdOCW+XoxGWQYtr8Ycz+FiakGI2eKAfEcog8UmFAQY
         oFbN8tE5Nuba2tIbSiT7Rq3lCEwYPLnaNWF/jDje+ju19DhT57UV+cSt5+cgJftOX9YU
         kvIJ5OJvR+2DG72cUK6IYjfGWRx0ojcPEJnT8h7B6BWIJ8NFqVT00lkpZ/OGPqVEt+cl
         7XkA==
X-Gm-Message-State: AOJu0YwC44P3jK9ZmrUUDw5ltr2k2xH7Uf+3OtMdQkBmfS2peFM1wrvx
	eY+hjKVK2M6zy/RR7WprtaeOjzYYXgMrTWZhIY/1NkWP5UTRC0GLmAUORsgd9ILxDeo=
X-Gm-Gg: Acq92OF0xd1TvBqkUHsgeUBjL0AO+962VhHeF1rxWzt6Xk4HTFwXAwoBD3pKh/UMV3Z
	bQDa3tN76CRXXoEX/oVGBIL0tsO73qsXSQu606J/UcKDq9PJPkQwBnM3eGKhbGs0uQITHoKLDCY
	qs6T9Id/jUBDHrm4547ssK3qc/HPi6ZWl/CZk6aHFNznhP1dYRWcA17cKMBkmHL/XMbFQZ6KwJa
	DtR81kE0i8m6PXyAfRF6IVsMv+oxYmr5Vf7+e8Hrzhwyjjq8QXrJm8+ZiNDaUmKw5XvFb26m9Y+
	o6EDLjgeWlCbw2zzU0kC5ZFD1N2O5d+j/P+l1srHOPBKUiKUE+A7rcU+cdoJ+DhB8QWuMzgpmVc
	UmxdgDDntqxrY8IMI6JmGKL4pWP2b+mS4oVDFXnyX99+EaKnG/X9hygs38C+XrVk03WwifmKtiL
	AhRhmxrkuzQOdqf2o8F+HAINiiLcMM81+DS5bjVNMmrwtpzCw=
X-Received: by 2002:a17:907:6092:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bf0ab021c93mr446755866b.35.1780571041852;
        Thu, 04 Jun 2026 04:04:01 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.175.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05228a16csm287937966b.28.2026.06.04.04.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:04:01 -0700 (PDT)
Message-ID: <139130d0-1f59-49aa-b174-9e1860eb8465@linaro.org>
Date: Thu, 4 Jun 2026 12:04:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <9ab0d8f4-e1b6-415b-976b-721ab7a29194@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <9ab0d8f4-e1b6-415b-976b-721ab7a29194@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111178-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vijay.tumati@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D21063F57E

On 04/06/2026 10:20, Vladimir Zapolskiy wrote:
> On 6/4/26 12:06, Bryan O'Donoghue wrote:
>> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and
>>>>>>> well
>>>>>>> described as subnodes, then likely none of power domains are needed
>>>>>>> to be
>>>>>>> repeatedly described in the children device nodes, since this
>>>>>>> information
>>>>>>> can be obtained from the parent device by the driver.
>>>>>>>
>>>>>>> Technically 'power-domains' property can be safely removed, I 
>>>>>>> believe.
>>>>>>
>>>>>> The policy is to describe the power-domain dependency fully since DT
>>>>>> describes hardware not software architecture.
>>>>>
>>>>> It brings no contardiction to the statement I've given above, the 
>>>>> needed
>>>>> power domans will be properly described in the parent device, and 
>>>>> there
>>>>> is no
>>>>> sense to repeat the properties it again and again in every child
>>>>> subdevice.
>>>>>
>>>>>> Also for a very practical reason a sub-devices can probe/run
>>>>>> asynchronously of the parent device being active so in fact we do 
>>>>>> need
>>>>>> to describe the PDs fully.
>>>>>
>>>>> In opposite to the above this one is precisely a software centric
>>>>> argument,
>>>>> which should be excluded from the consideration, as well it's not a 
>>>>> big
>>>>> deal to make a proper async initialization, removing excessive dt
>>>>> properties
>>>>> is worth it.
>>>>>
>>>>
>>>> Right look forget about that.
>>>>
>>>> - DT requires you to describe your hardware. You're not entitled to 
>>>> have
>>>>      some other device vote for a clock or a PD you rely on.
>>>>
>>>
>>> Above are two uncorrelated between each other sentences.
>>>
>>> A device ("consumer") can ask another device ("provider") to behave in
>>> one or another way, this is the only possible and thus natually selected
>>> system design, and nothing behind it was asked. There is no 
>>> justification
>>> for the proposed flood of multiply repeated data, it's avoidable.
>>
>> CAMSS or rather the components of CAMSS modelled in the current node,
>> is/are not the provider of the GDSCs or the power-domains, it/they are
>> consumers themselves from CAMCC.
> 
> Well, this is the argument about software, and software can be changed.
> 
>> The producer/consumer model is CAMCC to components within the Camera
>> block. Some components depend on say MXA, MXC, some do not. Nothing in
>> CAMSS itself is a power-domain provider.
>>>>      That's exactly the type of downstream short cut we are trying 
>>>> to zap.
>>>>
>>>> - In our case we also need to vote on PDs individually when the PHY
>>>>      is active.
>>>>
>>>> In extremis say we are only running the TPG then we have no reason to
>>>> vote for CSIPHY specific rails or operating points in the parent 
>>>> device.
>>>
>>> So, TPG shall communicate with CAMSS, there is no CSIPHY in the 
>>> equation.
>>
>> Right but it would be inappropriate to enable all of the PDs for all of
>> the components in the CAMSS block when we can do so more granularly.
> 
> Whenever it is actually necessary, it should be possible to split PDs into
> generic/parent and subdevice specific groups, it's a part of software
> implementation. In some cases there might be no need to define any child
> side PDs, likely CSIPHY falls into this category.


Completely not a discussion about software. DT needs to represent 
hardware. Its a different mindset.

I don't think we are going to resolve this debating the same thing again.

My position is the CSIPHY should list the set of power-domain 
dependencies it has. The PDs don't come from any other thing in the 
CAMSS block so the producer/consumer model is CSIPHY to CAMCC and CSIPHY 
to RPMPD respectively.

I'll just ask @Rob, @Krzysztof or @Conor to offer up their opinion as DT 
maintainers and work from there.

---
bod

