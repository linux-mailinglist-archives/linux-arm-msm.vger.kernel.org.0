Return-Path: <linux-arm-msm+bounces-59007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 363F2AC0591
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D2F1BA6D82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77942A1B2;
	Thu, 22 May 2025 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bBYvWVjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A1134D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898588; cv=none; b=UB1+9aj037dhnTL3hHqwF9U0UGALtg6koiIxBMObLup1zh0/jU3zsupygu0xtb4Egkjx+sThkBo59AHdDUy8+M+hpQ55RyZvJk5m4n8tdZ/NwWygirjWgl7vwQMHEkmVYehgut0pHRCz6eg0SWl3a0+KUijH1vMwV8PviZ52p/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898588; c=relaxed/simple;
	bh=+T+GWyAo8i86XQKcDhUD1ze7DXCVuoV97N0vO9vwzyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEB2j3y8G/0YMXw7Uycx9o9+cg4C9Dk43M1kcH7z2KHzTN4WNNop4/INkds/PrnwlmpP1otKD9PDp8EcgDjT8dlaRlQjnrbWRj6ebBLtbc3Eh20p8MmrDqOjjMVohNRlZ5ePelp7wi+A7FE8KfS/nLlfWBSuzZfu1U3M9H3vT2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bBYvWVjV; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47666573242so1731731cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747898586; x=1748503386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mk2bLjyUEb287XK00LoxvtVw12EbKu/I8cWfAApuOuI=;
        b=bBYvWVjV87wfxeyBDZm+chHqOI+lODa6euDhmljn+mMPNrsYaG8daeapeg74oHzrpQ
         XYLCB97cgazPicNsB/RSynWXXqXUx0qyR12uKbbMrbZVuVttIyUbfg5m7Gh/bkD2YV5N
         aQx5Z91NC6LP9vamGQcYP08bFXufa48i3GSYzQAgvqEZ1uzQ47VMwStz5Dz2DTQ1UpbF
         +pLDvvb/4aZjQUe/3w3SeSiZYtBPr+hx3A1pK4h708JIx2z8qmxL2kSz4c+eumzPEzHX
         8gD+vONHJhnLi8jDKewMGPHTrhIsdGyDlXSdefVZKdw9d57wHN+0Y7QEs5yUz1UXY+fR
         EV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898586; x=1748503386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mk2bLjyUEb287XK00LoxvtVw12EbKu/I8cWfAApuOuI=;
        b=DuWM3fTnk2+ML1M7qWj1SbfF3DlwdWUnadAo/+JEuwAE8v5MHauPr/MyG5M/p4a6HI
         gzriKuxz5rd/lveXalgaQdgp5CCwxR7DRBCOaUprMJ1L18R66WOBECKlHW3Kp2NJG0oJ
         /3G5K1+vKSCVUiwqVi+87LkW9rzvy6jIZ2hLTaX9oK+dfoUpldyrA/B93PiNZ/Lknjty
         3wxDlWlz1xdcFdX0B48YfzdyQ1oIeOPFUSGuGU38f7KFyszeat5P3Jvn5cS8Se1jWT6j
         +HLYVrO7fFeZlIuIgcxB/NXZQcgg7VVoIZN1eWenWH3ucR7tpPiwW15jCC+TRR6qcZ2F
         OtOw==
X-Forwarded-Encrypted: i=1; AJvYcCW94JXZ7x1v2oev0RHJUJYy4OOw/olBN0l14IxSqMzpHrXUMgRE8DGN9pjfmjBaRqDbAoqJfIMQ46qXRtKL@vger.kernel.org
X-Gm-Message-State: AOJu0YzKoz38bwo4H3+0VFsLsetF8gw4pKG7qmhYQKQQec6zxzMRjlgV
	+Xe3TIEKqyTSG28bRACPunCjhbKrtuIC9goEcpxw82DahBJhHxr+PrN+hX7rqEFUjItZoPCJG3Z
	L8cTTkOuMMV5bMdWPkj8EGM/go3BHK2W9yIK5B8yd
X-Gm-Gg: ASbGncub7bsLTfajFW0ScHQzmjYIzyJEB4KM+TO7wk7deXIGTw3E9yimkIysJE7g49y
	aj0BcXP/dl9NCSfD6eTVqWCc3fMESNiGKCNQ+9e6IjBs56tmGZ4K21GJa41tJ4Cx+HkCWQzpuuw
	5XxgqdYYdZq3acxDNioZ93yIVrqBAu97MoJtnXV4e6c3s=
X-Google-Smtp-Source: AGHT+IEi6TeZEBQL7um7FKqCXxTH/kqET5/tP1WXTytlUTA+PhEPtgEimYOH7KJhSyxp6z55soK1OdIsMdoatnXAmqk=
X-Received: by 2002:ac8:5d44:0:b0:477:8577:1532 with SMTP id
 d75a77b69052e-49cf1c95ae4mr1960781cf.28.1747898585469; Thu, 22 May 2025
 00:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-11-tabba@google.com>
 <5ace54d1-800b-4122-8c05-041aa0ee12a1@redhat.com>
In-Reply-To: <5ace54d1-800b-4122-8c05-041aa0ee12a1@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 22 May 2025 08:22:28 +0100
X-Gm-Features: AX0GCFv4mD5QSYe80sAfF24snOg1C15DZpx2nFDhhQZIJov6N04QVy00YLzfTio
Message-ID: <CA+EHjTyiiA84spuKqr-2ioiVjEHrcksENLR5uGhY-Avke28-2w@mail.gmail.com>
Subject: Re: [PATCH v9 10/17] KVM: x86: Compute max_mapping_level with input
 from guest_memfd
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
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
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 21 May 2025 at 09:01, David Hildenbrand <david@redhat.com> wrote:
>
> On 13.05.25 18:34, Fuad Tabba wrote:
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
> >    shared memory, or in future both shared and private memory) or
> > + if the memslot is only used for private memory and that gfn is
> >    private.
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
> >   arch/x86/kvm/mmu/mmu.c   | 92 ++++++++++++++++++++++++++--------------
> >   include/linux/kvm_host.h |  7 +++
> >   virt/kvm/guest_memfd.c   | 12 ++++++
> >   3 files changed, 79 insertions(+), 32 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index cfbb471f7c70..9e0bc8114859 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -3256,12 +3256,11 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
> >       return level;
> >   }
> [...]
>
> >   static u8 kvm_max_level_for_fault_and_order(struct kvm *kvm,
> >                                           struct kvm_page_fault *fault,
> >                                           int order)
> > @@ -4523,7 +4551,7 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
> >   {
> >       unsigned int foll = fault->write ? FOLL_WRITE : 0;
> >
> > -     if (fault->is_private || kvm_gmem_memslot_supports_shared(fault->slot))
> > +     if (fault_from_gmem(fault))
>
> Should this change rather have been done in the previous patch?
>
> (then only adjust fault_from_gmem() in this function as required)
>
> >               return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
> >
> >       foll |= FOLL_NOWAIT;
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index de7b46ee1762..f9bb025327c3 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2560,6 +2560,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >   int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >                    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
> >                    int *max_order);
> > +int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot, gfn_t gfn);
> >   #else
> >   static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> >                                  struct kvm_memory_slot *slot, gfn_t gfn,
> > @@ -2569,6 +2570,12 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> >       KVM_BUG_ON(1, kvm);
> >       return -EIO;
> >   }
> > +static inline int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot,
> > +                                      gfn_t gfn)
>
> Probably should indent with two tabs here.

(I'm fixing the patch before respinning, hence it's me asking)

Not sure I understand. Indentation here matches the same style as that
for kvm_gmem_get_pfn() right above it in the alignment of the
parameters, i.e., the parameter `gfn_t gfn` is aligned with the
parameter `const struct kvm_memory_slot *slot` (four tabs and a
space).

Thanks,
/fuad


>
>
> --
> Cheers,
>
> David / dhildenb
>

