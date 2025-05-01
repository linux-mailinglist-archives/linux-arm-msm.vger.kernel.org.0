Return-Path: <linux-arm-msm+bounces-56368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C4AA5CCE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 11:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A859E3BA9AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 09:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B28224253;
	Thu,  1 May 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0gt3KJcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23081126C05
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746093279; cv=none; b=oZ+pKeqp0K4yxo9dBEODE2NoZdkdpTY3AzcqH8nYCCzpXvjQOl+KsKQZSKLpHSpXnp6C5Qg5SRmT/uvTspkonDJAck8h1gTRTrQ1eG/JV1xA6nVqEWg07GPGy5IcSdbPvKh6QC6rnxn1iKKVWjKp/TegwgBE/p9zUUeiKKQC+To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746093279; c=relaxed/simple;
	bh=tPojNAE9X8jNNMKGZxV1mHKo3clJ6jvnrxnAIv0gQkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5LeBj0iJiskqdgUvF5OFRr9/CxDuCvgEYI+Ab5UH3QhQICE+louQosod+HinE0IA+FJvP/gn6XvOS1j6kZYGxC1jheH7NjnGU3lo58bAPOmQk0ZB6n3jCAtON/1cQiZ3sreQl3bjZzaGcADhVUEjK+MXvfx7ZPA+3y3buCX/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0gt3KJcX; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47e9fea29easo122341cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746093277; x=1746698077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Si4JfXR6mP4IYYMT29UOVbb1otTt0axA6CZ1YDI9+AQ=;
        b=0gt3KJcXOI0kFpAafYIsghTHfoIs5v5BXGKaavQTiZa/Gw4BZwR0ES00VzMxdhFy/4
         zvBOmOXCqcAxtJ+PUszzVEfgW2/KZsaRq+m/VlAueuFvjRJdmQWX7Wi6abjo1poKNYb1
         ZQM6w6b+qDZaXL9Ptv578GnQVgt9ZbAAsNiTnBzBKp49WscgycwXX0GkuL7Wr3pOsQW+
         B5njOJjT9f1pAyfVU9GCOCsHshVCnJym4yJ+UlvQO9uInhpD1VmJmK9SkdoWQn9Y+AeN
         9JNvjYzQBgTvH9Dz6aHaZetewfuT3Vbkn7QwsBrdzjt8+W/6StdOtdyeqcwe/jCCbcyO
         wglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746093277; x=1746698077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Si4JfXR6mP4IYYMT29UOVbb1otTt0axA6CZ1YDI9+AQ=;
        b=ISpC6lkMhaNuYRIRLQvrgRZibNNEfGYzYhUsnWjCAiqLR5stH5TiS0XVSvppzaElKQ
         VZS6Va3T/C+gwOUG6lnyDg3dArsbZwLFcEuBabbPhyCNo5z0lKOjWBYmOB3P+0gOjzBi
         eaGXtcFVi6LxhtNSLolD2Z+iGwkS2b6RGtaKZ1UidboVSFkKeGckajCORmFuo63JzN3e
         IiOgKqWIZqFl3UryCQ3W6amTdvpn7+ENxzKRzJLHK19C7t6PcQJBTmG9/AkAPWq9GVlS
         WqETVKJVuAJx/DuFFOlbrk76jsxLrqLXF+CntXRjPDd6hab85q6OWx2ESGCY/mla2K1x
         OWNw==
X-Forwarded-Encrypted: i=1; AJvYcCVomJz9dFMSrJEPTElv2Wq4+CuNaEIUz25KPlVfi5042eDCrY51TQmz3O2ek6VSQ1sL1qXrIzHifc/e0wF7@vger.kernel.org
X-Gm-Message-State: AOJu0YxliUlMY3yKqcv/U/ddqFX+0rZ3h50js+XnQxFdPOfshkPYkdYK
	f+8+ek+jifNyUvcSsbDQ/OPgJBBn8VcGecg6GwHp3qKecV1I/hwbi+yPjguESdSVrp5T5FOp/9q
	RymrARl+zqwQ5jtzrTlaC+CEzJmfbgNGwBP0j
X-Gm-Gg: ASbGnctGt91mcQjOGtZIeWxRm8KwbQf2Wq/FVjnN91vVIIHr4z4WAl8DNWhQhAFZEcY
	cH9lvUo7yuwwtDTvr4uTGHgm5Tu5z8LQJmr9gqrQS8pBLQqgxiRWzyIUlR3bVA6Xg34KoIUlUB4
	XPzSuPKFcP+/QJwSqh3H99rw8=
X-Google-Smtp-Source: AGHT+IFNyZ/h02gsvbeC0up9ulk27D2jhI3Rj1d7Wg620REgI9FAowU+ytZ0JoiwZxsj9oFSBbg/OCpnsoepTeOuk68=
X-Received: by 2002:a05:622a:11:b0:486:8711:19af with SMTP id
 d75a77b69052e-48ae773409emr3692911cf.0.1746093276598; Thu, 01 May 2025
 02:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430165655.605595-7-tabba@google.com> <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 1 May 2025 10:53:59 +0100
X-Gm-Features: ATxdqUE9VBlSm4IZL3pfrNaYkV2w1NjQaMBOEepCOPF4Q4EKmdB3yi6epRoxCN0
Message-ID: <CA+EHjTy5_KuSkqu+BGtS_aLoRv9Kv=kM6NOJtFTR3pbrJ12N1A@mail.gmail.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
To: Ackerley Tng <ackerleytng@google.com>
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
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Wed, 30 Apr 2025 at 19:58, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > Until now, faults to private memory backed by guest_memfd are always
> > consumed from guest_memfd whereas faults to shared memory are consumed
> > from anonymous memory. Subsequent patches will allow sharing guest_memfd
> > backed memory in-place, and mapping it by the host. Faults to in-place
> > shared memory should be consumed from guest_memfd as well.
> >
> > In order to facilitate that, generalize the fault lookups. Currently,
> > only private memory is consumed from guest_memfd and therefore as it
> > stands, this patch does not change the behavior.
> >
> > Co-developed-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c   | 19 +++++++++----------
> >  include/linux/kvm_host.h |  6 ++++++
> >  2 files changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 6d5dd869c890..08eebd24a0e1 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -3258,7 +3258,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
> >
> >  static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> >                                      const struct kvm_memory_slot *slot,
> > -                                    gfn_t gfn, int max_level, bool is_private)
> > +                                    gfn_t gfn, int max_level, bool is_gmem)
> >  {
> >       struct kvm_lpage_info *linfo;
> >       int host_level;
> > @@ -3270,7 +3270,7 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> >                       break;
> >       }
> >
> > -     if (is_private)
> > +     if (is_gmem)
> >               return max_level;
>
> I think this renaming isn't quite accurate.
>
> IIUC in __kvm_mmu_max_mapping_level(), we skip considering
> host_pfn_mapping_level() if the gfn is private because private memory
> will not be mapped to userspace, so there's no need to query userspace
> page tables in host_pfn_mapping_level().
>
> Renaming is_private to is_gmem in this function implies that as long as
> gmem is used, especially for shared pages from gmem, lpage_info will
> always be updated and there's no need to query userspace page tables.
>

I understand.

> >
> >       if (max_level == PG_LEVEL_4K)
> > @@ -3283,10 +3283,9 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> >  int kvm_mmu_max_mapping_level(struct kvm *kvm,
> >                             const struct kvm_memory_slot *slot, gfn_t gfn)
> >  {
> > -     bool is_private = kvm_slot_has_gmem(slot) &&
> > -                       kvm_mem_is_private(kvm, gfn);
> > +     bool is_gmem = kvm_slot_has_gmem(slot) && kvm_mem_from_gmem(kvm, gfn);
>
> This renaming should probably be undone too.

Ack.

> >
> > -     return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
> > +     return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_gmem);
> >  }
> >
> >  void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > @@ -4465,7 +4464,7 @@ static inline u8 kvm_max_level_for_order(int order)
> >       return PG_LEVEL_4K;
> >  }
> >
> > -static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> > +static u8 kvm_max_gmem_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> >                                       u8 max_level, int gmem_order)
> >  {
> >       u8 req_max_level;
> > @@ -4491,7 +4490,7 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
> >                                r == RET_PF_RETRY, fault->map_writable);
> >  }
> >
> > -static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > +static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
> >                                      struct kvm_page_fault *fault)
> >  {
> >       int max_order, r;
> > @@ -4509,8 +4508,8 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
> >       }
> >
> >       fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> > -     fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
> > -                                                      fault->max_level, max_order);
> > +     fault->max_level = kvm_max_gmem_mapping_level(vcpu->kvm, fault->pfn,
> > +                                                   fault->max_level, max_order);
> >
> >       return RET_PF_CONTINUE;
> >  }
> > @@ -4521,7 +4520,7 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
> >       unsigned int foll = fault->write ? FOLL_WRITE : 0;
> >
> >       if (fault->is_private)
> > -             return kvm_mmu_faultin_pfn_private(vcpu, fault);
> > +             return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
> >
> >       foll |= FOLL_NOWAIT;
> >       fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index d9616ee6acc7..cdcd7ac091b5 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2514,6 +2514,12 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >  }
> >  #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> >
> > +static inline bool kvm_mem_from_gmem(struct kvm *kvm, gfn_t gfn)
> > +{
> > +     /* For now, only private memory gets consumed from guest_memfd. */
> > +     return kvm_mem_is_private(kvm, gfn);
> > +}
>
> Can I understand this function as "should fault from gmem"? And hence
> also "was faulted from gmem"?
>
> After this entire patch series, for arm64, KVM will always service stage
> 2 faults from gmem.
>
> Perhaps this function should retain your suggested name of
> kvm_mem_from_gmem() but only depend on
> kvm_arch_gmem_supports_shared_mem(), since this patch series doesn't
> update the MMU in X86. So something like this,

Ack.

> +static inline bool kvm_mem_from_gmem(struct kvm *kvm, gfn_t gfn)
> +{
> +       return kvm_arch_gmem_supports_shared_mem(kvm);
> +}
>
> with the only usage in arm64.
>
> When the MMU code for X86 is updated, we could then update the above
> with
>
> static inline bool kvm_mem_from_gmem(struct kvm *kvm, gfn_t gfn)
> {
> -       return kvm_arch_gmem_supports_shared_mem(kvm);
> +       return kvm_arch_gmem_supports_shared_mem(kvm) ||
> +              kvm_gmem_should_always_use_gmem(gfn_to_memslot(kvm, gfn)->gmem.file) ||
> +              kvm_mem_is_private(kvm, gfn);
> }
>
> where kvm_gmem_should_always_use_gmem() will read a guest_memfd flag?

I'm not sure I follow this one... Could you please explain what you
mean a bit more?

Thanks,
/fuad

> > +
> >  #ifdef CONFIG_KVM_GMEM
> >  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >                    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,

