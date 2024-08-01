Return-Path: <linux-arm-msm+bounces-27696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E935C944755
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E34F1C2436D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DB461FEB;
	Thu,  1 Aug 2024 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2qvuNJkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9D16F8F3
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502897; cv=none; b=PHJFsCVMRy48mx4R4Yr0U1Vf1WusFSwvklgU1c5xECqBMwLDbfeIqMOvZAF8jd3wjpfdXXvcWgOpS5QsWPxT8DoKQGTO9dBWVOi/MqXzN8rBMO/0goPwm9/Q+Ln7g+NWQquZVWKrtOy+no5FPYqpKZRqH2ExXI+ykz2yyMMY1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502897; c=relaxed/simple;
	bh=gVbQE1gLeXsrOsdMOUmedL1iM5Ce5pM5lcUiFJNejpw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R0E1Rw8P9lgTdH+axkTgY5nTtSFb7LDnFL1Uqbd8lcccCvHUIvry2FgEv4qSbIinNgfnlrKM6YxazvyitUqIVdeNr0sOesvrMUvjtyNGhqQF7ZZ8frZhaeysb78lbIJckmcX9FSQ51rTIJXeMM1Mcu9DHPjtrog31etSWoZzcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2qvuNJkt; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-66b3b4415c7so142481347b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502895; x=1723107695; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eynVCV8vS5USu2ZyXSA4dI0KQ06/f9GaXl4H1mlHW7I=;
        b=2qvuNJktDAusy2AW/M/a8t4wUlXcnQCAZlWnMPRfa9sY135CKsXd3Lk1StNlGe741L
         cT0Vs7FEPeWU9bUdHzRAVM3c9xHJjXl66Q0oIp4ufAXZjQ0BQAFU0HAACxoJkYgsQZva
         PBeHBpNBCrg+QFOsuRcSj50cJuXRm9ApgkdOESsuuz2gdw0j6SGd4n/vqpj2aKXqpFSY
         NiP28Y+PBjqu89NFsmrNDMnOwwSaG2nzDqdgl4MuqFDSD+FWG2blJ1kj4uXR78jx9LS1
         d4JJubnqoAr7maeUY37p4YMdXoqNRoGLbueeK4KLzHuK0vHtSEXktj64tRg4HDEKUU8R
         IvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502895; x=1723107695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eynVCV8vS5USu2ZyXSA4dI0KQ06/f9GaXl4H1mlHW7I=;
        b=e3st5uOC0aFqA7d0L939KKQfiQJFuPt5FpDHrFr66pZtMj24A7SU4PYXkpozgANLV6
         DVxEdYQO68QcVui44ZRfvct5nV5GEA1+qPGSDP1avqYFzBM7uHQBzOCYOJ8wBrTaP6h0
         RbX12igrkiLVXjT9mabN9TTxcMkel1JgJgNmTiwQ8SQZJ08QfQm5ql+9asOgl0LGYsmy
         7m98JKBdSpx5BPxxtVcMq8DxjFIS5FnlOwDHXlGu8x/TxNMjUAnoGJcscSi4qZyZGg0p
         v8ESwBYRjXHST3Lgc8K8ypXdaK99az0cATFcIa8rVf3cqOS6fYsBzfYRR3gtn6xssTwA
         NlAg==
X-Forwarded-Encrypted: i=1; AJvYcCWjv0y4t6lbc//luua9D685WsJ1htW6juTOdnGlWZjrRXpODXcbCqap7ZUAvIUxi+5KrCmsG6OsZkPHiptjWkye3W0CC0A7Aev9SDMoVQ==
X-Gm-Message-State: AOJu0Yyj4T/lab/JseizWWCRL373q/ahwISVzIoCVKMWAqR/RlYAA2wq
	ZtXV3kNvJgd6gfG6RFkHhl2fyGnA5hU5UnS3G7HKAnizR6h4Z8O4TeYms8r6G/7l/kbBW9xeOw=
	=
X-Google-Smtp-Source: AGHT+IGMIr1XUVhclOFb55aW6DOFYObKwVO0wQH5tDUYBTBbgfFm+mNN9/WDhRbYaQh1Bw5e40TmTstGTw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:6902:2190:b0:e0b:bafe:a7ff with SMTP id
 3f1490d57ef6-e0bcd21d5e4mr2642276.6.1722502895329; Thu, 01 Aug 2024 02:01:35
 -0700 (PDT)
Date: Thu,  1 Aug 2024 10:01:13 +0100
In-Reply-To: <20240801090117.3841080-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801090117.3841080-1-tabba@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240801090117.3841080-7-tabba@google.com>
Subject: [RFC PATCH v2 06/10] KVM: arm64: Skip VMA checks for slots without
 userspace address
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
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Memory slots backed by guest memory might be created with no
intention of being mapped by the host. These are recognized by
not having a userspace address in the memory slot.

VMA checks are neither possible nor necessary for this kind of
slot, so skip them.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8bcab0cc3fe9..e632e10ea395 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -948,6 +948,10 @@ static void stage2_unmap_memslot(struct kvm *kvm,
 	phys_addr_t size = PAGE_SIZE * memslot->npages;
 	hva_t reg_end = hva + size;
 
+	/* Host will not map this private memory without a userspace address. */
+	if (kvm_slot_can_be_private(memslot) && !hva)
+		return;
+
 	/*
 	 * A memory region could potentially cover multiple VMAs, and any holes
 	 * between them, so iterate over all of them to find out if we should
@@ -1976,6 +1980,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	hva = new->userspace_addr;
 	reg_end = hva + (new->npages << PAGE_SHIFT);
 
+	/* Host will not map this private memory without a userspace address. */
+	if ((kvm_slot_can_be_private(new)) && !hva)
+		return 0;
+
 	mmap_read_lock(current->mm);
 	/*
 	 * A memory region could potentially cover multiple VMAs, and any holes
-- 
2.46.0.rc1.232.g9752f9e123-goog


