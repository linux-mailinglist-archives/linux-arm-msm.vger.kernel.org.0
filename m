Return-Path: <linux-arm-msm+bounces-57803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D5AB6439
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 09:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F141F188E91F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F2821421F;
	Wed, 14 May 2025 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nqoNyYTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080EC210F53
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207482; cv=none; b=nV3dnVYpQktQGQNuvOEfokIYp5Gu4MWK6GlSQpTNk2tu1ufNi6yoMTHEEZUalOvmCDis4mMh+YbWBbtycsaV+A/qm+zC1sy/0J16/MaklU7AY48y/0V5xzCLBiSPIKWt+jX4nEpYKvWiBpr6Ne1fQox6DPWmk28yLZjsdUt2ltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207482; c=relaxed/simple;
	bh=6uP9Y1WkFCIidgPy85S0jVj8vcdurA95cSfBco8pnHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXWKAnS8hWEjALRcA7GQ26jRH3SUVlki22pZKvBp+OKjJfEfdnDsTDt7M04tLvYfqa5HKoz/HjW6JxWoJeMMtOS2W+UHmCPEtXIZPnaHHykj+DVZ1VxJtliuFdFO1Vp0IPdoH2UjflZ8B1Aja5TotfWlXg+BkWROBk+uBcirLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nqoNyYTk; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47e9fea29easo182141cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747207479; x=1747812279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bN3Eodoo37ShWz602VRjXde2B/Ybw21z1k3P5mHUYPI=;
        b=nqoNyYTkMat1k53114B4w8FRf0KaE7BifhaK99ckwG91OM/pUW1wcgxIUFVzjFFyNw
         QnvDTH0+sAMQt6Dmsj5MeKK0gBEl4hjNR8RvpmTxoOOX4v6TVSVHxZv3JRSW5mAcPsE9
         S/kVRapPN1WGbNiPwPxYtPa7iD+HkJT88kQh2a1B1t4WJX2mDCeJTD/cLFJGqyqaOY1C
         GtPyq6mpBKpI4k3l3xBF/Y7lPmEIDfS+ni4Grr+X9xuqpGDrGT66z1WKSWbymqkoRheD
         WRhHwCnftV43KGXQ4v5gBLW4a1v4w5rNVxxGLwougq7UFFfNOm2XjEKuYhKkcUamBKRv
         QNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207479; x=1747812279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN3Eodoo37ShWz602VRjXde2B/Ybw21z1k3P5mHUYPI=;
        b=BBNbbp5RbiS90twT7xsiNZ/wDVEq87z9GdAs1F1EL5vNp78cqZS5JOXdEBBaEboYz9
         7EgvVbTVZ9iSfUegsJN60CnZjMHLsL5f26L3Aup5fbOK5a4eVU+uF2K+/CyXC9wlOa8c
         Si+mMpjjFqa96TvuX+aDv/KUPnI4UXpXIghBMBg6GyMYVKBmhuzO01rjdcY7myiXLSX6
         28NF2g5Cj9AVJu15tbGT6DaJBsLUFR+AghCTWZ00MrqFCEsBUGiC8cRfh3kJE3z31IqR
         WTV4rlKti7IZpXh97WXU79CR0my8pv0XofQEyt/KgW+fWBbGtZlTbxkdCge9xkZe6VcS
         TK6g==
X-Forwarded-Encrypted: i=1; AJvYcCWjtRIEpJ7fUNoBUJ49va/vHC7tg6xg5zZcpK1RoW6O6Otq+0gV6ya6UH4blzjKFdBE5QRBLNal/OkmX/5D@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUiWxTK8t1bZAIkjz5+yl+dDvLJB6rRgcuS2P6SPkbGk8nIEZ
	oWXGxSCLlz2HALJBaay9BLGWpSjTW8lYgphqaelnMZiUsu8fQ2ZCDo4FnVHMtpI/CdNX1Ca3r0S
	Qglg1DaUy+PU+rZq5UZPn2+hMzeIU4sEv9VghmwF2
X-Gm-Gg: ASbGncuEjX0zdzNCRrLIbATG9KnuQ8QPZ3Sq5/4hzHJX5vtOm7G8vRHpXmDsNdq49zV
	TAg1Xi1F5kFqIqCOoT8yiiUjjseKL6CTl9rFCzAby2UF/DgZQaLZtCRTKTOvHgT8ktECRyxFirU
	U8YnJLwoCSd8wdbMQsNW7hbJz1kZsibZkSG5YTjHMlA5/7
X-Google-Smtp-Source: AGHT+IFSsKgCXRHVTQLY8MCZjK1IHQy5+L1VXEWxUrH8Ed9FEGdOVIVsU1XNqaM8wxkdXQMIAtP0/QQ+yQvSp05EMz8=
X-Received: by 2002:a05:622a:181f:b0:47d:4e8a:97ef with SMTP id
 d75a77b69052e-49496cddc53mr1688181cf.1.1747207478417; Wed, 14 May 2025
 00:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-11-tabba@google.com>
 <55215c60-f071-474b-a0d5-06f27bc97d32@amd.com>
In-Reply-To: <55215c60-f071-474b-a0d5-06f27bc97d32@amd.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 14 May 2025 08:24:01 +0100
X-Gm-Features: AX0GCFs_MeHq9AaII05Iub_BF1mqk5thKbzo61ouX2u1qDGHF-RKWUHX1ULEcOk
Message-ID: <CA+EHjTwc9d6QJykgp5CuBga7JMzzTpaJOhB+5RoqvrRg2kgbbA@mail.gmail.com>
Subject: Re: [PATCH v9 10/17] KVM: x86: Compute max_mapping_level with input
 from guest_memfd
To: Shivank Garg <shivankg@amd.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
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
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 08:14, Shivank Garg <shivankg@amd.com> wrote:
>
> On 5/13/2025 10:04 PM, Fuad Tabba wrote:
> > From: Ackerley Tng <ackerleytng@google.com>
> >
> > This patch adds kvm_gmem_max_mapping_level(), which always returns
> > PG_LEVEL_4K since guest_memfd only supports 4K pages for now.
> >
> > When guest_memfd supports shared memory, max_mapping_level (especially
> > when recovering huge pages - see call to __kvm_mmu_max_mapping_level()
> > from recover_huge_pages_range()) should take input from
> > guest_memfd.
> >
> > Input from guest_memfd should be taken in these cases:
> >
> > + if the memslot supports shared memory (guest_memfd is used for
> >   shared memory, or in future both shared and private memory) or
> > + if the memslot is only used for private memory and that gfn is
> >   private.
> >
> > If the memslot doesn't use guest_memfd, figure out the
> > max_mapping_level using the host page tables like before.
> >
> > This patch also refactors and inlines the other call to
> > __kvm_mmu_max_mapping_level().
> >
> > In kvm_mmu_hugepage_adjust(), guest_memfd's input is already
> > provided (if applicable) in fault->max_level. Hence, there is no need
> > to query guest_memfd.
> >
> > lpage_info is queried like before, and then if the fault is not from
> > guest_memfd, adjust fault->req_level based on input from host page
> > tables.
> >
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c   | 92 ++++++++++++++++++++++++++--------------
> >  include/linux/kvm_host.h |  7 +++
> >  virt/kvm/guest_memfd.c   | 12 ++++++
> >  3 files changed, 79 insertions(+), 32 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index cfbb471f7c70..9e0bc8114859 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -3256,12 +3256,11 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
> >       return level;
> >  }
> >
> > -static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> > -                                    const struct kvm_memory_slot *slot,
> > -                                    gfn_t gfn, int max_level, bool is_private)
> > +static int kvm_lpage_info_max_mapping_level(struct kvm *kvm,
> > +                                         const struct kvm_memory_slot *slot,
> > +                                         gfn_t gfn, int max_level)
> >  {
> >       struct kvm_lpage_info *linfo;
> > -     int host_level;
> >
> >       max_level = min(max_level, max_huge_page_level);
> >       for ( ; max_level > PG_LEVEL_4K; max_level--) {
> > @@ -3270,23 +3269,61 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> >                       break;
> >       }
> >
> > -     if (is_private)
> > -             return max_level;
> > +     return max_level;
> > +}
> > +
> > +static inline u8 kvm_max_level_for_order(int order)
> > +{
> > +     BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> > +
> > +     KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> > +                     order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> > +                     order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> > +
> > +     if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> > +             return PG_LEVEL_1G;
> > +
> > +     if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> > +             return PG_LEVEL_2M;
> > +
> > +     return PG_LEVEL_4K;
> > +}
> > +
> > +static inline int kvm_gmem_max_mapping_level(const struct kvm_memory_slot *slot,
> > +                                          gfn_t gfn, int max_level)
> > +{
> > +     int max_order;
> >
> >       if (max_level == PG_LEVEL_4K)
> >               return PG_LEVEL_4K;
> >
> > -     host_level = host_pfn_mapping_level(kvm, gfn, slot);
> > -     return min(host_level, max_level);
> > +     max_order = kvm_gmem_mapping_order(slot, gfn);
> > +     return min(max_level, kvm_max_level_for_order(max_order));
> >  }
> >
> >  int kvm_mmu_max_mapping_level(struct kvm *kvm,
> >                             const struct kvm_memory_slot *slot, gfn_t gfn)
> >  {
> > -     bool is_private = kvm_slot_has_gmem(slot) &&
> > -                       kvm_mem_is_private(kvm, gfn);
> > +     int max_level;
> > +
> > +     max_level = kvm_lpage_info_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM);
> > +     if (max_level == PG_LEVEL_4K)
> > +             return PG_LEVEL_4K;
> >
> > -     return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
> > +     if (kvm_slot_has_gmem(slot) &&
> > +         (kvm_gmem_memslot_supports_shared(slot) ||
> > +          kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> > +             return kvm_gmem_max_mapping_level(slot, gfn, max_level);
> > +     }
> > +
> > +     return min(max_level, host_pfn_mapping_level(kvm, gfn, slot));
> > +}
> > +
> > +static inline bool fault_from_gmem(struct kvm_page_fault *fault)
> > +{
> > +     return fault->is_private ||
> > +            (kvm_slot_has_gmem(fault->slot) &&
> > +             kvm_gmem_memslot_supports_shared(fault->slot));
> >  }
> >
> >  void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > @@ -3309,12 +3346,20 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> >        * Enforce the iTLB multihit workaround after capturing the requested
> >        * level, which will be used to do precise, accurate accounting.
> >        */
> > -     fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> > -                                                    fault->gfn, fault->max_level,
> > -                                                    fault->is_private);
> > +     fault->req_level = kvm_lpage_info_max_mapping_level(vcpu->kvm, slot,
> > +                                                         fault->gfn, fault->max_level);
> >       if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
> >               return;
> >
> > +     if (!fault_from_gmem(fault)) {
> > +             int host_level;
> > +
> > +             host_level = host_pfn_mapping_level(vcpu->kvm, fault->gfn, slot);
> > +             fault->req_level = min(fault->req_level, host_level);
> > +             if (fault->req_level == PG_LEVEL_4K)
> > +                     return;
> > +     }
> > +
> >       /*
> >        * mmu_invalidate_retry() was successful and mmu_lock is held, so
> >        * the pmd can't be split from under us.
> > @@ -4448,23 +4493,6 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
> >               vcpu->stat.pf_fixed++;
> >  }
> >
> > -static inline u8 kvm_max_level_for_order(int order)
> > -{
> > -     BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> > -
> > -     KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> > -                     order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> > -                     order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> > -
> > -     if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> > -             return PG_LEVEL_1G;
> > -
> > -     if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> > -             return PG_LEVEL_2M;
> > -
> > -     return PG_LEVEL_4K;
> > -}
> > -
> >  static u8 kvm_max_level_for_fault_and_order(struct kvm *kvm,
> >                                           struct kvm_page_fault *fault,
> >                                           int order)
> > @@ -4523,7 +4551,7 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
> >  {
> >       unsigned int foll = fault->write ? FOLL_WRITE : 0;
> >
> > -     if (fault->is_private || kvm_gmem_memslot_supports_shared(fault->slot))
> > +     if (fault_from_gmem(fault))
> >               return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
> >
> >       foll |= FOLL_NOWAIT;
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index de7b46ee1762..f9bb025327c3 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2560,6 +2560,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >                    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
> >                    int *max_order);
> > +int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot, gfn_t gfn);
> >  #else
> >  static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> >                                  struct kvm_memory_slot *slot, gfn_t gfn,
> > @@ -2569,6 +2570,12 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> >       KVM_BUG_ON(1, kvm);
> >       return -EIO;
> >  }
> > +static inline int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot,
> > +                                      gfn_t gfn)
> > +{
> > +     BUG();
> > +     return 0;
> > +}
> >  #endif /* CONFIG_KVM_GMEM */
> >
> >  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index fe0245335c96..b8e247063b20 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -774,6 +774,18 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
> >
> > +/**
> > + * Returns the mapping order for this @gfn in @slot.
> > + *
> > + * This is equal to max_order that would be returned if kvm_gmem_get_pfn() were
> > + * called now.
> > + */
> make W=1 ./ -s generates following warnings-
>
> warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Returns the mapping order for this @gfn in @slot
>
> This will fix it.

Thank you!
/fuad

> Subject: [PATCH] tmp
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  virt/kvm/guest_memfd.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b8e247063b20..d880b9098cc0 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -775,10 +775,12 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
>
>  /**
> - * Returns the mapping order for this @gfn in @slot.
> + * kvm_gmem_mapping_order - Get the mapping order for a GFN.
> + * @slot: The KVM memory slot containing the @gfn.
> + * @gfn: The guest frame number to check.
>   *
> - * This is equal to max_order that would be returned if kvm_gmem_get_pfn() were
> - * called now.
> + * Returns: The mapping order for a @gfn in @slot. This is equal to max_order
> + *          that kvm_gmem_get_pfn() would return for this @gfn.
>   */
>  int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot, gfn_t gfn)
>  {
> --
> 2.34.1
>
> Thanks,
> Shivank
>
>
> > +int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot, gfn_t gfn)
> > +{
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(kvm_gmem_mapping_order);
> > +
> >  #ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
> >  long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long npages,
> >                      kvm_gmem_populate_cb post_populate, void *opaque)
>

