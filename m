Return-Path: <linux-arm-msm+bounces-108193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEIcMzcGC2rt/QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:29:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4256CA83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B7E13082E5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12EE404890;
	Mon, 18 May 2026 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpBQbJVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA47F403149;
	Mon, 18 May 2026 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106907; cv=none; b=sYTUBQBDgLbYqqcZ5HohwYXmeIMaDB596M4PJGrP1sDoDOiOT2HpxJbF6yPZ2c+qM4knauR0rzPTJd012oHdI/faVYn8luxdHrDtUVb7JOc7Z67y13mKxFIMsXKYT8UOJKmhAzv+RCkNmdZ1R9j1gJwTduxb9kM1ocRIvQhs/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106907; c=relaxed/simple;
	bh=fUzPLTRye5HWGOXaE5r2BhL2KVfZf2GoyhBCNqOdn64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFKKH1+XNjWXSpo89Yx/Z/vKA6NkHUE20J3DzfZn6j4974q7QgDpcNvQVaIx/FRqXFxA4TxtI7ERBgGEldyahXMIa60EVX26YKUjqN9nnui0l7dyR/qXioZDwD4a2RTcs4uaOScdAIOpy+I8i6u3nuQuG6w8WSoYztyDzl1fJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpBQbJVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD57C2BCC6;
	Mon, 18 May 2026 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779106907;
	bh=fUzPLTRye5HWGOXaE5r2BhL2KVfZf2GoyhBCNqOdn64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FpBQbJVpuARuQ/WGsBfGmb0ztY4fNZGZOHvYj31S8T9hSOHDxZLlQzb2aP2p9+LQ6
	 nfdGaQ/hLA5b2vt1G6Ixk6RTVw6egtoH7JaS7KvHLIZlLZKHTfrYj1M6yGKiFBWozl
	 Epl3TyQUuro8c0lFOYnQgCI6B5Lo5clKP0iZQldlAlnyaD35E8SMImRte7+sp8pbpG
	 PCEqm7IXbj9HYe1oB3Y/7Bbw2ndnzuPLMcD23yK0h9xnSbUffrubbWEoTnA700Zdxa
	 /qvEyH2wkizlBSn/rFAYuLvaKp88QK5WbRta1kqgi00ttX3Qi2vxa+u7PRnT9LugXV
	 vk7gQL4iaSWlw==
Message-ID: <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
Date: Mon, 18 May 2026 13:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 38D4256CA83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108193-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 18/05/2026 11:23, Jagadeesh Kona wrote:
> 
> 
> On 5/18/2026 1:05 PM, Bryan O'Donoghue wrote:
>> On 17/05/2026 18:33, Jagadeesh Kona wrote:
>>> +/* 1200.0 MHz Configuration */
>>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>>> +    .l = 0x3e,
>>> +    .alpha = 0x8000,
>>> +    .config_ctl_val = 0x25c400e7,
>>> +    .config_ctl_hi_val = 0x0a8060e0,
>>> +    .config_ctl_hi1_val = 0xf51dea20,
>>> +    .user_ctl_val = 0x00008408,
>>> +    .user_ctl_hi_val = 0x00000002,
>>> +};
>>
>> I'll again push back on these magic numbers.
>>
>> At the very least you should be mentioning in the cover letter log why you _aren't_ making that change.
>>
>> Just reposting and hoping it slips by the person making the comment isn't too cool.
>>
>> Why can't qcom update the python? script that generates this code to enumerate fields instead of magic numbers here ?
>>
>> I get you don't want to do it but, just ignoring the review feedback is no OK.
>>
>> What gives ?
>>
> 
> Hi Bryan,
> 
> I haven't ignored your comments & already responded to your earlier comment on why the bit fields are not
> defined. Most of these values are static settings we get from PLL HW team and we program them only once
> as is during bootup and are never reused again anywhere from PLL code, so these bits are not defined.
> 
> Please find the earlier responses for your comments below:
> https://lore.kernel.org/all/b92a2cbb-fe8d-4378-aa02-d91e2e4dfff4@oss.qualcomm.com/
> https://lore.kernel.org/all/009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com/
> 
> Thanks,
> Jagadeesh

That's not in your overview letter so generally I'd advise to include 
things like "did X because Y" - "didn't do Q because Z" anyway, how does 
it make a difference if the values are static ?

They are no less magic numbers that way.

What exactly is the resistance to defining the bits ?

I'll state again - when a vendor is submitting something upstream where 
that vendor 100% controls their own documentation - there's no reason at 
all to be presenting magic hex numbers - even more the case with 
generated code.

Just update the script to enumerate the bit fields, I honestly don't get 
the aversion.

---
bod

