Return-Path: <linux-arm-msm+bounces-102760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGUdAZvH2Wk0tAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 06:01:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9883DE4A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 06:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1554301D0B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 04:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19C12E0B58;
	Sat, 11 Apr 2026 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsX60lUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516ED186284
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775880088; cv=none; b=ANGH14yqwPknG9RLvSux/x2QpDaZsl2HtuQMgEqoXxwI0DltbIbuN9bBzhD6Rnn8/HAqIKttSSweyeRXMAxB5q0Pk9Yl9WygVcyz9jMm2XkMJMkpTwU5ixwPYuFrzEZ7e4OANlrvKcl734CGbVMZtJUWeG3aqjXZuaaDlLseuEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775880088; c=relaxed/simple;
	bh=xgjHwC1AwXhJ9F2iQmgdB0v8iSgBUj9wk6YdvmJPP4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVq1ad1R4ViGAeBx0csWHDIVvQoW6ZIWq8E3H5rEpCKdaOio8buawsA2QEa9/GWV/3cZ2wmcyM65WAbdRJeiwZmw3iD6Rg5v8uT22aYiOBZWolRwXEC0n95jRTUB+NTrDwwECDcgeYFcexcy7o0pxZ8jCipRQy1up7fSVrkjhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsX60lUN; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3072175eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 21:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775880085; x=1776484885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XewBh8QvnsFo7H/03mxRKI703PTGQg+kRq9yZd0qc8k=;
        b=OsX60lUNHaUK+ABPsfTXtTx0jwhch5uOotTOoLrQ8R91H3z75WNF2Azu0EXa0Byo94
         tUi09rtpU1yud6pycSwaoaR6YEEbYpgQkcM0dVzIbcwl/2C4XdS6D0CzmSYCbq8daQrq
         WCJWKWwSIlWjVnFqo6fE6NEyCT+6r/r5cThmPuWNGVI4upLeFKt1baVCDSkr7wQ3WJQR
         LikTmWgXWLXG+w1jhbLMxs8jjjZ782EkQZPWYCHZ5ENf4Dl39SpNXrxjMtJHNO3Xhh8g
         e8hP07B7R234yYyogfZ/bb4+PmGFKDj7lJhXnWRLHe3wLu1nz19CdPWJtdNBQecl6Cg+
         MVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775880085; x=1776484885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XewBh8QvnsFo7H/03mxRKI703PTGQg+kRq9yZd0qc8k=;
        b=E+6Qpn4R7kqnoc2lUNHmzS0aiLlJveu27aaDUpF3Kva/DHNmtVa+DGuIHbSeTBAhBC
         LumwjmMR0Wr4g5Fosnfk3w1A2n4HNpIxvEfvE9xPVTHhDGOVybw0dgReb6BVjzhRu7NA
         Ha56q4sMliDsEjFxdV7R9g3ys9XChNyNiGKR+vN9DXurD5cluVhSv2E9VdMfctxPCKJt
         w7B/IXVrW+3WuCmjNP6/dsxqcItp5SPgvwgdoWSFejkfhnbf+F0SXZuJIJJ/jv5ONvrE
         UrXqmw7giCIuqR+uQU/vwsQCbpbzfJmLASV74ALsjMyLg6w0hKm0O8VYZdwtiI4qoK95
         v4tw==
X-Gm-Message-State: AOJu0YxF0bxtlKZXk2w1a8hjv7uhs5oBt5fm990h3IlEGrmBnm4HegKW
	+9e9n+b541XoD7O5d/i0c0d/h+U37XqNFRG5bazy1rmlUkYxWYQsQXT6
X-Gm-Gg: AeBDievzlKFf7cVVSE4GvUdBlHdvosiUGTDY2nFdP4sZOucGx+f5wHpLUK+G6+O8zyj
	CYT/ou+HH5cDsDgU9aAchU78QPQBLcZzJZ6FJJrriNt9kQXwh+cZYjW+a6TiiBht1JK2CnpI0af
	HEt2jqMFebbxc6L/z3DRqZfWBD/6QA8EjHwKWcng7JDwdu1a506aVS50jZUFXEARvDFiuidiyAj
	vNkN91oGYTMhD+PekNAaNVhVv1Ba7e6hwkYdYuQzp2roMIEYy3V4JU+8jygaluVwGZwLGlhNAiT
	SqI1pcLoof5bjfoaEjU72gpa/UnLF7CTBXsnqQtP67BDzq+Up29HQbu/BBFb2/Jgrz3NiJ25m1G
	2vX+N3CynMfImUbmLu7z/SJRSXZR4OaMfdnqLbT2avQEb0SH7z6dfZ1NhmiD/Ol/rQsaLrmk9Bk
	EuoIdd9q+o4x1L/BPiFg4TZwIFJKoZCqaM1T0mOEvJ5DRIORreS6kOElFA0SHjjBxNDfkaCxpVz
	PQXcw==
X-Received: by 2002:a05:7300:220d:b0:2ba:6b3a:7696 with SMTP id 5a478bee46e88-2d586991502mr3579824eec.8.1775880085337;
        Fri, 10 Apr 2026 21:01:25 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm8567896eec.10.2026.04.10.21.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 21:01:24 -0700 (PDT)
Message-ID: <a0eb87b5-7bb8-4aae-83a1-982d8b4c06f8@gmail.com>
Date: Fri, 10 Apr 2026 21:01:24 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <eb1eebd2-75c0-4ffe-95e7-9f5d5d02edd1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-102760-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B9883DE4A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 14:46, David Heidelberg wrote:
> On 07/04/2026 23:04, Krzysztof Kozlowski wrote:
>> On 07/04/2026 22:39, Rudraksha Gupta wrote:
>>> On 4/7/26 12:59, Krzysztof Kozlowski wrote:
>>>> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>>>>> From: Rudraksha Gupta <guptarud@gmail.com>
>>>>>
>>>>> Reorganize the DTS file for consistency with other msm8960 board 
>>>>> files.
>>>>>
>>>>> Assisted-by: Claude:claude-opus-4.6
>>>>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>>>>> ---
>>>>>    .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 
>>>>> +++++++++++----------
>>>>>    1 file changed, 207 insertions(+), 201 deletions(-)
>>>>>
>>>> Sorry, but no. We are not taking Claude as one determining coding 
>>>> style.
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
>>>
>>> I just used Claude to do the manual work for me. In v2, I made sure the
>>> diff before and after the change was nill. v3 included additional
>>> changes requested by Konrad and some comments that I remembered during
>>> prior attempts mainlining patch series for this device.
>>
>> IMO, it is just too risky to let Claude reorganize the nodes, but I
>> assume reviewers of your code did run dtx_diff.
>
> I think it depends on the prompt. Since I’m performing many of the 
> same tasks repeatedly across multiple sdm845 devices, asking an LLM to 
> do node-by-node reorganization can be reasonably reviewable (at least 
> when reviewing incremental progress, not just the final diff).
>
> I would prefer to do more of the sorting myself, but I find it quite 
> tedious. The diff tool struggles when similar or identical lines 
> appear in different nodes, which often results in a messy final diff 
> (I noticed this in Sajattack’s sdm845 LG patchset).
>
> This leads me to an idea:
>
> For these sorting cleanups, perhaps we could introduce a “squash mode”?
>
> Contributors could submit commits per node, making the reorganization 
> clearly visible (and ensuring nothing is accidentally lost), and then 
> the maintainer could squash them into a single commit to avoid 
> cluttering the git log.
>
> What do you think?

Easiest solution would be to get Claude to make a DTS auto formatter. I 
estimate it would likely take a couple iterations to get a functional 
prototype and max a week to get it into a mergable state, if the style 
is agreed beforehand. Simply provide DTS'es that follow the pattern you 
like to Claude, then tell Claude that you want to make a Python script 
to auto format DTS files and make functions for each different common 
style pattern identified in the DTS'es. I assume it would give a good 
enough base to work off of. The most painful part will be determining 
what the correct style for all DTS'es as I'm sure others will have 
opinions on that.


