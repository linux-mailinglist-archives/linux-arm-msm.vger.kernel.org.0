Return-Path: <linux-arm-msm+bounces-59017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EBEAC06C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 884798C83C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 08:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453A5262813;
	Thu, 22 May 2025 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAk89KCg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D229263F27
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901706; cv=none; b=IJthdHMEOwKbI3M83EP8Eqy+dFj7qM4fDkxRcTlSRKUaMz/pv9yRg/W8ftTZovy9DvN+Ke+DulIxB/ZY2vrfBrpE2Pp7s1tr8O2q4e+3J16daRbzlZf+V1OQqd/rO2TiNHGAheEM+88TUxSMW3sOWuMMAR7zq3D/Lu6nMzKKL6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901706; c=relaxed/simple;
	bh=VOc7LuCJqDys5fks45EyVHFUwbnOKkKjUFYpp5rs714=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1xd/vX1CNyTCdUHUb2jN07Zjaxsl1zDTlfNgR583DdW+hHUbQbWzMFAQ9LLUoAiRHScAlSTQfJ0jf4Ie00H4F29Q4wTF46U4iuLUmiFJOCm2dt6RaO5wBqIn3H18PqVc63TVscvPZlIaFBjW06S0YcfQzzg0JWJc4zZ64u1dzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fAk89KCg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747901703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OJk2RZEA0+Ge0I8NoZCL+FKPnnIh+cTR7ZXXXn+Uj3s=;
	b=fAk89KCgHMOIExQvnzgKsH0KsmqAPx5tpFp1FMiKlDAkkMy5LiRpwpsw7GNe1vUe7+Gw4M
	7Nbg0Ua8vopQJY7r0SFxo7lv8bcHk+EgTciB/CyGmlcu8Bia+wi+33YhKj5MfDOczaPwnR
	TdxYZhj4pJvHOV3UM/jkkxTRZEPAzA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-2ubdCNPfPuuGP4sYpna-Ug-1; Thu, 22 May 2025 04:15:01 -0400
X-MC-Unique: 2ubdCNPfPuuGP4sYpna-Ug-1
X-Mimecast-MFC-AGG-ID: 2ubdCNPfPuuGP4sYpna-Ug_1747901701
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so57708335e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 01:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747901701; x=1748506501;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OJk2RZEA0+Ge0I8NoZCL+FKPnnIh+cTR7ZXXXn+Uj3s=;
        b=sYRwgLIRJu2B5i5vNMHfgO6kWiDENDKzXwxarkgDZPeJpqLlI6ARWvR4stEP/jqc0m
         2VIYDTg9Hq4Et4qJcFMhlYmn2pNw10dRQii8NJSRwnWYGmMhb3y1zs8Ryhrzy6V4OqYp
         XBxX3fcjLB/S1mqr+wnLGs9kR+13GxYNqG2yps4gSiCgirQ/UfbSQJOfpL5Hawo6lqj+
         mbBQqcDu7UBE7+HosQdXU+zREpY5KudUmmm6GB5YgXPeNg389AE0gThKhe+2B1RIiqJz
         5xkk1sL39wQjfvwsQI4NKEwRfn4jVNXGAQRI09DoQ37f3SQpQzseyp7QcqP6g1FMtZPN
         vt1A==
X-Forwarded-Encrypted: i=1; AJvYcCW4jdubOYL3o/x+PD92jFiYg5HQYF8XvaMb7EGTLDWC7UaBu3oYE1HCRAFSeD43looRPHvqKvKpOMD8YFW+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/jjV/LoNwwmHpaNOnDBlZUeUWW9oWrg2Sn0RB/9sn0V2cz0QX
	EC2T4GR8rDY/2scSeF0g+y7+WbohmHYTScyYv3rlkDWun5/vlRJ0fe4j+dm1qxqDNTM92O0ym8q
	7scthD2ZE7xSUPY16LI+qgamnxE5+Mx+I/t1JzMXBJKtaYhP4jpMESOX7H7h/eFuWenk=
X-Gm-Gg: ASbGncut97nxB/D1cY+qPiZkcSbQjRWMZ2cjToAMNn3EBwiCr6PCkUI6YC4iC9DEN9O
	6tMZirXITQ4IzOHZcn73GGA5NxGNS530aDYCumUscPkuS2obaPPjvC2j7XY9aIuZHxdEDM04GT0
	Vpf0CVfJEvsnm2pTJw2V9+T2pj2w2p6iYQbKjpNexglOurNka+H+eANBcC+6y6amtL+AHcTeJMt
	pi1sytsdKuranqgac81chHeXCfaNLqIKtcFxIM/Csn+JIQeGnfnuUXXJEo3wlV6oz94JePJCQpo
	EcZYtuK+Vu6gSqmFnJLJQw8Ml+huaQbX5okxLm3zlHRdQD70owI=
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr214853355e9.24.1747901700450;
        Thu, 22 May 2025 01:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoA+9K1d1QNyCZ0QFlparSNgc6WUYgpvNZy6+ivFAv4CeuF0kJ25Cx1UtI9lMMWPPhBKV0jw==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr214852555e9.24.1747901699922;
        Thu, 22 May 2025 01:14:59 -0700 (PDT)
Received: from ?IPV6:2a01:599:916:16c6:54bd:1780:84bf:8f90? ([2a01:599:916:16c6:54bd:1780:84bf:8f90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm99223265e9.14.2025.05.22.01.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:14:59 -0700 (PDT)
Message-ID: <a5e6abbf-76a9-4263-892f-3085b148b209@redhat.com>
Date: Thu, 22 May 2025 10:14:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/17] KVM: x86/mmu: Handle guest page faults for
 guest_memfd with shared memory
To: Fuad Tabba <tabba@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com,
 chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com,
 yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org,
 amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com,
 mic@digikod.net, vbabka@suse.cz, vannapurve@google.com,
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
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <diqzfrgx8olt.fsf@ackerleytng-ctop.c.googlers.com>
 <56e17793-efa2-44ea-9491-3217a059d3f3@redhat.com>
 <CA+EHjTwrXgLkwOsAehBsxsQ-ifM0QS_ub91xJQaAXNo75DSjzQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTwrXgLkwOsAehBsxsQ-ifM0QS_ub91xJQaAXNo75DSjzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.25 09:46, Fuad Tabba wrote:
> Hi David,
> 
> On Thu, 22 May 2025 at 08:16, David Hildenbrand <david@redhat.com> wrote:
>>
>>
>>>>> + * shared (i.e., non-CoCo VMs).
>>>>> + */
>>>>>     static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>>>>     {
>>>>> -   return IS_ENABLED(CONFIG_KVM_GMEM) &&
>>>>> -          kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>>>>> +   struct kvm_memory_slot *slot;
>>>>> +
>>>>> +   if (!IS_ENABLED(CONFIG_KVM_GMEM))
>>>>> +           return false;
>>>>> +
>>>>> +   slot = gfn_to_memslot(kvm, gfn);
>>>>> +   if (kvm_slot_has_gmem(slot) && kvm_gmem_memslot_supports_shared(slot)) {
>>>>> +           /*
>>>>> +            * For now, memslots only support in-place shared memory if the
>>>>> +            * host is allowed to mmap memory (i.e., non-Coco VMs).
>>>>> +            */
>>>>
>>>> Not accurate: there is no in-place conversion support in this series,
>>>> because there is no such itnerface. So the reason is that all memory is
>>>> shared for there VM types?
>>>>
>>>
>>> True that there's no in-place conversion yet.
>>>
>>> In this patch series, guest_memfd memslots support shared memory only
>>> for specific VM types (on x86, that would be KVM_X86_DEFAULT_VM and
>>> KVM_X86_SW_PROTECTED_VMs).
>>>
>>> How about this wording:
>>>
>>> Without conversion support, if the guest_memfd memslot supports shared
>>> memory, all memory must be used as not private (implicitly shared).
>>>
>>
>> LGTM
>>
>>>>> +           return false;
>>>>> +   }
>>>>> +
>>>>> +   return kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>>>>>     }
>>>>>     #else
>>>>>     static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>>>> index 2f499021df66..fe0245335c96 100644
>>>>> --- a/virt/kvm/guest_memfd.c
>>>>> +++ b/virt/kvm/guest_memfd.c
>>>>> @@ -388,6 +388,23 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
>>>>>
>>>>>      return 0;
>>>>>     }
>>>>> +
>>>>> +bool kvm_gmem_memslot_supports_shared(const struct kvm_memory_slot *slot)
>>>>> +{
>>>>> +   struct file *file;
>>>>> +   bool ret;
>>>>> +
>>>>> +   file = kvm_gmem_get_file((struct kvm_memory_slot *)slot);
>>>>> +   if (!file)
>>>>> +           return false;
>>>>> +
>>>>> +   ret = kvm_gmem_supports_shared(file_inode(file));
>>>>> +
>>>>> +   fput(file);
>>>>> +   return ret;
>>>>
>>>> Would it make sense to cache that information in the memslot, to avoid
>>>> the get/put?
>>>>
>>>> We could simply cache when creating the memslot I guess.
>>>>
>>>
>>> When I wrote it I was assuming that to ensure correctness we should
>>> check with guest memfd, like what if someone closed the gmem file in the
>>> middle of the fault path?
>>>
>>> But I guess after the discussion at the last call, since the faulting
>>> process is long and racy, if this check passed and we go to guest memfd
>>> and the file was closed, it would just fail so I guess caching is fine.
>>
>> Yes, that would be my assumption. I mean, we also msut make sure that if
>> the user does something stupid like that, that we won't trigger other
>> undesired code paths (like, suddenly the guest_memfd being !shared).
>>
>>>
>>>> As an alternative ... could we simple get/put when managing the memslot?
>>>
>>> What does a simple get/put mean here?
>>
>> s/simple/simply/
>>
>> So when we create the memslot, we'd perform the get, and when we destroy
>> the memslot, we'd do the put.
>>
>> Just an idea.
> 
> I'm not sure we can do that. The comment in kvm_gmem_bind() on
> dropping the reference to the file explains why:
> https://elixir.bootlin.com/linux/v6.14.7/source/virt/kvm/guest_memfd.c#L526

Right, although it is rather suboptimal; we have to constantly get/put 
the file, even in kvm_gmem_get_pfn() right now.

Repeatedly two atomics and a bunch of checks ... for something a sane 
use case should never trigger.

Anyhow, that's probably something to optimize also for 
kvm_gmem_get_pfn() later on? Of course, the caching here is rather 
straight forward.

-- 
Cheers,

David / dhildenb


