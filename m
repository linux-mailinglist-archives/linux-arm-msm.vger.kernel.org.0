Return-Path: <linux-arm-msm+bounces-60335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B957ACF340
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 887D43AC9FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC992749E8;
	Thu,  5 Jun 2025 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QlmGtSAn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7032749F6
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137913; cv=none; b=LkBwotuJSdg72ZbTXH683pA6xG+dctmVHNTni4aVPMqefCOMRi/nv9i990Q1vOWcwypEpO4xSVVAXmTB5x3ttzrtdbMI7E3Q1dhL1lYA+c5Ywm6ZgiUjmAyEQOQApbBu3VGGxtla5Eh+pjDnRmw45bwFwhdR6No8XFfrxEukTXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137913; c=relaxed/simple;
	bh=icedCB6Wz7Jabq6JZVGc/8daEQIp1G+3ePFs723AnHE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MSayKdpReMLVpTvu19Zih8WipsRWdhbu7zvU8RTYp4feq1RBSRQhts4/yl474NSGy1Lz81UMCUcpEXO98gvPCNRcK12hHLqFLZXDLK5asmvBCm2kTwibYNUxCrHEvYnEGP8JZF7AOk5xXcLQ5R0Q+moRH4F0MLoEriVYvSQwF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QlmGtSAn; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d9f96f61so8156355e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137909; x=1749742709; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1iopiNEacnt/zrf2KolJOPgZprgFWMs9+wdf/O4tEU=;
        b=QlmGtSAnrAWjcbNGxU88M/pSiW1yUdNzq2atTpfbXRDHlwTb0ehZFtRvu9LXSKJSrx
         1wZWKWaz404nqpotU73vCR2sQzFzWlihnKOmFQxr5vdjOM1FSrwkXgW3M8HaS16871zb
         bHzEfmz3H/69mKxvuY9ViTp8pOmd5ok73DwegoE+lNWoqdcrtxMXP0eJqG8qciQSo4mG
         z6CdV526dWIOT233wF5sOmXA8SZarfc0ETp/FhR2WtqZt3U9ZGZTTYYUkNelQC3J3PWu
         vBgV3TOBpNayDh/7hwV0hGJcSYlEAhYNiu6ICPU3abpWb9F2nEn8ao15w5T+/ELzhbp5
         c+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137909; x=1749742709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1iopiNEacnt/zrf2KolJOPgZprgFWMs9+wdf/O4tEU=;
        b=t2aFrHBomeIiU3hjmhbReomKYz9PvztvtpqLwlaMR8H87x7a8ko+1hxNkxs5by4qz7
         lixnkGKmILEDr0Y7xyUfAsDV0rlAmeBeE4AnXg+oXRFTT33H+xOfy4a9KEgzjZ/GLlNa
         hzUt8/ZMgUx+4mes5FNxdT3JoODg3FCglSt+7yGHr0ll9ZI9vs63GXF7Enqrt+oRv5c3
         XhCyJsnU+1n++Wz/HGSvIgMCPBtvsGM+5nlohqUOcBYxgQBaKjEeqYJZ2HZO/B2zP8l4
         gYZwPhVDKQ0o8oTxc/2NWjcrhaA50J1NnGsT56GQJh5lBdk6cfPNjD7XjQWpRa+BNSnM
         5oxg==
X-Forwarded-Encrypted: i=1; AJvYcCWfCCOOuRMG+rfMGg4ru7I0IUj/w+eMXg81eDTkVzOLDah8RHKsUtpxk4woRZkbIvZb0iG5e7gTuAEnY0Do@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg9pVBqWtBeG88Jbu/PymngOId0UcZRn/aDdOlYSYRMoLdpcs2
	Bx426A6qmwY5vVihIh/hqxcpDtUqEmawZDbPrS7tcT/sOUhf4DX0OaL7oRGmox7TvhiuJXYuBdO
	NKQ==
X-Google-Smtp-Source: AGHT+IGasXWyU+CSngaPDa1G8ri1XRKna1hUX5IGWHUlkteXImhCgzrwi56lwVAtUvRYlgwnKMQTe4KUCA==
X-Received: from wmbdz10.prod.google.com ([2002:a05:600c:670a:b0:450:dca1:cf91])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e89:b0:44b:eb56:1d45
 with SMTP id 5b1f17b1804b1-451f0aa7ff9mr75037585e9.15.1749137909540; Thu, 05
 Jun 2025 08:38:29 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:55 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-14-tabba@google.com>
Subject: [PATCH v11 13/18] KVM: arm64: Refactor user_mem_abort()
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

To simplify the code and to make the assumptions clearer,
refactor user_mem_abort() by immediately setting force_pte to
true if the conditions are met.

Remove the comment about logging_active being guaranteed to never be
true for VM_PFNMAP memslots, since it's not actually correct.

Move code that will be reused in the following patch into separate
functions.

Other small instances of tidying up.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 100 ++++++++++++++++++++++++-------------------
 1 file changed, 55 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index eeda92330ade..ce80be116a30 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1466,13 +1466,56 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
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
@@ -1484,6 +1527,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active || is_protected_kvm_enabled();
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1501,28 +1545,16 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
-	if (!is_protected_kvm_enabled())
-		memcache = &vcpu->arch.mmu_page_cache;
-	else
-		memcache = &vcpu->arch.pkvm_memcache;
-
 	/*
 	 * Permission faults just need to update the existing leaf entry,
 	 * and so normally don't require allocations from the memcache. The
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
@@ -1536,16 +1568,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
-	/*
-	 * logging_active is guaranteed to never be true for VM_PFNMAP
-	 * memslots.
-	 */
-	if (logging_active || is_protected_kvm_enabled()) {
-		force_pte = true;
+	if (force_pte)
 		vma_shift = PAGE_SHIFT;
-	} else {
+	else
 		vma_shift = get_vma_page_shift(vma, hva);
-	}
 
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -1597,7 +1623,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			max_map_size = PAGE_SIZE;
 
 		force_pte = (max_map_size == PAGE_SIZE);
-		vma_pagesize = min(vma_pagesize, (long)max_map_size);
+		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
 	}
 
 	/*
@@ -1626,7 +1652,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
 	 * with the smp_wmb() in kvm_mmu_invalidate_end().
 	 */
-	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
+	mmu_seq = kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
 	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
@@ -1661,24 +1687,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
-- 
2.49.0.1266.g31b7d2e469-goog


