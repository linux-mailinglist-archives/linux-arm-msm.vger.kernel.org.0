Return-Path: <linux-arm-msm+bounces-60239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29848ACDF23
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51593A32C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3D028ECF3;
	Wed,  4 Jun 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M6TjxX+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC5F1D540
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043912; cv=none; b=MtvwE/1sKigTDa7K4uZObQH4LUlrvtAb0p4dFeGJwkTmw379unXoLdPHOEen0SFjMx9KDRIgfzXHGA469VgVNTl8zY4Tk0pNIojywH0VB6Cpf8+KkJ8oc0Qi9lY1/WOpDeUf/teMGMsu3BdVN2yr+5Nix4eKO6TwvsUF0hxgPdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043912; c=relaxed/simple;
	bh=O+3qYBkuZvOYKdQmd+lqFDADiWY3hm2oALBY8YyGjRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBWEfx3p8F3mfmyu9VQNZJHQpTLZjSvQ6UqngknUvEOxl9HiHUt3DBRiiUEjszkMvy3DHH3Do+mq9bcUFgrd3+LjqA/XYt7eQaTgbvp8vLynh6dFnsrKjDk1o3F1l4RpHDM9G/dbwG0UlGx6kf2jzhy7MAY99q5NMrBvjBhz8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M6TjxX+2; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a5ac8fae12so77521cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749043909; x=1749648709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U64ULQY366JHJ6Sx1aslM0i3znI6AoNF+AhIqQiQaNw=;
        b=M6TjxX+2mKoMXbSK37pkS0oYYSa+u5VD8AxDLuxkiT2xn2AZwDEpVZv0pwbW3RcOcg
         HmtqbxIyW8aFWU0vUSugUEeHvouiJMDwuNnzWaHlbJicSxpcQ7s9J+kDFpFwSUj6A8TH
         /JyzDqt5C9udJWvewUiSSQIfcVoyLYbcm+LA9cGOrWRwNBqyqcFQYl1LsDX2FLmP12Es
         Mfu8kQccJZiXUcBCmz16uwbV+ARj9xEL3awk2j5eMN6vE0uSgNXPF3KT7HC40U4wEt1/
         GI2TUj5Eg7GsrybHVm3QSYkMGbyjrF2F4jO9gHxeuSmDcDtE4QAm9OBuQL7o3kg/qO3Q
         R6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043909; x=1749648709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U64ULQY366JHJ6Sx1aslM0i3znI6AoNF+AhIqQiQaNw=;
        b=Ma4zpOok6V0O2XHaks8XBOlxiVK6pNKsZ/VobCDgnaU/s2ZyWf8J2SHLKnj0HLHdbK
         2JFtKvVFeIEhMcV/gGuCkgIvBD/58ezUntweCV3RfhUHp4T4hFPVRpArO5SzHx7uJayY
         oVBtNAI5rhBg4bnnIhXSAe3l29QPzoN5M3UcMv9dOXmII7UhNJZZhMBeVf8y2y5iA+jg
         jALVOtUA84JiIc82jgWAx6g8MjXUuaoNLOS9L+aKHPC97h9h6pnxZQkoaNiocg3LkA4C
         1lnDXOYNGXXVxdcBtHrqhxIrl9074wpWxyeLxpnZETEYmlEv+/r/mn27HnvK5lFpvtph
         b60g==
X-Forwarded-Encrypted: i=1; AJvYcCXEBhWL5tG/duY5aRFnBS1fm6+1mLdM4SG0hP5JWCgCUm3PKOyIMdXRqSsYk17AFPZKRUiiuchW70j//5eE@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjHPFNANWQN0cimSiqawUuh18vEkQA1YWObb/KTSAcLLRWCcb
	0dAiajfaIJ5G1VjrnnBocuDRfm6u7vS5GVZ09X0qzDPcEMewNVUCKZfPDSrorUhG1QxG9VJrEzP
	g73Axk64UTMCRLUs8PN8qycXoP8oJW/8mVEZ8JIx3
X-Gm-Gg: ASbGncvJ3E4LPYwCuV9EDSjzGvKLFLZajkYRaMZgtaTF4N2+BrR/i1NI0UiXu2yp/Zg
	uD72diVYKiqML2fMHl2xFhPS7xDdSunS8lA0Q8XHhf4zuFCt+95gTn7QGS7nyNTyZiNVzrc8Lx/
	eeyja6Jlykt8GrFwDgnyVzDq2pXJWUMjnUs362rSDgbGDbeN4F47BZReLtTv+pP4GBpT1E+74=
X-Google-Smtp-Source: AGHT+IHFxNyfeCkrmPB39UOxojEdJAvr9WP0K1kR8JJNwFVpZqhXOBdLWxdCHfxLQMAur6bywA3oSFCMPjvNqDTSLOA=
X-Received: by 2002:a05:622a:5912:b0:48a:5b89:473b with SMTP id
 d75a77b69052e-4a5a60dcaf0mr3295721cf.7.1749043908478; Wed, 04 Jun 2025
 06:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com> <20250527180245.1413463-15-tabba@google.com>
 <2195c01b-3a17-46c5-a013-66922e8509bd@redhat.com>
In-Reply-To: <2195c01b-3a17-46c5-a013-66922e8509bd@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 4 Jun 2025 14:31:11 +0100
X-Gm-Features: AX0GCFtqukMxO0pis2hyEa-S596-RXzEqFLluLmu-N319w02tyWHzt3chjxqO1k
Message-ID: <CA+EHjTxgQyOO-C=pNCY=QTfWOq0EF58RvaN_oAh6hgMPjPVQkw@mail.gmail.com>
Subject: Re: [PATCH v10 14/16] KVM: arm64: Enable mapping guest_memfd in arm64
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

On Wed, 4 Jun 2025 at 14:17, David Hildenbrand <david@redhat.com> wrote:
>
> On 27.05.25 20:02, Fuad Tabba wrote:
> > Enable mapping guest_memfd backed memory at the host in arm64. For now,
> > it applies to all arm64 VM types in arm64 that use guest_memfd. In the
> > future, new VM types can restrict this via
> > kvm_arch_gmem_supports_shared_mem().
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/arm64/include/asm/kvm_host.h | 5 +++++
> >   arch/arm64/kvm/Kconfig            | 1 +
> >   arch/arm64/kvm/mmu.c              | 7 +++++++
> >   3 files changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 08ba91e6fb03..8add94929711 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1593,4 +1593,9 @@ static inline bool kvm_arch_has_irq_bypass(void)
> >       return true;
> >   }
> >
> > +#ifdef CONFIG_KVM_GMEM
> > +#define kvm_arch_supports_gmem(kvm) true
> > +#define kvm_arch_supports_gmem_shared_mem(kvm) IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM)
> > +#endif
> > +
> >   #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 096e45acadb2..8c1e1964b46a 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -38,6 +38,7 @@ menuconfig KVM
> >       select HAVE_KVM_VCPU_RUN_PID_CHANGE
> >       select SCHED_INFO
> >       select GUEST_PERF_EVENTS if PERF_EVENTS
> > +     select KVM_GMEM_SHARED_MEM
> >       help
> >         Support hosting virtualized guest machines.
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 896c56683d88..03da08390bf0 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -2264,6 +2264,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >       if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> >               return -EFAULT;
> >
> > +     /*
> > +      * Only support guest_memfd backed memslots with shared memory, since
> > +      * there aren't any CoCo VMs that support only private memory on arm64.
> > +      */
> > +     if (kvm_slot_has_gmem(new) && !kvm_gmem_memslot_supports_shared(new))
> > +             return -EINVAL;
> > +
>
> Right, that can get lifted once we have such VMs.
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!
/fuad

> --
> Cheers,
>
> David / dhildenb
>

