Return-Path: <linux-arm-msm+bounces-66243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87791B0F03F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A95FC583E3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D122DCF43;
	Wed, 23 Jul 2025 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D5/2x+lE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60E2D8790
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267644; cv=none; b=ZGd3BISTF9MZ5VB6HUAfKj5ra/e8xobj55pC4kfU4cD18jZWcj1IHcey7FU8qXG3BJvmNEu5dC8DKnh0tfHbIl9beqf6Gsv1mJ6y3rXSJTY/U+UdS4tZQ1PN/Yt+HLM+14uXaKGNYeZbWSRJ0ux6t415oopuVMgriTJ798byI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267644; c=relaxed/simple;
	bh=GF0a3Qkbt06jTYqSskUURYCDEj8fUzvQzcZp2dhJiIU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ltFbDTuaugV+IoqIFrQkJwlLmFoxA9aK0S1mQwrWsUiahsqzeyvZnXLDYR1tnthPzLmJGHnY1woNyMK3FLZyZsTQe0Nt33f4xCjXpTvWxEwAuoIH5VUAJXXG8qLKaBzvaUAL3uuiNxi8nc40HHFHbts5QfDDN+CtT1M/YF8sV2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D5/2x+lE; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4561611dc2aso57324685e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267641; x=1753872441; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/EfkVqSo0L6Rdk58U73h5TjcIQ3MjP9XCkSYx8G0ggk=;
        b=D5/2x+lE81AcnhRa/qm7RRHMU0mWJzMY0XfXWuFI+BNdkuegKNAEVNhxg3wMc6ZOG4
         53NaP/eYdt9WfZyYl2XKrhb0hWYw9GAv1kGcfOcAVcbCUioDy3dLUYlcJ8ulmFBDg6/k
         m8SpyEKCBb6aUp83cW7dcoEdO+CEQAu+uwNSxcdW7Ok3EZXPqFCuY2yyeWlakupqnpHa
         NAHnStzlpDxNxc//IKiVzemIM3Rlu+M5LEwc+dcbTbosQbhbpaESsKrMYeR496mJkg1S
         pS3hqGLsAw7alPGvtETZO1of8pyZadwbBBcYT4BZRs67Mbeid/JaxW9FdtUnHWhbqUjk
         /KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267641; x=1753872441;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EfkVqSo0L6Rdk58U73h5TjcIQ3MjP9XCkSYx8G0ggk=;
        b=s8WwwMTBP/Y5kLUSbNTp3d/cJHs4PtyGVhQ7pU4NXmK6VNPepYUgKf/zue9sysIWSr
         jRUtGskJlw/ud78vR6F9msrUOejDYwTfO8gj4M/sT1bbVTuT3ivo6zpyfP9Dc1o7PUK8
         JrkFrgk6gJC971vhj7zF2/s/PtVsenvIO57xciPXjoHx6p3dR9P3hiFpHjSI2j4TMU/A
         QPY/yZZNZ1rahjXouYQJ5tW0svI17t6cvgjyO2GBhzYBPGMNtvWpbxV7C1WFM3FFvpXt
         1HjoCGKZBtFhWtsWMl/96ePt8g+6NvmtLSSPA5DZJYuUkQNzbTliyiQHCkmC1rmP05rE
         1U0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIp/cKmGsj2uZK5zVkrPUUOhO/6OX9+l2j4onHQtuICECbB8n18nS7fg3FqvJZ8PhmNeNWqnE7aNEFaq80@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2ZzEae60DsFxKtdeTTmU/igBcUCtftsI/gte5ZsCL9djfemU
	9gT6duaMn8ZAtQaVxZE5sM4TffksE4RKTTKFIFaLdIUcJPqGAiFlwl9SFwOPFsNCrm25dYnz8V8
	XGA==
X-Google-Smtp-Source: AGHT+IHbYm26Fr0SOOXc2m5vFYxAEfzMRdiV4s0vBHNenyrjREhBQuQ50qvhM897skkPfLicv6oO4tIntw==
X-Received: from wmbhh14.prod.google.com ([2002:a05:600c:530e:b0:455:76a8:b3a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e4e:b0:456:eab:633e
 with SMTP id 5b1f17b1804b1-45868d361a4mr22285285e9.17.1753267641083; Wed, 23
 Jul 2025 03:47:21 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:46:58 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-7-tabba@google.com>
Subject: [PATCH v16 06/22] KVM: Rename kvm_slot_can_be_private() to kvm_slot_has_gmem()
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
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
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
index 6e838cb6c9e1..fdc2824755ee 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3312,7 +3312,7 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	bool is_private = kvm_slot_can_be_private(slot) &&
+	bool is_private = kvm_slot_has_gmem(slot) &&
 			  kvm_mem_is_private(kvm, gfn);
 
 	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
@@ -4551,7 +4551,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 {
 	int max_order, r;
 
-	if (!kvm_slot_can_be_private(fault->slot)) {
+	if (!kvm_slot_has_gmem(fault->slot)) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return -EFAULT;
 	}
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 2fbdebf79fbb..7744c210f947 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2365,7 +2365,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	mutex_lock(&kvm->slots_lock);
 
 	memslot = gfn_to_memslot(kvm, params.gfn_start);
-	if (!kvm_slot_can_be_private(memslot)) {
+	if (!kvm_slot_has_gmem(memslot)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -4719,7 +4719,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	}
 
 	slot = gfn_to_memslot(kvm, gfn);
-	if (!kvm_slot_can_be_private(slot)) {
+	if (!kvm_slot_has_gmem(slot)) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, non-private slot for GPA 0x%llx\n",
 				    gpa);
 		return;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ddfb6cfe20a6..4c5e0a898652 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -615,7 +615,7 @@ struct kvm_memory_slot {
 #endif
 };
 
-static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
+static inline bool kvm_slot_has_gmem(const struct kvm_memory_slot *slot)
 {
 	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
 }
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2b50560e80e..a99e11b8b77f 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -643,7 +643,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 		return -EINVAL;
 
 	slot = gfn_to_memslot(kvm, start_gfn);
-	if (!kvm_slot_can_be_private(slot))
+	if (!kvm_slot_has_gmem(slot))
 		return -EINVAL;
 
 	file = kvm_gmem_get_file(slot);
-- 
2.50.1.470.g6ba607880d-goog


