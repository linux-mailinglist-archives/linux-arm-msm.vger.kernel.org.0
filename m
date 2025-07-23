Return-Path: <linux-arm-msm+bounces-66212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 143A4B0EE3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA89B18827AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDD827FB31;
	Wed, 23 Jul 2025 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SB6TSAYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F72271465
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753262344; cv=none; b=R3jAJucNSBqlAbT1qvLLySX1QbzqhS/BUP+NNzf0qFLQukhakfsFpcGuh9eukJkGvY0JGXjAyhS5QsbHYLXOl+yUW0v7QgW2QfaddVIAwQXmKZ4w3nZPOSTgw04kUtmz8GQHyT0A+InmbVcrdfh5jWgnyyEo0K6EaVLshbLdYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753262344; c=relaxed/simple;
	bh=idmQmOpX6xjvfYbM56fP1LbrUFARTFTQP9VymBIxlTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRZWVUKwZ8T+AoDAU7fiTV76p+CnCnMZV5kZZ6/DqDQ7GDR1pEWo9Aeu7zUex8d0YtqFWIAS7rh6bcnOhKci11yRWWwcR2sy0BKgtUBgDihYTTL18sQ9HQ6uEb3RJbp5PKvWB/q+MHnoetTS/0Pzga0x6xlzCOa3e4qmn/Ea7GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SB6TSAYT; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4aaf43cbbdcso126941cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753262342; x=1753867142; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fFB2lKlzZGrzhbM4PzD3lroism4M1bEmsmifGbcd/Mo=;
        b=SB6TSAYTvdFHbAosX1WzNcUeFVRRrC6p+8gK83MQy5EoVSK1hfC9ilQo03MkstnME3
         w9+E/A/S4Fpnzh71v/8DJ8vvIvZq9mzlMz6XusFc8HkdSY8galwtj2GMf1vI+xxh+GoF
         lR8pSnHOtgNUppuc3+fQ26ea5s0aL6UPIequb8Aur/Rv2lmpoDZo0QgUzX74r/PeIOZl
         7WN+tN9DYNtch5We1JgJbjSMU04ALyApUBRaVZQ3GW9RDUaje+TlampA0HNz2/kolS1h
         qwBir7QWaz8bEoERLeLt5V2jQDETkLFqISIGnX4/GSiO2KXn0CjYIRe51N5bRNy9rLBz
         ZwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753262342; x=1753867142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFB2lKlzZGrzhbM4PzD3lroism4M1bEmsmifGbcd/Mo=;
        b=Yt6/GV9miqCEgA1snHoNV+n+K00LUnhzaGpJ+NsbrPzIJ49AfF01Ih4KNyV6NC9SK/
         a8QuNsedOez2IdWLjDzIq9I3MgpLVB5LOGBiigcNiv5+bdxrPawtkmbLfRxtNtitGPhi
         vnjunaC+c6NnANKWTY20dlZM94fU5MvGO1lIVt5gzYyFpwu3Zn2AHd9SgC1BKDGxn+3y
         zflNRuMAOGgfGfEVebLZi0eK4YZ0y8fIcQtSasQjjpuqJ3lgAdZ1wxb/GThysGiG9Doo
         +MhkG50uZIoXBvAC1IMaKAMS5uyjrfoxn3u4TgFMa7xk9g/m5ruPAJIJoGWSWqdXFg3I
         42Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVKAxRvz0aN9ZgUSE5r2JQdgSuMDX27LIutU1ZSRMGOhPYuBthoX+RGKrbVvZT8Tq2Sc/ARYHxvnj3FbUv6@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+NDR3v5RpoKRngbP60xmPz3YxrzebqgyX+25P8jwixo8KN9Y
	vZWPl4bsG+HL1yEYbg/oDGYjhKRtOi4SyhIByWgKhXTbzbHGisNiUX6kRzu34p5HuEgKM1EaIHS
	UXA5SvvHEwyGr/od8We+sUwAOQT6G9z0UEHdxihA2
X-Gm-Gg: ASbGncvRVDYNUfeZMPefBugtFx+k9CJPJyCbi8NGj+SSVIGySqjlmrBbukTXy4qNt4j
	pgJH0g0CfHTYSjCFJ0KvEW9r445QDrunItfpC9AaMoPO0h5rFWtdDMV9Uo7Mc17fVT8z0QOC9Dp
	gu18VyjWvrjjRGzBdT5+t3XnlAZLbWr8xXSmfV7h6pZd0mNndXvbJ11BxjAZR4e9dEnsphD70aY
	P6XwbYiapz6TmGPtzCmad9tleXE8CtIV/+V
X-Google-Smtp-Source: AGHT+IHdI2zc5g2uWgDeX7Xhmwb1mpmaFyW9th1coHtjrfDNoMegvkEq3o1bYX03LBqz87TbJvCehtEqjQU8oKdI5oI=
X-Received: by 2002:a05:622a:a6d1:b0:476:f1a6:d8e8 with SMTP id
 d75a77b69052e-4ae6f066f1dmr2244731cf.11.1753262341305; Wed, 23 Jul 2025
 02:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-19-tabba@google.com>
 <87ldoftifr.wl-maz@kernel.org>
In-Reply-To: <87ldoftifr.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 23 Jul 2025 10:18:24 +0100
X-Gm-Features: Ac12FXyK6HoWGYh74-rCEgCwyYrKUEnXSOccYJU3yg7243P0WML9CgqAKaoNvVc
Message-ID: <CA+EHjTyD6kXBGF0QitHtALSmX5rVDe7Sew99dwEEPXzjnPzfXQ@mail.gmail.com>
Subject: Re: [PATCH v15 18/21] KVM: arm64: Enable host mapping of shared
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

On Wed, 23 Jul 2025 at 09:33, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 17 Jul 2025 17:27:28 +0100,
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
> > * Enforce KVM_MEMSLOT_GMEM_ONLY for guest_memfd on arm64: Checks are
> >   added to ensure that if guest_memfd is enabled on arm64,
> >   KVM_GMEM_SUPPORTS_MMAP must also be enabled. This means
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
> >  arch/arm64/kvm/Kconfig            | 2 ++
> >  arch/arm64/kvm/mmu.c              | 7 +++++++
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 3e41a880b062..63f7827cfa1b 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1674,5 +1674,9 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
> >  void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
> >  void check_feature_map(void);
> >
> > +#ifdef CONFIG_KVM_GMEM
> > +#define kvm_arch_supports_gmem(kvm) true
> > +#define kvm_arch_supports_gmem_mmap(kvm) IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP)
> > +#endif
>
> nit: these two lines should be trivially 'true', and the #ifdef-ery
> removed, since both KVM_GMEM and KVM_GMEM_SUPPORTS_MMAP are always
> selected, no ifs, no buts.

I'll fix these.

> >
> >  #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 713248f240e0..323b46b7c82f 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -37,6 +37,8 @@ menuconfig KVM
> >       select HAVE_KVM_VCPU_RUN_PID_CHANGE
> >       select SCHED_INFO
> >       select GUEST_PERF_EVENTS if PERF_EVENTS
> > +     select KVM_GMEM
> > +     select KVM_GMEM_SUPPORTS_MMAP
> >       help
> >         Support hosting virtualized guest machines.
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 8c82df80a835..85559b8a0845 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -2276,6 +2276,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >       if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> >               return -EFAULT;
> >
> > +     /*
> > +      * Only support guest_memfd backed memslots with mappable memory, since
> > +      * there aren't any CoCo VMs that support only private memory on arm64.
> > +      */
> > +     if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
> > +             return -EINVAL;
> > +
> >       hva = new->userspace_addr;
> >       reg_end = hva + (new->npages << PAGE_SHIFT);
> >
>
> Otherwise,
>
> Reviewed-by: Marc Zyngier <maz@kernel.org>

Thanks for the reviews!

Cheers,
/fuad

>         M.
>
> --
> Jazz isn't dead. It just smells funny.

