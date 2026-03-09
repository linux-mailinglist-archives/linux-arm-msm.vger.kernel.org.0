Return-Path: <linux-arm-msm+bounces-96204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHwJD5KnrmkFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:57:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D590B237719
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74D7C302EE9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25903939A8;
	Mon,  9 Mar 2026 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0nj8/wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68C364056;
	Mon,  9 Mar 2026 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053642; cv=none; b=WMZQr9rHYsNSbavIfCaGDFwDcPmPgOmp6ar1Gf88aXr8oG8MVMnHm7h25u8oozRqLSVfPGutZ2VSB991mdjgvsqospKPNiOBt1A+iDUk33HmhbEYwMTRQIhzrRAMnd1JzvLBfZuLXj3/iX6/blo4pUyQFgeTrE7p3P/GuXQtfgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053642; c=relaxed/simple;
	bh=Q+iikEjNIVUw7RKERClg5Ne49dMoy4MJTuajcIv+wLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drwm2q5XFNRcq0oAE3u/6c+2fNzQkWhLwqxte0aKc+5NRDkfWp+NcJuRupzfkmQLZOcdvR7C9bCdIhZbwBudK+Ksm4d06kH64t+WAZr5U+L3XikUOl6qzS3ZE7qQF6lPibBTcKC67h+B08HT+uEZ5w7y9QEsmuIkdkB0Gf10mrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0nj8/wZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E167C4CEF7;
	Mon,  9 Mar 2026 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773053642;
	bh=Q+iikEjNIVUw7RKERClg5Ne49dMoy4MJTuajcIv+wLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p0nj8/wZNx0ZXvuLJeFpa8x1/X2++smE1aQEktC7Ohi3l/xPzA1v6DCZcX7wDp5c+
	 +K+m1S1XBbiPCceJNfQODMTf5VXm6mKrm0RzfQFIbVaR1yWy1Mhufiojd0hB57Wstb
	 Wm7bbu1dWUz0WxQZRiYojCGrlAejWuzDBJK0nio1Nj0X51nvUaLXkGxwxY+CIL9SKm
	 0RwiNv3iOtK/ah+fnnq1rf/s5KMYMyoQWgQbhV1m3GLvDqwN6SlF3EQLJOUbHFjUQU
	 4BdPT1s+z6SWwuFvfa/CYT7W+Jb3Y6zHFVeweHiBhVmpjG+8d9qupKhB5K0W/ldPjq
	 smV5/yHCZwWDA==
Message-ID: <441a72fc-b81b-4fb6-b032-867752b3c773@kernel.org>
Date: Mon, 9 Mar 2026 11:53:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, bryan.odonoghue@linaro.org,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
 <20260309-festive-prudent-ibex-f8b601@quoll>
 <ff241b01-c7f4-433b-a822-c5cd14e3e696@oss.qualcomm.com>
 <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
 <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D590B237719
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96204-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,4f:email,0.0.0.76:email]
X-Rspamd-Action: no action

On 09/03/2026 11:51, Sibi Sankar wrote:
> 
> On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
>> On 09/03/2026 10:03, Sibi Sankar wrote:
>>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>>> temperature sensors, access to EC internal state changes and suspend
>>>>> entry/exit notifications to the EC.
>>>>>
>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>>    1 file changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>> index ded96fb43489..29a1aeb98353 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>>    
>>>>>    		#phy-cells = <0>;
>>>>>    	};
>>>>> +
>>>>> +	embedded-controller@76 {
>>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>>> it. All of other Hamoa boards apparently do not have it.
>>>
>>> Hey Krzysztof,
>>> Thanks for taking time to review the series :)
>>>
>>> What other Hamoa boards are you referring to? The series
>>> mentions that the driver and bindings is meant for Qualcomm
>>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>>> boards like you are assuming.
>> hamoa-ec compatible implies that and that's something I raised in v2
>> already. You need a specific compatible.
> 
> 
> Hamoa/Glymur reference devices can have different EC MCUs
> depending on the SKU. This introduces the need to deal with
> possibility of quirks and bugs introduced by these differences.
> Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
> reference devices run on NPCX498/488. This pretty much was

None of these answer my comments from here and v2.

> the rationale to make the MCU part of the compatible. Anyway
> I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now

No. You cannot add a generic compatible when you claim it is not even
correct - "different EC depending on the SKU".

Best regards,
Krzysztof

