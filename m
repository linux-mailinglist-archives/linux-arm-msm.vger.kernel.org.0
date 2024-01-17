Return-Path: <linux-arm-msm+bounces-7438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 577838300CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 08:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD491F250D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 07:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D28DBE7D;
	Wed, 17 Jan 2024 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQtCGZEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D52BE62
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705478013; cv=none; b=s4cxpcj6Mk54x5cG2f1qwsBhZoNDx2QF5O4CpEko0dHOOVR5Jl6pklOp7KFYV27gHow/VFtgTqH5yqB6f/5JEGWaMRn5oxSVQvwRh6XjBlJS97hiGBWTvKFGwlGpWJkaQvAz9DA550D6bwSJtoh44os/CFBjmkgiL60eParAtSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705478013; c=relaxed/simple;
	bh=hfcKU0T9ux7f18MyIgB3bldh72prD6P12m0I8ogtZmc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=UBtHGU31oB4oCZPqhV/ySe0NgVgain891Vavw4UivI43kDGIrgeVqA8Euqj99CYrqVGyhEZqikG+7dMjUOiDmLzeSx74zXhPrt0Y7U0No5VQKks1QvnAnDCbhX2oQtyIQUjMCJQyOXYr/a0+M19ynIz/Ci+V+eDBGCCPBnpzQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQtCGZEh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2a17f3217aso1172299566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 23:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705478010; x=1706082810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QE3OUQRuGSCtW+LMwKGY7wcojZHP4WoZBJh6yPHInRY=;
        b=OQtCGZEhuDQ5Wd5M/S/czK6bXlOSCVcezR9//Iof2COhsXKaEn7o1umgHwh8Y6TM4y
         Ofb6DW5UCH3lOOSCuLNb+AVfTiohT3UUNid0BxurZlOFWFDVa+8xuLp8fuo0y/yYtq+A
         k3IzlTotjBlGECJnpv0LABbaNJw8Jjx4Zx9gShxzHtrBO87621pInqA+YSbS269FUVEj
         DlL5dFUMxX/MMOR+VJB5S9s5sCyJguyDTM/7WrtqErHtyIX6v3Df0OoazkLEqlyRAt1s
         fZ60+eERMqJ9cIOuROKDu1pnUg+v0OQBShrw89OYvtvsuO9jLZmOENaqtkB8u1Mv46Gt
         rLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478010; x=1706082810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QE3OUQRuGSCtW+LMwKGY7wcojZHP4WoZBJh6yPHInRY=;
        b=U6ti7RQlYKwtjIg3uTMtMUhw0cndFJ+lkz/LaKPtOH8Oqmvj5OUWItInZwh6k2omJM
         yOhVGVFPmbfS8dZj0+eBYSoLf/W1uCJkORxc78NWBHWMp23gVUwqUyjl3wkjGbhW9PTy
         i7yI5esQO47URm7ehKZas8bltjzpq9ndWhYmMKZywKRWMgmBjxMhXPYRADLXgW2V6L4o
         WgEu4G4WLbnCzJjq0JB9xBzjB51oxpLm8tF2NrydESHTPGYrY0/wXQNxY3u0bv0Z9DCZ
         NIGD1IiIaz5GSfQCvMAqcPOb1oofAfgaFBLtd3pEcvGfqFHqAPs5rn0te9IQbhWn0BUC
         KRQQ==
X-Gm-Message-State: AOJu0YzfKMrsUCPxJpzKpN4oydQGn5oH581a5z18azWmfriWcrT5So74
	sYMaYGmQFPA2xVmjv5YO7JmYoPdX6z9kbw==
X-Google-Smtp-Source: AGHT+IGOIfJsDAIIKbl91OQ3OxwXoT1xUsFqQeHRB4B2LpbiDpFOuSXJ26PeNH3axOB4TCm1K60k0w==
X-Received: by 2002:a17:906:3e42:b0:a2a:c2b7:ee92 with SMTP id t2-20020a1709063e4200b00a2ac2b7ee92mr4124991eji.50.1705478009768;
        Tue, 16 Jan 2024 23:53:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id rh5-20020a17090720e500b00a26b44ac54dsm7372797ejb.68.2024.01.16.23.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 23:53:29 -0800 (PST)
Message-ID: <5648e6e3-e2b1-4fa3-a0cd-74a0f0c0aa30@linaro.org>
Date: Wed, 17 Jan 2024 08:53:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: coresight: Remove pattern match
 of ETE node name
Content-Language: en-US
To: Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Leo Yan <leo.yan@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>
References: <20240116064505.487-1-quic_jinlmao@quicinc.com>
 <20240116064505.487-2-quic_jinlmao@quicinc.com>
 <f616989b-2d84-483d-80c4-d3c6eb97b137@arm.com>
 <69875d89-651e-41ff-a1be-385dcbb15108@quicinc.com>
 <ff85db67-bd18-48fb-9050-81d731e5f402@linaro.org>
 <f74650fd-195f-4b93-a7e0-23b316dd74ad@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f74650fd-195f-4b93-a7e0-23b316dd74ad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2024 08:49, Jinlong Mao wrote:
> 
> 
> On 1/17/2024 3:40 PM, Krzysztof Kozlowski wrote:
>> On 17/01/2024 03:14, Jinlong Mao wrote:
>>>>>          - const: arm,embedded-trace-extension
>>>>> @@ -55,13 +53,13 @@ examples:
>>>>>    # An ETE node without legacy CoreSight connections
>>>>>      - |
>>>>> -    ete0 {
>>>>> +    ete-0 {
>>>>
>>>> Why do we need the number ? why not simply "ete" as Krzysztof suggested ?
>>>>
>>>
>>> Hi Suzuki & Krzysztof ,
>>>
>>> If name all the ete nodes' name as 'ete', there will be error below when
>>> build images.
>>>
>>> arch/arm64/boot/dts/qcom/sm8450.dtsi:301.6-312.4: ERROR
>>
>> Why are you pasting DTSI for binding? How is it related? Do we talk
>> about DTSI here? No, this is a binding patch.
>>
> 
> Hi Krzysztof,
> 
> Do you mean the name in DTSI can be different from the name in binding ?

Yes, we do not talk about DTSI here, so I did not suggest anything about
DTSI.

Best regards,
Krzysztof


