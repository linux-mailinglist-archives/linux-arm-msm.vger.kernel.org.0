Return-Path: <linux-arm-msm+bounces-114467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n1R8GgXmPGpDuAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:25:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E76C3C2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:25:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ioA3jxPS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7C223011049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31D73806DD;
	Thu, 25 Jun 2026 08:25:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F337D11C;
	Thu, 25 Jun 2026 08:25:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375938; cv=none; b=BFXn3w+5ehesScA8df8M5cDXDRYLDLqaKFtevP2PP5rOjWd+3Cc8LJ9pfRdb984CmITip4XOYvLqt/CNgctgfnjLgBjAaxefb+1HPzKTVLEGz71OAj/OUlxiVvnABWYNsPJm2nX3DhXNG9A22xsV7xhyCK/PDfeBUdNoC25KS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375938; c=relaxed/simple;
	bh=HbXeiQg4kjmNz1PKcMPEacPSp3rsSpoxWLAxAJwqIQk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sCmCTm7mpGij1JP3RfwpUeFsX8/nTV2S8fvvp9U8UltyA4yJcGpTJN8eD57gsBLgOoM9D74If9/xT14CWL8j7Y0MAE/tRNSz807dKy4j5dADha3uI6eMk6bQYtJ70TVh2IqoDaz3XfiSKCbgRLZSUjve08H1lYHpj2qvA3zrpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioA3jxPS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272F31F000E9;
	Thu, 25 Jun 2026 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782375937;
	bh=+QJHN1oxM4Lt/P0PlaYzYZWcTGOrv7Hs/Cj6LOl8ghI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=ioA3jxPSYk/Iyw6qHqgnTeklwvMH4AYHUkIPUg5cgHsRRe+sCFKyyOMMe5b7FODcf
	 gTzCwJSkVHjAGKF+ePn3CS3eeUGJcVwJIkDfr8txYNswndtCkLFmCeLWSD5tmv3Lwx
	 BdvOjPkS0FZ/Sfg3qM/fPTGd2niFbub9zcdc8KguOdodbnICI1d4m1sMVkh9qwKDfp
	 eCdaXIgxTgEEIuIfUs798T1RTaXtme6EiM4cWggFvpsQuOlcozPI9itfvFG2jD7OBg
	 uTyPXVjZgt74vr+wsRToWRhkm6Xp1Vi0Hjm0c21K+4W7e3TH9EbgXhPRh9mtmN5GFP
	 GiyURuECPpN9A==
Message-ID: <9c8cdddc-bbfc-43fd-95eb-8f032d837121@kernel.org>
Date: Thu, 25 Jun 2026 10:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vincent Huang <vincent.huang@tw.synaptics.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
 <ahdoBl3qCTyvlYJf@google.com> <1d0e7e31-f808-4347-955a-7246dea208f5@ixit.cz>
 <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz> <ajtaUb4YmyZTDLmQ@google.com>
 <52b7dd3a-3f6f-474c-8386-4fc2776b185b@ixit.cz> <ajxakXFuKAkhdZLN@google.com>
 <f81e4d83-90d9-47c8-aee9-319df3f8b0fb@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <f81e4d83-90d9-47c8-aee9-319df3f8b0fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:david@ixit.cz,m:krzk+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,ixit.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114467-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C92E76C3C2E

On 25/06/2026 10:23, Krzysztof Kozlowski wrote:
> On 25/06/2026 06:53, Dmitry Torokhov wrote:
>> On Wed, Jun 24, 2026 at 04:37:25PM +0200, David Heidelberg wrote:
>>> On 24/06/2026 06:28, Dmitry Torokhov wrote:
>>>> Hi David,
>>>>
>>>> On Sun, Jun 21, 2026 at 07:11:45PM +0200, David Heidelberg wrote:
>>>>> On 28/05/2026 00:13, David Heidelberg wrote:
>>>>>> On 27/05/2026 23:56, Dmitry Torokhov wrote:
>>>>>>> Hi David,
>>>>>>>
>>>>>>> On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
>>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>>
>>>>>>>> We know the driver is reporting s3706b, introduce the compatible so we
>>>>>>>> can more easily introduce quirks for weird touchscreen replacements in
>>>>>>>> followup series.
>>>>>>>>
>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>>>>>> ---
>>>>>>>>    arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>>>>> b/arch/ arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>>>>> index 6b7378cf4d493..148164d456a5a 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>>>>>>> @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
>>>>>>>>        };
>>>>>>>>    };
>>>>>>>>    &i2c12 {
>>>>>>>>        status = "okay";
>>>>>>>>        clock-frequency = <400000>;
>>>>>>>>        synaptics-rmi4-i2c@20 {
>>>>>>>> -        compatible = "syna,rmi4-i2c";
>>>>>>>> +        compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
>>>>>>>
>>>>>>> So I believe we established that this device (s3706b) does not in fact
>>>>>>> implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
>>>>>>> fallback? Shouldn't it be just "syna,rmi4-s3706b"?
>>>>>>
>>>>>> The vendor supplies s3706b which does implement the RMI4 properly.
>>>>>>
>>>>>> The 3rd party replacement impersonating original parts may not implement
>>>>>> it properly, but I don't address this issue in this initial submission.
>>>>>>
>>>>>> With this compatible we know which original part is used by the vendor
>>>>>> and installed in the phones, so later we can deduct specific sequences
>>>>>> for the replacement aftermarket parts to keep phone touchscreen working
>>>>>> same as they do on Android without affecting other devices.
>>>>>
>>>>> Hello Dmitry.
>>>>>
>>>>> May I ask what is currently preventing this series from moving forward?
>>>>>
>>>>> The first version was posted in 2023 [1]. I picked it up again in 2025 [2]
>>>>> and am now on the 9th iteration (this patchset). At this point, the series
>>>>> has been under discussion for well over a year, with relatively little
>>>>> feedback and increasingly long gaps between review rounds.
>>>>>
>>>>> The current approach is based on the guidance I have received so far,
>>>>> including suggestions from the device-tree maintainers. When concerns were
>>>>> raised, I tried to address them and rework the series accordingly.
>>>>>
>>>>> What I am struggling with is understanding what specific issue still needs
>>>>> to be resolved before these patches can be accepted. If there are remaining
>>>>> requirements, objections to the approach, or technical concerns that I have
>>>>> not addressed, I would appreciate having them stated explicitly so I can
>>>>> work on them.
>>>>>
>>>>> I also split out the straightforward, self-contained changes in the hope
>>>>> that at least those could progress independently while I continued working
>>>>> on any follow-up requirements. However, even those patches do not appear to
>>>>> be moving forward.
>>>>>
>>>>> Could you please clarify what outcome you would like to see from this
>>>>> series, and what concrete changes would be required to get it accepted?
>>>>
>>>> I am still confused about how you want to differentiate between the full
>>>> RMI4 support vs the OnePlus flavor. The "syna,rmi4-s3706b", as you
>>>> mentioned, implements RMI4 protocol properly, so we do not need to
>>>> actually have it documented neither in binding nor in DTS.
>>>
>>> --- part 1 ---
>>>
>>> This series addresses identification within device-tree. It's normal
>>> recommended practice.
>>>
>>> If we know, the device ships specific, but **compliant** variant, we just
>>> put it as compatible = "more-specific", "less-specific"; in this case
>>> "syna,rmi4-s3706b", "syna,rmi4-i2c"
>>>
>>> This approach is used everywhere. This has nothing to do with after-market parts.
>>
>> We do this in many cases, sometimes when a part has different timings or
>> maybe additional functionality compared to the base model.
> 
> Generic expectation is to have always dedicated front compatible for
> every device. rmi4-i2c is not really specific enough, more like a
> family, thus a specific device compatible is essential by the DT rules.
> 
> It does not matter if that specific compatible is ever used.
> 
>>
>> How does this new compatible for controller that fully implements RMI4
>> protocol help here? 
> 
> It does not matter. This is a different device, thus it needs
> front-specific compatible.
> 
> Also, the commit msg actually did mention how this helps: allowing
> further quirks (I did not verify that in practice, but explanation is
> plausible).
> 
>>
>>>
>>> --- part 2 (irrelevant for this series) ---
>>>
>>>>
>>>> The issue you have with after-market parts that are not compliant and we
>>>> need to figure out how to deal with them. Inside the driver I
>>>
>>> As was suggested by device-tree folks, this is the first step, there isn't
>>> better one available. If there is, please suggest one, and I'll apply it.
>>
>> Was it clearly communicated to DT folks that the compatible you are
>> adding is fully compatible with the base "syna,rmi4-i2c" but other ones
>> will not be compatible?
> 
> That was not communicated but also did not have to. You can install in
> your board whatever you wish, e.g. replacing foo device with bar being
> something completely different and incompatible. Does not matter really
> if this is after-market or a person just swapped things.
> 
> DT does not solve that problem simply, because we describe static
> hardware configuration.
> 
>>
>>>
>>>> essentially need a"incomplete protocol" flag that we can use to
>>>> implement additional checks or skip known to be not implemented
>>>> functions/queries. In DT we could introduce something like
>>>> "oneplus,rmi4-i2c" that is decidedly not compatible with "syna,rmi4-i2c"
>>>> and neither one should be a fallback for the other.
>>>>
>>>> This of course needs buy-in from DT maintainers.
>>>
>>> As you can see, this still holds Acked-by and Reviewed-by from the relevant
>>> people - Krzysztof and Konrad.
>>
>> I see that but the commit does not explain how exactly you are planning
>> to deal with knockoffs.
> 
> I think it does not have to. David does not need to solve all possible
> problems. He is solving his problems and not preventing the other
> problems to be solved in the future. Unless you expect that the second
> part - future problems - will be blocked by this code.
> 
> But then I think no one ever solved in DT a problem of replacement of
> valid parts with after-market incompatible parts. Therefore I do not
> even know what solution I could suggest to David.

... maybe except DT overlays. This DTS would be correct and if anyone
installs replacement part which is not compatible, then just use overlay
changing the compatible. The idea of manually (per-user) altering
hardware is matching the concept behind DT overlays.

Best regards,
Krzysztof

