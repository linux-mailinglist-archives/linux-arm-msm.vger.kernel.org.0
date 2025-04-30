Return-Path: <linux-arm-msm+bounces-56318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FEEAA5236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 18:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6984E984722
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCA826460D;
	Wed, 30 Apr 2025 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cEQ1RlI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2D9265608
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032226; cv=none; b=GJn1GWwfwtTAP1CWy8O1tDeZlCZg+vBnD8FnTMttkh34zqFFRFZFTsbK3TiuJSnjyuRTEmOIixqZYnDy3MBNPvxcgreZtJLqlae4HG60VRYRhh4BP1ImyxdS2VZrkptekMkAZsdACCkKa9NnW8PKcF0sj4NjOiY/iwK1CemLYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032226; c=relaxed/simple;
	bh=vOcLPiQFSqvLB/c5dYxcSswHiowmUfVhjapx+aOzRyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MMLvTbFHk+Ge7aVRjv87MjP1RXHpYD5Ak2V9Auwm22dnAnAdAYnryFba52ZCRHbcODaUlwKAnoyF9tMcz1KNydlXH36rkD1uTZxm+mTB8olfnTDt50cVYnieOEPblHYv+eCChqGP9hKIcOGwRDtcODUYt8OpQZPA1Cpa/6ew+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cEQ1RlI2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so60685e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746032223; x=1746637023; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ono0W+Y+/vEWsoVmJ4OjCULk01Pp7fxFrrjUubfzUH4=;
        b=cEQ1RlI2sr62vquiO8APSFwBGue22dcS3qVepEQ5JuFqDZcIEr+9URFpcnxWYp+hCi
         PSvRJj1RtJrZ9OrjhLbVeIPtCLs5XM8qbkYSuK6ZUloYf4EVG56CbA4+NazgOdzIL8Ns
         XmpJ5wifWoZCXqDXheHPUBXGHkZnCavugkCPMNwG8eU22xZl4YouBa4IJQOS3O24edTZ
         QgJN4SM9/c8hBDrcPI0xp9DYK21FGI3k0rDwyUT97oaoIcyLGMJqdFUO6olXLic/jkq5
         Efq36kKResL/rKWlJnfJWV+iMN0LkoteRhYxiT7uYWIoI1PTz13Sbdyo+3DrBh53W11Y
         jvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032223; x=1746637023;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ono0W+Y+/vEWsoVmJ4OjCULk01Pp7fxFrrjUubfzUH4=;
        b=EU9+o/cFI/iTsUa3dw4s3SQbZlyqArZNdmdk0ye9XBAcEnv69z/gVjv9Jo+s/5Yt/3
         rkKdBkY5y1CNKVLDUyMjMvhsM39xD9V4X44VyknkxpjCKX9ueX8TAhUnD+LrA3bV/0Tf
         r9n9mWiNo/fv0b0GkWdYm9XAFilvuJimE/JtTPzqnJY/Lkk3Ap/nVe61Ft+pPBdUwus8
         nwUxNr8p6jPxkmBlNKFUzPu/kSVV2NWSescyLNrKaKS42wE7D6jsrSiHZ/E2ANOW7Uqg
         3tiVTQfwDEhvcXW+Yk3TaelsmUmOLN+iVfeqo8u0h7D5lalyh2C7ccpemKSViY24kj0S
         Bgiw==
X-Forwarded-Encrypted: i=1; AJvYcCXAXyewQf/as3jxwVIye902waGnL4D5p2O24BN+Jmezls8LtZQm3MNTwGQAAtcG1AvnCdkm6MP+vzxHuQDi@vger.kernel.org
X-Gm-Message-State: AOJu0YxfCfIK+0fPtvmN/MJNy4QW2TYxv71e6Zw++bQj7U/zzQygRJ0j
	W0d/Hznp2sym/Is4DksVZl1EB4EO4XqJUYtQ3yB8r4HTLrh91By30cRkyfbZcYehsRYAc5J2LQ=
	=
X-Google-Smtp-Source: AGHT+IFiay9vVO5GKWifOcJ6D5kD8ctjc9P4X8VLK3L+uvOVYO2aSjWiPigUW5MFB91/q4pM36xBJgSB+w==
X-Received: from wmbbe3.prod.google.com ([2002:a05:600c:1e83:b0:440:602a:960f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b0c:b0:43d:683:8caa
 with SMTP id 5b1f17b1804b1-441b1f3958emr43326145e9.15.1746032223003; Wed, 30
 Apr 2025 09:57:03 -0700 (PDT)
Date: Wed, 30 Apr 2025 17:56:45 +0100
In-Reply-To: <20250430165655.605595-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430165655.605595-4-tabba@google.com>
Subject: [PATCH v8 03/13] KVM: Rename kvm_arch_has_private_mem() to kvm_arch_supports_gmem()
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

The function kvm_arch_has_private_mem() is used to indicate whether
guest_memfd is supported by the architecture, which until now implies
that its private. To decouple guest_memfd support from whether the
memory is private, rename this function to kvm_arch_supports_gmem().

Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 8 ++++----
 arch/x86/kvm/mmu/mmu.c          | 8 ++++----
 include/linux/kvm_host.h        | 6 +++---
 virt/kvm/kvm_main.c             | 6 +++---
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 52f6f6d08558..4a83fbae7056 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2254,9 +2254,9 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
 
 #ifdef CONFIG_KVM_GMEM
-#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
+#define kvm_arch_supports_gmem(kvm) ((kvm)->arch.has_private_mem)
 #else
-#define kvm_arch_has_private_mem(kvm) false
+#define kvm_arch_supports_gmem(kvm) false
 #endif
 
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
@@ -2309,8 +2309,8 @@ enum {
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
 # define KVM_MAX_NR_ADDRESS_SPACES	2
-/* SMM is currently unsupported for guests with private memory. */
-# define kvm_arch_nr_memslot_as_ids(kvm) (kvm_arch_has_private_mem(kvm) ? 1 : 2)
+/* SMM is currently unsupported for guests with guest_memfd (esp private) memory. */
+# define kvm_arch_nr_memslot_as_ids(kvm) (kvm_arch_supports_gmem(kvm) ? 1 : 2)
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
 #else
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 63bb77ee1bb1..7d654506d800 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4917,7 +4917,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	if (r)
 		return r;
 
-	if (kvm_arch_has_private_mem(vcpu->kvm) &&
+	if (kvm_arch_supports_gmem(vcpu->kvm) &&
 	    kvm_mem_is_private(vcpu->kvm, gpa_to_gfn(range->gpa)))
 		error_code |= PFERR_PRIVATE_ACCESS;
 
@@ -7683,7 +7683,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
 	 * Zapping SPTEs in this case ensures KVM will reassess whether or not
 	 * a hugepage can be used for affected ranges.
 	 */
-	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
+	if (WARN_ON_ONCE(!kvm_arch_supports_gmem(kvm)))
 		return false;
 
 	/* Unmap the old attribute page. */
@@ -7746,7 +7746,7 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 	 * a range that has PRIVATE GFNs, and conversely converting a range to
 	 * SHARED may now allow hugepages.
 	 */
-	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
+	if (WARN_ON_ONCE(!kvm_arch_supports_gmem(kvm)))
 		return false;
 
 	/*
@@ -7802,7 +7802,7 @@ void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
 {
 	int level;
 
-	if (!kvm_arch_has_private_mem(kvm))
+	if (!kvm_arch_supports_gmem(kvm))
 		return;
 
 	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7ca23837fa52..6ca7279520cf 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -719,11 +719,11 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 #endif
 
 /*
- * Arch code must define kvm_arch_has_private_mem if support for private memory
+ * Arch code must define kvm_arch_supports_gmem if support for guest_memfd
  * is enabled.
  */
-#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_GMEM)
-static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
+#if !defined(kvm_arch_supports_gmem) && !IS_ENABLED(CONFIG_KVM_GMEM)
+static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
 {
 	return false;
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4996cac41a8f..2468d50a9ed4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1531,7 +1531,7 @@ static int check_memory_region_flags(struct kvm *kvm,
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
-	if (kvm_arch_has_private_mem(kvm))
+	if (kvm_arch_supports_gmem(kvm))
 		valid_flags |= KVM_MEM_GUEST_MEMFD;
 
 	/* Dirty logging private memory is not currently supported. */
@@ -2362,7 +2362,7 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static u64 kvm_supported_mem_attributes(struct kvm *kvm)
 {
-	if (!kvm || kvm_arch_has_private_mem(kvm))
+	if (!kvm || kvm_arch_supports_gmem(kvm))
 		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
 
 	return 0;
@@ -4844,7 +4844,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #endif
 #ifdef CONFIG_KVM_GMEM
 	case KVM_CAP_GUEST_MEMFD:
-		return !kvm || kvm_arch_has_private_mem(kvm);
+		return !kvm || kvm_arch_supports_gmem(kvm);
 #endif
 	default:
 		break;
-- 
2.49.0.901.g37484f566f-goog


