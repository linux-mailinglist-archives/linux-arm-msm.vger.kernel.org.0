Return-Path: <linux-arm-msm+bounces-33822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C95CD998169
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F7DB1F21663
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3B01C7B65;
	Thu, 10 Oct 2024 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rOuGu7CT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC841BCA04
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550798; cv=none; b=O1gmftMzIX1Mi5UpQ8n6vcT+T/CgaP6E0HRgM0w+MnIPBS4oM1tpgAVq6gzd/vR+6+/nB2e44UtyZ2eIhR/M5PnJjyBHfmjA8DYRIAzIH99tmAiuTslseCrmddG4Tlkw3O/ekR0csV+Q6J00BXhWv1Z4Sj/ODLJ0xmNjS6oZzDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550798; c=relaxed/simple;
	bh=7trnHcmDY5Yiyh+CNqA5Y+5bFBagOFIEqKUoC7XfWpA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LJnSCkIPuTYgul4UQ2NSY+qtmow6EmDV7Puaw09QiurpfGoPiqKRGPLW9/0QmprQyHvGJb7r7m9uQ7kb6ozxb+h3J8y0iy42hTj3cwUxCp4Cx4h9HsnemDzd2xLqKqMjh4hGARtpCeNkSTeJrfjGWcm4BnphohPR3C/tJv1/Bxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rOuGu7CT; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so1060379276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728550796; x=1729155596; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HM7gsmExGCXNNGDXzdybypu9GrQXN1fbuf2tdqrKB/Q=;
        b=rOuGu7CTW1DJDmLKONxps23cthYlXBUiczRgJx0VzM+MlUj26JVk5NO4xnrUWEJydE
         M80g9yeUwFW2bzUkKtIqe0qdWDCWV+jpTYaY1ZtuKhVpZU9Z8cBwCnUlM1Xz+IFNPqRq
         PtRPGg6Y6+d4fQ/w5mEZ2XBngLSNHqo8R0NtzeYrj4quaRowyBJt/l+UTxG6qtE2Lzn6
         20LrsrI9ADLI80h43kAOkMszlbeV2q8ji+E3pP1gMBLM9WUwJq+cdGuZkZ/OJfa0sogr
         jwQsKVavRWM3uxxp/0PbtnV5XXelZnD8OUulApUHApo4k0u6oca2uINwiUj92Zm3Cafo
         QUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550796; x=1729155596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM7gsmExGCXNNGDXzdybypu9GrQXN1fbuf2tdqrKB/Q=;
        b=aR4AuAuNUlrFmCYFaCjFWlL8Vg+OeHcfyaDcYqc0h4Q1puemPJyay48FKoD3XwkrUg
         JQVMfuTILUqb2kK4v0RIKiHpgoC+2Bl4wE83WVUyIYuwVjBLe5IwvAyYGzo3C3DAcjTH
         o2MFIA9ihRgCSobknjPCOCaQcP/++wO9y1/d29PHOa5t8xSxR59iWxdUf68hW8300ovV
         dPy/I7Y08OCim80gXVDLCoHxjCzAHsHjIQk6l7mvpYVi618Y9jeVT3z5hxruiOHUsNI+
         znm/B2G04HLphxP8YNLaUtMSz0fPiV2BxlONJw91dRKGjrWBbeBV5ZoALD6RsION23TK
         y5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW2vA+YSUy9DQfAxF1KTzM35TU/yBA2qgi8WrClRWF/GVDiU8Q1hWmxOaXVK7vLsOmye4EcAHUmtXiW9z0X@vger.kernel.org
X-Gm-Message-State: AOJu0YxLOtBMKGI+H2GwIkVCEzPoYaCOoy7xZUEiRJkUEogoJvxBSFtf
	BdPqGEuoePizSTTTI5h+9olCmABClgWYlsDoGMNWo9G5AUlHVY7wOncdDQ9jiCSgNc82tWxhWA=
	=
X-Google-Smtp-Source: AGHT+IGFCUFcocuEb3ihc+miy+ZJ2j+wkfEPTs51cWpXQxawruWfXPnQR4cYRFEkkX27O5wF5IDqGcOMOg==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:b205:0:b0:e27:3e6a:345 with SMTP id
 3f1490d57ef6-e28fe6935c6mr3791276.10.1728550795821; Thu, 10 Oct 2024 01:59:55
 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:59:28 +0100
In-Reply-To: <20241010085930.1546800-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010085930.1546800-10-tabba@google.com>
Subject: [PATCH v3 09/11] KVM: arm64: Skip VMA checks for slots without
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
	jthoughton@google.com, tabba@google.com
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
index a509b63bd4dd..71ceea661701 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -987,6 +987,10 @@ static void stage2_unmap_memslot(struct kvm *kvm,
 	phys_addr_t size = PAGE_SIZE * memslot->npages;
 	hva_t reg_end = hva + size;
 
+	/* Host will not map this private memory without a userspace address. */
+	if (kvm_slot_can_be_private(memslot) && !hva)
+		return;
+
 	/*
 	 * A memory region could potentially cover multiple VMAs, and any holes
 	 * between them, so iterate over all of them to find out if we should
@@ -2126,6 +2130,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
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
2.47.0.rc0.187.ge670bccf7e-goog


