Return-Path: <linux-arm-msm+bounces-48413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5918BA3A443
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613A73B268C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339FE27128C;
	Tue, 18 Feb 2025 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d3raJjNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC226FDAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 17:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899523; cv=none; b=YWBfaaG7CtjTEqqad/jAgTNNTY0htqQAMqxM2egF7DJVqcCSHBk2is4cz0x4cfhjlEx9JPGd45ORqOs+HQ5CE6YuodnUYLj+xgcWIGnOR1bfRlmIHVkvc9lMjZmDY/8nAdAEjNfLVIqCc6dQERzN1EWQcTTq9+3KWIqrCbAZlOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899523; c=relaxed/simple;
	bh=vjNDiEppelyiWheebkhHJLm/orXv9jQNCXAkwaziMCM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eL8reYJChogVBEpksFbeQDaCwMgxMe4uJIytlNJU0OC9F8SoYnI36iQTZWbxUZKDfzCsAHlz9BoGlxd7TURhyE3GBVFn8qVYsaspf8F4ocnn3upEn015CkucudrBU2JimfgkUewwtK1QHByLX2smYE1B5hr6Y/prRzj71wlm/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d3raJjNI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4394040fea1so32941425e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739899519; x=1740504319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrCJ0PSXwDLqByOCYPiXAh/mnjwdtGMIXzVkGX+CyBE=;
        b=d3raJjNIa3bKIVqWUrRBR4NnkixnedGtwlO8i1WnM1DFkExc4Ce+gOW+khKkcftJg9
         CLnFyGJybEE+6CeSeY7VkaWams4KOYueypg7aoEjaqdJBvdAO4G4DKzhPqJII46BdlM2
         MBiZln1HsDNQUyGT/XDX8JBhx2DgijiAfH8hxgxftdiOzUz7CAFEpDlYlbZPSZRaF2F7
         xIc0tf2aJwbMSwODSKNaTVl512MFDCogvQBGLVKNz8C3FdiM3OeoYRpkoUx85qIsR6Mu
         Ea/5FpKnjuVkbY9hFeWmTbmQVZBM+vrn9xRjwLJTinaw54rF93KIWXCKKlKoY5pIjV4L
         ukPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899519; x=1740504319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrCJ0PSXwDLqByOCYPiXAh/mnjwdtGMIXzVkGX+CyBE=;
        b=hu8RCK/lVMnIXJst7XOQkGR+N9SyYsOyYap71uiYL2mL9YWeFcznqDmHCKYdmKS2E7
         zeq8zedNiUvJQgBHI4mu6KFQr6O4z45ZFPChyRQMmKgPSwvYC2zz2FKDjfct9DM49rl0
         VXSg1Yvdt10xWk5X0Q3tOzUReA1i/vJfO2WUc0q1EnlWhcxT/ky849LXJv4TLv6XAs1q
         0GlyVE4Zn6zzCpilWDf4UI45mAUfkZiAOaTnM8qnRhvmokTpoqXi17qCi4/Yk3ahvx9A
         uf9XfoC7VChXcCjBGiicjINLXaSsOehzcffvojl1nfnhc+z7r4l9DE6RF6zNpilYLbjd
         l8QA==
X-Forwarded-Encrypted: i=1; AJvYcCWs+nZ/WnKOfBU5sIYogtIn/S5HEUjOZ7XilBnNksXUwbEic1s4LpE1IuuusmShc87O2n1lbg0GAEXY+TEu@vger.kernel.org
X-Gm-Message-State: AOJu0YzS+ny4Xw66BlAb5TFU6ofzPDNwMaGHVE+O1O+Ky85dY+GAY+hQ
	L1IyzM2Vc/OhNQs5NOyRzLt5qw3XYbHLnhAYWZf/pZJfOCs3OdGCPl2SP4YDjpPDeIaHcOPKNg=
	=
X-Google-Smtp-Source: AGHT+IHieSA46B89OLR6pUBT7ll3MiaqOwCjVEt9P6dGxiZsBq8L2OW4aSqegjPPhJC2FlnFwn7sH4wmkA==
X-Received: from wmbep11.prod.google.com ([2002:a05:600c:840b:b0:436:fdb2:fa5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6d4a:b0:439:5d00:e78f
 with SMTP id 5b1f17b1804b1-43999b7ec7emr6088405e9.11.1739899519655; Tue, 18
 Feb 2025 09:25:19 -0800 (PST)
Date: Tue, 18 Feb 2025 17:24:58 +0000
In-Reply-To: <20250218172500.807733-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250218172500.807733-9-tabba@google.com>
Subject: [PATCH v4 08/10] KVM: arm64: Handle guest_memfd()-backed guest page faults
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
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
	jthoughton@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Add arm64 support for handling guest page faults on guest_memfd
backed memslots.

For now, the fault granule is restricted to PAGE_SIZE.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c     | 79 ++++++++++++++++++++++++++--------------
 include/linux/kvm_host.h |  5 +++
 virt/kvm/kvm_main.c      |  5 ---
 3 files changed, 57 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b6c0acb2311c..d57a70f19aac 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1454,6 +1454,30 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
 	return vma->vm_flags & VM_MTE_ALLOWED;
 }
 
+static kvm_pfn_t faultin_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+			     gfn_t gfn, bool write_fault, bool *writable,
+			     struct page **page, bool is_private)
+{
+	kvm_pfn_t pfn;
+	int ret;
+
+	if (!is_private)
+		return __kvm_faultin_pfn(slot, gfn, write_fault ? FOLL_WRITE : 0, writable, page);
+
+	*writable = false;
+
+	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, page, NULL);
+	if (!ret) {
+		*writable = !memslot_is_readonly(slot);
+		return pfn;
+	}
+
+	if (ret == -EHWPOISON)
+		return KVM_PFN_ERR_HWPOISON;
+
+	return KVM_PFN_ERR_NOSLOT_MASK;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1461,19 +1485,20 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 {
 	int ret = 0;
 	bool write_fault, writable;
-	bool exec_fault, mte_allowed;
+	bool exec_fault, mte_allowed = false;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
 	phys_addr_t ipa = fault_ipa;
 	struct kvm *kvm = vcpu->kvm;
-	struct vm_area_struct *vma;
+	struct vm_area_struct *vma = NULL;
 	short vma_shift;
 	void *memcache;
-	gfn_t gfn;
+	gfn_t gfn = ipa >> PAGE_SHIFT;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
-	bool force_pte = logging_active || is_protected_kvm_enabled();
-	long vma_pagesize, fault_granule;
+	bool is_gmem = kvm_mem_is_private(kvm, gfn);
+	bool force_pte = logging_active || is_gmem || is_protected_kvm_enabled();
+	long vma_pagesize, fault_granule = PAGE_SIZE;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
 	struct page *page;
@@ -1510,24 +1535,30 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			return ret;
 	}
 
+	mmap_read_lock(current->mm);
+
 	/*
 	 * Let's check if we will get back a huge page backed by hugetlbfs, or
 	 * get block mapping for device MMIO region.
 	 */
-	mmap_read_lock(current->mm);
-	vma = vma_lookup(current->mm, hva);
-	if (unlikely(!vma)) {
-		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
-		mmap_read_unlock(current->mm);
-		return -EFAULT;
-	}
+	if (!is_gmem) {
+		vma = vma_lookup(current->mm, hva);
+		if (unlikely(!vma)) {
+			kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
+			mmap_read_unlock(current->mm);
+			return -EFAULT;
+		}
 
-	/*
-	 * logging_active is guaranteed to never be true for VM_PFNMAP
-	 * memslots.
-	 */
-	if (WARN_ON_ONCE(logging_active && (vma->vm_flags & VM_PFNMAP)))
-		return -EFAULT;
+		/*
+		 * logging_active is guaranteed to never be true for VM_PFNMAP
+		 * memslots.
+		 */
+		if (WARN_ON_ONCE(logging_active && (vma->vm_flags & VM_PFNMAP)))
+			return -EFAULT;
+
+		vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
+		mte_allowed = kvm_vma_mte_allowed(vma);
+	}
 
 	if (force_pte)
 		vma_shift = PAGE_SHIFT;
@@ -1597,18 +1628,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		ipa &= ~(vma_pagesize - 1);
 	}
 
-	gfn = ipa >> PAGE_SHIFT;
-	mte_allowed = kvm_vma_mte_allowed(vma);
-
-	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
-
 	/* Don't use the VMA after the unlock -- it may have vanished */
 	vma = NULL;
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
-	 * acquiring kvm->mmu_lock.
+	 * vma_lookup() or faultin_pfn() become stale prior to acquiring
+	 * kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
 	 * with the smp_wmb() in kvm_mmu_invalidate_end().
@@ -1616,8 +1642,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
-	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
-				&writable, &page);
+	pfn = faultin_pfn(kvm, memslot, gfn, write_fault, &writable, &page, is_gmem);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 83f65c910ccb..04f998476bf9 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1882,6 +1882,11 @@ static inline int memslot_id(struct kvm *kvm, gfn_t gfn)
 	return gfn_to_memslot(kvm, gfn)->id;
 }
 
+static inline bool memslot_is_readonly(const struct kvm_memory_slot *slot)
+{
+	return slot->flags & KVM_MEM_READONLY;
+}
+
 static inline gfn_t
 hva_to_gfn_memslot(unsigned long hva, struct kvm_memory_slot *slot)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 38f0f402ea46..3e40acb9f5c0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2624,11 +2624,6 @@ unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn)
 	return size;
 }
 
-static bool memslot_is_readonly(const struct kvm_memory_slot *slot)
-{
-	return slot->flags & KVM_MEM_READONLY;
-}
-
 static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t gfn,
 				       gfn_t *nr_pages, bool write)
 {
-- 
2.48.1.601.g30ceb7b040-goog


