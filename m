Return-Path: <linux-arm-msm+bounces-66252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F2B0F050
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83C517B00E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72439298CA5;
	Wed, 23 Jul 2025 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GNRtakjw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D02951CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267655; cv=none; b=QDRyG8CyB9ZIFgPr2JkA4+CN8MSd+VWA8EiVQZT94/G+79szPscSCl/DTrt8ylkNmVrhCsBd1ar4K5peyNu/g+1sQC/3Slj9To8VXlG21gwsE/8iLlEgIjswf+FqaesMBxTEbHRuXIr4ZVxea5zrnuhpO0gylrCAtuExQOFcVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267655; c=relaxed/simple;
	bh=I4odZiqpT5ob4lu2mZ8it82J1ZHitKeR782mWtLz8sk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IB/jIoKNFKPw4aX2fCcs+7ZFSIadbUOmOZd016hYA/MvyuN/bawbdlriH7FBtQsaj2NwoCI8cdVDtXYM+iIOTuFnHiXMN+oM3EhHsZHLJ1pmMoFkhJP+CY1tdkzUtjTXggItqnsCAW+jgcvzDVMo94Q8wKQY2gk0u0iuc0WtgzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GNRtakjw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so41230255e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267650; x=1753872450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kNpw8dEYDgHm3c1x7JAg5Wcl6lEIP1F4CrB+GslJPCY=;
        b=GNRtakjwljY+F6stEsXW1U/MV7NBT0G5nK/nFgY5avGeHq9vhrspzUAqKNlxUWWBi/
         IuwLz9pqjMyp7MrRi2itf2vsRpsvQEZ4ta7JRZYvdzWtrU9HFEG1h7MuI6aM995p7fJu
         yG0t9/pvDYmtEJEvz3JcyvI6t7ruU1HsnMSNwbjTAylZBLc+4XEGwbF/W8pN35lC5t5u
         L6EWP/4yY1jDiEy6HXriM3QCPt0hiO37DRttTy+wqY+TpOgjhFBcx+3U48+7r9aDmbfV
         ttTJ1Q50gQLhUMGYL86Axr82Ero5t+o1PEKTGXqQZofYdIuA2Xnwxg1gys3hG4cnI80C
         pwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267650; x=1753872450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNpw8dEYDgHm3c1x7JAg5Wcl6lEIP1F4CrB+GslJPCY=;
        b=RKHxCWEh6ZHez1ysDgPLjd4jioqtlFCaXya6SvKSRrpRynWzY8wT5sciSPY430Tr+M
         WJjuHJC46keIIMxLfCqnrIoRfceGZtWFyP6MkVDp5le7ORcP6eDL2v+vR/cTSgCtmc3+
         YLqqPwsofwd1fWrj1keRIjfMEyeBg7+QLDOEPRuoB3vPs3pFX1don+3tjMnFRVSQwmIm
         4KO8sbapLTD2nqt9zZe5EthiycHxKLBAA1/bBeHsrG51UqAvEbTbWsbR8X4Wpd6wRgbj
         Rmb7r3pMOjOpB4Dk9CYaFxrZYufJIDZ72PM95BUp+A+YW0HuNP/oTjsie52B1ajSZadG
         Mxrw==
X-Forwarded-Encrypted: i=1; AJvYcCVb5mHToC9B/5UPcwfOmtnGNJH2Xlwc3gTwGEyFM0HiTv2RfdG8P3+rYehBF9LigdzlNZghlSt0Xevu5tlC@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnG+fKymReHwFGfj9PQEg6i9LP63acWz0/63pKbLysYhg3GGV
	567OGxdLyfIjbtYOMD3yG28EoGlvRfpEd8yViVbF7pBA2E8rTe+vsH5LYWW9Ctg7XWvhot+kKq8
	+bw==
X-Google-Smtp-Source: AGHT+IGPjBKj+KAWv4XkFzcfTl/YRyCMWXzAl83SWfZSthKuLUV9vgxqxBfiL6V7YHmBDUBAbKathzOw8w==
X-Received: from wmqa3.prod.google.com ([2002:a05:600c:3483:b0:456:2817:b9ba])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d0f:0:b0:3b7:6716:12c5
 with SMTP id ffacd0b85a97d-3b768f2e272mr2065909f8f.54.1753267649660; Wed, 23
 Jul 2025 03:47:29 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:47:06 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-15-tabba@google.com>
Subject: [PATCH v16 14/22] KVM: x86/mmu: Enforce guest_memfd's max order when
 recovering hugepages
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

From: Sean Christopherson <seanjc@google.com>

Rework kvm_mmu_max_mapping_level() to consult guest_memfd (and relevant)
vendor code when recovering hugepages, e.g. after disabling live migration.
The flaw has existed since guest_memfd was originally added, but has gone
unnoticed due to lack of guest_memfd hugepage support.

Get all information on-demand from the memslot and guest_memfd instance,
even though KVM could pull the pfn from the SPTE.  However, the max
order/level needs to come from guest_memfd, and using kvm_gmem_get_pfn()
avoids adding a new gmem API, and avoids having to retrieve the pfn and
plumb it into kvm_mmu_max_mapping_level() (the pfn is needed for SNP to
consult the RMP).

Note, calling kvm_mem_is_private() in the non-fault path is safe, so long
as mmu_lock is held, as hugepage recovery operates on shadow-present SPTEs,
i.e. calling kvm_mmu_max_mapping_level() with @fault=NULL is mutually
exclusive with kvm_vm_set_mem_attributes() changing the PRIVATE attribute
of the gfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 83 +++++++++++++++++++--------------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      |  2 +-
 3 files changed, 50 insertions(+), 37 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 20dd9f64156e..6148cc96f7d4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3302,31 +3302,55 @@ static u8 kvm_max_level_for_order(int order)
 	return PG_LEVEL_4K;
 }
 
-static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
-					u8 max_level, int gmem_order)
+static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
+					const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	u8 req_max_level;
+	struct page *page;
+	kvm_pfn_t pfn;
+	u8 max_level;
 
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
+	/* For faults, use the gmem information that was resolved earlier. */
+	if (fault) {
+		pfn = fault->pfn;
+		max_level = fault->max_level;
+	} else {
+		/* TODO: Constify the guest_memfd chain. */
+		struct kvm_memory_slot *__slot = (struct kvm_memory_slot *)slot;
+		int max_order, r;
 
-	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
+		r = kvm_gmem_get_pfn(kvm, __slot, gfn, &pfn, &page, &max_order);
+		if (r)
+			return PG_LEVEL_4K;
 
-	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
-	if (req_max_level)
-		max_level = min(max_level, req_max_level);
+		if (page)
+			put_page(page);
 
-	return max_level;
+		max_level = kvm_max_level_for_order(max_order);
+	}
+
+	if (max_level == PG_LEVEL_4K)
+		return max_level;
+
+	return min(max_level,
+		   kvm_x86_call(gmem_max_mapping_level)(kvm, pfn));
 }
 
-static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
-				       const struct kvm_memory_slot *slot,
-				       gfn_t gfn, int max_level, bool is_private)
+int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
+			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
 	struct kvm_lpage_info *linfo;
-	int host_level;
+	int host_level, max_level;
+	bool is_private;
+
+	lockdep_assert_held(&kvm->mmu_lock);
+
+	if (fault) {
+		max_level = fault->max_level;
+		is_private = fault->is_private;
+	} else {
+		max_level = PG_LEVEL_NUM;
+		is_private = kvm_mem_is_private(kvm, gfn);
+	}
 
 	max_level = min(max_level, max_huge_page_level);
 	for ( ; max_level > PG_LEVEL_4K; max_level--) {
@@ -3335,25 +3359,16 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 			break;
 	}
 
-	if (is_private)
-		return max_level;
-
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
-	host_level = host_pfn_mapping_level(kvm, gfn, slot);
+	if (is_private)
+		host_level = kvm_max_private_mapping_level(kvm, fault, slot, gfn);
+	else
+		host_level = host_pfn_mapping_level(kvm, gfn, slot);
 	return min(host_level, max_level);
 }
 
-int kvm_mmu_max_mapping_level(struct kvm *kvm,
-			      const struct kvm_memory_slot *slot, gfn_t gfn)
-{
-	bool is_private = kvm_slot_has_gmem(slot) &&
-			  kvm_mem_is_private(kvm, gfn);
-
-	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
-}
-
 void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_memory_slot *slot = fault->slot;
@@ -3374,9 +3389,8 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * Enforce the iTLB multihit workaround after capturing the requested
 	 * level, which will be used to do precise, accurate accounting.
 	 */
-	fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
-						       fault->gfn, fault->max_level,
-						       fault->is_private);
+	fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, fault,
+						     fault->slot, fault->gfn);
 	if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
 		return;
 
@@ -4564,8 +4578,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
-	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
-							 fault->max_level, max_order);
+	fault->max_level = kvm_max_level_for_order(max_order);
 
 	return RET_PF_CONTINUE;
 }
@@ -7165,7 +7178,7 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 		 * mapping if the indirect sp has level = 1.
 		 */
 		if (sp->role.direct &&
-		    sp->role.level < kvm_mmu_max_mapping_level(kvm, slot, sp->gfn)) {
+		    sp->role.level < kvm_mmu_max_mapping_level(kvm, NULL, slot, sp->gfn)) {
 			kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
 
 			if (kvm_available_flush_remote_tlbs_range())
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 65f3c89d7c5d..b776be783a2f 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -411,7 +411,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	return r;
 }
 
-int kvm_mmu_max_mapping_level(struct kvm *kvm,
+int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
 			      const struct kvm_memory_slot *slot, gfn_t gfn);
 void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
 void disallowed_hugepage_adjust(struct kvm_page_fault *fault, u64 spte, int cur_level);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7f3d7229b2c1..740cb06accdb 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1813,7 +1813,7 @@ static void recover_huge_pages_range(struct kvm *kvm,
 		if (iter.gfn < start || iter.gfn >= end)
 			continue;
 
-		max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot, iter.gfn);
+		max_mapping_level = kvm_mmu_max_mapping_level(kvm, NULL, slot, iter.gfn);
 		if (max_mapping_level < iter.level)
 			continue;
 
-- 
2.50.1.470.g6ba607880d-goog


