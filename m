Return-Path: <linux-arm-msm+bounces-51465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3AA619C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 19:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E40133A78D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AEB13A26D;
	Fri, 14 Mar 2025 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FN/oBLGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D82F3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741978022; cv=none; b=Q5/dzS/nG/BfkdGRUy3K+HrrQKbEa/DEo7Q0zSFnjrVjy1vnR6AE/r4OmX0zxiAb5RhB1StRg/pYBIst13gr5LGH4rVr21sPd/56iCyUJhvOAc/24rW3RMMG6T55TvSlTs4XXv2Ul/nqfgAeAakA8LvAeP5loK+cNc/cyhfxnc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741978022; c=relaxed/simple;
	bh=AgbQKLqFLJAfqdpZRBFIBDOuKoYd51gzvN+7n5heP+w=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Hev2OdUwuDlSMlAXA15fayOKWoL+v+fPO2QpPj8hY/qkr5hp5k8MkwIRgN0C5mLZqQdr1eo4J4rqbR1sR1RxTpyPbb7wO3sPmR6X8ZZYRWo75uwbtVgktb7NPgbPF07qCV9VjwLRkxLwvjahbsyhNfWzNW4RgxUJXbfbnyjhvrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FN/oBLGA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff68033070so48227a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 11:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741978020; x=1742582820; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8BSRuYn8KeNNKWnEiWpWmj0CAZVyouloPrj65g6XRA=;
        b=FN/oBLGAHCphYq4fHlNxJAjJJCtWRoiVGkC/k5jLqIG2lyze/JiJWlbz7cFxHcAvkp
         zytc/JdY/71gyYdKMXway87OWJ5x221QqNJrGZYoyYBP45mRgkhMyRhhpWHU+xNSsZCC
         v/6ljeasLvGjYj2SEoWmKuzX4RHMDTR+y/KGDZA8figQ08MUOY0S4vfUZ2xctK3r0rfX
         ++9YxVE9hfwLl2cHM00USnjOscuG0kbSuhXG1bdqEvMTYPoGJEani5vqs6BWHtsfAqma
         urETYFTB/ju2CS92UyGDN9MfZtWHOE4hnYPXUla+I7UPM7rPiscaRs3AGi4VLIzU41uS
         NG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741978020; x=1742582820;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8BSRuYn8KeNNKWnEiWpWmj0CAZVyouloPrj65g6XRA=;
        b=ER06xxdQj8T3UfoH8lTxgBrOuK0rdWr443bjTL5Sq4J8w9Hd8tPEGN92qiywRZr0CW
         kfsAyvfpkPGVPAt25E14e5pIAvXd/phDVgkVFQFtmgI/2Mjt6sBs1yUUWiWLEVjaPv+T
         D57sl2ANjFXq60BU5fZSWR6JA4JTgxMswV2SolZ7fKsCCAnxoEXSs2n9D4VLbCU4XlX2
         GOYTAp8c91azJPjU6z5lNGdkxFzaZ74aZoIl1nZCT3MNe13AjoBvXVruQPI40B221Xnj
         9PXIY6TBV+IpxQnSleIP6/II9VmNyLM6ZkV9aL9aueyHoUDmr/WVabVOLw8q5wsBksUm
         5jKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiFyqIESGRqlhfdA/aDoI3tSfPyHWUwUqcZs1RiPBg4aIGjCzUIFYpXK5wzBib7Wgw9pqq3Gu/rps74zU2@vger.kernel.org
X-Gm-Message-State: AOJu0YweXd8sxJFt6OPUaDhEumMlm2k/zOe5z3sp8cktJGfJpDBZfUeV
	qYWGNM7w64H2ajHkMLIXfL2fE+igtVZyx9wu0PpOA72JPJBnthQ68hBw+XMPzuvmJaxf9zfqkKM
	tOfYTV3VvdeouV0GF/Oangw==
X-Google-Smtp-Source: AGHT+IFnOUHozyBvrEzVKU15S1zj0eWgSlNFNHQ78f1k2qNDSePcqu/68jFbMHYM2FfRGrD7HcNv9AiHGbMehyTTNw==
X-Received: from pjwx4.prod.google.com ([2002:a17:90a:c2c4:b0:2f5:63a:4513])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3a08:b0:2fe:8217:2da6 with SMTP id 98e67ed59e1d1-30151d9d6eemr3990810a91.22.1741978020486;
 Fri, 14 Mar 2025 11:47:00 -0700 (PDT)
Date: Fri, 14 Mar 2025 18:46:58 +0000
In-Reply-To: <20250312175824.1809636-5-tabba@google.com> (message from Fuad
 Tabba on Wed, 12 Mar 2025 17:58:17 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzplijjvq5.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v6 04/10] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> Add support for mmap() and fault() for guest_memfd backed memory
> in the host for VMs that support in-place conversion between
> shared and private. To that end, this patch adds the ability to
> check whether the VM type supports in-place conversion, and only
> allows mapping its memory if that's the case.
>
> Also add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> indicates that the VM supports shared memory in guest_memfd, or
> that the host can create VMs that support shared memory.
> Supporting shared memory implies that memory can be mapped when
> shared with the host.
>
> This is controlled by the KVM_GMEM_SHARED_MEM configuration
> option.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  include/linux/kvm_host.h |  11 +++++
>  include/uapi/linux/kvm.h |   1 +
>  virt/kvm/guest_memfd.c   | 102 +++++++++++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c      |   4 ++
>  4 files changed, 118 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3ad0719bfc4f..601bbcaa5e41 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -728,6 +728,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>  }
>  #endif
>  
> +/*
> + * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
> + * private memory is enabled and it supports in-place shared/private conversion.
> + */
> +#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM)
> +static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
> +{
> +	return false;
> +}
> +#endif
> +
>  #ifndef kvm_arch_has_readonly_mem
>  static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>  {
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 45e6d8fca9b9..117937a895da 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -929,6 +929,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_PRE_FAULT_MEMORY 236
>  #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>  #define KVM_CAP_X86_GUEST_MODE 238
> +#define KVM_CAP_GMEM_SHARED_MEM 239
>  
>  struct kvm_irq_routing_irqchip {
>  	__u32 irqchip;
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 5fc414becae5..eea44e003ed1 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -320,7 +320,109 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>  	return gfn - slot->base_gfn + slot->gmem.pgoff;
>  }
>  
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +static bool folio_offset_is_shared(const struct folio *folio, struct file *file, pgoff_t index)
> +{
> +	struct kvm_gmem *gmem = file->private_data;
> +
> +	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);

I should've commented on this in the last series, but why must folio
lock be held to check if this offset is shared?

I was thinking to use the filemap's lock (filemap_invalidate_lock()) to
guard mappability races. Does that work too?

> +
> +	/* For now, VMs that support shared memory share all their memory. */
> +	return kvm_arch_gmem_supports_shared_mem(gmem->kvm);
> +}
> +
> +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> +{
> +	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	struct folio *folio;
> +	vm_fault_t ret = VM_FAULT_LOCKED;
> +
> +	filemap_invalidate_lock_shared(inode->i_mapping);
> +
> +	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> +	if (IS_ERR(folio)) {
> +		int err = PTR_ERR(folio);
> +
> +		if (err == -EAGAIN)
> +			ret = VM_FAULT_RETRY;
> +		else
> +			ret = vmf_error(err);
> +
> +		goto out_filemap;
> +	}
> +
> +	if (folio_test_hwpoison(folio)) {
> +		ret = VM_FAULT_HWPOISON;
> +		goto out_folio;
> +	}
> +
> +	if (!folio_offset_is_shared(folio, vmf->vma->vm_file, vmf->pgoff)) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_folio;
> +	}
> +
> +	/*
> +	 * Shared folios would not be marked as "guestmem" so far, and we only
> +	 * expect shared folios at this point.
> +	 */
> +	if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_folio;
> +	}
> +
> +	/* No support for huge pages. */
> +	if (WARN_ON_ONCE(folio_test_large(folio))) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_folio;
> +	}
> +
> +	if (!folio_test_uptodate(folio)) {
> +		clear_highpage(folio_page(folio, 0));
> +		kvm_gmem_mark_prepared(folio);
> +	}
> +
> +	vmf->page = folio_file_page(folio, vmf->pgoff);
> +
> +out_folio:
> +	if (ret != VM_FAULT_LOCKED) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +	}
> +
> +out_filemap:
> +	filemap_invalidate_unlock_shared(inode->i_mapping);
> +
> +	return ret;
> +}
> +
> <snip>

