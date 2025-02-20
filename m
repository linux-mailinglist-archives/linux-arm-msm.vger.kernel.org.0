Return-Path: <linux-arm-msm+bounces-48680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05447A3D917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52F5169BA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FEE1F3BBC;
	Thu, 20 Feb 2025 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpAKZ+8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C791F30DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051859; cv=none; b=OlNzsaWFBWYjmd6Zd1JzpFyFw6M4mUd+hSQ68APo8vaN8kTb4v4Iok6L70THVFFMUjoRPvG+gsHcmRVr1k7bmJutJrQcGEEyyEc1ZNws5E7Knd3GQlDAzgKq+CL3gmJ4Fc61ElgAO4cTZWLoTZcbcwRM/m4w/qyxQLDYjuEoBQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051859; c=relaxed/simple;
	bh=uaO2AJUHR02xtqcBptjUSgGmIgVJNFlJZjknyxiwn68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XE95sSqClGDzFqSq5S2DAbmDCkir6uv1TerBgn0XuXWa3nwkvOEWBkTg3/M+14iD+KWYpAtxhiZQH5vdbKs/7dDEhpPh/xBUZj7m84Yb0HeHuApAAzgMohwcecTC4fOA/9ty7Pv3FdQWWRYHSZcxYlUXwlaDdR7yYv3GGIzlk5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpAKZ+8t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740051857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FCkKM1TuO86vpYYGvrN/tVQJl+mSKqFXckDeqQB9AXA=;
	b=MpAKZ+8tc/IDvmHPBwXFYvZ/ykJ94aJUBfI5YC3Bx7qz/SVO6CxQip8VHG18XCWIXO0DKB
	cIP9Z4xIhaYkICA2vsks/F/vKTU9W8eNuFaqchAUhWLl7m3hoxi3TKspoql/G1GX2aNbh1
	655JECACWZYI71X1WPiotHpbgdauOj4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-OdZIOevmPSqkQUucdJ-_0Q-1; Thu, 20 Feb 2025 06:44:15 -0500
X-MC-Unique: OdZIOevmPSqkQUucdJ-_0Q-1
X-Mimecast-MFC-AGG-ID: OdZIOevmPSqkQUucdJ-_0Q_1740051855
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393ed818ccso5352795e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 03:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740051854; x=1740656654;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FCkKM1TuO86vpYYGvrN/tVQJl+mSKqFXckDeqQB9AXA=;
        b=RHYq0Lg9wBpD6JlrXsbQZwhHzps4q5pviY7idYBno1u9Lei50hRSZ43uX0S0n2aGhT
         k1rMWGOYCdmKCVjf6VwY8kPfkye4ni5RdCWnTsOmiXjt/H0sKefXr3qk7i/UP5qdfhzT
         viBRQhF+25zQdd/wBX6DGBE6Ra3Np6s6v3kELVcoNZU/Aii9rlr0queH9oThZA/r3sWS
         pYSDXWcfTuXSc/rPXax4zGn1iFS8qLVqIB96222gdV0eWzvBOWBTgZu5UcXhuhTMbEf5
         AVwx0DSJiS5ioXJF7WArJfwm0+lpHhidQ1gcVrqS2FDp+PRLkmqYJo1thK0o+fMJ77ZA
         DPlg==
X-Forwarded-Encrypted: i=1; AJvYcCWxCKYy3VMb7+qzQ06N5s3NVbuA9whZ4GWajGBOmBr8mOYETsgmyIA3X7r0ZGWhzdz+dmyJc/pQ3c4iF40A@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTjvyhAp2HB/6xpIF/EXzF+CSYVC7u/5v7FFrHWbix7Pm8yGJ
	4PKIza83fFub9dSXEi8vSnhDNupka+nf1DZs5WLUeEWYsDYYRCXrK8Qp7HkxpBS0RXQkyiP0z9M
	vFx2bpAnJpMRUFs5Q+gDI/dHzzTms1Wyzzh4keFwShVFhxZpj8f1B4q3VE+m3V5w=
X-Gm-Gg: ASbGncsfGsGvu4eNWlXmsvXdOcZrYsKijlCHoe9V+S8dHL1PDfB77oHZMFNaV0IFU+I
	CTVgi21enbbJCN5iTdPVMfyQvys/2w0hxbEBqnSUa2g9UUFM3ETiNhvIG7t6q9hjQ4mKMKkgr16
	wJt047Yb314ADaaIg2MdTRNMoWyYRJOnxG4U1CHR+t55vaawBRJpxhazGPzDqAHpSgibTgexFIC
	e8vrsJ/BSOtvncHpUuw/olxZELekJQ7fZRy5GI6J3jNafj4cJtuxhm0lvSL1htZu9oTl3xSDGUW
	OFylSH0KiX9uzQBv8BGWy4jtv6EbusGwgfRKTt0Y8qtVC+r3ykH0IfZDVEqTzWR9Nf2DOGbcZDr
	STGJN4+hnW3Yd3L9x7zUVxn+ULyz0rg==
X-Received: by 2002:a05:600c:4751:b0:439:5541:53cc with SMTP id 5b1f17b1804b1-43999ddbbb3mr80109445e9.29.1740051854467;
        Thu, 20 Feb 2025 03:44:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgCXtiragIkQL9YBDJ5bY4gbia3/XnmDL1zfhGb6rwqUir2PpJ+YG9Ot1+vPBT7h8tZuS4ow==
X-Received: by 2002:a05:600c:4751:b0:439:5541:53cc with SMTP id 5b1f17b1804b1-43999ddbbb3mr80108745e9.29.1740051854101;
        Thu, 20 Feb 2025 03:44:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:2000:e44c:bc46:d8d3:be5? (p200300cbc7062000e44cbc46d8d30be5.dip0.t-ipconnect.de. [2003:cb:c706:2000:e44c:bc46:d8d3:be5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398ad9e1d7sm99352515e9.19.2025.02.20.03.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 03:44:12 -0800 (PST)
Message-ID: <3926d881-5473-4f5a-8b65-aff4da7a0fcf@redhat.com>
Date: Thu, 20 Feb 2025 12:44:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net,
 vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
 mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-3-tabba@google.com>
 <8ddab670-8416-47f2-a5a6-94fb3444f328@redhat.com>
 <CA+EHjTzPoeW2NWDYqJNUD6uLBqEMkRLWVODK0Ko+K5nS05Z47A@mail.gmail.com>
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
In-Reply-To: <CA+EHjTzPoeW2NWDYqJNUD6uLBqEMkRLWVODK0Ko+K5nS05Z47A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>    static const char *page_type_name(unsigned int page_type)
>>> diff --git a/mm/swap.c b/mm/swap.c
>>> index 47bc1bb919cc..241880a46358 100644
>>> --- a/mm/swap.c
>>> +++ b/mm/swap.c
>>> @@ -38,6 +38,10 @@
>>>    #include <linux/local_lock.h>
>>>    #include <linux/buffer_head.h>
>>>
>>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>>> +#include <linux/kvm_host.h>
>>> +#endif
>>> +
>>>    #include "internal.h"
>>>
>>>    #define CREATE_TRACE_POINTS
>>> @@ -101,6 +105,11 @@ static void free_typed_folio(struct folio *folio)
>>>        case PGTY_hugetlb:
>>>                free_huge_folio(folio);
>>>                return;
>>> +#endif
>>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>>> +     case PGTY_guestmem:
>>> +             kvm_gmem_handle_folio_put(folio);
>>> +             return;
>>
>> Hm, if KVM is built as a module, will that work? Or would we need the
>> core-mm guest_memfd shim that would always be compiled into the core and
>> decouple KVM from guest_memfd ("library")?
> 
> I'd assumed that it would work, since the module would have been
> loaded before this could trigger, but I guess I was wrong.
> 
> Can you point me to an example of a similar shim in the core code, for
> me to add on the respin?

As part of this series, you could make the function with the WARN an 
inline function, and tackle the shim separately, once that function 
actually has to do something.

-- 
Cheers,

David / dhildenb


