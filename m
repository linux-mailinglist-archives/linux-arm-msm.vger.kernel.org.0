Return-Path: <linux-arm-msm+bounces-117240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TY2iGETOTGoWqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:00:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9A71A0DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:00:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=uLBNXviF;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117240-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117240-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E80C7301C6D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F4B3DA5D9;
	Tue,  7 Jul 2026 10:00:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5B3D647C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:00:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418424; cv=none; b=d5gaVqC3e6PHdkxf2Xw3FrBfH1bQfTc2oPaYQ7lGeJRXMSuIqEZbm2L/3jluDD2z+yppB4snCFYu5GwjbTGRMUKcteZmnNhCPQotHgzXxmHWaUUkXLmUW8EzUQFzOQ8xmDcVoYP0mBNc3ImrnlQue6LJ1hG3BW6Fgs5jO4Cr120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418424; c=relaxed/simple;
	bh=c65QzE5czqSOaABx6iCERkye7OSrbiesQtziyTE2+8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2UrgQJC8ACaw0ds0LHb3Ts2sxm2K7o0MAbExDoMnl73uLp3av7MJfHfNuM5d06X4IUOvpsU6+SkXRjW4aplCkJaLiTe3Pq27YfN0jeKWSmLGzw2clXZ9tZSbHhAQ7GF6FpPkA/LTsHVHRDy/33voVLU7azhrOZwk9TLf63IJdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLBNXviF; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso6768593a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783418421; x=1784023221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tt0tjY8MMdm3JERGeSRwSamQ24kIgaZWAm0yZc7K9yc=;
        b=uLBNXviFBpmwLpqFh6rlkN0IIsxM8v2wKprHS5e8A6yHMKOYp1vlAvkdYyWLoCPiSG
         OBG66iCBdboxUmtggma6has6p1J2H38hzzutd+JzIWs4B8V6rrknPZHbALrnAwpQmW+b
         I6CelMXk+9Lxx44I20yS/epdt1VjoKBBQr8sZDfCi/jNyWQGhnTkHLRKN77qBOVx2FBr
         eM2LXzhsgxhL9oRgjHkWL8Ip/YqUXvVkdG4n9siJXcN6x4LAICHSXnPiBm7Saqvfyo/x
         x9brW84U6Ix7W9IfH8RhE4Bd7ba7YjO8XCnsKZxXZ7Pmu2m8cwZMfKeCHBKCd3JWfzKK
         S8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418421; x=1784023221;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tt0tjY8MMdm3JERGeSRwSamQ24kIgaZWAm0yZc7K9yc=;
        b=CV9UQmU50qqI7UvmkUbcydjUHMHbcP86pSayp7dKkl1aJ2lh0pm86NO15h+LlRNQRR
         bWzeM7xDyqwIHEr3jKvPl2umwG2ZHfu8fUDlwtp05mtGkXEMPs6YfIJc9HRA5mK5MUbl
         zsWFJb/M3JxqlYaWg3HZ54CI7tuJe7vp/8u1fN2vB+NnqYYM6Feb298SteDEM/+bKPMp
         ZuA/3eYNpV8z6FEH4S2TDXAvnjPlcXn93QJaGB2c/GZdGnRPSvsj09vJlGy0n6DDqT7r
         uG9mAuw1oofLZEjqDhdejSt1bogR5Xi/L6L97nD/gcyZL/JcbWJQflek/0M5KiBqq3VI
         QhBA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/t9uv46jZvTpxcSe8qgqW1mCHcezTs24Pa5GHz2JYUdMcfhxW2S1cM6jsmtDOASgoO0gNaadG5nubWmWg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6G3ZAxxli86drtIIeTpdG+i9wB+ldz0cdQ2YYajJZvEEm6dS
	zo93YKBAICAChSV4JIRoJxqXZvuztES/mtcarNm5pv9/YMgL8I7ig3jnFXVOcNCocdut3sSSrH1
	tFIax
X-Gm-Gg: AfdE7clghf7iUehwWu1IbB2lai3o0J5SH0sgtYLo/IWRqBaKCslS5oRyRo4xZf9BCWt
	RlDy4hp9H/5pKQVOtjY0iIILhY4gnGYXa3C15+TgApFKMdxmcU8PYWBeHzBLs9C/I1QQjifA7QP
	MzvLtgfQ0o9BvAJ4/DkjL7Lfvea9pzVEWgViJfYnBra5tpaPQLue/jjim6xcIcJZE0U2h4iD4wu
	vjQ7g31KAEwFqjHxOhxTOr8hhuN3b1Iv2MXsUHLUzcyxt0AUABrJqbckud2JH5911KTzV8RFZ+o
	zCkZk8GI3PQAAVsvnRTHSpiGvOQgoMUfSzCoGrQU9xqk5RwzxNOPvo7aZTSv2y+LtXMN9S0vQMk
	yP7l7VziqdiPOiT28TfPZHiQYKN+1JNeTv8F7N0EXcz1o4cm3CGivIF2k7Wn0QJVXcFRa5werLK
	XQMULiZN6WRvfU1CRV1ZD41rFd
X-Received: by 2002:a17:906:22d8:b0:c12:7eeb:d2d5 with SMTP id a640c23a62f3a-c15a68d04efmr200611666b.33.1783418420861;
        Tue, 07 Jul 2026 03:00:20 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb4416dsm98263066b.56.2026.07.07.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:00:20 -0700 (PDT)
Message-ID: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Date: Tue, 7 Jul 2026 11:00:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117240-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nxsw.ie:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFC9A71A0DD

On 07/07/2026 10:24, Konrad Dybcio wrote:
> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

>>>>
>>>> The idea is to make all of these peers, eventually. Not particular block
>>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>>
>>>
>>> The statement provides the same information as before, e.g. it's found here:
>>>
>>> https://lore.kernel.org/linux-media/fbc018f5- c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>>
>>>       There's no functional linkage between CAMSS/IFE and JPEG - they are
>>>       peers within the CAMSS power-island.
>>>
>>> Thus "the CAMSS power-island" exists, and it got its hardware description
>>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>>> a natural resource of all devices on "CAMSS power-island",
>>
>> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of the nodes within it depend on that and it is _external_ to the block.
>>
>> There is a CSID MUX on some SOC other than that I'll restate it again, I'm not sure why you won't accept it.
>>
>> There is no dependency between JPEG and IFE, one is _not_ subordinate to the other and trying to find ways to invalidate that statement runs counter to the facts.
> 
> They are all subordinate to CAMSS_TOP - Vlad indeed said they are
> peers (i.e. there's no co-dependence between them specifically, but
> their parent is shared).
> 
> You can't use any of these IP blocks if you don't first power up
> TOP because of the physical layout.

Yes and I'm asking for TOP to be listed in each of the subordinate nodes 
for reasons given below.

But unlike MDSS - OPE for example doesn't require IFE or CSID to do its job.

Over time we can move the bindings to a model where the only thing in 
CAMSS is a top-level bus like declaration but _right_now_ what you would 
do is create an artificial dependency on say CSIPHY for JPEG.

> This is exactly identical to the MDSS case.
> I was hoping this was clear after N other similar threads.
When we split IFE, CSID etc up into their own individual nodes it would 
be possible to model as for argument sake

compat = "camss-bus";
power-domains = <TITAN_TOP_GDSC>;

jpeg@x {
	power-domains = <JPEG_GDSC>, <MMCX>, <MXC>;
};

What I'm saying here is do this

compat = "camss";
regs = ife, csid; // exisiting bindings for the last ~ 11 years
power-domains = <TITAN_TOP_GDSC>;

jpeg@x {
	power-domains = <TITAN_TOP_GDSC>, <JPEG_GDSC>, <MMCX>, <MXC>;
};

Otherwise you create entirely artificial dependencies between IFE, 
CSIPHY and JPEG, OPE et al.

And BTW if/when we get to the camss-bus stage of things having 
TITAN_TOP_GDSC listed in OPE and JPEG is a very small price to pay.

We've already agreed to gradually transition the bindings instead of go 
for a big-band integration several times.

---
bod

