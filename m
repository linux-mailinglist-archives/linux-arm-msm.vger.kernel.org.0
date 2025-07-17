Return-Path: <linux-arm-msm+bounces-65512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF81B091B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 920A31C43DDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A012FD5A9;
	Thu, 17 Jul 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nRm62HD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2978B2FCE07
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769659; cv=none; b=CQ0yZkl9NXbtNXMjHCdLfhls9wZjnWUOhOLzu16YQmFU3wIkYtJK0ECNnKi3u07jXtGO2SEWBUS1mt53wLDb83dMlgtUEGAPC1wk62gCA04uyARTUVObd/LyBpHPmdIjJ0vAWc1SONtzcYFSgrickzm63EM727ldP/ctOHwtjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769659; c=relaxed/simple;
	bh=Lh7zcolzQTvzQ5YQkOxSFPb16+wGld51zPVFN204Wh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gIPbluIoOF/ArvoQ1GZ/jX4uua8EoyDVhxnW8TxJ35X5PhagpwcJxPOno2iY4PTN6nIHFYJxi2RP/XgUiAk0M4iGo5pqfU6f2I5bpjNG1aM+Vvyx/nOE6O8OUZmHObnwh6Y1PTQJ2Gu0+EFbwNUmJG5SLKTJD45fU/SwbGA7UdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nRm62HD7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-456013b59c1so6745085e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752769656; x=1753374456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=40MY/vvpJmbiADAClao3ke/5IWFeIdLJFU+WuHQ/l/o=;
        b=nRm62HD79oqqng8yybLKQACeE/SpqPVMruTp02Apn0XNKw/lmrQaNCidjK7nIfFQMi
         zDM8sT9hk2AOjukA1zu9ghlClOdXqPit6MdPM8MdTi5PQInavy1la0Ln/1Oa3yPzAZy+
         yZHM/LeheaCWbL3oDdqVyOHrLI2dXY/wNKreVAWQ2Utz49HvwmzIh6Q6n5a6YBM1GgAQ
         JxzjvfjQ4AUtLpFudda6zxzRntY46zSw/+5ez/W6AaY35d29DsVMVzboG5f/YcYyyuQA
         mG+rIhUo3NCdJD2m73u2OTnsY0U1xcItBJUGvE6ihOute/RTQcg+at8YCNKXhpw5SlbP
         GXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769656; x=1753374456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40MY/vvpJmbiADAClao3ke/5IWFeIdLJFU+WuHQ/l/o=;
        b=IZtW8wL4E+UPbDDEc+oNc1TPaHaHxFG+m6IRQAS6LbnCP6OZ8MFcrUUid5/jKxnpRi
         xZTjuqi1IeJDzzaPWFFVUQIfjKS32h/3Tf4IwhH1tows3/a1yiuCARUUghDc2R2sRsf7
         MhdTVGE3BvnMHtFTH+IO4eP5GaeJEy6MCr75wHrPQHUIzDtRAuNesrFhtRNbUgOW16QG
         gXPP6deguXwY8Uo+ml4nU+gnYB5xzTYh6Wv7LCMhlCUaQjgl5QNoNh9tY59r5wXKNcje
         Qty/mqtfDEb+1bpgmhJIEohQ5TCre32DuBTkcfOOabqjjH4er7uGysF6UgaN+QQAw0E1
         KuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOZHNRUEs5GGTo2d8ydf5FBT3DvzS9hy3BnDCgpEEp/Fm6DG2LNrM1+usFgoGceU+w3Qv7UmpjVR4LbciV@vger.kernel.org
X-Gm-Message-State: AOJu0YzHrTLCjiiPY+XhZZ8B+ztxmPeQj7dBmBAz5Ox4bx7isbIgJsZ+
	KacOldtRwaOgB4i/vR2wD8tqE4UewAnjkQfNLAavMwZGkXm9wUx9rHMakpGXYfSJb5Yxd7rkTzq
	B6A==
X-Google-Smtp-Source: AGHT+IFqshLSvHttAe4Lj1HDnzLl4Lnf5WcblvOPO7/tgfsdarzrYhcb+6njRaJ/3SSnSoX+pBdbAkr8BA==
X-Received: from wmbjg15.prod.google.com ([2002:a05:600c:a00f:b0:456:2080:97c0])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0d2:10b0:456:1d93:4365
 with SMTP id 5b1f17b1804b1-4562e32e2dbmr46846485e9.5.1752769656392; Thu, 17
 Jul 2025 09:27:36 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:27:14 +0100
In-Reply-To: <20250717162731.446579-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717162731.446579-5-tabba@google.com>
Subject: [PATCH v15 04/21] KVM: x86: Introduce kvm->arch.supports_gmem
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

Introduce a new boolean member, supports_gmem, to kvm->arch.

Previously, the has_private_mem boolean within kvm->arch was implicitly
used to indicate whether guest_memfd was supported for a KVM instance.
However, with the broader support for guest_memfd, it's not exclusively
for private or confidential memory. Therefore, it's necessary to
distinguish between a VM's general guest_memfd capabilities and its
support for private memory.

This new supports_gmem member will now explicitly indicate guest_memfd
support for a given VM, allowing has_private_mem to represent only
support for private memory.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 3 ++-
 arch/x86/kvm/svm/svm.c          | 1 +
 arch/x86/kvm/vmx/tdx.c          | 1 +
 arch/x86/kvm/x86.c              | 4 ++--
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index bde811b2d303..938b5be03d33 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1348,6 +1348,7 @@ struct kvm_arch {
 	u8 mmu_valid_gen;
 	u8 vm_type;
 	bool has_private_mem;
+	bool supports_gmem;
 	bool has_protected_state;
 	bool pre_fault_allowed;
 	struct hlist_head mmu_page_hash[KVM_NUM_MMU_PAGES];
@@ -2277,7 +2278,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
 #ifdef CONFIG_KVM_GMEM
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
-#define kvm_arch_supports_gmem(kvm) kvm_arch_has_private_mem(kvm)
+#define kvm_arch_supports_gmem(kvm)  ((kvm)->arch.supports_gmem)
 #else
 #define kvm_arch_has_private_mem(kvm) false
 #define kvm_arch_supports_gmem(kvm) false
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index ab9b947dbf4f..d1c484eaa8ad 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5181,6 +5181,7 @@ static int svm_vm_init(struct kvm *kvm)
 		to_kvm_sev_info(kvm)->need_init = true;
 
 		kvm->arch.has_private_mem = (type == KVM_X86_SNP_VM);
+		kvm->arch.supports_gmem = (type == KVM_X86_SNP_VM);
 		kvm->arch.pre_fault_allowed = !kvm->arch.has_private_mem;
 	}
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f31ccdeb905b..a3db6df245ee 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -632,6 +632,7 @@ int tdx_vm_init(struct kvm *kvm)
 
 	kvm->arch.has_protected_state = true;
 	kvm->arch.has_private_mem = true;
+	kvm->arch.supports_gmem = true;
 	kvm->arch.disabled_quirks |= KVM_X86_QUIRK_IGNORE_GUEST_PAT;
 
 	/*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 357b9e3a6cef..adbdc2cc97d4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12780,8 +12780,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return -EINVAL;
 
 	kvm->arch.vm_type = type;
-	kvm->arch.has_private_mem =
-		(type == KVM_X86_SW_PROTECTED_VM);
+	kvm->arch.has_private_mem = (type == KVM_X86_SW_PROTECTED_VM);
+	kvm->arch.supports_gmem = (type == KVM_X86_SW_PROTECTED_VM);
 	/* Decided by the vendor code for other VM types.  */
 	kvm->arch.pre_fault_allowed =
 		type == KVM_X86_DEFAULT_VM || type == KVM_X86_SW_PROTECTED_VM;
-- 
2.50.0.727.gbf7dc18ff4-goog


