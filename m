Return-Path: <linux-arm-msm+bounces-52965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A0A77B65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 14:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1726188FBAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 12:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A458A2036FA;
	Tue,  1 Apr 2025 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+lesDyf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5D1DB92A;
	Tue,  1 Apr 2025 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512195; cv=none; b=RCOkAaufXbJejyGySjTnJcdGi1DvDKSKm4pbiI/vt9If8MxzwT/3rs21s3FZy7osCUUxlTCkUDQMAKlUCYWKSXvCCnPOXUSjWLYYklq5eEAqbPVPTCdD4By3WnaDkKzy/nx2zDgI1rkqmhyHy2bdbjNXaEB0T8gkBRNbRCA8Nys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512195; c=relaxed/simple;
	bh=rQ48vlkFN0XufVs3SokIZaBepH7ggvd+Qm0OnwbfbUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkNhCvj/aNZPs23/D99Du3uL2F1Xhdn+WK4xyeaNdDzKv17Njh2dF1rjlZjrv55r+eJPYGT1YKMnqoyKHGKrhzHXlyzVZyAqO9Ho+SS0LE6cfGDzNg6S4gTgkC5fZ3bY6as40jMfjTP758fVdTeCz+jiMclNUvvrGODj9E5ohRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+lesDyf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB97C4CEE5;
	Tue,  1 Apr 2025 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743512194;
	bh=rQ48vlkFN0XufVs3SokIZaBepH7ggvd+Qm0OnwbfbUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L+lesDyfO2BPqpLsGxy1+fsHUoXiSM4+phDx6oaUDVTSSV9IV/GqsPmuREl2bNSoo
	 1xelS54Yh0U7bdATOx6z64ofyjn7LMnfDP5h1MiuGbmiiT2XT1wm6E/3SA28rSIQzH
	 HBYeqKo34x6H8I8xO9JH64xtmcGiYoLMGsykWKS4B2Byc4DTzzoSoQwWKTLeZ9Szx6
	 NioJkLujk66DpW0LkFRXP/e2L9h/6TMNOiqn/mKUMgIW34Vg2vNcUg7AF7PcMf06ay
	 +mMmuKdjmBCoHD8atGdhFmSsgntyFno6PzWTDPZTP7mgkNOfabMAGl9tliSaII0kHZ
	 NKNwTKLWi6isw==
Message-ID: <e193aefe-d7fb-4650-b227-7db483adde04@kernel.org>
Date: Tue, 1 Apr 2025 14:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] dt-bindings: arm: qcom: Add Asus Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-5-alex.vinarskis@gmail.com>
 <fb1fc0aa-4921-4ee3-9b8a-6167ef6558eb@linaro.org>
 <CAMcHhXoxLx9SiUcntp1vmmK7BF0SO_uo3DCBx_3Ldd3tx+rBXg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMcHhXoxLx9SiUcntp1vmmK7BF0SO_uo3DCBx_3Ldd3tx+rBXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 12:16, Aleksandrs Vinarskis wrote:
> On Tue, 1 Apr 2025 at 07:38, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 31/03/2025 23:53, Aleksandrs Vinarskis wrote:
>>> Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 08c329b1e919..1b7e2ed56baa 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1133,6 +1133,7 @@ properties:
>>>        - items:
>>>            - enum:
>>>                - asus,vivobook-s15
>>> +              - asus,x1e80100-zenbook-a14
>>
>> asus,zenbook-a14-x1e80100
>>
>> asus did not make a component of x1e80100 soc.
> 
> I see, I misunderstood the meaning of qcom,x1e80100-crd, clear now.
> In that case, perhaps follow pattern of other devices, describe by

Qualcomm dev boards follow such pattern, even though actual name is for
example mtp8750.

> model differences (eg. -oled) instead of soc? eg:
> 
> `asus,zenbook-a14-ux3407ra` (for x1e variant)
> `asus,zenbook-a14-ux3407qa` (for x1/x1p variants)

I am fine with both, just wanted the actual generic/common product name
first.

> 
> Thanks for the review,
> Alex
> 
>>
>>>                - dell,xps13-9345
>>>                - hp,omnibook-x14
>>>                - lenovo,yoga-slim7x
>>> @@ -1144,6 +1145,7 @@ properties:
>>>
>>>        - items:
>>>            - enum:
>>> +              - asus,x1p42100-zenbook-a14
>>
>> Same here.
>>
>>
>> Best regards,
>> Krzysztof


Best regards,
Krzysztof

