Return-Path: <linux-arm-msm+bounces-56321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F2AA523D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 18:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0226F7AE247
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DDF264F8A;
	Wed, 30 Apr 2025 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IW5xgUGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C061266B41
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032232; cv=none; b=PDuSecEIic0VpRpw3neyVUnNH4KDXBkfoNukdssaEnuvOWRjQ3tRpj8vFr+U4AmsGsBNSd2xOzTYeMMCujRIOTmFlbh0wPQ6u4yW0/Y0cZZsZiH3PkMp7IjdYeVqaRH4YxRKRULc5twCTJ6xcALhaFo8rqVPCumlh2O+HfkUkRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032232; c=relaxed/simple;
	bh=/44OFyP066RS7yhUZEvyYm7bCWYbBZvJOekNX824IEY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OexzRzmGBBHSWenZCorolIOw6BK5qYipn+2ycfdMl+1daBSoa4ebcWR1Uj40VjOsGmH1CV5VrkNfQLv3BjE0ZrtEvk3H+KaU9gcXJ23e+3vWLrA+6u9Rtk9cEMbyfrbKDyD3OsrO32cMyJJjgmmxLIdtH1BhhRbhRGXL5aPeh8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IW5xgUGJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso176925e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746032229; x=1746637029; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gr5Lhtq4RMEgZM2tYHreWv77Ov5o6NGJLDOXXwPVCpA=;
        b=IW5xgUGJO5st4zfIxjOn8gf8aAGFr7KTTL+5vME3+lKBVyPCYlLcoDMJ0syXVPqcA0
         oBjz9nozQXZbzqcufFMyW+3xDh2Ttu1Oxqxvm1oM0jPJFXuUIkl/I08WlN8B48UdNjBl
         q6Q5yo4Vh/7ZgXaMnBbdlL1bbriXX67h553PWy5U/XK0VjD4+qdXkar7P3Ffuh9TgcuJ
         teVyyPWFur/nnZtyOvnu2m9/QW5UfvDBSU92itTRMKcP42VUpNzlv8twWNXmRQoSwH3U
         C48Ado1mrIs2LMuJK3u7FfyZVGn5tAeicUPJ83h2MXBLEV7RB4Y1JNZV25/082xrbAXr
         ZE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032229; x=1746637029;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gr5Lhtq4RMEgZM2tYHreWv77Ov5o6NGJLDOXXwPVCpA=;
        b=Ff5i3/03MD5ZdgO9MJ4TLbaewe2GBbNn3Ixh3fFie0yaiJQvbybA5PODPlbpOD85WK
         VfcJfj8xJrxpv+o0kMutTyUv94YKDmJ8JKFTdisL9LCEYr6vAdIafOMVmkJ4k9QE4tx0
         U5jMMuAk0r8w6HpMpQqyAIgRpcbm7Vmq2XvCGxrYoSG635WeZMydvra1EhZwUTpIX1Px
         h+OH3hkapwtbvEngjlL1hbfe+XrYuzALO+UB0M0KPDnq8F4kMiuR9bD2lTnpN3WKKsBV
         NNjYEgb6tqOHMqIOa2TrRDEUq0hKdxPbN+LujFkgESIdi0oAi55Xo8Q7LKOCRRDP0UvQ
         7Ifw==
X-Forwarded-Encrypted: i=1; AJvYcCVY4a1Nxq3mrnPiBdsKZmhdj/JoeqboOFiQ6tuwST9EseJjNjvJXwsMNE+qz+heXXFgqaDHjzEozBHBXmfY@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMy7gBx3Uvw4AjDS+sKalPi8r5b8cm0ZTQzWbwY6YigsYXAp1
	vsmFT4eeNWgMDAmC1KM0bmVfSm/6Wju02cqeUTEI7ZWgIbaPMcsDmaQehFuJj4M3kM8BlbOcdw=
	=
X-Google-Smtp-Source: AGHT+IETFauGFsHYOJjw4CSDyJ0tdvCZM93gDYVKoGoQHbFjxmQvhxMExSQAfHqlOSGTi6uXKyM5+m3cQQ==
X-Received: from wmbjx12.prod.google.com ([2002:a05:600c:578c:b0:440:595d:fba9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e09:b0:43d:5ec:b2f4
 with SMTP id 5b1f17b1804b1-441b1f35490mr48191655e9.10.1746032229343; Wed, 30
 Apr 2025 09:57:09 -0700 (PDT)
Date: Wed, 30 Apr 2025 17:56:48 +0100
In-Reply-To: <20250430165655.605595-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430165655.605595-7-tabba@google.com>
Subject: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
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
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Until now, faults to private memory backed by guest_memfd are always
consumed from guest_memfd whereas faults to shared memory are consumed
from anonymous memory. Subsequent patches will allow sharing guest_memfd
backed memory in-place, and mapping it by the host. Faults to in-place
shared memory should be consumed from guest_memfd as well.

In order to facilitate that, generalize the fault lookups. Currently,
only private memory is consumed from guest_memfd and therefore as it
stands, this patch does not change the behavior.

Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 19 +++++++++----------
 include/linux/kvm_host.h |  6 ++++++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6d5dd869c890..08eebd24a0e1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3258,7 +3258,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 
 static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 				       const struct kvm_memory_slot *slot,
-				       gfn_t gfn, int max_level, bool is_private)
+				       gfn_t gfn, int max_level, bool is_gmem)
 {
 	struct kvm_lpage_info *linfo;
 	int host_level;
@@ -3270,7 +3270,7 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 			break;
 	}
 
-	if (is_private)
+	if (is_gmem)
 		return max_level;
 
 	if (max_level == PG_LEVEL_4K)
@@ -3283,10 +3283,9 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	bool is_private = kvm_slot_has_gmem(slot) &&
-			  kvm_mem_is_private(kvm, gfn);
+	bool is_gmem = kvm_slot_has_gmem(slot) && kvm_mem_from_gmem(kvm, gfn);
 
-	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
+	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_gmem);
 }
 
 void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
@@ -4465,7 +4464,7 @@ static inline u8 kvm_max_level_for_order(int order)
 	return PG_LEVEL_4K;
 }
 
-static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
+static u8 kvm_max_gmem_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 					u8 max_level, int gmem_order)
 {
 	u8 req_max_level;
@@ -4491,7 +4490,7 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				 r == RET_PF_RETRY, fault->map_writable);
 }
 
-static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
+static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
 				       struct kvm_page_fault *fault)
 {
 	int max_order, r;
@@ -4509,8 +4508,8 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
-	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
-							 fault->max_level, max_order);
+	fault->max_level = kvm_max_gmem_mapping_level(vcpu->kvm, fault->pfn,
+						      fault->max_level, max_order);
 
 	return RET_PF_CONTINUE;
 }
@@ -4521,7 +4520,7 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	unsigned int foll = fault->write ? FOLL_WRITE : 0;
 
 	if (fault->is_private)
-		return kvm_mmu_faultin_pfn_private(vcpu, fault);
+		return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
 
 	foll |= FOLL_NOWAIT;
 	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d9616ee6acc7..cdcd7ac091b5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2514,6 +2514,12 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
+static inline bool kvm_mem_from_gmem(struct kvm *kvm, gfn_t gfn)
+{
+	/* For now, only private memory gets consumed from guest_memfd. */
+	return kvm_mem_is_private(kvm, gfn);
+}
+
 #ifdef CONFIG_KVM_GMEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
-- 
2.49.0.901.g37484f566f-goog


