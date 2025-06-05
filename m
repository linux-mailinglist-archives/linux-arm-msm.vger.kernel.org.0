Return-Path: <linux-arm-msm+bounces-60350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF96ACF3DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7F2165C50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 16:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3136786347;
	Thu,  5 Jun 2025 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1RDqWDYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7835933062
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139921; cv=none; b=jRTn0HBy3f7o1Kg4bQtMPNtw6Se/TpYCmra62U6KYaODmIT6I7BWSD/DrIPtDNAbri0/b7B/KwhLgFxr5eA2ecuBddLKfMvKP7pdAj1XwW32vl5xx0nP3C0tGnTkoDfzZjKDuZPbhXnUrG/w8Ut/UPK5pZZSn8NMvd5HJTLV26g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139921; c=relaxed/simple;
	bh=6lOtFIHKrjKKY2yPe3PXFI2Tfr8nvEQlzUWoA9G5Tr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INue+nkLZSJ4i0Wy3Elv8fr/Fped+JWjdk6jbCqGU0ly8peTDyXGRV5rUySmzQ5J/Yo8qHJGbafkoPDYuoZ6Wp8Z32+CTWj4uPNMu8YcHCAEaAehsREXiK9a5WQZKqIxWVdAc1rqyJqdBrc01mVigja+e9XShh2goXnC9W/bdSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1RDqWDYv; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a5ac8fae12so745111cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749139918; x=1749744718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AVQTBJlbhCkTd304Z8LDEkMLDfW8IzBGu64gE9FirnM=;
        b=1RDqWDYvKVqVp+hXyH48TCPCoCjOBGHUp3nJlbmCxvf2ixJdHvWbeQ2Uel5IRHzDJY
         4SX8wRsv9ivv6GOlwB29610i8UJYooM2zbPJR4D3M1SbgjQRPEIeJZ3/Jphjq8WLlyaC
         5yke2Q8ppkO1G0QKr1DqpyI3a0/JNkzv+6GNy6qzOkEmwtH4f7CkO1RlR5t0qSzLGsUS
         2fbKEmvHrZ8cUZqpLdKTVFqnbGf2KegmFS18Vkk9IZ74nkGsvBXFqtTfj8PGDHWD9/el
         aFgtIzJEI83bgY3VmYMO/JWoUM4nqdUqzHk6ryLka8wIOrVL0j6awGxUbTjYEA2dgus0
         zJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139918; x=1749744718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVQTBJlbhCkTd304Z8LDEkMLDfW8IzBGu64gE9FirnM=;
        b=WDzdHQ/CpoN/GqAukqsPFkBSWFQjUKJlPqyItd8zu1OXlVZB0/daQ5/PyVMCzuWpcm
         TFsU05xlwiPVRfExdLhaFx1E0BGxGY5ztrYRqYsXYQEOP13Gfbpxv03UHPOLyRHWVMIz
         /487xw26OWNucnPLCwnbaWdsum1/0YUUyiHBsddRzc5rytyvfM5X8lUBQuh/jok6QQAx
         7o7fijz3W34LV96Far8K8w8GCwLytyvHd0MW7H5xZcgcQb0TnSXHT6SNxx1n5PzdFL5V
         kYlJb2yVXbnRdQ/LE4SsU9sO3cuvk86u2Sj4HD6IfNsp9mBHAXMVplHBhNg6OS59WjWG
         MV5A==
X-Forwarded-Encrypted: i=1; AJvYcCWEMRcUuErKYNG9mklYfbi250TDFX03jL/FMhc50mK4ByRdui8QzOZ7PYX/WJ/A1ZCtkiVGGk5S0PszwIC2@vger.kernel.org
X-Gm-Message-State: AOJu0YyXY67ID1/4L1fGM5PdZr+GpIFU/s/fFksWkpG7SSbumfZupSMd
	YQHUBNjvA8hYEy3X69Jw8mIlJvC0d3Ryc19HCWpdUjSgGQDhkwlnNmug5t1c/jR6vKtFpr7qct8
	9HlRkHaLFPsgweoa+B4Mn/0GN5fRNohi321D0LZ9L
X-Gm-Gg: ASbGncvgpXjGolOi5mfYFT4L9j7UYat+1Dnb1gz2xk+3INvBo41PBZlI/wCkahyHjZR
	tEOzUedIFOjwINznYxb7sKXi2oT9DEwgcWtsCb/YgRf1WeVyskYTmnkVSOSjoPdDKgmDlErzPOu
	5L0JN9rgW2nOwNsY1mczRsX4/cY+hTD14C4h3j67ekoH0=
X-Google-Smtp-Source: AGHT+IGW1AVosxjNsFSIObbIwdEXbd942cmJ5pLbHiwd321kOxoWe+7++7JtO3HfWK1XkI6NzVd1UixGjAX3NzyuEHY=
X-Received: by 2002:a05:622a:1e19:b0:486:a185:3136 with SMTP id
 d75a77b69052e-4a5af3be5femr4553531cf.14.1749139911983; Thu, 05 Jun 2025
 09:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com> <20250605153800.557144-13-tabba@google.com>
 <4909d6dc-09f5-4960-b8be-5150b2a03e45@redhat.com>
In-Reply-To: <4909d6dc-09f5-4960-b8be-5150b2a03e45@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 5 Jun 2025 17:11:15 +0100
X-Gm-Features: AX0GCFvM0cIQHeoKF8w2gaIC3qDuLSImbI5TRY95h3Mg5SfZMXcAsghCvn7NJBM
Message-ID: <CA+EHjTwnAV=tu1eUjixyKAhE4bpNc3XV7EhnMME3+WJ-cu6PNA@mail.gmail.com>
Subject: Re: [PATCH v11 12/18] KVM: x86: Enable guest_memfd shared memory for
 SW-protected VMs
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
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

On Thu, 5 Jun 2025 at 16:49, David Hildenbrand <david@redhat.com> wrote:
>
> On 05.06.25 17:37, Fuad Tabba wrote:
> > Define the architecture-specific macro to enable shared memory support
> > in guest_memfd for relevant software-only VM types, specifically
> > KVM_X86_DEFAULT_VM and KVM_X86_SW_PROTECTED_VM.
> >
> > Enable the KVM_GMEM_SHARED_MEM Kconfig option if KVM_SW_PROTECTED_VM is
> > enabled.
> >
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h | 10 ++++++++++
> >   arch/x86/kvm/Kconfig            |  1 +
> >   arch/x86/kvm/x86.c              |  3 ++-
> >   3 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 709cc2a7ba66..ce9ad4cd93c5 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -2255,8 +2255,18 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
> >
> >   #ifdef CONFIG_KVM_GMEM
> >   #define kvm_arch_supports_gmem(kvm) ((kvm)->arch.supports_gmem)
> > +
> > +/*
> > + * CoCo VMs with hardware support that use guest_memfd only for backing private
> > + * memory, e.g., TDX, cannot use guest_memfd with userspace mapping enabled.
> > + */
> > +#define kvm_arch_supports_gmem_shared_mem(kvm)                       \
> > +     (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&                      \
> > +      ((kvm)->arch.vm_type == KVM_X86_SW_PROTECTED_VM ||             \
> > +       (kvm)->arch.vm_type == KVM_X86_DEFAULT_VM))
> >   #else
> >   #define kvm_arch_supports_gmem(kvm) false
> > +#define kvm_arch_supports_gmem_shared_mem(kvm) false
> >   #endif
> >
> >   #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
> > diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> > index b37258253543..fdf24b50af9d 100644
> > --- a/arch/x86/kvm/Kconfig
> > +++ b/arch/x86/kvm/Kconfig
> > @@ -47,6 +47,7 @@ config KVM_X86
> >       select KVM_GENERIC_HARDWARE_ENABLING
> >       select KVM_GENERIC_PRE_FAULT_MEMORY
> >       select KVM_GENERIC_GMEM_POPULATE if KVM_SW_PROTECTED_VM
> > +     select KVM_GMEM_SHARED_MEM if KVM_SW_PROTECTED_VM
> >       select KVM_WERROR if WERROR
>
> Is $subject and this still true, given that it's now also supported for
> KVM_X86_DEFAULT_VM?

True, just not the whole truth :)

I guess a better one would be, for Software VMs (remove protected)?

/fuad
> --
> Cheers,
>
> David / dhildenb
>

