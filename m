Return-Path: <linux-arm-msm+bounces-47559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4252FA30B6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84A53AB847
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA03D1FCFE3;
	Tue, 11 Feb 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3QDRiSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A321E08B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275897; cv=none; b=cQ3uEn48MPgiyMdWAXVDuaifdQYaNBPvWV9rLG6BU5Zy5qaiQ9JSXMrcWx+JQHa9z0yHiS+4Zr9vn67vUOPeyx9eHIEn9uXy/Yd1XLicq9/RrOK199lT6nub6PfJ96ly71ZegSfPcJh17imjLgVhEBKZy/uGGvUS4rYq2CToCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275897; c=relaxed/simple;
	bh=DjLAQsoXdnPl6GrE+/GdZCahvPNjPTRXwCDe2y5OqLM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=igj7z75yxDyB0xemNJgrIk3YTQvH103wrNdM4K9wmy6Kwv1VggiAEnWXLIrgGp8rj3lx7T+J6IB/9tQOLbfLi8WAE00amhsooUE5YVOJhAVyDS5oIZ2pVIEL59q5SP+dccc4udT20C6h9ethDsFMBJP07+9sFh9VaGggB3gMUO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3QDRiSI; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4394c489babso6415105e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 04:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275894; x=1739880694; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWMrByBHh6bCcS+Ah6m7GoQirIP0Jem/nT3gsSQXFpI=;
        b=R3QDRiSIQRlhy2Tp9S0t4jmSLmVCcEXaTaeYftpPN5PFtcpuFrDn1TljeqpZWchmba
         kln1J+33DsBKa+guDyAuOUdU5LQSyQV6HfWQNgbtPO/VQHDMCaOWKUUl2CViBZwA21Q8
         cCmaOGjuAWl/ctV7iIGXhGVzEGtWV0eShd1YIvZjIIi0oBajOw48Iu3hkkgpva4JmCWt
         HVMRm4k+AdAyyPtH3Hm4YMDmn2U7hreDrTZMWRR2rM4py2pxlo4IydmzW3ovv5NvE2Fa
         NU8dxe9Ud7rGZmvL4nwPZ8PF+eg5GMesNyUgvmLDSAILlQN1qvKShTfTysSaNPv+5ipj
         ngfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275894; x=1739880694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWMrByBHh6bCcS+Ah6m7GoQirIP0Jem/nT3gsSQXFpI=;
        b=vE9o2KDH44yppCYLrWTmWS9BsQpE9OqJSblIdmrqlWfj0UvqaK0Y7InG9CQA2KtDi+
         Ch/UzUmq6+h8g5D+pePJErhG74Mb7p3jw3zjQqaWobNjhw9RYOwtKI+LllN78x4n9TaC
         MVTGWUtUcpi8NIteZ3v5qjO1WY9Cna5ty7EjR+xV7XwVrxS7AW+xQR/oHy9sfxq4CTpN
         21koitf1bEeg4LJCyeGKkSY2MkNh4Kcv9O37i9Q/ThJKdwyCy8oXLHFlxJ9gbgz955DE
         zQbc3EzFFBPlMRwpkLTfyl82bF87qV9hBgQmgi0bvHsuFzvRC2gzq7obNDrRMDO1qip4
         mXsA==
X-Forwarded-Encrypted: i=1; AJvYcCUiLlcSPERojY6pFKaDt/7w3ySKK0TBHVO3F+2uvlNPt1jBhsnHH3aELX5YDOkw0AqpB4YOGcKj0Z8RR67C@vger.kernel.org
X-Gm-Message-State: AOJu0YzLk3EgtiZbDAjw/2Dfi9g/dCtskHM2+B4GN/coDmGwE0K/6aQ7
	GsNxhSXrQTL2wYOt6yM+79iu/Ue+hX00eQMSFSDSGuAGQfuJZN7YHC/GzQxW2bUWa3BBe56y5g=
	=
X-Google-Smtp-Source: AGHT+IE8Ghyq44OOrdMI7rTy32U9k2qC1vm1QBwY+iABDYDzlSXr3Wt1H56p+D7BVdWhTRPrbKtMom5fBA==
X-Received: from wmgg10.prod.google.com ([2002:a05:600d:a:b0:439:432f:cc11])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:ccf:b0:439:56f3:d40f
 with SMTP id 5b1f17b1804b1-43956f3d5c3mr1028375e9.21.1739275894075; Tue, 11
 Feb 2025 04:11:34 -0800 (PST)
Date: Tue, 11 Feb 2025 12:11:18 +0000
In-Reply-To: <20250211121128.703390-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250211121128.703390-3-tabba@google.com>
Subject: [PATCH v3 02/11] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
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

Before transitioning a guest_memfd folio to unshared, thereby
disallowing access by the host and allowing the hypervisor to
transition its view of the guest page as private, we need to be
sure that the host doesn't have any references to the folio.

This patch introduces a new type for guest_memfd folios, which
isn't activated in this series but is here as a placeholder and
to facilitate the code in the next patch. This will be used in
the future to register a callback that informs the guest_memfd
subsystem when the last reference is dropped, therefore knowing
that the host doesn't have any remaining references.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h   |  9 +++++++++
 include/linux/page-flags.h | 17 +++++++++++++++++
 mm/debug.c                 |  1 +
 mm/swap.c                  |  9 +++++++++
 virt/kvm/guest_memfd.c     |  7 +++++++
 5 files changed, 43 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f34f4cfaa513..8b5f28f6efff 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2571,4 +2571,13 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range);
 #endif
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+void kvm_gmem_handle_folio_put(struct folio *folio);
+#else
+static inline void kvm_gmem_handle_folio_put(struct folio *folio)
+{
+	WARN_ON_ONCE(1);
+}
+#endif
+
 #endif
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 6dc2494bd002..734afda268ab 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -933,6 +933,17 @@ enum pagetype {
 	PGTY_slab	= 0xf5,
 	PGTY_zsmalloc	= 0xf6,
 	PGTY_unaccepted	= 0xf7,
+	/*
+	 * guestmem folios are used to back VM memory as managed by guest_memfd.
+	 * Once the last reference is put, instead of freeing these folios back
+	 * to the page allocator, they are returned to guest_memfd.
+	 *
+	 * For now, guestmem will only be set on these folios as long as they
+	 * cannot be mapped to user space ("private state"), with the plan of
+	 * always setting that type once typed folios can be mapped to user
+	 * space cleanly.
+	 */
+	PGTY_guestmem	= 0xf8,
 
 	PGTY_mapcount_underflow = 0xff
 };
@@ -1082,6 +1093,12 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
 FOLIO_TEST_FLAG_FALSE(hugetlb)
 #endif
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+FOLIO_TYPE_OPS(guestmem, guestmem)
+#else
+FOLIO_TEST_FLAG_FALSE(guestmem)
+#endif
+
 PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
 
 /*
diff --git a/mm/debug.c b/mm/debug.c
index 8d2acf432385..08bc42c6cba8 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -56,6 +56,7 @@ static const char *page_type_names[] = {
 	DEF_PAGETYPE_NAME(table),
 	DEF_PAGETYPE_NAME(buddy),
 	DEF_PAGETYPE_NAME(unaccepted),
+	DEF_PAGETYPE_NAME(guestmem),
 };
 
 static const char *page_type_name(unsigned int page_type)
diff --git a/mm/swap.c b/mm/swap.c
index 47bc1bb919cc..241880a46358 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -38,6 +38,10 @@
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+#include <linux/kvm_host.h>
+#endif
+
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
@@ -101,6 +105,11 @@ static void free_typed_folio(struct folio *folio)
 	case PGTY_hugetlb:
 		free_huge_folio(folio);
 		return;
+#endif
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	case PGTY_guestmem:
+		kvm_gmem_handle_folio_put(folio);
+		return;
 #endif
 	default:
 		WARN_ON_ONCE(1);
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2aa6bf24d3a..c6f6792bec2a 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -312,6 +312,13 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+void kvm_gmem_handle_folio_put(struct folio *folio)
+{
+	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
+}
+#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
+
 static struct file_operations kvm_gmem_fops = {
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
-- 
2.48.1.502.g6dc24dfdaf-goog


