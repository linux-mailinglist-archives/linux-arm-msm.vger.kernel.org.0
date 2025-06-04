Return-Path: <linux-arm-msm+bounces-60233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B186DACDECF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9FC16900D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5B428EA51;
	Wed,  4 Jun 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvTAPdMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A330628C2D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043034; cv=none; b=uoME0snmy01Q/Bn15AYKKkpAnWe85pzT4mmKA4WhIU3qJ4wHlOYc+7z4/4Om0x6TYwOo6aCM8RCORj7SnVvvkOTzZWfGH1pD9e12Kq5DSs4r8VBTlvEhcYifj8VKmuolImSMZJ2miFovUkA86McJTF4nAPxVSWK4QH5CkJDhRYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043034; c=relaxed/simple;
	bh=MxUehIm/sOmSET8fj+6AA/WOdeG9w3gOIUbXGbcEwQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsNYPdHX0OzABtWt7e4vVGISBFqfDKConyvEib76ecYQe9hWgOgRhE6fYhl0Tpp1SllGqsWiGtvJ7oBKQ09le9ifvVAipCCAThcMvlEASz3ARFCeITSPLfJGzFlCkVyUgrTfXT3nGhFPZmGPcFNk38avVVwI7CZex5PZixmq9iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvTAPdMd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bIO55ksEFdETkeVPuN9/YoTmoE0JSO6vLQWMjgK7hBA=;
	b=YvTAPdMdYTnmCSngJnOWLZjiukH7YVkPmLsgsd+6qdF/OHLyNkbGiKkXuu9js5uE2JC5kr
	/IqzamKDS8lKTBXLBe+Mw6Nur8xz1hj2rNTKxRwudCtr40G7TtoR+KY37OMjhlqxKcyGXs
	RKQUqWqqSTqUVfsGetTBEa70ZAyjzXk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-UmwlbDZoNOWRaNRe-933cg-1; Wed, 04 Jun 2025 09:17:10 -0400
X-MC-Unique: UmwlbDZoNOWRaNRe-933cg-1
X-Mimecast-MFC-AGG-ID: UmwlbDZoNOWRaNRe-933cg_1749043029
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso3760927f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043029; x=1749647829;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bIO55ksEFdETkeVPuN9/YoTmoE0JSO6vLQWMjgK7hBA=;
        b=Bj9dCP51QQPtrYhISR/vu5/9d8JyHJFAFkDwvk9oUsjO0E/Mvw/xpTs3OZf7IcaIZM
         RnhDas1Lw1FUZ4QkWYDOG4XLIaUGDw3LMU/SzLxmkPsXHgRoH6ZhgR5sgW1G8LgxSz+i
         Cd34Yi5+PKOGP5vSf93yOfSGpV3wHBJZfevdj09LDLW/FBQR/2jxTUrtHM++EyEI+Kxm
         4430MLBxuiziiHhGyE0zGhVFvIasZ2Xps+OYUwIFOyzSb3g+mGJ/PptsyxLP0lk+b3Am
         tf9Fok2m2Qugv2v2Btr6TY1ZgDtwovT3UugPofw0jUO5zg7fcFvlS6m0I/YnfPgzWeYy
         hnWw==
X-Forwarded-Encrypted: i=1; AJvYcCUEODtRqYuZxAkT5tOTNEvPXypSxYmpa38oFEkooLOEfgvyai10Vm5vOQjjEt+kJLxjlyVWdOeqaFOJYdf8@vger.kernel.org
X-Gm-Message-State: AOJu0YypwfEaWcs2/vQNkxQM63eqeL+jZnJDjG4ncxnyr6R5ktYBhFI9
	Oa+rJA3Bsld5Jc55IU+Ezf2pK1/vhdg7/rssqQp2gEGTOyqltKdnrB8jZNIMNy4+2ctV6tpmDmd
	j/OY8z8DsTmG3MQZ+vaYU8SfDEpqLtBfw+tjeIVPQcjvU+ihrC/Yjloxzjv1Vus6SuWQ=
X-Gm-Gg: ASbGnctUtmRnVSZARQ5isVqcX/bG2beO1d2z1mg62PvCdqugYujqDVwnqYPUX7yazjr
	fdcBRe+tupZgRjzPFzltNsE9qxPua0yfDMt0l/XGrRfFy2Zs65q/G0XdQMZ1qNNoOs0uAiwl9hi
	yGCzChG04p3yb8Iy4gVNuaS/UwJkM1ufBo7Ihw7TQbbCbV+2kaqgEGIndLk2RtZlHKq1229i9vW
	mDgnBHLI8UuxpMHpIJKa3LNO07qes34JPsnhj5XIwANJVoX5tptzVjx31cB+rvQ928hl/Zta/t1
	YNBBJJ2YGWkLOXSfDB37ZeBmOZZdlOzNtVmFPyVOA6HQQ3KFM51TBTZmD8cyWklRwabtvIUb2IQ
	leafi607EGSmsfeLFmNpcgBJBA5KfujsvxljIEcI=
X-Received: by 2002:a05:6000:1a87:b0:3a4:f7f3:2840 with SMTP id ffacd0b85a97d-3a51d8f60c3mr2508201f8f.1.1749043029088;
        Wed, 04 Jun 2025 06:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj6QdN2FkVHcXOshhIV/yEB/MAbubLpFJhi81QGj978EJzjeBuLXZHtjKOcWLjb0qoD8TCJA==
X-Received: by 2002:a05:6000:1a87:b0:3a4:f7f3:2840 with SMTP id ffacd0b85a97d-3a51d8f60c3mr2508161f8f.1.1749043028548;
        Wed, 04 Jun 2025 06:17:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d800671csm201084705e9.30.2025.06.04.06.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:17:08 -0700 (PDT)
Message-ID: <ed1928ce-fc6f-4aaa-9f54-126a8af12240@redhat.com>
Date: Wed, 4 Jun 2025 15:17:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/16] KVM: arm64: Handle guest_memfd-backed guest
 page faults
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
References: <20250527180245.1413463-1-tabba@google.com>
 <20250527180245.1413463-14-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250527180245.1413463-14-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.05.25 20:02, Fuad Tabba wrote:
> Add arm64 support for handling guest page faults on guest_memfd backed
> memslots. Until guest_memfd supports huge pages, the fault granule is
> restricted to PAGE_SIZE.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> 
> ---
> 
> Note: This patch introduces a new function, gmem_abort() rather than
> previous attempts at trying to expand user_mem_abort(). This is because
> there are many differences in how faults are handled when backed by
> guest_memfd vs regular memslots with anonymous memory, e.g., lack of
> VMA, and for now, lack of huge page support for guest_memfd. The
> function user_mem_abort() is already big and unwieldly, adding more
> complexity to it made things more difficult to understand.
> 
> Once larger page size support is added to guest_memfd, we could factor
> out the common code between these two functions.
> 
> ---
>   arch/arm64/kvm/mmu.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 87 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9865ada04a81..896c56683d88 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1466,6 +1466,87 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>   	return vma->vm_flags & VM_MTE_ALLOWED;
>   }
>   
> +static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> +			  struct kvm_memory_slot *memslot, bool is_perm)

TBH, I have no idea why the existing function is called "_abort". I am 
sure there is a good reason :)

> +{
> +	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
> +	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> +	bool logging, write_fault, exec_fault, writable;
> +	struct kvm_pgtable *pgt;
> +	struct page *page;
> +	struct kvm *kvm;
> +	void *memcache;
> +	kvm_pfn_t pfn;
> +	gfn_t gfn;
> +	int ret;
> +
> +	if (!is_perm) {
> +		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
> +
> +		if (!is_protected_kvm_enabled()) {
> +			memcache = &vcpu->arch.mmu_page_cache;
> +			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
> +		} else {
> +			memcache = &vcpu->arch.pkvm_memcache;
> +			ret = topup_hyp_memcache(memcache, min_pages);
> +		}
> +		if (ret)
> +			return ret;
> +	}
> +
> +	kvm = vcpu->kvm;
> +	gfn = fault_ipa >> PAGE_SHIFT;

These two can be initialized directly above.

> +
> +	logging = memslot_is_logging(memslot);
> +	write_fault = kvm_is_write_fault(vcpu);
> +	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
 > +	VM_BUG_ON(write_fault && exec_fault);

No VM_BUG_ON please.

VM_WARN_ON_ONCE() maybe. Or just handle it along the "Unexpected L2 read 
permission error" below cleanly.

> +
> +	if (is_perm && !write_fault && !exec_fault) {
> +		kvm_err("Unexpected L2 read permission error\n");
> +		return -EFAULT;
> +	}
> +
> +	ret = kvm_gmem_get_pfn(vcpu->kvm, memslot, gfn, &pfn, &page, NULL);
> +	if (ret) {
> +		kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
> +					      write_fault, exec_fault, false);
> +		return ret;
> +	}
> +
> +	writable = !(memslot->flags & KVM_MEM_READONLY) &&
> +		   (!logging || write_fault);
> +
> +	if (writable)
> +		prot |= KVM_PGTABLE_PROT_W;
> +
> +	if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> +		prot |= KVM_PGTABLE_PROT_X;
> +
> +	pgt = vcpu->arch.hw_mmu->pgt;

Can probably also initialize directly above.

> +
> +	kvm_fault_lock(kvm);
> +	if (is_perm) {
> +		/*
> +		 * Drop the SW bits in favour of those stored in the
> +		 * PTE, which will be preserved.
> +		 */
> +		prot &= ~KVM_NV_GUEST_MAP_SZ;
> +		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault_ipa, prot, flags);
> +	} else {
> +		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
> +					     __pfn_to_phys(pfn), prot,
> +					     memcache, flags);
> +	}
> +	kvm_release_faultin_page(kvm, page, !!ret, writable);
> +	kvm_fault_unlock(kvm);
> +
> +	if (writable && !ret)
> +		mark_page_dirty_in_slot(kvm, memslot, gfn);
> +
> +	return ret != -EAGAIN ? ret : 0;
> +}
> +

Nothing else jumped at me. But just like on the x86 code, I think we 
need some arch experts take a look at this one ...

-- 
Cheers,

David / dhildenb


