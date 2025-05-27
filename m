Return-Path: <linux-arm-msm+bounces-59584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8FAC59BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C069F8A1DFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CEA26A08C;
	Tue, 27 May 2025 18:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rLCYjBd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222A280304
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368974; cv=none; b=VmpUqCpDqEkciN+bq+uJjauN4iHLw7W5NHnvBcPMb587EwBWiPjK8xI3Gw0OBjEuotnICPYC52sC9gSGJycUokRxqYSe3CBAVgW3QQfPB279lfnyEw0yvZVqnJSU7p0KBWuLNEiRQr92TASg3/1axuL8ln5dd1ENiF17tifhg7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368974; c=relaxed/simple;
	bh=7vSE4b+gpw60VpByePLlVFEBBz8IDDZdt67DV3HEzhU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=scfSAoD5VbgTITru4cd3ylGAAstw6hBvNqCHzNWb3wYMlwC/pjE3L1kc3eiNn1ePsN/WTgrhFhHR+p+0a5tSNGESEgqFd8HrYweRv+B8lgKxLGJhMPXetZbBipbxN4Y96B1PtlQlTChSNWux2aK7xymiUIZhF1uKHs4WrQvTx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rLCYjBd5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso30566165e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748368970; x=1748973770; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5V3B2RYLa1fEECDPnlrHtu9P8hNPSXvchqgDN4GcNys=;
        b=rLCYjBd5GWlhyAjIZbRDxoP1RyI8YxJgSdm+uWhY7z/o5vx4SMRRPyjQPxzwjcdg/j
         x/zmMdCtupFRE6JOMYCjYjvrD3LNng27tuWEFHAqmW41L9xGXlnqH46yJwldM27VYyyR
         Ps+8Q7zUDp1+Ev3LP6PRWB7UlaIcPfh4Gb1sAGtSBjpJms2MpEj+wRmWB8V2zHHHDfFy
         jpRKggqmteO061lQ3tGrm1H6K0coOWyLq5PjzAh7y0hOMwvspw0jpvgMxk06j9xHvVI4
         yxygbmY9yzJLSI1QuuY9K/HOSfNRm5g2UIrcFUUqI0a+NKHowDM1cSJUgGGQAhVakUaj
         pMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368970; x=1748973770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V3B2RYLa1fEECDPnlrHtu9P8hNPSXvchqgDN4GcNys=;
        b=UflB1koLbHI8NvuceqS+kAkk89ICX1lJ455GGltRM58WGeukR/CcmHrkHXcoepwmEs
         3JEcETyMO0IcDkL3GHgBRT+caGPDYuq8f+w1yCCGuP32DsWSMXQUvTuFIDWMNM6WmQti
         mDj3VI6tksPcJ6b46d6n8REoGv256G7wJ4+ER7p1eXwaDf0TSdCVGpTgr+sRxGcQzCo7
         RymGhs3yNQMNLZ2Sq1KSWsk+c72ihiGQOacOEgMWYyh/D4tmYXf6YwTWjQgKy7fHlhmH
         Tcuz9syCubVksbEjGN2G3lpanigUEipfnhW569m0TuewQ2rDkQVY1pXPMeAFruNOlREG
         fA/A==
X-Forwarded-Encrypted: i=1; AJvYcCUFIXRx2iXBldD5JRq1UD6/P4TjoYfBE9l+8EtaY7pLfX+3RgMA0eXVQmAYljjKnbHGdXoHxb+/J2A2CxTL@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8GclumZZaB5l/Hn6CjUcF5tZcrDA7a8y78GUbtPhWMvZo1ZJ
	4b1iYQl4P2sjppA2e5mlJrHB3b1eE/YUuWV/YVsZ47n0TmGaSOWlzab3THku6EVSoRnnao/EEXp
	fsw==
X-Google-Smtp-Source: AGHT+IFdZHX/lQZqCoT+8qts9/5CdbMfeZRpKrH709gkJkldDvm+LOhfmpHq4s3xD2Py1rZ0kVm6aRg0KQ==
X-Received: from wmbem23.prod.google.com ([2002:a05:600c:8217:b0:442:e19a:2ac9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d19:b0:43d:fa59:af98
 with SMTP id 5b1f17b1804b1-44c937d138dmr123262715e9.33.1748368970523; Tue, 27
 May 2025 11:02:50 -0700 (PDT)
Date: Tue, 27 May 2025 19:02:31 +0100
In-Reply-To: <20250527180245.1413463-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250527180245.1413463-3-tabba@google.com>
Subject: [PATCH v10 02/16] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
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

The option KVM_GENERIC_PRIVATE_MEM enables populating a GPA range with
guest data. Rename it to KVM_GENERIC_GMEM_POPULATE to make its purpose
clearer.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/Kconfig     | 4 ++--
 include/linux/kvm_host.h | 2 +-
 virt/kvm/Kconfig         | 2 +-
 virt/kvm/guest_memfd.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index fe8ea8c097de..b37258253543 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -46,7 +46,7 @@ config KVM_X86
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
-	select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
+	select KVM_GENERIC_GMEM_POPULATE if KVM_SW_PROTECTED_VM
 	select KVM_WERROR if WERROR
 
 config KVM
@@ -145,7 +145,7 @@ config KVM_AMD_SEV
 	depends on KVM_AMD && X86_64
 	depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
 	select ARCH_HAS_CC_PLATFORM
-	select KVM_GENERIC_PRIVATE_MEM
+	select KVM_GENERIC_GMEM_POPULATE
 	select HAVE_KVM_ARCH_GMEM_PREPARE
 	select HAVE_KVM_ARCH_GMEM_INVALIDATE
 	help
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d6900995725d..7ca23837fa52 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2533,7 +2533,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_order);
 #endif
 
-#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
+#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
 /**
  * kvm_gmem_populate() - Populate/prepare a GPA range with guest data
  *
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 49df4e32bff7..559c93ad90be 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -116,7 +116,7 @@ config KVM_GMEM
        select XARRAY_MULTI
        bool
 
-config KVM_GENERIC_PRIVATE_MEM
+config KVM_GENERIC_GMEM_POPULATE
        select KVM_GENERIC_MEMORY_ATTRIBUTES
        select KVM_GMEM
        bool
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2aa6bf24d3a..befea51bbc75 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -638,7 +638,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 }
 EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
 
-#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
+#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
 long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long npages,
 		       kvm_gmem_populate_cb post_populate, void *opaque)
 {
-- 
2.49.0.1164.gab81da1b16-goog


