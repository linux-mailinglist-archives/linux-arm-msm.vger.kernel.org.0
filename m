Return-Path: <linux-arm-msm+bounces-46542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 519EAA222D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31B521883BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADAF1E2614;
	Wed, 29 Jan 2025 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CqphjvqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676481E0DD6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171425; cv=none; b=AaznMh5t0DKfbLno9TC0+cBjJRFTDpSEf+aiVFvVLajADGaGSSukEFPSmK6H8xKkuu2h62kW2Dzyt9Rx2xCpqGN/V2xvwtfRPOa6t+YawDqWMi+ChZHJGgQxSbU8zX0NxvO+BOEnOn8MKQmUXShLb2VKoFqyN4bvclEr5zb/NMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171425; c=relaxed/simple;
	bh=zjFy8tL6ycA9u7oJbIEiNZF5VVWtz8XZQG69IoGVR+I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WN1VL+7vt0pfULvSk9GVX66/N9YmFYfbvYlKH3lyoqH/ZQkfokAZzQ/is5UI26D1b+rIIYyPDtxnFdUi4lGcxxLQpcy52+Y0nsTHchMEA1Hp8KbtidS9iG5Ux2cuOEC1eXAzB5rJWohb7sMrJ+STuiyWZzg/Bw//j85WozU4gJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CqphjvqB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so54989555e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171422; x=1738776222; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ160MXGhYFmROJLbL7eYj3t8ftygUUVZySLs0qAKPY=;
        b=CqphjvqBG/mlgglSiXD+HWlOvWlpzgEGjsB0f+lu3WknJPYy2S5EV/r24Drq9UDB3c
         iC27A1JeNRVnD7wtign+DUZEAv9KzUeGnPO7jLaqASTGxmK707OdH06fEnSwumtCVh9U
         WkEHrNBYOC8f5vRKLP5bBC/OYA8NNig0vulkgqcIukb0y7YzkG9K7uWa2suLgv/U3BSd
         uv9SwLqLzmMk0o8b4S9Q8MU8R8pcr+FNuzuCRMFEnDswaopZXZQzj1tKK13letyVJwHn
         C1F8l4RsHQhsm/HyArjhp8wHMQlguMAJN6kA9HDUDU3pxsfz0f2KCf8166QUcMsRkD5f
         Aesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171422; x=1738776222;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ160MXGhYFmROJLbL7eYj3t8ftygUUVZySLs0qAKPY=;
        b=G0w2Q0essT6u8xDGwFoy2qLDAs9RGXXKgw/MKH4oAZ+ztwJVi3cnty+fciKR4dTlXV
         SyDVnda+uyEYuY8IhKc4fq73Gbvic8AkAMNDzc/R95Oq9ivRZ+N1w5zjUSBZEWuW45PG
         Huk9Z8emWJ6WmP6LeziDyyaidDp77Dnf/bFgEAZwDrDLaZNT3FtrdPTA3VEFCqQmBY/H
         TLxPvoe/XmAv4P+xLcrOPiB1CVK2rocFvB7JJtVPJ5RVmdSY4U/dNfQ6IjUg2timxSV/
         2u9bFhVAags80s1sW4IQH/8DMmMD+9Z9m8gcisT0Jeh1h3mnzJDMOM6zH2twzm8TAfmm
         hz0A==
X-Forwarded-Encrypted: i=1; AJvYcCXOGPxvQTn7nLcbYfNC3WveYoG9V7e9rrn0q66brzrM69W0EvKVs8ZwUFxuelmk/O9/YEZFNfTB75B8P9Ky@vger.kernel.org
X-Gm-Message-State: AOJu0YxezdHJGelNl9a8ElaO7mRxaq2xy8aUG6hUOZ2Bgg0o5DY8DyAf
	lpphfFbEga0y0OL4TGcpAprk4/Z27N+UsqUaTaTH/vuXzjVhHTejor5J/yR++THwIKcd+6TXOw=
	=
X-Google-Smtp-Source: AGHT+IHzze1fd9XcgYyloPMAtmGdSptsFbtkXMC3i4as+lZ1qQjtORL3JE2QGX7gEDdKOF6yr1lLOcmjHw==
X-Received: from wmbg5.prod.google.com ([2002:a05:600c:a405:b0:434:fb78:6216])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b23:b0:436:f960:3428
 with SMTP id 5b1f17b1804b1-438dc42ff3cmr36674135e9.29.1738171421994; Wed, 29
 Jan 2025 09:23:41 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:18 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-10-tabba@google.com>
Subject: [RFC PATCH v2 09/11] KVM: arm64: Introduce KVM_VM_TYPE_ARM_SW_PROTECTED
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
index f15b61317aad..7953b07c8c2b 100644
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
index e18e9244d17a..e8a0db2ac4fa 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -380,6 +380,8 @@ struct kvm_arch {
 	 * the associated pKVM instance in the hypervisor.
 	 */
 	struct kvm_protected_vm pkvm;
+
+	unsigned long vm_type;
 };
 
 struct kvm_vcpu_fault_info {
@@ -1529,4 +1531,12 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
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
index a102c3aebdbc..ecdb8db619d8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -171,6 +171,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
 
+	if (type & ~KVM_VM_TYPE_MASK)
+		return -EINVAL;
+
 	mutex_init(&kvm->arch.config_lock);
 
 #ifdef CONFIG_LOCKDEP
@@ -212,6 +215,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
 
+	kvm->arch.vm_type = type;
+
 	return 0;
 
 err_free_cpumask:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c1f3ddb88cb9..8e19248533f1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -869,9 +869,6 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	u64 mmfr0, mmfr1;
 	u32 phys_shift;
 
-	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
-		return -EINVAL;
-
 	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
 	if (is_protected_kvm_enabled()) {
 		phys_shift = kvm_ipa_limit;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 3ac805c5abf1..a3973d2b1a69 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -656,6 +656,12 @@ struct kvm_enable_cap {
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
2.48.1.262.g85cc9f2d1e-goog


