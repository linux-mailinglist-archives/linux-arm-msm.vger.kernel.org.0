Return-Path: <linux-arm-msm+bounces-49174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D962BA4209A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 437437A998D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0903B24BC05;
	Mon, 24 Feb 2025 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKKEziCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF9824BBF3;
	Mon, 24 Feb 2025 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403750; cv=none; b=Pfya8cN8C3at3xeM9WGj5IxpKU85nPsJdpN1sWccQWOMTbrH5TifIuZOwsG5HlSw4TE+I4Ol4i/N4VJhn0dd0xkITRpLiy5UeE1XyI/qnZHTQrJwm9JsGba+sizIVct1axu+ScHBG6CeMM8A1Eena7NXb4TktJ5F+r+1UMZtTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403750; c=relaxed/simple;
	bh=2gh+0SKB6eYULqFkMFByl++53IUxv4VT6FHUFFS+SVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lm76Hf56Fweip2evQ43ejgQSCnSkMD+rHhsLPqaiR7Smgpgz8iRdALrDSf8GnWy8Qq3f+bA44pNABqHLtQKrj4rMZysMNISmLvZHpiPwnx6p9DkI4nfvAww9W5pryekbeeAb3F9ZDLxkTT1k0y9gcy5/WE3y6HW1lpLdc/K9ouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKKEziCW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19263C4CEE8;
	Mon, 24 Feb 2025 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740403749;
	bh=2gh+0SKB6eYULqFkMFByl++53IUxv4VT6FHUFFS+SVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VKKEziCWmiC5gZZnDgJK616eI9Ga/ssByGwITjkZCpEzzZnKrvDBBMZQOg/G+2NdI
	 HmpJ0NML8Ht00dfZl03yojXc24c3WCOkNt13rYmHN7+l5gBUav1xGClgx+s2EOJ9MU
	 4wzfCJadTyjJ+/KVExd89W9rnBTJZPCmCq3P4OIV8kzZet4s7Vx3x8+F2THHtNEsNn
	 ESzZoGpp20e0fhjQnh7TZfyd6kO4QJjm11EpI6ZBKMDhvTEzGanSV/uIOhLMnLNL9p
	 4BvcyZhZESpm26dTWGe+IT4Z35FRpbkM2/bzWhtXKH5kPELB4NTPKy84bQg7EabVyS
	 Okc66JUj4vHGQ==
Message-ID: <03587630-9378-4b67-822a-563379c06655@kernel.org>
Date: Mon, 24 Feb 2025 14:29:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: qcom: geni-se: Rename qcom,geni-se.yaml
 to qcom,geni-se-qup.yaml
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250221085439.235821-1-quic_vdadhani@quicinc.com>
 <49fc59ed-9d09-46bd-9ca6-99d3445221f7@kernel.org>
 <f3349d2a-7eba-4865-9b58-0b2e7e57cc92@quicinc.com>
 <ed8f7aee-e5be-453c-b324-e59e90ecee77@kernel.org>
 <428a1384-bc06-4952-a117-d57f5ab6446c@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <428a1384-bc06-4952-a117-d57f5ab6446c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/02/2025 14:25, Viken Dadhaniya wrote:
> 
> 
> On 2/24/2025 3:48 PM, Krzysztof Kozlowski wrote:
>> On 24/02/2025 09:47, Viken Dadhaniya wrote:
>>>
>>>
>>> On 2/21/2025 5:05 PM, Krzysztof Kozlowski wrote:
>>>> On 21/02/2025 09:54, Viken Dadhaniya wrote:
>>>>> The qcom,geni-se.yaml file describes the Qualcomm Universal Peripheral
>>>>> (QUP) wrapper and the common entities required by QUP to run any Serial
>>>>> Engine (SE) as I2C, SPI, UART, or I3C protocol.
>>>>>
>>>>> Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml to better reflect its
>>>>> association with QUP (Qualcomm Universal Peripheral) and the compatible
>>>>> string.
>>>>>
>>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>>> ---
>>>>>    .../soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml}       | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>    rename Documentation/devicetree/bindings/soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml} (98%)
>>>>>
>>>>
>>>> That's just churn for no real gain. Not even tested churn.
>>>
>>> That's just churn for no real gain.
>>>
>>> We made this change based on below plan, we think this will be helpful.
>>>
>>> 1. Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml. Reason at 2 below.
>>
>> There is no reason 2 at this point. You split your patchsets
>> incorrectly. At this point this is churn, without gain. No users of this
>> rename, no benefits.
>>
>>> 2. Create qcom,geni-se.yaml with shared properties for SE-protocol (spi,
>>> i2c, uart) nodes. This will be helpful for the shared schema in the
>>> ongoing changes
>>
>> Then post it, instead of sending something which makes no sense on its own.
> 
> Should I include this change in v3 of the following serial patch?
> 
> https://lore.kernel.org/linux-arm-msm/f090d637-1ef1-4967-b5bc-6bfce3d7130e@kernel.org/T/
> 
> I hope the approach below is fine for you:
> 
> 1. Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml.

I still do not see any need nor justification for above.

> 2. Create qcom,geni-se.yaml with shared properties for SE-protocol (i2c, 
> spi, uart) nodes.

Look how other common qcom schemas are named :/


Best regards,
Krzysztof

