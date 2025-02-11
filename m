Return-Path: <linux-arm-msm+bounces-47564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E6A30B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23AC7160EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4E1220685;
	Tue, 11 Feb 2025 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hNPIHM5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AED7244E96
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275907; cv=none; b=TcozIOgDYEiKWVbMg0mQIMoQHHP49Y6tJ60lXnPGgX7yXz3jvx2jcs4wiGg45L1BlfeDAYmf2+YBTwThRkKDDeRDLuLYnxwjMRGFSYfE0U1AbOysYgn9nOBTwXUVR6ICxOHq/Sx2q1AatBMiKvF8vnj/3rJINGiUORr/r9BOMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275907; c=relaxed/simple;
	bh=ED7U0BdTR5CtvG0NjK1D1AJXYzcMplXlqTJIxPfY44c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VNFEtOg/WwFwqic1F6F8lYqrtG+uNI24aWvDwjnEF4YWCtQPa9QU0bnYnC4FYFMAg3wssh4D0IlPDse0nOqjdQKCnswitc9oFC6x9apEYjpGa2JxLPlRRxAXb0b9ZHdj/FisTlxkJk3dAcFWtQNlyQilw0oz+RUAPD8jicVj+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hNPIHM5x; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4395586f952so1990645e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 04:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275904; x=1739880704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGlWsAVkyKnhySbr83igZIXZOroWdqgSNXlU94DUNkk=;
        b=hNPIHM5xxYo829sOJVmbLjNol54hlJEo25mpmBJI4SVIH+jMOZk2eliTR3XBGrUvfv
         jKyOxqSnqFHyi1V98A0f8ZDASU6Lsv/Nj3QTLwpJp97dq1sb3ev4K/IFBiIXI9TVyHPz
         bW6/HbyESVFhhTZJdsNxjYlRCTzLBJOmbzWNfxx6bt3gmjbzlF/IV13bHEFGPk+IgUML
         CJcgK9ub4gUqeFkFnwA8b0L+Y7Z02sAMu70ViWzDQHasPbubPJsPMxbFn2n9YfFS5RwT
         WEvMZ85wgsQS8YZOsEkVofMuXoWRFdaIwGMU+UEWEx7QgQTTM3HgJUDIcx4Ge4DW89fM
         zaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275904; x=1739880704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGlWsAVkyKnhySbr83igZIXZOroWdqgSNXlU94DUNkk=;
        b=VjLp8d2JIZb3dgNyTY81fFPZGGSUkNAX/Y9Yy7Pkoj9+tyLQkLPRBQnfVe1Ymq5FY0
         noOYqQ5MvjuSE5RbtLQRLIVcUY2GrUNi00SWEc/MqLpuXWqxhL5V/r+Glp13OMXBQcp1
         7SFMenym85j62y55OdsTNwXH9q9Q2IuSFyAb6Ak16Na5ijQgo5sf0gAcg07DCHNcn2vg
         v6E1/KDMCvc2eG0SK1SOGX4fhCCchxYS//QUq+1dLmCS11FI2m92H5GksXPkU/+QR3il
         NMmqc4To1f8PPLgEch8CLVvTo/TvoHp2y8K2GBrORihOXZpGdiOf3L7BWc0OQRvjkZsf
         JOhA==
X-Forwarded-Encrypted: i=1; AJvYcCV3YGCihQjBWmWU8AsBzfe6nKwBCs6hDWSBQjXd9ttqZx7a5rihGdl53eQUgwt2+z2k2AW9Sjx4xQxx0G1I@vger.kernel.org
X-Gm-Message-State: AOJu0YyEf2m9W6wmdqjr4U2+A/QqE5EtW1NvGLrAC+JiKtDJJc1g/k/4
	hFLyLF6+I5DBOXylNloAWuerFyxkeKopbZF4qbP89OCMm70Ourwhnl8U3+dEVmcDuJe93n0M0w=
	=
X-Google-Smtp-Source: AGHT+IECBWxW5BmjsYJdVFsglQzvNG0pX6h42Ln2RnS0ynPClK45T5nCrnmXnpL5zjCvLKTXEj1dNopf1g==
X-Received: from wmqd4.prod.google.com ([2002:a05:600c:34c4:b0:439:4c13:57e5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:354c:b0:439:4376:cc0
 with SMTP id 5b1f17b1804b1-43943761119mr58255965e9.25.1739275904320; Tue, 11
 Feb 2025 04:11:44 -0800 (PST)
Date: Tue, 11 Feb 2025 12:11:23 +0000
In-Reply-To: <20250211121128.703390-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250211121128.703390-8-tabba@google.com>
Subject: [PATCH v3 07/11] KVM: arm64: Refactor user_mem_abort() calculation of force_pte
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
true if the conditions are met. Also, add a check to ensure that
the assumption that logging_active is guaranteed to never be true
for VM_PFNMAP memslot is true.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..b6c0acb2311c 100644
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
@@ -1525,12 +1526,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
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
2.48.1.502.g6dc24dfdaf-goog


