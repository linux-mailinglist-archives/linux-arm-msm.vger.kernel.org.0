Return-Path: <linux-arm-msm+bounces-47566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 248C1A30B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71E3E1882146
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3579F1FCFC2;
	Tue, 11 Feb 2025 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s7RJdFWY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2324BD0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275912; cv=none; b=pL5H8+aM3QDnmsyc5wM0WQUWYUpUvGfj4uJQwBAi42sEobOnEqwPXMfRqKJ7VWAqxWyz8URHZGdsgYLBJexOx+dvGkEWkLiVPI5jQ7+MNPEFtek9U28eVPhsRcKN6jDlCwWlT22Vmhsoniiy2cGu5a0t0Z2e5Wb0la7cUXq1eqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275912; c=relaxed/simple;
	bh=yd2zoiSRroZzy57L8R22NjfMbsVTKuInjB1zYX+cpzE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bPPa0QjTv3BaBQli6yQza3cF1tXRZxQNykFCCGBHCH1Pk+VaMeguz+ouANwJQW3uXHpe71yVjg8Qm3OP1Jcrd+q1j6GkQ9jkQjjGTCJ8aZVdFziFqZwEV0b1Bq/2ZpZYOn+3pBYxf0ex7mk1sJpGQCpZtx+VlFN8cOAs+i/kcto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s7RJdFWY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-438e180821aso31657495e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 04:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275909; x=1739880709; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ2HgreXKQ9guyRW6q6qFyEzZtqTgMKMejRNrHWMuW4=;
        b=s7RJdFWYTt6wzIauxkQZPnoSW/esHy63NZOaza8lWQ++zQxPGcM1wjplmW1EtO8ddE
         WxfnK7l8bqVTiRaPLjmZjHHyMUJFIjDy3QcICW4rR15af8lpEPLdf+Wx9K0dmjewtK0Q
         wWfNeDdSeT0pQ3S7Q4pZ+WeX1OzroKVdJdDUJ81m7KAawXUREHXrX5cUEUNgOa7npQtv
         30UqppjLV1CvCHhDgWnzUGEtya0WLs2FILYb31otLxNa/t2/DGrMxQn1TEq/qqME1qkD
         0qMUG2rB5h+29hNRVwisSk52ioPOYYa9LgsVfF9PT1QuQrIZGzrO3AIKLFoXu7Q87a7O
         I43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275909; x=1739880709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ2HgreXKQ9guyRW6q6qFyEzZtqTgMKMejRNrHWMuW4=;
        b=FOxYeLVFZr9MZLQu/s9qiAN1jKhQeAY5xWq6HwqXJg9g/N6eCNxWQW/fq5RVIF2KoA
         Y4AnOk2Hy/JVGcVyqVHYSlfTV/Uhv03UpihrC7YZd1UFY+z53/Nn1o7IfqP9r2mnpMM+
         3ZdP7W7OLEzt36KFVL3WV8OhFEOuNyXkXevrkDU/0uGQLqUx2qgz2RNkbAXViBvCiPCm
         rIffnbKz36SyTe6ke/hB8Guro7dO/krkhEwdsAl/BNToAk60jEwkO1BuYh4UbZ1ROXRG
         lXWQPlcUDJxlKFdsUhmeM1Oj+uLjoZGcr8TPV3EE0qMBuDkYuYKnt38voZ87ubaFBLpe
         Rn7A==
X-Forwarded-Encrypted: i=1; AJvYcCUTV2SuFQ+3cgp0tJgwoLnSc6j5V+tGXWh9/YeuUqkgCe28vQ4L0fpqMlla32hE56gh11KQaOjj622/fgyg@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYxIPYqPiCcWUYOnnn4Vp8gIEyOqefs6hhsulMj3E7ub2p6s4
	/Q1+e5crBD52ivq/KYjaMOz0MhmAeh9ZI6QihLXfN6sJ1KYXrcLtzHZCGlKQFoNU8lePf+IvGA=
	=
X-Google-Smtp-Source: AGHT+IEj4XD0sGiUgxvZj8X1oAi0zbv38fYpf93jNGmxC+Jnpk8S/pLCTD5RS0c/7wEygEIr3cX4yUmedQ==
X-Received: from wmbeq3.prod.google.com ([2002:a05:600c:8483:b0:436:1796:9989])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a0a:b0:434:a525:7257
 with SMTP id 5b1f17b1804b1-439249abea0mr120725365e9.21.1739275908711; Tue, 11
 Feb 2025 04:11:48 -0800 (PST)
Date: Tue, 11 Feb 2025 12:11:25 +0000
In-Reply-To: <20250211121128.703390-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250211121128.703390-10-tabba@google.com>
Subject: [PATCH v3 09/11] KVM: arm64: Introduce KVM_VM_TYPE_ARM_SW_PROTECTED
 machine type
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

Introduce a new virtual machine type,
KVM_VM_TYPE_ARM_SW_PROTECTED, to serve as a development and
testing vehicle for Confidential (CoCo) VMs, similar to the x86
KVM_X86_SW_PROTECTED_VM type.

Initially, this is used to test guest_memfd without needing any
underlying protection.

Similar to the x86 type, this is currently only for development
and testing.  Do not use KVM_VM_TYPE_ARM_SW_PROTECTED for "real"
VMs, and especially not in production. The behavior and effective
ABI for software-protected VMs is unstable.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 Documentation/virt/kvm/api.rst    |  5 +++++
 arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
 arch/arm64/kvm/arm.c              |  5 +++++
 arch/arm64/kvm/mmu.c              |  3 ---
 include/uapi/linux/kvm.h          |  6 ++++++
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 2b52eb77e29c..0fccee4feee7 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -214,6 +214,11 @@ exposed by the guest CPUs in ID_AA64MMFR0_EL1[PARange]. It only affects
 size of the address translated by the stage2 level (guest physical to
 host physical address translations).
 
+KVM_VM_TYPE_ARM_SW_PROTECTED is currently only for development and testing of
+confidential VMs without having underlying support. Do not use
+KVM_VM_TYPE_ARM_SW_PROTECTED for "real" VMs, and especially not in production.
+The behavior and effective ABI for software-protected VMs is unstable.
+
 
 4.3 KVM_GET_MSR_INDEX_LIST, KVM_GET_MSR_FEATURE_INDEX_LIST
 ----------------------------------------------------------
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..a4276d56f54d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -383,6 +383,8 @@ struct kvm_arch {
 	 * the associated pKVM instance in the hypervisor.
 	 */
 	struct kvm_protected_vm pkvm;
+
+	unsigned long vm_type;
 };
 
 struct kvm_vcpu_fault_info {
@@ -1555,4 +1557,12 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1poe(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
+#define kvm_arch_has_private_mem(kvm)			\
+	(IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&		\
+	 ((kvm)->arch.vm_type & KVM_VM_TYPE_ARM_SW_PROTECTED))
+
+#define kvm_arch_gmem_supports_shared_mem(kvm)		\
+	(IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&	\
+	 ((kvm)->arch.vm_type & KVM_VM_TYPE_ARM_SW_PROTECTED))
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 071a7d75be68..a2066db52ada 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -146,6 +146,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
 
+	if (type & ~KVM_VM_TYPE_MASK)
+		return -EINVAL;
+
 	mutex_init(&kvm->arch.config_lock);
 
 #ifdef CONFIG_LOCKDEP
@@ -187,6 +190,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
 
+	kvm->arch.vm_type = type;
+
 	return 0;
 
 err_free_cpumask:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 305060518766..b89649d31127 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -882,9 +882,6 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	u64 mmfr0, mmfr1;
 	u32 phys_shift;
 
-	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
-		return -EINVAL;
-
 	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
 	if (is_protected_kvm_enabled()) {
 		phys_shift = kvm_ipa_limit;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 117937a895da..f155d3781e08 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -652,6 +652,12 @@ struct kvm_enable_cap {
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
+#define KVM_VM_TYPE_ARM_SW_PROTECTED	(1UL << 9)
+
+#define KVM_VM_TYPE_MASK	(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
+				 KVM_VM_TYPE_ARM_SW_PROTECTED)
+
 /*
  * ioctls for /dev/kvm fds:
  */
-- 
2.48.1.502.g6dc24dfdaf-goog


