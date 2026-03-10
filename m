Return-Path: <linux-arm-msm+bounces-96503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBcWDwvEr2m4cAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:11:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C59246262
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 365E83018E2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33ED3D6CBA;
	Tue, 10 Mar 2026 07:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiwFgkzx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE941175A80;
	Tue, 10 Mar 2026 07:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126659; cv=none; b=WK0n4l0qbm7cwjNLjSe7YLf+45yoQiTIBq8iIvqv3tKPryTtjc5KIjuvEeBBjuji8XazQ8ouckMoRxj/JF2jeaWVWvAP3TAbpVx33mz/xv9VpqTWTpCIoQoSWPQMqhLNtOy2pcyABvXwrOcPjp4j5KOB3CW/98oJhT51YXATdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126659; c=relaxed/simple;
	bh=1JlQeEfpv4h+EbLc9MY8RbtFZSDu7bWJBi3qpKJhhLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URiyS55QPj78PvXNpmGzFpxG6S+iHPUr9F0jjNUGhs9qPZYB0N6yYsGCmIK9KUFsMjTbAVwm2QPCbNGHUTG9LEZ8ytU8sYp0/GPtVOr8m6dw2d1kg5UQm1T42oIFSMQbbf4L8dhS6K+x+k8rMxtRiyq4SFjhJK2drmRcmZgDoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiwFgkzx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E242C19423;
	Tue, 10 Mar 2026 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773126659;
	bh=1JlQeEfpv4h+EbLc9MY8RbtFZSDu7bWJBi3qpKJhhLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EiwFgkzxM3G0/yTgVVwbBD3+mBo+FFxU3ZKeQ04S4yqoLRAV1bWVnqLNoDkfiRQGa
	 0OV/or3hS7AGtwgXrhUAPe6xPsLkBNpOGRRMZsISRxB01vS9sx27tLwHMrFnIFdp/p
	 pbDjEZ07HiRTo6eHmam0P8izblXVaCYcoGLjMJxFz10JDVWaiYhFL2HLczLn4gFtXN
	 FBdpgFTtOMlNtf44U8TLq+of7cFIw9u/vTALo1Q4YXr+gCo82aECTvSAOxxwRIGuOx
	 4AZFRFLfOuxIlQ2K8pY+6xUUb6Rn2E0RgwDL9hrw32dSHMyKJO5jBn8zSdk8vUBAWm
	 q4h54HwpiMaRQ==
Message-ID: <e34b0575-8a6a-4bf9-af1e-b0e9526909e2@kernel.org>
Date: Tue, 10 Mar 2026 08:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
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
 <441a72fc-b81b-4fb6-b032-867752b3c773@kernel.org>
 <6fb8cc16-d339-4913-b1d7-5d114f0a1ed6@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <6fb8cc16-d339-4913-b1d7-5d114f0a1ed6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 35C59246262
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96503-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 09/03/2026 12:48, Konrad Dybcio wrote:
> On 3/9/26 11:53 AM, Krzysztof Kozlowski wrote:
>> On 09/03/2026 11:51, Sibi Sankar wrote:
>>>
>>> On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
>>>> On 09/03/2026 10:03, Sibi Sankar wrote:
>>>>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>>>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>>>>> temperature sensors, access to EC internal state changes and suspend
>>>>>>> entry/exit notifications to the EC.
>>>>>>>
>>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>    arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>>>>    1 file changed, 16 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>>> index ded96fb43489..29a1aeb98353 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>>>>    
>>>>>>>    		#phy-cells = <0>;
>>>>>>>    	};
>>>>>>> +
>>>>>>> +	embedded-controller@76 {
>>>>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>>>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>>>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>>>>> it. All of other Hamoa boards apparently do not have it.
>>>>>
>>>>> Hey Krzysztof,
>>>>> Thanks for taking time to review the series :)
>>>>>
>>>>> What other Hamoa boards are you referring to? The series
>>>>> mentions that the driver and bindings is meant for Qualcomm
>>>>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>>>>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>>>>> boards like you are assuming.
>>>> hamoa-ec compatible implies that and that's something I raised in v2
>>>> already. You need a specific compatible.
>>>
>>>
>>> Hamoa/Glymur reference devices can have different EC MCUs
>>> depending on the SKU. This introduces the need to deal with
>>> possibility of quirks and bugs introduced by these differences.
>>> Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
>>> reference devices run on NPCX498/488. This pretty much was
>>
>> None of these answer my comments from here and v2.
>>
>>> the rationale to make the MCU part of the compatible. Anyway
>>> I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
>>
>> No. You cannot add a generic compatible when you claim it is not even
>> correct - "different EC depending on the SKU".
> 
> I agree, this name isn't really the best. We don't really have a better
> "official one" though. Perhaps something like "qcom,compute-ec"?
> 
> "qcom,reference-compute-ec-that-happens-to-be-found-on-boards-featuring-
> hamoa-glymur-and-derivative-socs-running-windows-by-design"?

I asked at v2 and here I asked twice, so three times already. You need
compatible for board. Nothing else.


Best regards,
Krzysztof

