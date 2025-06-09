Return-Path: <linux-arm-msm+bounces-60559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8312AD179E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 06:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB09A18867B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 04:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C47727FB02;
	Mon,  9 Jun 2025 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AlZUOT1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A526A19F464
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 04:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749442139; cv=none; b=V72XZx6DW8gvF9wqozUi0gPT0GbDCCN3/518IlvqGnDvIexfBnIKCDi/OE/SJQNB5rGxlF2i2AeYBlXShid6/AXSU6L+UsVZL058dVriCTFZ7rVfpwEAQ/CYz3yRI5N/EMvBrqt2hmfgDVuhRp2gC4uY3+O8Lu4BgCxtZ0lXaLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749442139; c=relaxed/simple;
	bh=iqnb+ZB/2oTCUBhWTrXa/vqr3Uz8tsvhBI9pDkDNIrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cfg4/QzXA/ePqN3DWbH4rXcP0Nx9SYEUFrhU8OYKll+53kENHKPh4xHOy/Oon06MGA23OdixMZ/qq2GCMFGovaGhOyxkOkbb+ngD+hOl0cyPUPW3eXkKYvabzwrxlYTYWeW2l0CazSIT9dP3SxuS6vDQx468hGt4Cx5VmN1Mukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AlZUOT1z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749442136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znSV+kVarM376WETpFG5vxmhQ7lGKQs0oHqrXu/evqo=;
	b=AlZUOT1zoGSisCVwbRu2tXpg2/JLawFilxQy7yNNhi5kn0GCd3y5EbkuSjcea4D06VlsHH
	w21lVjUMiglCxlRxQhZVHXj926QrHLHj1PTyZerPydZXFIuM0eGxkcdrHooq53iunvRPcm
	VRcWtMWbf8N0kOJP2ArW/LsqKbEsbhg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-_wxQb-fQMpC5xpETqjM5Cw-1; Mon, 09 Jun 2025 00:08:55 -0400
X-MC-Unique: _wxQb-fQMpC5xpETqjM5Cw-1
X-Mimecast-MFC-AGG-ID: _wxQb-fQMpC5xpETqjM5Cw_1749442134
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73bfc657aefso2734062b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 21:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749442133; x=1750046933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znSV+kVarM376WETpFG5vxmhQ7lGKQs0oHqrXu/evqo=;
        b=FXNugP/cBJhR7xPUQX+LUGQQVF2PkBSBDNCfSOAqbMcKYHyOITZif4CSJmYgtHDKbM
         EWAkiBdXqAWSB2H1q0AG+1sWWrVcSaBaZql/WLh4uGoz3+HoK7zINEq8pLGdozbbPpWp
         T8+/yxnBuIrRN2Pdr0Umjqe/B7kNRG0NjtpEtb6lsAGc77rmSNCMu/yrr3oCiGaFqkFm
         zECEuQjri19K2FlvDJ6eKwpnvMZfYPVhG7vki06/qc3HzgHxjpafO10n4MVFSsZC0TdY
         kPLXMMPXkB7PNtu/C5V5JFYMaKZcGmwa4i8UDa+fPkQA/3aN/7zuLxvtS6LB2MygHeH2
         hdeA==
X-Forwarded-Encrypted: i=1; AJvYcCUlnJSDhrb5CyiZSuibFvEEbn77nvaHChSPwY+dFzf0GjK7ElZczumT0LmylORy/3lM2o2USRR10/Uls4lG@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbe7+kNQy/whnfAOS0u/qWuTtlq+us+qm5rCQ73R1VlHx8LoD
	eWSgJmBFN6xMtrE2hTxWYAbdfNGko7R3YLIfInVgemwU/Voq0ZYqllwowlvOZB+SVQAW1KfUk8O
	xU2MfTv/ylk97rd7vJhryGuG4zjAq/+PPQQU9vapCuV0pD0QFbkHTOL88WHlDpbC9M+edBuLLEh
	Y=
X-Gm-Gg: ASbGncvqifZFFAwlgZwYuvMT1BrE84JuIn77rib9GPw+D1ABVg560x5av7YkN9FmOjs
	0esqjL0e20sUkTMd7iUTrZz/VBI7bNA6lYONWuTRDS9augH00wHucc2qYIzC1yyf6JqAbZB7xab
	4AdIg1PJBvVXwHpvsjYnL4769mH8+pB8i3rZzWnyTqoLXRncbSU72naVj/h7oqHhco2pzgRvKL/
	ZXB05AWPRe0GDONU1+xnVMmP2J+WNUC1pIb+npHj8B0xGgDcnsXT6FiZHnk+IFGTu8YTodCKU26
	wxvYmS99Vo8/IgdaBVCP7Rw+FLZQZle90GkhXZJRL8ycdbBgiApf/DFpzhomAg==
X-Received: by 2002:a05:6a00:1caa:b0:740:596b:4a7f with SMTP id d2e1a72fcca58-74827f10b78mr13424941b3a.16.1749442133167;
        Sun, 08 Jun 2025 21:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7m/zTCGkEamABNbzON01NHA2JLBsIZ9H30Axsha6qHcMH8sLupDXiKBcrqXD+K67xykgA3w==
X-Received: by 2002:a05:6a00:1caa:b0:740:596b:4a7f with SMTP id d2e1a72fcca58-74827f10b78mr13424895b3a.16.1749442132715;
        Sun, 08 Jun 2025 21:08:52 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af382fcsm4806740b3a.28.2025.06.08.21.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 21:08:52 -0700 (PDT)
Message-ID: <3d9a15ff-fbb2-4e9a-b97b-c0e40eb23043@redhat.com>
Date: Mon, 9 Jun 2025 14:08:30 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 14/18] KVM: arm64: Handle guest_memfd-backed guest
 page faults
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
References: <20250605153800.557144-1-tabba@google.com>
 <20250605153800.557144-15-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250605153800.557144-15-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 6/6/25 1:37 AM, Fuad Tabba wrote:
> Add arm64 support for handling guest page faults on guest_memfd backed
> memslots. Until guest_memfd supports huge pages, the fault granule is
> restricted to PAGE_SIZE.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/kvm/mmu.c | 93 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 90 insertions(+), 3 deletions(-)
> 

One comment below. Otherwise, it looks good to me.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ce80be116a30..f14925fe6144 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1508,6 +1508,89 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
>   	*prot |= kvm_encode_nested_level(nested);
>   }
>   
> +#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
> +
> +static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> +		      struct kvm_s2_trans *nested,
> +		      struct kvm_memory_slot *memslot, bool is_perm)
> +{
> +	bool logging, write_fault, exec_fault, writable;
> +	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
> +	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +	struct page *page;
> +	struct kvm *kvm = vcpu->kvm;
> +	void *memcache;
> +	kvm_pfn_t pfn;
> +	gfn_t gfn;
> +	int ret;
> +
> +	ret = prepare_mmu_memcache(vcpu, !is_perm, &memcache);
> +	if (ret)
> +		return ret;
> +
> +	if (nested)
> +		gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
> +	else
> +		gfn = fault_ipa >> PAGE_SHIFT;
> +
> +	logging = memslot_is_logging(memslot);
> +	write_fault = kvm_is_write_fault(vcpu);
> +	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> +
> +	if (write_fault && exec_fault) {
> +		kvm_err("Simultaneous write and execution fault\n");
> +		return -EFAULT;
> +	}
> +
> +	if (is_perm && !write_fault && !exec_fault) {
> +		kvm_err("Unexpected L2 read permission error\n");
> +		return -EFAULT;
> +	}
> +
> +	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
> +	if (ret) {
> +		kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
> +					      write_fault, exec_fault, false);
> +		return ret;
> +	}
> +

-EFAULT or -EHWPOISON shall be returned, as documented in virt/kvm/api.rst. Besides,
kvm_send_hwpoison_signal() should be executed when -EHWPOISON is returned from
kvm_gmem_get_pfn()? :-)

Thanks,
Gavin

> +	writable = !(memslot->flags & KVM_MEM_READONLY) &&
> +		   (!logging || write_fault);
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
> +	if (is_perm) {
> +		/*
> +		 * Drop the SW bits in favour of those stored in the
> +		 * PTE, which will be preserved.
> +		 */
> +		prot &= ~KVM_NV_GUEST_MAP_SZ;
> +		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault_ipa, prot, flags);
> +	} else {
> +		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
> +					     __pfn_to_phys(pfn), prot,
> +					     memcache, flags);
> +	}
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
> @@ -1532,7 +1615,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>   	struct kvm_pgtable *pgt;
>   	struct page *page;
> -	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
> +	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
>   
>   	if (fault_is_perm)
>   		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
> @@ -1959,8 +2042,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   		goto out_unlock;
>   	}
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


