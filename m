Return-Path: <linux-arm-msm+bounces-54516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA3A8B99D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C6D93BFAC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354DE3594B;
	Wed, 16 Apr 2025 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhN3hM8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E45429B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808013; cv=none; b=RKiaiE+KY2NaR/PW5nQcPZUTf74tnkWNBlWloKbtAypGwujbdsPx5Kyw2MBVCflyxPhFl4yL/afCczzIB9G0LXdZo1HWErghAt87gpHpeOYXzD2hxh4MPSvFtkLsGRiJHOhecc3otHrVGUVDdCjdTURb/BADefMQJ83R7hesbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808013; c=relaxed/simple;
	bh=nB1Wp7a+KfUicRf4Fnbr4uTP9NBJvWr9+r8uNK1nsaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvK2HTQRqPNsCyzT/KhDMGDq5mmojnDZ4fcSdg9EJhdAmVTQd0n9rDqOg0ll4t2CLEM3yVUC8S5gV7bRsWyMC6GP7X3Q6s862Xj6yBged09lhYwivQ31aV7pUfqBJ6UePBPVWGgM+i+m1opDh+jU7jupojSN6C7piyJ4090nny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhN3hM8T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744808009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SX5cp1sy8OIJWEPpF8wF9aWC/NYtuOCcnbHvBboOO0Q=;
	b=fhN3hM8TRLcJ+jIO7QeDdP5AsQN7Z1xm4mwKgVpSdDTO48Z3/75ZjuA9Xpyo3Gx2Hc+7b9
	AjE2sZYuCrEyp4xfjeRz27bT05fYkzEO7EyiqdRyZGqoLhMjtBLKAlUFtqrEAnqu/qUBwE
	N9zlAFyw8uAu9xcO5je70iHFT+/yfJ0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-J3ssIrksMtqyphKu5fiQwQ-1; Wed, 16 Apr 2025 08:53:28 -0400
X-MC-Unique: J3ssIrksMtqyphKu5fiQwQ-1
X-Mimecast-MFC-AGG-ID: J3ssIrksMtqyphKu5fiQwQ_1744808007
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912e4e2033so3035032f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 05:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808007; x=1745412807;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SX5cp1sy8OIJWEPpF8wF9aWC/NYtuOCcnbHvBboOO0Q=;
        b=fib5HU4LkRMq+G6V7+phTOS7HMh2DRQBx+Klkc9njqRYpENjnxHUlTg+3fS3dXVBS5
         Xfauh1B/Q/PtkF/UxlAargKMFuZiNsnpsaYzM/fdbviFljyghZOAKmhn01PhCsQpeBSg
         TJ1B/YHZoXf5zG7KJ2KwF20e0nNDIU7PLdvwwf2xYOtQWqJr80Mj7QDewMn4y+aRm6Nk
         /cuYyq+BnHOYNgoh1YJ/kRt4JXehqnW4QQ5vw3Vcxa2KF2JjZMQceHWl725KEvGW2Our
         5cfQLsmnVL8ZoYt2nAJI4AGJCI0vEyEIRlbecEvI2OR5uvMT3K4Dn/npAJHyM78A3Y0m
         toww==
X-Forwarded-Encrypted: i=1; AJvYcCWQeL9ZypPaI1EyMUc0H2yfg4z3YclmjCSg+eUE+ZBshKVQEINyQHK4OPC7YW9mH1Ymhqdhh28XsMld5uc+@vger.kernel.org
X-Gm-Message-State: AOJu0YxxxH2PEONJs09TJA4pH9m2+UJQ5o+c8tTKXGEK4wjaB8kFKNEY
	5K93KFRyIMeLJfXOXjY39er3YaRovwu2Ir3jjPU+8x+eDZskcljk9n3aGkhDqZQRN8zzUN01YCR
	2exGQUZ8AYBGJOQnEHpDy31FBrI/2QkN7YV6Yy1cZIMXIPotTvIwz7Sz3lCaQ5mU=
X-Gm-Gg: ASbGncvE9d3G69bL4bJfNi16tC2ulVjCX7kKHoSKVQ4/EArwqTUhvcIEe2RqasqENX+
	VnSNlQnwwoMnbSR/8TUfgTcE3LnSvTElVCn0AOR/e6kM1XRJVQxwRrHbrmIrz3nG67fPuVChnN7
	yOc7UIdRaXD3//ig7dQWW3UNH5o31eiUBOK3vjbgTx6P4yCF6Jz14Ot8fWyWaBH7qMHZkiROb8R
	jgKGKKbrWcGbnQLdx5gDFs2hWPB8i6FapZYbKSVGmgCgUu4ADMHjffDc+V6MhZedgfz4MnQt6WD
	ItcOKmQssgan14hMs7mGauIUx/9QoJZKQOCZ3+Be4KXLcjy4oTJKIx1NQnYdeddBZMkFuHAAWv3
	TsxgyEku10nsiQGSAITfQi9R2uQGU8zKm4pgbPw==
X-Received: by 2002:a5d:6da5:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39ee5bad621mr1829034f8f.48.1744808006824;
        Wed, 16 Apr 2025 05:53:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+vkj7MIwX/vflBwkqkVaJ5xeip9iQgj+nkSM7MvwPAOp/gpWZFT31bzyC8O8qgOVsk+LgYg==
X-Received: by 2002:a5d:6da5:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39ee5bad621mr1828966f8f.48.1744808004935;
        Wed, 16 Apr 2025 05:53:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a536sm38056165e9.1.2025.04.16.05.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:53:24 -0700 (PDT)
Message-ID: <91c2f8ec-ca03-4368-a220-bac639a18938@redhat.com>
Date: Wed, 16 Apr 2025 14:53:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] KVM: guest_memfd: Handle in-place shared memory as
 guest_memfd backed memory
To: Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com,
 wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com
References: <20250318161823.4005529-1-tabba@google.com>
 <20250318161823.4005529-5-tabba@google.com>
 <8ebc66ae-5f37-44c0-884b-564a65467fe4@redhat.com>
 <diqzplhe4nx5.fsf@ackerleytng-ctop.c.googlers.com>
 <6121b93b-6390-49e9-82db-4ed3a6797898@redhat.com>
 <diqzzfghyu0l.fsf@ackerleytng-ctop.c.googlers.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <diqzzfghyu0l.fsf@ackerleytng-ctop.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
> 
> I looked a little deeper and got help from James Houghton on
> understanding this too.

Great :)

> 
> Specifically for the usage of kvm_mem_is_private() in
> kvm_mmu_max_mapping_level(), the intention there is probably to skip
> querying userspace page tables in __kvm_mmu_max_mapping_level() since
> private memory will never be faulted into userspace, hence no need to
> check.
> 
> Hence kvm_mem_is_private() there is really meant to query the
> private-ness of the gfn rather than just whether kvm_mem_from_gmem().
> 
> But then again, if kvm_mem_from_gmem(), guest_memfd should be queried
> for max_mapping_level. guest_memfd would know, for both private and
> shared memory, what page size the page was split to, and what level
> it was faulted as. (Exception: if/when guest_memfd supports THP,
> depending on how that is done, querying userspace page tables might be
> necessary to determine the max_mapping_level)

Okay, so I assume my intuition was right: if we know we can go via the 
guest_memfd also for !private memory, then probably no need to consult 
the page tables.

Let's discuss that tomorrow in the meeting.

> 
>>>
>>> A. this specific gfn is backed by gmem, or
>>> B. if the specific gfn is private?
>>>
>>> I noticed some other places where kvm_mem_is_private() is left as-is
>>> [2], is that intentional? Are you not just renaming but splitting out
>>> the case two cases A and B?
>>
>> That was the idea, yes.
>>
>> If we get a private fault and !kvm_mem_is_private(), or a shared fault and
>> kvm_mem_is_private(), then we should handle it like today.
>>
>> That is the kvm_mmu_faultin_pfn() case, where we
>>
>> if (fault->is_private != kvm_mem_is_private(kvm, fault->gfn)) {
>> 	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
>> 	return -EFAULT;
>> }
>>
>> which can be reached by arch/x86/kvm/svm/svm.c:npf_interception()
>>
>> if (sev_snp_guest(vcpu->kvm) && (error_code & PFERR_GUEST_ENC_MASK))
>> 	error_code |= PFERR_PRIVATE_ACCESS;
>>
>> In summary: the memory attribute mismatch will be handled as is, but not how
>> we obtain the gfn.
>>
>> At least that was the idea (-issues in the commit).
>>
>> What are your thoughts about that direction?
> 
> I still like the renaming. :)
> 
> I looked into kvm_mem_is_private() and I believe it has the following
> uses:
> 
> 1. Determining max_mapping_level (kvm_mmu_max_mapping_level() and
>     friends)
> 2. Querying the kernel's record of private/shared state, which is used
>     to handle (a) mismatch between fault->private and kernel's record
>     (handling implicit conversions) (b) how to prefaulting pages (c)
>     determining how to fault in KVM_X86_SW_PROTECTED_VMs
> 
> So perhaps we could leave kvm_mem_is_private() as not renamed, but as
> part of the series introducing mmap and conversions
> (CONFIG_KVM_GMEM_SHARED_MEM), we should also have kvm_mem_is_private()
> query guest_memfd for shareability status, and perhaps
> kvm_mmu_max_mapping_level() could query guest_memfd for page size (after
> splitting, etc).
> 

Right, that's why I opted to leave kvm_mem_is_private() here and really 
only indicate if memory is *actually* private.

> IIUC the maximum mapping level is determined by these factors:
> 
> 1. Attribute granularity (lpage_info)
> 2. Page size (guest_memfd for guest_memfd backed memory)
> 3. Size of mapping in host page table (for non-guest_memfd backed
>     memory, and important for THP if/when/depending on how guest_memfd
>     supports THP)

Right, once private+shared will come from guest_memfd, then likely 3
does not apply anymore.

See my reply to Patrick regarding that.

Thanks!

-- 
Cheers,

David / dhildenb


