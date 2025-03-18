Return-Path: <linux-arm-msm+bounces-51779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24EA6790B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E560717848D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B849E20FAAD;
	Tue, 18 Mar 2025 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NFnh9HHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A02116F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314720; cv=none; b=cwjg31ob77LZoE4/6RPpnDFroEdOsbfVtcw3kNVmoM42TiX/zSxXP1kAmpA+AIcNVefQ5IxIRBDVbGuREhiDztiwf4WU/ZJQDyfTe1navUIsk6Vd1sGoVVyMH4kkZkfjtIA14D7cyl+AgLqvSkEIieBsMcgjCH5sUlvsxiY6QMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314720; c=relaxed/simple;
	bh=umxu8C2NoBOTv0LQ/dw87xuKmoh149PdPjPT+CmuSyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k016C/wC8+wE4jwQ4X/CFFkznAlcgLLnZaXpUPhRTQdI1riz0qJNmVUUHst8W9+hMMCSNPUfHzJR5VZRuyOEZzQCtD5+YsikV13b2GQoyedVle1LO5U+6/jdF8hSO6rvY1gpPiuajNzB5E69kcBkv5POh9AImtyZ5g5c7Xdc6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NFnh9HHL; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so22378795e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314717; x=1742919517; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DD7dn7Ly/beG6AZrtqzXuPgQ+MQFh8NjMZMFS4hSOZA=;
        b=NFnh9HHLyxmcPb8PFVAoBQDN785yhgj8FBNeHV/C2p4/bnIFl/+1dX9qvZ5iEmAWU6
         TUEFamdjiHtVt2GNNVOq87eAg3F97sgNssoR8AKwqSwzRSdTR1T3u8DDabU4+0k0jr53
         e6tRPXoYMSPVpn0FzYsuzNntokUahVMFufIAG60+LfBw1521e8cY5XEEqjhmQXtf/LUS
         HKXtORdXcgfc7J+7yhdklQxrIobaLPqTIOFNzHWd1g7Ch0WFQtlmlu4hAfURI+gRty68
         qIgR/lsAf5ueopfnpW2R0IrOVMnVVjgmOJY0cdYL09qRBIqDT3AEPIWS7/iSgFm8+UWx
         FADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314717; x=1742919517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DD7dn7Ly/beG6AZrtqzXuPgQ+MQFh8NjMZMFS4hSOZA=;
        b=v+Zz19XTktuIRU87Bi/FepX/MifDeok9ZFRb0by84YA1FDfjfjeqtJJFp4EW7TD5j1
         kZMKBj2/5mE4TYwbXXCi8bQehqkRibZ2WL84uzNm+hdJKQOYy9YgsScpMxbKywC+bPVY
         4LQcPwavLyx/qsRoAahH6PlhhrVqHUu/Ak1thOj0u/rJOSzGO1d9y+GI1jPUToIajdKD
         O480YyZT4npsadKlFrh+2EgKAciAAv7nLg5TDdQSClekZ1+WHrMn9jUSk3+Q7lqQCclh
         RsE7GG9gsIi9WXHNLVvugne06p2dmJRuvr8b5p0Y5LkvEQ0fejD+SbgopJu/hUKKNlNf
         fPvw==
X-Forwarded-Encrypted: i=1; AJvYcCW5gP2yLZBjh82pmHcfZl5NIu3SnhyicmpVmVlFy82uGZPQxR+QEKqtyAaV0MoCRM8NSm3v3DPWHk8a+EE2@vger.kernel.org
X-Gm-Message-State: AOJu0YyJsoosReg9dtM5jGos11M3/XJWzEBqdpJml15mHI5qmrs54eO6
	tMJAQ37DP9BesZ1AvsjdCFXAglVxCNJcdoMPO9ROHi5JSCNW7dDgEaQFFIvvXeM/swf913MRmQ=
	=
X-Google-Smtp-Source: AGHT+IE7EIJMDoVEqpxWR587eRp2r8+Ir2MgzNO4zB8DTw78LEPUQteJjG5XQUYQcTjpzPemxYUdDq36BA==
X-Received: from wmcn4.prod.google.com ([2002:a05:600c:c0c4:b0:43c:fae1:8125])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:310e:b0:43c:e478:889
 with SMTP id 5b1f17b1804b1-43d3b7c9e1bmr28562425e9.0.1742314716949; Tue, 18
 Mar 2025 09:18:36 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:18:20 +0000
In-Reply-To: <20250318161823.4005529-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318161823.4005529-7-tabba@google.com>
Subject: [PATCH v7 6/9] KVM: arm64: Refactor user_mem_abort() calculation of force_pte
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
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

To simplify the code and to make the assumptions clearer,
refactor user_mem_abort() by immediately setting force_pte to
true if the conditions are met. Also, remove the comment about
logging_active being guaranteed to never be true for VM_PFNMAP
memslots, since it's not technically correct right now.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..887ffa1f5b14 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1460,7 +1460,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool write_fault, writable;
 	bool exec_fault, mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
@@ -1472,6 +1472,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active || is_protected_kvm_enabled();
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1521,16 +1522,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
-	/*
-	 * logging_active is guaranteed to never be true for VM_PFNMAP
-	 * memslots.
-	 */
-	if (logging_active || is_protected_kvm_enabled()) {
-		force_pte = true;
+	if (force_pte)
 		vma_shift = PAGE_SHIFT;
-	} else {
+	else
 		vma_shift = get_vma_page_shift(vma, hva);
-	}
 
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
-- 
2.49.0.rc1.451.g8f38331e32-goog


