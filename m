Return-Path: <linux-arm-msm+bounces-114363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IvbTGHPsO2rBfQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C44236BF377
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:40:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ixit.cz header.s=dkim header.b=D4Ovcwk8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114363-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114363-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ixit.cz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F071730EE83E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E7E3CB8E3;
	Wed, 24 Jun 2026 14:37:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D473C8719;
	Wed, 24 Jun 2026 14:37:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311855; cv=none; b=AIh5YePsTnGrx3oUHMDncvCUiPzZot1RJ402HOcG5G37yM+7w0wlkI9ZkQT/lT3Mq3Azh0tIX3aItIgpq8GR64tT8/8H79rCY3p7bvi97qWeLCZ1ZHqxm5FKhbSrPgWZColRYYdvYUQNgOot7LzaNaZgHYSCahzbbtcN2V5sYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311855; c=relaxed/simple;
	bh=X5+06UqZzkHrP6XrYqi7IbD4LXgp8YyzW7DWroQ38NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMpJfsoETnZi6wprqtqt/FooIWI52jlsgb5EQ2GqLoFwzywV007ABtrZCOSJvyNKCXDEaiOtPgD8y3Ug5FF7fZvunzpXFgPtbaUnvMjft6BLkQp2tS3FQ7cUaH0VawQ2OIGPh6PVBtD7IoDgQM2pXhlpmzkfXso+95Xp7eeEWJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=D4Ovcwk8; arc=none smtp.client-ip=185.100.197.86
Received: from [10.0.0.200] (unknown [10.88.125.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 8C6D05341340;
	Wed, 24 Jun 2026 16:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1782311845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=m4ErC33RfBLiCY2kdeSnjPaFzr/CFyTNYdB6Jj+bpow=;
	b=D4Ovcwk8Jyqkpx6KcpNfckOx/0BHHRfU/e0Lhao3aZczIkjICR90jBr8AG3hxbhM7Z2fy5
	ML7H8XGFq1DDRKE0iz5Kyx4f945Sf2zfsyJ3BFjjqWwDSxvwqaNUr1nYACXh2NaK4y7g9D
	2d9+Oz62YcaJE7M3hYprMcOlCHxBRrA=
Message-ID: <52b7dd3a-3f6f-474c-8386-4fc2776b185b@ixit.cz>
Date: Wed, 24 Jun 2026 16:37:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vincent Huang <vincent.huang@tw.synaptics.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
 <ahdoBl3qCTyvlYJf@google.com> <1d0e7e31-f808-4347-955a-7246dea208f5@ixit.cz>
 <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz> <ajtaUb4YmyZTDLmQ@google.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <ajtaUb4YmyZTDLmQ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114363-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:krzk+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[david@ixit.cz,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,ixit.cz:dkim,ixit.cz:email,ixit.cz:mid,ixit.cz:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C44236BF377

On 24/06/2026 06:28, Dmitry Torokhov wrote:
> Hi David,
> 
> On Sun, Jun 21, 2026 at 07:11:45PM +0200, David Heidelberg wrote:
>> On 28/05/2026 00:13, David Heidelberg wrote:
>>> On 27/05/2026 23:56, Dmitry Torokhov wrote:
>>>> Hi David,
>>>>
>>>> On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>
>>>>> We know the driver is reporting s3706b, introduce the compatible so we
>>>>> can more easily introduce quirks for weird touchscreen replacements in
>>>>> followup series.
>>>>>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>> b/arch/ arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>> index 6b7378cf4d493..148164d456a5a 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>> @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
>>>>>        };
>>>>>    };
>>>>>    &i2c12 {
>>>>>        status = "okay";
>>>>>        clock-frequency = <400000>;
>>>>>        synaptics-rmi4-i2c@20 {
>>>>> -        compatible = "syna,rmi4-i2c";
>>>>> +        compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
>>>>
>>>> So I believe we established that this device (s3706b) does not in fact
>>>> implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
>>>> fallback? Shouldn't it be just "syna,rmi4-s3706b"?
>>>
>>> The vendor supplies s3706b which does implement the RMI4 properly.
>>>
>>> The 3rd party replacement impersonating original parts may not implement
>>> it properly, but I don't address this issue in this initial submission.
>>>
>>> With this compatible we know which original part is used by the vendor
>>> and installed in the phones, so later we can deduct specific sequences
>>> for the replacement aftermarket parts to keep phone touchscreen working
>>> same as they do on Android without affecting other devices.
>>
>> Hello Dmitry.
>>
>> May I ask what is currently preventing this series from moving forward?
>>
>> The first version was posted in 2023 [1]. I picked it up again in 2025 [2]
>> and am now on the 9th iteration (this patchset). At this point, the series
>> has been under discussion for well over a year, with relatively little
>> feedback and increasingly long gaps between review rounds.
>>
>> The current approach is based on the guidance I have received so far,
>> including suggestions from the device-tree maintainers. When concerns were
>> raised, I tried to address them and rework the series accordingly.
>>
>> What I am struggling with is understanding what specific issue still needs
>> to be resolved before these patches can be accepted. If there are remaining
>> requirements, objections to the approach, or technical concerns that I have
>> not addressed, I would appreciate having them stated explicitly so I can
>> work on them.
>>
>> I also split out the straightforward, self-contained changes in the hope
>> that at least those could progress independently while I continued working
>> on any follow-up requirements. However, even those patches do not appear to
>> be moving forward.
>>
>> Could you please clarify what outcome you would like to see from this
>> series, and what concrete changes would be required to get it accepted?
> 
> I am still confused about how you want to differentiate between the full
> RMI4 support vs the OnePlus flavor. The "syna,rmi4-s3706b", as you
> mentioned, implements RMI4 protocol properly, so we do not need to
> actually have it documented neither in binding nor in DTS.

--- part 1 ---

This series addresses identification within device-tree. It's normal recommended 
practice.

If we know, the device ships specific, but **compliant** variant, we just put it 
as compatible = "more-specific", "less-specific"; in this case 
"syna,rmi4-s3706b", "syna,rmi4-i2c"

This approach is used everywhere. This has nothing to do with after-market parts.

--- part 2 (irrelevant for this series) ---

> 
> The issue you have with after-market parts that are not compliant and we
> need to figure out how to deal with them. Inside the driver I

As was suggested by device-tree folks, this is the first step, there isn't 
better one available. If there is, please suggest one, and I'll apply it.

> essentially need a"incomplete protocol" flag that we can use to
> implement additional checks or skip known to be not implemented
> functions/queries. In DT we could introduce something like
> "oneplus,rmi4-i2c" that is decidedly not compatible with "syna,rmi4-i2c"
> and neither one should be a fallback for the other.
> 
> This of course needs buy-in from DT maintainers.

As you can see, this still holds Acked-by and Reviewed-by from the relevant 
people - Krzysztof and Konrad.

> 
> Does this make sense?

For the scope we're discussing it doesn't seems so.

This discussion should be associated with the last revision of the full series I 
sent 3 months ago. We're in very unflattering state, where:

   2018 - these aftermarket touchscreen worked on Android well enough for people 
to have working touch (let's say with slightly worse experience then the original).

   2026 in the mainline, we cannot even more forward and report to user-space 
there is aftermarket non-compliant piece of hardware installed.

Actionable steps I suggest after this series lands:

1. don't do any changes, but since we know what 3rd party touchscreen do 
incorrectly deviating from the standard, REPORT it to the userspace, so USER 
know, their device (phone/tablet) doesn't have original part.

2. then figure out, IF we can reasonably well workaround it and HOW to do it

These two steps present some progress which could be discussed and could lead us 
somewhere, what do you think?

David

> 
> Thanks.
> 

