Return-Path: <linux-arm-msm+bounces-45829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0FA1952F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D3B3ACE79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18282144CD;
	Wed, 22 Jan 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1IjkoAP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7DB214A71
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559674; cv=none; b=f4Nhqlx+weBTfpvJZytkXupd4RsLNeTrdTReSI+Jq14eB8Iya/HdRGZFUEhjOPVIj4HiMW4ETAnUf3M1BqA+lVyliOSWDkkwX2JWbN6Kq5xM2CYBCB4XjfnSrxeouWEWSBVu4UU1iuI3TZpPuF24T+lb1+gC9BsAloHNcngM4W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559674; c=relaxed/simple;
	bh=Ob6kypo+rDvvEe1SpVMk9She7l8fCRqMuFfEC3q0tDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f3sVKrIhTOMaEsMop3aul+/qSQEvXY2wzCdJzEPNUpQwYEE6ST/e7jH8jKAmpsHU+nJoPCS9fLDtdLuVqEyqxyu5MQe3Ee5tzt+7U2Njt0NUAVZwCQO9Aye2KZpNjux21ZS2xWpwfEvfw5infGWZxpaDRX2MeFk1PP+itmDRFOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1IjkoAP2; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362f893bfaso38287615e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737559671; x=1738164471; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HB24ys9olZtoFbzLvLFGPKqOLdaE1YgibZ0bUHAkc0=;
        b=1IjkoAP24puaPpwiSGRHgpwZCnfQofIhC4NEu/3Fdv1v6hHs9Qc0VTDyn5RvA2Uvef
         0JivjRBZGJ/akd3w7xfAP01IGdoBoV3A50Rsc64LS1HVHGAyfn+QczyzGJhooG0YQBZM
         dzpfD8wnGHTGI7TYp8/MRl7ZuNQhvsVd4qjiTOJHWxkoKERHwIfb5bNE+WyURYiC17pP
         kZMzkCT3Q+tQIQ1U8k262U6eT/F81WZqhZWBMutgV1OW/q1fyGMoqxIUhJzU3WqRnnuk
         4+rlwOvIpHGk/h/sYQNT7uWlFqYv7mNWt34hvQZTro/0DCYIVz16r9380t+Y1imZbaQ2
         /L/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737559671; x=1738164471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HB24ys9olZtoFbzLvLFGPKqOLdaE1YgibZ0bUHAkc0=;
        b=QQEvIwv+/xdT3tacjZ2C3izQi+WDEgXry1xtUzTdiaVmPi1lWEJdcc4qDE4LnA4kyc
         zRHNYf5G48KpkICY3M+kgjOAefTIxxZ/K3cDhVn1EcltPTAAJJCbJWM4SucQ0BurutRD
         p9hDEfjk/QXJgfyZTutFnRTMqRKOwPclfwjW8N6l0VhFbg8RlMkQ/tfv3KFBXnfu+jdD
         XIIS5y42W+HuCYfNeDPasTo8c/nzrhH4BEvrhB54jFUq1ja4j/tZe/XxQ+lM8p2EFWr6
         NUMNaQOl9XcNIiKBcR/lPfbtcrAW6fwvJD3qeep7ow4A6/p3cp/NDpGKc/+Dl3F2FAvq
         1q0w==
X-Forwarded-Encrypted: i=1; AJvYcCVPQfrvJOfRTqdoGjcnmombDRDbSWE4C4NoMt6aGBQr/vCF8paGBk2jGc5Nrgxp6geeyecm+MbsrgMKKRJx@vger.kernel.org
X-Gm-Message-State: AOJu0YzzWi8ynkgST4phb3uarLsBHLBG3NX0Pj9T7oMPPJJMSoQ5o0kx
	kckjD2qmsZLF1CQHYN8n+mMRE15RUzbUxJ3bMQcYYipzTr0pNzE1YL68snh3gAYRpe9KhvDMYA=
	=
X-Google-Smtp-Source: AGHT+IGcoJWLBW4MQy/zV2gFico8bxDEFCQzZhOhvpQ0d8FBU2ybuc79Jv0oLXdNK7/4bqI1+6VtomwTiA==
X-Received: from wmbjv16.prod.google.com ([2002:a05:600c:5710:b0:436:e723:5be6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5112:b0:434:a5bc:70fc
 with SMTP id 5b1f17b1804b1-438913cfa0emr202083105e9.8.1737559671492; Wed, 22
 Jan 2025 07:27:51 -0800 (PST)
Date: Wed, 22 Jan 2025 15:27:34 +0000
In-Reply-To: <20250122152738.1173160-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250122152738.1173160-6-tabba@google.com>
Subject: [RFC PATCH v1 5/9] KVM: arm64: Refactor user_mem_abort() calculation
 of force_pte
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
index 342a9bd3848f..9b1921c1a1a0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1440,7 +1440,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool write_fault, writable;
 	bool exec_fault, mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
@@ -1452,6 +1452,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
+	bool force_pte = logging_active;
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
@@ -1497,12 +1498,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
2.48.0.rc2.279.g1de40edade-goog


