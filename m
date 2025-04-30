Return-Path: <linux-arm-msm+bounces-56324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD7AA5244
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 18:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 414DF168274
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C70264FB9;
	Wed, 30 Apr 2025 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CVKwcBMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC63267733
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032238; cv=none; b=mvzqbC5KOYdFUeJ1HyLVf7d4a3PQr0l3tIOZQUC7ubsdvPV9QIdz1VupAKftE5uThkbhRIKKT5r4ozf6EKf21gNMMJ8JaYghkMp7fJW0ie4OOpX+8yeX34rJE4yxsiY/xreJ7Y2ckOr/frnk+ChBUDSh9dxn79Uh+kUXzpMAuvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032238; c=relaxed/simple;
	bh=9oByMR/9JphyDqzRqkqg78E9Kw5pdvhMFfzVgdt5esg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tUJabeC7xW9ag6sQ8W73hJU7EAO3YotGMRzo1pB0YliZoSUOc1voqozxBfCtKFKSfLKGPM2cl/QgmK7/fPkYWm2L6/sPBUvw5U3Y4LIGe/kH3rO+0681dTEP7n7ezFT9cDUlFliaAAvhmUTyQ9GK29UhWFq18Ot+PlPQ17nXqgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CVKwcBMp; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so77545e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746032235; x=1746637035; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVAJjWabCG3OGzL9nZTYbHeceT78jHenYYJP1PJaCf8=;
        b=CVKwcBMpVFoXNDDQgKImY7G1SOkAKfCntqU169So2RxcXfGLrEDNcN8ScZb9KdZo5I
         uCohVqMPKKPuXnRzl3ddxY2KIwSYp6S7hhWHL99FZ2ck3peaWJlH7gg2evdS0jqY/BYI
         HOBvteTx+MFws/c3AglcTeiA3eUz/dOimY2XbF8TpkIcv/7VlfalL1LO5MSZTkBrOHIO
         q26j3LI/3ZEfl+9vlW4VP41w6xEBGZAwRQD5SMQeycvEBqok2tECYTGstBTVUpddzkSW
         peyrPK9orQRs2x7AjZKKZxlH6e4ag9R7cz1o2RHeUgNWC9/GJohB+HDJEfm7VluJjTe6
         dLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032235; x=1746637035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVAJjWabCG3OGzL9nZTYbHeceT78jHenYYJP1PJaCf8=;
        b=ZKKIHBMFEDWOopCfD57BRdPKm7eQ+govV+AAgdSRsEm6Kw2x0N23YPyuMudEWKCQc3
         tF9mKDluQK3unjFTiURu4mV2Q6ViDEQiD2fUeBr6rjVxSEcbj7qu4fl6UctTHbz4RJRz
         yh7lfkfm3Knxapk67Q9DAdKgLspW01VCac9M4vwkaFxSKxbcJtVdNDj5aaDbGk9iRa4O
         caKmdv+rOtvBlzFzqX3MV4R/7HMxGgfV4J56vhX868iExsjU4mOthwRwf28JUYli+xxp
         eBdn2oo/Qyj862wnTqtfj2DMSQHvqoKw3Tpahqj8UEPe+mnoTlKUEefYn2U2Up4BYYXe
         kmew==
X-Forwarded-Encrypted: i=1; AJvYcCWrATQhTaYF35orR6KwLhz1+N28/RTUZIa+j8Om/0nLWlQJkBa4Lv4+Ur5uzNZKB18Wjn0/qkKi8sjFwhSv@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGXytqKnEloEQZpCttQMsMt1XyKQXpNNVjsUhNaltjEsJBBsO
	F6bWLe9hZvg6V+m8XsqycNdIewWtIEYLmrONWVOO9dRyR8WNjqdHGFa0jhpKlSEmBzCcfBrqsg=
	=
X-Google-Smtp-Source: AGHT+IFO6+rLQ0EajKHUJSNNxKCG9biVTumSU06fED5NLBWVqs++8Ov0pRt8qI0Ifp6jDl4rnxgq1fe1XA==
X-Received: from wmgi20.prod.google.com ([2002:a05:600c:2d94:b0:441:b363:76fa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e02:b0:43c:e305:6d50
 with SMTP id 5b1f17b1804b1-441b1f5ae61mr33787605e9.24.1746032235467; Wed, 30
 Apr 2025 09:57:15 -0700 (PDT)
Date: Wed, 30 Apr 2025 17:56:51 +0100
In-Reply-To: <20250430165655.605595-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430165655.605595-10-tabba@google.com>
Subject: [PATCH v8 09/13] KVM: arm64: Refactor user_mem_abort() calculation of force_pte
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

To simplify the code and to make the assumptions clearer,
refactor user_mem_abort() by immediately setting force_pte to
true if the conditions are met. Also, remove the comment about
logging_active being guaranteed to never be true for VM_PFNMAP
memslots, since it's not actually correct.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..148a97c129de 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1472,7 +1472,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool write_fault, writable;
 	bool exec_fault, mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
@@ -1484,6 +1484,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active || is_protected_kvm_enabled();
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1533,16 +1534,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
2.49.0.901.g37484f566f-goog


