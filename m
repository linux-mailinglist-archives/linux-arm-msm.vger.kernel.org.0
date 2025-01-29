Return-Path: <linux-arm-msm+bounces-46512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D267A21EBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A53C3A9728
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79C51DACB8;
	Wed, 29 Jan 2025 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDyvcZPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDAF1917F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159679; cv=none; b=oF0XIwMvxEBMpmMUHgFSPo8y16mOHJ6p4mRpZ019j7XiJUvTOkMomxQ2criGt30CZzV1JFieE2EO4pKCkk1q17delY18pe4PhWjMtVXmeI1az0QIbCHZqKcbvWv8/9dTLrCnGMvBEgGNwhznNKDnhfqWkZfKprJzZV0Us0Cs8u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159679; c=relaxed/simple;
	bh=7yKZJGEuZnKFh0A4V/iVgZ8ZSrBZxlrwEP8NyfcAutg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLtRlF7+dZUMkEJFg/lsnT8bbGT7ahWnMYjQsdBgqcfJx4htOEHm62/pLgHMpASM1byNpyV80O67szkpzfnM1SpYbEzgmv+FPfkRGgaWZuKGBYQD03k7acBU+iAoFg0s6dsJVX0T6lXOmK8vEem/l2qNh5dRenhY7KBFY+XNdhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDyvcZPW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso5794415f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 06:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738159675; x=1738764475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkuuWKeJYmtkm56YSgRvcU4oboHFdcC4bjctcTZXYsw=;
        b=VDyvcZPWtRUf+s3xFoB4rddxr+Q7z1kzP4pjvjikZxSWbB/lYcERhajeNwVXncW6AZ
         LclA6ox90JGsrYnKHrJE2d2HBrHAPtVd4MUmakES7pAluKQKIx9gS4AniQJhkestrn3o
         cuLA3qDeNbyzn09PrbphPLDuGVt/9zpAmFsYXBQ63h3rJIos/ou+Z0PTfR+BEFXDC9Mz
         OwVumVAxdpz9UfwAItFiqftG3VsVB+vBKJ8+eVpJprhWbE3opay41JG1KGMHq3OVeYaa
         MewfLjonDdluAgXwZ9X+HUqAjuUtU8fUUgPJgT3cRxpNih+Iwk35yxH4UVWGzFGp/6gQ
         xy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159675; x=1738764475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkuuWKeJYmtkm56YSgRvcU4oboHFdcC4bjctcTZXYsw=;
        b=RJUUsM3AllWfyfn0WLlZcdgscpnNJbejS8DZVXZWe7cLMohj+er64uajWhvwLGZcSq
         Q3a7GNswBW6ZzpeNhYEe5GdxNZ0M3UeRo63UX4pzNAkRFbas6pSIxa9ng+Q6tQe7Nb4T
         OyuzHfizIdw1QOmE488nLg9/068ML07eq6C3lp1bQ0DrSzvrOTsSVLgqzExt3fOP/ZoC
         XeVCgKbGKvtcziURTRwlZw7HqGitjzdlKoXXR7pdARgip07Zh1qt8aAERLFzeJhp3vi8
         wVDNaBvjAGuOVxREehccYhnJzKJ95i95JBDwCsYEiIciNy5AO/YpPbDLHJhd+np91mL5
         aDNg==
X-Forwarded-Encrypted: i=1; AJvYcCWoAoi7P8Go/xrBmhvsvOqb+eJvntXZ7FNelNPY1Hrsn07pRAdI6x6xwg1ySWC/xt0Me55+xYc3dsu+qfCk@vger.kernel.org
X-Gm-Message-State: AOJu0YyVcl7pJ3Mqg9nLSJUU2c1dMzepDTObTDRCVIyPGCGkemlryJ3x
	+8OH4ijrKsNpgcxOiocXYOFZ2eJ/Pfu2wucfHqsY4uNxQz9w699EaAIEymw4SKQ=
X-Gm-Gg: ASbGncskQKVysIXIJDB0Qg4w1Z4JJftOLL+qEdEXWl7VJUQFf2ePngd4iGkon9HOC/T
	ZHD06D08Ebf9J8s3Amoe2SuGwsaY7CsgcJxPt1yRTeNsx8BcG0HVt8coRGdLEsqz6+YOxZEJ+MB
	twVNk9GGIXsypPlZMTf7McKVo4Z7rk/Lz/TtMJZY3AXQYxTEz8vo4rRxxUN5V8cF6XJOccB8gzT
	XuSLWyNmCf4BF63UKBLE6ZK8TB44GndC6bIQ44xmGmotEu7lLh+3A+Du5JAQuRZwuCTLimID2X1
	RmATrl5FfF7jGFfrbsSBMH2cofKjrWCEPizs
X-Google-Smtp-Source: AGHT+IHfaiytgwBKkLFsb74qxfBwYXhML0vsZSRUcqxi74NrfeZsxJrNuB1BToWwWaD5gvoZ47QV1g==
X-Received: by 2002:a05:6000:1f85:b0:38a:3732:4462 with SMTP id ffacd0b85a97d-38c520af328mr3030005f8f.48.1738159674943;
        Wed, 29 Jan 2025 06:07:54 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d5d4sm16929484f8f.21.2025.01.29.06.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:07:54 -0800 (PST)
Message-ID: <90f53256-8c75-4b43-aac6-5cb9084efe1c@linaro.org>
Date: Wed, 29 Jan 2025 14:07:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
 <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
 <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
 <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
 <29bbb602-61fd-44e1-afb5-f158c8d61c97@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <29bbb602-61fd-44e1-afb5-f158c8d61c97@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/01/2025 1:02 pm, Jie Gan wrote:
> 
> 
> On 1/29/2025 6:35 PM, James Clark wrote:
>>
>>
>> On 29/01/2025 12:46 am, Jie Gan wrote:
>>>
>>>
>>> On 1/28/2025 7:55 PM, James Clark wrote:
>>>>
>>>>
>>>> On 24/01/2025 7:25 am, Jie Gan wrote:
>>>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>>>> registers
>>>>> which control various features related to TMC ETR sink.
>>>>>
>>>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>>>> register of a specific ETR, trace data with that trace ID gets into
>>>>> the ETR buffer, while other trace data gets dropped.
>>>>>
>>>>> Enabling source device sets one bit of the ATID register based on
>>>>> source device's trace ID.
>>>>> Disabling source device resets the bit according to the source
>>>>> device's trace ID.
>>>>>
>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>> ---
>>>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 ++++++++++++++ 
>>>>> + ++++
>>>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>>>>>   include/linux/coresight.h                    |   3 +-
>>>>>   5 files changed, 321 insertions(+), 1 deletion(-)
>>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>>>  >
>>>>
>>>> [...]
>>>>
>>>>> +/*
>>>>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>>>>> + *
>>>>> + * Returns 0 indicates success. None-zero result means failure.
>>>>> + */
>>>>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, 
>>>>> struct coresight_path *cs_path,
>>>>> +                bool enable)
>>>>> +{
>>>>> +    struct coresight_device *sink = coresight_get_sink(cs_path- 
>>>>> >path);
>>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev- 
>>>>> >dev.parent);
>>>>> +    u8 trace_id = cs_path->trace_id;
>>>>> +    int port_num;
>>>>> +
>>>>> +    if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || 
>>>>> IS_ERR_OR_NULL(drvdata)) {
>>>>> +        dev_err(&csdev->dev, "Invalid parameters\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    port_num = ctcu_get_active_port(sink, csdev);
>>>>> +    if (port_num < 0)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    /*
>>>>> +     * Skip the disable session if more than one TPDM device that
>>>>> +     * connected to the same TPDA device has been enabled.
>>>>> +     */
>>>>> +    if (enable)
>>>>> +        atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
>>>>> +    else {
>>>>> +        if (atomic_dec_return(&drvdata->traceid_refcnt[port_num] 
>>>>> [trace_id]) > 0) {
>>>>> +            dev_dbg(&csdev->dev, "Skip the disable session\n");
>>>>> +            return 0;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
>>>>> +
>>>>> +    return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);
>>>>
>>>> Hi Jie,
>>>>
>>>> Using atomic_dec_return() here doesn't prevent 
>>>> __ctcu_set_etr_traceid() from running concurrent enable and 
>>>> disables. Once you pass the atomic_dec_return() a second call to 
>>>> enable it will mess it up.
>>>>
>>>> I think you need a spinlock around the whole thing and then the 
>>>> refcounts don't need to be atomics.
>>>>
>>> Hi, James
>>> Thanks for comment. I may not fully tested my codes here. What I was 
>>> thinking is there's no way the refcnt could become a negative number 
>>> under current framework. So I just added spinlock in 
>>> __ctcu_set_etr_traceid() to ensure concurrent sessions correctly 
>>> manipulate the register.
>>>
>>> As the trace_id related to the bit of the ATID register, I think the 
>>> concurrent processes are working fine with spinlock around read/write 
>>> register.
>>>
>>> I may not fully got your point here. Please help me to correct it.
>>>
>>> Thanks,
>>> Jie
>>>
>>>
>>
>> No it can't become negative, but the refcount can be a different state 
>> to the one that was actually written:
>>
>>
>>    CPU0                             CPU1
>>    ----                             ----
>>    ctcu_set_etr_traceid(enable)
>>                                     ctcu_set_etr_traceid(disable)
>>    atomic_inc()
>>    recount == 1
>>                                     atomic_dec()
>>                                     recount == 0
>>
>>                                     __ctcu_set_etr_traceid(disable)
>>                                     Lock and write disable state to
>>                                     device
>>
>>    __ctcu_set_etr_traceid(enable)
>>    Lock and write enable state to
>>    device
>>
>>
>> As you can see this leaves the device in an enabled state but the 
>> refcount is 0.
> Yes, you are right. I didnt consider this scenario. We definitely need 
> spinlock here.
> 
>>
>> This is also quite large if you use atomic types:
>>
>>   /* refcnt for each traceid of each sink */
>>   atomic_t traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>>
>> Presumably you can't have the refcount for each ID be higher than the 
>> max number of TPDMs connected? If you make the locked area a bit wider 
>> you don't need atomic types and also solve the above problem. So you 
>> could do u8, or DECLARE_BITMAP() and bitmap_read() etc to read 3 bit 
>> values. Or however wide it needs to be.
> The original purpose of using atomic here is trying to narrow the locked 
> area.
> 
> I think u8 is ok here.
> u8 traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP] will cost 
> 224 bytes, I think it's acceptable here.
> 
> Thanks,
> Jie
> 

Yep u8 sounds ok then



