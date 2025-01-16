Return-Path: <linux-arm-msm+bounces-45290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F8A13D84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 16:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97679161E84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E44722BAAD;
	Thu, 16 Jan 2025 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s8IfgWo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2DC22B8CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737040643; cv=none; b=HWQuPUUXOciB59+t+bhpwgIUCOFIG7YA+wsTNxOJmFLjZN6hRYXttJejapjWbEd4c6J2BE47rjnan5cMKBUx+LXVtxrF5d9XBPWYmlhwMKF99SLk5/V6GmFUxXoC0KPvyYThL33zOfuo8yiJtJMF44oH3VPt5IP0huu/S/a3SDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737040643; c=relaxed/simple;
	bh=Hx1X+lrZTvcioCfyydb4h2gHt5QRPj15apOSr5TJtsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpO5OPtCGjpXjgiHBNJI4j976Z2Je+j/opfwMPj6vHVq/GeWvrHV4wU668nN05JNgqp8C9GQ2R1jbSzqUkB9pAq+ruYIPdoHxiQQNe5ZACpeHCs+kE2ryXx55ZEK/u6NJV22F6BsVbUGwQhSxJbBnTvVSL583rh9UooidvQV4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s8IfgWo+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso47905e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737040638; x=1737645438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pwaNTbOXMKkPxQLJFe431ZnDyCQwmIS9FL0eLIesENM=;
        b=s8IfgWo+18BBg44roVLX/xYodHGQp+Zn2ZpdnCR2RsdEy5sGi1GCO7Ny14O3o9OHxZ
         evbGAwmNmnoubHtcOu+JEtLC816eolXXLnQSA/vviQhHN3Pd243jtA9/52rVhyu2dORk
         Nte3Ma1zIBYMXKgnLPkRYxq8bK9XZA8eMOcgErcU3ky+R9QhH8VG3w5p4HAF16rm8fEt
         U7Q/zlDaqeXcxh/ZhJZ/KsOyQyrg5i/RhOTJXbc+b+BtyjsnHVV4DCzlIEvrTYB5s62G
         lVktK96wMq+3RSPEzQEMlZhdezqGFB1gL8gWDmEvRhCRTratxHYsbUrvV/pNdeQl4vFb
         JS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737040638; x=1737645438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwaNTbOXMKkPxQLJFe431ZnDyCQwmIS9FL0eLIesENM=;
        b=RqvEu+4bQ4QYRGS6BQ3jq/vHEKQ792RsR2ga2gHyzL7UOoDC7KksSuwsSj2JEdf2VZ
         g2f9UjPoFgfZEuSRE5MBVHjmT8Xh3SaEnPEHGtB3Rpld1k9b0MkloA+ZF+C3BxXAtBWA
         IxL5c2upDhASlq30cNfrSQXICtiqJlPHQPP0qFW33NnB2BTPfpydOpFgTFIMR5tCncMN
         zXSfofILdqMuVeuT7BssH17HvCkn+T/+lAdtEYmlq+gpoH5oQpdJUPJQ8vxpovvZ5dfq
         8PdscAgb8mF33utLZ/Zwu/gp2Od9OT3g0YbJJ9oZYNgzhx6yij07mZFTpIVFYPDhXWLz
         nOkw==
X-Forwarded-Encrypted: i=1; AJvYcCUgeABBYh0Gm6IjWYGepvo/+tpqFmhcPdZTAPCIjcRpfGweJeD+LWp0N6gM/nW2idCPZfMClIvNAhRRzwRj@vger.kernel.org
X-Gm-Message-State: AOJu0YwimvMMZbfrQVVqz+fEvf1yAyaPP0p9fHu4KzQzw7nSV6W3MGqt
	DZ4F8k9k3fdQLVsixwu5z2QDqlleLqe1DRnkMf3I1ZeL9Ggl4OHI7kdaHms258TmQ7p+aiR18hq
	CMGMKMaTRlXqpH8PXeNr1MJG0X5uzdZslT6C4
X-Gm-Gg: ASbGnct4n/uPS4XC6c56l05h2baK9EQ6e+Bvqw4WTXomKOcQsCtpdGPY5TJ9KwU0a/g
	MQDtU4MauNs8geZIrsnclvKSUVGpaUdqxOE/j4Tct0pbI/zJlD2PtPXLGL70lqtnN7nk=
X-Google-Smtp-Source: AGHT+IFerOpLUf4+Oc1OZbSE2vohcdX1NoPD5FkxnfkSCxYZgIo5kiW5QdKvBjzYNAgCUFDG5CGEZXRAhynIVt3lt/0=
X-Received: by 2002:a05:600c:4fc1:b0:428:e6eb:1340 with SMTP id
 5b1f17b1804b1-4388b5296bfmr1116245e9.4.1737040637800; Thu, 16 Jan 2025
 07:17:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com> <20241213164811.2006197-14-tabba@google.com>
 <9b5a7efa-1a65-4b84-af60-e8658b18bad0@amazon.co.uk>
In-Reply-To: <9b5a7efa-1a65-4b84-af60-e8658b18bad0@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 16 Jan 2025 15:16:41 +0000
X-Gm-Features: AbW1kvaxfWYfuwd0W-V5L_bwpr8WlTsKSgGhMIK4AMPErUZAQCGO6nQZU3XdW0M
Message-ID: <CA+EHjTyCnjnoa8ConrUYNaZyrQewvLx2_fiyG90GSktTtA9bNw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 13/14] KVM: arm64: Handle guest_memfd()-backed
 guest page faults
To: Patrick Roy <roypat@amazon.co.uk>
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
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com, 
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>, 
	"Cali, Marco" <xmarcalx@amazon.co.uk>, James Gowans <jgowans@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

On Thu, 16 Jan 2025 at 14:48, Patrick Roy <roypat@amazon.co.uk> wrote:
>
> On Fri, 2024-12-13 at 16:48 +0000, Fuad Tabba wrote:
> > Add arm64 support for resolving guest page faults on
> > guest_memfd() backed memslots. This support is not contingent on
> > pKVM, or other confidential computing support, and works in both
> > VHE and nVHE modes.
> >
> > Without confidential computing, this support is useful forQ
> > testing and debugging. In the future, it might also be useful
> > should a user want to use guest_memfd() for all code, whether
> > it's for a protected guest or not.
> >
> > For now, the fault granule is restricted to PAGE_SIZE.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c | 111 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 109 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 342a9bd3848f..1c4b3871967c 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1434,6 +1434,107 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
> >         return vma->vm_flags & VM_MTE_ALLOWED;
> >  }
> >
> > +static int guest_memfd_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > +                            struct kvm_memory_slot *memslot, bool fault_is_perm)
> > +{
> > +       struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
> > +       bool exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> > +       bool logging_active = memslot_is_logging(memslot);
> > +       struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> > +       enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> > +       bool write_fault = kvm_is_write_fault(vcpu);
> > +       struct mm_struct *mm = current->mm;
> > +       gfn_t gfn = gpa_to_gfn(fault_ipa);
> > +       struct kvm *kvm = vcpu->kvm;
> > +       struct page *page;
> > +       kvm_pfn_t pfn;
> > +       int ret;
> > +
> > +       /* For now, guest_memfd() only supports PAGE_SIZE granules. */
> > +       if (WARN_ON_ONCE(fault_is_perm &&
> > +                        kvm_vcpu_trap_get_perm_fault_granule(vcpu) != PAGE_SIZE)) {
> > +               return -EFAULT;
> > +       }
> > +
> > +       VM_BUG_ON(write_fault && exec_fault);
> > +
> > +       if (fault_is_perm && !write_fault && !exec_fault) {
> > +               kvm_err("Unexpected L2 read permission error\n");
> > +               return -EFAULT;
> > +       }
> > +
> > +       /*
> > +        * Permission faults just need to update the existing leaf entry,
> > +        * and so normally don't require allocations from the memcache. The
> > +        * only exception to this is when dirty logging is enabled at runtime
> > +        * and a write fault needs to collapse a block entry into a table.
> > +        */
> > +       if (!fault_is_perm || (logging_active && write_fault)) {
> > +               ret = kvm_mmu_topup_memory_cache(memcache,
> > +                                                kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       /*
> > +        * Holds the folio lock until mapped in the guest and its refcount is
> > +        * stable, to avoid races with paths that check if the folio is mapped
> > +        * by the host.
> > +        */
> > +       ret = kvm_gmem_get_pfn_locked(kvm, memslot, gfn, &pfn, &page, NULL);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (!kvm_slot_gmem_is_guest_mappable(memslot, gfn)) {
> > +               ret = -EAGAIN;
> > +               goto unlock_page;
> > +       }
> > +
> > +       /*
> > +        * Once it's faulted in, a guest_memfd() page will stay in memory.
> > +        * Therefore, count it as locked.
> > +        */
> > +       if (!fault_is_perm) {
> > +               ret = account_locked_vm(mm, 1, true);
> > +               if (ret)
> > +                       goto unlock_page;
> > +       }
> > +
> > +       read_lock(&kvm->mmu_lock);
> > +       if (write_fault)
> > +               prot |= KVM_PGTABLE_PROT_W;
> > +
> > +       if (exec_fault)
> > +               prot |= KVM_PGTABLE_PROT_X;
> > +
> > +       if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> > +               prot |= KVM_PGTABLE_PROT_X;
> > +
> > +       /*
> > +        * Under the premise of getting a FSC_PERM fault, we just need to relax
> > +        * permissions.
> > +        */
> > +       if (fault_is_perm)
> > +               ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
> > +       else
> > +               ret = kvm_pgtable_stage2_map(pgt, fault_ipa, PAGE_SIZE,
> > +                                       __pfn_to_phys(pfn), prot,
> > +                                       memcache,
> > +                                       KVM_PGTABLE_WALK_HANDLE_FAULT |
> > +                                       KVM_PGTABLE_WALK_SHARED);
> > +
> > +       kvm_release_faultin_page(kvm, page, !!ret, write_fault);
> > +       read_unlock(&kvm->mmu_lock);
> > +
> > +       if (ret && !fault_is_perm)
> > +               account_locked_vm(mm, 1, false);
> > +unlock_page:
> > +       unlock_page(page);
> > +       put_page(page);
>
> There's a double-free of `page` here, as kvm_release_faultin_page
> already calls put_page. I fixed it up locally with
>
> +       unlock_page(page);
>         kvm_release_faultin_page(kvm, page, !!ret, write_fault);
>         read_unlock(&kvm->mmu_lock);
>
>         if (ret && !fault_is_perm)
>                 account_locked_vm(mm, 1, false);
> +       goto out;
> +
>  unlock_page:
>         unlock_page(page);
>         put_page(page);
> -
> +out:
>         return ret != -EAGAIN ? ret : 0;
>  }
>
> which I'm admittedly not sure is correct either because now the locks
> don't get released in reverse order of acquisition, but with this I
> was able to boot simple VMs.

Thanks for that. You're right, I broke this code right before sending
out the series while fixing a merge conflict. have prepared a new
patch series (rebased on Linux 6.13-rc7), with this redone to be part
of  user_mem_abort(), as opposed to being in its own function. Makes
the code cleaner more maintainable.


> > +
> > +       return ret != -EAGAIN ? ret : 0;
> > +}
> > +
> >  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >                           struct kvm_s2_trans *nested,
> >                           struct kvm_memory_slot *memslot, unsigned long hva,
> > @@ -1900,8 +2001,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> >                 goto out_unlock;
> >         }
> >
> > -       ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> > -                            esr_fsc_is_permission_fault(esr));
> > +       if (kvm_slot_can_be_private(memslot)) {
>
> For my setup, I needed
>
> if (kvm_mem_is_private(vcpu->kvm, gfn))
>
> here instead, because I am making use of KVM_GENERIC_MEMORY_ATTRIBUTES,
> and  had a memslot with the `KVM_MEM_GUEST_MEMFD` flag set, but whose
> gfn range wasn't actually set to KVM_MEMORY_ATTRIBUTE_PRIVATE.
>
> If I'm reading patch 12 correctly, your memslots always set only one of
> userspace_addr or guest_memfd, and the stage 2 table setup simply checks
> which one is the case to decide what to fault in, so maybe to support
> both cases, this check should be
>
> if (kvm_mem_is_private(vcpu->kvm, gfn) || (kvm_slot_can_be_private(memslot) && !memslot->userspace_addr)
>
> ?

I've actually missed supporting both cases, and I think your
suggestion is the right way to do it. I'll fix it in the respin.

Cheers,
/fuad





>
> [1]: https://lore.kernel.org/all/20240801090117.3841080-1-tabba@google.com/
>
> > +               ret = guest_memfd_abort(vcpu, fault_ipa, memslot,
> > +                                       esr_fsc_is_permission_fault(esr));
> > +       } else {
> > +               ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> > +                                    esr_fsc_is_permission_fault(esr));
> > +       }
> > +
> >         if (ret == 0)
> >                 ret = 1;
> >  out:
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
>
> Best,
> Patrick
>

