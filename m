Return-Path: <linux-arm-msm+bounces-66630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF687B11407
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 00:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2759AE5E39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 22:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913F623F419;
	Thu, 24 Jul 2025 22:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tkjiDh74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1356023BCEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 22:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753396420; cv=none; b=gDw7RbZCkoc39k7ltH8t5jUAPYoJkADsd7ClO2zyLdGO1OQg7H27HtcnK4vzVfnNmr1OTK0478XsTOysUn164zlisuVvcB95qEbJyj2naWA5snR6NYiLrHNUEXiA8NLpikgDv9DHgJ62+Z3sltInxcd1D1/4bslgv1FU9ZbsE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753396420; c=relaxed/simple;
	bh=fR04mv39CqWH9hOwlExnLKnmwlLVKhJNGIGbrPJHvtY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qf/oD73ZgSXaaQoh3CB2H3E07+UewY6jcLvJLulnqYFwlhtZuc/xHxaBa1fqqyQrJZ/VTh8WeoyWRT8r53vLlKCT/T/bhWYWo2ouBvmaBu6Qgd5eWXtxLAAu4Sa+GhN0J2Mc8k4XWxGRHjVNVXHUqX26EIzMaIklOhRG4ESZeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tkjiDh74; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b31cc625817so1909244a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753396418; x=1754001218; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=inLy5vcBNILr3/MOBz76JuwhCqWg6KJsocdJKuHsHow=;
        b=tkjiDh74RUnF0/IRfnpT70/TXT91ya+rk2ck+drbYaFsfyzRpCdynFm96YM/q7gORK
         +z/KAuF2z3vV1eZaJFW2Y0D6Phvg2MNQDEVpfO9apKmQLEMTCC/pNgw0E1re3n7SBePQ
         dPADMe6euklqPlPQD5+WTjH2Dr5IBSGDpFYAyD/alEj3XWXY4Wgb92NuM6HzkVMH5BdC
         8IQ3aGV3iAamrLx3qsC6NCbpv3VVAhjmVXhSRuffcagx9zYxtmIvMGQEb4e2kdiGEWBg
         7Teqy4j4qbLmwJSLG2HrVNuAxHjw3pNaPRTw7ongDssGEinyvVGWCDP/Bwf/3+yBXOGv
         Rwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753396418; x=1754001218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inLy5vcBNILr3/MOBz76JuwhCqWg6KJsocdJKuHsHow=;
        b=KmOItgfQpKO0JVxHB3MnfcOwHXbz7Eze4j1K4OZaRApJsOZRzA42KJmu328FlUGEJ+
         nP6UuXg+MpbelmOyukUfkix1D8a0R5JPvX6sQG8kgp+QLqJZdgWWlEDG2BIiV+oZYDFU
         Lbs6p8U/BOrnYaVxvZ3v/sU1Tz/tsfJlGTp9UEosTtCbrg8e9ohDoCPihUj3wzj2IALB
         3NeC8u5dOCW2S9drdy7HU8+goREHAxAnxWRb9PNH/X3KK2eiXhSJ5uonjCHLzd+Kdelv
         3UUJUTvC+HB/CWznaXinvrbPKtDRpRRE597EiJCvG/ZVIVk2+Oze51mXRqqBb3FxIrWn
         k05w==
X-Forwarded-Encrypted: i=1; AJvYcCV8pV8h7cY30o0caK4nIyOjhujFv3JKgc6KF0RlP9syyaE+OMh2xvNI/HlxEHn1K1Fq7F/5OGcqfiAEl+mc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+pC4BzgNnSrTqnT4NmohAMesrLXq00yUC8awS3kvJo/G9ch0
	U+NONFSNcKyu54GBqIy2vCUZOzEX56OjPo30RCOQ6VSC2ntfD9BEp1GhNGNzj+FlT60+u7mYYba
	CUZZWng==
X-Google-Smtp-Source: AGHT+IE9v+AMqISEN6fUyAdtK8mFeHQvOl0cmpRw928j7ZGnBCeUKwILml7veHgu+g+g3U0uNgaRQdu3bsM=
X-Received: from pjbsy11.prod.google.com ([2002:a17:90b:2d0b:b0:31a:aa02:8c50])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e0b:b0:30a:3e8e:ea30
 with SMTP id 98e67ed59e1d1-31e662e841emr4851203a91.11.1753396418146; Thu, 24
 Jul 2025 15:33:38 -0700 (PDT)
Date: Thu, 24 Jul 2025 15:33:36 -0700
In-Reply-To: <c301ec11-9d24-4cc6-9dc7-46800df4d5a8@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <20250723104714.1674617-11-tabba@google.com>
 <c301ec11-9d24-4cc6-9dc7-46800df4d5a8@intel.com>
Message-ID: <aIK0wHgP91XhNEMC@google.com>
Subject: Re: [PATCH v16 10/22] KVM: guest_memfd: Add plumbing to host to map
 guest_memfd pages
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
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
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 23, 2025, Xiaoyao Li wrote:
> On 7/23/2025 6:47 PM, Fuad Tabba wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index a1c49bc681c4..e5cd54ba1eaa 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -13518,6 +13518,16 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
> >   }
> >   EXPORT_SYMBOL_GPL(kvm_arch_no_poll);
> > +#ifdef CONFIG_KVM_GUEST_MEMFD
> > +/*
> > + * KVM doesn't yet support mmap() on guest_memfd for VMs with private memory
> > + * (the private vs. shared tracking needs to be moved into guest_memfd).
> > + */
> > +bool kvm_arch_supports_gmem_mmap(struct kvm *kvm)
> > +{
> > +	return !kvm_arch_has_private_mem(kvm);
> > +}
> > +
> 
> I think it's better to move the kvm_arch_supports_gmem_mmap() stuff to patch
> 20. Because we don't know how kvm_arch_supports_gmem_mmap() is going to be
> used unitll that patch.

No strong preference on my end.

