Return-Path: <linux-arm-msm+bounces-59596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11637AC59D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67D101BA8102
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029B8280CD6;
	Tue, 27 May 2025 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nnz8aVQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E048286887
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368998; cv=none; b=GUgSWJpQF8MwEDG4/bNyCz0H8eYhajV5VV8Yb+vIbqRrIJlfBJ9HHgbpJqioCpHg7siWbcD5w4NTvsZ+nvej13vza+P6I+LDF26C+hWc1jFx2AsjBMsV5Q3R444E6LcrCthoy2LnKhEnhNQxy13ij2S7qeM3sE1jN134VJQsXQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368998; c=relaxed/simple;
	bh=rW0X1JnHf+X26Ebk4Nu/kYLwn4mph9GuhOZqGWUX0Jc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cmp80tyjIZkHY5HxrN9VtazSRTqreNHlpCCF1GqG6xjIxdt1K8FrfT/tBEMqeXZd33xirG4k4BgJ/SDH1KlpC5ZrFx44fvR2smiZODHiL7dBqqrNZn345G6mp02rDlzfXpNv01kOA06UTUroJjj6Uj08GsAdKTrzuFqB39HiF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nnz8aVQV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso26968265e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748368996; x=1748973796; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LQzgqD6Xq1P+lRI22kuKcFVz6OwWxfUaW0mwgEOv/M=;
        b=Nnz8aVQVZHSAOXXGt+mdJhzefboGfsCOrM60EmgyL1mxzLwr8umMWYQ3lY02VNVFzJ
         iVRyzcNNd0eNo8O/H5MjbaEw00vdhFEmT9rvPMbhpe+kvM8N3Xo5y1jBPvoeIv7NhCzA
         EU8kHORHMNHMvq+pXWleVWosEbPF6KnQrw5GNJCNDh3vaflLpf7lt/OmrIn/X74c7nWG
         YoJCh5+ybR0mcztj+LnNxaaTysQHcZLktkmqaqR0d7WFZZ4mX+2EU9FKf3HhjSziYffT
         cS0CfiIHzjjjpyC7JHge4ONOWh7V8VDBs7is68wUaza2nKFpPaxfhMz//caUGW29SJY9
         SHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368996; x=1748973796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LQzgqD6Xq1P+lRI22kuKcFVz6OwWxfUaW0mwgEOv/M=;
        b=i5hwpRNLe7daEnxUo2tsSllnnt8l8scHGYs/TIrv/nxRSjaeicgPTbKaK4q4P8DXtm
         P69Pl6p9u1bTG7VAXjC655ZqA1C9gnJfMfW/+y2LrxX1Z6rKWi8wKnBIXgyOE35L4auM
         cGoeLnuw/f9hGhzPo3Fv310lnlKJ2gXqudmIJ+E5X3avE0FKQAe7hsY0Cgi3t8sPmd8e
         oigzAxf19cL5D5LKpYP3H4lOgK0Oi24pDc2SUh4L/YoAQhBTn4CzPyyWchYocZxNp1RQ
         nYCJ61SmQy4+mDvBB/fv0S6ri7UtLRhVHpKFERNlvHdVwpDB+yEidzaknfTTNly1jnF2
         ntfw==
X-Forwarded-Encrypted: i=1; AJvYcCX+FVncEk9QklWYLnbuP4epgA3bQa2ZEb0sFWRGlwXt9NTwYRKxLHwDveZasS0Pnf/ZwdhQmAoS7RFKyYYu@vger.kernel.org
X-Gm-Message-State: AOJu0YytYb3H6Lzxd6aiWjpRON6nx8XpnTpXWKDNcAWqTmXYQTxtjUN4
	9LsVcEhe1yqUPxI6bhOyVZeJFeuVyTNjT5jDW0G5jcFTg2cUsTb/KrYFaHLzlnrXGKTuVDcStKK
	bPA==
X-Google-Smtp-Source: AGHT+IEcdVpCbp8MjJf64q8k5e/VTPJ3pw7BA2+dZtfA0ZF4gfu1Oso/b3kULdysXS+hJCL6sJ2jnEhvsg==
X-Received: from wmrn12.prod.google.com ([2002:a05:600c:500c:b0:441:bc26:4d3f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:820a:b0:43d:762:e0c4
 with SMTP id 5b1f17b1804b1-44c959b79fdmr129129035e9.27.1748368995587; Tue, 27
 May 2025 11:03:15 -0700 (PDT)
Date: Tue, 27 May 2025 19:02:43 +0100
In-Reply-To: <20250527180245.1413463-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250527180245.1413463-15-tabba@google.com>
Subject: [PATCH v10 14/16] KVM: arm64: Enable mapping guest_memfd in arm64
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
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Enable mapping guest_memfd backed memory at the host in arm64. For now,
it applies to all arm64 VM types in arm64 that use guest_memfd. In the
future, new VM types can restrict this via
kvm_arch_gmem_supports_shared_mem().

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 5 +++++
 arch/arm64/kvm/Kconfig            | 1 +
 arch/arm64/kvm/mmu.c              | 7 +++++++
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 08ba91e6fb03..8add94929711 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1593,4 +1593,9 @@ static inline bool kvm_arch_has_irq_bypass(void)
 	return true;
 }
 
+#ifdef CONFIG_KVM_GMEM
+#define kvm_arch_supports_gmem(kvm) true
+#define kvm_arch_supports_gmem_shared_mem(kvm) IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM)
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 096e45acadb2..8c1e1964b46a 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM_SHARED_MEM
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 896c56683d88..03da08390bf0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2264,6 +2264,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
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
2.49.0.1164.gab81da1b16-goog


