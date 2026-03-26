Return-Path: <linux-arm-msm+bounces-100080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBU2LPoLxWma5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:35:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AC333773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E93131603E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184C138F23F;
	Thu, 26 Mar 2026 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3nTle62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA138654F;
	Thu, 26 Mar 2026 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519854; cv=none; b=Zv60GVcmPYrnHGR4m54S0CWhsyxUzvwbkRySxL1bc8c0p8LKR9717xacS3SkhUuGS2tkgyEqQZFRmhwYpF0MqfU1DbCS//6OnCMZjNgfP3RorxYuLhEwsoIZX95t9r9DbbcW39KUuBXMvWa54N1yYadxRzvf6neT5D6IIOkv28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519854; c=relaxed/simple;
	bh=X9jWGad29xfQfcjNIkkri4KPRYGLbh9EGVdw9yXVi8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2+PD4FTe/NgRTk2gjAjw/WqLTP7xNi+JOLxrVICH3FSeSJau/l75+KnD39BN3BfcPZ5EPp8AQaYdWrXKYhlHvqgGpiOll88AaFoyfdLXOZ4Dm3bL+nHOYH7uXXIGjAqYDOpAKbpNzksA39SUafxSOKXFOkNpMkHul8X54vBmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3nTle62; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9953CC2BC87;
	Thu, 26 Mar 2026 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774519853;
	bh=X9jWGad29xfQfcjNIkkri4KPRYGLbh9EGVdw9yXVi8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O3nTle62dQ2zWrqvr+Ahw1jzQmuC7iFRxxmyEjbm9ZwLC1mr5kBJvxfGwezi7BRhh
	 oRG+3lffFyntNtG6McZF4Bqhvd34+TdpOK+YIXzPctTXKRnVIFZccMm6IeLKGs5DIp
	 PJ+IB4CRLwdUIJJE/2Anf6OPwADcmrslAptKJHpt7MAtQfImG5IWzMnSaXrExyDXz+
	 UM1M+DIjhkRa83t9E54JxoDxE68kgpV14DNV0I15n58haK2tOKrK8CxCqpd3UWfZiE
	 jujnDPVURHCZKt2ieAYwdnrsNozOyxVwEWel/oLuwxPvBKhF1N87PmBWUqwwzlgy+S
	 wffovY+GByqGA==
Message-ID: <376ad62e-e6b5-438b-a23a-0988b6489e5c@kernel.org>
Date: Thu, 26 Mar 2026 11:10:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260310-crazy-screeching-angelfish-297bab@quoll>
 <a7e7f32e-e365-4504-8ce9-1aada01bc52c@oss.qualcomm.com>
 <fc9e0399-dc24-48c4-99db-f9e39a79cda7@kernel.org>
 <138dee9e-56e7-43a0-bcbd-0e4db4d5b5af@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <138dee9e-56e7-43a0-bcbd-0e4db4d5b5af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100080-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 131AC333773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 10:57, Mohammad Rafi Shaik wrote:
> 
> 
> On 3/17/2026 12:41 PM, Krzysztof Kozlowski wrote:
>> On 17/03/2026 06:27, Mohammad Rafi Shaik wrote:
>>>
>>>
>>> On 3/10/2026 3:25 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>>
>>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>>
>>>>> Qualcomm platforms like talos integrate third-party audio codecs or use
>>>>> different external audio paths. These designs often require additional
>>>>> configuration such as explicit MI2S MCLK settings for audio to work.
>>>>>
>>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>>> ---
>>>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>>>>    1 file changed, 40 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>> index 2fb95544d..1d770cbcb 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>> @@ -21,6 +21,34 @@ properties:
>>>>>      '#sound-dai-cells':
>>>>>        const: 1
>>>>>    
>>>>> +  '#address-cells':
>>>>> +    const: 1
>>>>> +
>>>>> +  '#size-cells':
>>>>> +    const: 0
>>>>> +
>>>>> +# Digital Audio Interfaces
>>>>> +patternProperties:
>>>>> +  '^dai@[0-9]+$':
>>>>> +    type: object
>>>>> +    description:
>>>>> +      Q6DSP Digital Audio Interfaces.
>>>>> +
>>>>> +    properties:
>>>>> +      reg:
>>>>> +        description:
>>>>> +          Digital Audio Interface ID
>>>>> +
>>>>> +      clocks:
>>>>> +        minItems: 1
>>>>> +        maxItems: 3
>>>>> +
>>>>> +      clock-names:
>>>>> +        minItems: 1
>>>>> +        maxItems: 3
>>>>
>>>> No, this is just way too generic. There is no such syntax in the kernel
>>>> and this should stop you right there. You are not allowed to add your
>>>> own style.
>>>>
>>>> I don't think DAI is here a separate device needing its own resources
>>>> expressed in DT. This is still part of ADSP so you just described in DT
>>>> internal routing between two services on ADSP.
>>>>
>>>
>>> Thanks for reviewing.
>>>
>>> I’d like to clarify that this is not intended to model the DAI as a
>>> separate physical device or to describe internal ADSP routing.
>>
>> If you do not want to represent the physical device, then I don't think
>> it should be represented at all.
>>
>>>
>>> Requirement is to allow the kernel to send clock‑voting requests to the
>>> ADSP. LPASS MCLK routing is not enabled by default on the ADSP, so the
>>> kernel must explicitly request the ADSP to enable the relevant LPASS
>>> MCLKs, which is a real hardware control requirement.
>>>
>>> These clocks are LPASS‑owned, and driving them via a third‑party codec
>>> is not appropriate. The intent of adding clock capabilities at the DAI
>>> level is to allow the kernel to associate LPASS clock votes with a
>>> specific DAI instance during stream activity.
>>>
>>> While the DAI itself is not a physical device, some DT representation is
>>> required to describe per‑DAI LPASS clock requirements.
>>
>> DT's purpose is not to describe software constructs, thus DT is not the
>> answer to your requirement of mapping clocks to specific DAI needs.
>> Every person adding software properties made "some DT representation is
>> required" claim.
>>
>>>
>>> I’m open to considering alternative representations, but removing this
>>> entirely would leave no generic way for the kernel to handle correct
>>> LPASS MCLK voting.
>>
>> I imagine that, since this is software construct, the software knows
>> which DAI needs which clock. Clocks are strictly defined, thus driver
>> should handle all this.
>>
> 
> No, the MCLK connection is not fixed to a specific DAI.
> 
> The LPASS MCLKs
> LPASS_CLK_ID_MCLK_1 … LPASS_CLK_ID_MCLK_5
> 
> are hard‑wired connection, each physically routed to an external codec 
> on the board.
> 
> Because of this, the clock that must be voted depends purely on the 
> hardware wiring, not on which DAI (Primary/Secondary/Tertiary/Quaternary 
> MI2S) is used.

If they are routed to external codecs, then they are already present in
these nodes and duplicating them here is not necessary.

> 
> In other words, DAI ↔ MCLK is not a fixed mapping.
> 
> Examples:
> On Talos‑EVK, the speaker is connected via Primary MI2S, but the 
> corresponding MCLK line wired to the codec is LPASS_CLK_ID_MCLK_2.
> 
> On Kodiak, the customer connected an SGTL5000 codec via Quaternary MI2S, 
> yet the required MCLK is still LPASS_CLK_ID_MCLK_2.
> 
> Instead, the kernel must vote for the MCLK that is physically connected 
> to the external codec on that specific board.

No, the external codec driver must vote for that MCLK.

Best regards,
Krzysztof

