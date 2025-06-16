Return-Path: <linux-arm-msm+bounces-61452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8899ADB3AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F8A1726B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9899C1E3DD7;
	Mon, 16 Jun 2025 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SCs7+N+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B55265CC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083612; cv=none; b=o0ybIpr7U5tPjbjfIFbdZHCxeP02iu4iUUpgtu/ej6ZWKy7dxjbJZMlBBjc/Av9KtxopBbbgsACzeNO6UPbX24mi8SfPch+wwIxcyu4AoTJi2LDJ4e1aWSzo6SBhAOG1XGqeSZpLc4rtoUgSf249A2sAzDporFl+kX2agAWgM3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083612; c=relaxed/simple;
	bh=9LCvD/Ybo04nJpjZnfhMa4oJJsQuLeEGhzkb3RybMis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYefcF9P92eD+xWCvnBSyGU2FoPFQu2U6Ko0lB6oADWR/XiaAO1kefzYKYLahF1aQfFX71bPs1XQRt6jSt1fgnOFZkz+4K3wBXIlR2H8J9X8nmHL6qmvJzNa7BLlNvYTRk/+CiIbdnBd68bpSZUxhCj3weovreqsoHzQDomepRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SCs7+N+J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750083609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=56Tpqkk75kYKzuIVAtIE+REJgb5AnQU2Z8HbyKbkuTk=;
	b=SCs7+N+J16xAQQS48TMlfwZOowWoVeJP29Iqp6AAd2cybBFsV58kjl0C6kYBzcGEHEYRRl
	Bf7NqAVrFFfRRoaA+cvpTtE5fo1HRO/n4IMCQTav3DyGifsR4NwX4ldKq8F6FGC2SjA69X
	FoskU+6b7cY4MI+IUKCs+7ME/bGij6M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-lnKDzg0ZMWKcTk1DGqDUkA-1; Mon, 16 Jun 2025 10:20:05 -0400
X-MC-Unique: lnKDzg0ZMWKcTk1DGqDUkA-1
X-Mimecast-MFC-AGG-ID: lnKDzg0ZMWKcTk1DGqDUkA_1750083605
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a578958000so587189f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083605; x=1750688405;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=56Tpqkk75kYKzuIVAtIE+REJgb5AnQU2Z8HbyKbkuTk=;
        b=X+2W9/ep5sCol2bJaeUmyKFdpAWnlwq6q75MVodCFx4IzrSKKfmgmtMculsHD+QWd5
         FibSY5n9mvfrLe0wRXIOW1JU+9ZDYAew0ndJ6fJctzTdipSUzX+fCEko6RjFyZ0nG190
         X52jPZTFFBBq0y2huv5p4nyw8nNEwL92auOdlA26Ya7VIWC+N5aGLo5XOPRVYwaAjV6G
         ixpHePlLtb08inKInt7FDGx/z+yijuNF4fewrOJABWD5GIBEb4EANMRhzVSoHpOC6yBo
         fkuWYMQy1hWF6POJ1f//9XB2q+PiodYfYFPTkq6sfU/jZY2+OolWv34Ww22Tpl+F1pTw
         vvrg==
X-Forwarded-Encrypted: i=1; AJvYcCVj6C58rCkdTafPWMk2mVVHzSrjBIGprjti8AmcTeMP4yLmH2I8TqQQMbhawMwajK7+XweYJlC2tpQShttu@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhIzbzK2OV6+WxihyunK/jpw8prDmR35fEylI+KLvLJsmhrQJ
	zcAfQQkti3MONKbFYdTMDVT3YkjlSqdw0UwGv0g9fmN6/fI/5sLLqiw4VGoZA+AVnsVHvDBKJR7
	GlToS8jisEi+SrmZMDCIdVQqrx1BBdPnyE6yITpylNOsHwizm5YfnFMbpclr3lrC/TBc=
X-Gm-Gg: ASbGncuIAo2sbDri8LfsIbSjkRukSsYtrMCkUNZz75FxX0gkaW/aO7Oexx0LgjG8a5C
	pS97C/5lsShxskEjtp3tWXAV0HwmmMDTtYiMqvUmc7USDZ+RIAbpPf/ed15wy7yPkvGzFbuOk0I
	69yeaevRjnDrW28i0lj1WVkxuk4QyKFRjVdPKkYPaoYV4xkNN1D51DX1mYjPzpuPzq6XKa0gc1f
	RVGxtQlQKPx5gINaasesMPJmb/5F1lz8CrYfHyoALffFyTlJ7/bERpY3js315zfT9zEIsaa8WC4
	4UdakaeupXlkjqSrkHduPOaDQpI9VvLVNPG9/7esYRSRsgyRcsGrKY7Qn0Bf3PB1Ycge0Ra7Ce4
	lL7ND8RiJ75TxZkoYFYMKypgjnDSsF7uH3HL9Vau8n2fM72Q=
X-Received: by 2002:a05:6000:18ad:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3a572e8c038mr7550634f8f.39.1750083604789;
        Mon, 16 Jun 2025 07:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYosUfYZVFXTDxpCSyfqn16IAAlEa9Q8vWVbziIfVjbez9nDFIFDVNp+8lB3mlMWXzagX2LQ==
X-Received: by 2002:a05:6000:18ad:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3a572e8c038mr7550597f8f.39.1750083604274;
        Mon, 16 Jun 2025 07:20:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d2asm11139179f8f.9.2025.06.16.07.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:20:03 -0700 (PDT)
Message-ID: <a70e971e-046e-4766-ad52-483c533e4de6@redhat.com>
Date: Mon, 16 Jun 2025 16:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/18] KVM: x86: Rename kvm->arch.has_private_mem to
 kvm->arch.supports_gmem
To: Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org,
 mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk,
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
References: <20250611133330.1514028-1-tabba@google.com>
 <20250611133330.1514028-5-tabba@google.com> <aEyLlbyMmNEBCAVj@google.com>
 <CA+EHjTz=j==9evN7n1sGfTwxi5DKSr5k0yzXhDGzvwk7UawSGA@mail.gmail.com>
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
In-Reply-To: <CA+EHjTz=j==9evN7n1sGfTwxi5DKSr5k0yzXhDGzvwk7UawSGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>>> Rename it to supports_gmem to make its meaning clearer and to decouple memory
>>> being private from guest_memfd.
>>>
>>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>> Reviewed-by: Shivank Garg <shivankg@amd.com>
>>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>>> Co-developed-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>>   arch/x86/include/asm/kvm_host.h | 4 ++--
>>>   arch/x86/kvm/mmu/mmu.c          | 2 +-
>>>   arch/x86/kvm/svm/svm.c          | 4 ++--
>>>   arch/x86/kvm/x86.c              | 3 +--
>>>   4 files changed, 6 insertions(+), 7 deletions(-)
>>
>> This missed the usage in TDX (it's not a staleness problem, because this series
>> was based on 6.16-rc1, which has the relevant code).
>>
>> arch/x86/kvm/vmx/tdx.c: In function ‘tdx_vm_init’:
>> arch/x86/kvm/vmx/tdx.c:627:18: error: ‘struct kvm_arch’ has no member named ‘has_private_mem’
>>    627 |         kvm->arch.has_private_mem = true;
>>        |                  ^
>> make[5]: *** [scripts/Makefile.build:287: arch/x86/kvm/vmx/tdx.o] Error 1
> 
> I did test and run this before submitting the series. Building it on
> x86 with x86_64_defconfig and with allmodconfig pass (I obviously
> missed TDX though, apologies for that). I should have grepped for
> has_private_mem. That said, if I understood your suggestion correctly,
> this problem wouldn't happen again.

It's interesting that the build bots didn't catch that earlier.

-- 
Cheers,

David / dhildenb


