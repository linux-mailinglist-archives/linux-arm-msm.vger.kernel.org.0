Return-Path: <linux-arm-msm+bounces-28839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14445955308
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 00:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB21C28752D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 22:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBDB143886;
	Fri, 16 Aug 2024 22:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tm9VE8JC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E620E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845842; cv=none; b=ePDl81YG5jHWDuKEnUKIwqT+lRiEKkKiq0D2yGrO3Ci83WcTnW30UTgThd9lQYpGkAlgFUQLwSj7FdgCA3E21ppWSBKXkX7BDt49L248NXN1Ai5OZD6LIe3kEq47WlW0/3JHQ8NWwcDG/jzeTj2pSgMCyLGEJARk0NppHkRt3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845842; c=relaxed/simple;
	bh=CewYrTktyUM5+5mZ28QHfLD+SOaP/VGiU11O4bmVnPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEW/4UBreqwJ2O/h1Wfl8ZkEGCZmPw8cPbAvZNB+Qvks9R165YXdfj+sg5RgvK5Z6PNdxc1wbSay48xoq0/ZM80FhkQkguR+PGd/5bw+rKPCBruYT9iD3UpzMPhIq4iQe5JDAU3VafV9NIU8wtWNodiQ2xd9WCDyRcjVDU84heE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tm9VE8JC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723845840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q7Xvo2vWD+Lj1EVUWijUZIuG5EpcSgeAEwyfeL5hqAw=;
	b=Tm9VE8JCqukVg71Rrq6AbRvpl8fnsRSnDDdkvDnFBE6EzXD5AKmlIBXtI0pLWJM0jv8Ym6
	G9vlMUFVzCNJSCkzaF0YsvMZ1mCVXjMJ/PsC7EC69HfqsK72uEDO8PdfwqRKn23veV1abg
	TPW+NgzOTc03eowMuuvQKiJ56UC945g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-J1kNo2XBNAm3Chg-20dg3g-1; Fri, 16 Aug 2024 18:03:54 -0400
X-MC-Unique: J1kNo2XBNAm3Chg-20dg3g-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-371a1391265so226155f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 15:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723845833; x=1724450633;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7Xvo2vWD+Lj1EVUWijUZIuG5EpcSgeAEwyfeL5hqAw=;
        b=VEt/pW6YXQtHrMmhKZdy/XRK6QA92T6SGGQ1z4urh0wKJMTagEjhQ62SSjyghUOmQb
         WyUBg+j238tgmbs5E3RJ7QSQThfcJAHHimR7xscMZ3LMrLFLBqoSBmW7twEjPCk1cPoV
         m/fXNCVbtVv/UHG+pCwAgHpueZ7cEDtZkuGu9VAQdE8KrhrFZhn4LzMvL54QIlcUS5Z9
         F1rdnwgEWldZMy8yvg7uooT4zH6fJ53ixfBO2LXVxWARRDUlNi0e8d7ETbU8AEK0R2Zj
         wJKaaWFgqyuh0wJA4w0ANfyZoh4KpM5C1f90+SwZWUxT/oe4XAe/A9+rLMV3sfjRPNyf
         cG+w==
X-Forwarded-Encrypted: i=1; AJvYcCUJv5yPa9Xq1pRy6Fi2+XSq/T1vvOn9bqX8Zav3psNi/zKmDWNNz7W9jBMU+0e3roYcyIuqLm5Ec35rkgHSNyNpbEjLfUeTyJjX1zTKdg==
X-Gm-Message-State: AOJu0YyRGgiMAVz1RkjfUbh4mN5ZplnnjramsxDXulp6y5zK6pw4TCzK
	74Q8zTBdO3iBLudOPOFllZcdncKdRq1grh0enXfvNU2tRCQoIs5gJQUV33KbyBYr1fjaII3VrAt
	MgHHpnZvG2V/ZvxWFUY4eOlGQylp/E89jOVBW4lymqSXkWJWXf3/lwN9F9fm0lq4=
X-Received: by 2002:a5d:548c:0:b0:367:8f89:f7c9 with SMTP id ffacd0b85a97d-37194c44d3cmr2292218f8f.33.1723845833202;
        Fri, 16 Aug 2024 15:03:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEolRGs9n/iRtaf573N7hnK3DLgNxrMqeQyFuWuSLSvoEY4vU6KPXdDnZqHg7BUsf8TtAPL8w==
X-Received: by 2002:a5d:548c:0:b0:367:8f89:f7c9 with SMTP id ffacd0b85a97d-37194c44d3cmr2292204f8f.33.1723845832626;
        Fri, 16 Aug 2024 15:03:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c721:b900:4f34:b2b7:739d:a650? (p200300cbc721b9004f34b2b7739da650.dip0.t-ipconnect.de. [2003:cb:c721:b900:4f34:b2b7:739d:a650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897419sm4447639f8f.82.2024.08.16.15.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 15:03:52 -0700 (PDT)
Message-ID: <93a010dd-d938-4c49-8643-047c7c1b33b9@redhat.com>
Date: Sat, 17 Aug 2024 00:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
To: Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Patrick Roy <roypat@amazon.co.uk>, qperret@google.com,
 linux-coco@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com>
 <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
 <CA+EHjTxNNinn7EzV_o1X1d0kwhEwrbj_O7H8WgDtEy2CwURZFQ@mail.gmail.com>
 <aa3b5be8-2c8a-4fe8-8676-a40a9886c715@redhat.com>
 <diqzjzggmkf7.fsf@ackerleytng-ctop.c.googlers.com>
 <94c5d735-821c-40ba-ae85-1881c6f4445d@redhat.com>
 <diqz4j7km8yu.fsf@ackerleytng-ctop.c.googlers.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <diqz4j7km8yu.fsf@ackerleytng-ctop.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.08.24 23:52, Ackerley Tng wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 16.08.24 19:45, Ackerley Tng wrote:
>>>
>>> <snip>
>>>
>>> IIUC folio_lock() isn't a prerequisite for taking a refcount on the
>>> folio.
>>
>> Right, to do folio_lock() you only have to guarantee that the folio
>> cannot get freed concurrently. So you piggyback on another reference
>> (you hold indirectly).
>>
>>>
>>> Even if we are able to figure out a "safe" refcount, and check that the
>>> current refcount == "safe" refcount before removing from direct map,
>>> what's stopping some other part of the kernel from taking a refcount
>>> just after the check happens and causing trouble with the folio's
>>> removal from direct map?
>>
>> Once the page was unmapped from user space, and there were no additional
>> references (e.g., GUP, whatever), any new references can only be
>> (should, unless BUG :) ) temporary speculative references that should
>> not try accessing page content, and that should back off if the folio is
>> not deemed interesting or cannot be locked. (e.g., page
>> migration/compaction/offlining).
> 
> I thought about it again - I think the vmsplice() cases are taken care
> of once we check that the folios are not mapped into userspace, since
> vmsplice() reads from a mapping.
> 
> splice() reads from the fd directly, but that's taken care since
> guest_memfd doesn't have a .splice_read() handler.
> 
> Reading /proc/pid/mem also requires the pages to first be mapped, IIUC,
> otherwise the pages won't show up, so checking that there are no more
> mappings to userspace takes care of this.

You have a misconception.

You can map pages to user space, GUP them, and then unmap them from user 
space. A GUP reference can outlive your user space mappings, easily.

So once there is a raised refcount, it could as well just be from 
vmsplice, or a pending reference from /proc/pid/mem, O_DIRECT, ...

> 
>>
>> Of course, there are some corner cases (kgdb, hibernation, /proc/kcore),
>> but most of these can be dealt with in one way or the other (make these
>> back off and not read/write page content, similar to how we handled it
>> for secretmem).
> 
> Does that really leave us with these corner cases? And so perhaps we
> could get away with just taking the folio_lock() to keep away the
> speculative references? So something like
> 
>    1. Check that the folio is not mapped and not pinned.

To do that, you have to lookup the folio first. That currently requires 
a refcount increment, even if only temporarily. Maybe we could avoid 
that, if we can guarantee that we are the only one modifying the 
pageache here, and we sync against that ourselves.

>    2. folio_lock() all the folios about to be removed from direct map
>    -- With the lock, all other accesses should be speculative --
>    3. Check that the refcount == "safe" refcount
>        3a. Unlock and return to userspace with -EAGAIN
>    4. Remove from direct map
>    5. folio_unlock() all those folios
> 
> Perhaps a very naive question: can the "safe" refcount be statically
> determined by walking through the code and counting where refcount is
> expected to be incremented?


Depends on how we design it. But if you hand out "safe" references to 
KVM etc, you'd have to track that -- and how often -- somehow. At which 
point we are at "increment/decrement" safe reference to track that for you.

-- 
Cheers,

David / dhildenb


