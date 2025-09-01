Return-Path: <linux-arm-msm+bounces-71393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21FB3E224
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 14:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0E457A22F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B033257453;
	Mon,  1 Sep 2025 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvMiE8Nt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6486724336D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728173; cv=none; b=DMR6N6vaZx1/3OrDkCG8LaF+xL1l5+glWihkSyh7jZPetG8DfPZzLASp/NYanbYcQWBg3/AUo6AvOLKFH1M06Jgo1OvZheKDF1B0/4zD/ke1QDihgXex+6wVDuZgUGHXdhi0ZCMjtD3U7AWx5R2NawdW+IXm6QbX1M0QTO3kARw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728173; c=relaxed/simple;
	bh=8cO1XIiop7tlwEYA72YK/zDG0yqN75FP63jpCU3Sb3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wn2Bgo0uqhjQuRlfM3p0EqOGVVZ1V65CwGqZxh4kYiXlMfgSawxBPQAFt6GkU3psqjsj5XB8OixMRpVRpCaqykMXBN3RnkefpwQS4Z1bEJCqGjgVs+WEW0l0BzuYZgroOIb69SdzL2Q3kyKQKhRwz2z6snSsa65uUgkCYFrzewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvMiE8Nt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3cdfb1ff7aeso2106450f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756728170; x=1757332970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnfmWiYHUC8i19glkM7oL/LSJL9iA4N5hQ/wPd1r+F0=;
        b=XvMiE8NtCm26jovAFPIJKndkpRI67zXpt39QogtmkP3kmj1nRyNDlzhgGzBP/8X3Il
         28YcVzX86ZzY8V/odgnYo4zTVg6/3RNCz7Rj3Versuz+AihAa9lhw8cj0snNT4RqVFrN
         HSCKz0FTng5UDyYYu3CWGjZ2EoD29Ul5rdMNE3iKhIWxRTntdfla5SBszpuYCXmzBAWv
         g1cpKoyIOAbenxvAjmcWZoiBHNcIJUrLCMW+c4DwJYoo8Wm0sIF6SKUeMd5xV+zIn1tI
         kUQT7l762EdGTQ/prYDXbgQuf1j4QEz4iRAj28FHIzIHX68O0H6cvAfdmxH9YYMWu6ts
         Cx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756728170; x=1757332970;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnfmWiYHUC8i19glkM7oL/LSJL9iA4N5hQ/wPd1r+F0=;
        b=bkQOlbmBRWmE++R9KDOzR/S8QrjeRK5KX8MOXq0BF6RjjutuAvTBWFrH9yLzH35nwx
         hilMwmz3sDwB6ffSlF6P9bFGcFivHSuZkmRz5IS5/v3t2AHyly2W9z42Qns13G5ylJRe
         sNEnGIbiX6TMNvYQAFQcTW5S3yciF8kJnMHJwQ3SgelrYt14zv03wvzIxAr4uRBOqYFt
         5PLXR3iy3kHw3GzIKqkBKVGGKPSe/bnaZgafDM+PHc/pJ/pHEgGOu0rK45HNjyosc8Ld
         7jk992Eze6qSf8A8KGWqmC59276FNBk5qql7k65xloo5D31Pmd7FjXyvAdPWsKnpRo1T
         NU/w==
X-Forwarded-Encrypted: i=1; AJvYcCX6TDhJdoR6WqhB6Ai1Ay9cXHizweZWHnywMZm8jxTYPThrCDFZiAplb/GiE1c36jvrKC6k3Hxttf+tjnjL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0WCbUx3svMKWSM+k9GrOtERBNiHyBBw/J4N5X3XdYwWGSfkRj
	TzbV82txIivXt7fae0dnZ0aQPZ27iuOZfy6/NSZYFSkClMta9Fr1cYrfWJK2l53Qh0Q=
X-Gm-Gg: ASbGncvNYXR5rpUDUW2PqMw4YMouPHeWrWUPPWceMFvsIWVuKKtj/8m1kuyDMk5PXwW
	LcCCJqtdpyF88QjqLlV64cK/zcLCJNKeRdDs0CzUcgykuf6JxCatsercK7qYgw/1fvA3LeQcDxH
	NNLLOAfRA3lm1NdDYaHbi+TTa9NhahObf1gfVsm9RgBWzgq72lJwbI2dCKUpTMVsZ3sPHWRbKV4
	qT+/Jq8L+OuwJvOT4+ZmS/JXtRUdYkCtdqaUU1EzVRnSArIcyId3h8EWWQzlhpX66+YDxmhZL2Z
	moGiIp5tLvDnsBjel58cP9WFDSVjP61bMvZ5s1iQcYxjW9tTOoIkdv9clCWuaape0h2VcM3i/96
	B79mzVk7lIAfclRc7GAfkHpCfXiZsg9eqBEty8jgcpmUuPNB1pAsSSM0/3s29rkzm0Gu4zBDhue
	CDd1E=
X-Google-Smtp-Source: AGHT+IGtFYqe1NkisHt6TuhFoDyL75/fnRaNQlYXgCsJGFwGxCneAkzy9wIFe6z6w5vZIfrX/R2fCA==
X-Received: by 2002:a5d:5f90:0:b0:3d9:2fa8:1009 with SMTP id ffacd0b85a97d-3d92fa81454mr79263f8f.45.1756728169537;
        Mon, 01 Sep 2025 05:02:49 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:335e:2208:72de:40f7:b7be:9bb7? ([2a0d:3344:335e:2208:72de:40f7:b7be:9bb7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e88785bsm154333855e9.14.2025.09.01.05.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:02:48 -0700 (PDT)
Message-ID: <94f537ae-c2b1-4928-a3f3-6449c30cb624@linaro.org>
Date: Mon, 1 Sep 2025 15:02:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
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
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <7e1f4f64-dfc4-4366-8e01-0891b2d4d2b4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/25 13:01, David Hildenbrand wrote:
>>>> What do you think ?
>>>
>>> Looks a bit over-engineered, and will require us to import a header
>>> (likely kmemdump.h) in these files, which I don't really enjoy.
>>>
>>> I would start simple, without any such macro-magic. It's a very simple
>>> function after all, and likely you won't end up having many of these?
>>>
>>
>> Thanks David, I will do it as you suggested and see what comes out of it.
>>
>> I have one side question you might know much better to answer:
>> As we have a start and a size for each region, this start is a virtual
>> address. The firmware/coprocessor that reads the memory and dumps it,
>> requires physical addresses.
> 
> Right. I was asking myself the same question while reviewing: should we 
> directly export physical ranges here instead of virtual ones. I guess 
> virtual ones is ok.

In patch 22/29, some areas are registered using
memblock_phys_alloc_try_nid() which allocates physical.
In this case , phys_to_virt() didn't work for me, it was returning a
wrong address. I used __va() and this worked. So there is a difference
between them.

> 
> What do you suggest to use to retrieve that
>> address ? virt_to_phys might be problematic, __pa or __pa_symbol? or
>> better lm_alias ?
> 
> All areas should either come from memblock or be global variables, right?

I would like to be able to register from anywhere. For example someone
debugging their driver, to just register kmalloc'ed struct.
Other use case is to register dma coherent CMA areas.

> 
> IIRC, virt_to_phys() should work for these. Did you run into any 
> problems with them or why do you think virt_to_phys could be problematic?
> 

I am pondering about whether it would work in all cases, considering
it's source code comments that it shall not be used because it does not
work for any address.

Someone also reported its unavailability like this:
drivers/debug/kmemdump_coreimage.c:67:24: error: call to undeclared
function 'virt_to_phys'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]

I am yet to figure out which config fails.


