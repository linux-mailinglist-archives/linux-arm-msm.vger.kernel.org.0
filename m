Return-Path: <linux-arm-msm+bounces-102764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yR1EKxP62WlFxggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 09:36:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB53DEB30
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 09:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B53DA3013D5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 07:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF89331A53;
	Sat, 11 Apr 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrtPWuqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D5F2BE642;
	Sat, 11 Apr 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775893008; cv=none; b=DCj8Bg+j1H0sbJBJFAOCatBKeiNyZ9J9Thd05WXgXpzrfCLNnSjzUDkJEUHMIL5la99wELMdDR8RbOXapyHPd9Tnkeu9uCOE3/JuyxNiyBqa9rAPQyX2sat0OzIMmNDylthaDLaYVIPSUB9wO3wvfJatEOjVrh1e0sGKoGKkHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775893008; c=relaxed/simple;
	bh=a86LqrkcFQtSNbTYoEWxULDe7eYPjwXuk3wADShiM9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgzOlUeXUrxS3xBM4yXbFc1fnjfzI0jHzMpxvbGGu1EeIudXoaH7Fh+69xDezzLPYhQ1O7k5esccfHxkUZAx7BC1FD3E1ag+9wy7znuYdbZIQ7kmPjKj+p/Rvdq/vI1dXI1AUlfOwuftmu71L2MbYXlKU3drqWfCz6Qr9SFm0Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrtPWuqE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CD5C4CEF7;
	Sat, 11 Apr 2026 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775893008;
	bh=a86LqrkcFQtSNbTYoEWxULDe7eYPjwXuk3wADShiM9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lrtPWuqE9Xpk8wnPJJM1j/nQBhPQWbpNGYSgkkk0RzaMp/qW+/m3hFkUFYa37PQpc
	 ru99ycn7Z2VR7I/4mpHSgSc9UDBUSjFp9dNtEPbu1DXHLtZ/nk7lBdNAyFKa4Si/ic
	 A+YxosuFDHghkhcOQKp9VA/jdt2Oirr409j6OzyTTmtbgjXkrV1SCTF+KoLLHW1W0b
	 gisd4I/ZvyiHxyKJ3ocC92Wig1up96JZo+tvxWQ/ClhXeP+vct+QEk20+2E7ivdFxo
	 GfxGYVYcQzPuszAIshK7QGRN0y9AsDDdbmcLItTYBCDsAGMEOO5YmvmBMAL9VlMR52
	 LWCsg2xmJ0cjA==
Message-ID: <6862f882-47d2-4cc8-b450-99fe9e6eacbf@kernel.org>
Date: Sat, 11 Apr 2026 09:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: David Heidelberg <david@ixit.cz>, Rudraksha Gupta <guptarud@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
 <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
 <b8b04f36-2f4d-4d0e-b0af-a01d129a5199@gmail.com>
 <a27ee109-0716-45e9-9aa2-b58a57cbbd46@kernel.org>
 <eb1eebd2-75c0-4ffe-95e7-9f5d5d02edd1@ixit.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <eb1eebd2-75c0-4ffe-95e7-9f5d5d02edd1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102764-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08EB53DEB30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 23:46, David Heidelberg wrote:
> On 07/04/2026 23:04, Krzysztof Kozlowski wrote:
>> On 07/04/2026 22:39, Rudraksha Gupta wrote:
>>>
>>> On 4/7/26 12:59, Krzysztof Kozlowski wrote:
>>>> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>>>>> From: Rudraksha Gupta <guptarud@gmail.com>
>>>>>
>>>>> Reorganize the DTS file for consistency with other msm8960 board files.
>>>>>
>>>>> Assisted-by: Claude:claude-opus-4.6
>>>>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>>>>> ---
>>>>>    .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 +++++++++++----------
>>>>>    1 file changed, 207 insertions(+), 201 deletions(-)
>>>>>
>>>> Sorry, but no. We are not taking Claude as one determining coding style.
>>>> Are we going to do the work again the moment we come with proper tool?
>>>
>>> There is no tool currently to auto format DTS, and doesn't seem to be
>>> coming for a while:
>>>
>>> https://www.youtube.com/watch?v=cvoIbTL_ZQA
>>>
>>>
>>> Claude didn't determine the coding style. I did based on sony-huashan,
>>> which is already upstream:
>>>
>>> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
>>>
>>>
>>> I just used Claude to do the manual work for me. In v2, I made sure the
>>> diff before and after the change was nill. v3 included additional
>>> changes requested by Konrad and some comments that I remembered during
>>> prior attempts mainlining patch series for this device.
>>
>> IMO, it is just too risky to let Claude reorganize the nodes, but I
>> assume reviewers of your code did run dtx_diff.
> 
> I think it depends on the prompt. Since I’m performing many of the same tasks 
> repeatedly across multiple sdm845 devices, asking an LLM to do node-by-node 
> reorganization can be reasonably reviewable (at least when reviewing incremental 
> progress, not just the final diff).
> 
> I would prefer to do more of the sorting myself, but I find it quite tedious. 
> The diff tool struggles when similar or identical lines appear in different 
> nodes, which often results in a messy final diff (I noticed this in Sajattack’s 
> sdm845 LG patchset).
> 
> This leads me to an idea:
> 
> For these sorting cleanups, perhaps we could introduce a “squash mode”?
> 
> Contributors could submit commits per node, making the reorganization clearly 
> visible (and ensuring nothing is accidentally lost), and then the maintainer 
> could squash them into a single commit to avoid cluttering the git log.
> 
> What do you think?

It would help review on the lists, although the actual solution is to
use deterministic tools. That's why usage of Claude is wrong. It
requires you and us to thoroughly review it. If you did not thoroughly
review that patch, you would be sending microslop.

Best regards,
Krzysztof

