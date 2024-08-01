Return-Path: <linux-arm-msm+bounces-27698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8DD944759
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B8E81C2440B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9B8170A26;
	Thu,  1 Aug 2024 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gwWcuKC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E0816DC35
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502902; cv=none; b=uyWi/PNlYLN338gJBbUuFiOWDzId+jYqwutHm1mdkY7YG6igKJ6LupqgRq/rK6zdK6ittIYYPbwkPnf2OmHMSDw7PDMQEx9+i++PR1GBpO3GakgHvY/dhywLD3a0MFN+176dARw8pGMJ9Bq2Qn+1TOjs9e9YxyRmXVMpoHPxDY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502902; c=relaxed/simple;
	bh=LiD8hVelwBpdklQy0FqdcvS85HI+0CpJq5EuMCPJOtQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q7jU1c5wMPDR+O5N8DjQGsKaWsycWFeXKP1j8hwH6QjgxvYzEt1ylRL16zAkrg9jiZDyidE+2yB9ZaO8vMBm8mAuY/NGDmNJTgMNO5AlcLPVLVKa4yUY8V/PFYqKo0Vgnh7ytu0xaS4+nILg1bwq3v+5HBBqu956gDYrhLMNjZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gwWcuKC5; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e08bc29c584so9096419276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502900; x=1723107700; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPkdSkcYKbc3+kSJZ/g9JVRtvGOqbhaBzYnzj0kRbFw=;
        b=gwWcuKC5lHGj/wpFCIeFLwwiIuUpblO7aBI0iFFLNkGAswKk2KIVBX26XvngZo38cS
         CuM6egCRoOECpgGMpe/uMrFxXtBiZwKVmq+7nIkx7gYI2xdiGiu737JizU8p3MwnuU+0
         QiIrW9jK3CAHTHb/cumXHsUn8MBlrv0Xz/9bP8UwI6whCXXF9VH/WQyJdCouO+RCATal
         2RgIKtGApG8ChBF/ns6u9/RX57u9zIqqIgyQ0eXOgHUyidNQXo4qclHWhSE+h7B2iR9D
         GlKAPg05iz5e49n+vXhK+V1sYRtEkwtt7cZqHSrEZjxwMRIMbd2uVluPmDhFcSnEXOug
         xBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502900; x=1723107700;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPkdSkcYKbc3+kSJZ/g9JVRtvGOqbhaBzYnzj0kRbFw=;
        b=oCEt6ymGcgtKIVesgjkKHtERbeu2QCHDIR207wC679+uY4mxNpb3yUV7Cv5SbDPS49
         m9K9na2LReoYinlD4fZzPzV85OTcW76/I8AtkWMG822e145J/ELXzfFkLy7pszRmVnER
         iHaUVdkbZd21qGEdGddImXFXZxxH+qqNvtPT9B9ARttTUzjGH1UdLQUu43Lcd2rkdtZ7
         PyQv8Rgs3Pg0g4gVZaoJbYWOnrR46B88Q1HrEqGRee6xUZ2FF4f+11/mK7yt5h5drGzn
         cSZsxyNJJuJsUmCaDPGpIxX3eOdABmlV5k3MBwrCL4BT6k4wcmOpdToC3Lj0UJ8zmF4M
         QeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0TsYGSqQOUKWsRKg7yl3AlP4pQ12Ve6asjQEhm/rACLIw1emGqdK97yJQsaruW49HlPtfwG1FTupzCRoRzCLyOprKnsp+wgg/+tx61g==
X-Gm-Message-State: AOJu0YzPEasYLvgH1uqVAUGLBa+UU9VMYenkn+wngyksXS9yC5jpJpRk
	0PK45MXB/nKeAJ2Welw0h8MCLlaMFpIQIsmbB3Rjsvjfru1nbc5wbKq0Plq1Ots+MRtnSMa9yg=
	=
X-Google-Smtp-Source: AGHT+IFLHM91ijuDJHLUo5+kzuJ4Oi83XUPKih8V/PqPhJPQ78pJ2Ei/0euF1MyM7UCy8SAtSIgxDnFcYw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:6902:2190:b0:e05:f565:6bd3 with SMTP id
 3f1490d57ef6-e0bcd490586mr2277276.12.1722502900177; Thu, 01 Aug 2024 02:01:40
 -0700 (PDT)
Date: Thu,  1 Aug 2024 10:01:15 +0100
In-Reply-To: <20240801090117.3841080-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801090117.3841080-1-tabba@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240801090117.3841080-9-tabba@google.com>
Subject: [RFC PATCH v2 08/10] KVM: arm64: Handle guest_memfd()-backed guest
 page faults
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Add arm64 support for resolving guest page faults on
guest_memfd() backed memslots. This support is not contingent on
pKVM, or other confidential computing support, and works in both
VHE and nVHE modes.

Without confidential computing, this support is useful for
testing and debugging. In the future, it might also be useful
should a user want to use guest_memfd() for all code, whether
it's for a protected guest or not.

For now, the fault granule is restricted to PAGE_SIZE.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b1fc636fb670..e15167865cab 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1378,6 +1378,123 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
 	return vma->vm_flags & VM_MTE_ALLOWED;
 }
 
+static int guest_memfd_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+			     struct kvm_memory_slot *memslot, bool fault_is_perm)
+{
+	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
+	bool exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
+	bool logging_active = memslot_is_logging(memslot);
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
+	bool write_fault = kvm_is_write_fault(vcpu);
+	struct mm_struct *mm = current->mm;
+	gfn_t gfn = gpa_to_gfn(fault_ipa);
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long mmu_seq;
+	struct page *page;
+	kvm_pfn_t pfn;
+	int ret;
+
+	/* For now, guest_memfd() only supports PAGE_SIZE granules. */
+	if (WARN_ON_ONCE(fault_is_perm &&
+			 kvm_vcpu_trap_get_perm_fault_granule(vcpu) != PAGE_SIZE)) {
+		return -EFAULT;
+	}
+
+	VM_BUG_ON(write_fault && exec_fault);
+
+	if (fault_is_perm && !write_fault && !exec_fault) {
+		kvm_err("Unexpected L2 read permission error\n");
+		return -EFAULT;
+	}
+
+	/*
+	 * Permission faults just need to update the existing leaf entry,
+	 * and so normally don't require allocations from the memcache. The
+	 * only exception to this is when dirty logging is enabled at runtime
+	 * and a write fault needs to collapse a block entry into a table.
+	 */
+	if (!fault_is_perm || (logging_active && write_fault)) {
+		ret = kvm_mmu_topup_memory_cache(memcache,
+						 kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Read mmu_invalidate_seq so that KVM can detect if the results of
+	 * kvm_gmem_get_pfn_locked() become stale prior to acquiring
+	 * kvm->mmu_lock.
+	 */
+	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
+
+	/* To pair with the smp_wmb() in kvm_mmu_invalidate_end(). */
+	smp_rmb();
+
+	ret = kvm_gmem_get_pfn_locked(kvm, memslot, gfn, &pfn, NULL);
+	if (ret)
+		return ret;
+
+	page = pfn_to_page(pfn);
+
+	if (!kvm_gmem_is_mappable(kvm, gfn, gfn + 1) &&
+	    (page_mapped(page) || page_maybe_dma_pinned(page))) {
+		return -EPERM;
+	}
+
+	/*
+	 * Once it's faulted in, a guest_memfd() page will stay in memory.
+	 * Therefore, count it as locked.
+	 */
+	if (!fault_is_perm) {
+		ret = account_locked_vm(mm, 1, true);
+		if (ret)
+			goto unlock_page;
+	}
+
+	read_lock(&kvm->mmu_lock);
+	if (mmu_invalidate_retry(kvm, mmu_seq))
+		goto unlock_mmu;
+
+	if (write_fault)
+		prot |= KVM_PGTABLE_PROT_W;
+
+	if (exec_fault)
+		prot |= KVM_PGTABLE_PROT_X;
+
+	if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
+		prot |= KVM_PGTABLE_PROT_X;
+
+	/*
+	 * Under the premise of getting a FSC_PERM fault, we just need to relax
+	 * permissions.
+	 */
+	if (fault_is_perm)
+		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
+	else
+		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, PAGE_SIZE,
+					__pfn_to_phys(pfn), prot,
+					memcache,
+					KVM_PGTABLE_WALK_HANDLE_FAULT |
+					KVM_PGTABLE_WALK_SHARED);
+
+	/* Mark the page dirty only if the fault is handled successfully */
+	if (write_fault && !ret) {
+		kvm_set_pfn_dirty(pfn);
+		mark_page_dirty_in_slot(kvm, memslot, gfn);
+	}
+
+unlock_mmu:
+	read_unlock(&kvm->mmu_lock);
+
+	if (ret && !fault_is_perm)
+		account_locked_vm(mm, 1, false);
+unlock_page:
+	unlock_page(page);
+	put_page(page);
+	return ret != -EAGAIN ? ret : 0;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
 			  bool fault_is_perm)
@@ -1748,8 +1865,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		goto out_unlock;
 	}
 
-	ret = user_mem_abort(vcpu, fault_ipa, memslot, hva,
-			     esr_fsc_is_permission_fault(esr));
+	if (kvm_slot_can_be_private(memslot)) {
+		ret = guest_memfd_abort(vcpu, fault_ipa, memslot,
+					esr_fsc_is_permission_fault(esr));
+	} else {
+		ret = user_mem_abort(vcpu, fault_ipa, memslot, hva,
+				     esr_fsc_is_permission_fault(esr));
+	}
+
 	if (ret == 0)
 		ret = 1;
 out:
-- 
2.46.0.rc1.232.g9752f9e123-goog


