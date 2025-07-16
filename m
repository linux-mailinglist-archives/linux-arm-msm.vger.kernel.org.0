Return-Path: <linux-arm-msm+bounces-65164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1FB06FF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2C5C4A49B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBC328C5BD;
	Wed, 16 Jul 2025 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HAt6/zdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4771226E6F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752653541; cv=none; b=szQYvPEJQeXdEZ6c6Jwyk1z2ht6ywVCfp55J2iB0P/UXXhAhHgIGD/5pbidgfjyUqicl4xgEMaQU2gRo66Z+dOdf4YbKYFWx+ib8iFmcGDj1fLkZAay2HfOYDUzCDLXh7clR4EsjUGeih5HVQr+hGyYYzVRU48Ah21HRr4XdkB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752653541; c=relaxed/simple;
	bh=akkPE8cUwnDaLvvZprEXhA/Rq+qpzs+cyaTCQNnKx+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxYNAT/PVR/kbRH3NaGG/o9mL+6tSQNYFfiGhQHnUSB2ll10tYjFplNTsLN2fTdhBqLYUkUDExjwRHuKnv/jI7ZO5jzGdg7umROz340Hl/VP878FdRmU/RHsly26KlTXEQ67E/n7GKYqL2Z2vJeblMY44P6bUxKfyWNIDLexMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HAt6/zdp; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso347761cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752653538; x=1753258338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9lXG3S9BZe4HTILb/Bnao5N33QhAfEHK8ncuEoyNOSE=;
        b=HAt6/zdpt3seAtS7/cvUkdP2eO3naoP1/7a4kwRfemkRlXrErtvmMghZotVwSVJCzY
         lMRNoIUaP+shoNYaFs9cOG+dq7If/iNQ5t1zo/rphtNl+IoUcQsvjNb1Lf4g5yOCcH92
         hz9jRhXpiPqb2Qrn5GzWyja0iLVjH33/U64+VI5PvRIQ85/AYHqn3jXa3RcroKhId2di
         VMnzbXg+QpD6gm0c9xpgaHFpgVdRtyEUdv21ckcJfyx6ajHZP45+59SVDozJSura+xX+
         BnByY/2399uECq91ciKEbwSmDeig/UtnwLhQdQTZOvj/eqxObEdgorzNUi9LoyCfG7iy
         3n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752653538; x=1753258338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lXG3S9BZe4HTILb/Bnao5N33QhAfEHK8ncuEoyNOSE=;
        b=wCm6/CiihNzw5B7B5HSPcHlIzN4XyUovjiRbYgcSgW/gM4rD9h6EHUleZynhW7fA5U
         hQ9NSZp4MSV+DuwrypkzA1VoY6Z8GhfOIolEVxXllUbxatASRMBS96QWUiZd4tUyyZFe
         nhGVeDAGPz8qhokpMb59VtdQtRgSRBgpxPOj3EM3LAWwYlHxvuof5FDVpczIwKzCfryV
         /1jnWuCFa+alBxb9XoYbB0MILBsbpHBm5wBMc7plaXVga8vTVY+13qHQEA8+O4DgRyZ+
         H8o0P9LDSq3BcuWY6TUQw0HsxMwwRwW4Q3v/EmubLoKU/qPF1m7J3kWz6vXRK/0wL8zI
         odZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI+Xtynk3iUEy72/YlukJ12qteH/rfngrdRv4rDYXsb0gcXj3aDuIpD7UxmmSjywuYVy4acNg/OeR+qvnJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ggg/gAA/wcawI/vp0zB0koNE6mfhDPkMWaHz+d/ftgoF1YME
	1NOTwFPysprFYHVwL/Ny9eJksw5xvZ9HGKPMwtuoVtherNvhtBpELPvYdsHmAmFXpcNAYdFvdWS
	NzwGmhMj8myKXBLpxgZFnI1mbjHkOdNWC/1RxUa01
X-Gm-Gg: ASbGncvUowoZRkjiAgByGeXM95u2Xz8D0gSBRL7IG/Di258plW5tc4c31cyzoeRScQv
	7GPQuj04tDPn4tJ+QYsxap8sLjxEpOK7LK+2io8WRM+lMg55VeD0dv00MRXtGRwKrJgJ9jAUiAn
	GStUMQwslF9ZBwrggmvdsuHyf55Ddt9UMC+rz4wgHa+0xamlND856G18AKR1cIsrdxnlXIo4MDX
	7+nBcTkCkRx89ZUHrIkP0TyTCZcaIcFRPdt
X-Google-Smtp-Source: AGHT+IGBOCxJ/Qm9HEzyLGT9rdfHPf0UnzAM8lyi0X0Lv1v93DUUc8uHVzmb4HnCFFNKyy0ua3P+EnrBZKtAIViOZ5A=
X-Received: by 2002:a05:622a:1a9a:b0:4a5:9b0f:a150 with SMTP id
 d75a77b69052e-4ab953d76admr1899631cf.16.1752653537471; Wed, 16 Jul 2025
 01:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com> <20250715093350.2584932-3-tabba@google.com>
 <a4091b13-9c3b-48bf-a7f6-f56868224cf5@intel.com>
In-Reply-To: <a4091b13-9c3b-48bf-a7f6-f56868224cf5@intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 16 Jul 2025 09:11:40 +0100
X-Gm-Features: Ac12FXywDVFBk8xIRrEGHJ76oUEfDIBGYlNiYZT2NsSZ7eZhzD9_CXX8jGKmVsI
Message-ID: <CA+EHjTy5zUJt5n5N1tRyHUQN6-P6CPqyC7+6Zqhokx-3=mvx+A@mail.gmail.com>
Subject: Re: [PATCH v14 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
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

Hi Xiaoyao,

On Wed, 16 Jul 2025 at 05:09, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>
> On 7/15/2025 5:33 PM, Fuad Tabba wrote:
> > The original name was vague regarding its functionality. This Kconfig
> > option specifically enables and gates the kvm_gmem_populate() function,
> > which is responsible for populating a GPA range with guest data.
>
> Well, I disagree.
>
> The config KVM_GENERIC_PRIVATE_MEM was introduced by commit 89ea60c2c7b5
> ("KVM: x86: Add support for "protected VMs" that can utilize private
> memory"), which is a convenient config for vm types that requires
> private memory support, e.g., SNP, TDX, and KVM_X86_SW_PROTECTED_VM.
>
> It was commit e4ee54479273 ("KVM: guest_memfd: let kvm_gmem_populate()
> operate only on private gfns") that started to use
> CONFIG_KVM_GENERIC_PRIVATE_MEM gates kvm_gmem_populate() function. But
> CONFIG_KVM_GENERIC_PRIVATE_MEM is not for kvm_gmem_populate() only.
>
> If using CONFIG_KVM_GENERIC_PRIVATE_MEM to gate kvm_gmem_populate() is
> vague and confusing, we can introduce KVM_GENERIC_GMEM_POPULATE to gate
> kvm_gmem_populate() and select KVM_GENERIC_GMEM_POPULATE under
> CONFIG_KVM_GENERIC_PRIVATE_MEM.
>
> Directly replace CONFIG_KVM_GENERIC_PRIVATE_MEM with
> KVM_GENERIC_GMEM_POPULATE doesn't look correct to me.

I'll quote David's reply to an earlier version of this patch [*]:

> > I'm curious what generic means in this name?
>
> That an architecture wants to use the generic version and not provide
> it's own alternative implementation.
>
> We frequently use that term in this context, see GENERIC_IOREMAP as one
> example.

[*] https://lore.kernel.org/all/b6355951-5f9d-4ca9-850f-79e767d8caa2@redhat.com/

Thanks,
/fuad

> > The new name, KVM_GENERIC_GMEM_POPULATE, describes the purpose of the
> > option: to enable generic guest_memfd population mechanisms. This
> > improves clarity for developers and ensures the name accurately reflects
> > the functionality it controls, especially as guest_memfd support expands
> > beyond purely "private" memory scenarios.
> >
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Shivank Garg <shivankg@amd.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > Co-developed-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/x86/kvm/Kconfig     | 6 +++---
> >   include/linux/kvm_host.h | 2 +-
> >   virt/kvm/Kconfig         | 2 +-
> >   virt/kvm/guest_memfd.c   | 2 +-
> >   4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> > index 2eeffcec5382..df1fdbb4024b 100644
> > --- a/arch/x86/kvm/Kconfig
> > +++ b/arch/x86/kvm/Kconfig
> > @@ -46,7 +46,7 @@ config KVM_X86
> >       select HAVE_KVM_PM_NOTIFIER if PM
> >       select KVM_GENERIC_HARDWARE_ENABLING
> >       select KVM_GENERIC_PRE_FAULT_MEMORY
> > -     select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
> > +     select KVM_GENERIC_GMEM_POPULATE if KVM_SW_PROTECTED_VM
> >       select KVM_WERROR if WERROR
> >
> >   config KVM
> > @@ -95,7 +95,7 @@ config KVM_SW_PROTECTED_VM
> >   config KVM_INTEL
> >       tristate "KVM for Intel (and compatible) processors support"
> >       depends on KVM && IA32_FEAT_CTL
> > -     select KVM_GENERIC_PRIVATE_MEM if INTEL_TDX_HOST
> > +     select KVM_GENERIC_GMEM_POPULATE if INTEL_TDX_HOST
> >       select KVM_GENERIC_MEMORY_ATTRIBUTES if INTEL_TDX_HOST
> >       help
> >         Provides support for KVM on processors equipped with Intel's VT
> > @@ -157,7 +157,7 @@ config KVM_AMD_SEV
> >       depends on KVM_AMD && X86_64
> >       depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
> >       select ARCH_HAS_CC_PLATFORM
> > -     select KVM_GENERIC_PRIVATE_MEM
> > +     select KVM_GENERIC_GMEM_POPULATE
> >       select HAVE_KVM_ARCH_GMEM_PREPARE
> >       select HAVE_KVM_ARCH_GMEM_INVALIDATE
> >       help
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 755b09dcafce..359baaae5e9f 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2556,7 +2556,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> >   int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_order);
> >   #endif
> >
> > -#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> > +#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
> >   /**
> >    * kvm_gmem_populate() - Populate/prepare a GPA range with guest data
> >    *
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index 49df4e32bff7..559c93ad90be 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -116,7 +116,7 @@ config KVM_GMEM
> >          select XARRAY_MULTI
> >          bool
> >
> > -config KVM_GENERIC_PRIVATE_MEM
> > +config KVM_GENERIC_GMEM_POPULATE
> >          select KVM_GENERIC_MEMORY_ATTRIBUTES
> >          select KVM_GMEM
> >          bool
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index b2aa6bf24d3a..befea51bbc75 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -638,7 +638,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >   }
> >   EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
> >
> > -#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> > +#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
> >   long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long npages,
> >                      kvm_gmem_populate_cb post_populate, void *opaque)
> >   {
>
>

