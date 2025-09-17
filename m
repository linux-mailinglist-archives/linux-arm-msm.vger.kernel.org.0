Return-Path: <linux-arm-msm+bounces-73965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01633B807A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 17:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E6A94662EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F8C335922;
	Wed, 17 Sep 2025 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PGPmzEL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F382D8DA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122341; cv=none; b=sbE18HkM5zN0ICBCXBcQnSWNa/+XieK0OtFgMu9fNpNF58f2c1DDqShZSoYMNI/4AyRuGzhHzMGEfdK7w5thMuLEPs4mO7xx36Ur7xsibnP5J2FEAWpDPq9JPYU4upRU1KyjkJ/5I1/aEC2Qz8GXLnwTqF3vu2rT60+m7EJOh/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122341; c=relaxed/simple;
	bh=7jPZ96BclSCEIxwrjZ4n9aZB42Mvnx+aGDoeaEHGo3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLK+yTWr9+oXLAmhyrIbL+HuhgEEKhRijBDMmnVoLB1m2xIhTW9HxpuVK3GFDbiVldhAQmA1Vahu4NK2VqdpOIidts6I007Q7kqnjHmV1PliwQbMLK4Ve5i9tLhGii4KV0V29x7GUyvzr8U0qQVZwTzdQ8Gy3F0zoMQqjG5IUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PGPmzEL8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758122339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hy7kdzIRoahwzaXq+ZGvnPXEqK5VVBRIst3tKW3Ibxs=;
	b=PGPmzEL8GmIS/Jg5scx2316b0ygfk0fEjTwKxQvgyFZe5NW8Kd3GAh/8VIN6tXfTUzADjy
	XW852QzLj9a5LECgfnzshCnHoRGGpVdoN+UoCsRXUlCYfVFXLO8BsqousGm2BfeUGuBTxT
	HmpM11JhNgafIiLjJUeoMzduDUloQ7s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-7oZpNhg6Ooyx5TucDoxa2g-1; Wed, 17 Sep 2025 11:18:57 -0400
X-MC-Unique: 7oZpNhg6Ooyx5TucDoxa2g-1
X-Mimecast-MFC-AGG-ID: 7oZpNhg6Ooyx5TucDoxa2g_1758122336
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45deddf34b9so6077885e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 08:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122336; x=1758727136;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy7kdzIRoahwzaXq+ZGvnPXEqK5VVBRIst3tKW3Ibxs=;
        b=MY/i1+FwucipAmafjnd9X6Hx0JdPDAKtWmZpB4SXRM2pElQIebdCTBI1UY/qcKCULq
         CoHTo/AoOyEoV6eSZMOfWEhy8SPUxEwruyzBR+hlD19oak2Qz+hBLHh/ye7vIyBPmz1D
         Btgfva1YyCMT3//P3J82kj0kAJZf+JvWMyoMEHBJRa1bKK7P6vXZIPxO/upe9gn8N90r
         XzTmyk32t2saTWHP3aKFPNLtwNzFvPVcczUiY4ubNnwtNk6F/yjorTv6VkVr0sEaJiqx
         /XEy34o6vaVJbjT91VUNoBtPTgwhJluvysmmoSe7qpsL52IC3BlfquQWgGBSWRg1j0AQ
         7VEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCkq3++sxnQ8eWSt/vK7/Kke8uzgLgcnF8Vr3ZQ7Zx3wBk4lnVM7mTun+h3cnw3kr3X3YUpNJYr1TNrVKF@vger.kernel.org
X-Gm-Message-State: AOJu0YzfFUKHMCMyr1fta6TUjM9HrwwGznxLcRRMYGIcPamgRkjhBLos
	N69UQ3orS32JfPX14O4OSY54ism20dWwXMMerG8VDffzaHHF/RyxGep+zhmHfZagYG+/NOO5bhy
	phx1qGEVQOIqObs/g7Rgd1rnnbuZDXBgPz/zm/ITIThpZMxWgRwY61yoV8MwWYXaB49TDhG+AUw
	xRFw==
X-Gm-Gg: ASbGnct3ouRcN1HCH+zaBJqUKtLAScsfzVpjCXs7UTB8wD3kiNb/qqSZ8/fhK/0LTBp
	qJ+zZCPaYg/V9CNIjUNCL/F0Es7ZGIsTtZo6Hox4+2A5DZNDozz1oZ87z3PemC1wqDcZGGKRPj5
	7yN30m/AuO1X6RSnwH5LKXnU/DL94F5K5LhPgQdP7yrRIgcAYx8pprNql8Nwc+lB6ag5FCz+TpS
	YaAKpGdvrst9pVzcn9rjYjEQF/rvFnWhMDywnBJfOChuMrhNQA0k1OwopINGFZf8UnqfGFEqw5q
	aakW8/k/UFX9Ymq1Wy+RR1Ik/zXGXn6dFZKmpS9+EhCLviINqbJxiofPDdcekLSotmr1kmR6ce9
	Q3IRtgD4fDCNBMFniNpz9PfhGEynsIfWf/5peUmY++N3wZDbyM9ebbYZ0pJQXfyGB
X-Received: by 2002:a05:600c:c0c2:b0:45d:e201:1603 with SMTP id 5b1f17b1804b1-45ffbb87d0fmr44805895e9.15.1758122335844;
        Wed, 17 Sep 2025 08:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZJXZpzuRjgrByrwR+JkhhVX9lJLsNt0iPyJ6yeH+tCAOWNZvmbwXLVLzskDHw5XXeFtjkaQ==
X-Received: by 2002:a05:600c:c0c2:b0:45d:e201:1603 with SMTP id 5b1f17b1804b1-45ffbb87d0fmr44805575e9.15.1758122335350;
        Wed, 17 Sep 2025 08:18:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f3211e8c7sm40537455e9.3.2025.09.17.08.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:18:52 -0700 (PDT)
Message-ID: <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com>
Date: Wed, 17 Sep 2025 17:18:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Eugen Hristev <eugen.hristev@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.25 17:02, Eugen Hristev wrote:
> 
> 
> On 9/17/25 17:46, David Hildenbrand wrote:
>> On 17.09.25 16:10, Thomas Gleixner wrote:
>>> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>>>> On 17.09.25 07:43, Eugen Hristev wrote:
>>>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>>>> I pointed you to a solution for that and just because David does not
>>>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>>>> their carefully localized variables.
>>>>
>>>> It would have been great if we could have had that discussion in the
>>>> previous thread.
>>>
>>> Sorry. I was busy with other stuff and did not pay attention to that
>>> discussion.
>>
>> I understand, I'm busy with too much stuff such that sometimes it might
>> be good to interrupt me earlier: "David, nooo, you're all wrong"
>>
>>>
>>>> Some other subsystem wants to have access to this information. I agree
>>>> that exposing these variables as r/w globally is not ideal.
>>>
>>> It's a nono in this case. We had bugs (long ago) where people fiddled
>>> with this stuff (I assume accidentally for my mental sanity sake) and
>>> caused really nasty to debug issues. C is a horrible language to
>>> encapsulate stuff properly as we all know.
>>
>> Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs
>> and relies on sparse IIRC.
>>
>>>
>>>> I raised the alternative of exposing areas or other information through
>>>> simple helper functions that kmemdump can just use to compose whatever
>>>> it needs to compose.
>>>>
>>>> Do we really need that .section thingy?
>>>
>>> The section thing is simple and straight forward as it just puts the
>>> annotated stuff into the section along with size and id and I definitely
>>> find that more palatable, than sprinkling random functions all over the
>>> place to register stuff.
>>>
>>> Sure, you can achieve the same thing with an accessor function. In case
>>> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
>>
>> Right, the challenge really is that we want the memory range covered by
>> that address, otherwise it would be easy.
>>
>>> do not expose the information already for real functional reasons adding
>>> such helpers just for this coredump muck is really worse than having a
>>> clearly descriptive and obvious annotation which results in the section
>>> build.
>>
>> Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.
>>
>> Guess it would all feel less "kmemdump" specific if we would just have a
>> generic way to tag/describe certain physical memory areas and kmemdump
>> would simply make use of that.
> 
> The idea was to make "kmemdump" exactly this generic way to tag/describe
> the memory.

That's probably where I got lost, after reading the cover letter 
assuming that this is primarily to program kmemdump backends, which I 
understood to just special hw/firmware areas, whereby kinfo acts as a 
filter.

> If we would call it differently , simply dump , would it be better ?
> e.g. include linux/dump.h
> and then DUMP(var, size) ?
> 
> could we call it maybe MARK ? or TAG ?
> TAG_MEM(area, size)

I'm wondering whether there could be any other user for this kind of 
information.

Like R/O access in a debug kernel to these areas, exporting the 
ranges/names + easy read access to content through debugfs or something.

Guess that partially falls under the "dump" category.

Including that information in a vmcore info would probably allow to 
quickly extract some information even without the debug symbols around 
(I run into that every now and then).

> 
> this would go to a separate section called .tagged_memory.
> 

Maybe just "tagged_memory.h" or sth. like that? I'm bad at naming, so I 
would let others make better suggestions.

> Then anyone can walk through the section and collect the data.
> 
> I am just coming up with ideas here.
> Could it be even part of mm.h instead of having a new header perhaps ?
> Then we won't need to include one more.

I don't really have something against a new include, just not one that 
sounded like a very specific subsystem, not something more generic.

-- 
Cheers

David / dhildenb


