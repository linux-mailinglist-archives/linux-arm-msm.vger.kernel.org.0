Return-Path: <linux-arm-msm+bounces-58852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 547CAABED6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A4316D749
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B722356C9;
	Wed, 21 May 2025 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S6O6mxON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B41191F66
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814495; cv=none; b=Wp0jIehviZ9M8i52s69GE4sKGahudk0EIH576KD9md9Y4ecTeHvTRWySwO26c07KLciHhD7oe44v8ebc2A1b9EGGHyMqSP7SxLdY3F/AQcPf0GS3MKUNjyYCQDqkpd+QZJ444ouAEeYAZUD4yi8lRmUcwIBQwXQJSk278V7Fvw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814495; c=relaxed/simple;
	bh=oMfc53/PQiIrOOt+eSYz2VImJvfnUBA5KzAMg8twj5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/0dfB8d6mS5xs3G7Jle3tQW2ouog06qGOVYny0VeNQzIrHBj9gV/RzeaNvrlBBSWbdr3MxKITLPM0Nft4P5cC5gIat+v8jvFefCpR2p24RK7J5eDk9UJgfILgYxv7jHFPxe5a2nszhBQ1xEo665BHr17LOLdJIgR1yCQ9QhmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S6O6mxON; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747814492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4RYkgAjrsw+pDY8x3snymsQcrwRSC8EMIUAxroid+Gw=;
	b=S6O6mxONDpCzZ2yKJ4FhUfFLm8S97Kgm5vGj1mjfuPVcSkubwePW74ImFD61rBcdVv2EBd
	Y7tUYC5dgj8tkdeUZG51LaxRI67E3Yhh3n4t2FVYPQsKTopN+otemN7NGtgsA6ORSHhk6+
	oJEDhYqc0AnOH6aK1Sjv1BumkBixHow=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-6ISaAK5QPm-3vydl_mjv7w-1; Wed, 21 May 2025 04:01:29 -0400
X-MC-Unique: 6ISaAK5QPm-3vydl_mjv7w-1
X-Mimecast-MFC-AGG-ID: 6ISaAK5QPm-3vydl_mjv7w_1747814489
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so48158375e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 01:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814488; x=1748419288;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4RYkgAjrsw+pDY8x3snymsQcrwRSC8EMIUAxroid+Gw=;
        b=KUVip9HUysTE1C6wwxrDXyLFcAPxOnQ5upkueEq+XEMZXvzLAmSHGdyJnSK4x9POeH
         N/aSf8D6ukqxolLN8Sywapa90GDisxYaB7FGMbT7AI5zGN+MXrfu791hz+fCipP0PDLa
         H04se8mWKeCxTwgpgVYZwIXOaDsNe0Xl8NlS/qqzv3BVipVBtutZz3O5B+XVi4ZItP22
         kKyUB6RwkLIfZr5EL/69VxF9afjw5WT25HvrPb6dNciz4I37PdpUh5wD3UyfJnX+e3SK
         ILorNS2rTAix728DVjtf0W7TpaBrZJhPSPLaN5VklnqzQx3EMA17scIYMuwJ6A8mhuuQ
         25nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKMtXuF05uUUVyckYP1RyNoIyh9LAm/+haAiaLP+CUid4luT/SnV28/T4ozbHD6gptmmjExfwsCv01sCuW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm41qtPc+yNwykZ/a47JljM/p0GAYI8jdflKQFHNQBBSURXym4
	jeQLIIHLYAzteJFwDBNV5jUwAhUf7qCFtvmmkl1WlDmnA+fdz7h9kEV1vU36kaeqc7YbcHkCEGS
	RfI45BSQLwp5v9z6UOVEyCREOa6cgwbmFHSwJiG1GSxU11LRIW7/jV2r08yXXQUsdWYhoulyQmD
	50Kg==
X-Gm-Gg: ASbGncu0fPJP8+rJ0hgyuZ8HZjg+2yUT0EEBk1TOsT7mtT8TUg9ETR8wn0qws69mEai
	D2g/veeaRBo0Pbx8wL4y0aMK8G7k9hwGWDiqkqdmNYK/eJz8ilknefc9KYuQgff47JC5BmkB/rg
	I35FsnVCp99B0dEwKPGDJZFjZxX+XSPvxuA7/MI3jddanFucmO74gfsMd/TS8yBXi7lPJSskFmE
	RqfQn0wHHpt8/uNBUiPZwIi8n3j5jYOZAbiLtGuQnxJHAmE8TZETqWFChMJLOxZCDy3WFiW5WnQ
	3uIHRbf4hcynD4zZAf+eCfTnO2vs/SnFRFE4n8XDcAOTqgX6AJpbEZDY4VhyLjsvA6F7/BrXVQ1
	Mewh/rzjHuUqDDkSQ1oB6IvylDYXrRoaxU5ziBXE=
X-Received: by 2002:a05:600c:c059:20b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442ffc60edemr109464205e9.3.1747814488277;
        Wed, 21 May 2025 01:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKyIx8rMps7N9l8hzrChMxhw34HYrTKEu4eOSZFN4Um9vSDS/Gi2iekXstOKiLrKLeomLKaQ==
X-Received: by 2002:a05:600c:c059:20b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442ffc60edemr109463695e9.3.1747814487741;
        Wed, 21 May 2025 01:01:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36c6eeaf8sm11413800f8f.48.2025.05.21.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:01:27 -0700 (PDT)
Message-ID: <5ace54d1-800b-4122-8c05-041aa0ee12a1@redhat.com>
Date: Wed, 21 May 2025 10:01:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/17] KVM: x86: Compute max_mapping_level with input
 from guest_memfd
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
 <20250513163438.3942405-11-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250513163438.3942405-11-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 18:34, Fuad Tabba wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> This patch adds kvm_gmem_max_mapping_level(), which always returns
> PG_LEVEL_4K since guest_memfd only supports 4K pages for now.
> 
> When guest_memfd supports shared memory, max_mapping_level (especially
> when recovering huge pages - see call to __kvm_mmu_max_mapping_level()
> from recover_huge_pages_range()) should take input from
> guest_memfd.
> 
> Input from guest_memfd should be taken in these cases:
> 
> + if the memslot supports shared memory (guest_memfd is used for
>    shared memory, or in future both shared and private memory) or
> + if the memslot is only used for private memory and that gfn is
>    private.
> 
> If the memslot doesn't use guest_memfd, figure out the
> max_mapping_level using the host page tables like before.
> 
> This patch also refactors and inlines the other call to
> __kvm_mmu_max_mapping_level().
> 
> In kvm_mmu_hugepage_adjust(), guest_memfd's input is already
> provided (if applicable) in fault->max_level. Hence, there is no need
> to query guest_memfd.
> 
> lpage_info is queried like before, and then if the fault is not from
> guest_memfd, adjust fault->req_level based on input from host page
> tables.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c   | 92 ++++++++++++++++++++++++++--------------
>   include/linux/kvm_host.h |  7 +++
>   virt/kvm/guest_memfd.c   | 12 ++++++
>   3 files changed, 79 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index cfbb471f7c70..9e0bc8114859 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3256,12 +3256,11 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
>   	return level;
>   }
[...]

>   static u8 kvm_max_level_for_fault_and_order(struct kvm *kvm,
>   					    struct kvm_page_fault *fault,
>   					    int order)
> @@ -4523,7 +4551,7 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
>   {
>   	unsigned int foll = fault->write ? FOLL_WRITE : 0;
>   
> -	if (fault->is_private || kvm_gmem_memslot_supports_shared(fault->slot))
> +	if (fault_from_gmem(fault))

Should this change rather have been done in the previous patch?

(then only adjust fault_from_gmem() in this function as required)

>   		return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
>   
>   	foll |= FOLL_NOWAIT;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index de7b46ee1762..f9bb025327c3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2560,6 +2560,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>   int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>   		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
>   		     int *max_order);
> +int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot, gfn_t gfn);
>   #else
>   static inline int kvm_gmem_get_pfn(struct kvm *kvm,
>   				   struct kvm_memory_slot *slot, gfn_t gfn,
> @@ -2569,6 +2570,12 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
>   	KVM_BUG_ON(1, kvm);
>   	return -EIO;
>   }
> +static inline int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot,
> +					 gfn_t gfn)

Probably should indent with two tabs here.



-- 
Cheers,

David / dhildenb


