Return-Path: <linux-arm-msm+bounces-64618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2BEB01F3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 16:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263741CA57F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3011519A6;
	Fri, 11 Jul 2025 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xtDd20Ec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA261898E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244532; cv=none; b=YV+Turp5yxFJQftjHfGldXMImd0wvve1pvse3XlyULQh0d3PMSc/LjRBFpPlmFAQlRgn1vZivA9gyawlYxnM6J/+jE5KI35dLq8h8C2xp9MouW+cxGieQbpz2yAyYp6RR9AIKIoAUWm9ll32TUh5vCsWi834Ihtv7vZJez5NfM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244532; c=relaxed/simple;
	bh=3+YsQ5DYqKVY+sCSEKk64n7MH3GtivRvMp+hTl+36G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxtIEn5f1JoHyaE3MJuExX44LKgHsExnnxXn7YW1UaRXpgrEyjQ48EeRlz43jQ/irUFYV/l/eez+Gg+8amKkuKyjMLQHjbV3OZA8VKaqUYiEozxO83wt5zPHKCNJavrfYjIgFbdOfoxfKFFOiuU7LvdJfiOOXogXPRDIxop+89o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xtDd20Ec; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso174111cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752244529; x=1752849329; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lq9VKw2x/Ujw6EnIVfnsvSfkn8foGEThRri1rsKatHU=;
        b=xtDd20EcQK05Lf+k1QniF5yJE2HYBEXKreMZqrjgmFkfjbnVMO7+R1q8c4vS+BDQJq
         FXdwylf2sQseWO4qxIO23N3tSoJMCajKUW7/xCEsnJMRAtsxjZSZNgFEFv9VKbzjU3FU
         vyO5MdrIUq3gb6EDRtog9tWQ7jIGkezfMMXIyV8EE0pcy8myn54KtxC5DE/fNYC74Bac
         fzOV3TLKfnJXjcFLv6Qc6kVqtx0rHs7+ZlqZ1MMrbP8Gb2aXNjC/zG6vQwUnrhom8f5i
         OcS9P0osBVp1UNgqIR7HLhVN+mJhXHBS4nDU+VBUcgXfs3Wx/lO3ON4kZb1E8F6eSz3g
         9BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244529; x=1752849329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lq9VKw2x/Ujw6EnIVfnsvSfkn8foGEThRri1rsKatHU=;
        b=p8wyt4iDjPLAH2HhekK7X5J7ACz8jQLfiS9JeXZsQR22xrjuqXUwsT3ciorQLFJiF9
         M59WZpb4yriT3Fnhqh15Zs9C75YvPYuQGtFrsgbbgLAe8ioLNahy55laSvmrxqJEcspQ
         C6OplFLvU9AI0ZzdQcbZdF+U0WG4euBr4E6JqqFDsskAcOokjVKjoW4QnlE3iPntlJyn
         I22wkVm3pqCWR3W8pHpEjUtoBK+58tQYtYZAu2eigKADiIBKfZAa66nmuGuGK/2YLJPr
         wC9IXvyy9sS/E4Z5nzuKXvvJj19We03ys8gsWEkNSV6067XmAiGpKeqiKpfy195FEMqm
         tUdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVScaMOv7KwC2ublr38jHmBbwDesnOpilpM9C/gDINIjJ3vJSow5uFp2L7Eqxzqats44/8jto9ZKmCv931R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/QwD5ZjJhdCuKr6Qt7uNnBuFMl1UXq+8o+NKgQTnyad0ZGmvK
	FmaJDM49Kpn/emDDrNOnr2HWR27JFer0YHiK7YJfjMEewY7zPNtaaaO6wO8Wsu4FBTdR/PpvVuv
	unoGtW3/XVFPAw9am4B6yw/334D4Yt0R6qRCAjdHH
X-Gm-Gg: ASbGnctej49VNOoJyb5enR453OE8G9NJsD1NLyO4s6kx8iOeHlsKSLvQjVz51ppZqIx
	QR7W2v8rulPyee3AkiYr1KMjESBnzDbGauEdOnZ9iZbnq3jDDEymUu2ThkWk8r1VNla5Fn7RDZA
	HhuEoe1oi7W/yGtQMjsxPHJT5IjgsNTnMortqs/uWsx/GRWQhBxuls412gjRbb9Ev9/aZpSDyqf
	0BodFE=
X-Google-Smtp-Source: AGHT+IEg2fONqFcuPbkvHSvdaQWL9AC5pLiTMJKYpsFoLYghSZ8SAhnIGrRn3LSgKjXg81dETxMVSTy5T/qS3dgr4ks=
X-Received: by 2002:a05:622a:49:b0:4a9:d263:d983 with SMTP id
 d75a77b69052e-4a9fbf49438mr3781321cf.22.1752244528763; Fri, 11 Jul 2025
 07:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com> <20250709105946.4009897-18-tabba@google.com>
 <868qkuajp2.wl-maz@kernel.org>
In-Reply-To: <868qkuajp2.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 11 Jul 2025 15:34:52 +0100
X-Gm-Features: Ac12FXzYWJsd6Iwz-ekA2LSj-AUmL9hUg1W3iguQuC8VOR_mqt0hoqU_djhQ6-A
Message-ID: <CA+EHjTxa+8ec8rX5R2_AY76Eq0PSurB3k4oXJtx8D0eSCx6kVw@mail.gmail.com>
Subject: Re: [PATCH v13 17/20] KVM: arm64: Enable host mapping of shared
 guest_memfd memory
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk, 
	shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com, 
	peterx@redhat.com, pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 11 Jul 2025 at 15:25, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 09 Jul 2025 11:59:43 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Enable host userspace mmap support for guest_memfd-backed memory on
> > arm64. This change provides arm64 with the capability to map guest
> > memory at the host directly from guest_memfd:
> >
> > * Define kvm_arch_supports_gmem_mmap() for arm64: The
> >   kvm_arch_supports_gmem_mmap() macro is defined for arm64 to be true if
> >   CONFIG_KVM_GMEM_SUPPORTS_MMAP is enabled. For existing arm64 KVM VM
> >   types that support guest_memfd, this enables them to use guest_memfd
> >   with host userspace mappings. This provides a consistent behavior as
> >   there are currently no arm64 CoCo VMs that rely on guest_memfd solely
> >   for private, non-mappable memory. Future arm64 VM types can override
> >   or restrict this behavior via the kvm_arch_supports_gmem_mmap() hook
> >   if needed.
> >
> > * Select CONFIG_KVM_GMEM_SUPPORTS_MMAP in arm64 Kconfig.
> >
> > * Enforce KVM_MEMSLOT_GMEM_ONLY for guest_memfd on arm64: Compile and
> >   runtime checks are added to ensure that if guest_memfd is enabled on
> >   arm64, KVM_GMEM_SUPPORTS_MMAP must also be enabled. This means
> >   guest_memfd-backed memory slots on arm64 are currently only supported
> >   if they are intended for shared memory use cases (i.e.,
> >   kvm_memslot_is_gmem_only() is true). This design reflects the current
> >   arm64 KVM ecosystem where guest_memfd is primarily being introduced
> >   for VMs that support shared memory.
> >
> > Reviewed-by: James Houghton <jthoughton@google.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h | 4 ++++
> >  arch/arm64/kvm/Kconfig            | 1 +
> >  arch/arm64/kvm/mmu.c              | 8 ++++++++
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index d27079968341..bd2af5470c66 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1675,5 +1675,9 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
> >  void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
> >  void check_feature_map(void);
> >
> > +#ifdef CONFIG_KVM_GMEM
> > +#define kvm_arch_supports_gmem(kvm) true
> > +#define kvm_arch_supports_gmem_mmap(kvm) IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP)
> > +#endif
> >
> >  #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 713248f240e0..28539479f083 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -37,6 +37,7 @@ menuconfig KVM
> >       select HAVE_KVM_VCPU_RUN_PID_CHANGE
> >       select SCHED_INFO
> >       select GUEST_PERF_EVENTS if PERF_EVENTS
> > +     select KVM_GMEM_SUPPORTS_MMAP
> >       help
> >         Support hosting virtualized guest machines.
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 71f8b53683e7..b92ce4d9b4e0 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -2274,6 +2274,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >       if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> >               return -EFAULT;
> >
> > +     /*
> > +      * Only support guest_memfd backed memslots with mappable memory, since
> > +      * there aren't any CoCo VMs that support only private memory on arm64.
> > +      */
> > +     BUILD_BUG_ON(IS_ENABLED(CONFIG_KVM_GMEM) && !IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP));
> > +     if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
> > +             return -EINVAL;
> > +
> >       hva = new->userspace_addr;
> >       reg_end = hva + (new->npages << PAGE_SHIFT);
> >
>
> Honestly, I don't see the point in making CONFIG_KVM_GMEM a buy in. We
> have *no* configurability for KVM/arm64, the only exception being the
> PMU support, and that has been a pain at every step of the way.
>
> Either KVM is enabled, and it comes with "batteries included", or it's
> not. Either way, we know exactly what we're getting, and it makes
> reproducing problems much easier.

Batteries included is always best I think (all the times I got
disappointed as a kid..... sight :) ). I'll always enable guest_memfd
when KVM is enabled on arm64.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

