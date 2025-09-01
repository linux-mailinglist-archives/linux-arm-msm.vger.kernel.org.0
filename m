Return-Path: <linux-arm-msm+bounces-71395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A508CB3E273
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 14:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C143A32FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 12:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D59F2517AC;
	Mon,  1 Sep 2025 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GKL3fhdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE90226D17
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729046; cv=none; b=JvVhS2/EiRrIA2d+CUkr5Pwo38Y/ZzjUwRG1mE7bEADr/C1h/2WP3DfDmwRt0MPRD1QfGtYLmVpDxPhohXFQHJC2rYWclN8jvTNKBFON+ROqlH0Nu3KtNmiZEXpWwP5Ru9EZUukgmOiUPCQZL80z5j0vk/Gmqf/ZdkndcLDyBKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729046; c=relaxed/simple;
	bh=k7M8OR4wKtmKuqQD3hylcZEN/8z56k7Zbk5QDUkg7u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqGE7K/NBoTH8j5qxo35Eozf+1COSxn7z/xDzc14a5PvdYdFhS76EcBB/zUD5mFW8hfEXS69werJojxk6m5e1kRB0q2ihKXWuXJJ0N4DFtGZw7ckdwGNNtaeqaLww49EOJxh1VScBDE8b/5LMmPsHPqe1V7/eyCIQU+rPLq+MpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GKL3fhdY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756729044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E7wsDKVeU07tqfba5mhUpd3DLLKgZKYNe/5Ehj98m6A=;
	b=GKL3fhdYoLdPaW9YLfWTX9pdyCmeuuAmXx4IPFamkJWD9goCpVwu6KkTDQY5XcxvaAvtlI
	X12XHEXU3uSWar6weRmd822HTl1xrSqca1C2lfqRTsqXl0acUyB/FJWvIF0Jck9tr9G+1r
	mhWsiHr4ETbXLoxmXmYJR0UdAcULoSI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-yRSOHbD9PlmzJbVgRl6HDQ-1; Mon, 01 Sep 2025 08:17:23 -0400
X-MC-Unique: yRSOHbD9PlmzJbVgRl6HDQ-1
X-Mimecast-MFC-AGG-ID: yRSOHbD9PlmzJbVgRl6HDQ_1756729042
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ccd58af2bbso1863838f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 05:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729042; x=1757333842;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7wsDKVeU07tqfba5mhUpd3DLLKgZKYNe/5Ehj98m6A=;
        b=wXuwIaMPxHuq0fea9NvLwdFlflEjKgMtFBUSHYRWwQtP350fngIWa4ZZj+puUrcbjS
         HXQGsTGyd0Sh+a541Huu4ngu/Fzl6BSSrjZd9JQypQm74UlFGKrvvIDodWEjFj4DsB+K
         zxjoRLyB/gZkWnOD2iBCYZoAuV+SthGJ+AEYFwa5PvWRnqwOmi/cUQoOB18KvU8QdZvP
         15oYPU76DhBphk/9G7yNW8QYOwEs7gOUnChciWx0DWvtloQFTpD+ZJQ9KtAsxWQFl8GG
         rG5YuzVO9rJTEonaj3BaSloLTf4z54t/wJuVUPkKUfvEvAbECKbIc8zSuwk2FOTSlp+g
         3VqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Hnw9+oLCAJvId5cJUxr2nVrlusYl+wwXqmTNGUZtj8Iw+6qEqL0w8FWBcLowZkrq1roWMwR55ZDI/8i0@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9s22JFCVFlhOD1/3huc+CNtu10TKvd5WkPPZ6fq3j7EtbhvE
	J5nT4Z3OfYMAb6ffGLYI2GiwKFJW3XGEsqjZC65j/buV2DDGw1t0Z0jiNiYGQFMxchi3a1v+4An
	ckCD53/SXfj1kF92hp6tYrTg9C3ssSnXbSidcxJThboZ5+AzfFe32uX3EoxEyJwMvMqA=
X-Gm-Gg: ASbGncuGkQs0W5pzH0WKNW2wU/LKuIazf8CjVsWmUWyZGzLb/DNp60Llf+s7LaZZcqk
	80nVOsX8neb1Hk1e/4CvingMAfpBRlsSSJZACFmACC2NlzDuMWuyEQhraIoK0FYTp4WUceJOJa3
	XWwG9ca95LH30gd97+s74lnfAJoaJdDACYME9/2gIEJnMyljvaVyi82783gMA7a1fUczGcos8cF
	RQ7ertPOlgD6PZQsIiisrYHKKihfWKDJs6Eico/mcXUGoXZOkqLXuhI+SdYNphu3dW7ozzFVDzk
	kOG32sFFVR9aUW+0hcohxc8M1BeNbZyPmg3wR0SjK3q0wevJRaAw/hT7MK9PjCpQuZpCTsTP/ks
	/JcCfiWSfnnqgcEEs1aktE5V8GSptsW+rRWnwwYCkeTM6DUWvT9Z2INHsnx0AUo6cc1k=
X-Received: by 2002:a05:6000:290e:b0:3c7:e6d0:b1b6 with SMTP id ffacd0b85a97d-3d1dcb77f57mr6172962f8f.9.1756729041578;
        Mon, 01 Sep 2025 05:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4HyO3MsW/7JB2c6b+uWwxyC9MpHi848L8uRbEPhjkFkXwnypkP58uX2s27AjDoWG3KsJ0dw==
X-Received: by 2002:a05:6000:290e:b0:3c7:e6d0:b1b6 with SMTP id ffacd0b85a97d-3d1dcb77f57mr6172942f8f.9.1756729041066;
        Mon, 01 Sep 2025 05:17:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d48760d1c9sm7371553f8f.17.2025.09.01.05.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:17:20 -0700 (PDT)
Message-ID: <cab1db60-e7bc-4f31-b781-c52ad1b24da6@redhat.com>
Date: Mon, 1 Sep 2025 14:17:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
 <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
 <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
 <64a93c4a-5619-4208-9e9f-83848206d42b@linaro.org>
 <f1f290fc-b2f0-483b-96d5-5995362e5a8b@redhat.com>
 <01c67173-818c-48cf-8515-060751074c37@linaro.org>
 <aab5e2af-04d6-485f-bf81-557583f2ae4b@redhat.com>
 <1b52419c-101b-487e-a961-97bd405c5c33@linaro.org>
 <99d2cc96-03ea-4026-883e-1ee083a96c39@redhat.com>
 <98afe1bd-99d2-4b5d-866a-e9541390fab4@linaro.org>
 <c59f2528-31b0-4b9d-8d20-f204a0600ff6@redhat.com>
 <40e802eb-3764-47af-8b4f-9f7c8b5b60c1@linaro.org>
 <7e1f4f64-dfc4-4366-8e01-0891b2d4d2b4@redhat.com>
 <94f537ae-c2b1-4928-a3f3-6449c30cb624@linaro.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <94f537ae-c2b1-4928-a3f3-6449c30cb624@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.09.25 14:02, Eugen Hristev wrote:
> 
> 
> On 9/1/25 13:01, David Hildenbrand wrote:
>>>>> What do you think ?
>>>>
>>>> Looks a bit over-engineered, and will require us to import a header
>>>> (likely kmemdump.h) in these files, which I don't really enjoy.
>>>>
>>>> I would start simple, without any such macro-magic. It's a very simple
>>>> function after all, and likely you won't end up having many of these?
>>>>
>>>
>>> Thanks David, I will do it as you suggested and see what comes out of it.
>>>
>>> I have one side question you might know much better to answer:
>>> As we have a start and a size for each region, this start is a virtual
>>> address. The firmware/coprocessor that reads the memory and dumps it,
>>> requires physical addresses.
>>
>> Right. I was asking myself the same question while reviewing: should we
>> directly export physical ranges here instead of virtual ones. I guess
>> virtual ones is ok.
> 
> In patch 22/29, some areas are registered using
> memblock_phys_alloc_try_nid() which allocates physical.
> In this case , phys_to_virt() didn't work for me, it was returning a
> wrong address. I used __va() and this worked. So there is a difference
> between them.

memblock_alloc_internal() calls memblock_alloc_range_nid() to then 
perform a phys_to_virt().

memblock_phys_alloc_try_nid() calls memblock_alloc_range_nid() without 
the phys_to_virt().

So it's rather surprising the a phys_to_virt() would not work in that case.

Maybe for these cases where you export the area through a new helper, 
you can just export the physical addr + length instead.

Then, it's also clear that this area is actually physically contiguous.

> 
>>
>> What do you suggest to use to retrieve that
>>> address ? virt_to_phys might be problematic, __pa or __pa_symbol? or
>>> better lm_alias ?
>>
>> All areas should either come from memblock or be global variables, right?
> 
> I would like to be able to register from anywhere. For example someone
> debugging their driver, to just register kmalloc'ed struct.
> Other use case is to register dma coherent CMA areas.

Then probably better to export physical addresses (that you need either 
way) directly from the helpers you have to add.

> 
>>
>> IIRC, virt_to_phys() should work for these. Did you run into any
>> problems with them or why do you think virt_to_phys could be problematic?
>>
> 
> I am pondering about whether it would work in all cases, considering
> it's source code comments that it shall not be used because it does not
> work for any address.

Yeah, it does for example not work for kernel stacks IIRC.

-- 
Cheers

David / dhildenb


