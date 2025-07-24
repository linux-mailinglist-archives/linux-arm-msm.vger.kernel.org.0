Return-Path: <linux-arm-msm+bounces-66634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C1B1144F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 01:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A1905430A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 23:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C106323CEE5;
	Thu, 24 Jul 2025 23:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZPoPGnvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD061DED40
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 23:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753398226; cv=none; b=QyYanPnDZKrCeAAjZAQAzkSrK131+kelpZ9RdjT0V6raw2APMuqLafUpf4472ZImHVEThTO3tnF7n9sRzuyrjPOL1wqhZjCZOhARQliU4My2IlTSiBPbu93bi5ZmCX8rRlFPNAZkdJTmaOPLv9A64GO6HSVTDH5UKykT2uiiL1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753398226; c=relaxed/simple;
	bh=Lbu1j2VeC+YUlaGAQB1et29Lmaxg0KeQQE+Hwd4SVNM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sz3y2TjYxOOSB9H4Y3zIa7eKF/fDMIyL6/T2er7V4J2mXr3YPUjEPmy/N10KTdvIB6Noq/p59ePyrzOS84xYABxDqoVbOKtJakRW6GqGYs7Kc3AelfkBds/51545PjVgcVVgblqnnw0AEZRHuNmrYnsH3ifADArNX+60xEfet8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZPoPGnvS; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b362d101243so1154259a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753398223; x=1754003023; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISsvFCUycsXMABHVDYSoSHE4WtWUnZpEr5ejibgkla0=;
        b=ZPoPGnvSB4QdnL8MbpJiIt9jGiso63W9ix9nXn6jnjeGQuzuki4MKNgB15QD/4oFRV
         HdRIplcHwsRPsFFiv1EBLC2dFQqMDu+oTXtwJNEr7x1jlZBxhaXVRyoST8KoSSWL3UZ2
         FlRZuxm/cSduGGmB9xL2rQO82Y4K3ucf17REmgEjHeBI6EqxIWn3TnhiwN7g5sOgCfhx
         LN4hx8XeyHGvKxp4zjMGMqwJO3aIuM5Yu8WOUsLtLGGpmopl3cCIohXZfcXzEx6U6UX/
         1Qj55vpr+66/l3gJ3fmxKis2XI3HNUDHHkpQu9F2LJ8Oe84YM/xfy7zUiWr3nSFkAvdE
         M49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753398223; x=1754003023;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISsvFCUycsXMABHVDYSoSHE4WtWUnZpEr5ejibgkla0=;
        b=krjlOVVOw6mJF4OLVe4jaLb2oB9DlCRynpRdnFPL+9vA4aVMd5DNrotYcQ5C1lfRPU
         L0Mv872pi6FcDmhcbl+5/YgAYBRM2gsg4B316qzqW4+Vu/N1DjTD0DgE+WoDMvfSb2c/
         ko2SK66xITA27naQiUnmCnrftRkOTfh/XP4rU2rsv10B9aE50phxn9xp9z82ZNGx1a0/
         +VsAB6xP9htpjjLyGRQcKslcFFvm7BeLhJcVrwN72sBW7mv6DU4J0H2+mhxyDu8BvWJu
         v7DV68Bxy1UR2vIWSkEQr2VAV6X4D4v1abdIkcQ51ZE3kxOeVuwMXgGHsA/EALsL+hCY
         mB5w==
X-Forwarded-Encrypted: i=1; AJvYcCVOlqytjDnOivHHyEmYm0KZvED7Umpmwl0GMMxe1Ri3w68eWQzDM+of4Qt6yqc9vChgxr6r8Q8pwKXH33PB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv1Ih4ToHkHvvzJ744DKtWelLXyzr6ce+wid3fn3fy5phenuCK
	7Pw9f4c8JkAGdIn77P4vhHZ/aV3cQJPH1gxIhKoH7eB5HmgPpuahvA4Yq3+veD0LHNmMyfvGTK9
	ZDfvaDkldyA607X34VD5xYcfBKQ==
X-Google-Smtp-Source: AGHT+IHz2z61bSSBHE5WkJFRSn/f5Uz7Cdl50VxK06WJGcmxGFRErbOEdHF7gB/snCT71JrhZi9xeqGE6W9rTkxcyA==
X-Received: from pgam17.prod.google.com ([2002:a05:6a02:2b51:b0:b2f:5023:640d])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:998f:b0:239:eed:43a6 with SMTP id adf61e73a8af0-23d491220ecmr15740822637.22.1753398223391;
 Thu, 24 Jul 2025 16:03:43 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:03:41 -0700
In-Reply-To: <20250723104714.1674617-14-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <20250723104714.1674617-14-tabba@google.com>
Message-ID: <diqzldoddwdu.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v16 13/22] KVM: x86/mmu: Hoist guest_memfd max level/order
 helpers "up" in mmu.c
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
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
	pankaj.gupta@amd.com, ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> From: Sean Christopherson <seanjc@google.com>
>
> Move kvm_max_level_for_order() and kvm_max_private_mapping_level() up in
> mmu.c so that they can be used by __kvm_mmu_max_mapping_level().
>
> Opportunistically drop the "inline" from kvm_max_level_for_order().
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 72 +++++++++++++++++++++---------------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index b735611e8fcd..20dd9f64156e 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3285,6 +3285,42 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
>  	return level;
>  }
>  
> +static u8 kvm_max_level_for_order(int order)
> +{
> +	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> +
> +	KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> +			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> +			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> +		return PG_LEVEL_1G;
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> +		return PG_LEVEL_2M;
> +
> +	return PG_LEVEL_4K;
> +}
> +
> +static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> +					u8 max_level, int gmem_order)
> +{
> +	u8 req_max_level;
> +
> +	if (max_level == PG_LEVEL_4K)
> +		return PG_LEVEL_4K;
> +
> +	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
> +	if (max_level == PG_LEVEL_4K)
> +		return PG_LEVEL_4K;
> +
> +	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> +	if (req_max_level)
> +		max_level = min(max_level, req_max_level);
> +
> +	return max_level;
> +}
> +
>  static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
>  				       const struct kvm_memory_slot *slot,
>  				       gfn_t gfn, int max_level, bool is_private)
> @@ -4503,42 +4539,6 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>  		vcpu->stat.pf_fixed++;
>  }
>  
> -static inline u8 kvm_max_level_for_order(int order)
> -{
> -	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> -
> -	KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> -			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> -			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> -
> -	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> -		return PG_LEVEL_1G;
> -
> -	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> -		return PG_LEVEL_2M;
> -
> -	return PG_LEVEL_4K;
> -}
> -
> -static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> -					u8 max_level, int gmem_order)
> -{
> -	u8 req_max_level;
> -
> -	if (max_level == PG_LEVEL_4K)
> -		return PG_LEVEL_4K;
> -
> -	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
> -	if (max_level == PG_LEVEL_4K)
> -		return PG_LEVEL_4K;
> -
> -	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> -	if (req_max_level)
> -		max_level = min(max_level, req_max_level);
> -
> -	return max_level;
> -}
> -
>  static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
>  				      struct kvm_page_fault *fault, int r)
>  {
> -- 
> 2.50.1.470.g6ba607880d-goog

Reviewed-by: 

