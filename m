Return-Path: <linux-arm-msm+bounces-85597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C8CC9B11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 23:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51F8230046E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 22:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844C33101BC;
	Wed, 17 Dec 2025 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeFXHlrf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B1309DCF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010167; cv=none; b=SAkoBe6iCC4P0meFYGEAodNK6gRJgfUXc+IBVPFaXKwIFzBCkIfSV2XGSJ9SmEtL5ixt/v3yYxl4jpccLRR/hfjPrY4i+8DhEdNjrkTJr92Lw96Kf9RoU1zbZXeTa/u0zayIBZv0QbLGk3qUB7mnsJnr4962W//Fs7OVDziumbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010167; c=relaxed/simple;
	bh=vYwp4I8hbPBtRMIorBvdZ6p/CrpScVwqDiWtbE9lOpQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FosNJ6gpd0xqv/nVN4fOTKyO4D6I7NWPyTRf3GrRQwO20tAKoAoPhjU05kT58QM84Mfa8C3FIXA4mSxOiqF4eT1F5O/e1Ifz3ev/TcdRWrONM16l2GSv7Or4j7+9v9+p4l1hHawCFc+CjtDv8RVZ0S+9304XnVCVk3PqJr25Pvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeFXHlrf; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3ec3cdcda4eso26151fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766010164; x=1766614964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBxT+qxJytm2iSkVjV6pmyZyn6kdgr+cvKPmdICf7/8=;
        b=IeFXHlrfbgBg1N0YXjTUL63mqq2/6P9fJmISj5Ic2e/EwSmailkKZ4wqG+jOwv72dQ
         rEMkcyYpk7y/3WKml9bXC4Py2MZMbA1emtxBf0qlMc4mhu3+vB+r2DZInr+lJITD89gg
         1/jsr0L86LveK+NRq4rEJCEN9peZ90sqjQviqx1/SMO66OoXI8IrWyoXXxGoTCzq4tpK
         1TKyWzGOer1+ZmEMKIMjSx0GNWDOcfTAyKrK+wPytEtqZfdAwYtvQHsy5pjBiYxYe3kY
         QW0wNVLMUk8V0OV1Um7GUf1YhocoHImH6hFXXvLneEYRUcqUsKVwVhUj2XS7JdwDPamo
         iGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766010164; x=1766614964;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBxT+qxJytm2iSkVjV6pmyZyn6kdgr+cvKPmdICf7/8=;
        b=un2/tcPQ7/hxo/F0zrRjVSci7+uK3gfcgVj8Cl6oDikiUFLlJ7WZyUQvdeauwMjTsE
         09kzB9QeNF+ccKw60AHjcWEJOzsAdcz01CFNIVTgeSSB/1KQvM8AzTKa8FkEHm7YnIOB
         xSvia46IJYvEn1tii2KP7YhaTmaAY0rV1eplq40kNaOtV6MBh91AGd3oOyybRS/aTLxO
         nRjaa4xdSgo6OhAUs0V7pPW9aTYhaDH3LWI1LtIu7hmvrkPvhnQsRykmLtDGIJKyRjZZ
         t7Q6kG8lwJfi6kKYfh7az49O9jnV4Hue5UKFXCgm2v1IpzQmDo9w+HRXn6JohNxgM4xS
         R9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUfEaQQ1JYWAURpKMW588xTg8mFcOMXjlsaqs0kw1hucaeZHHhiF2yjm0WGCIBuo1AGMzXWwedVCjEeHJ5m@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxL/AY/60neTozocl0NXWPb4Ey/vjpISJohHTPyL9u6GAr4Rd
	g0+XZMZB17lhfv7sPY6ALqaNCM6h3ZX/uiTr1BNEpTU4GTK1G3Z3GPGW
X-Gm-Gg: AY/fxX4u12SocM4S8LN6kF7mdZQzMyLai8bDmOSKSBHIkrX2g7/4nNn7utjcYTS6sKl
	aOWM9k0Pg1f2T4k58A5sEs9nzplbb/1ZW8+HpwX7Jp4Kg11VCF1xcugYbUMrLP2YTaEkwwMigVe
	8v95AyHsrrfO8dcexIhE5v/gUF353D9W98auA1rvI4MGASrOFwZvw4Ctw0OIIkoCLYu4miPqepU
	WeS3ID/RlNCjQTvvFRf6Xu53f+OqH8THwGZzn/Olzzl6N+c0jqdguejk81kCxAQEc1hvzqPzOLN
	2R++DMYEgGm9rf9lMRc0/TLHUjFiXPWkryjB+tkaqIw4FHTd/Ij6L0lp4W7k8TDgMre29L043ud
	+B0K0CSZB7iC2EVdoeiu2goI2ppXQgs2FpnSlY+Lbbnyp3KKon3+Ty3k/gAqZzp6A1tPI8C0O+Z
	fr1YVRL/dTBcY+WoveXZHUky/QeXGVwQy68RJrVaJI0skfuMq0iaGMz/LyZObF5fbRiLAeHUf+x
	piERw1a85btwDLydIr4FcBCFq989o7fgw==
X-Google-Smtp-Source: AGHT+IFC26iHFHHe2fXKYJJ8rDtCJgJSSJ/HdeAkwkJxZvAMW9JxllEHGz3GExgYx6xskoAuaUue/A==
X-Received: by 2002:a05:6870:3211:b0:3e8:9ac2:a4db with SMTP id 586e51a60fabf-3f5f8c1572dmr8900323fac.36.1766010164315;
        Wed, 17 Dec 2025 14:22:44 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fa18024d96sm426403fac.22.2025.12.17.14.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 14:22:43 -0800 (PST)
Message-ID: <4bbc7303-759f-4e00-a397-d233a013f620@gmail.com>
Date: Wed, 17 Dec 2025 16:22:42 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: mr.nuke.me@gmail.com
Subject: Re: [PATCH RFC 1/3] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil:
 convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
 <20251210003729.3909663-2-mr.nuke.me@gmail.com>
 <20251216-notorious-omniscient-frog-caceaf@quoll>
 <f38764d7-9d7d-47f4-a099-b6ac6b12be6e@gmail.com>
 <a4e0bc9b-1482-49ac-8454-39edeaf3b676@kernel.org>
Content-Language: en-US
In-Reply-To: <a4e0bc9b-1482-49ac-8454-39edeaf3b676@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/17/25 1:55 AM, Krzysztof Kozlowski wrote:
> On 17/12/2025 06:01, Alex G. wrote:
>>> Filename based on the compatible, so for example:
>>> qcom,ipq8074-wcss-pil.yaml
>> Okay.
>>>> @@ -0,0 +1,167 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/remoteproc/qcom,ipq9574-wcss-pil.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm IPQ WCSS Peripheral Image Loader
>>>> +
>>>> +maintainers:
>>>> +  - Placeholder Maintainer <placeholder@kernel.org>
>>>
>>> This must be a real person. Fallback is your SoC maintainer.
>>
>> I can't find an official maintainer for IPQ8074 or IPQ9574. I could list
> 
> I don't think you looked then. get_maintainers gives you clear answer.

get_maintainers on qcom,q6v5.txt gives five generic subsystem 
maintainers, and you are on of them! I'll take something more specific, 
but just defaulting to get_maintainers is not helpful here.

>> myself, but you know a lot about these bindings. Is it okay if I list
>> you as the maintainer of this binding, Krzysztof?
> 
> No. I am not the maintainer of this SoC.

Thank you for confirming you do not wish to be listed as the maintainer 
here.

>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: qdsp6
>>>> +      - const: rmb
>>>> +
>>>> +  interrupts-extended:
>>>
>>> No, you only need interrupts. Please look at other bindings - how they
>>> write this.
>>
>> I thought I needed interrupts-extended if the interrupts use more than
>> one interrupt controller. Is that not the case?
> 
> Instead of asking the same question again, which would give you the same
> answer "No, you only need interrupts" please rather think on the rest of
> the answer - look at other bindings.

No. It's a clarifying question with additional context. I think I should 
be expected to ask them when I still have doubts.
>>>> +  qcom,smem-states:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>
>>> That's incomplete - missing constraints. Are you sure you wrote this
>>> code the same way we already did for other devices?
>>
>> I am not sure. It seems to match qcom,qcs404-cdsp-pil.yaml or
> 
> No, it does not.
> 
> Look at these files even - they have maxItems. Where do you see maxItems
> here? So how this can be done the same way ("match")?
> 
>> qcom,wcnss.yaml. What constraints are you expecting here?
> 
> So you take the latest binding, e.g. pas-common for all new platforms.
> Or qcom,qcs404-cdsp-pil.yaml. You need maxItems here and list of items
> for the names.

Okay. I wasn't sure if that's the appropriate solution when QCS404 and 
IPQ8074 take a different number of smem-states.
>>
>>>> +    description: States used by the AP to signal the remote processor
>>>> +
>>>> +  qcom,smem-state-names:
>>>> +    description:
>>>> +      Names of the states used by the AP to signal the remote processor
>>>> +
>>>> +  glink-edge:
>>>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>>> +    description:
>>>> +      Qualcomm G-Link subnode which represents communication edge, channels
>>>> +      and devices related to the Modem.
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - reg-names
>>>> +  - interrupts-extended
>>>> +  - interrupt-names
>>>> +  - memory-region
>>>> +  - qcom,halt-regs
>>>> +  - qcom,smem-states
>>>> +  - qcom,smem-state-names
>>>> +
>>>> +allOf:
>>>
>>> Seems you do not reference other schemas. I am going to repeat myself
>>> for 10th time: are you sure you followed other devices?
>>
>> It's the sixth time, but I see your point. Comparing to
>> qcom,qcs404-cdsp-pil.yaml or qcom,wcnss.yaml, I can't see what's
>> missing. What do I need here?
> 
> In previous cases you did not look at other binding, so I am questioning
> now everything.I resent the accusation. I looked at several other bindings to see the 
best way to write this one in a manner that also works with "make 
dt_binding_check". I have done my homework, and think it is unproductive 
to accuse me of not doing it because I did not do it to your standards 
or liking.

>>
>>>
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,ipq8074-wcss-pil
>>>> +    then:
>>>> +      properties:
>>>> +        qcom,smem-states:
>>>> +          items:
>>>> +            - description: Shutdown Q6
>>>> +            - description: Stop Q6
>>>> +        qcom,smem-state-names:
>>>> +          items:
>>>> +            - const: shutdown
>>>> +            - const: stop
>>>
>>> Missing clocks
>>
>> The text binding that this replaces implies no clocks for IPQ8074. What
>> would you like me to add instead?
> 
> Disallow the clocks. See example-schema.

Okay. Makes sense (clocks: false).

>>
>>> Missing blank line
>>>
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,qcs404-wcss-pil
>>>> +    then:
>>>> +      properties:
>>>> +        qcom,smem-states:
>>>> +          maxItems: 1
>>>> +        qcom,smem-state-names:
>>>> +          items:
>>>> +            - const: stop
>>>
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,qcs404-wcss-pil
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 10
>>>> +          maxItems: 10
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: xo
>>>> +            - const: gcc_abhs_cbcr
>>>> +            - const: gcc_axim_cbcr
>>>> +            - const: lcc_ahbfabric_cbc
>>>> +            - const: tcsr_lcc_cbc
>>>> +            - const: lcc_abhs_cbc
>>>> +            - const: lcc_tcm_slave_cbc
>>>> +            - const: lcc_abhm_cbc
>>>> +            - const: lcc_axim_cbc
>>>> +            - const: lcc_bcr_sleep
>>>
>>> All this goes to previous if.
>>
>> Okay
>>
>>>> +      required:
>>>> +        - clocks
>>>> +        - clock-names
>>>> +        - cx-supply
>>>> +
>>>> +additionalProperties: false
>>>
>>> Missing example.
>>
>> I plan to add the example in the next patch in the series that adds
>> IPQ9547 binding. I don't have the resources to test IPQ8074 or QCS404,
>> and I want to be sure that the example I add is tested.
> 
> I don't understand what example has anything to do with testing. We
> speak here ONLY about this binding. I do not review other code. This
> patch should have the example, but if you cannot come with one, because
> it does not exist in any existing sources, then you should just say
> that. You have entire commit msg to explain every unusual thing. And
> testing something on a device is not a reason, because you do not test
> the binding on a device.

I will mention this discrepant in the commit message.

> Best regards,
> Krzysztof


