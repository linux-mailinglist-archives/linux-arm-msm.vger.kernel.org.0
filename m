Return-Path: <linux-arm-msm+bounces-60327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E143ACF334
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43F961895E44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B4519F11B;
	Thu,  5 Jun 2025 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pd6N8n27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99761F1515
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137896; cv=none; b=mcJag+tHVLIDk6iCxOxavX64cx69b0x2aOD5Zyh+dtpRGH0chLv1JfXjpsBEy/9eKAoDZUSn23kvklE4pC1FPrZt9uOpC5cwnSt8IORzQM3ixMTQjXjx+4BWI6BYuVsfUi3wpIyeUEgiJJT1XOxy+1rPKQGZjQxpUtAvLUP/qqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137896; c=relaxed/simple;
	bh=ClqrgboMEAhwsqtCXqqp6SxhBiB6M6InDzTzjwdArXo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z6VuQoKdqe1QpLkEUHdkkFSLLJgmqO2tJ2XwVOQLQc9SmmEGMWUnR/CcBUAi5m2e1TATWCtpyfR9mcKN8Z6CZhzzZBls7IpMFHBM2s1zS3+c6uic2YQiy/e4fKA8M5N7sZaJ2tLVGMu+aSxvMhAlduB8BNigVFv8iDIG7Ik8Zw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pd6N8n27; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so710268f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137893; x=1749742693; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qe3sWK5q5nK1m5jGk9UWStlvXP6F2F3f83ETUbM9FxM=;
        b=pd6N8n27L77gA4fYrBMC5E54AobMXFK6ENdDB6PgifD3eGnBlcrt+FJZ/+zVCQuYSr
         yz+tW78/x/XK0Gh6RG4tuCaN5nfa5N3GYBSh0yMXoZbl53ZTnW0viBV+NUev+yJbDXUp
         3O73BgHxx6ze2BwKkdk6T1lj/+QyHO0sVdcB2MMIAc8by+4+cKOSYZm5ukHgJkSbgoNM
         RiBn3SHOfm3c8TEQmWGohL/IlA5lv5VpEp0UZZP6bZcunpGK18cSTxP1RiYLyKRCkttQ
         eIlFXColoIrOVXXQ7VZIQkHfIVlv+T9a/lakQ+53vFcy2LO60h9x8K9uMHwaHaDjGzMN
         Wv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137893; x=1749742693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qe3sWK5q5nK1m5jGk9UWStlvXP6F2F3f83ETUbM9FxM=;
        b=SLrs1MTyc31+WnOiTROPmtTNilsmv4N8mMZ19jxjkcqsQQC+iiNwGXcxK9v8ngubky
         GPQT+MCOVhGAEnLKNIyUVIMR54w5tIMylYXj9xCbZ+FIGRppEJ+ipUW/9lwhqUcSuiSN
         C4iivhZBcQK3B2qohDjAqpRuTgSUa7bw1vM1uH/pVyg+j784iV1kxLOEw6hP7lwRVj/7
         Rl1iRr1j5ZHTehUoUt+Mjcfm+JhccaHNHCI9cs8+tUPv95L1W6oDtMj6s2tyX1hIuReR
         ++wwHM09EDCKWyLpUuzyn5BqYfZ8wYd67H/zmreLWrpa7URc4LSjKOPmWwws82LeDkXE
         6mHw==
X-Forwarded-Encrypted: i=1; AJvYcCXyZo0PdxG5aLLyzJGi2nlYrvAXrWyjnYgUbpur/7sFDnuOp6LBDtkiBaiJlohNVT/lKO/PnAk8Z1fOx6Lw@vger.kernel.org
X-Gm-Message-State: AOJu0YzwaFuYuKxJHIcqFjmGRF+5Dp9G/CghGMbs+riWFL2vTxnLtF1m
	JhFgm8Ua8+66AeQjVpSDLg5nTQ4YRsDjbB005op7uIpYTBy1ogGizfdG1TmRtk0LVaTtr7dCVvz
	x1Q==
X-Google-Smtp-Source: AGHT+IFmcdwhn2LMYNxP+uGrHHW9kSBs4n3ZI9kvbXxMD+ySlDN/PQ/FygdrWVTr0+hjocoxBaJLadObcg==
X-Received: from wmsr2.prod.google.com ([2002:a05:600c:8b02:b0:450:d401:f555])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:588a:0:b0:3a4:d5e8:e352
 with SMTP id ffacd0b85a97d-3a51d924837mr6940909f8f.7.1749137892942; Thu, 05
 Jun 2025 08:38:12 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:47 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-6-tabba@google.com>
Subject: [PATCH v11 05/18] KVM: Rename kvm_slot_can_be_private() to kvm_slot_has_gmem()
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

The function kvm_slot_can_be_private() is used to check whether a memory
slot is backed by guest_memfd. Rename it to kvm_slot_has_gmem() to make
that clearer and to decouple memory being private from guest_memfd.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 4 ++--
 arch/x86/kvm/svm/sev.c   | 4 ++--
 include/linux/kvm_host.h | 2 +-
 virt/kvm/guest_memfd.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 69bf2ef22ed0..2b6376986f96 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3283,7 +3283,7 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	bool is_private = kvm_slot_can_be_private(slot) &&
+	bool is_private = kvm_slot_has_gmem(slot) &&
 			  kvm_mem_is_private(kvm, gfn);
 
 	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
@@ -4496,7 +4496,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 {
 	int max_order, r;
 
-	if (!kvm_slot_can_be_private(fault->slot)) {
+	if (!kvm_slot_has_gmem(fault->slot)) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return -EFAULT;
 	}
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a7a7dc507336..27759ca6d2f2 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2378,7 +2378,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	mutex_lock(&kvm->slots_lock);
 
 	memslot = gfn_to_memslot(kvm, params.gfn_start);
-	if (!kvm_slot_can_be_private(memslot)) {
+	if (!kvm_slot_has_gmem(memslot)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -4688,7 +4688,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	}
 
 	slot = gfn_to_memslot(kvm, gfn);
-	if (!kvm_slot_can_be_private(slot)) {
+	if (!kvm_slot_has_gmem(slot)) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, non-private slot for GPA 0x%llx\n",
 				    gpa);
 		return;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6ca7279520cf..d9616ee6acc7 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -614,7 +614,7 @@ struct kvm_memory_slot {
 #endif
 };
 
-static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
+static inline bool kvm_slot_has_gmem(const struct kvm_memory_slot *slot)
 {
 	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
 }
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index befea51bbc75..6db515833f61 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -654,7 +654,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 		return -EINVAL;
 
 	slot = gfn_to_memslot(kvm, start_gfn);
-	if (!kvm_slot_can_be_private(slot))
+	if (!kvm_slot_has_gmem(slot))
 		return -EINVAL;
 
 	file = kvm_gmem_get_file(slot);
-- 
2.49.0.1266.g31b7d2e469-goog


