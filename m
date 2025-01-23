Return-Path: <linux-arm-msm+bounces-45923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48177A1A106
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843D6160BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FCA1A76D0;
	Thu, 23 Jan 2025 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VsICNFyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9A620CCE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625515; cv=none; b=mLfxrPKr6IPaAei2X5fVqf440CCER+Nz1RBJOrGRvo+hUpw7g9ROTAMGFEm2df+sK6LAb7FwPI+qvOFVaWUwUlRzU1aTFTmAV4JY5vGIC2j5aGXHfCl1uI9iymSARaaRUv7SDs23riHYsDD9GuhtBaBHYIbHHdtq1Q87D8MjLNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625515; c=relaxed/simple;
	bh=bGcxTqKmsBb8N87Mq4hqVGb8HSCQFpQD0j0rx4v9D8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1vf6Ltt9SgUTVEaWwYDf7zHmGoIzNRQsfMUTrSlms+s4Fyumkfiw7jtJyiN5fjqOWbB4AyMVBo0eS4DJ3VLw2xpGn68f5O9iwMg6FnZ8HPhyJkrqFq581/MIBk1afwzXZetYKYOmC9chDSVU4DBe2BMbzAv+yDoToxHZkgvqbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VsICNFyv; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4678c9310afso151931cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 01:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737625512; x=1738230312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEcNU8uTtZ2iPg/qtWEOMuJFId6QoSMZGeGIpgVvrMY=;
        b=VsICNFyvjugVvx1Obi9ayTnWFvSH2pQ/4Zx3mYywSKEPBIPZ1GEy/ePFyUniWV+fW2
         M3RK/0e+RGBq0QLtmuW/tnVT1BjulFHjcNqSNOkE+34i+KX37GuMvJe22KSYx7dUTwEk
         rSUy3kzazxbfB7DO8DW3oPXmecrHqUrl5CvpI6+UI5/qVF31l+M0rHYWEGPJnJSdZifG
         XvQ/hj+5oWmKIDNCUZsbvBupUp6ewz98wrll8yR3BNFHM02pM44vxYUGcfSi3hQkjBgW
         mnBAzZ00YRyQmDpgr4Bv+OGajLW1HMLr3oLENoaFXiyka2rASRByva/RpE4AJu/pER0J
         7/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737625512; x=1738230312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEcNU8uTtZ2iPg/qtWEOMuJFId6QoSMZGeGIpgVvrMY=;
        b=P5URIdfGceY5WH4oTXZBhc+92lPOEXVYPrHef1CKX/sO2q80HI3Ry2UhjaUJrLryhA
         BDlnnnX/i07X1OwbshVr3gKN8KfWWrBM8Gtv/j58O+UcRopW9Tz/iEbGi7tNac61+exg
         TLgV6PQdTLXmcAJCl65ppCvMnkIw7SFLzjx+7YgpagFtdIi9Sac1e/hAucd5WQulWofa
         83zqRnsizT8UxaxI0d2qRZ7MwyzCOwquy4GfPbkMZ39mINZWohP29+jEBtrnFF1JnCj3
         oRiFkn+KNE7Z5ZaACx9V0VlU68aNH4gos4L7/YTXYSpVQVbxgIRWJEMfquGyo8fjBSYq
         g2mg==
X-Forwarded-Encrypted: i=1; AJvYcCVjJVOYi1u1mgs1k1m05uiGMaPgw0f4xkLeLWaZu6FGEPMRgF6H/vGF1kxrg4IJIKchSRg/6fq3y46lIE1Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFFxgxOeVcDqWKU6337JWjAkDXNQNYrVnJvUFpiTNiHnWQ4L5
	5z5Sc3C1zHMjL1g6SC1pVfe3dY97Nc1gBvC9A6pG9V4D6fcvJDU/WmyRja0eWa2UxuOviLcC/kW
	wzQB1DxJ08JIblmNq25TA7kQJxZ/pNrKeFJIU
X-Gm-Gg: ASbGncu+tc8Zn9ATpw6I4EToA5rvqfeD/X7pGIV3RnHIGsmb7Wp70xYKcIvY8TxWRJo
	ktxPszSWfVsiBW2zKg+o6r5YElX1F3g9K9wqhBIRD9g4okd/CKzJSO9LQGKp9z3gt/VOECRirbp
	E6oX4WcafklljzxIYrNPyZWt5Y
X-Google-Smtp-Source: AGHT+IER7cA6/QBLkVavW65nYzzPh4hF96WPXUfHqiDZEI23TKj/dh3hWz99pTfzszZnhj6fFr1Q7Fb2YVi5Sllh6qc=
X-Received: by 2002:ac8:5856:0:b0:465:3d28:8c02 with SMTP id
 d75a77b69052e-46e5c1b3a61mr2945861cf.26.1737625512198; Thu, 23 Jan 2025
 01:45:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com> <20250122152738.1173160-2-tabba@google.com>
 <647bbdac-df82-4cdb-a3e9-287d439b4ef7@redhat.com>
In-Reply-To: <647bbdac-df82-4cdb-a3e9-287d439b4ef7@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jan 2025 09:44:35 +0000
X-Gm-Features: AWEUYZmNNbEvRKlagZNFxvpGHDMT4qY2dN4PrGftGjLuKQKd_3V1aCOwc04j_gk
Message-ID: <CA+EHjTyuVfveW7=seF0uvfpyQtLdZ1ywZ3Z1VmtGZ-z+kzhc7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/9] KVM: guest_memfd: Allow host to mmap
 guest_memfd() pages
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 22 Jan 2025 at 22:07, David Hildenbrand <david@redhat.com> wrote:
>
> On 22.01.25 16:27, Fuad Tabba wrote:
> > Add support for mmap() and fault() for guest_memfd in the host
> > for VMs that support in place conversion between shared and
> > private.
>  > To that end, this patch adds the ability to check> whether the
> architecture has that support, and only allows mmap()
> > if that's the case.
>  > > Additionally, this is gated with a new configuration option,
> > CONFIG_KVM_GMEM_MAPPABLE.
>  > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h |  2 +
> >   include/linux/kvm_host.h        | 11 +++++
> >   virt/kvm/Kconfig                |  4 ++
> >   virt/kvm/guest_memfd.c          | 71 +++++++++++++++++++++++++++++++++
> >   4 files changed, 88 insertions(+)
> >
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index e159e44a6a1b..c0e149bc1d79 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -2206,6 +2206,8 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
> >   #define kvm_arch_has_private_mem(kvm) false
> >   #endif
> >
> > +#define kvm_arch_private_mem_inplace(kvm) false
> > +
> >   #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
> >
> >   static inline u16 kvm_read_ldt(void)
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 401439bb21e3..ebca0ab4c5e2 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -717,6 +717,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> >   }
> >   #endif
> >
> > +/*
> > + * Arch code must define kvm_arch_private_mem_inplace if support for private
> > + * memory is enabled it supports in-place conversion between shared and private.
> > + */
> > +#if !defined(kvm_arch_private_mem_inplace) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
> > +static inline bool kvm_arch_private_mem_inplace(struct kvm *kvm)
> I assume right now this would rather indicate "support for shared
> (mappable) memory in guest_memfd".
>
> Maybe there is a better way to express that :)
>
> kvm_arch_gmem_supports_shared_mem ?
>
> The in-place conversion is (at least to me) implied with support for
> shared memory.

Sounds better than what I had.

> > +
> >   #ifndef kvm_arch_has_readonly_mem
> >   static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
> >   {
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index 54e959e7d68f..59400fd8f539 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -124,3 +124,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
> >   config HAVE_KVM_ARCH_GMEM_INVALIDATE
> >          bool
> >          depends on KVM_PRIVATE_MEM
> > +
> > +config KVM_GMEM_MAPPABLE
> > +       select KVM_PRIVATE_MEM
>
> Easier to grasp might be:
>
> KVM_GMEM_MAPPABLE -> KVM_GMEM_SHARED_MEM
>
> Support for "shared" memory kind of imply mmap support (otherwise, how
> to make use of it :) ),

Like the one above, this makes more sense.


>
> (KVM_PRIVATE_MEM -> KVM_GMEM might also make sense, but it's a different
> discussion)
>
> > +       bool
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 47a9f68f7b24..9ee162bf6bde 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -307,7 +307,78 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >       return gfn - slot->base_gfn + slot->gmem.pgoff;
> >   }
> >
> > +#ifdef CONFIG_KVM_GMEM_MAPPABLE
> > +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> > +{
> > +     struct inode *inode = file_inode(vmf->vma->vm_file);
> > +     struct folio *folio;
> > +     vm_fault_t ret = VM_FAULT_LOCKED;
> > +
> > +     filemap_invalidate_lock_shared(inode->i_mapping);
> > +
> > +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
>
>
> Would the idea be later that kvm_gmem_get_folio() would fail on private
> memory, or do you envision other checks in this code here in the future?

There would be other checks in the future, the idea is that they would
be the ones in:
https://lore.kernel.org/all/20250117163001.2326672-8-tabba@google.com/

What this patch series has, but the other one doesn't, is checks on
mmap to ensure whether the VM type supports that operation in
principle or not.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

