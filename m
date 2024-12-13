Return-Path: <linux-arm-msm+bounces-42104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5D9F12DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D149280A0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB95D1F3D33;
	Fri, 13 Dec 2024 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3iDQvn7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13151F428F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108524; cv=none; b=okhG0RpUs4GhdJd9qQ4w2RNQKMOyopyU1s/+PhpVUvgCKC5sWaSsY5hReVc7p7i9uydbhbSXJ+x2KkxYIraEO5BYZLTsDsXFPUeQNgHxMOCJR11BtAm5N8rPiJ5Jfo+qqD0Q5NBnhqJqaXZNwxsy3hQUDp9+ZJQ9pJLfM33FEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108524; c=relaxed/simple;
	bh=kFzhKNwEokKspfpctGToWgrQRJHoGI5g6v9oDy8dheQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V3iNapF+TV+FkqtbZUhPypNGDuG6I9wWo8RaiTKxq9OXxKtqyMG9VRtlXdBmnzeGseReHiwckyLLkNU6RElEwXaiJc5lC/CH1inc7ILyGgiu5mDf3fAuFOleyzOwrVP14capAoGu6V78flkBvTBXLDWGE4t7xNrNWVutVtp667s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3iDQvn7q; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361fc2b2d6so4598675e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108521; x=1734713321; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3eqvqwg5DMqF/8QH18XL4R6P7ndrk18+/AZZCHc/Ifs=;
        b=3iDQvn7qAZOw3Jdz4SIAk+Gbi7hu2n66NoxSPRMtQ8Wsxx18lWwVg9YdLaR/aFTCeU
         k3qIDgW5pkFEeqSnOGeo3pm0I6EXVr66kENbRBjyPH4k+1y4JYORf/b67hcXbb+baTxe
         ygOgsb1dw3lui50wBawnpB0oU95v53T8En3+njJh9SDcEpTiTSHZ3hsAY+OTnI2wh0Dc
         NuyU+2AgvB2V4ek8kn3oRt6Aow6WnYSkvcjXB6fERwxYvZ8o0nATf0iXca8/dpMxLv32
         G861rauljnKhGV4EWANB9I6yyXkDqSGrYdh8Fw+s2hVocVbAgFiVJFV+Dnrbbqg8HVjA
         0Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108521; x=1734713321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eqvqwg5DMqF/8QH18XL4R6P7ndrk18+/AZZCHc/Ifs=;
        b=CV+AADNtSFV6xP/mIjMHLFb/vjBqb8lXJgF8B4R6KzDCWxNbhk7mWCKghCN0DGcWqB
         HWHbXZKwclan8kHhIpjw68uKXxjOYlR6zL6sOdvsuTYXzyezcbCqe/EQfKX3qbR7rp6z
         xEjp351lc7/jWdS43Ll2D4pxGFQpn6sU3hoF/zCZllksL77L+5ppgJo6ixn/UL9ubmxJ
         zPXC8LAjeVZgE5fh1plU0o8DuJUlCyNoHzjyCF91ZrIaNqPRUNj3VfL9RASa30uHgrvQ
         7/YrCznGBYi5ME+mhE/vKGDOYas9LqOtgYhl5dLDvxDL/W3kuGk6dHb9oWtvWv0OtXvk
         UUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYEJ2hRRphVfLiDzoxI2COgkz79fYqmrcZDOk53nIQT0HjaIqOv1StpOtFOug4kBNYCZBS9FtXgsSKLmMA@vger.kernel.org
X-Gm-Message-State: AOJu0YzdIxAmZbtBwXZt0xlmSc0bktC/87kqlEmY2s3BZm3KJJ4j9kOO
	lfg5h8cDn7f8ZeB35V/CgFoBIVmk2GMXsak8hAcvjJgHT+n1qkSKVzV8Uk0KitW8V+6XjnnB3A=
	=
X-Google-Smtp-Source: AGHT+IGK0ZDMNsH9IoiRdhl2fIEsYjGp9BzosmVVqKEIzH/3TIloY+9G+GKQNVEw6jbsarqoTxBCMQDUSA==
X-Received: from wmlf18.prod.google.com ([2002:a7b:c8d2:0:b0:434:9da4:2fa5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3496:b0:434:a07d:b709
 with SMTP id 5b1f17b1804b1-4362aab4896mr28738005e9.29.1734108521406; Fri, 13
 Dec 2024 08:48:41 -0800 (PST)
Date: Fri, 13 Dec 2024 16:48:09 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-14-tabba@google.com>
Subject: [RFC PATCH v4 13/14] KVM: arm64: Handle guest_memfd()-backed guest
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
	jthoughton@google.com, tabba@google.com
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
 arch/arm64/kvm/mmu.c | 111 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 342a9bd3848f..1c4b3871967c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1434,6 +1434,107 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
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
+	 * Holds the folio lock until mapped in the guest and its refcount is
+	 * stable, to avoid races with paths that check if the folio is mapped
+	 * by the host.
+	 */
+	ret = kvm_gmem_get_pfn_locked(kvm, memslot, gfn, &pfn, &page, NULL);
+	if (ret)
+		return ret;
+
+	if (!kvm_slot_gmem_is_guest_mappable(memslot, gfn)) {
+		ret = -EAGAIN;
+		goto unlock_page;
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
+	kvm_release_faultin_page(kvm, page, !!ret, write_fault);
+	read_unlock(&kvm->mmu_lock);
+
+	if (ret && !fault_is_perm)
+		account_locked_vm(mm, 1, false);
+unlock_page:
+	unlock_page(page);
+	put_page(page);
+
+	return ret != -EAGAIN ? ret : 0;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1900,8 +2001,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		goto out_unlock;
 	}
 
-	ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
-			     esr_fsc_is_permission_fault(esr));
+	if (kvm_slot_can_be_private(memslot)) {
+		ret = guest_memfd_abort(vcpu, fault_ipa, memslot,
+					esr_fsc_is_permission_fault(esr));
+	} else {
+		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
+				     esr_fsc_is_permission_fault(esr));
+	}
+
 	if (ret == 0)
 		ret = 1;
 out:
-- 
2.47.1.613.gc27f4b7a9f-goog


