Return-Path: <linux-arm-msm+bounces-61701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10852ADE648
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 11:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435321896FAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C6927FB3F;
	Wed, 18 Jun 2025 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbXRXq5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6302B27FB05;
	Wed, 18 Jun 2025 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237712; cv=none; b=aK2m9g96EFxyEQfBcLKPRnhu3qfCKMEToxqPKiGjF+UQHgHAsi3eUXhmv3GL8XakccmmT67aEBcW/Sxn7k0S+8P8f6pcdT4ZDt0bTKMK38EQ7Nd6FZBNLng6hBYsOAr9GN4xsXUlQuDIx+2fnHx8qhgylsboSjf0ayi+n0TgtDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237712; c=relaxed/simple;
	bh=0+sFPaL0Jxk/lHkLW2jW5q8iyj0drtqRimLRRflGR2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2E/zmLGCQte8kU0/4h9KZvBON7ojkdgEfI0wSUUKewDvdb5m3wK3hVBlhz6yz2ZHAi/Ns9fc+t1Lz7YlcVnTlwdf/MAqnW9m5WcmOyDjKPp4VZ2ULb5qe2XtrM4AfliPxP885dq8S8Mr1u9RijL7uUUmvXt7miiFod0CZxRK3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbXRXq5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D355C4CEE7;
	Wed, 18 Jun 2025 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750237712;
	bh=0+sFPaL0Jxk/lHkLW2jW5q8iyj0drtqRimLRRflGR2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbXRXq5tUgwuXlqsPmr98Q76JjsK8O0wF4ENkwfqKXqrq5prpRJaUQHybfahmUmyI
	 sx/w3FdMLK7QM5s5pbpZgvmjP5g2XOlLoYOq5M8Nn9K4AqVYGirStcqpHMm/py5E09
	 rhkfMEIZg5ma2udO8n8cfhsEIN606wTgpF/1MP/OUuHUT10oGLDlWW/ysTRF5w7ZBu
	 RVrkaj7qzkbtvhIUQQ3W9VAMhcDsUqoCoM0g2V72LrnjW/hXhgsvNs1ND/62h/tiTu
	 2knv0aOtTMUbe9veX7CV3JVEm0RG3nqV21u5ToSZi/FbDqqkioxO535tJv1yQ6wNQ/
	 +/LCe1olud25Q==
Message-ID: <a3796e76-d597-4c0d-ae7c-d042cce564a5@kernel.org>
Date: Wed, 18 Jun 2025 11:08:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <d1ffbcf5-967a-4c1e-9f2c-becc5fb6c6ed@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d1ffbcf5-967a-4c1e-9f2c-becc5fb6c6ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 10:38, Sarthak Garg wrote:
> 
> 
> On 6/18/2025 1:13 PM, Krzysztof Kozlowski wrote:
>> On 18/06/2025 09:28, Sarthak Garg wrote:
>>> Introduce a new optional device tree property `max-sd-hs-frequency` to
>>> limit the maximum frequency (in Hz) used for SD cards operating in
>>> High-Speed (HS) mode.
>>>
>>> This property is useful for platforms with vendor-specific hardware
>>> constraints, such as the presence of a level shifter that cannot
>>> reliably support the default 50 MHz HS frequency. It allows the host
>>> driver to cap the HS mode frequency accordingly.
>>>
>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>> index 9a7235439759..1976f5f8c401 100644
>>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>> @@ -93,6 +93,16 @@ properties:
>>>       minimum: 400000
>>>       maximum: 384000000
>>>   
>>> +  max-sd-hs-frequency:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: |
>>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>>> +      High-Speed (HS) mode. This is useful for platforms with vendor-specific
>>> +      limitations, such as the presence of a level shifter that cannot support
>>> +      the default 50 MHz HS frequency or other.
>>> +    minimum: 400000
>>> +    maximum: 50000000
>>
>> This might be fine, but your DTS suggests clearly this is SoC compatible
>> deducible, which I already said at v1.
>>
>> So now you send v3 which is the same as v1, so you get the same comments.
>>
>> Best regards,
>> Krzysztof
> 
> Introducing this flag no longer becomes SoC compatible because as per 
> discussions in V2 patchset with Ulf and Konrad this new property can be 
> used by any vendor who wants to limit the HS mode frequency due to any 
> reason. Thats why moved to this generic approach again in V3 as compared 
> to compatible based approach in V2.

The are no arguments provided in favor, so my review from v1 stays. You
get the same comments.

Best regards,
Krzysztof

