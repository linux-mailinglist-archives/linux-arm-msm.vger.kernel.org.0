Return-Path: <linux-arm-msm+bounces-76630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6AABC8B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 13:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 562DF4E9378
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 11:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE50E2E0415;
	Thu,  9 Oct 2025 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbSv1zCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5B2DD5EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007991; cv=none; b=U7jFn3fKTcbW/DVT+8LqTEdHqRqCblBAdonFXpSE5lvq2HRIHk5O+sbI20D31f4jAC3rVqP7DN3I2uAP3UbtMof61rNkSzzetTBlahNWolm2fBgcDvE8KLpGVb6GU7FrL9ce1R5NFwIZ/s03ByajNd6vj/iWAJ+dTyg7iSdxpUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007991; c=relaxed/simple;
	bh=e+J/tiye5mRAK/FZkIReamJjbpURV3VmdmtPDcVSuXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/AlnUZ05fzdgePsnHkfU2qKI/k5zTxuWeqzV4bNYznKWU+esyF9bGej7QD/NyL6c2l8qBFt1Je9KO48VfL1KzXzYqWE3/9cG16F6O59fl52NK0iHQQREnTGkm9Ro2RroTcZbi1VamQFzE4B4gYafOk8BQmzK43yEehSKjcmmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbSv1zCz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46b303f7469so4913995e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 04:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760007988; x=1760612788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTLqI8rxOdYS+w1Ui92U5vAm+VjLT7vBGUB8kjwj7vI=;
        b=MbSv1zCz3Ozmfi0LhPthtBhKt97y5ZdtChOjh5fBKYYytDP+R7YeQOT+weksMIaYTw
         N130IVFLTpfTWalrbjrqxq3eEdyjewG+pZQA88Yc10QJNCWFGAIFuGvQOTcbRXEpQwI3
         Lihr2dXTMdHfGkET7UmKPsrIwOgmWlIf2OD9JzNeyd546SvqOYPIG5uvgY+KWu2Yef2a
         lPB9/3AQqe+juwgu68Td+KwjdrULhOH9pZTTlcCfHM2hyK4LCcJyJ72WzZQBC5OQbE/W
         j731H8u4PEEEzVOaiim6dTdIFwfYsOh6pjqmoaZRgfTQqodBq0VxAJJ5OsLfa2lnuVJq
         qqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007988; x=1760612788;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTLqI8rxOdYS+w1Ui92U5vAm+VjLT7vBGUB8kjwj7vI=;
        b=UWKYPoyE9dzpDii3NUADGM2eY4cQS9CoSNwEO3KDvxBoT1GdjUgRgW1je0WeKePyrP
         yO0ix+jj+IC4k08Jp5h//NApJmh9N5fjf5exuR4vbMiqvpezzDZ7iX/0jDdUTEUksRX0
         JOSfLQaVbCuG2psaMIaAhbATlYiwipq8wD2cGf08CBZOFs3IEXbb8J8QXT+xCDI9il4x
         DFbk72nbkeIw26ZlolpA40eZuu6H/9ET10PzpTo9nk9bBAONDQZPrg5XD16Q93oW3Z6M
         jX9gE3jTF3nbXdWRpE1eU7OUhaAF/og2KutrUutzgfA/DGVffVJxxvV3DAUtiLeNwsEM
         BHeg==
X-Forwarded-Encrypted: i=1; AJvYcCXDQqWYZi0I0Tg7b28nyN83SlXlJHCmXOaKha4mouJCsgv/alwH6AHB6NPyMkawLCCwdIu2v9tyPHXCIZRW@vger.kernel.org
X-Gm-Message-State: AOJu0YwnM8otfgVvp6Bxk/A5bmGErdI5cj9sCXHUraADdrUql19LEnLF
	FFKaDyr7AkKVOFFyxkvToHvrCeOK+YfWGAYTCkUkabSOHuMmCGmpJ1pGdEguY+1YBtg=
X-Gm-Gg: ASbGnctZS3nHh46ZQJijAIY6KqJ9x1mrILCkTPa98GWfZb5y+kmCwxUcyE1SQ7OjZeH
	4oZjNlWyTquOmgqFGDMoKxATbC2fhszwNX3YYVEmYU2m650fqtTEymwUnTxGyCY4yFwPy2Ms84W
	GG8d0Mezd7VEjNqZgZx4Whtq+7uwxwI6ZfEuTIwkjU4AolPMdVG9bh79YEjFjFRmcmtW7ZRiLdB
	OiN5G1ZFLyW9/BGbffz3CUDRqm0lCDQHGrSBafDEYfjkHR6NfINISuh9Sh7vGZlo4xPz3e5tJNe
	36XM1E+klrIMWPmPLA0kn3k3g6/fa4jBYtWZEWVQcr4k6MgiG8Hqje9zzua5e6GyUuML0+rfBU9
	WJL5H+P1Py0+hfvZ5/sWSeSUoCwssJUd+poRhqZnPuaSBtA0rjx9s0PvieuNK+n5I6HXe0l0T5/
	Nv6J/5LVEZA1WJjOD9
X-Google-Smtp-Source: AGHT+IFYJmAYAugMFGROqR67bT/ub4cesGuFD0FYj+fBxCLxvJVqCchCUIgmAvmeFF5WvX92ukK23A==
X-Received: by 2002:a05:600c:4ed4:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-46fa9b13b04mr41874535e9.37.1760007988060;
        Thu, 09 Oct 2025 04:06:28 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab500706sm35212915e9.3.2025.10.09.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 04:06:27 -0700 (PDT)
Message-ID: <28baa5ce-c161-426a-b5df-1cd784489bb5@linaro.org>
Date: Thu, 9 Oct 2025 12:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue
 <bod@kernel.org>, Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <MMSKAu89Ew7StAeFBV442KfKNzmqbTSQ-maFG35Jr9d8PkUV2L4sx44R2DRevXA8mC45vkA398l2mvVzarZwew==@protonmail.internalid>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
 <d46c0335-99d6-469f-a61f-aca4c851f745@kernel.org>
 <GyrcG3qBN7c5C7ajCs3EV81hWvuaVbg64CpzQ-X3d_p6EauoiKxSoG2aOKE21-j12SWFjNDjV-kVSwYYqVm_lQ==@protonmail.internalid>
 <a0dc93ec-e35c-409b-8dfb-1642c92a9f0c@kernel.org>
 <98e6acf8-80d7-4894-b4ce-ce74660722ef@kernel.org>
 <soFAWqHDNosrZui972Ip7EvMCfB6tepD-HxHkc17RKmilPJpQZjMzni9LmMOpvKumHqFEibe5FdNkkJG8DKlcw==@protonmail.internalid>
 <5085c857-f6e8-4faf-b61a-a9ee562ccf06@kernel.org>
 <7ba3953a-166f-4c67-8f54-666b0c488b12@kernel.org>
 <e15f156c-cb38-4566-b275-ba156a7b598d@kernel.org>
 <4fac8b52-180d-7b79-f0d9-52c0f94186da@quicinc.com>
 <e8dfad82-ab07-40e9-9296-859168142611@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e8dfad82-ab07-40e9-9296-859168142611@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 11:45, Krzysztof Kozlowski wrote:
> On 09/10/2025 19:40, Vikash Garodia wrote:
>>
>> On 10/9/2025 2:41 PM, Krzysztof Kozlowski wrote:
>>> On 09/10/2025 17:38, Bryan O'Donoghue wrote:
>>>> On 09/10/2025 02:04, Krzysztof Kozlowski wrote:
>>>>>> The iommu description for this platform basically lacks the data that
>>>>>> _should_ be there -> FUNCTION_ID.
>>>>> No. The index tells that already.
>>>>
>>>> Hmm.
>>>>>> The rule is that the DT should really describe the hardware right ?
>>>>> It already does. Same as I wrote on IRC, DT already has all the
>>>>> information. Entry 0 has function ID-foo. Entry 1 has function ID-bar.
>>>>> Entry 2 has function ID-bar or whatever.
>>>>
>>>> That's the part I don't believe is true its a 1:Many relationship
>>>> between FUNCTION_ID:SIDs
>>>>
>>>> Let me check the docs...
>>>>
>>>> Here's the example I gave on IRC for lore
>>>>
>>>> SID 0x1940 maps to AC_VM_HLOS (Linux)
>>>> SID 0x1941 maps to AC_VM_CP_BITSTREAM - protected bitstream
>>>> SID 0x1945 maps to AC_WM_CP_BITSTREAM
>>>>
>>>
>>> I responded to this on IRC... Nothing proves here that 1:many cannot be
>>> done.
>>
>> Kaanapali already has 1:Many relationship for FUNCTION_ID:SIDs.
> 
> Sun is a star. How is that related? I am not going to duplicate
> arguments from IRC, especially to that pointless argument. Read again
> discussion on IRC.
> 
> Best regards,
> Krzysztof

But Krzysztof is it not the case DT should be a representation of the 
real hardware and that this takes priority over established schema.

There seems to be no other reason to keep SID in the DT and FUNCTION_ID 
in driver meta-data except the schema already says X.

There are as I count it, 189 TCU SID mappings for Hamoa.

So in the extreme case that means we have an iommu = <> for each of 
those but then need a corresponding entry in a driver to map each SID to 
its relevant FUNCTION_ID.

And do that over and over again for each new SoC.

OTOH if we extend the iommu to include FUNCTION_ID then only the DT 
changes - with the iommu setup code changing once to accommodate it.

---
bod

