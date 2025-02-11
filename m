Return-Path: <linux-arm-msm+bounces-47612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA3AA31068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60B477A1D12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54378254AF8;
	Tue, 11 Feb 2025 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m8ENGSZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84D254AEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289478; cv=none; b=XRvgHUIPqL+tDNafxf5Z4By4Il5DlUlSn5KF3E4HJ8o56keARqAd60L9G9ALE250NGK6GJRKfAiWNQwyRHl07tFRBjZg09H/YgnF4XYRMKhoTZn7WLRoLrSyXT9riBJ0psYObpSEABGgL6rfH6SGOstpj2vmXU/JHdIj3CeCHqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289478; c=relaxed/simple;
	bh=y4iKEJDDBwze0t7ZAI0gDJsyLMCySCJBcLUnHGyKpDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWkf8hSV2sUSIXko3wbDMky4YxjiKciPM6P7WNXF/QFzIW6svWb/RFMmNOeY8bq7tsCmeOwrZ6NGgOB3GsH9XsQ+8qGozmeRjuYMnNFTS6WrYERq7hpkU/A6cArspCSzqBVnuWQGS2P7L6pEUCQUwwiAn7Da1yrl+S7lGB/7DNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m8ENGSZN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so6233433a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 07:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739289474; x=1739894274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gSy9CeX8Agir4rGMRLeCG9EkflqYF5Cr1FhyZfH86h4=;
        b=m8ENGSZN0XiwHfEQWQApn6TWuVfqrcGdm1G3QygmWvEktPHPCN9PhWvHxQVL5dmSwZ
         d/QrDnLVy3m1X5kLayLTkLVk2jdVcNyd7kw3kRmh8F9cN9zdmYuX6gDpNDnU+w/PhiGU
         cx918f287NZZp4Bb1/X8ZzLd7f7W9Wrqq0ojzPF64jZeppjcwiF5vYUKsJlvCZmxnj2a
         fS++vZ01jCvZTWjAKHCGmU4ZMbbBW0efauv39iJ4uqKfNbyMcLIeweeh5+rDHQ0Taclf
         1fQDT29LMfB8oSEBKqiUlZsw0X1AFCpD8eDDNqT6NJnBgeCHvdOy15bxO77hVu1wE4Zn
         BvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289474; x=1739894274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSy9CeX8Agir4rGMRLeCG9EkflqYF5Cr1FhyZfH86h4=;
        b=PXONYKYrLPZGxRwOxLxp0KTKnrHuxmBJsAu0kVnkIoUJH6GB5S4YslER/CFtZkZLZW
         PlCULeWCj4BufSXfll4KlzRv4Lj0H0mIv5FAdjmTwpVq5RWkAUbBLIpfW06MBaAGO7aS
         plNviEXZAqAG75IxR/TDCYA6ZOhO9bQre0+07nynGxwvxirljNR1/lOOy5jMvLm8D81D
         eFQA1zSM+KvipHTp15Wqss2idt4A0/ujIBrsQKg6dgUgYXyUX+1SGp6JxUUMi+xIRUAx
         Z9h9z/8SKitWIavG6QAmnJNu72E7GgpNS64Uuhs2ZQzlN1b65aTEgAhn2GG3gW1gHuRH
         obBA==
X-Forwarded-Encrypted: i=1; AJvYcCVXIRS7Zj0ucxFeSIps2HH2cQ0cvoL4J+/QQw5+ERbhfoOSuhUEblVrWNcyRgC7dgphK1PSAA/6CeaWVnTd@vger.kernel.org
X-Gm-Message-State: AOJu0YxWmkrRTlJfbtvWsMfK7Qa9OBgARbqPKRkpLhZ5jpPVGfZv7BpP
	MXB/SsjidxAupXFRE5jPb7cbOiimeuNF1mmNDZnV18iNFYul9tqx+nnjRYadAA==
X-Gm-Gg: ASbGncu64Gi09SKMyCiYG23JFWVTgy1ghoBKPfhWprDGs7m8s/ic1QpsWb/vKqVNya7
	VJ8On2WjBIaoAjwfARPCOP47ZxxiBtOM03ZD0Ed9F7PcHcHXmqHJM7XgiFW22m2N4zB914fyfQQ
	e6VBqGAyJp/SRNR3S/uSFRcTvYF9v69PRgayFEEYQKVuP+yw2aOhHZdSHJi0yMLF8fLfdQp0i7p
	S7M9HP5/rjbDalU1bAdZt6bxBe+hVB5+KwQOEJXcCzyIO2m+xh//MNLXA9x3m+5antIP6/eQDF/
	kAAR8tAzA/TjoKiMcptOYG72CjMGXikbEGN4SPdAf81vIVTLo9jl
X-Google-Smtp-Source: AGHT+IHvBbSF7MaP8XjqV6V+IWo7/0vGZiaY1WWsB3xUcJqEU+O4V3CWmqqms9kl920x44mAhGChyA==
X-Received: by 2002:a05:6402:238a:b0:5dc:e393:af63 with SMTP id 4fb4d7f45d1cf-5de9a3dc461mr3738748a12.16.1739289473700;
        Tue, 11 Feb 2025 07:57:53 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7b0a2sm9755130a12.22.2025.02.11.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:57:52 -0800 (PST)
Date: Tue, 11 Feb 2025 15:57:48 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	xiaoyao.li@intel.com, yilun.xu@intel.com,
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com,
	dmatlack@google.com, yu.c.zhang@linux.intel.com,
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
	vannapurve@google.com, ackerleytng@google.com,
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com,
	wei.w.wang@intel.com, liam.merwick@oracle.com,
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
	quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
	quic_pheragu@quicinc.com, catalin.marinas@arm.com,
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
	maz@kernel.org, will@kernel.org, keirf@google.com,
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org,
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com,
	fvdl@google.com, hughd@google.com, jthoughton@google.com
Subject: Re: [PATCH v3 08/11] KVM: arm64: Handle guest_memfd()-backed guest
 page faults
Message-ID: <Z6tzfMW0TdwdAWxT@google.com>
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-9-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211121128.703390-9-tabba@google.com>

Hey Fuad,

On Tuesday 11 Feb 2025 at 12:11:24 (+0000), Fuad Tabba wrote:
> Add arm64 support for handling guest page faults on guest_memfd
> backed memslots.
> 
> For now, the fault granule is restricted to PAGE_SIZE.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/mmu.c     | 84 ++++++++++++++++++++++++++--------------
>  include/linux/kvm_host.h |  5 +++
>  virt/kvm/kvm_main.c      |  5 ---
>  3 files changed, 61 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index b6c0acb2311c..305060518766 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1454,6 +1454,33 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>  	return vma->vm_flags & VM_MTE_ALLOWED;
>  }
>  
> +static kvm_pfn_t faultin_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> +			     gfn_t gfn, bool write_fault, bool *writable,
> +			     struct page **page, bool is_private)
> +{
> +	kvm_pfn_t pfn;
> +	int ret;
> +
> +	if (!is_private)
> +		return __kvm_faultin_pfn(slot, gfn, write_fault ? FOLL_WRITE : 0, writable, page);
> +
> +	*writable = false;
> +
> +	if (WARN_ON_ONCE(write_fault && memslot_is_readonly(slot)))
> +		return KVM_PFN_ERR_NOSLOT_MASK;

I believe this check is superfluous, we should decide to report an MMIO
exit to userspace for write faults to RO memslots and not get anywhere
near user_mem_abort(). And nit but the error code should probably be
KVM_PFN_ERR_RO_FAULT or something instead?

> +
> +	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, page, NULL);
> +	if (!ret) {
> +		*writable = write_fault;

In normal KVM, if we're not dirty logging we'll actively map the page as
writable if both the memslot and the userspace mappings are writable.
With gmem, the latter doesn't make much sense, but essentially the
underlying page should really be writable (e.g. no CoW getting in the
way and such?). If so, then perhaps make this

		*writable = !memslot_is_readonly(slot);

Wdyt?

> +		return pfn;
> +	}
> +
> +	if (ret == -EHWPOISON)
> +		return KVM_PFN_ERR_HWPOISON;
> +
> +	return KVM_PFN_ERR_NOSLOT_MASK;
> +}
> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1461,25 +1488,26 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  {
>  	int ret = 0;
>  	bool write_fault, writable;
> -	bool exec_fault, mte_allowed;
> +	bool exec_fault, mte_allowed = false;
>  	bool device = false, vfio_allow_any_uc = false;
>  	unsigned long mmu_seq;
>  	phys_addr_t ipa = fault_ipa;
>  	struct kvm *kvm = vcpu->kvm;
> -	struct vm_area_struct *vma;
> +	struct vm_area_struct *vma = NULL;
>  	short vma_shift;
>  	void *memcache;
> -	gfn_t gfn;
> +	gfn_t gfn = ipa >> PAGE_SHIFT;
>  	kvm_pfn_t pfn;
>  	bool logging_active = memslot_is_logging(memslot);
> -	bool force_pte = logging_active || is_protected_kvm_enabled();
> -	long vma_pagesize, fault_granule;
> +	bool is_private = kvm_mem_is_private(kvm, gfn);

Just trying to understand the locking rule for the xarray behind this.
Is it kvm->srcu that protects it for reads here? Something else?

> +	bool force_pte = logging_active || is_private || is_protected_kvm_enabled();
> +	long vma_pagesize, fault_granule = PAGE_SIZE;
>  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>  	struct kvm_pgtable *pgt;
>  	struct page *page;
>  	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
>  
> -	if (fault_is_perm)
> +	if (fault_is_perm && !is_private)

Nit: not strictly necessary I think.

>  		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
>  	write_fault = kvm_is_write_fault(vcpu);
>  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> @@ -1510,24 +1538,30 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			return ret;
>  	}
>  
> +	mmap_read_lock(current->mm);
> +
>  	/*
>  	 * Let's check if we will get back a huge page backed by hugetlbfs, or
>  	 * get block mapping for device MMIO region.
>  	 */
> -	mmap_read_lock(current->mm);
> -	vma = vma_lookup(current->mm, hva);
> -	if (unlikely(!vma)) {
> -		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> -		mmap_read_unlock(current->mm);
> -		return -EFAULT;
> -	}
> +	if (!is_private) {
> +		vma = vma_lookup(current->mm, hva);
> +		if (unlikely(!vma)) {
> +			kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> +			mmap_read_unlock(current->mm);
> +			return -EFAULT;
> +		}
>  
> -	/*
> -	 * logging_active is guaranteed to never be true for VM_PFNMAP
> -	 * memslots.
> -	 */
> -	if (WARN_ON_ONCE(logging_active && (vma->vm_flags & VM_PFNMAP)))
> -		return -EFAULT;
> +		/*
> +		 * logging_active is guaranteed to never be true for VM_PFNMAP
> +		 * memslots.
> +		 */
> +		if (WARN_ON_ONCE(logging_active && (vma->vm_flags & VM_PFNMAP)))
> +			return -EFAULT;
> +
> +		vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> +		mte_allowed = kvm_vma_mte_allowed(vma);
> +	}
>  
>  	if (force_pte)
>  		vma_shift = PAGE_SHIFT;
> @@ -1597,18 +1631,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		ipa &= ~(vma_pagesize - 1);
>  	}
>  
> -	gfn = ipa >> PAGE_SHIFT;
> -	mte_allowed = kvm_vma_mte_allowed(vma);
> -
> -	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> -
>  	/* Don't use the VMA after the unlock -- it may have vanished */
>  	vma = NULL;
>  
>  	/*
>  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
> -	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
> -	 * acquiring kvm->mmu_lock.
> +	 * vma_lookup() or faultin_pfn() become stale prior to acquiring
> +	 * kvm->mmu_lock.
>  	 *
>  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
>  	 * with the smp_wmb() in kvm_mmu_invalidate_end().
> @@ -1616,8 +1645,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
>  	mmap_read_unlock(current->mm);
>  
> -	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
> -				&writable, &page);
> +	pfn = faultin_pfn(kvm, memslot, gfn, write_fault, &writable, &page, is_private);
>  	if (pfn == KVM_PFN_ERR_HWPOISON) {
>  		kvm_send_hwpoison_signal(hva, vma_shift);
>  		return 0;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 39fd6e35c723..415c6274aede 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1882,6 +1882,11 @@ static inline int memslot_id(struct kvm *kvm, gfn_t gfn)
>  	return gfn_to_memslot(kvm, gfn)->id;
>  }
>  
> +static inline bool memslot_is_readonly(const struct kvm_memory_slot *slot)
> +{
> +	return slot->flags & KVM_MEM_READONLY;
> +}
> +
>  static inline gfn_t
>  hva_to_gfn_memslot(unsigned long hva, struct kvm_memory_slot *slot)
>  {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 38f0f402ea46..3e40acb9f5c0 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2624,11 +2624,6 @@ unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn)
>  	return size;
>  }
>  
> -static bool memslot_is_readonly(const struct kvm_memory_slot *slot)
> -{
> -	return slot->flags & KVM_MEM_READONLY;
> -}
> -
>  static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t gfn,
>  				       gfn_t *nr_pages, bool write)
>  {
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 

