Return-Path: <linux-arm-msm+bounces-65228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AF5B0755B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 570347A99AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209572F3636;
	Wed, 16 Jul 2025 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RXiU0sL1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8C128C2CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752668050; cv=none; b=klYHH63SeDt2smQJIZWrfKoHdNtxWooIwsNxGRZoufgrxIll0w01Y4UDKEdMwpEZzbmXenlncP9DvyWesyP+S4KG++uEp4Q0HGxxUmAwW38HqOqBrr71sJBsp0iveKLRlEYau+i08j6yPoyOeH3TVnPGarm67OesS5FciBN11fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752668050; c=relaxed/simple;
	bh=TTKUqSq9eYEOjKlZ3dGOqTof2EgUkFN2BOZDiWZPOe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dc0KWmOP02LFDen+u1at0vauPZtx92iGHrLMSFFX2HEXJmZUpY+UM4yqTwlS+kf4AccaqDFWqvZJCnejQ20Jgvh7/xFSJfu/JiuVMoaIRAO8hv7cLhez4VUFknsUY3VKQCpsXqGyt+e7xQ58Rp6Il0q1jBHrXGtKKdCK1GtRvGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RXiU0sL1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ab3855fca3so182401cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752668046; x=1753272846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aG/7TZS+9GKIxRWop/x1+ei5MRrU7wFBpXJxkGG/wu0=;
        b=RXiU0sL1ycIN9d22Y3+Ac+uV5CJ1HOmImU+lMyP9jpO5nMXLrpkZNrPXgr4hxuCQP7
         dkSHFXpMbgkohlali0aCvEvGKSAPET4OWhFhYjYM0EVHQHtE6DetRXXyFOS9WMpYc/+J
         cAMp9C8SD7YuK3udG172DTMfTfDFEZyl4/MEsp4dCL40yUGALw66GDIr37SD9RYKKVah
         nbnCPhrEgLDRk4iXZ6WCkWV6sf4pDCNTLOaqRJXlDLKTfBm0bwcfRBBT14IWZxABWM9N
         acpFV1m3x4Ljv/BpRJGLz3gmJaPENZRr+ACzGu3jGec+4B/8OedqwePAfa+MydnxiPVx
         TyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752668046; x=1753272846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG/7TZS+9GKIxRWop/x1+ei5MRrU7wFBpXJxkGG/wu0=;
        b=Vrl5D9FWl8mR9C97/PQ3wHQCkc3wcOuc7a2EH66IrfLXPHXrc5vv40LeR2mJy+MmWx
         807bdN/QRkWieSh46aqvpIbLr9HIv8t9ZARzcB15Wmgar1hl+iSBGP0r+0YE4vQsU+xO
         2EGUK/+mg9uMu7jONs6klPcQUT4boRYoaU1xIMoLjgG3nMe3+4lKMvmgEe64xyZjuJ9n
         rTBZ+gMUL78x30U3OK2ZaU8RaJu59szQG5jStLthWKnhxSbC3xCun8GVieoajG2N0yTV
         QMtB+LXOLxL9TSjKcf0n+9votva1NZnsxNi5ntGcBqot4NXOQU7yqNWsrHnE7FHbeyMJ
         CAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEdm92Vdq3KRjZyHkqMa2j0T2w8zbZMWBx8/hMPbpmIp3sgfWl3J75G91SVE7hAPYmfbMx1eQgwE42HePf@vger.kernel.org
X-Gm-Message-State: AOJu0YxAlYqh0z/lOkdIzNO7YuO1AMcF6A1gR9CeWBAdSM0Rf3hqYuoQ
	IDtbmouGVcej0u1FZESXV4yqtqWWlu5xMqDluTyPQp8Vx5LUAMBqjWIaJPiCMNJt4P01lNE0ixK
	7B0AgCzKBot8lRubE8uuTsXGceEjSekeXJskol8mF
X-Gm-Gg: ASbGncuAL0agOc7vfYt9Chpddq/SP4iwCIUaanWeECHnpQ6NCysLXQis7Lye2YS55vH
	IDbBj2k5xJA+mU6EecYH1akw+ONXRLmmEJ87CWPbafNfoX9VXwwkJ/9NS9iTu7mKMTOD9Rdfsy7
	OV2hhSx4XxeKTL3W69Bo7EarOlSEM45FKkoU8e0cUkzzpvu2swMt2twGzio9Lw+8aM/4swDEHfh
	fxfqMD0Htx2Cb3TEZv7DGcZveXPquCclp4=
X-Google-Smtp-Source: AGHT+IE9YVn0eZnxvGtCeiWdCOyAhPrHi/vRfxF0vM9xrH43ByiHOUhO/4d/xBRn5PAZVeSsErTsBb99s/2AYQflYRY=
X-Received: by 2002:a05:622a:1aa0:b0:4a9:b6e1:15a with SMTP id
 d75a77b69052e-4ab954d8746mr2571621cf.24.1752668044950; Wed, 16 Jul 2025
 05:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com> <20250715093350.2584932-3-tabba@google.com>
 <a4091b13-9c3b-48bf-a7f6-f56868224cf5@intel.com> <CA+EHjTy5zUJt5n5N1tRyHUQN6-P6CPqyC7+6Zqhokx-3=mvx+A@mail.gmail.com>
 <418ddbbd-c25e-4047-9317-c05735e02807@intel.com> <778ca011-1b2f-4818-80c6-ac597809ec77@redhat.com>
 <6927a67b-cd2e-45f1-8e6b-019df7a7417e@intel.com> <CA+EHjTz7C4WgS2-Dw0gywHy+zguSNXKToukPiRfsdiY8+Eq6KA@mail.gmail.com>
 <47395660-79ad-4d22-87b0-c5bf891f708c@redhat.com> <fa1ccce7-40d3-45d2-9865-524f4b187963@intel.com>
In-Reply-To: <fa1ccce7-40d3-45d2-9865-524f4b187963@intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 16 Jul 2025 13:13:28 +0100
X-Gm-Features: Ac12FXxuj3h3QF7Rhx9ZguI5DX-IFwgDrQ4Jd5znL_s2tRo5HM04_E0MBe2pEsw
Message-ID: <CA+EHjTzb0D3maKLEgvnPuDDcm4KKPb0W=AWif-tcLQw-R44dow@mail.gmail.com>
Subject: Re: [PATCH v14 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, yilun.xu@intel.com, 
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

Hi Xiaoyao,

On Wed, 16 Jul 2025 at 13:02, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>
> On 7/16/2025 7:15 PM, David Hildenbrand wrote:
> > On 16.07.25 13:05, Fuad Tabba wrote:
> >> On Wed, 16 Jul 2025 at 12:02, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> >>>
> >>> On 7/16/2025 6:25 PM, David Hildenbrand wrote:
> >>>> On 16.07.25 10:31, Xiaoyao Li wrote:
> >>>>> On 7/16/2025 4:11 PM, Fuad Tabba wrote:
> >>>>>> On Wed, 16 Jul 2025 at 05:09, Xiaoyao Li<xiaoyao.li@intel.com> wrote:
> >>>>>>> On 7/15/2025 5:33 PM, Fuad Tabba wrote:
> >>>>>>>> The original name was vague regarding its functionality. This
> >>>>>>>> Kconfig
> >>>>>>>> option specifically enables and gates the kvm_gmem_populate()
> >>>>>>>> function,
> >>>>>>>> which is responsible for populating a GPA range with guest data.
> >>>>>>> Well, I disagree.
> >>>>>>>
> >>>>>>> The config KVM_GENERIC_PRIVATE_MEM was introduced by commit
> >>>>>>> 89ea60c2c7b5
> >>>>>>> ("KVM: x86: Add support for "protected VMs" that can utilize private
> >>>>>>> memory"), which is a convenient config for vm types that requires
> >>>>>>> private memory support, e.g., SNP, TDX, and KVM_X86_SW_PROTECTED_VM.
> >>>>>>>
> >>>>>>> It was commit e4ee54479273 ("KVM: guest_memfd: let
> >>>>>>> kvm_gmem_populate()
> >>>>>>> operate only on private gfns") that started to use
> >>>>>>> CONFIG_KVM_GENERIC_PRIVATE_MEM gates kvm_gmem_populate()
> >>>>>>> function. But
> >>>>>>> CONFIG_KVM_GENERIC_PRIVATE_MEM is not for kvm_gmem_populate() only.
> >>>>>>>
> >>>>>>> If using CONFIG_KVM_GENERIC_PRIVATE_MEM to gate
> >>>>>>> kvm_gmem_populate() is
> >>>>>>> vague and confusing, we can introduce KVM_GENERIC_GMEM_POPULATE
> >>>>>>> to gate
> >>>>>>> kvm_gmem_populate() and select KVM_GENERIC_GMEM_POPULATE under
> >>>>>>> CONFIG_KVM_GENERIC_PRIVATE_MEM.
> >>>>>>>
> >>>>>>> Directly replace CONFIG_KVM_GENERIC_PRIVATE_MEM with
> >>>>>>> KVM_GENERIC_GMEM_POPULATE doesn't look correct to me.
> >>>>>> I'll quote David's reply to an earlier version of this patch [*]:
> >>>>>
> >>>>> It's not related to my concern.
> >>>>>
> >>>>> My point is that CONFIG_KVM_GENERIC_PRIVATE_MEM is used for selecting
> >>>>> the private memory support. Rename it to KVM_GENERIC_GMEM_POPULATE is
> >>>>> not correct.
> >>>>
> >>>> It protects a function that is called kvm_gmem_populate().
> >>>>
> >>>> Can we stop the nitpicking?
> >>>
> >>> I don't think it's nitpicking.
> >>>
> >>> Could you loot into why it was named as KVM_GENERIC_PRIVATE_MEM in the
> >>> first place, and why it was picked to protect kvm_gmem_populate()?
> >>
> >> That is, in part, the point of this patch. This flag protects
> >> kvm_gmem_populate(), and the name didn't reflect that. Now it does. It
> >> is the only thing it protects.
> >
> > I'll note that the kconfig makes it clear that it depends on
> > KVM_GENERIC_MEMORY_ATTRIBUTES -- having support for private memory.
> >
> > In any case, CONFIG_KVM_GENERIC_PRIVATE_MEM is a bad name: what on earth
> > is generic private memory.
>
> "gmem" + "memory_attribute" is the generic private memory.
>
> If KVM_GENERIC_PRIVATE_MEM is a bad name, we can drop it, but not rename
> it to CONFIG_KVM_GENERIC_GMEM_POPULATE.
>
> > If CONFIG_KVM_GENERIC_GMEM_POPULATE is for some reason I don't
> > understand yet not the right name, can we have something that better
> > expresses that is is about KVM .. GMEM ... and POPULATE?
>
> I'm not objecting the name of CONFIG_KVM_GENERIC_GMEM_POPULATE, but
> objecting the simple rename. Does something below look reasonable?

Isn't the below practically the same as having one patch that adds
KVM_GENERIC_GMEM_POPULATE, followed by a patch that drops
KVM_GENERIC_PRIVATE_MEM?

Cheers,
/fuad


> ---
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 2eeffcec5382..3f87dcaaae83 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -135,6 +135,7 @@ config KVM_INTEL_TDX
>          bool "Intel Trust Domain Extensions (TDX) support"
>          default y
>          depends on INTEL_TDX_HOST
> +       select KVM_GENERIC_GMEM_POPULATE
>          help
>            Provides support for launching Intel Trust Domain Extensions
> (TDX)
>            confidential VMs on Intel processors.
> @@ -158,6 +159,7 @@ config KVM_AMD_SEV
>          depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>          select ARCH_HAS_CC_PLATFORM
>          select KVM_GENERIC_PRIVATE_MEM
> +       select KVM_GENERIC_GMEM_POPULATE
>          select HAVE_KVM_ARCH_GMEM_PREPARE
>          select HAVE_KVM_ARCH_GMEM_INVALIDATE
>          help
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 755b09dcafce..359baaae5e9f 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2556,7 +2556,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
>   int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> int max_order);
>   #endif
>
> -#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> +#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
>   /**
>    * kvm_gmem_populate() - Populate/prepare a GPA range with guest data
>    *
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 49df4e32bff7..9b37ca009a22 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -121,6 +121,10 @@ config KVM_GENERIC_PRIVATE_MEM
>          select KVM_GMEM
>          bool
>
> +config KVM_GENERIC_GMEM_POPULATE
> +       bool
> +       depends on KVM_GMEM && KVM_GENERIC_MEMORY_ATTRIBUTES
> +
>   config HAVE_KVM_ARCH_GMEM_PREPARE
>          bool
>          depends on KVM_GMEM
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b2aa6bf24d3a..befea51bbc75 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -638,7 +638,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct
> kvm_memory_slot *slot,
>   }
>   EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
>
> -#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> +#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
>   long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user
> *src, long npages,
>                         kvm_gmem_populate_cb post_populate, void *opaque)
>   {
>
>

