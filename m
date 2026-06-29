Return-Path: <linux-arm-msm+bounces-114884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GxcsITQwQmrp1QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:43:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32786D79A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=V5zQHqd4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C40C630134BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B543F5BEC;
	Mon, 29 Jun 2026 08:41:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098303F7A8A;
	Mon, 29 Jun 2026 08:41:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722518; cv=none; b=pGlCTg8MOSfJxpZ9QgbC0MRnM6O8hy/ARCpCeAkcYK5v8mfeT07iOW5u6BkrqcglKj58VqEfawqhgBLfI+WQHxs7UsB1Qx6FH+uUiyOPN3NEErHTIbGK32SZzYADnITdw4sTGe7ws19D/4ZNRE8Z8lDIyjRjLD0kcYHT/ba1wIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722518; c=relaxed/simple;
	bh=7bXhaRyT/bphOsfXW9GyN/IlPMW3EPmBRgUqb5OUh2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahzt2fhhgkmf6xo4N3caAAlSn2z+hMjI7nFjeYH2zVyE9op+3WQ8lQPiZwBO+aA6FCtajsJsk+PPXXT1TSAxRn72zUf7XgEnTeDuq8Ivfr0uK/zKcwJ6htINjvbzT+EWLvW1HuvRPUDPAbg2P7HAxBxc/d3tJZXZ8SXByViHuJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5zQHqd4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2E31F000E9;
	Mon, 29 Jun 2026 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782722516;
	bh=H/zDbGIgXBHN1TlkRmk8Byzr+c6I/SPigBLVgROiABE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V5zQHqd49XcnPm1RyK0Bl8kqIUsykC7jBrFLM2r5GflAQ9E/nRBLatEThzTKX6s8G
	 06vJXogElrHlxQ2glcxCcbUbQ3qFad+kmIAKS3f/5CkNl16MfrZlq/qtNSNiwT5nXM
	 ymbrxfUdjBaKFG1aIi4RudzvfkfTmRbSsRoWDWGozhlbYBIpE/95GXTkt7H8sf0dOj
	 irznKQCCOjf9GkCGX2YcmOnDHo3kqBPkUNEwfCvS7N+ynyVNhnDbm0eosXhDNuB+9X
	 IwvXHhc8cYHKrhVbzP/j3HpSoUHe5vLVHEsYRS/cFFjfFlNKKI3yGau6d5PVc/uROR
	 1B5oLteWGQ8LA==
Message-ID: <00d29422-b887-41cc-a41d-a6177bdd2edd@kernel.org>
Date: Mon, 29 Jun 2026 09:41:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
References: <pskkNka1-QtLVb1tcyyUSjNNeMAWUUOLyvn0XSpq55AyeqXnEjOWDCXF1pWVAufJEya52NTx6ZCXz5dMHcMlyQ==@protonmail.internalid>
 <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <asD5eIxx2ppKOwrwsxHV3d3olpLk5MF9C3Upf_lVo_MWzsiSilQZ2obgX-IAL0Zmv_Pxd3d1zyBV2tSH4ramsw==@protonmail.internalid>
 <04b4f1b0-4d8f-41eb-9b6f-d90b88aec2ff@kernel.org>
 <b5283758-bf75-4906-b821-d6bd7a81e3cd@kernel.org>
 <sYOVwHM_uSVsH_a6NE1B0uaeie7mUZeV7MNTFol2xLJ4_fBH3Ch7DCx_lu8lPWIcmKr5evHbLhBIEpkfycUzgw==@protonmail.internalid>
 <akHHCx0MLYu3vfbq@baldur>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <akHHCx0MLYu3vfbq@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-114884-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,undeadly.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D32786D79A3

On 29/06/2026 02:34, Bjorn Andersson wrote:
> On Fri, Jun 26, 2026 at 03:43:59PM +0100, Bryan O'Donoghue wrote:
>> On 26/06/2026 15:33, Bryan O'Donoghue wrote:
>>> On 23/06/2026 15:52, Hans de Goede wrote:
>>>> Comments, thoughts ?
>>>
>>> Throw out DT and just do this...
>>>
>>> One thing I like about this approach TBH is that you don't do the easy
>>> thing of presuming to push the hard work into the bootloader - thus
>>> creating a dependency on bootloader.
>>>
>>> We've had _alot_ of problems doing DT selectivity to get OSes installed
>>> on arm64 laptops. You mentioned I2C-HID devices and EC controllers which
>>> I agree are a good and obvious targets.
>>>
>>> I don't think this can replace a full and complete DT but, then I don't
>>> think that should be the objective.
>>>
>>> Much like installing cursed OSes like Windows on "normal" laptops or x86
>>> machines, you'd expect to boot in ACPI mode have enough of the OS
>>> running to install more of the OS - which I think _can_ be a viable
>>> objective with an ACPI-DT translator.
>>>
>>> Sadly OpenBSD could boot all the way to console on the Qcom laptops
>>> where Linux could not - because ACPI support was better there.
>>>
>>> And, we have Nvidia laptops coming too, Windows laptops which will parse
>>> ACPI tables to boot.
>>>
>>> There's almost no upside in having ACPI data and not trying to make
>>> maximal use of it, especially if you don't have a DT supplied by
>>> antecedent boot stages.
>>>
>>> ---
>>> bod
>>>
>>
>> I'm going to agree with myself some more on the boot story.
>>
> 
> Good for you.
>> As a Linux user I don't expect everything to work, especially so on aarch64
>> but, if I can get to a boot console with a screen and keyboard - I have
>> scope to play in a way I otherwise don't - parsing DSDT from Windows and
>> walking backwards to DT.
>>
> 
> We supported this on SDM850 and 8cx, we had sufficient amount of
> support/quirks in Linux to allow you to boot and run the Debian
> installer - but that's how far it was possible to push things without
> improving ACPI specification and tables.
> 
> Given that you couldn't run any real use cases, this was not adequately
> maintained and as we moved on to 8cx Gen3 I argued that we should
> prioritize the DT-effort.

Boot to console is infinitely superior to not booting at all, if OpenBSD 
can boot to console on day 1, a community project with no funded effort, 
how much effort is really involved in Linux being able to do the same 
thing ?

https://undeadly.org/cgi?action=article;sid=20240620105457#:~:text=se%3E%20Date%3A%202024%2D06,I%20beat%20my%20last%20record.

Console, keyboard, NVME, USB. I believe their policy is also ACPI to 
bootstrap until DT gets going sufficient.

There's nothing to stop populating DT nodes with ACPI data being part of 
that boot story.
>> DT _should_ be the landing zone of course but, ACPI-DT hybrid to "just boot"
>> seems like an obvious yes to me.
>>
> 
> But this proposal doesn't give you ACPI+DT, it gives you DT+ACPI, you
> still need a base DT that is somewhat functional - and then you
> explicitly need to make references to the external ACPI representation.
> 
> Quite nice for experimentation, but I don't think it will solve either
> of your problems.
There are two arguments, three really.

- Boot in ACPI mode to console.
   This should be done, it at least allows people to tinker with their
   hardware.

- DT-ACPI mode.
   This proposal. Surely worthwhile doing and not incompatible with your
   notion of shipping an upstream compliant DT somewhere.
   In fact it might even let you boot enough of a system based on a
   silicon vendor DT that never changes to again - allow end users to
   actually do something with their hardware absent lots of upstream
   churn post release.

- ACPI-DT mode.
   It is entirely possible to have Linux eat ACPI tables and produce
   in-memory DT. Not easy or nice but technically feasible.

   It could even be hybrid with the first bullet point.

Either way supporting more ACPI on the boot path shouldn't be a barrier 
to better DT support.

---
bod

