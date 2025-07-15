Return-Path: <linux-arm-msm+bounces-64994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E9B0567B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A46601892B1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ACD2D837E;
	Tue, 15 Jul 2025 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u5+aKHOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049022D839A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572045; cv=none; b=sDAmA1TIe4szZs4YvxbKaZmiOMRb7DTTdTQo8uDQMh7BdGTjahA0uCvJJ1XK/ezx6qgerEVbkWrpuY61PmceGevbe5TNlsxtk6NGgb6RhyjJrINOnjzKJ15zWLzu18Yqfb+DLgrfSXrBdV4DUKj7BlaIwLNuSlsj+RDyMZqkmUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572045; c=relaxed/simple;
	bh=8drK7wXvtedh2HpFNUcdbXZgnZHxeXsUaLbHtq7/9GA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QiUXjhLkrBMoQ1ylSJt0RAwxp3qpul9ry7+eyij81h369St8+9Bq4+StlUjN5lDirrAuHM4NMdVhzQxqsoxGWR8clgTjOGkXIedHXMD4TCusvcWzeS1LTd6p4QQCH7+qmN+nQdAtNB6S6Fo/25JfxG7byTQnBecltQqR+2rQp5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u5+aKHOg; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso2231549f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572042; x=1753176842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8pudhEgqt6j9GkneYmmruy0SFjYwu+6usi2MMhMEwBI=;
        b=u5+aKHOgf14eK0pAakg5n3RKvbmNDf1kkvBYntgF6iDj0AiGrOLCfgawhKNWVlqw9r
         7UpjBVTLwEO8Lv6QptVc/JM4MtVfIcp7cDoutfFNcaOn4or5l5oAlu7/bhmjX01Xui6f
         eHaj2IdCDfCC4VDnfWx2X+NHMSJVX3HnVL+/l9WxMsZQrAQ4nI9cRvRnpxcodlLM4bHm
         Qr2VQDwxbi0VFtJNtphNksMyQexMryFa3AmM2OCZ2+UwVgdT2Rc9iXaDc1TXrPgvNNAp
         1HVUbw4YgiPNB+0ViLs4J2k78YDmzxWqvzkTGUKkc+SATCVNYpz2sLJTlYaNOv/u8yXn
         pw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572042; x=1753176842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8pudhEgqt6j9GkneYmmruy0SFjYwu+6usi2MMhMEwBI=;
        b=Z0JC+i1EJcvV/PtIIiZJrehkSHGCs809iUakQi+4d5H7je5ZM8FyTCFp7c8SuCuzBD
         Rj7OA2idOBlqWlRiPJfMBkPLEDeUAO6u9HvK6zxWwUdcyBAi+5gIaCN++AEWnqUghgoG
         YXu0rGneFUsz+Qi/QByI5mhZfpQCMdN9dGZMl9ImJzcLpiZMTvDp72iUgbVWwYOJ0ZUr
         w63b0tXeN98NgP/sL7sr52kzqe1ni9L1fWBMXjG/tE5JhZe+6kGX+171FNiba39tL5VY
         9kVt0fLKgEsrVVPhF8ibuY4W7ie0lFTZohA9Kc+ppAf+I2QKmBpTs31D8bpxu8wo7hcO
         Fgew==
X-Forwarded-Encrypted: i=1; AJvYcCUprCgpJLJnDqqNNJRCCoaLZjx4t8IL7tdT57z2GYulzYIkfVnulc6Hcnqw/9+01CR2pDPNLCHef1c9Lqbr@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBXWdTMr3R51Li9H+CdoHEb7u1jQM43thakydSHmZJLW/1sac
	d4V33Vc3hdmfacpzwA6Mw7bpeZZJJOhtkQENakLDSkYQ7A6jxUoaVA9yyIfrcUmI1hJf5N02ZM+
	kTg==
X-Google-Smtp-Source: AGHT+IFctu0fAkeb8CPBUq72/4rilEf/lWwdMxSroppHEiafl4lyrm/kvgmt1YhMWTR9YyccADVY1z8Y6Q==
X-Received: from wmrm6.prod.google.com ([2002:a05:600c:37c6:b0:456:13a2:2e7e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2207:b0:3a5:8a68:b81b
 with SMTP id ffacd0b85a97d-3b5f2e26cc0mr11225293f8f.44.1752572042216; Tue, 15
 Jul 2025 02:34:02 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:33:34 +0100
In-Reply-To: <20250715093350.2584932-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715093350.2584932-6-tabba@google.com>
Subject: [PATCH v14 05/21] KVM: Rename kvm_slot_can_be_private() to kvm_slot_has_gmem()
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

Rename kvm_slot_can_be_private() to kvm_slot_has_gmem() to improve
clarity and accurately reflect its purpose.

The function kvm_slot_can_be_private() was previously used to check if a
given kvm_memory_slot is backed by guest_memfd. However, its name
implied that the memory in such a slot was exclusively "private".

As guest_memfd support expands to include non-private memory (e.g.,
shared host mappings), it's important to remove this association. The
new name, kvm_slot_has_gmem(), states that the slot is backed by
guest_memfd without making assumptions about the memory's privacy
attributes.

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
index 4e06e2e89a8f..213904daf1e5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3285,7 +3285,7 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	bool is_private = kvm_slot_can_be_private(slot) &&
+	bool is_private = kvm_slot_has_gmem(slot) &&
 			  kvm_mem_is_private(kvm, gfn);
 
 	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
@@ -4498,7 +4498,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 {
 	int max_order, r;
 
-	if (!kvm_slot_can_be_private(fault->slot)) {
+	if (!kvm_slot_has_gmem(fault->slot)) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return -EFAULT;
 	}
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b201f77fcd49..687392c5bf5d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2323,7 +2323,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	mutex_lock(&kvm->slots_lock);
 
 	memslot = gfn_to_memslot(kvm, params.gfn_start);
-	if (!kvm_slot_can_be_private(memslot)) {
+	if (!kvm_slot_has_gmem(memslot)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -4678,7 +4678,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	}
 
 	slot = gfn_to_memslot(kvm, gfn);
-	if (!kvm_slot_can_be_private(slot)) {
+	if (!kvm_slot_has_gmem(slot)) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, non-private slot for GPA 0x%llx\n",
 				    gpa);
 		return;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ab1bde048034..ed00c2b40e4b 100644
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
2.50.0.727.gbf7dc18ff4-goog


