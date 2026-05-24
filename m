Return-Path: <linux-arm-msm+bounces-109513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IicFLFFE2pH9wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:38:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECC5C368A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4894C30075CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16787309DCF;
	Sun, 24 May 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yxr9A7PG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E72F6577;
	Sun, 24 May 2026 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779647908; cv=none; b=uG8u4wMELLEUpWnMHTQHGS/JOmkSHkxU2xbvYfDrD/vAi5tO2SaC3SY4xllkg1AfgOhVM9RcoNy08Zm7XuHBE1F4awRHGcFZnIyjZJFXVBB5wtgwQ/oKSaLcKM9mr/m0mNIwLA4egzN4wgdq3B4b0OBb5hYea3Kbc5hNowGicow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779647908; c=relaxed/simple;
	bh=IO+dfqOPU1OQnZl0EDdGJfT4DX140il3RMsKNnHZZ/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtEVLx5gh225BgqOYnK3qSo4SXs0AnaKeADQ7X6+c58GSSrsKOa+99cmtCoo4o0iTXhA0BmqcKUO8/djvKNetvmRVqXmML4ZseM7oDIKfxpKnPHHgwKSyF4Ff+Cy+rKAF0PGRh5SqaB1vaQYFPyCzptlRHJfLakFAwHQoMzZt2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yxr9A7PG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5831F000E9;
	Sun, 24 May 2026 18:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779647906;
	bh=8m48+eL9JfN/Id0suNsmlDaRpKXkarKgtM7T17ZOtWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Yxr9A7PGh5/t2la/4HVorvBsDsG6fTvkZVJkkNPLrJyHv65KXWt/jwXyTCf1PrjmI
	 l1fGaAZmY4QCMapG9D07QCJ8gqx+0A0ChnrKwlQQ4ZWbDez49bycNPIUqPXnIzIO9X
	 TZwGC20i9rlDeODY0cr1e4nmSs1SIwBqveHJg7kTQmRtCRQCE1AKDoj+9N+uyKae4l
	 +7Yzy2wCYeMi8iedndO1heLKNzRmzpsSUZmo80uVRlN3+KqFyy7TapIf+2xsjQfn9t
	 xYmjmOJq50eZ9UDPDe8szxRmewwvoTwjSW3DfXMlN0WxdtJjYO/kcntnc4qs3rfuNS
	 cxp4RNrYJ5UfA==
Message-ID: <12dc00e8-98be-4386-b2d0-25e525cabdc6@kernel.org>
Date: Sun, 24 May 2026 20:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
To: Manivannan Sadhasivam <mani@kernel.org>,
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das
 <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krishna.chundru@oss.qualcomm.com
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
 <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
 <agqMgkRwKqr05rms@hu-qianyu-lv.qualcomm.com>
 <bbd5e74d-99c0-4a18-bc80-b3658b235bf6@kernel.org>
 <agq/Hl8qWn6wpbF4@hu-qianyu-lv.qualcomm.com>
 <4byxm3ybi5eqrsqmqi6u4abd37uxliagyolsqs6rtrexut6p5f@uotbli3vh6ja>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4byxm3ybi5eqrsqmqi6u4abd37uxliagyolsqs6rtrexut6p5f@uotbli3vh6ja>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109513-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: A3ECC5C368A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 13:25, Manivannan Sadhasivam wrote:
> On Mon, May 18, 2026 at 12:26:22AM -0700, Qiang Yu wrote:
>> On Mon, May 18, 2026 at 09:00:33AM +0200, Krzysztof Kozlowski wrote:
>>> On 18/05/2026 05:50, Qiang Yu wrote:
>>>> On Sun, May 17, 2026 at 10:27:39AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 17/05/2026 07:39, Qiang Yu wrote:
>>>>>> On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
>>>>>>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
>>>>>>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
>>>>>>>> required by clkref clocks.
>>>>>>>>
>>>>>>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
>>>>>>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
>>>>>>>> differ. Document them here for qcom,glymur-tcsr.
>>>>>>>>
>>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
>>>>>>>>  1 file changed, 57 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
>>>>>>>> index 1ccdf4b0f5dd..57921cb63230 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
>>>>>>>> @@ -51,6 +51,63 @@ properties:
>>>>>>>>    '#reset-cells':
>>>>>>>>      const: 1
>>>>>>>>  
>>>>>>>> +  vdda-refgen-0p9-supply: true
>>>>>>>> +  vdda-refgen-1p2-supply: true
>>>>>>>> +  vdda-qrefrx0-0p9-supply: true
>>>>>>>> +  vdda-qrefrx1-0p9-supply: true
>>>>>>>> +  vdda-qrefrx2-0p9-supply: true
>>>>>>>> +  vdda-qrefrx4-0p9-supply: true
>>>>>>>> +  vdda-qrefrx5-0p9-supply: true
>>>>>>>> +  vdda-qreftx0-0p9-supply: true
>>>>>>>> +  vdda-qreftx0-1p2-supply: true
>>>>>>>> +  vdda-qreftx1-0p9-supply: true
>>>>>>>> +  vdda-qrefrpt0-0p9-supply: true
>>>>>>>> +  vdda-qrefrpt1-0p9-supply: true
>>>>>>>> +  vdda-qrefrpt2-0p9-supply: true
>>>>>>>> +  vdda-qrefrpt3-0p9-supply: true
>>>>>>>> +  vdda-qrefrpt4-0p9-supply: true
>>>>>>>
>>>>>>> Either I do not understand your previous explanation:
>>>>>>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
>>>>>>>
>>>>>>> or this is still wrong. There is no TCSR here, so this proves nothing.
>>>>>>> If TCSR is TX0, then you do not have five of them...
>>>>>>>
>>>>>>> My previous comment stay - you are not describing the actual hardware
>>>>>>> here.
>>>>>>>
>>>>>> The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
>>>>>> as the QREF block, and each component is controlled by the tcsr_clkref_en
>>>>>> registers.
>>>>>
>>>>> Still no clue what this -> relation is. Again, describe the hardware.
>>>>>
>>>>>>
>>>>>> If a PHY receives its reference clock from QREF, it will have a clkref_en
>>>>>> register. However, this register may be located in different regions
>>>>>> depending on the target. On glymur it resides in TCSR, so I added these
>>>>>> LDOs QREF required in tcsr yaml.
>>>>> Registers are not described as supplies.
>>>>
>>>> I'm not descirbing register as supply.
>>>>
>>>>     tx0-0p9/1p2  rpt0-0p9   rpt1-0p9    rpt2-0p9    rx2-0p9
>>>>        |             |           |        |           |
>>>>        |             |           |        |           |
>>>> CXO -> TX0 -------> RPT0 ------> RPT1 -> RPT2 -----> RX2 -> PCIe4_PHY
>>>>        |             |           |        |           |
>>>>        |             |           |        |           |
>>>>        ---------------------------------------------------tcsr_clkref_en
>>>>
>>>> These components(TX/RTP/RX) can be disabled/enabled by tcsr_clkref_en
>>>> register, and they require power supplies.
>>>
>>> So I told you more than once - none of these are supplies to the TCSR.
>>> You clearly misunderstand what a supply is.
>>>
>>
>> The TCSR binding here describes the tcsr_clkref_en clock gate, not the
>> TCSR register block itself. The clock gate controls whether the reference
>> clock is forwarded through the QREF chain to the PHY.
>>
>> The QREF components (TX/RPT/RX) sit between the clock gate and the PHY.
>> They require LDO supplies to operate, and those supplies must be enabled
>> before the clock gate is asserted and disabled after it is deasserted.
>> This enable/disable sequencing is the responsibility of the clock gate
>> driver, not the PHY driver.
>>
>> Since the supplies are managed as part of the clock gate operation, they
>> are modeled as properties of the clock gate node. The node happens to live
>> in TCSR on glymur, but the supplies describe what the clock gate needs to
>> do its job, not what TCSR itself needs.
>>
> 
> Just to add a bit more context:
> 
> The QREF block supplies the reference clock to the PHY IPs. But the digital
> logic (register interface) to control this QREF block lives inside TCSR in some
> SoCs like Glymur. But AFAIK, the analog QREF circuitry is not inside TCSR, but
> somewhere near to PHYs.
> 
> Also, QREF needs its own LDOs to operate and supply reference clocks to PHYs.
> Initially, we tried to add these QREF supplies to PHY node itself. But that was
> pushed back by Johan [1]. His argument was that since these LDOs power QREFs,
> not the PHY IPs, these supplies should not be added to the PHY nodes. And since
> we do not have a dedicated QREF DT node due to the fact that the QREF registers
> gets moved between various IPs based on the available space in the RTL. (It used
> to live in GCC, but now it is in TCSR and in the future it could be in some
> other IPs. Unfortunately, we cannot control this design)
> 
> So he suggested to add these supplies to TCSR node which acts as a control
> interface to QREF, even though it is not an accurate hw representation either.
> 
> And this patchset is based on that feedback only.
> 
> But your argument is also valid that these supplies are not supplying the TCSR
> block in hw, but just the QREF analog circuitry living close to PHY.
> 
> We are open to suggestions here as we do not know what is the accurate hardware
> description for these supplies/QREF.

As I understood these are real supplies to QREF which on these SoCs is
part of TCSR, so in general it is fine. Should be in its own binding
file, though.

Best regards,
Krzysztof

