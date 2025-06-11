Return-Path: <linux-arm-msm+bounces-60980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020AAD5734
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D917F3A51D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C032BD589;
	Wed, 11 Jun 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLPKUeBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79ED2BD584
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648837; cv=none; b=rhrgj3Vo5URTywOCQ638xHCKPCg01u4y9P+J/BEpSX3ucumU0Z5dE2wd2R+Ec7OMCs3duJ/vkztWTsYCFVP9HfF5Ea2i7N+3Cob7Amy5dLYOf0T81s+ZOTFn0z2xGQDTjmYldOZIzflFydNh39d+bEvMOIef8+ujmRa4wj3iYZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648837; c=relaxed/simple;
	bh=ndUTJwepqYwEfponWZYA+LKiY/F05t1HO7+9wLu2cKg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rnTcsiP+aIYu/5OQyL098qeir74JHmaEPrBsu+Ea2mPDOv1jl4Z0R26AL7KhZeqmq3mMMnRwZT8qP+T0ekcoOCoXPias+LaJEtwI1qLZPHNBeom5SyAwnP26fi8DXPciJxCM9n6n+tyNSV7fKhJkCnEyXlmsGwTVSWKeQOmRav8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLPKUeBx; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450cb8ff0c6so36644815e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749648833; x=1750253633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsETe8JP2RK+jwc0W86kgeiqvrWmEHj3D0sgGemuJ58=;
        b=kLPKUeBxYrEIi8fe/aeO+8nlFz/gifCpX3mF64ujRj8Yq+IZtQ5bIcQ8sZPX93mqWd
         2gmtvSsHXuLijwvBsgCf9FeBMpCwiSa5tAykEV7Hz8OyCmGoXWVT6GEkXHp2ct5nwDjw
         oH9Dz7wqT1gj1w8fGYJ5g/ZwBlmVeCht+BJz0uDBNyHR6ZtzfXcu6c2GeFLH83/8FTiE
         Ce6na+JyziGUU9i5223rWMnNtrX5x2L+sVdwFFdNtvuQ115GnZsGNfZx+qnFgLPjjyT1
         JwkE5B46qBO+aF8hsDhUzCTtLBvblfJN7fW+g09PRuc9SYIvrckhY61qKAHvMb4wCeVP
         qwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648833; x=1750253633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsETe8JP2RK+jwc0W86kgeiqvrWmEHj3D0sgGemuJ58=;
        b=Tr8L+l+0td4F5TgdAunMCoPr6lSqc701AzWawSUsyKUmlPoD7jpPBTzCxec3VCn9Dx
         PzLGzIUjKc610D0q+PfwlzJDnxOFDgLZOYPIVoiP9AytRG56ZYQetcwZFAxLIcbYmeG/
         5bJl8yKm9Xid7vj8XUYwsU7SXKkWCTsiZn8tL/RrvNsxhCVpNLX38UWXzcXY8909QYXQ
         uRoJVS4m1rlw8JCLM6Y/krkZ63GRB4tTEK8Fq1bOhpxept7LDI7xUJP3oLr76MliwuF2
         XRgbCiPQF9D4N86fU5FTubNbrzgaNc1iWcW4ev6mum/38Nr94ycw7SBmnKXGBDg8hSvm
         C6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUV4M4b+ZgpMOjES4GTRJhbMRRv3wNuYrv7kfcqyntve2OHb86phpf4kYufCs0N68o6Fa3SXYT4Pjkoqqoe@vger.kernel.org
X-Gm-Message-State: AOJu0YyIz7YbVmBlfd79hhMG9x8woPHXXSD0vcyBbr4yFCTV6ctyzUKw
	iqEbG2lJvuePgE86MnOYyM+F1BEY+PNiegUKEQ1h+YA1LA3WSYqY6pY5u0kpH/cpdx4jMhF0OWP
	2Qw==
X-Google-Smtp-Source: AGHT+IEOpTQLWb/W99hYWPydN9AF4WxIXy9RQ1ao2fIs6Oh5u3U5LCTeCP7RQZ+lgMAn59d3H/C1V9UDvQ==
X-Received: from wmbhe6.prod.google.com ([2002:a05:600c:5406:b0:453:f28:e99f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190e:b0:442:dcdc:41c8
 with SMTP id 5b1f17b1804b1-45325965490mr23058795e9.19.1749648833055; Wed, 11
 Jun 2025 06:33:53 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:33:22 +0100
In-Reply-To: <20250611133330.1514028-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611133330.1514028-11-tabba@google.com>
Subject: [PATCH v12 10/18] KVM: x86/mmu: Handle guest page faults for
 guest_memfd with shared memory
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

From: Ackerley Tng <ackerleytng@google.com>

For memslots backed by guest_memfd with shared mem support, the KVM MMU
must always fault in pages from guest_memfd, and not from the host
userspace_addr. Update the fault handler to do so.

This patch also refactors related function names for accuracy:

kvm_mem_is_private() returns true only when the current private/shared
state (in the CoCo sense) of the memory is private, and returns false if
the current state is shared explicitly or impicitly, e.g., belongs to a
non-CoCo VM.

kvm_mmu_faultin_pfn_gmem() is updated to indicate that it can be used to
fault in not just private memory, but more generally, from guest_memfd.

Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 38 +++++++++++++++++++++++---------------
 include/linux/kvm_host.h | 25 +++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 75b7b02cfcb7..2aab5a00caee 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3291,6 +3291,11 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
 }
 
+static inline bool fault_from_gmem(struct kvm_page_fault *fault)
+{
+	return fault->is_private || kvm_gmem_memslot_supports_shared(fault->slot);
+}
+
 void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_memory_slot *slot = fault->slot;
@@ -4467,21 +4472,25 @@ static inline u8 kvm_max_level_for_order(int order)
 	return PG_LEVEL_4K;
 }
 
-static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
-					u8 max_level, int gmem_order)
+static u8 kvm_max_level_for_fault_and_order(struct kvm *kvm,
+					    struct kvm_page_fault *fault,
+					    int order)
 {
-	u8 req_max_level;
+	u8 max_level = fault->max_level;
 
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
-	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
+	max_level = min(kvm_max_level_for_order(order), max_level);
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
-	req_max_level = kvm_x86_call(private_max_mapping_level)(kvm, pfn);
-	if (req_max_level)
-		max_level = min(max_level, req_max_level);
+	if (fault->is_private) {
+		u8 level = kvm_x86_call(private_max_mapping_level)(kvm, fault->pfn);
+
+		if (level)
+			max_level = min(max_level, level);
+	}
 
 	return max_level;
 }
@@ -4493,10 +4502,10 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				 r == RET_PF_RETRY, fault->map_writable);
 }
 
-static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
-				       struct kvm_page_fault *fault)
+static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
+				    struct kvm_page_fault *fault)
 {
-	int max_order, r;
+	int gmem_order, r;
 
 	if (!kvm_slot_has_gmem(fault->slot)) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
@@ -4504,15 +4513,14 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
-			     &fault->refcounted_page, &max_order);
+			     &fault->refcounted_page, &gmem_order);
 	if (r) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return r;
 	}
 
 	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
-	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
-							 fault->max_level, max_order);
+	fault->max_level = kvm_max_level_for_fault_and_order(vcpu->kvm, fault, gmem_order);
 
 	return RET_PF_CONTINUE;
 }
@@ -4522,8 +4530,8 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 {
 	unsigned int foll = fault->write ? FOLL_WRITE : 0;
 
-	if (fault->is_private)
-		return kvm_mmu_faultin_pfn_private(vcpu, fault);
+	if (fault_from_gmem(fault))
+		return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
 
 	foll |= FOLL_NOWAIT;
 	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index bba7d2c14177..8f7069385189 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2547,10 +2547,31 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
 bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 					 struct kvm_gfn_range *range);
 
+/*
+ * Returns true if the given gfn's private/shared status (in the CoCo sense) is
+ * private.
+ *
+ * A return value of false indicates that the gfn is explicitly or implicitly
+ * shared (i.e., non-CoCo VMs).
+ */
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return IS_ENABLED(CONFIG_KVM_GMEM) &&
-	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
+	struct kvm_memory_slot *slot;
+
+	if (!IS_ENABLED(CONFIG_KVM_GMEM))
+		return false;
+
+	slot = gfn_to_memslot(kvm, gfn);
+	if (kvm_slot_has_gmem(slot) && kvm_gmem_memslot_supports_shared(slot)) {
+		/*
+		 * Without in-place conversion support, if a guest_memfd memslot
+		 * supports shared memory, then all the slot's memory is
+		 * considered not private, i.e., implicitly shared.
+		 */
+		return false;
+	}
+
+	return kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
 }
 #else
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
-- 
2.50.0.rc0.642.g800a2b2222-goog


