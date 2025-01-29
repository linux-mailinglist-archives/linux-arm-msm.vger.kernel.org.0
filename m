Return-Path: <linux-arm-msm+bounces-46540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D7A222CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52F8718828EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2E61E0DD0;
	Wed, 29 Jan 2025 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KoUpu0+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3AA1E1C36
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171421; cv=none; b=Onsxo2LsEkraxNlYdfJMphiaRPsGx0oKep0+vC+rJyQG52lhjse9hDttXUqkJRrDXa2z1BQabHxsjozWVxL1b58cLZXPFjUW1IZOf+7GsSqhhrmBB9IrgyWO2cIKn3A3+uX7tYjz0jGhylaQPPaDd7cGUZdTXcQy1NsAIulMEbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171421; c=relaxed/simple;
	bh=XPNmo/FlP/BRMBwZNSeXSnV0XlcjcPy5hRJg1uWWx+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dIj7NlIn9DZ7cUD2bW81cSzlRmsB71RUeeMni7myHdWGFW/dsxqLj1ULgEq6Dh4WJ6EJ1zsmMWRhJzXEIl8PCmtCGhENdhM9qid2qQXSG/Kye+hvSLIqEnOUExIqRKBbn3H58OnvIx2h9z4v0AJ5Of1IO/FT9lTGSkP5JH+j+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KoUpu0+s; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43624b08181so5264615e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171417; x=1738776217; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=clAA2pQ0aAsHHtJcPdsprveMf7sd3Qr2fHuajtMaEDo=;
        b=KoUpu0+sf9hFJLQ13uMhUCaFbqdcu2neAp+TKMYMoUVnRlWRqjKkVatfGPd4xBFxw2
         tHfzYcXaOxFzIyoXxEl2orMbcVwito84uJocaY3rJYpoynA7a9ag9y0sN2lO/QxPV6CA
         rM25GGC5I0csWy5rf+7P3Rm9umXHEGIBtmfZKUlXv7UGGbWBaPKxpUfZNpSP99Gn3qEE
         DVRBfZD86O2Sf1rXRSXeIvlk4Uws5ZSBK/Sr/+XxFnNsSr302npX65a8rCKKwFnO+oYZ
         f7qK0EvN0MvmABMgr1aqGpP8ypcK3bHCD8rl+CtKWY35VSi1+Bc2qRWUif8x6fKw92co
         QUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171417; x=1738776217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clAA2pQ0aAsHHtJcPdsprveMf7sd3Qr2fHuajtMaEDo=;
        b=t2fG4QboR4Y5c90Ggsv/0cXtTk89FmELf4z0E+NQSbF0CosLtYcFW+ri2JZ3XNAmBa
         OhZhLsdNZLeWsciVZAZsZtpsG2wuAR/LAIVUrObTJlv1R/UmU0oNcQ80uW1TSF9GvRXm
         sy70TrsXh9hh6x9hXMGtEoB0SqYKo+d7JV+YQeg+KjhFk5ZArUxWeG6hdMAdZjGmBLFz
         zJfIiM99BYobc8F3DUR0LX8tVgkYY+6LWId22rhrnVNEyZGVUZL0h1UAZ2aWmE3hJ4+g
         WJ0pul2idgIuC1+3NV+nbLk1u2wIgeZnI3fsPV/ndamTLJXLlmO5q1zHQ92ZUf7pqcrN
         6zBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe6zfg+V8ecoh1WhrutVMK/zFc1KnG5YNlaE1N9dIlv8J2qv4QR3owCULkGra/+kVsFs2ez6b3gyqp0zIA@vger.kernel.org
X-Gm-Message-State: AOJu0YwUn0sqrbw4DdgFfjTtG0bRKmVVZmJk1Cyrq0hUb3X3LpvkMYee
	ot8ERvEz0/4CYWJdKwqQN548TPiFnvizv9nkZCceFSmbM3TQS70PKck7L3UPeIWZh3GBDUwYPw=
	=
X-Google-Smtp-Source: AGHT+IH4Z/w8m7ect4Xjx7d6nFW4rotWrjkyMgHYG1tUIFYfo/owBhkDUsni5QfNbmeYmc7O93FGA8qkJQ==
X-Received: from wmd22.prod.google.com ([2002:a05:600c:6056:b0:435:dde5:2c3b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b8d:b0:436:1b77:b5aa
 with SMTP id 5b1f17b1804b1-438e15e8307mr1177165e9.8.1738171417631; Wed, 29
 Jan 2025 09:23:37 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:16 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-8-tabba@google.com>
Subject: [RFC PATCH v2 07/11] KVM: arm64: Refactor user_mem_abort()
 calculation of force_pte
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

To simplify the code and to make the assumptions clearer,
refactor user_mem_abort() by immediately setting force_pte to
true if logging_active is true. Also, add a check to ensure that
the assumption that logging_active is guaranteed to never be true
for VM_PFNMAP memslot is true.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..1ec362d0d093 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1436,7 +1436,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool write_fault, writable;
 	bool exec_fault, mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
@@ -1448,6 +1448,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active;
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1493,12 +1494,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active) {
-		force_pte = true;
+	if (WARN_ON_ONCE(logging_active && (vma->vm_flags & VM_PFNMAP)))
+		return -EFAULT;
+
+	if (force_pte)
 		vma_shift = PAGE_SHIFT;
-	} else {
+	else
 		vma_shift = get_vma_page_shift(vma, hva);
-	}
 
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
-- 
2.48.1.262.g85cc9f2d1e-goog


