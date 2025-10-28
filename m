Return-Path: <linux-arm-msm+bounces-79133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 871A8C13C0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77C0518872E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FF12FE054;
	Tue, 28 Oct 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3Tgk/HB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B56155333;
	Tue, 28 Oct 2025 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642983; cv=none; b=MrQlnY7JUiwhVVP1F/Wi11lyO4IC0Q9gTu9u495wuHFtomoLonc9AfZYg+VD1gYHXWuMCVw6rn2vRGNFYCPjI+n3DCQ8qUARE4aAgYqcnCjg7L+ZxOOq/yHX0MH4fNpVtlrbR1/KuY23Q88ot8vR/jTeDJ8Z56AAM7RxP4tqKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642983; c=relaxed/simple;
	bh=ermaQYFhISuTCQTJxYy3b0GGBvXFWg+TgqJdvAMDq1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HlDVaZp+4EbON/YcyLVSoU3yK9Sh3DJ6cx7tzVyxl37cTvxAdYDxx7/R8wwYAnfOZWmMDab57BVOggcIKxLb15OaB6FD7vdI9lGo87u59I+K72aEl0ld9GusZ4kQdpwjl5PlE33FqM+AIY2F9yXtnbo3JM7jUzw1o2QWs5MKVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3Tgk/HB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01154C4CEE7;
	Tue, 28 Oct 2025 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761642983;
	bh=ermaQYFhISuTCQTJxYy3b0GGBvXFWg+TgqJdvAMDq1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T3Tgk/HBdescmQFHs3usF8C2WVr86KXVLfJnamjTg3l4wtK9tdGQ66P3OedOtJOQ9
	 Rp9vrEynvDGQxtg2xlzIyZofGUIZMqBmm2jfREbaoJTdydu3xpRVEDTdoPtzH77Bl6
	 sETXMpqPPeMxl+PZo/Ipuzzbj2a/wzoO8PRIn1Dewk0hrLDnZtQx/jKtCaQkBm36vo
	 oJPZrYxot0H5Cu/D1wtCRYYF+3B+dsRFFmUOrOAjZ1Xqf3KBG+bYqSyqSAKjNwrRtU
	 JkQmJ/KZELw8eypfR9L3RaIuPKjCB/l31MOp6hOmFSF9kI8IMEDrQXNwj84E1iIw1T
	 /H5dmNxronwWw==
Message-ID: <ba760468-ac41-48e0-a56e-a675c3c0d5b7@kernel.org>
Date: Tue, 28 Oct 2025 10:16:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
 <20251028-private-chirpy-earthworm-6fccfe@kuoka>
 <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
 <918fc9d3-2cd5-4442-8bc6-b930596d95c1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <918fc9d3-2cd5-4442-8bc6-b930596d95c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2025 10:04, Konrad Dybcio wrote:
> On 10/28/25 9:36 AM, Krzysztof Kozlowski wrote:
>> On 28/10/2025 09:29, Krzysztof Kozlowski wrote:
>>> On Mon, Oct 27, 2025 at 02:22:49PM -0700, Anjelique Melendez wrote:
>>>> Document the Kaanapali and Glymur compatibles used to describe the PMIC
>>>> glink on each platform.
>>>> Kaanapali will have the same battery supply properties as sm8550 platforms
>>>> so define qcom,sm8550-pmic-glink as fallback for Kaanapali.
>>>> Glymur will have the same battery supply properties as x1e80100 platforms
>>>> so define qcom,x1e80100-pmic-glink as fallback for Glymur.
>>>
>>> What does it mean "battery supply properties"? Binding does not define
>>> them, so both paragraphs do not help me understanding the logic behind
>>> such choice at all.
>>>
>>> What are you describing in this binding? Battery properties? No, battery
>>> properties go to the monitored-battery, right? So maybe you describe SW
>>> interface...
>>
>> Or maybe you describe the device that it is different? >
> 
> Certain versions of the pmic-glink stack expose services (such as battmgr)
> which support different features (e.g. 8550 exposes state of health and
> charge control, x1e exposes charge control, 8280 exposes neither)
> 
> There seems to be a similar situation here

Then say that. Otherwise it feels like describing current Linux
implementation and that would be obvious no-go. Why? Because then
argument is: change Linux driver implementation.

> 
>>>>
>>>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>> index 7085bf88afab..c57022109419 100644
>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>> @@ -37,12 +37,19 @@ properties:
>>>>            - const: qcom,pmic-glink
>>>>        - items:
>>>>            - enum:
>>>> +              - qcom,kaanapali-pmic-glink
>>>>                - qcom,milos-pmic-glink
>>>>                - qcom,sm8650-pmic-glink
>>>>                - qcom,sm8750-pmic-glink
>>>
>>> Why qcom,kaanapali-pmic-glink is not compatible with
>>> qcom,sm8750-pmic-glink? If Glymur is compatible with previous
>>> generation, I would expect that here too.
>>
>> And again to re-iterate:
>>
>> If X1E is compatible with SM8550 AND:
>> SM8750 is compatible with SM8550 THEN
>> WHY Glymur is compatible with previous generation but Kaanapali is not
>> compatible with previous generation?
> 
> The announcement date does not directly correlate to 'generation'
I don't know exactly this IP block/component, but in general these SoCs
follow some sort of previous design, thus term "generation" is correct
in many cases. Anyway don't be picky about wording.

You can remove the generation and statement will be the same.

If A is compatible with B AND
C is compatible with B
THEN

WHY D is compatible with (A and B) but E is not
compatible with (C and B)?

Easier for you?

Why nitpicking on wording "generation" instead of explaining the
problems or issues with bindings...


Best regards,
Krzysztof

