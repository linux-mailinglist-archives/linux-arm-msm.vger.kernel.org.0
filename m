Return-Path: <linux-arm-msm+bounces-23189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22090E4B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 09:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF772867BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 07:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A787828B;
	Wed, 19 Jun 2024 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KZ7VcDnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0651E770F3
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718782691; cv=none; b=Qvflt3qDvxqJ+eiAU5EPyZDJtF/ayb8emECw1yWs5QpbFWduYeBJ3wdbRCVjsvu4qJX/fvpcwrLGF/TshZuQp6puv5d0ZIg+qN69bKi0y/pTa3URyiGoCgUXFcmUlg9d1Rapu7w8kYKWAUAGdjdBJPrcSikHPGsr31I3IbybvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718782691; c=relaxed/simple;
	bh=Ff+xMIF2uY5JqcEAkQzSzFQjYtWroOm7TN1nWNsU+uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYNKu7ddHmtMOOQ7Jfo39zS3TtLkOA3TEI2dRWj6AunWVVJ+nxBrzLSjc7alOgN2ZlmpWYFjYC3dJTACTZ8kJLRiLyhCjn2DztuKDLXwapYP4euPewx9C8shijp5dsOmzeiA0QrcBAHzP1zkKhxK/OPSDXSM0SufBIvZRwD1vQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZ7VcDnw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718782689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jhStDugsV4q67h2lYfMwzNRaGbGbhDFue/DjE59qJFs=;
	b=KZ7VcDnw74EqAmWItQAl4UDOpYaoWl3RmRqvVVShCEs0a8WdU3nqux0QQeBVl02CveFdXn
	3gC46uNVQh7r1/IQbeT6atGt9xGEx7GdAdop2la+5ZJC2rE3EiXWw49PL8TSejWfMQMvKk
	5LuX+i+35rwuaWAiGH6w1ng7B61CVJQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-J_ipiFFION6Mswn8zGUMpw-1; Wed, 19 Jun 2024 03:38:04 -0400
X-MC-Unique: J_ipiFFION6Mswn8zGUMpw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ec1cb56679so35165881fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 00:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718782683; x=1719387483;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jhStDugsV4q67h2lYfMwzNRaGbGbhDFue/DjE59qJFs=;
        b=vCErje2Qek81PbiHLKsUr+iNAeS05LRJXJRcAnmCVF5m9noBtXYehbjWabWkt2TtNy
         ++80dFfPlJh+uCuoO6bHzYH9iWoGF72pYk/yiK2me4SYrjgYbZWG4btGMhLjqyt+EC6H
         4+CoGcj99Hmitok3QrfJTVLM6/w6NFPtzVW4xLy/xgV3AkXXAsPdZf2einmD8JtzS91K
         +JIZwt0NmZ1+HhHmX005pSSGIHYGmiGCh/HcaZFAa/bBCJUZYdpVDKri4GWNIB5BxMiv
         V412ZCP/gECxcToGSlDNC3LuoVd+XXXf6TVWyzIR8igLQAHLEY+KBpDTXi1JW4FXNx7e
         mI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNlux65L0rSFrHoheaC6ZZx6eFh46grQwyRbMeZMXoSqnzB18RUwvCRWNNLlmgJTee87M+NJWKz31u/ApXPX8Y+STJiDUlkuZmkrFynw==
X-Gm-Message-State: AOJu0YwnHRwB2JDNajpwLobRexTJ+lmO7opql2bUXGC3+rcNj+26s4aJ
	NPIYhXOaBxFsaH2TanzC7qdZeXh/27s9CsiaQekDeNfUy7NE5bL3My5MWJDiiOiJDUcv+Awu7BS
	zhFW3PQX0z1LUwq56ANsI3yPpSj+l3AzsXgGJNPBPINdkrMKGukpOjUN0SbbtrLQ=
X-Received: by 2002:a2e:9f13:0:b0:2ec:3ce1:c14b with SMTP id 38308e7fff4ca-2ec3cec5423mr10333361fa.15.1718782683001;
        Wed, 19 Jun 2024 00:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmvJcnBcmX7H4ddI4fFNj3bQg/OQ5LPlItZP0PQ57He/gD4oeUIdUnzN5U/1w7wNdcQWRh8g==
X-Received: by 2002:a2e:9f13:0:b0:2ec:3ce1:c14b with SMTP id 38308e7fff4ca-2ec3cec5423mr10332671fa.15.1718782680619;
        Wed, 19 Jun 2024 00:38:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ab00:f9b6:da12:cad4:6642? (p200300cbc705ab00f9b6da12cad46642.dip0.t-ipconnect.de. [2003:cb:c705:ab00:f9b6:da12:cad4:6642])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320c2csm218097035e9.36.2024.06.19.00.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 00:38:00 -0700 (PDT)
Message-ID: <14bd145a-039f-4fb9-8598-384d6a051737@redhat.com>
Date: Wed, 19 Jun 2024 09:37:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
To: John Hubbard <jhubbard@nvidia.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, maz@kernel.org
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pbonzini@redhat.com, Fuad Tabba <tabba@google.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20240618-exclusive-gup-v1-0-30472a19c5d1@quicinc.com>
 <7fb8cc2c-916a-43e1-9edf-23ed35e42f51@nvidia.com>
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
In-Reply-To: <7fb8cc2c-916a-43e1-9edf-23ed35e42f51@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19.06.24 04:44, John Hubbard wrote:
> On 6/18/24 5:05 PM, Elliot Berman wrote:
>> In arm64 pKVM and QuIC's Gunyah protected VM model, we want to support
>> grabbing shmem user pages instead of using KVM's guestmemfd. These
>> hypervisors provide a different isolation model than the CoCo
>> implementations from x86. KVM's guest_memfd is focused on providing
>> memory that is more isolated than AVF requires. Some specific examples
>> include ability to pre-load data onto guest-private pages, dynamically
>> sharing/isolating guest pages without copy, and (future) migrating
>> guest-private pages.  In sum of those differences after a discussion in
>> [1] and at PUCK, we want to try to stick with existing shmem and extend
>> GUP to support the isolation needs for arm64 pKVM and Gunyah.

The main question really is, into which direction we want and can 
develop guest_memfd. At this point (after talking to Jason at LSF/MM), I 
wonder if guest_memfd should be our new target for guest memory, both 
shared and private. There are a bunch of issues to be sorted out though ...

As there is interest from Red Hat into supporting hugetlb-style huge 
pages in confidential VMs for real-time workloads, and wasting memory is 
not really desired, I'm going to think some more about some of the 
challenges (shared+private in guest_memfd, mmap support, migration of 
!shared folios, hugetlb-like support, in-place shared<->private 
conversion, interaction with page pinning). Tricky.

Ideally, we'd have one way to back guest memory for confidential VMs in 
the future.


Can you comment on the bigger design goal here? In particular:

1) Who would get the exclusive PIN and for which reason? When would we
    pin, when would we unpin?

2) What would happen if there is already another PIN? Can we deal with
    speculative short-term PINs from GUP-fast that could introduce
    errors?

3) How can we be sure we don't need other long-term pins (IOMMUs?) in
    the future?

4) Why are GUP pins special? How one would deal with other folio
    references (e.g., simply mmap the shmem file into a different
    process).

5) Why you have to bother about anonymous pages at all (skimming over s
    some patches), when you really want to handle shmem differently only?

>> To that
>> end, we introduce the concept of "exclusive GUP pinning", which enforces
>> that only one pin of any kind is allowed when using the FOLL_EXCLUSIVE
>> flag is set. This behavior doesn't affect FOLL_GET or any other folio
>> refcount operations that don't go through the FOLL_PIN path.

So, FOLL_EXCLUSIVE would fail if there already is a PIN, but 
!FOLL_EXCLUSIVE would succeed even if there is a single PIN via 
FOLL_EXCLUSIVE? Or would the single FOLL_EXCLUSIVE pin make other pins 
that don't have FOLL_EXCLUSIVE set fail as well?

>>
>> [1]: https://lore.kernel.org/all/20240319143119.GA2736@willie-the-truck/
>>
> 
> Hi!
> 
> Looking through this, I feel that some intangible threshold of "this is
> too much overloading of page->_refcount" has been crossed. This is a very
> specific feature, and it is using approximately one more bit than is
> really actually "available"...

Agreed.

> 
> If we need a bit in struct page/folio, is this really the only way? Willy
> is working towards getting us an entirely separate folio->pincount, I
> suppose that might take too long? Or not?

Before talking about how to implement it, I think we first have to learn 
whether that approach is what we want at all, and how it fits into the 
bigger picture of that use case.

> 
> This feels like force-fitting a very specific feature (KVM/CoCo handling
> of shmem pages) into a more general mechanism that is running low on
> bits (gup/pup).

Agreed.

> 
> Maybe a good topic for LPC!

The KVM track has plenty of guest_memfd topics, might be a good fit 
there. (or in the MM track, of course)

-- 
Cheers,

David / dhildenb


