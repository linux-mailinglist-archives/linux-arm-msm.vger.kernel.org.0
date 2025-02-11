Return-Path: <linux-arm-msm+bounces-47616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6080A310EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6168B3A43D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA2B253F01;
	Tue, 11 Feb 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ybIvnESC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE63254B17
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290447; cv=none; b=aNq/tHVJdxToTpGirbQpXCryupOyoxW6YGh2g/1et4+834ffoUKQgGsrhBwAPBLhQDsW0AfRVMxq+EWKMMLYHA04ZyEWtNw26IWrbUQfE6fXBIiUST5yt2MtzdnMhktj/QCNREMYXXwdmE+1E5hAF/LLsPbtrUia/sVkP8nJGIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290447; c=relaxed/simple;
	bh=GNOY8BCumrzagmAj3OJishjytAMcwoo9iQ0kTXTfNxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppzOB1UMxCKvgjDT9XvXfAgPngidUbigrcLBW1JFj49akR1L8K7u8UqpkvP3a7Tmwygy8FhuggghYe/lrcgcs1R9zGm0SbHUjDr2aTg6uvOSZ0K/BGkJJXsV/RKQb89zsai6idE73QZAHPTaGpd4UXWhQWwvCfxDMn71aJ8RGEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ybIvnESC; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47180c199ebso294901cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739290444; x=1739895244; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aoJ0q+XDHgANL8EUDkwEMGibOt7px2JbC70hf9oWDOU=;
        b=ybIvnESCdyGw+KsSqPBa5uX528bjtCEi04FyXeubmqW/kw7SSJtmFVgDZmy3npKLSo
         K712KjKc6al+gbVK4nSJ8jxBOwtfHHUYynatoPMZqShnaqFLqXrdzrUbKo4Qjb56LZhz
         yEwqXvxkyZ7yIYJ7fd4OAl/bVXrxdOGrAlgY43TXGRL2KD/Arq9VEHpwJfedIFyRi4HK
         nMd7j/HvEbmgxAH1xxVLaJOTAep5DGO57/95I0XeU/N9DIK01bKf8uezgfSoL9J8hu7l
         2hzoo+GnjbOFQH5VozF5m/wxu0Ocve1fP3eDxz+B4yeLKE8qQyPLjy40Fflwvl2R36Vn
         awHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290444; x=1739895244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoJ0q+XDHgANL8EUDkwEMGibOt7px2JbC70hf9oWDOU=;
        b=kC2vEag9LELVXX+2GlqX+dSM+sVAoNA0rnLczLD/gsIsLkQwwYz4s/6Jwn6hwum5y5
         TZHXCauFlKTyEyZ00I/FirKGxNdV4unsDzcHUqCGZMWaQNWRzEU9pTMyteUPVqe12uo8
         cTO2Fc1ZoD8wXYvdkqGcsBbdl5Q5o4nMd9pO2OVzsLBpTFv1xcF5082A8oHTlH9sCGXy
         pPAiJwXqnWfw0yYT1FoD26Nflc+ptgVUvGn2kxVbA+sO0GX9IdwmQitGntGqMDWLst34
         5+Le9c6QJRky1gTEXo0wo7t5Ja0kXXSTfcOcUo76XowGATpT07vMOBlPnC87H7+s+5+Q
         TKHw==
X-Forwarded-Encrypted: i=1; AJvYcCXPw4BuVlbbsd7LAbU9zj3GtEtyUKs7+vsPL0hmRlRDK5BSSH3FesuHByIMsvPRsdGNdcl6BtMBnDUiqWv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5RNJUCeJMauprmoCODZDnVXjWod8AJ4QgqyntXUHHxMfHLHgf
	yOquTLl7RPtOCJIHlWsWY7SqBXBsJVBU7FkJ5Rqib4hpAjlRjXcWwWpGug1u8kHaUg0nsqDjt2U
	DfWqHgSJcyw4oW0qR5+zYdx5e0Q498Caie0tN
X-Gm-Gg: ASbGncvqBkkwGT8HkG/z3th0OBU3CRmt0hudNlQeF3sdAdnZnxiCoJjhYtP1HTt9f1/
	jaJbe07zkXiMfeYHiJ+zvSJmRscpuVLW5iFFmYJ8NJnn16YD3IiPoY7kMvslgGralWlXi/Sw=
X-Google-Smtp-Source: AGHT+IH2JocFmeQmVE+8uxEob+8CbsfBF3u0aOITHhvzJlgliVUgm7lzG27OsHhP83psTgTw03Jf4STjLpWaE0RJMnI=
X-Received: by 2002:a05:622a:1802:b0:467:7c30:3446 with SMTP id
 d75a77b69052e-471a410abe6mr3119701cf.25.1739290444336; Tue, 11 Feb 2025
 08:14:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com> <20250211121128.703390-9-tabba@google.com>
 <Z6tzfMW0TdwdAWxT@google.com>
In-Reply-To: <Z6tzfMW0TdwdAWxT@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 11 Feb 2025 16:13:27 +0000
X-Gm-Features: AWEUYZmQhqPKBkPaxPict4Uftyo6wnDk_xJ78YA7yFNPy6bD4Ac-aJJpqTvI0Os
Message-ID: <CA+EHjTy3dmpLGL1kXiqZXh4uA4xOJDeTwffj7u6XyaH3jBU26w@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] KVM: arm64: Handle guest_memfd()-backed guest
 page faults
To: Quentin Perret <qperret@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, keirf@google.com, roypat@amazon.co.uk, 
	shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

On Tue, 11 Feb 2025 at 15:57, Quentin Perret <qperret@google.com> wrote:
>
> Hey Fuad,
>
> On Tuesday 11 Feb 2025 at 12:11:24 (+0000), Fuad Tabba wrote:
> > Add arm64 support for handling guest page faults on guest_memfd
> > backed memslots.
> >
> > For now, the fault granule is restricted to PAGE_SIZE.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c     | 84 ++++++++++++++++++++++++++--------------
> >  include/linux/kvm_host.h |  5 +++
> >  virt/kvm/kvm_main.c      |  5 ---
> >  3 files changed, 61 insertions(+), 33 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index b6c0acb2311c..305060518766 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1454,6 +1454,33 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
> >       return vma->vm_flags & VM_MTE_ALLOWED;
> >  }
> >
> > +static kvm_pfn_t faultin_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> > +                          gfn_t gfn, bool write_fault, bool *writable,
> > +                          struct page **page, bool is_private)
> > +{
> > +     kvm_pfn_t pfn;
> > +     int ret;
> > +
> > +     if (!is_private)
> > +             return __kvm_faultin_pfn(slot, gfn, write_fault ? FOLL_WRITE : 0, writable, page);
> > +
> > +     *writable = false;
> > +
> > +     if (WARN_ON_ONCE(write_fault && memslot_is_readonly(slot)))
> > +             return KVM_PFN_ERR_NOSLOT_MASK;
>
> I believe this check is superfluous, we should decide to report an MMIO
> exit to userspace for write faults to RO memslots and not get anywhere
> near user_mem_abort(). And nit but the error code should probably be
> KVM_PFN_ERR_RO_FAULT or something instead?

I tried to replicate the behavior of __kvm_faultin_pfn() here (but got
the wrong error!). I think you're right though that in the arm64 case,
this check isn't needed. Should I fix the return error and keep the
warning though?

> > +
> > +     ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, page, NULL);
> > +     if (!ret) {
> > +             *writable = write_fault;
>
> In normal KVM, if we're not dirty logging we'll actively map the page as
> writable if both the memslot and the userspace mappings are writable.
> With gmem, the latter doesn't make much sense, but essentially the
> underlying page should really be writable (e.g. no CoW getting in the
> way and such?). If so, then perhaps make this
>
>                 *writable = !memslot_is_readonly(slot);
>
> Wdyt?

Ack.

> > +             return pfn;
> > +     }
> > +
> > +     if (ret == -EHWPOISON)
> > +             return KVM_PFN_ERR_HWPOISON;
> > +
> > +     return KVM_PFN_ERR_NOSLOT_MASK;
> > +}
> > +
> >  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >                         struct kvm_s2_trans *nested,
> >                         struct kvm_memory_slot *memslot, unsigned long hva,
> > @@ -1461,25 +1488,26 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >  {
> >       int ret = 0;
> >       bool write_fault, writable;
> > -     bool exec_fault, mte_allowed;
> > +     bool exec_fault, mte_allowed = false;
> >       bool device = false, vfio_allow_any_uc = false;
> >       unsigned long mmu_seq;
> >       phys_addr_t ipa = fault_ipa;
> >       struct kvm *kvm = vcpu->kvm;
> > -     struct vm_area_struct *vma;
> > +     struct vm_area_struct *vma = NULL;
> >       short vma_shift;
> >       void *memcache;
> > -     gfn_t gfn;
> > +     gfn_t gfn = ipa >> PAGE_SHIFT;
> >       kvm_pfn_t pfn;
> >       bool logging_active = memslot_is_logging(memslot);
> > -     bool force_pte = logging_active || is_protected_kvm_enabled();
> > -     long vma_pagesize, fault_granule;
> > +     bool is_private = kvm_mem_is_private(kvm, gfn);
>
> Just trying to understand the locking rule for the xarray behind this.
> Is it kvm->srcu that protects it for reads here? Something else?

I'm not sure I follow. Which xarray are you referring to?

>
> > +     bool force_pte = logging_active || is_private || is_protected_kvm_enabled();
> > +     long vma_pagesize, fault_granule = PAGE_SIZE;
> >       enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> >       struct kvm_pgtable *pgt;
> >       struct page *page;
> >       enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
> >
> > -     if (fault_is_perm)
> > +     if (fault_is_perm && !is_private)
>
> Nit: not strictly necessary I think.

You're right.

Thanks,
/fuad

> >               fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
> >       write_fault = kvm_is_write_fault(vcpu);
> >       exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> > @@ -1510,24 +1538,30 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >                       return ret;
> >       }
> >
> > +     mmap_read_lock(current->mm);
> > +
> >       /*
> >        * Let's check if we will get back a huge page backed by hugetlbfs, or
> >        * get block mapping for device MMIO region.
> >        */
> > -     mmap_read_lock(current->mm);
> > -     vma = vma_lookup(current->mm, hva);
> > -     if (unlikely(!vma)) {
> > -             kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> > -             mmap_read_unlock(current->mm);
> > -             return -EFAULT;
> > -     }
> > +     if (!is_private) {
> > +             vma = vma_lookup(current->mm, hva);
> > +             if (unlikely(!vma)) {
> > +                     kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> > +                     mmap_read_unlock(current->mm);
> > +                     return -EFAULT;
> > +             }
> >
> > -     /*
> > -      * logging_active is guaranteed to never be true for VM_PFNMAP
> > -      * memslots.
> > -      */
> > -     if (WARN_ON_ONCE(logging_active && (vma->vm_flags & VM_PFNMAP)))
> > -             return -EFAULT;
> > +             /*
> > +              * logging_active is guaranteed to never be true for VM_PFNMAP
> > +              * memslots.
> > +              */
> > +             if (WARN_ON_ONCE(logging_active && (vma->vm_flags & VM_PFNMAP)))
> > +                     return -EFAULT;
> > +
> > +             vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> > +             mte_allowed = kvm_vma_mte_allowed(vma);
> > +     }
> >
> >       if (force_pte)
> >               vma_shift = PAGE_SHIFT;
> > @@ -1597,18 +1631,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >               ipa &= ~(vma_pagesize - 1);
> >       }
> >
> > -     gfn = ipa >> PAGE_SHIFT;
> > -     mte_allowed = kvm_vma_mte_allowed(vma);
> > -
> > -     vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> > -
> >       /* Don't use the VMA after the unlock -- it may have vanished */
> >       vma = NULL;
> >
> >       /*
> >        * Read mmu_invalidate_seq so that KVM can detect if the results of
> > -      * vma_lookup() or __kvm_faultin_pfn() become stale prior to
> > -      * acquiring kvm->mmu_lock.
> > +      * vma_lookup() or faultin_pfn() become stale prior to acquiring
> > +      * kvm->mmu_lock.
> >        *
> >        * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
> >        * with the smp_wmb() in kvm_mmu_invalidate_end().
> > @@ -1616,8 +1645,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >       mmu_seq = vcpu->kvm->mmu_invalidate_seq;
> >       mmap_read_unlock(current->mm);
> >
> > -     pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
> > -                             &writable, &page);
> > +     pfn = faultin_pfn(kvm, memslot, gfn, write_fault, &writable, &page, is_private);
> >       if (pfn == KVM_PFN_ERR_HWPOISON) {
> >               kvm_send_hwpoison_signal(hva, vma_shift);
> >               return 0;
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 39fd6e35c723..415c6274aede 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1882,6 +1882,11 @@ static inline int memslot_id(struct kvm *kvm, gfn_t gfn)
> >       return gfn_to_memslot(kvm, gfn)->id;
> >  }
> >
> > +static inline bool memslot_is_readonly(const struct kvm_memory_slot *slot)
> > +{
> > +     return slot->flags & KVM_MEM_READONLY;
> > +}
> > +
> >  static inline gfn_t
> >  hva_to_gfn_memslot(unsigned long hva, struct kvm_memory_slot *slot)
> >  {
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 38f0f402ea46..3e40acb9f5c0 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -2624,11 +2624,6 @@ unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn)
> >       return size;
> >  }
> >
> > -static bool memslot_is_readonly(const struct kvm_memory_slot *slot)
> > -{
> > -     return slot->flags & KVM_MEM_READONLY;
> > -}
> > -
> >  static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t gfn,
> >                                      gfn_t *nr_pages, bool write)
> >  {
> > --
> > 2.48.1.502.g6dc24dfdaf-goog
> >

