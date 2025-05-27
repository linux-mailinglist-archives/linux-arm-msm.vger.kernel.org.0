Return-Path: <linux-arm-msm+bounces-59586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2890AC59BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419BF8A29BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA794280A27;
	Tue, 27 May 2025 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H8ubEqoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F6727C856
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368977; cv=none; b=Ikj0pjKJMdzF3hOG7vRYeLOvglmrgCgqRq3jYp+2CvSjCGtSoLV/BGxf16AU0axMNfQmjyrRx338s2zp3kupEgiIN4PI+5CFWWsGUjJeImg22tIK2y2cPhKDs1cYaLWOQRANKdwnIS9R3LdvsLmlAPLD4/erpvzm6kbB3znlWoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368977; c=relaxed/simple;
	bh=Eot37zmLKilj4Bha1mt6W8syR6jjo5Jw837ljSExbSY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uaLvgO82NRA1KxzFplnS8TTvaWlIvZ/Wyxb/sf2/IapmjUjcpktQ3W9KYnwpsgVBTgfagVqsqXf0HEzJjHx6Qxz4qJ+0Y4z9FLHzMpTDIqJMEBSkzXIRXhNhMiCRzMt8QtaGLEj1Vfpi1mtRz1ar28t6q1UE2p4N04gI/CKrPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H8ubEqoy; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4d8983eecso1217431f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748368974; x=1748973774; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qcf5r9fuEv4TeXNhRM/FFKnchxS488iMuxF5wS7th8=;
        b=H8ubEqoyDNzRtD4Xr9yDQb7lFAeQUJ34qaC9dqfPBJLCkl4Md51Hk8mksfY7hAqwOB
         p3O8LtvZ8ftYK9Klwg8ogpYy/kCKRbqwSfR5uMBETD5TzrQUW0OG1FXmNYCvFfvAt2pM
         M1NQf9PL3nuywqWrD5T6Gz4Zgc+C1KwN1qOjEX8nqNApsk2ppwgXeM3xa2DvFusfMpTW
         ncMC3x4cCZd1fHqFr8dtESffrXJpnnpIuBnMYfXHTKkUOHjh41Olgt6cFBxXc00a+Y8K
         zH4xeAL01xEIpoiJj5vbZDuAeP9LfStUBXHVoZp6MitSdBJ+XqyiP8DSJp15Tm8PCNl1
         H74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368974; x=1748973774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qcf5r9fuEv4TeXNhRM/FFKnchxS488iMuxF5wS7th8=;
        b=S1nuKagch5ktWZphYxjegvBilvozzBuuzCzFrh1bdhg5QytrjEwxRh84wW/gNRHClM
         m/lkUyiRL10S5ud5VWxfY4P4ixmKBiBHbTcIpi09eraoUTZkC1cJDzlH8Ueg7uHJpsQz
         yTYCpQqjSyMnFL/Xl9szMXfy+rIJSi+CVMGKFMzlx7Mq162boU5YQNPHGjvg/HEUk+c5
         AE9ER0HKPqDNPY3q176PpjFao6Px6oecLpGabwLCeKo0m7ElR5UX5wx8PUBXpX50TUxN
         /l/MefQiF7rxJfLLcQYqcbs8lVua78NoHt1Z4p7fNTUhnRx2ZOsDtQgTX00faAn51Gc0
         wi1w==
X-Forwarded-Encrypted: i=1; AJvYcCXhiVBzPsJq4PfjqPV2+i0V0PE/01NTOyodxaaMv9WVxwUhuTnGLcP/3qdBZkb0+ICUHMF/r1cBcNJyanfK@vger.kernel.org
X-Gm-Message-State: AOJu0YyR28O1Gwh+PxueZEgAVoTpl3rsVqFh9pjCjufSkW6q0bcGB6JI
	g3bVgHDUg4+j4HbPnKxguUCTZIcI1dt78jqNhTu6uHi6J56yreATK6Q5tCXi82WomTThAVRj9wU
	6BQ==
X-Google-Smtp-Source: AGHT+IHCvb9oBv7M9nYviQPq2lfNId9bBMU1rJU3c1ZALC9CNK8cl36mxeGLwyYnRx/AcP4NkYwJmgvK3A==
X-Received: from wmbbd24.prod.google.com ([2002:a05:600c:1f18:b0:442:dc6e:b907])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:430e:b0:3a4:dc32:6cbc
 with SMTP id ffacd0b85a97d-3a4dc326fb0mr6674535f8f.20.1748368974318; Tue, 27
 May 2025 11:02:54 -0700 (PDT)
Date: Tue, 27 May 2025 19:02:33 +0100
In-Reply-To: <20250527180245.1413463-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250527180245.1413463-5-tabba@google.com>
Subject: [PATCH v10 04/16] KVM: x86: Rename kvm->arch.has_private_mem to kvm->arch.supports_gmem
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

The bool has_private_mem is used to indicate whether guest_memfd is
supported. Rename it to supports_gmem to make its meaning clearer and to
decouple memory being private from guest_memfd.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 4 ++--
 arch/x86/kvm/mmu/mmu.c          | 2 +-
 arch/x86/kvm/svm/svm.c          | 4 ++--
 arch/x86/kvm/x86.c              | 3 +--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 4a83fbae7056..709cc2a7ba66 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1331,7 +1331,7 @@ struct kvm_arch {
 	unsigned int indirect_shadow_pages;
 	u8 mmu_valid_gen;
 	u8 vm_type;
-	bool has_private_mem;
+	bool supports_gmem;
 	bool has_protected_state;
 	bool pre_fault_allowed;
 	struct hlist_head mmu_page_hash[KVM_NUM_MMU_PAGES];
@@ -2254,7 +2254,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
 
 #ifdef CONFIG_KVM_GMEM
-#define kvm_arch_supports_gmem(kvm) ((kvm)->arch.has_private_mem)
+#define kvm_arch_supports_gmem(kvm) ((kvm)->arch.supports_gmem)
 #else
 #define kvm_arch_supports_gmem(kvm) false
 #endif
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b66f1bf24e06..69bf2ef22ed0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3486,7 +3486,7 @@ static bool page_fault_can_be_fast(struct kvm *kvm, struct kvm_page_fault *fault
 	 * on RET_PF_SPURIOUS until the update completes, or an actual spurious
 	 * case might go down the slow path. Either case will resolve itself.
 	 */
-	if (kvm->arch.has_private_mem &&
+	if (kvm->arch.supports_gmem &&
 	    fault->is_private != kvm_mem_is_private(kvm, fault->gfn))
 		return false;
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a89c271a1951..a05b7dc7b717 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5110,8 +5110,8 @@ static int svm_vm_init(struct kvm *kvm)
 			(type == KVM_X86_SEV_ES_VM || type == KVM_X86_SNP_VM);
 		to_kvm_sev_info(kvm)->need_init = true;
 
-		kvm->arch.has_private_mem = (type == KVM_X86_SNP_VM);
-		kvm->arch.pre_fault_allowed = !kvm->arch.has_private_mem;
+		kvm->arch.supports_gmem = (type == KVM_X86_SNP_VM);
+		kvm->arch.pre_fault_allowed = !kvm->arch.supports_gmem;
 	}
 
 	if (!pause_filter_count || !pause_filter_thresh)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index be7bb6d20129..035ced06b2dd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12718,8 +12718,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return -EINVAL;
 
 	kvm->arch.vm_type = type;
-	kvm->arch.has_private_mem =
-		(type == KVM_X86_SW_PROTECTED_VM);
+	kvm->arch.supports_gmem = (type == KVM_X86_SW_PROTECTED_VM);
 	/* Decided by the vendor code for other VM types.  */
 	kvm->arch.pre_fault_allowed =
 		type == KVM_X86_DEFAULT_VM || type == KVM_X86_SW_PROTECTED_VM;
-- 
2.49.0.1164.gab81da1b16-goog


