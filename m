Return-Path: <linux-arm-msm+bounces-26032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C162D92FA12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 14:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ACEF1F21FD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 12:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7F815A4B3;
	Fri, 12 Jul 2024 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6PJ6REs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79A1640B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720786807; cv=none; b=QofIMr43QkXhRgksT+D9iMRkbGis517GLd0tVRIO8R6DloJ+5Vaxfd7Pz7iclqeRpOvq0E2aP/U2Sqbl8tL4+/71+VW4MIKk1TcztBxbBIbWgk4hmBLijFO1ygMOihM5wJQ6UlhznlpRRZrDo2F/AM1aPXUVt+vdQ9FTecsnvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720786807; c=relaxed/simple;
	bh=9EPphHnDUG4NA9uzVthgoM502jdfAE9pgOG0c6JM1iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cD24/BqdbDfcFp7yJL0LMDYI+/JtnfiwxvdJzkjPnT22S6+LE1xtKwrWx4W6ruIYVDDxEb3UHYTaOdCAqGlBId6XWF1siqJEnrrdwqXNEuHcYOtLMzUZuFJb+2U8c792MI3wc4X7HE02ZuRhoDlFVhpEDnbnSCSgBNEt5A/v/0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6PJ6REs; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so29811861fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720786804; x=1721391604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yAvitaA5/W52S3uPDulQ2iO0iWsi1ypQySbrbzTULVw=;
        b=W6PJ6REsvEKZzNB3g36OcxZPU5O4+g39M97yA4uzncVYq9RVKB3bWey7bIX+CojWK0
         +hkR5eHAs0JJkwrD74go1A9n3gveFFEpswqDfVDFa4NV3lNXM0GLKSIhzqZKCCvIj9ic
         2QM8ueXubRfw/WygX3g0aMNHTHs1vPtLT15aZm5O62T9xMFB9iJgkrtA7pnPlWEHBP+b
         +TSeu/a8Dpijon9N+3AYcBvkCcKkEhD0v67cqEJH6ZN15U215tiSaNDmw7bI4EpzVDk+
         EJx1vdEjP1cyhyNwKUm+kjrmUiq0hRAA50Etrcbv21JvJz/MaUqbnZVSM8KzlUTF6ckz
         wJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720786804; x=1721391604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAvitaA5/W52S3uPDulQ2iO0iWsi1ypQySbrbzTULVw=;
        b=LqI8E3o6rGrkP+fBDKoYAvBMl1V4RY2eOHdJJQnjQr7JUqvh9Ix9SBuf0lKAkypWyX
         6hL8mHn0xYPm1z5F15uJ16KpRLPOcl6sdStb/BhnmJUrmDmh2jCKTQGECPHJFQWNHoOx
         s4iwqLkyV4y/LwSR3x7ugOcLlaQbRV5rx32lZipADShsFHdECVww4IBjF6iX7yywTn6D
         twudvn/WG//q6L/Mr5bzo4hhOJPSqk2S/dcekXhMy8DHcXNOPkWrhkim5b5AD8aaZI4L
         WhoL/1no3LGhB7q4FtNcRtq6gm6CpmWNwtGeThs/SBmAxm0z9JiY/4Ry47Dx52CYdPJW
         FXDw==
X-Forwarded-Encrypted: i=1; AJvYcCVupBsKFZBCbT9qr8HPd9lFYyNjz7CNJUok08TCyHhf5g5AfdvB7/gvFIOvGL+sd/AjGcPuG6SlZH1CSLOUS3Rz/gVPzYzjTvcJSpU6kg==
X-Gm-Message-State: AOJu0YwvrPVMgXLbfGPN+VreBzp4fR92Dkx53c6BUPXd86GqI4Of9ieU
	DfmCz/QjKjzI7Sgz6Ht1z+XqQGSkRnf1A3GWJ1cfT02T5nhTGVxT4H2rdEJJ1yU3hpTigrb+71k
	W
X-Google-Smtp-Source: AGHT+IFas4iCmt9N2Qz4LAG1IBm/XWmInsiV/vp1l/Qxp+N/YOxIJ/vzXeahtzs/C2xTzNQoANZgRA==
X-Received: by 2002:a05:6512:2245:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-52eb99d653amr10339784e87.60.1720786803441;
        Fri, 12 Jul 2024 05:20:03 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bcc47sm342739266b.11.2024.07.12.05.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 05:20:02 -0700 (PDT)
Message-ID: <767cfb35-ed52-4d51-b1bb-c69ac5b593b4@linaro.org>
Date: Fri, 12 Jul 2024 14:20:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/7] soc: qcom: Utilize qcom scmi vendor protocol for bus
 dvfs
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 Amir Vajid <avajid@quicinc.com>
References: <20240117173458.2312669-1-quic_sibis@quicinc.com>
 <20240117173458.2312669-5-quic_sibis@quicinc.com>
 <7e48e51e-e16a-41b9-800d-960c627b8da6@linaro.org>
 <d24a3372-8ee5-528d-09ac-86c64f0896e5@quicinc.com>
 <027b9ba8-20b7-4d20-8128-156398f21902@linaro.org>
 <854f324d-c9dc-affc-6f6f-0219bcbc1e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <854f324d-c9dc-affc-6f6f-0219bcbc1e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1.07.2024 10:44 AM, Sibi Sankar wrote:
> 
> 
> On 6/19/24 01:07, Konrad Dybcio wrote:
>>
>>
>> On 2/12/24 11:33, Sibi Sankar wrote:
>>
>> [...]
>>
>>
>>>>
>>>>> +            monitor->mon_type = (of_property_read_bool(monitor_np, "qcom,compute-mon")) ? 1 : 0;

BTW: the ternary operator here is unnecessary, but to make it readable,
please make an enum / #define describing the two, as magic values are
discouraged

>>>>> +            monitor->ipm_ceil = (of_property_read_bool(monitor_np, "qcom,compute-mon")) ? 0 : 20000000;

Given that you check the same condition here, an if-else block may be
more readable, perhaps some comment like:

ipm_ceil = 0; /* Always keep a vote, no matter the bus traffic */

>>>>
>>>> What does it even mean for a monitor to be a compute mon?
>>>>
>>>
>>> When a monitor is marked compute-mon it means that the table is
>>> followed religiously irrespective whether the instruction per miss
>>> count threshold (ipm) is exceeded or not. Equivalent to having
>>> a cpufreq map -> l3/DDR bw mapping upstream.

I.. don't really like that this exists as something that requires OS
intervention, but since it does, I suppose it takes a couple lines of
code less than adding OPP entries for each and every PSTATE and NUM_SKUs..

>>
>> I'm sorta puzzled why the OS would even be required to program this, since
>> L3/DDR/CPU frequencies are known by various stages of boot and secure firmware
>> too.
>>
>> What happens if we omit this? Is the default configuration identical to this?
>> Or does it need explicit enabling?
> 
> CPUCP isn't expected to know the various ranges supported by the memory
> buses it can vote on and from a sandboxing perspective one would want to
> control what CPUCP has access to as well. It also can't arrive at the
> exact values just from the OPP tables we pass on as well. So it doesn't
> have any default values to start off with. For all these reasons, they
> need explicit setting up and without it, the algorithm wouldn't function
> as expected.

Ok, I was thinking more of a scenario where XBL/GH would take care of this..

Throwing in my 5 cents, this could perhaps be moved there in future FW
designs (the earlier in the chain the better, especially to keep kicking
out gunyah a viable option), as I don't think Linux is the greatest place
for storing one-shot configuration data, especially for blocks that already
run their own firmware..

I would imagine this could speed up booting as well, if DRAM was appropriately
scaled during the boot splash stage (unless it already is either scaled or
pinned to FMAX)

Konrad


