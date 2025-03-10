Return-Path: <linux-arm-msm+bounces-50820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2FCA592DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2690D16C70C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF0C22423E;
	Mon, 10 Mar 2025 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZw8iFji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F522171C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741606658; cv=none; b=mJIw0bN9IdzhIyuhPA+op9sk2jhxJqLQzPKEnCuYMmPH9C2V2W22QoEggKy2sVj4wE5223pcPB4xxbwNwgALhF3I6k/f3FI4l7pYVAj+aad5ZsOg088tfKxch7B0DmSB4m1Etl87kkASOV0DCjiLrmiB712mDRnM33tTqROUXo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741606658; c=relaxed/simple;
	bh=SWYXB4Sbnes3rwwGjqIMW8bPKSgUg4OOy9VIN+TMSqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0X7EKy6zWtKQfcWvZI+68gVx+G8jVxhhd5POy52EOglsa6UoYNnvODu3paDREAwvpH9y/2AaZGXG2AM09r5FloGjIbRuQGjRdWVWUFsyxIqfdudbZJQZmEJ2FGkiqEa+mVI3q6QlwPBKhOm0/ooPLT16+lDReFTQ1QWoSRmF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZw8iFji; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so823205e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741606654; x=1742211454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gGfOrW92/g9FWKX8O8L7LMakAWexPAiIdn5s8oGVVyY=;
        b=iZw8iFjiOi2KmZX9d8UCWopsSsdpaa1aZUVh5hGqy3jGT0ySVjQwwSxUSVkiIRQ0rU
         yME1UDkNUyA5xMf6fUhwkED3M7EAd8hxLebhQdpI+qiEkcvB+Ew8OYPYk0QC3GZEqS+3
         bXxeU1xWWTHm1i3VVLxH07TcvYSbKsj4+gtZx3H5GGwuQsMtytmFX9vyHC0E2xATIgYy
         DkpjCMGBhY59PoZEEXhpt34mfuN7lsy6d/Szd9FeOf7wZXBZ99O0zRGAXdNZEul1onyi
         Gk9vNe3386nwSFJ+2xx9CGz1bIBUPNXkEsnOKxOuICDOqpZXJytf++dtk/jcL1PBMktn
         o0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741606654; x=1742211454;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGfOrW92/g9FWKX8O8L7LMakAWexPAiIdn5s8oGVVyY=;
        b=UAbCBqHkrrNM73hirN0syWElwUedZvKRnlj3LcoYv40H52xSPbMk4kXEUWEN3MQStC
         ppvj5HYu7XMyBmEBXARvwma5JQh2QC0vYEbUIbNjXDh1fD8CvDNd0qBu5phRuAcpnOPu
         c+4G8/TOXITV0Es5AgX7QFPZ5XFMNbdyhS68Zi7c8TA6X6k2WS9QpLUQLFd7XFcPKmkv
         9KVYBuIfjdYRrZCFFhLJDujjMGUlK34Qp1BRFgDhVgoHvGR221jFSJ0mq+TiveEKid5L
         3rxvUo5jwmVriDKhbNYbNLmgnRZBIWODy3euGtKYhjPFpId74RqJyTDl8oCkQVFdhA9N
         U4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/ctvMqdwy3WroX+4A6AxQ/1JM8GO0VooGY+yit4y/bCIUs50MixTJhud+TY6u9JfbJ3CYHdDd5f+0jBUq@vger.kernel.org
X-Gm-Message-State: AOJu0YzanHda7atU41ZEXUBd6a5fo9l5J9wxqLUUrKEIkdvpS28gDH0C
	gWPQD8eBFPne85RPtrWM+J+kSxUNwL8ikHrYG6YeZjj7T+4Gf5IS35cTerWzthE=
X-Gm-Gg: ASbGncsa09fvBOJnD/DVMz0jNBo4INkpFDrIS+de/M2r8enuaKEbdRB7/iFohyZUZIy
	HJpxDTV8Ca06/GUNt/6lx1XNKsDQjCwV7J/z7csfvbbXkAYqb9LNKWV+UiZtb1Gt8bRG6SM6OPU
	G+IExWrLgJ/62q+xqt25Om9X+pyIOzzwh/MotSOO1ZWW4bYiz455xgAIjEq8ddWeHbaVmpRvzvr
	JZBAY14xUq63FI+w8qua5ZdIGpp73U1qm03p2TylthNsYR33pr4DuglV3dX32C/vrCZw8s583GD
	zfnmhUadTX9eIDyVBClmO7H9NSzcfXvwHPdDv1RWJq+jxTARYBQVlJYp5knVPQ5W
X-Google-Smtp-Source: AGHT+IG00xtqbS1VwoAxwSFH6756q5uvepy5sz2gF9TEqzOa+dNzzqxywHau5PaKvFx1OQWUzkyGrA==
X-Received: by 2002:a05:600c:1e1e:b0:439:9dec:b794 with SMTP id 5b1f17b1804b1-43ce6b12a2amr20146065e9.1.1741606654399;
        Mon, 10 Mar 2025 04:37:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf86b1d80sm32020725e9.9.2025.03.10.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 04:37:32 -0700 (PDT)
Message-ID: <84456c70-e933-469f-ac7a-7d899f85e777@linaro.org>
Date: Mon, 10 Mar 2025 12:37:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/7] dt-bindings: PCI: qcom: Use sdx55 reg description
 for ipq9574
To: Varadarajan Narayanan <quic_varada@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, p.zabel@pengutronix.de,
 quic_nsekar@quicinc.com, dmitry.baryshkov@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250220094251.230936-1-quic_varada@quicinc.com>
 <20250220094251.230936-4-quic_varada@quicinc.com>
 <41b400fe-5e08-42c0-9bc6-a238d25d155a@kernel.org>
 <33bb1cb2-0c5e-402b-a5c6-9604b1dd8d99@kernel.org>
 <Z86YReHsKeF165F6@hu-varada-blr.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z86YReHsKeF165F6@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2025 08:44, Varadarajan Narayanan wrote:
> On Thu, Mar 06, 2025 at 01:06:13PM +0100, Krzysztof Kozlowski wrote:
>> On 06/03/2025 12:52, Krzysztof Kozlowski wrote:
>>> On 20/02/2025 10:42, Varadarajan Narayanan wrote:
>>>> All DT entries except "reg" is similar between ipq5332 and ipq9574. ipq9574
>>>> has 5 registers while ipq5332 has 6. MHI is the additional (i.e. sixth
>>>> entry). Since this matches with the sdx55's "reg" definition which allows
>>>> for 5 or 6 registers, combine ipq9574 with sdx55.
>>>>
>>>> This change is to prepare ipq9574 to be used as ipq5332's fallback
>>>> compatible.
>>>>
>>>> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Unreviewed.
>>>
>>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>> ---
>>>> v8: Add 'Reviewed-by: Krzysztof Kozlowski'
>>>> ---
>>>>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>>>> index 7235d6554cfb..4b4927178abc 100644
>>>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>>>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>>>> @@ -169,7 +169,6 @@ allOf:
>>>>              enum:
>>>>                - qcom,pcie-ipq6018
>>>>                - qcom,pcie-ipq8074-gen3
>>>> -              - qcom,pcie-ipq9574
>>>
>>> Why you did not explain that you are going to affect users of DTS?
>>>
>>> NAK
> 
> Sorry for not explicitly calling this out. I thought that would be seen from the
> following DTS related patches.
> 
>> I did not connect the dots, but I pointed out that you break users and
>> your DTS is wrong:
>> https://lore.kernel.org/all/f7551daa-cce5-47b3-873f-21b9c5026ed2@kernel.org/
>>
>> so you should come back with questions to clarify what to do, not keep
>> pushing this incorrect patchset.
>>
>> My bad, I should really have zero trust.
> 
> It looks like it is not possible to have ipq9574 as fallback (for ipq5332)
> without making changes to ipq9574 since the "reg" constraint is different
> between the two. And this in turn would break the ABI w.r.t. ipq9574.

I don't get why this is not possible. You have one list for ipq9574 and
existing compatible devices, and you add second list for new device.

... or you just keep existing order. Why you need to keep changing order
every time you add new device?


> 
> To overcome this, two approaches seem to be availabe
> 
> 	1. Document that ipq9574 is impacted and rework these patches to
> 	   minimize the impact as much as possible

What impact? What is the reason to impact ipq9574? What is the actual issue?

> 
> 		(or)
> 
> 	2. Handle ipq5332 as a separate compatible (without fallback) and reuse
> 	   the constraints of sdx55 for "reg" and ipq9574 for the others (like
> 	   clock etc.). This approach will also have to revert [1], as it
> 	   assumes ipq9574 as fallback.
> 
> Please advice which of the above would be appropriate. If there is a better 3rd
> alternative please let me know, will align with that approach.

Keep existing order. Why every time we see new device, it comes up with
a different order?

Best regards,
Krzysztof

