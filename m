Return-Path: <linux-arm-msm+bounces-46491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E8A21B04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D4AF7A1F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 10:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0330019E96B;
	Wed, 29 Jan 2025 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdqfWA4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E6478F58
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738146945; cv=none; b=U9BgN+cwAiSBZVcHm8YFh+PrzoZ5mhXkfTnQ76yfm2PUo5m7s8680SBPj4VRqj/jVylQogobDC1Uayul/tNDVPqWRlrzm2ukQ4ja4eDz1vRD4muEHdF5vgZ71861LziU5Ez67m9M9UzQjFDH5fySpoxPu/RplMB1jF2BbjjHnNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738146945; c=relaxed/simple;
	bh=twmUkLBkPuToL8cbrBRV9sHLZQJyjXemmck/wmAoUrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8O9Cffadx76K/Y8lWccRRy/gFKBK2AW1JUiSkWmNGKw5MSh6ixOtVoH4DwSHE+del1HRrAG5iqK1PfizeN9D3Lx9IorEZKti7Jy+Rn3h8iMskh4rj4GO96iO41jPMQP15J9R+7RuzBq8QfFPaH+TfFTnBa20cl/wTSdFF9RDTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OdqfWA4T; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3855557f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738146942; x=1738751742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYPTNkU1oXcU63qUP69dE6PMjwC9Rly3gS0x3zHD7xU=;
        b=OdqfWA4TavlegS6mY9pnDcMFKR9TfECrVy1qNcKz+HKDRd8epdsqOTQp9j+7zoecqx
         lMQn+BKB1JwIdW5ctaK5JimZt799EbZ5Wmm/mnKqCYnY+lynFeHdi/eMf9/1vwGgq4lK
         29mySFoCTmM1bCX5q8Xj3fhAk2/dBjP3hqfl0Xe7sacjjGtesixpDsd6gYzJx++t3De2
         Rs2/4Qd8hyy2f0nCf8/CRU3hUIDFVIEgSPxVNrUV6gyE/VJWVKqA/4Iu1aCXiKU7hU1D
         Jlh1+50EX1j3GL3mfG4EwBBjn2kFBegc4VgyiR1ulNQXm7boxtNcRMES2WXOtB4dJWrr
         IMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738146942; x=1738751742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYPTNkU1oXcU63qUP69dE6PMjwC9Rly3gS0x3zHD7xU=;
        b=Dv5GkEViro2F9k7+Yd6upE/LZL6xqENQ11nyDmvJhlBI4BN7QsHv0yY7rwWJ0Ymls5
         s2IaMhktKMeo4xZjyId2ERayxDcdhiiq0ff7ilwPVcJvVlkBWgUi51wHJpBXS/KmPSPc
         4uZBtKohWHptbSbBDzobssg4xHYDP0SOptX4Kd6EpR0j7z9htKNkO1Va4gqbYuMLTaH1
         C1zG/t9b6E4z7AheAgbhtbCWH7BklZ/b7cYSmfvil+EaHRDGwNFNgkw6FIGQE+5d3gkE
         ba4k3IipGIlwEb81i3AiaSE+7vFpIzTbG/NBGrA7IUyRVnLdzUN2c1R9MHmUxGmDzrFI
         7u9g==
X-Forwarded-Encrypted: i=1; AJvYcCXZFZy5XoSHXF+Uh8x4NqfoI9en4ysu643SWkMb9J6+qkyS0K1o2hIczZ421255/u0t8sPg/t50tA5oygef@vger.kernel.org
X-Gm-Message-State: AOJu0Yy12lrO92UkYD3hhbUh0lvjYhq4PKqHb5/xc6NO+bafkH98M05/
	CFGnXkL5r4jcXEUv3mYj0k4ym2prbpuYI9ZBeoMWKanBQcOcdJa5b+MpX3ofULQ=
X-Gm-Gg: ASbGncs7IqImX9xZ33BboIOY1cewvFKy4fenWfutAJC/y5eU7K9q0esubSpy0NTGNl/
	psTUx7LMp3PY1fKdb+3ffAVh7igRNNhvjmqJSyZjLUFBdXoy1V8Kp4D0YR8iNv65DNtjpKWZmeR
	77K0Rp6qvQpSoCkyW2wtNnbR9Auie1y2zYIBRjuImrXcWbu4CYURvQn8DaK9OsHHj2FQQxdXQP+
	S4mvLppE/Ie/vIozeG8nzvfeg1047j27wSBc8wivzYnutp1tqlAunxJh9Jigy2zlxv9SVuniCyd
	s195+xA5aOPENBfQlvWQfnq7ug==
X-Google-Smtp-Source: AGHT+IEw8x4QitkXPvA/KMOW1uNnZVD9kQCqkDsmI+tFIUapbqvmdppAq+d0EJl8EjcOlLoePYWIWQ==
X-Received: by 2002:a05:6000:18a9:b0:38a:1b94:ecc1 with SMTP id ffacd0b85a97d-38c5195f9c8mr2292172f8f.25.1738146942076;
        Wed, 29 Jan 2025 02:35:42 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3558sm16493301f8f.84.2025.01.29.02.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 02:35:41 -0800 (PST)
Message-ID: <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
Date: Wed, 29 Jan 2025 10:35:40 +0000
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/01/2025 12:46 am, Jie Gan wrote:
> 
> 
> On 1/28/2025 7:55 PM, James Clark wrote:
>>
>>
>> On 24/01/2025 7:25 am, Jie Gan wrote:
>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>> registers
>>> which control various features related to TMC ETR sink.
>>>
>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>> register of a specific ETR, trace data with that trace ID gets into
>>> the ETR buffer, while other trace data gets dropped.
>>>
>>> Enabling source device sets one bit of the ATID register based on
>>> source device's trace ID.
>>> Disabling source device resets the bit according to the source
>>> device's trace ID.
>>>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>>>   include/linux/coresight.h                    |   3 +-
>>>   5 files changed, 321 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>  >
>>
>> [...]
>>
>>> +/*
>>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>>> + *
>>> + * Returns 0 indicates success. None-zero result means failure.
>>> + */
>>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, 
>>> struct coresight_path *cs_path,
>>> +                bool enable)
>>> +{
>>> +    struct coresight_device *sink = coresight_get_sink(cs_path->path);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    u8 trace_id = cs_path->trace_id;
>>> +    int port_num;
>>> +
>>> +    if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || 
>>> IS_ERR_OR_NULL(drvdata)) {
>>> +        dev_err(&csdev->dev, "Invalid parameters\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    port_num = ctcu_get_active_port(sink, csdev);
>>> +    if (port_num < 0)
>>> +        return -EINVAL;
>>> +
>>> +    /*
>>> +     * Skip the disable session if more than one TPDM device that
>>> +     * connected to the same TPDA device has been enabled.
>>> +     */
>>> +    if (enable)
>>> +        atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
>>> +    else {
>>> +        if (atomic_dec_return(&drvdata->traceid_refcnt[port_num] 
>>> [trace_id]) > 0) {
>>> +            dev_dbg(&csdev->dev, "Skip the disable session\n");
>>> +            return 0;
>>> +        }
>>> +    }
>>> +
>>> +    dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
>>> +
>>> +    return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);
>>
>> Hi Jie,
>>
>> Using atomic_dec_return() here doesn't prevent 
>> __ctcu_set_etr_traceid() from running concurrent enable and disables. 
>> Once you pass the atomic_dec_return() a second call to enable it will 
>> mess it up.
>>
>> I think you need a spinlock around the whole thing and then the 
>> refcounts don't need to be atomics.
>>
> Hi, James
> Thanks for comment. I may not fully tested my codes here. What I was 
> thinking is there's no way the refcnt could become a negative number 
> under current framework. So I just added spinlock in 
> __ctcu_set_etr_traceid() to ensure concurrent sessions correctly 
> manipulate the register.
> 
> As the trace_id related to the bit of the ATID register, I think the 
> concurrent processes are working fine with spinlock around read/write 
> register.
> 
> I may not fully got your point here. Please help me to correct it.
> 
> Thanks,
> Jie
> 
> 

No it can't become negative, but the refcount can be a different state 
to the one that was actually written:


   CPU0                             CPU1
   ----                             ----
   ctcu_set_etr_traceid(enable)
                                    ctcu_set_etr_traceid(disable)
   atomic_inc()
   recount == 1
                                    atomic_dec()
                                    recount == 0

                                    __ctcu_set_etr_traceid(disable)
                                    Lock and write disable state to
                                    device

   __ctcu_set_etr_traceid(enable)
   Lock and write enable state to
   device


As you can see this leaves the device in an enabled state but the 
refcount is 0.

This is also quite large if you use atomic types:

  /* refcnt for each traceid of each sink */
  atomic_t traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];

Presumably you can't have the refcount for each ID be higher than the 
max number of TPDMs connected? If you make the locked area a bit wider 
you don't need atomic types and also solve the above problem. So you 
could do u8, or DECLARE_BITMAP() and bitmap_read() etc to read 3 bit 
values. Or however wide it needs to be.


