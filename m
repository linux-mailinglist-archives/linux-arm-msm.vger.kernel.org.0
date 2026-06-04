Return-Path: <linux-arm-msm+bounces-111086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0vJtDWHHIGpe7wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:31:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8363C0EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:31:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=pacFqSn1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111086-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111086-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB9B73019061
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 00:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B189D192D8A;
	Thu,  4 Jun 2026 00:30:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4392072623
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 00:30:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533040; cv=none; b=rdVT4RA/Own1W4P3hMLnbh3YoQhtnebZqSWXMfb3LOWWrhgF32JK1pbHumRBZakPjHOtRH8w9mBxKuPpy9DmDEHUFhjyWvteKu1vXKdJnKmxoHaRJYuVVHrMlSMk6ozn450y3PJ+CdXiIXpnQKvE3suD3XbMnhH93pnYpfTpEYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533040; c=relaxed/simple;
	bh=JhiDwTV+ijp+Yldkrq2VgUruPnSxOK6hNGgkqkxKz+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKixaMwPYjOdrt9BVrK3CphE6MFqYXpY8Q60/ayYwWJEZNTl3FN/4CVV5XFs0yHQv6ilTVQIPopLG22ZOsRFRXiAzXKrVKXIyOWY+ff9VL0riPx22nnwvLltiHkfdBTMfnmXXVZw8y4FxWuE1Dy2qEfpUYMA+dJHbNkGL0vVk/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pacFqSn1; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso465835e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 17:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780533038; x=1781137838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjGmXAmM+3Nn1KtSjLMnBrRs8nWD00igFoG8wE5QxV0=;
        b=pacFqSn1c+5Kr0h+C2jMEkWno4MZEYn54CByYGggmS1GQfeh5amjJ8b1qsG83hwgQG
         N74cUkqYYL2mjwaQSIlBVn/c+xZXEtgL+60f2qDzge/dfpOLoUhCmsZHeAj+7bJasNTV
         EWxbVvzoriI2f/BAR0hAx34UQA8SUjDgxioQZXSNYXelr3+6TrVcLLp0lDkviJVjKvtF
         hZkhStg7BHXorglVyQt9uWmkmUF47r2ZkeJofMSQ9H1RuWRNCGvnnETLRdBV6nB6xXpu
         sKWV9kuEwqhRcEeW+bNdKW3OP/odonkdupdQE0G35/p3gArutgAsIhZ3LiRwc19O1ybj
         ZW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533038; x=1781137838;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjGmXAmM+3Nn1KtSjLMnBrRs8nWD00igFoG8wE5QxV0=;
        b=FMNT7EkPXGSXMT5nAqJglsePNmuRl2pus6FE09Kx4Gzg8cjdru2KxWgOnOxLpDeJn2
         oWQZr9g80IRpTGsxmC6QYcPX7h/yxHHOu0gja75hkP07DdIZNwiWD6zjfqIlPI+81uAa
         warEAxQexy2ihpbzkRary37vkLC85UyFB9BaNzd+9eGWM/40OS1SJcDP677TSdxQWTzE
         WV2cQYhjA4Ei8QAPfkiXEY8v3wxFqklxdJmUj9uwRsjNpCbMsVvRL5mpPgjVGqz5biQW
         ODPBto20kHgP+kC7HvrqCm8KcQge+3pZKbZRtzIh3rKT2nkjll+LgolO/ps0phlyGxOf
         kuAA==
X-Gm-Message-State: AOJu0YwDe3wX5Vi7dFcqVEHYoL7BVMV4nH3D1Dgtp82tQGrV0AyJxD8V
	fdd73xaqF745MzoNpimZxgfeJFxPZdXJ3xy5tX2b1+aZEQkNx5LCQKAMsWC+gyxTBN8=
X-Gm-Gg: Acq92OFzBwpOxfaWU+ZbWE3/9etVN//ZDeKlaSxU138hQ3SnJm6Rshpa3hpI/YTOyhw
	kuNfvyUb2IguKpX9EFiP8iRsOM+gB0gd8hWzCwmt4Y4BJWeD61T7dfo2x7kyPlUZJu0XIs2Fzbw
	jEYXYegViaNS0BQO4Ohrakom9hrVIcMdhle/KnYGSqJyZZcLoUHy6Mjp5wbxqBoA0u27mkWWb4N
	MkxHlJrhBe4CTXE66DAFo8hZCn9Uo6bAo3OmZ8nfMyU0R/29OdL+ids3vH0leY/yrK7m3eGMcXh
	oqo+9Im6CUnolaWcpYS8HG0dzyyf7d2BiPF+f9OfJp4w8uRNktNlB1TyGHmi+VdhxxUkrFFWrV7
	hPXDIz15qEVmSue55Yu24rKU4Z1m4E4rJuEH15XpTz0jAIfA/9bzAdmYYJUm+DYndAMwtbotlX0
	uXN93M/ynTcdKS08Pm/ZHswOpMi6I9Bghx2KeaWVHRVVIjFA==
X-Received: by 2002:a05:600c:4c19:b0:48a:5236:7f38 with SMTP id 5b1f17b1804b1-490bc5166a0mr12416105e9.14.1780533037608;
        Wed, 03 Jun 2026 17:30:37 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm11926549f8f.4.2026.06.03.17.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 17:30:37 -0700 (PDT)
Message-ID: <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
Date: Thu, 4 Jun 2026 01:30:34 +0100
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111086-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vijay.tumati@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2F8363C0EF

On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>> described as subnodes, then likely none of power domains are needed 
>>> to be
>>> repeatedly described in the children device nodes, since this 
>>> information
>>> can be obtained from the parent device by the driver.
>>>
>>> Technically 'power-domains' property can be safely removed, I believe.
>>
>> The policy is to describe the power-domain dependency fully since DT
>> describes hardware not software architecture.
> 
> It brings no contardiction to the statement I've given above, the needed
> power domans will be properly described in the parent device, and there 
> is no
> sense to repeat the properties it again and again in every child subdevice.
> 
>> Also for a very practical reason a sub-devices can probe/run
>> asynchronously of the parent device being active so in fact we do need
>> to describe the PDs fully.
> 
> In opposite to the above this one is precisely a software centric argument,
> which should be excluded from the consideration, as well it's not a big
> deal to make a proper async initialization, removing excessive dt 
> properties
> is worth it.
> 

Right look forget about that.

- DT requires you to describe your hardware. You're not entitled to have
   some other device vote for a clock or a PD you rely on.

   That's exactly the type of downstream short cut we are trying to zap.

- In our case we also need to vote on PDs individually when the PHY
   is active.

In extremis say we are only running the TPG then we have no reason to 
vote for CSIPHY specific rails or operating points in the parent device.

We could make the parent power-domain argument for CAMSS and CCI but we 
have TITAN_TOP_GDSC in CCI specifically because we have to model the 
hardware - including the PDs for that device.

If tomorrow we put CCI as a sub-device of top-level CAMSS, that won't 
negate the need to include that GDSC.

---
bod

