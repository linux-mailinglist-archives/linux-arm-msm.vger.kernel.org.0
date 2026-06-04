Return-Path: <linux-arm-msm+bounces-111168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id waWwJXFDIWrFCAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:20:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CEE63E786
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=eSCE0aa9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A501A302E5D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9403F6C4A;
	Thu,  4 Jun 2026 09:07:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5F1A23B1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:07:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564024; cv=none; b=Qt962MKW/UIO/bU+kHTo3/DBw/CVFX2WT08O9NQFNIveQ+/Ukv6YcfSBPQUFYtKYizikGtZZJiqFoI2B2eBdeSXdcgzPAlJhfPUIkfvDxamgZkoDyB98u5tiFPiXy1lDdC28mFW5sE0Rlc5Op3xLRLWMy+CQTeT6NG3Hd0ohkLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564024; c=relaxed/simple;
	bh=UPQDLXU71Z4mW/BBDvxtUkcJKh7WhEhkMLc5+Z6fWS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ny10pgmWc2tWKghAz6tiLxxKtRxFUG3XDuOov6RyD/1dARSL/aoISiKKlPlQIEILZXGBL7ttoS4Pm/yWCEqghApGKqTmNGOMb38GWQAdjrIjEX9MIZR+v82y4A8ABrodLc5WB8lpK6YUOrXxn/GDU0p8ysIyoKEXi2zorT18gig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSCE0aa9; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso850517a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780564021; x=1781168821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbplG8EyIp0hP6o+wQA2geXN0fkmfIWqDHbmX7Sw1Aw=;
        b=eSCE0aa9NQH+CN3QSeurs39QAnZjFw13IkSypaf8ZFIBR5379A+Jgoj4+DUoDfiESn
         8Y8HluaXq6FYMbxGOLxyPmJAh1Zmp0ZDBg0xOrIyWtKyUvm00sTza6esR0puMnWSC+ha
         0eL1NR1c5n0e5NCWTHEwm8dkEfAGqwAAD0qdjN2+LqOHvssfBM7+pKIRaEzrnNwKC5Fn
         K0+YdguM+NrPhL2pN3cL+wmTsQpHSNVlRwkHAsy6qXUzHbJQrQpCLY3CjFK22Trkw5r4
         mkobtl8PvVjlGBtM03Oc8T/qWKq34NTJxsgIFaO3bTygzIscPp91P5AIXjH0owvS4M1/
         6+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564021; x=1781168821;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbplG8EyIp0hP6o+wQA2geXN0fkmfIWqDHbmX7Sw1Aw=;
        b=PUePz87gg6kVTyzwh4WkNKyzre4HmzCrUAr3SWC2rMdvEKywBLkwBkToXVNb5Al2vg
         +snqfwDju0Q4Av3px1+dew6iOuy12KfkAfNTew1hhAGFk/d3mQyCfP4opnFFyUe27num
         nx1jLmNhH2opYAh/XPwcDpzkH7O16nXqzZnYp/8KWe5tA9ibGOHJLhcTPhIKVD1c9YVr
         aWqHbmHTIyO5vsc6t+DIFSOR9TdFnhHBfiKyrbKn9lr3EQMbAkOp/rw4l9ZOLEqgINIf
         eP/vazokr4j8cA5fAkN7EzOmfe9AJJ/Z1PqVsmRMmH47/709GNTnpWGOHXzai/poZlvF
         MSWA==
X-Gm-Message-State: AOJu0Yxo0NeP3Iz2NzwbsL5T5m5aCL1JzS9QPT9+h7BE111zlol7KEpa
	xDGQKKyz9v2QWNEMLIEJ9GPYViZGw4wXA1tM2DDn+Zu8ICbf5avj7ZRcfXn1j6VY8fo=
X-Gm-Gg: Acq92OEPVh58Da5hkK/pG9lP5ZBp4Zjo80NPYaUf5RMYl0UDFmRBtI71aFVQUzQ3c0L
	0wPxEDP1iVLsPyfKdgM2tqfCRqdM5FuxOB5yYOP5VXFKyAYKyvyozjEr/4MLx86HCljbm4I8xuO
	nlfNDNlLvjScTuG3/iYgEyA9IEVYgBvsuftrdxF5FZJSijXMlHojDL//rIVN5Fh6aR+gCBMrF/r
	TOrBcmPmBtmbrmEeyIOF6Ie2IbhaFTW5tUZbSHCKX9H6CFNN0zp+BQ46FeMrgMXpWQjGdV8MCuK
	224Wi4Kl9byaBvkEhTxT2Z4QwjDsR42iX3MJ6bAorSQgHJcNRDfkK2/wiWMfbS+OkhbgYuUCg3Q
	nApV8PA9ZoMeY1bXCCEeqDnhO8IgJ8JKllnR5Onijq5rpg6xfOMoyZ3OjsMI4puX/lT/PHk/SKO
	puCE4pzEXGRd0xk1cqjYMK3WaNVIOeLHLV25jQqQGOkB+W7hM=
X-Received: by 2002:a05:6402:e9f:b0:687:ece2:aac6 with SMTP id 4fb4d7f45d1cf-68e713e302fmr3453410a12.15.1780564021418;
        Thu, 04 Jun 2026 02:07:01 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.175.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm2153584a12.17.2026.06.04.02.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:07:00 -0700 (PDT)
Message-ID: <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Date: Thu, 4 Jun 2026 10:06:58 +0100
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-111168-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97CEE63E786

On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and 
>>>>> well
>>>>> described as subnodes, then likely none of power domains are needed
>>>>> to be
>>>>> repeatedly described in the children device nodes, since this
>>>>> information
>>>>> can be obtained from the parent device by the driver.
>>>>>
>>>>> Technically 'power-domains' property can be safely removed, I believe.
>>>>
>>>> The policy is to describe the power-domain dependency fully since DT
>>>> describes hardware not software architecture.
>>>
>>> It brings no contardiction to the statement I've given above, the needed
>>> power domans will be properly described in the parent device, and there
>>> is no
>>> sense to repeat the properties it again and again in every child 
>>> subdevice.
>>>
>>>> Also for a very practical reason a sub-devices can probe/run
>>>> asynchronously of the parent device being active so in fact we do need
>>>> to describe the PDs fully.
>>>
>>> In opposite to the above this one is precisely a software centric 
>>> argument,
>>> which should be excluded from the consideration, as well it's not a big
>>> deal to make a proper async initialization, removing excessive dt
>>> properties
>>> is worth it.
>>>
>>
>> Right look forget about that.
>>
>> - DT requires you to describe your hardware. You're not entitled to have
>>     some other device vote for a clock or a PD you rely on.
>>
> 
> Above are two uncorrelated between each other sentences.
> 
> A device ("consumer") can ask another device ("provider") to behave in
> one or another way, this is the only possible and thus natually selected
> system design, and nothing behind it was asked. There is no justification
> for the proposed flood of multiply repeated data, it's avoidable.

CAMSS or rather the components of CAMSS modelled in the current node, 
is/are not the provider of the GDSCs or the power-domains, it/they are 
consumers themselves from CAMCC.

The producer/consumer model is CAMCC to components within the Camera 
block. Some components depend on say MXA, MXC, some do not. Nothing in 
CAMSS itself is a power-domain provider.
>>     That's exactly the type of downstream short cut we are trying to zap.
>>
>> - In our case we also need to vote on PDs individually when the PHY
>>     is active.
>>
>> In extremis say we are only running the TPG then we have no reason to
>> vote for CSIPHY specific rails or operating points in the parent device.
> 
> So, TPG shall communicate with CAMSS, there is no CSIPHY in the equation.

Right but it would be inappropriate to enable all of the PDs for all of 
the components in the CAMSS block when we can do so more granularly.

If you drive the CSID with a TPG you shouldn't be voting for MXA or MXC 
since these are PDs related to the CSIPHY only and TPG and CSIPHY do the 
same thing from the CSID perspective - input data.

> 
>> We could make the parent power-domain argument for CAMSS and CCI but we
>> have TITAN_TOP_GDSC in CCI specifically because we have to model the
>> hardware - including the PDs for that device.
> 
> CCI is not described as a child of CAMSS, here the situation is different.

CCI probably _should_ be a child of CAMSS given the design we are going 
for here.

Leaving that aside it doesn't matter if a node appears as a child node 
or a peer node - the DT should describe the hardware setup.

I can't imagine a patch that would remove a power-domain from a device 
being accepted simply because the node being moved is expressed as a 
child of another node.

>> If tomorrow we put CCI as a sub-device of top-level CAMSS, that won't
>> negate the need to include that GDSC.
> 
> Of course in this case a phandle to Titan GDSC will be marked as obsolete
> or unused for CCI, no problem here.
> 


