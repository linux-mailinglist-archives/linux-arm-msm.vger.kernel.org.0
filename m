Return-Path: <linux-arm-msm+bounces-102773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHLTKGYH2mnbxwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:33:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FE3DEFA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D22F8301EC4D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EFE2BEC55;
	Sat, 11 Apr 2026 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="kaHEtMtY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0021F91D6;
	Sat, 11 Apr 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896417; cv=none; b=UqrggWkZFdFFKh5l1peDDJS5cisKLvsXlYVOGr4GksPVlVPjC3fyMfUiZJccG5Nl2QOAqNy/S83EnpRNA1djI7FHX7Rlc2Ki5NaeXppuoLa6KBTHxGt+jx1JWDeqfYpLAHBW41Y1mfAeCh7dI1ee1bCCgZ9DS3Pnp1XI4Cv1ONY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896417; c=relaxed/simple;
	bh=zrGCoCfZ0rf2IblhorDVtOcnfnZxSM9EfNluA9Jh1vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9RQTN9jxyf2DsxYXOuIinQMltubibe3GI33INluzHXg81QV/Azi6pjqhCgI/yD29PKS/TTl93xz6OtkBwX9GJnZR7dDAHMr+xVh+DdEs7h4CnOByArsT+cO9KFcQgal9lgDaxkgkK/0oOUwtAT4JxeGuYC91Su+A6crX81IFeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=kaHEtMtY; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown [IPv6:2a02:f000:10bd:e301::1d7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id C8EB35340EFE;
	Sat, 11 Apr 2026 10:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1775896412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u429uwsNmornilJQnarYd+HbkPDw9aCJ+p+Q05ov2YA=;
	b=kaHEtMtYaVu8s22Sm86EXlFF3B4AdyetRV5MwU3bFmkmy7x0/JfDEJnz20bKS3eL3Dc7ez
	SDeZfjFEhip3EVr5xrVufNgJDlPv2q+tchWzb37ZD26/1rAUtHpnM9CXvYj7erlSUZk6X0
	MeYsHRmOKlduqqapG5Z9x0GJ20ys+O8=
Message-ID: <0e70d7fb-996a-452c-9e83-54513c7edefc@ixit.cz>
Date: Sat, 11 Apr 2026 10:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rudraksha Gupta <guptarud@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
 <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
 <b8b04f36-2f4d-4d0e-b0af-a01d129a5199@gmail.com>
 <a27ee109-0716-45e9-9aa2-b58a57cbbd46@kernel.org>
 <eb1eebd2-75c0-4ffe-95e7-9f5d5d02edd1@ixit.cz>
 <a0eb87b5-7bb8-4aae-83a1-982d8b4c06f8@gmail.com>
 <f51ddaf0-a857-4250-ad9e-e50982e8c108@kernel.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <f51ddaf0-a857-4250-ad9e-e50982e8c108@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102773-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F0FE3DEFA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/04/2026 09:38, Krzysztof Kozlowski wrote:
> On 11/04/2026 06:01, Rudraksha Gupta wrote:
>> On 4/7/26 14:46, David Heidelberg wrote:
>>> On 07/04/2026 23:04, Krzysztof Kozlowski wrote:
>>>> On 07/04/2026 22:39, Rudraksha Gupta wrote:
>>>>> On 4/7/26 12:59, Krzysztof Kozlowski wrote:
>>>>>> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>>>>>>> From: Rudraksha Gupta <guptarud@gmail.com>
>>>>>>>
>>>>>>> Reorganize the DTS file for consistency with other msm8960 board
>>>>>>> files.
>>>>>>>
>>>>>>> Assisted-by: Claude:claude-opus-4.6
>>>>>>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>>>>>>> ---
>>>>>>>     .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408
>>>>>>> +++++++++++----------
>>>>>>>     1 file changed, 207 insertions(+), 201 deletions(-)
>>>>>>>
>>>>>> Sorry, but no. We are not taking Claude as one determining coding
>>>>>> style.
>>>>>> Are we going to do the work again the moment we come with proper tool?
>>>>>
>>>>> There is no tool currently to auto format DTS, and doesn't seem to be
>>>>> coming for a while:
>>>>>
>>>>> https://www.youtube.com/watch?v=cvoIbTL_ZQA
>>>>>
>>>>>
>>>>> Claude didn't determine the coding style. I did based on sony-huashan,
>>>>> which is already upstream:
>>>>>
>>>>> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
>>>>>
>>>>>
>>>>>
>>>>> I just used Claude to do the manual work for me. In v2, I made sure the
>>>>> diff before and after the change was nill. v3 included additional
>>>>> changes requested by Konrad and some comments that I remembered during
>>>>> prior attempts mainlining patch series for this device.
>>>>
>>>> IMO, it is just too risky to let Claude reorganize the nodes, but I
>>>> assume reviewers of your code did run dtx_diff.
>>>
>>> I think it depends on the prompt. Since I’m performing many of the
>>> same tasks repeatedly across multiple sdm845 devices, asking an LLM to
>>> do node-by-node reorganization can be reasonably reviewable (at least
>>> when reviewing incremental progress, not just the final diff).
>>>
>>> I would prefer to do more of the sorting myself, but I find it quite
>>> tedious. The diff tool struggles when similar or identical lines
>>> appear in different nodes, which often results in a messy final diff
>>> (I noticed this in Sajattack’s sdm845 LG patchset).
>>>
>>> This leads me to an idea:
>>>
>>> For these sorting cleanups, perhaps we could introduce a “squash mode”?
>>>
>>> Contributors could submit commits per node, making the reorganization
>>> clearly visible (and ensuring nothing is accidentally lost), and then
>>> the maintainer could squash them into a single commit to avoid
>>> cluttering the git log.
>>>
>>> What do you think?
>>
>> Easiest solution would be to get Claude to make a DTS auto formatter. I
>> estimate it would likely take a couple iterations to get a functional
>> prototype and max a week to get it into a mergable state, if the style
>> is agreed beforehand. Simply provide DTS'es that follow the pattern you
>> like to Claude, then tell Claude that you want to make a Python script
> 
> Yeah, and who wants to review the Claude code?

If it's good quality, I would do (depends on the language ofc).

> 
> I already have a formatter to review in the pipeline...

Nice!

> 
>> to auto format DTS files and make functions for each different common
>> style pattern identified in the DTS'es. I assume it would give a good
>> enough base to work off of. The most painful part will be determining
>> what the correct style for all DTS'es as I'm sure others will have
>> opinions on that.
>>
> 
> The biggest problem is that no way maintainers will run untrusted 3rd
> party code, co-contributed by random people with Claude.

Generally, LLMs can be forced/instructed to write human-reviewable code, the 
main issue is people usually don't ask for human-readable code.

David

> 
> 
> Best regards,
> Krzysztof

-- 
David Heidelberg


