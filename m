Return-Path: <linux-arm-msm+bounces-48156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9EA37E58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A89D316B17D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16406212B3A;
	Mon, 17 Feb 2025 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5yuaOwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7D212B29
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784208; cv=none; b=eFds64aUCM219qpoMVBd4MFxOj7HUGGF0sJN5y61z6rgOgS1oJVZvqkIWm/4LJiTU3iOEt95gltOzbiDPtapChTxoeP+5z7eLLotjVr4ZbAGdSiEI4h3mtYsiD5abp7qkF0YKOKWht7bKas3dBE3bx8g3K1dFEnym5GzNJYg0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784208; c=relaxed/simple;
	bh=YyAb2o+midSz/xUfsuWZ78M8LuO/O3F2doh/TSB64WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhpeVAPi6hPngekpGbArrgCNLHKjYQPqvX5bVg5WJ+SsgFg2FBTucGc+9A3hKcMR0jCPBIwJOvrFkby95n/ZtK5vh+SFPiKjYlTkFQ+07kKtdaht1Z/QHQYuhtLxTWGMYtRCpxlGUfrwQ9axYY9cS4LV1dKxfvi1qnMXqtkoDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5yuaOwr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f3ac22948so587325f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 01:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739784204; x=1740389004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFdEGk76Z8IF8jmdF4E6VELhXn1U7cH2XbnMNEOUO1Q=;
        b=A5yuaOwrLh8DWQNUnYLOjs0W9kjFWcSCYlv7FQKN5a6H2VBmxDZrE9raCVgkw945Aj
         lLOMCMep8pjCTusavOJU7kNp4xCW7MZMLV/sg0oDgai7kHDF6Kck3HQtlELGp62Ldw2Z
         N6NaZJHMlCawdbi8JMoygQmaXATlxFzt9IVwILHIUlIn+cUK3eOEWHvIywBpw7kkPWpW
         3IScIoVIjZWX4nHC4QdjKNYlqPifKV9cDynF2/L1QZ/e9ZabzbqVhw6cnX9fXu6l7mtu
         dAqt3Z6ZqNvKmch91tr0iaMD8Q3aj952NICvWvwUIqAA9NERO05qTBksFsGd7GR9aQfJ
         VmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784204; x=1740389004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFdEGk76Z8IF8jmdF4E6VELhXn1U7cH2XbnMNEOUO1Q=;
        b=I/VctWqcChiM6q54k4k7HFMK+QsE9rEOs13BfNbwYJ0ns8v06RVFse1hGqGnTRRksL
         cnzN3wmtOh+Ki+giGk7e2Elu3pwJuxas28FKjmItZIoVzebDJB6gNE0jP4fMbDsykMXW
         dtzW3iNk5PP9XFRzrXyBszKT57zdgLYUI8eHX0Ca/5QmTgajO5XoQ4NH5kIVUaoQGmC9
         vW4QmMYNdikJZKOwUVs7939yPJGN/LfQ0z6ANkY5mnNg8+fLXNdELCAnM2ahNnkBMFT5
         JCY0Ntw6Ce9dgngGIZ1CsoaAqowOyO8iAMd4DhchPnSlPHRIIl5MdUVlGTwBG6OQ+mOe
         l6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJyzSR0nrrgOPfAQUIV13FCrsAGwXlgGP7XdXGfTv7trnc7COjBm418PcmjRI4CgF1aMU4CRhezCAtj17J@vger.kernel.org
X-Gm-Message-State: AOJu0YxkXngbTYn858uITA+9mtWbKe7tfJ+27OhIMQqE50RhxRtMS8BJ
	GUrwayo5ZTCmw/LbJvTFI9FKcW1Ju3pCJprDSgbzftj8iGUdC+ZdUq6GeueOe0w=
X-Gm-Gg: ASbGnct3JcTQNYo85lJD9J8X/jzNlb2W/g4hZThyqHMe/i4N+BXCmrzFFM2xkRgRQwR
	MCh9BvnqjAMV/GLoimv82sK6Nk1fXD8CfhVHOqp/2oBmb+PeWfTzSZzl4mf21Nfe5cyzeyugpWf
	SdIcBTb0WiK/LZ+pLYqL2hD4IXwyDcs0rHU4Ruoj5dBVl7c2ecuiOqrHcX9WVcSR8IKhys3yEnJ
	LhblrkramgaEzy2r2nWZwy7pD88cHwp2Dzn379Ah9QN45ZlZXCQIHXzDMus9rO15F/qJMVtYqNh
	9gpkfConcy1z/7U7B0CTBhUSWg==
X-Google-Smtp-Source: AGHT+IHIAU1bziAKxZvRP07ZCo+6IKM9hGRF5YvWCGZkvCvo55+fOBkWCNJRs18IttuXSjIV+ShShQ==
X-Received: by 2002:a05:6000:1865:b0:38f:4d20:4a0a with SMTP id ffacd0b85a97d-38f4d204b59mr531618f8f.28.1739784203790;
        Mon, 17 Feb 2025 01:23:23 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8273sm11466058f8f.89.2025.02.17.01.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:23:23 -0800 (PST)
Message-ID: <8ee69b17-e7ac-4f73-abbe-93f4e29fe51d@linaro.org>
Date: Mon, 17 Feb 2025 09:23:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
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
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
 <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
 <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
 <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/02/2025 1:14 am, Jie Gan wrote:
> 
> 
> On 2/14/2025 7:09 PM, James Clark wrote:
>>
>>
>> On 14/02/2025 1:34 am, Jie Gan wrote:
>>>
>>>
>>> On 2/14/2025 12:00 AM, James Clark wrote:
>>>>
>>>>
>>>> On 07/02/2025 6:42 am, Jie Gan wrote:
>>>>> Add 'struct coresight_path' to store the data that is needed by
>>>>> coresight_enable_path/coresight_disable_path. The structure will be
>>>>> transmitted to any required devices to enable related 
>>>>> funcationalities.
>>>>>
>>>>> The trace_id will be allocated after the path is built. Consequently,
>>>>> The ETM3x and ETM4x devices will directly read the trace_id from path
>>>>> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
>>>>> being deleted.
>>>>>
>>>>> Co-developed-by: James Clark <james.clark@linaro.org>
>>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>> ---
>>>>>   drivers/hwtracing/coresight/coresight-core.c  | 106 ++++++++++++ 
>>>>> +-----
>>>>>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>>>>>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
>>>>>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>>>>>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>>>>>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>>>>>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>>>>>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>>>>>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>>>>>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>>>>>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>>>>>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>>>>>   include/linux/coresight.h                     |  12 +-
>>>>>   13 files changed, 143 insertions(+), 157 deletions(-)
>>>>>
>>>> [...]
>>>>> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event 
>>>>> *event, void **pages,
>>>>>        * CPUs, we can handle it and fail the session.
>>>>>        */
>>>>>       for_each_cpu(cpu, mask) {
>>>>> -        struct list_head *path;
>>>>> +        struct coresight_path *path;
>>>>>           struct coresight_device *csdev;
>>>>>           csdev = per_cpu(csdev_src, cpu);
>>>>> @@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event 
>>>>> *event, void **pages,
>>>>>               cpumask_clear_cpu(cpu, mask);
>>>>>               continue;
>>>>>           }
>>>>> -
>>>>>           /* ensure we can allocate a trace ID for this CPU */
>>>>> -        trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink- 
>>>>> >perf_sink_id_map);
>>>>> -        if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>>>> +        trace_id = coresight_path_assign_trace_id(path, 
>>>>> CS_MODE_PERF);
>>>>> +
>>>>> +        /* Can be 0 and valid, ETE doesn't need an ID */
>>>>> +        if (trace_id < 0) {
>>>>
>>>> Not sure why I wrote it like this, but I think we should leave it as 
>>>> it was with !IS_VALID_CS_TRACE_ID(). Even with ETE it calls the 
>>>> trace ID allocator, so nothing has changed here.
>>>>
>>> Sure, Will restore. For ETE or ETM, we dont need traverse the path, 
>>> just directly allocate the trace id based on cpu id.
>>>
>>> Jie
>>>
>>>
>>
>> Sorry I meant to only keep the !IS_VALID_CS_TRACE_ID() bit. We still 
>> need to call the new coresight_path_assign_trace_id() otherwise it 
>> doesn't get assigned to the path. I saw that got removed in v11.
>>
>>
> Sorry for the misunderstanding, I was focused on "nothing has changed 
> here", lol.
> 
> I got your point here.
> So the updated codes should be:
> ...
>                  /* ensure we can allocate a trace ID for this CPU */
>                  trace_id = coresight_path_assign_trace_id(path, 
> CS_MODE_PERF);
>                  if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>                          cpumask_clear_cpu(cpu, mask);
>                          coresight_release_path(path);
>                          continue;
>                  }
> ...
> 
> 
> Thanks,
> Jie

Yes that looks good.


