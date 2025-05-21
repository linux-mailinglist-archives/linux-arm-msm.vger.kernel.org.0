Return-Path: <linux-arm-msm+bounces-58856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE63ABED88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35073B1155
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3938123507F;
	Wed, 21 May 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsR2TTBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C39231A23
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814799; cv=none; b=EWbw/rjK7WiX9SIqM6He8e23tA+44M8QHx7Zn7e40iZnJmvh6qIvT9OEQUxVItJ2lXPFA9zeFayQbLTtfgRrOItBfLVZ7RZbvwKCjHR8H8uL4qqgttULG9Jj7069LoBPO81veclUocv7fYCxSo2P5kJyPhXzu604SoE13E/4RL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814799; c=relaxed/simple;
	bh=hu5J5+XNwkFM46bDV/QJbe0xO8P/PgzDuswn9qkh5Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2uMIlB98/qLSeU7hp9gCWjCinf32ts427CbqcOm3Y9y2gHRid0llStzcSEnVIeH4Ka67uJjXhL1nR8Qp1jT7uQRqW6V055tgBLeup+2L03SSOkJyaAS3ClVD6UZmri+PtfIp+ITCE4QhVbqC+BSh4Bo8Vp2FNVQYyPLFitE95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BsR2TTBF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747814796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Pl7X3KWgj8hu+DkvB4tuUaoMulhn6+3Nc2gMnNYzx+8=;
	b=BsR2TTBFUtE60nqsmQmiNTDTEx0FZgd0pimZZcV2ZSNZ50FJY0Kz19Dhp5romFvVqEKRbi
	uklg3chhpAFg4lzT66HvTbktqmRCY8leo7jYap64xJq3aIsAY0+4vvZ+WgYJzjsgBGT2Sh
	0oKtMm1MIYNusXWlW49tD6qhDe9tst4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-EDJ0acFUM3SnAN2uk9aZ6A-1; Wed, 21 May 2025 04:06:34 -0400
X-MC-Unique: EDJ0acFUM3SnAN2uk9aZ6A-1
X-Mimecast-MFC-AGG-ID: EDJ0acFUM3SnAN2uk9aZ6A_1747814793
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a360d01518so3916858f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 01:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814793; x=1748419593;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pl7X3KWgj8hu+DkvB4tuUaoMulhn6+3Nc2gMnNYzx+8=;
        b=bjN1aDqwt/liMoqOTXv3mlLVSiddh3MtnVkH+66gZFb5WImhhgV/lXHD1eIoCLy9AA
         27+pWYUzshnY4U+5HBfJqPDaZQNrS/GAutg6TzpyPg7UFMncOtwMmf7uvEUCEsxdgV9Y
         hWv2RpgcGSYF5WvI7IRfp/LbQAxlkYcyWHI+dZ65BtrGeI1mkdk053Q2ehrB7Grm2d7P
         qdZMaVuMH7+vuuxiCj0VrFto1axdFk7fXYVnI5Wi0G3ZGROkstsfMPyl/ZxHgymKXklK
         pxinjdj5+94v5jQRVrhnRDYrN4fGA5F1O2eO7reobN7msJuEBhEPe8ATOecNPpmwYJvj
         NAqw==
X-Forwarded-Encrypted: i=1; AJvYcCUo/w5Kp1Za/mPcb4Mzrme73W0myyooykuY4FyA2VJKu7YA9vONDU/mIIpTkdfbCbGSTEOhjlxAaEmy9uUa@vger.kernel.org
X-Gm-Message-State: AOJu0YytYmCOyGiJE7qpBlOFzwpF1YacIc7RzjcFzcvLjFv1MRXAahfh
	xngpL6KusNPbjoVVMtLYNgw54jutk4TltUdk04xxuO94FvGH0scT3D5MKY7c7tdsH+1F3Hf6X2z
	il7oXk3yiG4ZzCU7ayy62MTxPy3X/ZtXyNbqvSzXpGWuQ/+RWQisAfhMnuWNZTQM1IQ8=
X-Gm-Gg: ASbGncvWkh+fa3QCURy1r4xBuvgU9+Fra3tq3PdtzESpF1jTUsq3UHPptnGZTKLUWt7
	6gfImbKWYqIV8+rSweZ9TxkGFnr3+amRHTlDowbtTgUf0zwCWByuutTwU9gqLFLIcd0Pb2YG4D3
	rYV7CPImRYvhmpLOV7rXYUUT+T4Po3M0j1UugC9HEoc1pVh1RqNz1cX7wQvKH6mrZG1gkAceQHm
	6/uCT+xDTiURXgafKaqCO+cpX6AGs0zT6hF92QCHTI/RXQDMdJ0NvGvjTYWoSq426eoFMoYBizi
	xGgtPeIAJwxEhrlsTmJuk8vLT1L399wrq5K7Mpb0NkEoKGMG4Jln423jX8Uw+DNXrZQ7UM+9P1r
	D3zXxVcwQB4ExJu3nIXh0xRKJyKXEgjyg2F91aw4=
X-Received: by 2002:a05:6000:1862:b0:3a1:f69f:3341 with SMTP id ffacd0b85a97d-3a35fe929c0mr15864078f8f.26.1747814793146;
        Wed, 21 May 2025 01:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2+lWrYBGOo14ifcWRyyjzJy38hgRyoVZoquUV7/QFhSo5OfjVjWu5BI4SWaanzIFbUmG0cQ==
X-Received: by 2002:a05:6000:1862:b0:3a1:f69f:3341 with SMTP id ffacd0b85a97d-3a35fe929c0mr15863983f8f.26.1747814792589;
        Wed, 21 May 2025 01:06:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888afsm19250604f8f.64.2025.05.21.01.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:06:32 -0700 (PDT)
Message-ID: <338c5df3-c7c7-4b44-8e09-09ee77563ff2@redhat.com>
Date: Wed, 21 May 2025 10:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/17] KVM: Introduce the KVM capability
 KVM_CAP_GMEM_SHARED_MEM
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name,
 michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com,
 isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
 suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com,
 quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com,
 quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com,
 james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
 maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com,
 roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com,
 rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250513163438.3942405-1-tabba@google.com>
 <20250513163438.3942405-16-tabba@google.com>
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
In-Reply-To: <20250513163438.3942405-16-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 18:34, Fuad Tabba wrote:
> This patch introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> indicates that guest_memfd supports shared memory (when enabled by the
> flag). This support is limited to certain VM types, determined per
> architecture.
> 
> This patch also updates the KVM documentation with details on the new
> capability, flag, and other information about support for shared memory
> in guest_memfd.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
>   include/uapi/linux/kvm.h       |  1 +
>   virt/kvm/kvm_main.c            |  4 ++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 47c7c3f92314..86f74ce7f12a 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6390,6 +6390,24 @@ most one mapping per page, i.e. binding multiple memory regions to a single
>   guest_memfd range is not allowed (any number of memory regions can be bound to
>   a single guest_memfd file, but the bound ranges must not overlap).
>   
> +When the capability KVM_CAP_GMEM_SHARED_MEM is supported, the 'flags' field
> +supports GUEST_MEMFD_FLAG_SUPPORT_SHARED.  Setting this flag on guest_memfd
> +creation enables mmap() and faulting of guest_memfd memory to host userspace.
> +
> +When the KVM MMU performs a PFN lookup to service a guest fault and the backing
> +guest_memfd has the GUEST_MEMFD_FLAG_SUPPORT_SHARED set, then the fault will
> +always be consumed from guest_memfd, regardless of whether it is a shared or a
> +private fault.
> +
> +For these memslots, userspace_addr is checked to be the mmap()-ed view of the
> +same range specified using gmem.pgoff.  Other accesses by KVM, e.g., instruction
> +emulation, go via slot->userspace_addr.  The slot->userspace_addr field can be
> +set to 0 to skip this check, which indicates that KVM would not access memory
> +belonging to the slot via its userspace_addr.
> +
> +The use of GUEST_MEMFD_FLAG_SUPPORT_SHARED will not be allowed for CoCo VMs.
> +This is validated when the guest_memfd instance is bound to the VM.
> +
>   See KVM_SET_USER_MEMORY_REGION2 for additional details.

With Gavin's comment addressed

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


