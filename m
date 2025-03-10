Return-Path: <linux-arm-msm+bounces-50851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE0A5977C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 15:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61E153A3EF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493E522B5AD;
	Mon, 10 Mar 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1sAEwFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BDD229B1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616625; cv=none; b=nVQDpRumbQD+8quFByK6scgByuAm8dbbtfyrEUa9H2CC2xfN9h1CgfSZDIKIVZW4NzllJBFoPdSnpGRo+0O8zM+E8gYRTJDFNDJ5uGxJobTS/fl9dOCavQ21dHguExSoe84Gfostx9TuBaRprvwD2RnYoNE9M1kzOGGiotE6sp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616625; c=relaxed/simple;
	bh=68XPxVNyLnouCntVeMoHYnPvAP1WquVZf5t+Dt+l008=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lSYOYVCJkMwuSSfrYOHfn9UXAXkZWDWdd9IwKBX5BLUtucDlb3mznhwjKvfLexXK/cIJTCKNlqjQjP0iNRKNwTyoRTODii7ErWgpWtDJmSMBA2walMaPU93XMJaPFv/Vb0Qe7IVe4yhA0GkTrAp8Fl5/D4JP8i0KB6npTd1rJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1sAEwFk; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff82dd6de0so4782357a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741616623; x=1742221423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=siqaS2JbSnx2njtDDydrKwV/MnNuVKvfYYNYvSOekGg=;
        b=q1sAEwFkhfIcOkvNPSGKdjBlTNCQPzWhm69qKzIQLzMSpAjOLohUyszvJXCyvgRSRw
         kKKTXn+nnnSkTBz9pLIyQjobjjrqBQlJXxepMY/mmTaJMwROHsWo8ff0G0l8TAO69mML
         juTrcEfK5W8JVRDTpQ3+793n/FZ8VVTfOm9zD/HYGgsVd8nHFJ6W9IKN461JuwwwEkNS
         hsr5S/I+Ig+ILlTlWWDmIpqNIj+sySm0bgZWAx75nny78FPmRBOJp3Qy+jO/uiaY1KUc
         DcFfTRuxSTponheS0liO0RWX6tK2iASg/ExOpCf6I6Qe8uEh8VxSsb2nGgBEu9sje9c2
         /PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616623; x=1742221423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=siqaS2JbSnx2njtDDydrKwV/MnNuVKvfYYNYvSOekGg=;
        b=VpJndMpm6xMIuH14vYD885IziTeV00ZYyTpSF4YM/tYtkwOdvO8yoTs2wZsdyqWJe3
         ZJhk3I0Fs82LxX45cKFx/rQgzgOIihu9lvnu+Z3tVBxJMeLQmLS8hI+t3S/NokB8XTeE
         pLz+nY5+gZUMLMhwODozrUrjX7qCjqYwSUdZ1x0bM6XE4svIfgyNG7u+pURHgkU9J8iX
         H2fsXVja4IjaEWOs/5ih/O/r8XEHmYct/crIQVqLrNim2rEtWecF9FiqgPBp/T+aNhrl
         Tld5OanaWilOm35ifYzsx/5xCFkaqjar70wWB618AIk7lCsdsFZiNae+0oO4aTflmxFN
         gChg==
X-Forwarded-Encrypted: i=1; AJvYcCWEW9upIf0jAuPYXr1UzdAv5Vzfb6qvsE9CkdvJDR93EfQzXWVHW7KR+Nl36nctVzMEzOUJxnXSpTYGuiTp@vger.kernel.org
X-Gm-Message-State: AOJu0YzygMWcunEETC7P+3j95e/LQSywrdPjDkpkhj8EUlo1iy181sad
	D7SYK3sUtGVwAjISUSeWbIN22nkNqox90TJo+YlhfylX8MTRIwobd97ZjEh8Shywox4mU0jJDqp
	apBnYo2w3SFllKs6oIaRf2A==
X-Google-Smtp-Source: AGHT+IEeQE/5jmeJ5/KuStm+Ss3KKZYK5UVXqTShZa7bpYd0X3YKbTqnCPeb/Q75cIive1di1Iuaubvf+4uM9toG5w==
X-Received: from pjbpd6.prod.google.com ([2002:a17:90b:1dc6:b0:2fa:15aa:4d1e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d8c:b0:2ff:4bac:6fbf with SMTP id 98e67ed59e1d1-2ff7ce4f2bdmr22213321a91.7.1741616622722;
 Mon, 10 Mar 2025 07:23:42 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:23:41 +0000
In-Reply-To: <CA+EHjTxhumDswVVosDtvMojk-MJbJT=V8Cxhhnw2GGUDL74Mmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250303171013.3548775-3-tabba@google.com> <diqzbjucu60l.fsf@ackerleytng-ctop.c.googlers.com>
 <CA+EHjTxhumDswVVosDtvMojk-MJbJT=V8Cxhhnw2GGUDL74Mmw@mail.gmail.com>
Message-ID: <diqz4j01t15e.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v5 2/9] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
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
	hughd@google.com, jthoughton@google.com, peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> Hi Ackerley,
>
> On Fri, 7 Mar 2025 at 17:04, Ackerley Tng <ackerleytng@google.com> wrote:
>>
>> Fuad Tabba <tabba@google.com> writes:
>>
>> > Before transitioning a guest_memfd folio to unshared, thereby
>> > disallowing access by the host and allowing the hypervisor to
>> > transition its view of the guest page as private, we need to be
>> > sure that the host doesn't have any references to the folio.
>> >
>> > This patch introduces a new type for guest_memfd folios, which
>> > isn't activated in this series but is here as a placeholder and
>> > to facilitate the code in the subsequent patch series. This will
>> > be used in the future to register a callback that informs the
>> > guest_memfd subsystem when the last reference is dropped,
>> > therefore knowing that the host doesn't have any remaining
>> > references.
>> >
>> > This patch also introduces the configuration option,
>> > KVM_GMEM_SHARED_MEM, which toggles support for mapping
>> > guest_memfd shared memory at the host.
>> >
>> > Signed-off-by: Fuad Tabba <tabba@google.com>
>> > Acked-by: Vlastimil Babka <vbabka@suse.cz>
>> > Acked-by: David Hildenbrand <david@redhat.com>
>> > ---
>> >  include/linux/kvm_host.h   |  7 +++++++
>> >  include/linux/page-flags.h | 16 ++++++++++++++++
>> >  mm/debug.c                 |  1 +
>> >  mm/swap.c                  |  9 +++++++++
>> >  virt/kvm/Kconfig           |  5 +++++
>> >  5 files changed, 38 insertions(+)
>> >
>> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> > index f34f4cfaa513..7788e3625f6d 100644
>> > --- a/include/linux/kvm_host.h
>> > +++ b/include/linux/kvm_host.h
>> > @@ -2571,4 +2571,11 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>> >                                   struct kvm_pre_fault_memory *range);
>> >  #endif
>> >
>> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>> > +static inline void kvm_gmem_handle_folio_put(struct folio *folio)
>> > +{
>> > +     WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
>> > +}
>> > +#endif
>> > +
>> >  #endif
>>
>> Following up with the discussion at the guest_memfd biweekly call on the
>> guestmem library, I think this folio_put() handler for guest_memfd could
>> be the first function that's refactored out into (placeholder name)
>> mm/guestmem.c.
>>
>> This folio_put() handler has to stay in memory even after KVM (as a
>> module) is unloaded from memory, and so it is a good candidate for the
>> first function in the guestmem library.
>>
>> Along those lines, CONFIG_KVM_GMEM_SHARED_MEM in this patch can be
>> renamed CONFIG_GUESTMEM, and CONFIG_GUESTMEM will guard the existence of
>> PGTY_guestmem.
>>
>> CONFIG_KVM_GMEM_SHARED_MEM can be introduced in the next patch of this
>> series, which could, in Kconfig, select CONFIG_GUESTMEM.
>>
>> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>> > index 6dc2494bd002..daeee9a38e4c 100644
>> > --- a/include/linux/page-flags.h
>> > +++ b/include/linux/page-flags.h
>> > @@ -933,6 +933,7 @@ enum pagetype {
>> >       PGTY_slab       = 0xf5,
>> >       PGTY_zsmalloc   = 0xf6,
>> >       PGTY_unaccepted = 0xf7,
>> > +     PGTY_guestmem   = 0xf8,
>> >
>> >       PGTY_mapcount_underflow = 0xff
>> >  };
>> > @@ -1082,6 +1083,21 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
>> >  FOLIO_TEST_FLAG_FALSE(hugetlb)
>> >  #endif
>> >
>> > +/*
>> > + * guestmem folios are used to back VM memory as managed by guest_memfd. Once
>> > + * the last reference is put, instead of freeing these folios back to the page
>> > + * allocator, they are returned to guest_memfd.
>> > + *
>> > + * For now, guestmem will only be set on these folios as long as they  cannot be
>> > + * mapped to user space ("private state"), with the plan of always setting that
>> > + * type once typed folios can be mapped to user space cleanly.
>> > + */
>> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>> > +FOLIO_TYPE_OPS(guestmem, guestmem)
>> > +#else
>> > +FOLIO_TEST_FLAG_FALSE(guestmem)
>> > +#endif
>> > +
>> >  PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
>> >
>> >  /*
>> > diff --git a/mm/debug.c b/mm/debug.c
>> > index 8d2acf432385..08bc42c6cba8 100644
>> > --- a/mm/debug.c
>> > +++ b/mm/debug.c
>> > @@ -56,6 +56,7 @@ static const char *page_type_names[] = {
>> >       DEF_PAGETYPE_NAME(table),
>> >       DEF_PAGETYPE_NAME(buddy),
>> >       DEF_PAGETYPE_NAME(unaccepted),
>> > +     DEF_PAGETYPE_NAME(guestmem),
>> >  };
>> >
>> >  static const char *page_type_name(unsigned int page_type)
>> > diff --git a/mm/swap.c b/mm/swap.c
>> > index 47bc1bb919cc..241880a46358 100644
>> > --- a/mm/swap.c
>> > +++ b/mm/swap.c
>> > @@ -38,6 +38,10 @@
>> >  #include <linux/local_lock.h>
>> >  #include <linux/buffer_head.h>
>> >
>> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>> > +#include <linux/kvm_host.h>
>> > +#endif
>> > +
>> >  #include "internal.h"
>> >
>> >  #define CREATE_TRACE_POINTS
>> > @@ -101,6 +105,11 @@ static void free_typed_folio(struct folio *folio)
>> >       case PGTY_hugetlb:
>> >               free_huge_folio(folio);
>> >               return;
>> > +#endif
>> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>> > +     case PGTY_guestmem:
>> > +             kvm_gmem_handle_folio_put(folio);
>> > +             return;
>> >  #endif
>> >       default:
>> >               WARN_ON_ONCE(1);
>> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
>> > index 54e959e7d68f..37f7734cb10f 100644
>> > --- a/virt/kvm/Kconfig
>> > +++ b/virt/kvm/Kconfig
>> > @@ -124,3 +124,8 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
>> >  config HAVE_KVM_ARCH_GMEM_INVALIDATE
>> >         bool
>> >         depends on KVM_PRIVATE_MEM
>> > +
>> > +config KVM_GMEM_SHARED_MEM
>> > +       select KVM_PRIVATE_MEM
>> > +       depends on !KVM_GENERIC_MEMORY_ATTRIBUTES
>>
>> Enforcing that KVM_GENERIC_MEMORY_ATTRIBUTES is not selected should not
>> be a strict requirement. Fuad explained in an offline chat that this is
>> just temporary.
>>
>> If we have CONFIG_GUESTMEM, then this question is moot, I think
>> CONFIG_GUESTMEM would just be independent of everything else; other
>> configs would depend on CONFIG_GUESTMEM.
>
> There are two things here. First of all, the unfortunate naming
> situation where PRIVATE could mean GUESTMEM, or private could mean not
> shared. I plan to tackle this aspect (i.e., the naming) in a separate
> patch series, since that will surely generate a lot of debate :)
>

Oops. By "depend on CONFIG_GUESTMEM" I meant "depend on the introduction
of the guestmem shim". I think this is a good time to introduce the shim
because the folio_put() callback needs to be in mm and not just in KVM,
which is a loadable module and hence can be removed from memory.

If we do introduce the shim, the config flag CONFIG_KVM_GMEM_SHARED_MEM
will be replaced by CONFIG_GUESTMEM (or other name), and then the
question on depending on !KVM_GENERIC_MEMORY_ATTRIBUTES will be moot
since I think an mm config flag wouldn't place a constraint on a module
config flag?

When I wrote this, I thought that config flags are easily renamed since
they're an interface and are user-facing, but I realized config flag
renaming seems to be easily renamed based on this search [1].

If we're going with renaming in a separate patch series, some mechanism
should be introduced here to handle the case where

1. Kernel (and KVM module) is compiled with KVM_GMEM_SHARED_MEM set
2. KVM is unloaded
3. folio_put() tries to call kvm_gmem_handle_folio_put()

> The other part is that, with shared memory in-place, the memory
> attributes are an orthogonal matter. The attributes are the userpace's
> view of what it expects the state of the memory to be, and are used to
> multiplex whether the memory being accessed is guest_memfd or the
> regular (i.e., most likely anonymous) memory used normally by KVM.
>
> This behavior however would be architecture, or even vm-type specific.
>

I agree it is orthogonal but I'm calling this out because "depends on
!KVM_GENERIC_MEMORY_ATTRIBUTES" means if I set
CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES, I can't use PGTY_guestmem since
CONFIG_KVM_GMEM_SHARED_MEM would get unset.

I was trying to test this with a KVM_X86_SW_PROTECTED_VM, setting up for
using the ioctl to convert memory and hit this issue.

> Cheers,
> /fuad
>
>> > +       bool

[1] https://lore.kernel.org/all/?q=s%3Arename+dfn%3AKconfig+merged

