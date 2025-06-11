Return-Path: <linux-arm-msm+bounces-60985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C6AD573E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99BA172AD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B000F28DEFA;
	Wed, 11 Jun 2025 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hMwgKkX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2DE2949F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648846; cv=none; b=AhQVmaecZCutJ1Oj8DPEcE1nevDPcn1V3TYbadEpYxhV/aMveXO20sX1kOHiQot2e58qy6RzEp73J8rIk6AOWi8mZdokiJnb8WsNDIKuByWcjRIe5MUX04YpMhOLzXy8EiDnUuzqo04bh91n32/Mdpm+73M2M9kf4NL5xNTB19g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648846; c=relaxed/simple;
	bh=afnwtC3mJv0p/q01Hm03VsZ9g+kofebcwWBhQ+EF1D0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JUWuCmxf8eYchpztcDjrr6bailwj2AL0ym+9vNn4cmeZ/KnTh1W2s9MSzuL4w4wBm8j9cJzZGIOXSu4yo/H6Bd8szfAr+QHOAA19WoHLeOzDy22etByW0Hor6V9ocVRG5uRcjayoYoiA1+dS/Mw6w8Q7mHq52uggVsL9axxGmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hMwgKkX2; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so3117197f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749648843; x=1750253643; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fr60yTRM3Le7KlhcyzAIwAP1RCDbA7i9ZnNcPDG0Gps=;
        b=hMwgKkX2H67dF3U0RihISSB8JyQGPhU8gIDpNrPefElbSX3BKFvlxYZUmcfcfgk+Bn
         v2LViN6uUbp+Y9wDFxUbPAXKo0dfwB5rHl8oPvJgrjIzUjxS/1/addizxnj9A0DM+FP5
         dDZobXof5osoSDtqokZD8vOZ/yr1ZzxCQ0wSkwm2RxaHR/W4SAYrf/z2odRs7CuQEawj
         L/nJJ/DeAr8OctPkHVjAmEbr6oxrELG+FSxt6ufVQr4aMqdrkmX1kNlfu+XJA7bD41M5
         spw5tcCpcLG0jqxvLzDK8hbRqoj5hLiJHbLwZiuvc83FBnD9UGUtxsufzaPF1B78h/6S
         zRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648843; x=1750253643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fr60yTRM3Le7KlhcyzAIwAP1RCDbA7i9ZnNcPDG0Gps=;
        b=ruGNsxGXczYLUs795g+ThDxo0GS6GaZO/MThLat000dyP1Y9u+cl1tbcXlGx3ESRqm
         RZjEMbVcpOweRVMQ/s0jOMQK9nOj7mgzx2FevG9kvjHxNx534LQNLo7leNEGMSHbPSXb
         8AmbRb/lYxg+c3wjKX4cJQleL21QcCWwn9azYjmWNE8l/V4CCNDELlEfhayPuhdTQa4i
         DveDreDtB/u6VwgVg4WzC0+M5cKfRT0FvRlZp7w6VAqGSnCs6/tidfs0enJx8mWYVV15
         dumKJQRgKp0SdybMZxYSR5kZc0Z5pXaIdFWNC/LBWbUKDd9vH7jY21KsERD6FeG3bD/e
         HrJg==
X-Forwarded-Encrypted: i=1; AJvYcCXGnA5JFb28y8hmvhJkHXO6bR2duG+oEaB0aBPHbTqwUnrcreTEafxNv1ZtNQPDzvreO6N9QekFLDmOFdTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCp50/GgbBs5rA5BbABZLy+uzt1K2RjhqjxXAjuM5lHXIeFovF
	xmyIkEhYPiEYF/X9qkqbUl3Ce/SWENTGw+1NFaeHtXZeRZoIkb33vzMgvornfLML4i6WRqfUB+2
	2UQ==
X-Google-Smtp-Source: AGHT+IH14t+wSkhybtHuLmzZkceSzcjY9wgExM45VH1zSci1aRvRXa2k0A1lOzdSmzXE1XT7zgcgV0z25g==
X-Received: from wmsd14.prod.google.com ([2002:a05:600c:3ace:b0:43d:1873:dbaf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:144a:b0:3a5:2cca:6054
 with SMTP id ffacd0b85a97d-3a558691a5amr2274572f8f.4.1749648843428; Wed, 11
 Jun 2025 06:34:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:33:27 +0100
In-Reply-To: <20250611133330.1514028-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611133330.1514028-16-tabba@google.com>
Subject: [PATCH v12 15/18] KVM: arm64: Enable host mapping of shared
 guest_memfd memory
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

Enable the host mapping of guest_memfd-backed memory on arm64.

This applies to all current arm64 VM types that support guest_memfd.
Future VM types can restrict this behavior via the
kvm_arch_gmem_supports_shared_mem() hook if needed.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++++
 arch/arm64/kvm/Kconfig            | 1 +
 arch/arm64/kvm/mmu.c              | 7 +++++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 6ce2c5173482..0cd26219a12e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1655,5 +1655,9 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
 void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
 void check_feature_map(void);
 
+#ifdef CONFIG_KVM_GMEM
+#define kvm_arch_supports_gmem(kvm) true
+#define kvm_arch_supports_gmem_shared_mem(kvm) IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM)
+#endif
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 713248f240e0..87120d46919a 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM_SHARED_MEM
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 71f8b53683e7..55ac03f277e0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2274,6 +2274,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
 		return -EFAULT;
 
+	/*
+	 * Only support guest_memfd backed memslots with shared memory, since
+	 * there aren't any CoCo VMs that support only private memory on arm64.
+	 */
+	if (kvm_slot_has_gmem(new) && !kvm_gmem_memslot_supports_shared(new))
+		return -EINVAL;
+
 	hva = new->userspace_addr;
 	reg_end = hva + (new->npages << PAGE_SHIFT);
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


