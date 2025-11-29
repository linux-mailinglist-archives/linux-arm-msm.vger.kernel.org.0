Return-Path: <linux-arm-msm+bounces-83839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FBEC93B1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 10:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D1804E10F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 09:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A70126A1BB;
	Sat, 29 Nov 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9pWioFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0261DED40;
	Sat, 29 Nov 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764408115; cv=none; b=amJUsvAdf+jpH+LboZrnsARXVgUIsfE7/x3PfBhKQy4sBFVydsuwDj+6cvTjC54U5V6VTXA2489bvcxzHMf96tVLGGJl43aGN0FPA7wGUQMKpSQm46/S5hVZsc8bK/KtMLdknxDqg83T69yG4hsd/CgzDO2lfYHT/d9wD/HzHEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764408115; c=relaxed/simple;
	bh=JCS0XqE0LFr0UTEUO0aQ5SQ+0IwobH/0SZQXNTJ7Dp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diMrINQ9Wixlmc6bwY0P1bUrFK/oHchjetY1do9GoYjB/CDUl5yMmMmrO6WwnTOPT333rZTDSGS8o87Fbr7W+hKpPsXJVoQPvfUE8ZkZL87cXTuCrZEBjcFfHmKDEwyr/28LA9JXkJukLZrOGXJizCnTft61axPlWHEd0ADSPtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9pWioFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850DAC4CEF7;
	Sat, 29 Nov 2025 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764408114;
	bh=JCS0XqE0LFr0UTEUO0aQ5SQ+0IwobH/0SZQXNTJ7Dp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G9pWioFSz+XjIfNCx5EfgksG+5jhfX0lFdfTcBm+HCvYoT+oJSugei8I0cVPEGMD1
	 TwtgZRI59CF8X4xdelv4vTcK54QNLv7t2HBvHLj2/RfxNzJVGl9X8gbCHZJZt3iKln
	 Lnibl+Rj7ilODpXldmoKQchkXhSTYTz/J6eu0AcShpVhZ4RWz3w6voShxzXiY4rMfK
	 +pb3ZYxnkRBJp0FLLywFirUULQPPtccDLWLb++uKoPWpdEJ5NTZlZyy1/DChbZAl8S
	 BD2s796269OU9LF5huPpVN6KwOX78mByOaq/WrbZ+gIOk6++Ar7Z8bl2+jgJyogpXg
	 MCmwVMd1HyUhg==
Message-ID: <5bad57b5-ab05-477e-b8e9-5086139b2326@kernel.org>
Date: Sat, 29 Nov 2025 10:21:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
 <1207b70e-dcf1-47cf-be26-ff2928932e3e@oss.qualcomm.com>
 <89601075-a312-478e-925d-3cc0b1e9471a@kernel.org>
 <a6a172bc-9f76-4e12-8925-35319baabb62@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a6a172bc-9f76-4e12-8925-35319baabb62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2025 11:29, Akhil P Oommen wrote:
> On 11/25/2025 1:28 PM, Krzysztof Kozlowski wrote:
>> On 24/11/2025 22:39, Akhil P Oommen wrote:
>>> On 11/22/2025 4:32 PM, Krzysztof Kozlowski wrote:
>>>> On Sat, Nov 22, 2025 at 03:22:16AM +0530, Akhil P Oommen wrote:
>>>>> +
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: qcom,adreno-612.0
>>>>> +    then:
>>>>> +      properties:
>>>>> +        clocks:
>>>>> +          items:
>>>>> +            - description: GPU Core clock
>>>>> +
>>>>> +        clock-names:
>>>>> +          items:
>>>>> +            - const: core
>>>>> +
>>>>> +      required:
>>>>> +        - clocks
>>>>> +        - clock-names
>>>>> +
>>>>>      else:
>>>>
>>>> I am pretty sure you break not only intention/logic behindi this else,
>>>> but actually cause real warnings to appear.
>>>>
>>>> The else was intentional, right? So the pattern further will not match
>>>> some of devices defined in if:. Now else is for different part, so only
>>>> 612 out of these devices is excluded.
>>>>
>>>> There is a reason we do not want ever else:if: in bindings. If it
>>>> appeared, sure, maybe there is some benefit of it, but it means you need
>>>> to be more careful now.
>>>
>>> Aah! I missed that this comes under an 'allOf'. Not an expert in this
>>
>> The allOf does not matter here. If these were separate if:then: then it
>> would be the same.
>>
>>> syntax, does moving this entire block under an 'else' make sense? Or is
>>
>> No, never nest blocks.
>>
>>> there a saner alternative?
>>
>> Not sure, I don't remember the code. Original code was not easy to read,
>> with your changes it will not be easier. So the only alternative I see
>> is to make it simple and obvious.
> 
> Could you please confirm if the below change would be okay?
> 
> @@ -384,6 +384,31 @@ allOf:
> 
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - qcom,adreno-610.0
>               - qcom,adreno-619.1
>               - qcom,adreno-07000200
>     then:
>       properties:
>         clocks:
>           minItems: 6
>           maxItems: 6
> 
>         clock-names:
>           items:
>             - const: core
>               description: GPU Core clock
>             - const: iface
>               description: GPU Interface clock
>             - const: mem_iface
>               description: GPU Memory Interface clock
>             - const: alt_mem_iface
>               description: GPU Alternative Memory Interface clock
>             - const: gmu
>               description: CX GMU clock
>             - const: xo
>               description: GPUCC clocksource clock
> 
>         reg-names:
>           minItems: 1
>           items:
>              - const: kgsl_3d0_reg_memory
>              - const: cx_dbgc
> 
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,adreno-612.0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GPU Core clock
> +
> +        clock-names:
> +          items:
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,adreno-610.0
> +              - qcom,adreno-612.0
> +              - qcom,adreno-619.1
> +              - qcom,adreno-07000200
> +    then:
>       required:
>         - clocks
>         - clock-names

Yes, this should work, but I think it is better to require clocks in the
same block which defines them. You also need to restrict reg/reg-names
for the new device.

> 
>     else:
>       if:
>         properties:
>           compatible:
>             contains:
>               oneOf:
>                 - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
>                 - pattern: '^qcom,adreno-[0-9a-f]{8}$'

This if:else:if: should be just removed and written in a way to choose
specific devices affected here. The code is not readable and your
mistake was a proof of that.

> 
>       then: # Starting with A6xx, the clocks are usually defined in the
>         properties:
Best regards,
Krzysztof

