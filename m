Return-Path: <linux-arm-msm+bounces-65207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AABAB07376
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A41D81C250FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2561826D4F8;
	Wed, 16 Jul 2025 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TFGoDRvt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2F239E62
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661917; cv=none; b=OHQRjOkbG7iuZWcxyFZQCzHsjWZZnJv4M1SzJaOWrWXoM50dpqq1m3dzEShQFqX+Yg0v1kOu/+aoNX7ueeqvf/D5xQ3F5x4AAzQSFS02gbca96Z2E+kn4PWLarovm4BHOeIILo+itjy9BXLUUDGSGt0OUnHvhuCphHE00VPsHXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661917; c=relaxed/simple;
	bh=eBnSzR02347AsyHY/I4LTH37Yk72UR2g0xbu6MS2Bsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AiDqpZAyPEz2mdhZykbUVtZV2QjglzYYze4IJ66FYNDppb/vGsxfRT7wfG84572uzQtnFkNwWJ11g2xg4ATI10oSo/iSluJDNsaDIXXqpNyuS313GeWshai6tcRl/jkg9PwKfAv7NXkWueJ9rZzzBFY7abCZPDVpfoK3Y1fzyds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TFGoDRvt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752661914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QcznUuIcwG4nXt+4JQ0HOO8HtlWuNhZcwm0Vh8nXhEs=;
	b=TFGoDRvtwiqPEk+T0mxYBNpbswSD3IO016+7Y+0SgMCiB+CH28j9qacr5de02yFVQCTxB0
	yo4EB1+2uwELGyM5l4B1L1ZhO3oNferiPHXZzPudNPYP8No3qAqgFPBLF+8MEWDndJ2lT/
	yjvRJ1zYSHj4Fs6oeg5SkToLWd4nP80=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-0tdkKwL0NcyfdSfxyivMEw-1; Wed, 16 Jul 2025 06:31:53 -0400
X-MC-Unique: 0tdkKwL0NcyfdSfxyivMEw-1
X-Mimecast-MFC-AGG-ID: 0tdkKwL0NcyfdSfxyivMEw_1752661912
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso4869610f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661912; x=1753266712;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QcznUuIcwG4nXt+4JQ0HOO8HtlWuNhZcwm0Vh8nXhEs=;
        b=LERcQlUYBcs2OaS8UCreXmqhqr21RyCR5L/7jrxeFjXG5KpIqU459OHv9CG46ZYn97
         jHkjn8lsSZl1aNOJSrb7K7WU2DenScPqieVVl6CoZ9p9ZmjXkP48SNNZNgJ35RgjFKHy
         pUNfS7sspdsqgG6KV8yC44ncSa1v6Xc1CO3VT7lnyI4EFKv+tpbM6NuVXfjmudIQBqDp
         au4ptyrsZTzFn7lUJz1qv65GB5vgbMtzrHNylsnkamwBTORjlMzk1CJGOLZE+DcOTqls
         Uqu6O1SMD4luRMDyxB7+tGuOjXQAV7SD9giffSdlEVOth+ypfmiBWfQM9BWWbX34MRB2
         FPMg==
X-Forwarded-Encrypted: i=1; AJvYcCUcFPy2/A6KXE0y8U/8cuzFJ/DLb3IOTndrI3GTwE3ylmGlXkAOv2uz1gK7CINtuGRvverWjMkI9K9siyU4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gwykQHEgcXDxZEaMeEADgn1KEzaFeQqwnhboOK0yY+xna+u1
	HYLAM8p/DOBv/EcoiBIS9med4EazLFGyMJwUD7Dqy97qYVlXfpStxfdEJVzmTtkPprPjVE4skNw
	0vaBNdxvgkdftpLHxsWN59FO7dXDV2AAVxfHaY0xNvLUvM+GxHzvps1leSFvS8XZhu6o=
X-Gm-Gg: ASbGnctwEx4fM4Tef+hyIuVPnz2hsh7eygNjxxu4L5eIwkaCJJumQ+t1/LT9H9Sa6p2
	53lvE7DE2+YM9Ys3aWON+K1QY4OKCtJ7OaWfTq8OA/0zADGyg2fMXGOQUqrvyDU0H4Aq949U4bS
	zstbyCVRr/U041zSsT+4iBQeCnKKUWvQNrw4xc+uPJt67LAnjEPEBIk0Iv8e6ZVKSTOWFunvFA5
	JJOA/z+SPbAUcxKCklQ48Xx3XwooKl14sj43ly2Eo52lTVoEeUw37553CyzSNiau9C4pY5Zxsvt
	ykZyqIv6TG+9pQhjvlsjhTCDR2n+g1epYxdeD9NC4ooaVaTj9oSl15Awf4r+q7YyE6KaupGavZF
	2DSodD7GP7tqcxT5lba6UrAOsPT9yCb4KXrCdlW68JGS61CepVVA3Bf+RG9s/hTc86Cs=
X-Received: by 2002:a05:6000:2912:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3b60e51c9aemr1507080f8f.28.1752661911957;
        Wed, 16 Jul 2025 03:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAxmPe8HjCZESgVq6F2BLQDo/y7yx6bnhMQEihIPWcHJ07P96sJQUTqU+xqhcxeC2KowpvcQ==
X-Received: by 2002:a05:6000:2912:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3b60e51c9aemr1507056f8f.28.1752661911437;
        Wed, 16 Jul 2025 03:31:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:ed00:1769:dd7c:7208:eb33? (p200300d82f1ded001769dd7c7208eb33.dip0.t-ipconnect.de. [2003:d8:2f1d:ed00:1769:dd7c:7208:eb33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14d07sm17694498f8f.66.2025.07.16.03.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:31:50 -0700 (PDT)
Message-ID: <b7feea89-be2d-44a9-b116-fb07d16e3bd3@redhat.com>
Date: Wed, 16 Jul 2025 12:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/21] KVM: guest_memfd: Track guest_memfd mmap
 support in memslot
To: Fuad Tabba <tabba@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org,
 mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
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
References: <20250715093350.2584932-1-tabba@google.com>
 <20250715093350.2584932-10-tabba@google.com>
 <eb9d39b4-0de8-4abb-b0f7-7180dc1aaee5@intel.com>
 <CA+EHjTw8Pezyut+pjpRyT9R5ZWvjOZUes27SHJAEeygCOV_HQA@mail.gmail.com>
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
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAmgsLPQFCRvGjuMACgkQTd4Q
 9wD/g1o0bxAAqYC7gTyGj5rZwvy1VesF6YoQncH0yI79lvXUYOX+Nngko4v4dTlOQvrd/vhb
 02e9FtpA1CxgwdgIPFKIuXvdSyXAp0xXuIuRPQYbgNriQFkaBlHe9mSf8O09J3SCVa/5ezKM
 OLW/OONSV/Fr2VI1wxAYj3/Rb+U6rpzqIQ3Uh/5Rjmla6pTl7Z9/o1zKlVOX1SxVGSrlXhqt
 kwdbjdj/csSzoAbUF/duDuhyEl11/xStm/lBMzVuf3ZhV5SSgLAflLBo4l6mR5RolpPv5wad
 GpYS/hm7HsmEA0PBAPNb5DvZQ7vNaX23FlgylSXyv72UVsObHsu6pT4sfoxvJ5nJxvzGi69U
 s1uryvlAfS6E+D5ULrV35taTwSpcBAh0/RqRbV0mTc57vvAoXofBDcs3Z30IReFS34QSpjvl
 Hxbe7itHGuuhEVM1qmq2U72ezOQ7MzADbwCtn+yGeISQqeFn9QMAZVAkXsc9Wp0SW/WQKb76
 FkSRalBZcc2vXM0VqhFVzTb6iNqYXqVKyuPKwhBunhTt6XnIfhpRgqveCPNIasSX05VQR6/a
 OBHZX3seTikp7A1z9iZIsdtJxB88dGkpeMj6qJ5RLzUsPUVPodEcz1B5aTEbYK6428H8MeLq
 NFPwmknOlDzQNC6RND8Ez7YEhzqvw7263MojcmmPcLelYbfOwU0EVcufkQEQAOfX3n0g0fZz
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
 AP+DWgUCaCwtJQUJG8aPFAAKCRBN3hD3AP+DWlDnD/4k2TW+HyOOOePVm23F5HOhNNd7nNv3
 Vq2cLcW1DteHUdxMO0X+zqrKDHI5hgnE/E2QH9jyV8mB8l/ndElobciaJcbl1cM43vVzPIWn
 01vW62oxUNtEvzLLxGLPTrnMxWdZgxr7ACCWKUnMGE2E8eca0cT2pnIJoQRz242xqe/nYxBB
 /BAK+dsxHIfcQzl88G83oaO7vb7s/cWMYRKOg+WIgp0MJ8DO2IU5JmUtyJB+V3YzzM4cMic3
 bNn8nHjTWw/9+QQ5vg3TXHZ5XMu9mtfw2La3bHJ6AybL0DvEkdGxk6YHqJVEukciLMWDWqQQ
 RtbBhqcprgUxipNvdn9KwNpGciM+hNtM9kf9gt0fjv79l/FiSw6KbCPX9b636GzgNy0Ev2UV
 m00EtcpRXXMlEpbP4V947ufWVK2Mz7RFUfU4+ETDd1scMQDHzrXItryHLZWhopPI4Z+ps0rB
 CQHfSpl+wG4XbJJu1D8/Ww3FsO42TMFrNr2/cmqwuUZ0a0uxrpkNYrsGjkEu7a+9MheyTzcm
 vyU2knz5/stkTN2LKz5REqOe24oRnypjpAfaoxRYXs+F8wml519InWlwCra49IUSxD1hXPxO
 WBe5lqcozu9LpNDH/brVSzHCSb7vjNGvvSVESDuoiHK8gNlf0v+epy5WYd7CGAgODPvDShGN
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CA+EHjTw8Pezyut+pjpRyT9R5ZWvjOZUes27SHJAEeygCOV_HQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.07.25 10:21, Fuad Tabba wrote:
> Hi Xiaoyao,
> 
> On Wed, 16 Jul 2025 at 07:11, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>>
>> On 7/15/2025 5:33 PM, Fuad Tabba wrote:
>>> Add a new internal flag, KVM_MEMSLOT_GMEM_ONLY, to the top half of
>>> memslot->flags. This flag tracks when a guest_memfd-backed memory slot
>>> supports host userspace mmap operations. It's strictly for KVM's
>>> internal use.
>>
>> I would expect some clarification of why naming it with
>> KVM_MEMSLOT_GMEM_ONLY, not something like KVM_MEMSLOT_GMEM_MMAP_ENABLED
>>
>> There was a patch to check the userspace_addr of the memslot refers to
>> the same memory as guest memfd[1], but that patch was dropped. Without
>> the background that when guest memfd is mmapable, userspace doesn't need
>> to provide separate memory via userspace_addr, it's hard to understand
>> and accept the name of GMEM_ONLY.
> 
> The commit message could have clarified this a bit more. Regarding the
> rationale for the naming, there have been various threads and live
> discussions in the biweekly guest_memfd meeting . Instead of rehashing
> the discussion here, I can refer you to a couple [1, 2].

Maybe clarify here:

"Add a new internal flag, KVM_MEMSLOT_GMEM_ONLY, to the top half of
memslot->flags. This flag tracks when a guest_memfd-backed memory slot
supports host userspace mmap operations, which implies that all memory, 
not just private memory for CoCo VMs, is consumed through guest_memfd: 
"gmem only"

And add a pointer to the list discussion.

-- 
Cheers,

David / dhildenb


