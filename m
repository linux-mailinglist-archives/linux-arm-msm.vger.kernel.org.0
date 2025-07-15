Return-Path: <linux-arm-msm+bounces-65005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249ADB0569A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A86D3AD831
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F63A2DCC08;
	Tue, 15 Jul 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgFFIocu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703012DAFBF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572071; cv=none; b=o3Wqw9OwX3RPYQs0KHAj6pHdT/V7xlkOK8v1cPAk6fmtwy5aVLwCX5sVycJ7RwRXRjWn3SpQDCqPgITKqh15ImzRgmJLxTni3OmQG+7H4OSP1W4FUuK3U4jtloqjxy+6fa0q6e2d7Hs52pzXVPf7blXKza2CgFxi5jBgz0dPzjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572071; c=relaxed/simple;
	bh=JyP2SYIGgJjBVzP+usBFRfDyLfJWSnH5eMhf6SDfTFk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KpEUeGhZKMVercUZ7NGUBeI+w8fb88DD1dBcQgzswX8iQ6F1ZDHIVd5eXz5smXUcpDozK6Ah8l3XY5RIQiqMbfOfwOfCu/uQDmiR4eOOLxn8UhIbzEJraYvc7P/MSDcgYvrWfhl5Zg2sskBeztdRp4suZY7xeC4+4nofpAVGHE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgFFIocu; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b39cc43f15so2888492f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572064; x=1753176864; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0x5SEsp+wQeAofoXD9kRa6NgpqrTyhovX0ubFwE0gGE=;
        b=kgFFIocu2bS7T+/DCM4fhQXPWhdw4fnCYgROKy/Rpb51rWtLkYjjkCEEj93sWwho7Y
         Xh5LX9ej7gLo4FBHssRuDIjoDzG6My9ttdicHg+rBsZoyHIzRd7tWVzau6mDuXWDmLGq
         DgS5I2aViFmyAO+3Xh0fybRQRytXVP/+E0pj6E6exZd+IQV0JP/WhNpHtn64njtygxRj
         IkuBNOQUqaDYv4UKcmCsGTPlLJ+HPuv/TtgQSalAo+/YI4r97gPnmwOJlIAYLraHMdHI
         ofbZ0UHOvpW2Sd3N5Zi6jd+E6n39VZdSdfbs41c3i+XwuFPA/SKz3NooQboGTVNK4Ns2
         eLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572064; x=1753176864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0x5SEsp+wQeAofoXD9kRa6NgpqrTyhovX0ubFwE0gGE=;
        b=k4dsyQQV8xE2Jggxtm5KpO10SZ2eKo30j78fQ1Lhe3VPM5WqjcV62AEF1BZMTQuAjh
         dRp4Gxax0XF9eSwN69QEnwtmWWmGkn88OQMC1quBh/Yd8wfkmct6jOs5JDZCaU+FJe52
         5OZvhC59zQ9znxjbswbh9+CTxzJZzjRMeJfkLAPmOP2M/pEk+448uSQO+UeJ5Q/LoA19
         zfsOal+tsCDST4K5sY9DkFRPZWXXNzDQGKvIBB1lWf/zZ0e/I/TfyHMI3XQIAx/FS85J
         PvkIeM6JPC1xZDAdxltszltAuxJ8KtaYNkgP6LtddffQSYHwbP2MHPvIYhOz7KA1p/xk
         muDg==
X-Forwarded-Encrypted: i=1; AJvYcCUpckUhG2NiGvoYheMjQb2xbU0R0FVsc4jpZIjlu5YnCJFSdMQalBfdZOeZ7HJ1nsb1+rtzhvinXbuqT3H5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzc0k5eG2k8PYfGoVXmLZuJuStDVKXHRPXl/62dG4HvVGJXOJe
	qmAxlcQimu3ooOChCMw+gKQ8AF87W5xON84Fa2iYO3SgNYQ1gl7n0d2HXfrpT14RvBNiNMfhyec
	SUg==
X-Google-Smtp-Source: AGHT+IETce9zW/LrnBQzC3dja+JnEMeftry72HzwDnDzdO2fU3uPKPspLyKTgMqcU0MlFHJYIBST8urFAw==
X-Received: from wmcq10.prod.google.com ([2002:a05:600c:c10a:b0:456:2437:14d6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4029:b0:3b6:463:d886
 with SMTP id ffacd0b85a97d-3b60463dc8fmr5591019f8f.20.1752572063764; Tue, 15
 Jul 2025 02:34:23 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:33:44 +0100
In-Reply-To: <20250715093350.2584932-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715093350.2584932-16-tabba@google.com>
Subject: [PATCH v14 15/21] KVM: arm64: Refactor user_mem_abort()
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

Refactor user_mem_abort() to improve code clarity and simplify
assumptions within the function.

Key changes include:

* Immediately set force_pte to true at the beginning of the function if
  logging_active is true. This simplifies the flow and makes the
  condition for forcing a PTE more explicit.

* Remove the misleading comment stating that logging_active is
  guaranteed to never be true for VM_PFNMAP memslots, as this assertion
  is not entirely correct.

* Extract reusable code blocks into new helper functions:
  * prepare_mmu_memcache(): Encapsulates the logic for preparing and
    topping up the MMU page cache.
  * adjust_nested_fault_perms(): Isolates the adjustments to shadow S2
    permissions and the encoding of nested translation levels.

* Update min(a, (long)b) to min_t(long, a, b) for better type safety and
  consistency.

* Perform other minor tidying up of the code.

These changes primarily aim to simplify user_mem_abort() and make its
logic easier to understand and maintain, setting the stage for future
modifications.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 110 +++++++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2942ec92c5a4..b3eacb400fab 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1470,13 +1470,56 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
 	return vma->vm_flags & VM_MTE_ALLOWED;
 }
 
+static int prepare_mmu_memcache(struct kvm_vcpu *vcpu, bool topup_memcache,
+				void **memcache)
+{
+	int min_pages;
+
+	if (!is_protected_kvm_enabled())
+		*memcache = &vcpu->arch.mmu_page_cache;
+	else
+		*memcache = &vcpu->arch.pkvm_memcache;
+
+	if (!topup_memcache)
+		return 0;
+
+	min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
+
+	if (!is_protected_kvm_enabled())
+		return kvm_mmu_topup_memory_cache(*memcache, min_pages);
+
+	return topup_hyp_memcache(*memcache, min_pages);
+}
+
+/*
+ * Potentially reduce shadow S2 permissions to match the guest's own S2. For
+ * exec faults, we'd only reach this point if the guest actually allowed it (see
+ * kvm_s2_handle_perm_fault).
+ *
+ * Also encode the level of the original translation in the SW bits of the leaf
+ * entry as a proxy for the span of that translation. This will be retrieved on
+ * TLB invalidation from the guest and used to limit the invalidation scope if a
+ * TTL hint or a range isn't provided.
+ */
+static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
+				      enum kvm_pgtable_prot *prot,
+				      bool *writable)
+{
+	*writable &= kvm_s2_trans_writable(nested);
+	if (!kvm_s2_trans_readable(nested))
+		*prot &= ~KVM_PGTABLE_PROT_R;
+
+	*prot |= kvm_encode_nested_level(nested);
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool topup_memcache;
+	bool write_fault, writable;
 	bool exec_fault, mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
@@ -1488,6 +1531,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active;
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1498,17 +1542,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
 	write_fault = kvm_is_write_fault(vcpu);
 	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
-	VM_BUG_ON(write_fault && exec_fault);
-
-	if (fault_is_perm && !write_fault && !exec_fault) {
-		kvm_err("Unexpected L2 read permission error\n");
-		return -EFAULT;
-	}
-
-	if (!is_protected_kvm_enabled())
-		memcache = &vcpu->arch.mmu_page_cache;
-	else
-		memcache = &vcpu->arch.pkvm_memcache;
+	VM_WARN_ON_ONCE(write_fault && exec_fault);
 
 	/*
 	 * Permission faults just need to update the existing leaf entry,
@@ -1516,17 +1550,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * only exception to this is when dirty logging is enabled at runtime
 	 * and a write fault needs to collapse a block entry into a table.
 	 */
-	if (!fault_is_perm || (logging_active && write_fault)) {
-		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
-
-		if (!is_protected_kvm_enabled())
-			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
-		else
-			ret = topup_hyp_memcache(memcache, min_pages);
-
-		if (ret)
-			return ret;
-	}
+	topup_memcache = !fault_is_perm || (logging_active && write_fault);
+	ret = prepare_mmu_memcache(vcpu, topup_memcache, &memcache);
+	if (ret)
+		return ret;
 
 	/*
 	 * Let's check if we will get back a huge page backed by hugetlbfs, or
@@ -1540,16 +1567,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
-	/*
-	 * logging_active is guaranteed to never be true for VM_PFNMAP
-	 * memslots.
-	 */
-	if (logging_active) {
-		force_pte = true;
+	if (force_pte)
 		vma_shift = PAGE_SHIFT;
-	} else {
+	else
 		vma_shift = get_vma_page_shift(vma, hva);
-	}
 
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -1601,7 +1622,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			max_map_size = PAGE_SIZE;
 
 		force_pte = (max_map_size == PAGE_SIZE);
-		vma_pagesize = min(vma_pagesize, (long)max_map_size);
+		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
 	}
 
 	/*
@@ -1630,7 +1651,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
 	 * with the smp_wmb() in kvm_mmu_invalidate_end().
 	 */
-	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
+	mmu_seq = kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
 	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
@@ -1665,24 +1686,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (exec_fault && device)
 		return -ENOEXEC;
 
-	/*
-	 * Potentially reduce shadow S2 permissions to match the guest's own
-	 * S2. For exec faults, we'd only reach this point if the guest
-	 * actually allowed it (see kvm_s2_handle_perm_fault).
-	 *
-	 * Also encode the level of the original translation in the SW bits
-	 * of the leaf entry as a proxy for the span of that translation.
-	 * This will be retrieved on TLB invalidation from the guest and
-	 * used to limit the invalidation scope if a TTL hint or a range
-	 * isn't provided.
-	 */
-	if (nested) {
-		writable &= kvm_s2_trans_writable(nested);
-		if (!kvm_s2_trans_readable(nested))
-			prot &= ~KVM_PGTABLE_PROT_R;
-
-		prot |= kvm_encode_nested_level(nested);
-	}
+	if (nested)
+		adjust_nested_fault_perms(nested, &prot, &writable);
 
 	kvm_fault_lock(kvm);
 	pgt = vcpu->arch.hw_mmu->pgt;
@@ -1953,6 +1958,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		goto out_unlock;
 	}
 
+	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
+			!write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
+
 	ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
 			     esr_fsc_is_permission_fault(esr));
 	if (ret == 0)
-- 
2.50.0.727.gbf7dc18ff4-goog


