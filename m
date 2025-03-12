Return-Path: <linux-arm-msm+bounces-51185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37837A5E34A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC2417AC60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84419259C83;
	Wed, 12 Mar 2025 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoUTC50M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD2258CCB
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802326; cv=none; b=YB2Y7pP3HIGyjZzl/DtzL0hWKv/YT0+tYgbQrCe+MeJr60zLMxr6gUcwAcY8HyYAzLGSBXU82pd8FJNehUNPfHOlyXkaiV4x9HbDj7K6sCJ8Mu0D/+MvFJIpBAtwBmN9gUAiKz7MmVujNygNtyH6YyT1ApqFLYJ1Q8S+pMXsgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802326; c=relaxed/simple;
	bh=JrTvyHiXKHvsC898MaHDvFWzZFHSfI05OZDM7sRwtrc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=irE4bWaPSUbsve5Sh7rN/6EDKgySD+XNUpVAZIq8oYTz8B4DtkcJwfhJIPbCIRTfOisD/7RtoAUh5jhqvY9EmaQQ++BDA43/gxW/eiFElmkizPwmXzSDTZcDqyrB5p/ojihSPRWlfXbQ2xAud+Po1TnQhDyxACMa6jNYsYBJ7lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoUTC50M; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cfd9b833bso5599715e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741802322; x=1742407122; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=We8c70tl+Zx5FQcQtlW287aL/adOZePxySoQID49z3A=;
        b=SoUTC50MIyZdgx/Nu3+DD5sfwK4hcE1FUKf7LOzJYQmxgxD3VrkwTeC17ZAX0nw1OQ
         2iLgJMUaOSIC9bGrxDYgW2w9x8/m1OSZEUv4onpdhMMHoSWTbisUKHXPvqfPt7hPBRey
         q2mZ5ebX3mR7pzv/lOa3VO6V41lU6ydimBH6AuFD6OIbW5oCJXm5z+HuuSic8crUxv0p
         TSxwlG5SgJpLmuVBDMdADXQZd/nzVaRSkA1Lpy8oUrsSq1FaFvkbzJSWxo8slr+MhmG7
         jtxC5CUAZdAiETpaf5C4VfAQqNZSi/HmeHLzf9xgdXwezdZkTsr2odVEs4oein3sCUYH
         tP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802322; x=1742407122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=We8c70tl+Zx5FQcQtlW287aL/adOZePxySoQID49z3A=;
        b=vUf+hX8iNNnJNmb3v/TyHHfRwLSVCGVkO14ffKUk0vAshcGLeB+ykqXoc3C7biygrW
         eb5XWa2zeemkmX6tSjl+VHrgo7EjKksKQE+9DL42Tck1A0serh0RNbelQFxlt4U3L2Pd
         MOJQIqQz7w9YaY5sY/erS60FXC7I8ip4sn9PQ0LeFVW9lqELFpcsjyDhf6KnE3wbVSBG
         6BIM7R11cC0ewgOyZr0dly+Om6GvQvDUvl9HB/5HManT5PwgYsjojrz+3ZPw9wzwyjFH
         hZwUTm5Zi7yAnltnsRdpJj2QiPnSoiIBaWW8tnyQBRtoU6yzWlbZri/JkW8Ti+y/GM3g
         25SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzdcu9BV1VNVAYikykhJUJYhSVsx+oKsBAPscCDQW0LmPXYe/bj2tQR5CdtjtN5sMbN0li3h0np6PDDjHO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqs/Bs7M0kirYGpd9SdWSHWTfCyJfeaNFoFec2q9Z6mkHnbkzs
	vWbNyC3hES61C7VkhtJ2y4QPuoTGGt98HGHq85V+hbZ/dW/v+IMya78AqPs/xCX5ettJtcqXZA=
	=
X-Google-Smtp-Source: AGHT+IFgL9irGVEt2YWfb1UQbIwVL/VNkbXIcKNXEidvOBQCQVT8F8I3RbRKchYk4z05AIfWZpjSXgIKCw==
X-Received: from wmbeq9.prod.google.com ([2002:a05:600c:8489:b0:43b:c9fc:b269])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1913:b0:439:8e95:796a
 with SMTP id 5b1f17b1804b1-43d161ea047mr4367375e9.13.1741802321988; Wed, 12
 Mar 2025 10:58:41 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:58:21 +0000
In-Reply-To: <20250312175824.1809636-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250312175824.1809636-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312175824.1809636-9-tabba@google.com>
Subject: [PATCH v6 08/10] KVM: arm64: Handle guest_memfd()-backed guest page faults
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
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Add arm64 support for handling guest page faults on guest_memfd
backed memslots.

For now, the fault granule is restricted to PAGE_SIZE.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c     | 65 +++++++++++++++++++++++++++-------------
 include/linux/kvm_host.h |  5 ++++
 virt/kvm/kvm_main.c      |  5 ----
 3 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 887ffa1f5b14..adb0681fc1c6 100644
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
@@ -1510,16 +1535,22 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
+	if (!is_gmem) {
+		vma = vma_lookup(current->mm, hva);
+		if (unlikely(!vma)) {
+			kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
+			mmap_read_unlock(current->mm);
+			return -EFAULT;
+		}
+
+		vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
+		mte_allowed = kvm_vma_mte_allowed(vma);
 	}
 
 	if (force_pte)
@@ -1590,18 +1621,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
@@ -1609,8 +1635,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
-	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
-				&writable, &page);
+	pfn = faultin_pfn(kvm, memslot, gfn, write_fault, &writable, &page, is_gmem);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3d5595a71a2a..ec3bedc18eab 100644
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
2.49.0.rc0.332.g42c0ae87b1-goog


