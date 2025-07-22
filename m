Return-Path: <linux-arm-msm+bounces-66082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB4B0D9AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04173AE3B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340CC15DBC1;
	Tue, 22 Jul 2025 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WeLHgmXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E86FDDC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187554; cv=none; b=lfsbPLv538K6wbDrv4npZphAhcMjZIdUhb3MbH66O5cwjLgqJJUqlwsb9Bc5I4erw/4067gnuNiSVcnqqT8d7EwyGQNBkLc2mzqPOHmRpe95y9LLN1yvm/GN7VJrr8a48URcGh1qUEa8j0mh/txmj5gjgC8dYeqohjt49zImE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187554; c=relaxed/simple;
	bh=kfXCFB4M4r9Eu+Ta6xP8Saq4J9ai+mgIIVpmeC+Orzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iT3Rl4yXjSxv4iZj/1x/m3G/AkHknaxRUEtmgxNa2ndfbYDtI8iwTAGNn7UOGUM3f6YtXQ2QsqJAHKVrKEOaW7IiTdL9ptpbRryPeg0fUs7RW3XVGakOTxQQzxdjgiJ81Yi3j0t/7EdjogyZ2oJN9wKbOk8wL2USr6vUb6Wc7Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WeLHgmXx; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <07976427-e5a4-4ca4-93e9-a428a962b0b2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753187549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MMMOAOPjOBlhMHrulLMPV/ml/XegyxT79zgI8vdaQc=;
	b=WeLHgmXx0r97gR/zn1eWenIdriuOSpYVj9Enitmu+wk6hPYUCHXPbtDMke+K2iZ8CfIEli
	L2PPPUlUHtpcnh+fY+glHgeelj+WuvAribXpZM+k/8swY851tIbGWUVGWzbcfzmko35xvp
	bSykaR5ROyJfWZ7ZJwWd2TTVDWbPsEs=
Date: Tue, 22 Jul 2025 20:31:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v15 16/21] KVM: arm64: Handle guest_memfd-backed guest
 page faults
Content-Language: en-US
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name,
 david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250717162731.446579-1-tabba@google.com>
 <20250717162731.446579-17-tabba@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kunwu Chan <kunwu.chan@linux.dev>
In-Reply-To: <20250717162731.446579-17-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2025/7/18 00:27, Fuad Tabba wrote:
> Add arm64 architecture support for handling guest page faults on memory
> slots backed by guest_memfd.
>
> This change introduces a new function, gmem_abort(), which encapsulates
> the fault handling logic specific to guest_memfd-backed memory. The
> kvm_handle_guest_abort() entry point is updated to dispatch to
> gmem_abort() when a fault occurs on a guest_memfd-backed memory slot (as
> determined by kvm_slot_has_gmem()).
>
> Until guest_memfd gains support for huge pages, the fault granule for
> these memory regions is restricted to PAGE_SIZE.

Since huge pages are not currently supported, would it be more friendly 
to define  sth like

"#define GMEM_PAGE_GRANULE PAGE_SIZE" at the top (rather than hardcoding 
PAGE_SIZE)

  and make it easier to switch to huge page support later?

> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/kvm/mmu.c | 86 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 83 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index b3eacb400fab..8c82df80a835 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1512,6 +1512,82 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
>   	*prot |= kvm_encode_nested_level(nested);
>   }
>   
> +#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
> +
> +static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> +		      struct kvm_s2_trans *nested,
> +		      struct kvm_memory_slot *memslot, bool is_perm)
> +{
> +	bool write_fault, exec_fault, writable;
> +	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
> +	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +	unsigned long mmu_seq;
> +	struct page *page;
> +	struct kvm *kvm = vcpu->kvm;
> +	void *memcache;
> +	kvm_pfn_t pfn;
> +	gfn_t gfn;
> +	int ret;
> +
> +	ret = prepare_mmu_memcache(vcpu, true, &memcache);
> +	if (ret)
> +		return ret;
> +
> +	if (nested)
> +		gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
> +	else
> +		gfn = fault_ipa >> PAGE_SHIFT;
> +
> +	write_fault = kvm_is_write_fault(vcpu);
> +	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> +
> +	VM_WARN_ON_ONCE(write_fault && exec_fault);
> +
> +	mmu_seq = kvm->mmu_invalidate_seq;
> +	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
> +	smp_rmb();
> +
> +	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
> +	if (ret) {
> +		kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
> +					      write_fault, exec_fault, false);
> +		return ret;
> +	}
> +
> +	writable = !(memslot->flags & KVM_MEM_READONLY);
> +
> +	if (nested)
> +		adjust_nested_fault_perms(nested, &prot, &writable);
> +
> +	if (writable)
> +		prot |= KVM_PGTABLE_PROT_W;
> +
> +	if (exec_fault ||
> +	    (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
> +	     (!nested || kvm_s2_trans_executable(nested))))
> +		prot |= KVM_PGTABLE_PROT_X;
> +
> +	kvm_fault_lock(kvm);
> +	if (mmu_invalidate_retry(kvm, mmu_seq)) {
> +		ret = -EAGAIN;
> +		goto out_unlock;
> +	}
> +
> +	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
> +						 __pfn_to_phys(pfn), prot,
> +						 memcache, flags);
> +
> +out_unlock:
> +	kvm_release_faultin_page(kvm, page, !!ret, writable);
> +	kvm_fault_unlock(kvm);
> +
> +	if (writable && !ret)
> +		mark_page_dirty_in_slot(kvm, memslot, gfn);
> +
> +	return ret != -EAGAIN ? ret : 0;
> +}
> +
>   static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   			  struct kvm_s2_trans *nested,
>   			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1536,7 +1612,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>   	struct kvm_pgtable *pgt;
>   	struct page *page;
> -	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
> +	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
>   
>   	if (fault_is_perm)
>   		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
> @@ -1961,8 +2037,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
>   			!write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
>   
> -	ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> -			     esr_fsc_is_permission_fault(esr));
> +	if (kvm_slot_has_gmem(memslot))
> +		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
> +				 esr_fsc_is_permission_fault(esr));
> +	else
> +		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> +				     esr_fsc_is_permission_fault(esr));
>   	if (ret == 0)
>   		ret = 1;
>   out:
LGTM!

-- 
Thanks,
   Kunwu.Chan(Tao.Chan)


