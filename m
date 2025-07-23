Return-Path: <linux-arm-msm+bounces-66254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B813CB0F051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83B6AA06BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C239229A9ED;
	Wed, 23 Jul 2025 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ukV/WeaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7FC2E4244
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267656; cv=none; b=bvP+WaMR5re00R/hAz3BfzrJtZuqXIOfZJtbM+NGAMk+0+qjUZgW+4Uk/nuooOnARip5dK1ezEw+nCAENBaUx2rn30pHPbpYQ2wte4B1OtcLCdxBbzlz8S+60nMz2KVviPHzp1MDL04ucMepmVTfU6I3Ud0E/W0LFVL4siLr7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267656; c=relaxed/simple;
	bh=14cXWdXNZdYKTsga/FLhaKCs/axWOwx5cLW1RECQbK4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pUJc0lU0rANgmK5xKZH5yJHKFxWw3w9hwgUwHQCakrisqOwOA9K6AV/LUomBOGrmLUG8khN62zno1TbCBL0bqGJzMw8ARS1K14n7HZ18+54SR+l93dDEKNabeio2XkdKDyDvs66w7xPedqb8THtzsblQijE39ZmHdCCk3yTH1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ukV/WeaZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-456175dba68so51687075e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267653; x=1753872453; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0hNLT3q6FGDV+rEHRPNootJHOVFuUm+ghBMVRNnmNc4=;
        b=ukV/WeaZ8dYIBNUsKo4x7vZfr45fZIvMwzKGuMe0I+fg4vZzbanUyqJRLWJ6R+Ge7z
         tuk51bOBi0ZjFlBaoFTwayhHQ6AJ4Ud3sSfWWadeGuBYZkI4m4VOq0TOL4ZHzK6ymtbC
         Re6E6TbWHh3LGaofGBW45Hk14k3xyAsoNIAWWEYDfCtjhODPcRoQawSt3NgyQZMfPP6d
         AygrxCYjuquoq6uqGrb+Xl6iXFpyfVGGrXRMnEHzcemUagKGkEK+d5bJIrFAhDXwX0iN
         g0qJFAi0MjUD0opwWAojZJRY+fp9SzZ0sXq6WOtBdbTsgb0cXuJUdccc13jLDY7tm8mk
         bXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267653; x=1753872453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hNLT3q6FGDV+rEHRPNootJHOVFuUm+ghBMVRNnmNc4=;
        b=qy1D2e03l/8HmQKag553vWalbJ6eCrMRJ/ASqv8zRpJbCXEo5e4rTFJSJhdOL8szyo
         2vaGZSjCO6wHmUAUK9XH1CJrQCqJKL7yw0BVIIasvr+/g05jD+BqxbtxbTw9hes14BWW
         2JKGHLopR+u+Rk6QtjzY7oROC4ASLj+H0A4BoTvw9Czjcaf64+ITOEET6lcYwhYJbqmJ
         VyDhaRyDKOzUI8IyvceUMI3Yj5ZwShfxeC5BQlkZsJyB08EL9JLy/lNMtZDyDFwlvHnm
         wWMr0sbfYtV5bEV3vJArnRgahls+ZzOuhWiHHKKrDHBnKnVytYLGEiUhPvPrnYE/j5He
         oOnA==
X-Forwarded-Encrypted: i=1; AJvYcCVgCeCmHEOF9T0NkwgrfTWvWY3FpK6NiHFpjQw9OWpk7li+uR55TONkvFhv70dYs0uNrzvCsFE37g5ybKGD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpak/rC2Yx2gCZTq7YPwRNYer6pOOlxZHiQKrodcuvXb+VCs+T
	m82yVZRTY6Dc+zBLcMlQS7MZJkE7Jr4/AuWv0rvwxmYPkvkl5O046jGtlKztSIusGaHDr33oB4h
	qEA==
X-Google-Smtp-Source: AGHT+IEdr/R4SHXIN/Osc6SC6u8xoWyR2XoDwoRplQ/guvfFP9V2bgXvk5bMDQWHMCkMpZwIcu7+3mnSgA==
X-Received: from wmbej12.prod.google.com ([2002:a05:600c:3e8c:b0:453:5f7b:74b9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358f:b0:456:43d:1198
 with SMTP id 5b1f17b1804b1-45868d4dbf7mr19146205e9.32.1753267653310; Wed, 23
 Jul 2025 03:47:33 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:47:09 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-18-tabba@google.com>
Subject: [PATCH v16 17/22] KVM: arm64: Handle guest_memfd-backed guest page faults
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev
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
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Add arm64 architecture support for handling guest page faults on memory
slots backed by guest_memfd.

This change introduces a new function, gmem_abort(), which encapsulates
the fault handling logic specific to guest_memfd-backed memory. The
kvm_handle_guest_abort() entry point is updated to dispatch to
gmem_abort() when a fault occurs on a guest_memfd-backed memory slot (as
determined by kvm_slot_has_gmem()).

Until guest_memfd gains support for huge pages, the fault granule for
these memory regions is restricted to PAGE_SIZE.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 86 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b3eacb400fab..8c82df80a835 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1512,6 +1512,82 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
 	*prot |= kvm_encode_nested_level(nested);
 }
 
+#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
+
+static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+		      struct kvm_s2_trans *nested,
+		      struct kvm_memory_slot *memslot, bool is_perm)
+{
+	bool write_fault, exec_fault, writable;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
+	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	unsigned long mmu_seq;
+	struct page *page;
+	struct kvm *kvm = vcpu->kvm;
+	void *memcache;
+	kvm_pfn_t pfn;
+	gfn_t gfn;
+	int ret;
+
+	ret = prepare_mmu_memcache(vcpu, true, &memcache);
+	if (ret)
+		return ret;
+
+	if (nested)
+		gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
+	else
+		gfn = fault_ipa >> PAGE_SHIFT;
+
+	write_fault = kvm_is_write_fault(vcpu);
+	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
+
+	VM_WARN_ON_ONCE(write_fault && exec_fault);
+
+	mmu_seq = kvm->mmu_invalidate_seq;
+	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
+	smp_rmb();
+
+	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
+	if (ret) {
+		kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
+					      write_fault, exec_fault, false);
+		return ret;
+	}
+
+	writable = !(memslot->flags & KVM_MEM_READONLY);
+
+	if (nested)
+		adjust_nested_fault_perms(nested, &prot, &writable);
+
+	if (writable)
+		prot |= KVM_PGTABLE_PROT_W;
+
+	if (exec_fault ||
+	    (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
+	     (!nested || kvm_s2_trans_executable(nested))))
+		prot |= KVM_PGTABLE_PROT_X;
+
+	kvm_fault_lock(kvm);
+	if (mmu_invalidate_retry(kvm, mmu_seq)) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
+						 __pfn_to_phys(pfn), prot,
+						 memcache, flags);
+
+out_unlock:
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
+	kvm_fault_unlock(kvm);
+
+	if (writable && !ret)
+		mark_page_dirty_in_slot(kvm, memslot, gfn);
+
+	return ret != -EAGAIN ? ret : 0;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1536,7 +1612,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
 	struct page *page;
-	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
 
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1961,8 +2037,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
 			!write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
 
-	ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
-			     esr_fsc_is_permission_fault(esr));
+	if (kvm_slot_has_gmem(memslot))
+		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
+				 esr_fsc_is_permission_fault(esr));
+	else
+		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
+				     esr_fsc_is_permission_fault(esr));
 	if (ret == 0)
 		ret = 1;
 out:
-- 
2.50.1.470.g6ba607880d-goog


