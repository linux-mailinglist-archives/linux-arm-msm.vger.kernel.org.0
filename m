Return-Path: <linux-arm-msm+bounces-56816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09EAA97F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 17:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85213A7788
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CBC25D91E;
	Mon,  5 May 2025 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xm40HrPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7E64204E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460284; cv=none; b=Ho7DSwNcCWItuCS3Hgqt3SkvnzG5+Avv5F/4XA/hlcusNMYCRdHPmArP+3KXbkIxJwXGKMSArkvufbuIRNw3nOW2WI2/ExFpV1Jm4zIsO/4mDxJo/nqOPheFmC3ohlCs6k6XczAMsN62nUlrl1nvueOFo0mUV1bAGM5sfCiFq+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460284; c=relaxed/simple;
	bh=ajZZgUulqRNQnYH/U78ZrIlZ6v46eCd19mKY/YFXRGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbcFeBXHlqWd1ceFD1MXJrVzHiSEQBP1gt+qIEjuMB5bAxgrUrkRzMlXrFZB/8lTFeDj+uIfNA6OwUvsW+GGmvzSczs7Xs6kFg0gdVaHn0+zTrbhsbB0lz+7TsZMaL5BMH4EVSE2l2LaD8mJQi0t1Ax3vfH5koy1tF6FeOQI5og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xm40HrPN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso9107004a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746460281; x=1747065081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+3PIdJC3Ht+VlEO5rW2bxgqfN/WfvLUVhrpIT2zCns=;
        b=Xm40HrPNoWR2GYOF4NuEWym4dNOWB2TjM/D8AT6ASyOI44YTSarEl8olVT6o5QrZVd
         AnCsg+K6dlG3QZSpA/E2BRWwd9aBF0UHXhpZKissscaSxTFJuzZPebABmyadpPzOFTkM
         sAGoW2dda6EejF5lCs5TzpKn5AOVc2zHHtCOAO6uXYvmIhwp4+gWSCbrQJheyLK8mpR0
         6FCGb+cV1LrKOkvdFKemuxXeGF40gXzh0IsgfwRRxPf/N849qR8q4Ndfg7suT8nATI3s
         bqXvF4OEdQPx0Z4ytinrX/6Wp+baxYswhMEsf0GVhPkByN4gp0gQHr++5sqNnQENULvh
         +MmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460281; x=1747065081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+3PIdJC3Ht+VlEO5rW2bxgqfN/WfvLUVhrpIT2zCns=;
        b=O5f/Ieeurv/M7y2onF2HKEBSnuyKdAip4BOHvCiGWfjNooiyrGHPsJ4OnBPCHGH8wf
         SZQfm2kfOdDvDkrURk3IUpL1J2Y4ECS2yVoUb02kJ9lg+meBgKiRA0s7ejbAqzi6mLw+
         7FoeevIG5dAIiE9Xim7bwiOYPGpnJUNKW41YK/su2OhLHLqzAFrF7Z+pMWI3kujFTXiR
         qmdWez+/FqHF0TtAxbBKG3gCGk7l/EbpfCLChuJqcVxqJWDwlDDX8Q6HQC67deWGJv11
         4L7gN/QA8tvlb4uwsvDcqOz5ls48zmjc4tUrV+yURu0KLu8nI7soFEnJ6k5AaO9HBEnx
         RNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfJY5RAcTW/ClJwl9hwEeWNnbzLzn8SKw9g9iYBOsUTVSVp8X7gkt9AMZ9RtOQpkZKbrxFbAnUKIiLdMmR@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHp1ligLes7xIy2GiqUAfPJrlTPQo0rufgsQ0MnbQBOL7yBZo
	CthT8gc6RV1gXVs+4u6kfAaSybxzQJBzO/2XkXqsk78D1x33ZXp5/PXw6Qb/eIA=
X-Gm-Gg: ASbGncu4FPaZd8wJwt7ooEtv/PCPJ5xCZOR/v1krHKreqlX3m7NcIiAS/rq70oAgrDs
	0gFpwmPjM0JRfA9M9XBVFCA6f2qve9jRlZ374Quu/IwpJ1ULKDhF3N3pfBVHfpeUblnL6Eon4s1
	8YHSLIyy2WhTpCfDAtQqR+HgNBm8cer1zZ5Hmz/SAxpuyp8zYrQ7LK0KnWBp6qBdiET5cotAS/T
	NioYnLHy848Qe02Ha4CoFxZsQZXOh9DldfiOjiltQeMNChxAK/KThgOqs53dZB0BxGlWyVbg5YY
	SvOlu93ONXAmLv9jI2nBPdoldsbOq+M1EDMgaK0TOFUbqYii
X-Google-Smtp-Source: AGHT+IFeHXSBcW5a6cMPyYFCWSmdfc0Kw0YJs6QfCUivNSYazQwUq3W3k9Emuwo7XD2iieH/6V66Yw==
X-Received: by 2002:a17:907:8dcb:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ad1a4a8d95cmr752485666b.37.1746460281158;
        Mon, 05 May 2025 08:51:21 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01c9sm516621766b.105.2025.05.05.08.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:51:20 -0700 (PDT)
Message-ID: <6ce50077-2c64-40b2-82b3-c63c16fa1898@linaro.org>
Date: Mon, 5 May 2025 18:51:19 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, senozhatsky@chromium.org, peterz@infradead.org,
 mojha@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 vincent.guittot@linaro.org, konradybcio@kernel.org,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
 <aBjYbXJL-GJe4Mh8@localhost.localdomain>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aBjYbXJL-GJe4Mh8@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Petr,

Thank you for your review.

On 5/5/25 18:25, Petr Mladek wrote:
> On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
>> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
>> to kmemdump.
>> This will allow kmemdump to be able to dump specific log buffer areas on
>> demand.
>>
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
>>  }
>>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
>>  
>> +void kmsg_kmemdump_register(void)
>> +{
>> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
>> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
>> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> 
> This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
> It should be enough to register the memory with the structure.

Yes, from my perspective this should be also enough. However, when
loading the generated core dump into crash tool , the tool first looks
for the prb pointer itself, and then stops if the pointer is not readable.
After the prb pointer is being found, the crash tool dereferences it ,
and looks at the indicated address for the actual memory.
That is why the pointer is also saved as a kmemdump region in my proof
of concept.

> 
>> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
>> +			  sizeof(_printk_rb_static_descs));
>> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
>> +			  sizeof(_printk_rb_static_infos));
> 
> Also this looks wrong. These are static buffers which are used during
> early boot. They might later be replaced by dynamically allocated
> buffers when a bigger buffer is requested by "log_buf_len" command
> line parameter.
> 

I will double check whether the crash tool looks for these symbols or
only the memory, and come back with an answer

> I think that we need to register the memory of the structure
> and 3 more buffers. See how the bigger buffer is allocated in
> setup_log_buf().
> 
> I would expect something like:
> 
> 	unsigned int descs_count;
> 	unsigned long data_size;
> 
> 	descs_count = 2 << prb->desc_ring.count_bits;
> 	data_size = 2 << prb->data_ring.size_bits;
> 
> 	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> 	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
> 			  descs_count * sizeof(struct prb_desc));
> 	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
> 			  descs_count * sizeof(struct printk_info));
> 	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);
> 
> 
Thank you. It may be that in my test case, the buffer was not
extended/reallocated with a bigger one.

> But I wonder if this is enough. The current crash dump code also needs
> to export the format of the used structures, see
> log_buf_vmcoreinfo_setup().

It appears that crash tool looks for the structures into vmlinux
symbols. It can be that this information is not available to some tools,
or vmlinux not available, in which case all the used structures format
and sizes need to be exported. But right now, the crash tool does not
work without vmlinux.

> 
> Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?

I believe CONFIG_KMEMDUMP_COREIMAGE should select CONFIG_VMCORE_INFO
indeed, which is not done in my patches. Or I have not fully understood
your question ?


Eugen
> 
>> +}
>> +EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
>> +
> 
> Best Regards,
> Petr


