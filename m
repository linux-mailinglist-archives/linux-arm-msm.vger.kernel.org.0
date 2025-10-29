Return-Path: <linux-arm-msm+bounces-79327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02525C1849C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 06:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04133A9FBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 05:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619DD2F745C;
	Wed, 29 Oct 2025 05:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCeL5fE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A25261B60;
	Wed, 29 Oct 2025 05:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761715591; cv=none; b=B3i3U/mewagHrnqriwLUjR5uP6jT2V0q/hXLMhzMxBXMZYGB55A6OHRrN08KQFOTYTkfbTVSesHNacrnnoWl1I0rXFaNRcAFclxU37dgDje2eZYIDqVuemfoM5VUoGLbmEnBFhyTH9RVekFH6bK9LvAYN/nMTab0EBn5KvwuM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761715591; c=relaxed/simple;
	bh=8Q29z123cnrRN3gaZdZCB1y5nkXoqQK0+Osc0cFn55A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcOpTURoZoxPTOjhloekpEGQKkbzTqV0JujDAtj1y3VDYFxn+cmRvVvWzM8fgEhl7jb3MzSKPrn+VHPonxkG9WCRgCGKE60slFaSTYKEuDTNZ6IVbUWuB+c4+62qou/jUMTLiniy0fCViPCTK3hdNqKXfz4NwoDaS9Tpb8CHbE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCeL5fE+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BCCC4CEF7;
	Wed, 29 Oct 2025 05:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761715590;
	bh=8Q29z123cnrRN3gaZdZCB1y5nkXoqQK0+Osc0cFn55A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YCeL5fE+l2RNBqFHtV+gSzlR42sO+XEEpErtGcaoEhZB2m0fbdr4j8fqL0zPiInBo
	 mbCjG1/lX+iuOhi0DmETfQA2gorPgcWaG4CfYGlB8ipqta5PfIKl5U7Xy+fbJIrV4S
	 BTeDBkPsnCusf1dcbCHRZxU0HA90GHz2L30CJlV09HOxLBoCAy5G+K7sf3FTgbGgvw
	 XGfiQIrdnU0laaHY6+zGwWfwqxCyAHz2zNyk0u99i3yqSZnBTmxkF6JYETWDg9FAaP
	 1IzNkGsQZL/NmFB1Ql8YDQcT8XE9HVWIpiy55fREF1VWdqS+N3hIkG/9M+IU/QtUFi
	 B5tKxFotS94rg==
Message-ID: <c3603096-70c9-436b-9723-8a0daf1af9d6@kernel.org>
Date: Wed, 29 Oct 2025 06:26:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
 <20251028-private-chirpy-earthworm-6fccfe@kuoka>
 <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
 <918fc9d3-2cd5-4442-8bc6-b930596d95c1@oss.qualcomm.com>
 <ba760468-ac41-48e0-a56e-a675c3c0d5b7@kernel.org>
 <2676d88f-89a9-4b1f-895b-3bdc048f6fbf@oss.qualcomm.com>
 <4e7f4211-3194-409a-b33c-e47bfdfdb203@kernel.org>
 <01f419cc-3236-48b9-bd51-e7db07d1e6fe@kernel.org>
 <481ec137-87cf-4448-99e9-4a1477f4854d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <481ec137-87cf-4448-99e9-4a1477f4854d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2025 23:55, Anjelique Melendez wrote:
> 
> 
> On 10/28/2025 2:30 AM, Krzysztof Kozlowski wrote:
>> On 28/10/2025 10:21, Krzysztof Kozlowski wrote:
>>> On 28/10/2025 10:19, Konrad Dybcio wrote:
>>>>>>
>>>>>>>>>
>>>>>>>>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>   .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
>>>>>>>>>   1 file changed, 7 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>>>>>> index 7085bf88afab..c57022109419 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>>>>>> @@ -37,12 +37,19 @@ properties:
>>>>>>>>>             - const: qcom,pmic-glink
>>>>>>>>>         - items:
>>>>>>>>>             - enum:
>>>>>>>>> +              - qcom,kaanapali-pmic-glink
>>>>>>>>>                 - qcom,milos-pmic-glink
>>>>>>>>>                 - qcom,sm8650-pmic-glink
>>>>>>>>>                 - qcom,sm8750-pmic-glink
>>>>>>>>
>>>>>>>> Why qcom,kaanapali-pmic-glink is not compatible with
>>>>>>>> qcom,sm8750-pmic-glink? If Glymur is compatible with previous
>>>>>>>> generation, I would expect that here too.
>>>>>>>
>>>>>>> And again to re-iterate:
>>>>>>>
>>>>>>> If X1E is compatible with SM8550 AND:
>>>>>>> SM8750 is compatible with SM8550 THEN
>>>>>>> WHY Glymur is compatible with previous generation but Kaanapali is not
>>>>>>> compatible with previous generation?
>>>>>>
>>>>>> The announcement date does not directly correlate to 'generation'
>>>>> I don't know exactly this IP block/component, but in general these SoCs
>>>>> follow some sort of previous design, thus term "generation" is correct
>>>>> in many cases. Anyway don't be picky about wording.
>>>>>
>>>>> You can remove the generation and statement will be the same.
>>>>>
>>>>> If A is compatible with B AND
>>>>> C is compatible with B
>>>>> THEN
>>>>>
>>>>> WHY D is compatible with (A and B) but E is not
>>>>> compatible with (C and B)?
> 
> I think some of the confusion is relating to both UCSI and battmngr aux 
> drivers using SM8550 as compatible strings...
> 
> Really we should be thinking about this as:
> 
> 	SM8750 is compatible with SM8550 UCSI and SM8550 BATTMGR
> 	X1E is compatible with SM8550 UCSI and X1E BATTMGR

That's not what I said there. We don't speak here about these.

We speak ONLY about this compatible. How you map your compatible to
UCSI, BATTMGR, FOO and BAR does not matter, although I asked about
re-using of Kaanapali drvdata in one of my last replies.

> 
> or
> 	A is compatible with B and C
> 	E is compatible with B and D

No, that was just because Konrad got focused on word "generation". Use
my earlier comment.

> 
> 
> More specifically:
> 
> SM8750 has the same UCSI quirks (UCSI_DELAY_DEVICE_PDOS) as SM8550, so 
> we would want to use SM8550 compatible string in UCSI driver.
> SM8750 also exposes the same features, state of health and charge 
> control, in battmgr driver, so should use the SM8550 compatible string 
> for battmgr driver as well.
> 
> Like SM8750, X1E has the same UCSI quirks (UCSI_DELAY_DEVICE_PDOS) as 
> SM8550, so will use the SM8550 compatible.
> BUT X1E only wants to have charge control exposed in battmngr driver. So 
> instead of using the SM8550 compatible, we should use the X1E compatible 
> in battmgr driver [1]
> 
> 
> 
> Now we have Kaanapali and Glymur being introduced...
> 
> Kaanapali IS compatible with SM8750, however since SM8750 did not 
> introduce any new "quirks" or features that Kaanapali should inherit, we 
> can simply define Kaanapali as compatible as SM8550 as well.
> 
> Glymur IS compatible with X1E and since X1E introduces a new "feature" 
> that we would like Glymur to inherit, we need to explicitly defined 
> Glymur as compatible to X1E.

I don't understand whether you are explaining your patch - why it is
done like that - or agreeing that your patch is wrong.

Best regards,
Krzysztof

