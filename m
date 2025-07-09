Return-Path: <linux-arm-msm+bounces-64203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE7AFE6D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356E94E26EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7E028DF4B;
	Wed,  9 Jul 2025 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jN3d8psQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165B293C57
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058830; cv=none; b=hs8CyImVjU4t8+ZKvugPqMJ6usbB3F4pnHq7stBpWhHcRluRdWbxsqgPMpAHQW+UMl1cRQesQuEEdRqGKAsUnzuPgZY8sV9ij29h7czkJDPhc5nMEYia5UhhD8Gq+66leWcAIq1TeC8WMsL+nE5shAQykLFMU1JIU7Ifek8rbTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058830; c=relaxed/simple;
	bh=m/nmoXWVPgCKDwXnifRxHNN6Py4H7d6jjERskE5ddl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cir9l/8qFmQ3QhTCrVZ2D26NnCBHKEAF4sC85IwXzatMhdWUetmQoVF9scjrCNx1Ljbp1m8gB8ulRv6dg3rir4BI4+p+TpLyWNhecNnG7woAPCRK3hayEUvQRWCrKorVnG2Fv7ygKQ7tOmUQyBdNjO1x+th1vw8fmLluMrGi7VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jN3d8psQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so34425445e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058827; x=1752663627; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EN0gEy7fU6jw5R0YczNv78dam7g/lGJpUBf0uEoq9Mk=;
        b=jN3d8psQtnfEl0xCOP1VZuJ6FOD+exKTgJOmCaEz5ahOFYk3keBQyIFpSLuD4fACTO
         XdBu2iJK8A6yDGHE00IY8VQlwgrQcJHbjsVNOFLKcNW6fFeyqX346uWV92jQvZZNGgXH
         7EaqthfyWVFeJY+GfV3nLLYl/kxxQDHNXG2pnqmE9FKdn5j57WfkYJSPKsa9uxRV5SPl
         OpgouGRPlot2WAslCTXnsNMrutdGqNNaMmMKFBqeadm20K4v2KvYpyNZ+nyuTqausBv9
         amX9EEhGawaeDCNRPKUWJ7RJmH2nVjLRmbgBUCThfU+8eED7JL9iPOYKuBISaeF1F6Eh
         Emcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058827; x=1752663627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EN0gEy7fU6jw5R0YczNv78dam7g/lGJpUBf0uEoq9Mk=;
        b=QwAZeoKMbq0an3aF0HuHlHJys3OwnQWZQwrwRj7ZThcf873J27oExoGCCartwvbEbi
         Z+NmHItD1roHMfzakjy3VoCzuZ0Rjt2BHZN3GdC7BnRpcN00G+Qos/hkq+idK/oVbj8Q
         iCg7/RhbCXshJ9Rp1RU8YUKmRm/y612BwnvnE6dT4hVxaEVNtRIwrA1/zkSdyhXtd4VD
         RVctcU2SXuXRx3wuyZHweEBFCi7Dnrap+J7wrsAHOmuH4WJri6ZrW6U7Kj5BoQxlw/yo
         bEwrLouBdrtW2jBjmH3yUnIbCJU8WTmCARxJsyl0ktqQtDF0v+ZA9nTi7/Kgwf9DDX0f
         0wqg==
X-Forwarded-Encrypted: i=1; AJvYcCWUQMrsUr/4u29KxLg+Ln5remMaoEvtuqSXXHm4nKtdkQ6bCpEn3HuFVyBNvmpkVfg6E3ye+PEkPUrsItD0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm4SmLHvpE+aUF13ZYh4t6GpVbBwWhvxdq7vuHjItqdOK+kSmG
	4DPq+4Cr1/QODOAPRKkxWOCp7WH3bXRecKnbsRZGim/E8+QDvuf5BLMFRG5fxGoe5UkXf8YTALC
	F+A==
X-Google-Smtp-Source: AGHT+IHX8EI5JXc2m1Ub6jRFvHKhxx/iMkDQpy+4Lc0WVLTknDLg7nWPPGgOQGFU7U2VLXzeD+QYo91L5w==
X-Received: from wmth13.prod.google.com ([2002:a05:600c:8b6d:b0:450:dc81:eec9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2006:b0:3b4:990b:9ee7
 with SMTP id ffacd0b85a97d-3b5e453117emr1323755f8f.22.1752058826920; Wed, 09
 Jul 2025 04:00:26 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:44 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-19-tabba@google.com>
Subject: [PATCH v13 18/20] KVM: Introduce the KVM capability KVM_CAP_GMEM_MMAP
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

Introduce the new KVM capability KVM_CAP_GMEM_MMAP. This capability
signals to userspace that a KVM instance supports host userspace mapping
of guest_memfd-backed memory.

The availability of this capability is determined per architecture, and
its enablement for a specific guest_memfd instance is controlled by the
GUEST_MEMFD_FLAG_MMAP flag at creation time.

Update the KVM API documentation to detail the KVM_CAP_GMEM_MMAP
capability, the associated GUEST_MEMFD_FLAG_MMAP, and provide essential
information regarding support for mmap in guest_memfd.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 Documentation/virt/kvm/api.rst | 9 +++++++++
 include/uapi/linux/kvm.h       | 1 +
 virt/kvm/kvm_main.c            | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 9abf93ee5f65..70261e189162 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6407,6 +6407,15 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+When the capability KVM_CAP_GMEM_MMAP is supported, the 'flags' field supports
+GUEST_MEMFD_FLAG_MMAP.  Setting this flag on guest_memfd creation enables mmap()
+and faulting of guest_memfd memory to host userspace.
+
+When the KVM MMU performs a PFN lookup to service a guest fault and the backing
+guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
+consumed from guest_memfd, regardless of whether it is a shared or a private
+fault.
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c71348db818f..cbf28237af79 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -956,6 +956,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_GMEM_MMAP 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 81bb18fa8655..5463e81b08b9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4913,6 +4913,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_GMEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_supports_gmem(kvm);
+#endif
+#ifdef CONFIG_KVM_GMEM_SUPPORTS_MMAP
+	case KVM_CAP_GMEM_MMAP:
+		return !kvm || kvm_arch_supports_gmem_mmap(kvm);
 #endif
 	default:
 		break;
-- 
2.50.0.727.gbf7dc18ff4-goog


