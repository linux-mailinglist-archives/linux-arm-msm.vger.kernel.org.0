Return-Path: <linux-arm-msm+bounces-61274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31840AD96D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 23:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECDD3BF8F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A3D25DD12;
	Fri, 13 Jun 2025 21:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ehvl6d5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987CB25B1C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 21:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848595; cv=none; b=fG+0DI45JXd+YmHnOflKwc/vXbmuXisCKn/WFEBKEMLaHsll6by5g+CuxrHimRwwG3ZT0YKTjke4ke2qcysh/Kl3PitwQCdZ2gvs1a7+nf6h2nqfsNoC6LdjjAlKWK9rUkQw98OQpR6i1avSmWkdcmGA5qAxq9Ahwj033nN4CIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848595; c=relaxed/simple;
	bh=lT7Zcp8p6wA3KAogKquAqZSGA7HSCm6dNohixcuq6/I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S0gzgpunWN63cPBggPl2VyaVzXbra7XvIigaj4KWMHfp6dlh8E7CTpMHjyRctns2+HbLBkRRuwX0rGfwEHzZXHQKUBnoE2ckJDwPJXt9Ik18qQif4Bxh15J/xZ98Y5Y7ImF8dRl29zLhegsbfiHj9mmUgp6YDStseSMcigf47L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ehvl6d5W; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fa1a84565so1558940a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749848593; x=1750453393; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Wch+x3uNF1XdTWEOPRulvN+JzipLoRE2aMsLqF+rU=;
        b=ehvl6d5W2/oZIW6V/ezMJYg81ZPJt/W8lYcv8GHnzutzT1Ee4H0zu6udFrZxbALpiW
         PhbpCX/dl28T9GtymTuA687Yl3uNJZOtZk2/c5tbP9beV2jz3hafZpFjCOyUl3WBBW7x
         K54qFPET3gwVyzWHemYrwxWP/ecE04x34QJ0dMeIs3xl2USxqjJsS46MSz+Crs0EWN2G
         Olq1HfBpsSMS8Vate17vA07Vm6ZJTWNkiHgcdF0za4Zc6boCIpMxaT866orj9X18deUQ
         xElrr5AOsF+2OIMK2EamiBqV3M/iIDdG99XqbJr2U+510RDdCwUc6EPWWB4DMgdgQpDX
         HPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848593; x=1750453393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Wch+x3uNF1XdTWEOPRulvN+JzipLoRE2aMsLqF+rU=;
        b=YBRIFdhEns9GBEAJw60KFyMCfDQZqsqwh7wSkNPmdifkOnvt3EVFA8LIMppQTi0k0A
         +rzPGMUz5C7BwVqGLdEdxZ06o734irXq2u4X2zcB432E7FHhk0F7qI5KbXVXdUd66pJz
         BeYAPAfAADhpjQqQlgWrNAHVNo0I8L8osVB52tqXaxUCRpz0vwMds2mNqCC5GgmxotAk
         DoJDdR37WIRhvT5Rwbt2XZSOUSAdzj75WpWczs+2i60CzrxXcOhTQPHyDrIjlgnwBYYi
         6UXVzfHKH/JJqaWzwdScXq0yoHTamEbfL+qIW3k4i/6l1idSx/rdrbUlnEe4J8695Z+k
         beBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNj+v/AIhPArKOcSyjIJfDp4UI+BVZDXzOUnVD8zIXrJOdVs3kyU4HQeUM68EEpYLU8ZkwPJBZKqG/tR49@vger.kernel.org
X-Gm-Message-State: AOJu0YysqAa3Jt/ZbSevBjWIPZW+j/0DhNu6OCqz1CT02M8N/c0NCF3Z
	ZX3janMS+Na3k478Q5niFVnDp+Yp5Yn+J+NWdC1KXKSDdvBY38fmmRRIFM/s2+3ikkG2dwEGqfL
	hOpfv6w==
X-Google-Smtp-Source: AGHT+IFCqUrg4V9bdDrybRc7q8t0EQEaXYwnc3flICr7EMgc9UCftl1VaSgXOwrdPngPPXCTz+jIrKW0iLY=
X-Received: from pfbch3.prod.google.com ([2002:a05:6a00:2883:b0:746:22b3:4c0d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a48:b0:1f3:2e85:c052
 with SMTP id adf61e73a8af0-21fbd634e55mr1185002637.35.1749848592921; Fri, 13
 Jun 2025 14:03:12 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:03:11 -0700
In-Reply-To: <20250611133330.1514028-9-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <20250611133330.1514028-9-tabba@google.com>
Message-ID: <aEySD5XoxKbkcuEZ@google.com>
Subject: Re: [PATCH v12 08/18] KVM: guest_memfd: Allow host to map guest_memfd pages
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 11, 2025, Fuad Tabba wrote:
> This patch enables support for shared memory in guest_memfd, including

Please don't lead with with "This patch", simply state what changes are being
made as a command.

> mapping that memory from host userspace.

> This functionality is gated by the KVM_GMEM_SHARED_MEM Kconfig option,
> and enabled for a given instance by the GUEST_MEMFD_FLAG_SUPPORT_SHARED
> flag at creation time.

Why?  I can see that from the patch.

This changelog is way, way, waaay too light on details.  Sorry for jumping in at
the 11th hour, but we've spent what, 2 years working on this? 

> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index d00b85cb168c..cb19150fd595 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1570,6 +1570,7 @@ struct kvm_memory_attributes {
>  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>  
>  #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
> +#define GUEST_MEMFD_FLAG_SUPPORT_SHARED	(1ULL << 0)

I find the SUPPORT_SHARED terminology to be super confusing.  I had to dig quite
deep to undesrtand that "support shared" actually mean "userspace explicitly
enable sharing on _this_ guest_memfd instance".  E.g. I was surprised to see

IMO, GUEST_MEMFD_FLAG_SHAREABLE would be more appropriate.  But even that is
weird to me.  For non-CoCo VMs, there is no concept of shared vs. private.  What's
novel and notable is that the memory is _mappable_.  Yeah, yeah, pKVM's use case
is to share memory, but that's a _use case_, not the property of guest_memfd that
is being controlled by userspace.

And kvm_gmem_memslot_supports_shared() is even worse.  It's simply that the
memslot is bound to a mappable guest_memfd instance, it's that the guest_memfd
instance is the _only_ entry point to the memslot.

So my vote would be "GUEST_MEMFD_FLAG_MAPPABLE", and then something like
KVM_MEMSLOT_GUEST_MEMFD_ONLY.  That will make code like this:

	if (kvm_slot_has_gmem(slot) &&
	    (kvm_gmem_memslot_supports_shared(slot) ||
	     kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
		return kvm_gmem_max_mapping_level(slot, gfn, max_level);
	}

much more intutive:

	if (kvm_is_memslot_gmem_only(slot) ||
	    kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE))
		return kvm_gmem_max_mapping_level(slot, gfn, max_level);

And then have kvm_gmem_mapping_order() do:

	WARN_ON_ONCE(!kvm_slot_has_gmem(slot));
	return 0;

>  struct kvm_create_guest_memfd {
>  	__u64 size;
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 559c93ad90be..e90884f74404 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -128,3 +128,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
>  config HAVE_KVM_ARCH_GMEM_INVALIDATE
>         bool
>         depends on KVM_GMEM
> +
> +config KVM_GMEM_SHARED_MEM
> +       select KVM_GMEM
> +       bool
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 6db515833f61..06616b6b493b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -312,7 +312,77 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>  	return gfn - slot->base_gfn + slot->gmem.pgoff;
>  }
>  
> +static bool kvm_gmem_supports_shared(struct inode *inode)
> +{
> +	const u64 flags = (u64)inode->i_private;
> +
> +	if (!IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
> +		return false;
> +
> +	return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> +}
> +
> +static vm_fault_t kvm_gmem_fault_shared(struct vm_fault *vmf)

And to my point about "shared", this is also very confusing, because there are
zero checks in here about shared vs. private.

> +{
> +	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	struct folio *folio;
> +	vm_fault_t ret = VM_FAULT_LOCKED;
> +
> +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> +		return VM_FAULT_SIGBUS;
> +
> +	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> +	if (IS_ERR(folio)) {
> +		int err = PTR_ERR(folio);
> +
> +		if (err == -EAGAIN)
> +			return VM_FAULT_RETRY;
> +
> +		return vmf_error(err);
> +	}
> +
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
> +	return ret;
> +}
> +
> +static const struct vm_operations_struct kvm_gmem_vm_ops = {
> +	.fault = kvm_gmem_fault_shared,
> +};
> +
> +static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	if (!kvm_gmem_supports_shared(file_inode(file)))
> +		return -ENODEV;
> +
> +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=
> +	    (VM_SHARED | VM_MAYSHARE)) {

And the SHARED terminology gets really confusing here, due to colliding with the
existing notion of SHARED file mappings.

> +		return -EINVAL;
> +	}
> +
> +	vma->vm_ops = &kvm_gmem_vm_ops;
> +
> +	return 0;
> +}
> +
>  static struct file_operations kvm_gmem_fops = {
> +	.mmap		= kvm_gmem_mmap,
>  	.open		= generic_file_open,
>  	.release	= kvm_gmem_release,
>  	.fallocate	= kvm_gmem_fallocate,
> @@ -463,6 +533,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  	u64 flags = args->flags;
>  	u64 valid_flags = 0;
>  
> +	if (kvm_arch_supports_gmem_shared_mem(kvm))
> +		valid_flags |= GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> +
>  	if (flags & ~valid_flags)
>  		return -EINVAL;
>  
> -- 
> 2.50.0.rc0.642.g800a2b2222-goog
> 

