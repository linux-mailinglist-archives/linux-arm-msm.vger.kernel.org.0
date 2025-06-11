Return-Path: <linux-arm-msm+bounces-60982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84DAD573C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7533A5F60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40A02BDC06;
	Wed, 11 Jun 2025 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YexuNDx4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCA2BD59E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648840; cv=none; b=NB7RcLZ8+UtMPZH7C8ufEluY2jEwrmqRljN4AJsrxvYpfvItHWbxlvU0Y7EyL6H44LDA+99P+iByOBJ9z8auKi+QE3LqyLIytut9vsf9dxZAfkvqdU4C5DNqDoEzI5sHaASaqaxWtxak512uUhePXdJrXAAK+anACRzY1cOkyiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648840; c=relaxed/simple;
	bh=tYG9no4G4/4JoJdOu43WxRTdUoeN59thOVKVvS8wFCQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BGutFAEX0s0KIClf3tpLdq0ZwB6qmJfPTpBRVbGWxo01l4iaLThF89o49Pf3lfew6c5xr+T6TFC39xmpIrpX5R97XcRz5DAdScKBc6PNz9z0RJlgsupwm97+bsT8dSv0cdWa+0ff9DE5fxAAPSlWORznd50OJsyKwSKNeFsIawM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YexuNDx4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so4365863f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749648837; x=1750253637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0GmgHpBmCA6zvNGFoi1Z/wq5QrRCsY3MSz2+Tp46gs=;
        b=YexuNDx4EGrWe/n9wwGizG/otD2dUD9k8IWo3aV+MTS7hgf9x20mrm6pRFEnj1uCT5
         36dFJDVQ6PeKOGyDmVJ02K8v2+lIe1xKL2PMG3ewAkPZl1Z41l1k9fK5ogII1mYha7jQ
         HNLmB2jgBlStKdr8k9mChaBnoUwE2ylLB+UVxhaVSxDq9Uz/b/E7SllKpI3qcfZg7MpG
         wOwF/ytFyQ2kYIfHnEMU+xL+E8dj4Z26Zg/kDcRDWR0cBaF8CG8Vu2lwFxXJj2SSqQhb
         JzU4dzoKNtmWyxcYkgaEaQbCnSTIoVo98mvUcnp+JyJclF1R+NjLNorMEvFfe+jCvzaR
         loUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648837; x=1750253637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0GmgHpBmCA6zvNGFoi1Z/wq5QrRCsY3MSz2+Tp46gs=;
        b=boaOnV8LTgwbH4nOEpDG7WskPiIQaAwPanEoBJS9AniLCAF0dvRy+Fqadyhc2X/msz
         g8ePTwzj11TWc6PjbBLqjBv+MBkLheBLtTPeyLCt4/NytuPNhpdhIxNP7pJp7mVpo+IU
         jWcyB0qLYINmXqD1Pi+cSgvJbebywyIjQBf5KPwRFRiDGneonbvQPb/IIiUUemkIP5Sq
         dSPzZEW8G3Dghe6vhY2EKF/MDT/Tlizy3DZEBha7uQ1AaXUYcgMwKho6dTpOvNTClvQd
         js5w0nuaLfH9IVAaGKcR0tGAGeWhKflvhxHakqRZouxYB7dWyBz+0TDkLWLyMaJ/ksJ/
         TcYA==
X-Forwarded-Encrypted: i=1; AJvYcCXrs549X8UaeZr+FneSy4bNLHKmcmQ9TdR0mr9noP9OGkUdpPQcbYbjqbo1XK+HkvPmT8Ca+OXpaT/Gzy8K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn8CZh0SyXsueZuBeGBgqZLWA3qdr++N6rBna0oLGSb4nZ2PmS
	pyPrqVZgTNnJ9OPOmke3wilAt1Vn0+YWEb7HcYYTkbyxJMfqZll34LLcuVBI5l6QOIVjj2go+Vb
	3JQ==
X-Google-Smtp-Source: AGHT+IFsqWff+6T7vsnYAkU42VVIgmr2bH+P6xTa1OxLp26jM0y9wIP/2qeKEvMKHtR2cbUL2VHzGV2row==
X-Received: from wmbji2.prod.google.com ([2002:a05:600c:a342:b0:453:910:1a18])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:290d:b0:3a5:2ef8:3512
 with SMTP id ffacd0b85a97d-3a558aa3a1fmr2525369f8f.14.1749648837456; Wed, 11
 Jun 2025 06:33:57 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:33:24 +0100
In-Reply-To: <20250611133330.1514028-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611133330.1514028-13-tabba@google.com>
Subject: [PATCH v12 12/18] KVM: x86: Enable guest_memfd shared memory for
 non-CoCo VMs
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

Define the architecture-specific macro to enable shared memory support
in guest_memfd for ordinary, i.e., non-CoCo, VM types, specifically
KVM_X86_DEFAULT_VM and KVM_X86_SW_PROTECTED_VM.

Enable the KVM_GMEM_SHARED_MEM Kconfig option if KVM_SW_PROTECTED_VM is
enabled.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 10 ++++++++++
 arch/x86/kvm/Kconfig            |  1 +
 arch/x86/kvm/x86.c              |  3 ++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 4bc50c1e21bd..7b9ccdd99f32 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2271,8 +2271,18 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
 #ifdef CONFIG_KVM_GMEM
 #define kvm_arch_supports_gmem(kvm) ((kvm)->arch.supports_gmem)
+
+/*
+ * CoCo VMs with hardware support that use guest_memfd only for backing private
+ * memory, e.g., TDX, cannot use guest_memfd with userspace mapping enabled.
+ */
+#define kvm_arch_supports_gmem_shared_mem(kvm)			\
+	(IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&			\
+	 ((kvm)->arch.vm_type == KVM_X86_SW_PROTECTED_VM ||		\
+	  (kvm)->arch.vm_type == KVM_X86_DEFAULT_VM))
 #else
 #define kvm_arch_supports_gmem(kvm) false
+#define kvm_arch_supports_gmem_shared_mem(kvm) false
 #endif
 
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 9151cd82adab..29845a286430 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -47,6 +47,7 @@ config KVM_X86
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_GENERIC_GMEM_POPULATE if KVM_SW_PROTECTED_VM
+	select KVM_GMEM_SHARED_MEM if KVM_SW_PROTECTED_VM
 	select KVM_WERROR if WERROR
 
 config KVM
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 401256ee817f..e21f5f2fe059 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12778,7 +12778,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return -EINVAL;
 
 	kvm->arch.vm_type = type;
-	kvm->arch.supports_gmem = (type == KVM_X86_SW_PROTECTED_VM);
+	kvm->arch.supports_gmem =
+		type == KVM_X86_DEFAULT_VM || type == KVM_X86_SW_PROTECTED_VM;
 	/* Decided by the vendor code for other VM types.  */
 	kvm->arch.pre_fault_allowed =
 		type == KVM_X86_DEFAULT_VM || type == KVM_X86_SW_PROTECTED_VM;
-- 
2.50.0.rc0.642.g800a2b2222-goog


