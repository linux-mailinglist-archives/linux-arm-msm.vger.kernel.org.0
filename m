Return-Path: <linux-arm-msm+bounces-51179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D16A5E33F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE35B1895401
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1365725744E;
	Wed, 12 Mar 2025 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YVlrTEnv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B72571A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802313; cv=none; b=Ot32qkb4puG2i3A09sCDpJSagBcFjUgA3lNSnSEFw2I4hj0rYbIr+XsFio3ZnSBNRLDe7zpra5hIhtjF77BY15ZJ/5lRfd/VDJ4AbmsD3md1FzqWIWPZvLu7vOpI16mV0rmaeM8nCMuP168PU67FFMdLk1dpPN2fvvrx14/SWdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802313; c=relaxed/simple;
	bh=DE5SQ9QQ7pg1t8bcHulsVBC516s9NBbF9b2TCSRWhrE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jiKezM4xVy83YpGCrnHgZeN1MqLkFTpOkdqi/UK9zSQFn5lOOOiY3EoCCcf5tgn7dXhg+A6R2u6yPNmrLNphdfjUdE8ZpTouRSygjPvVKfVT0z0judpyAD6JBEKtbXQsSs27O8Z7VaCBr8nnSgbHlVqqNvpoqt09CpSZCQEYX+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YVlrTEnv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so431945e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741802309; x=1742407109; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH2ddFSySXL8ljh40ScGRRkvOagkKQt0yLw/o+/C9xs=;
        b=YVlrTEnvS/mArfraNJ6Njg2NDyWAtR1pXL87nKDvWL5UUSPv4V8hU6jHRtF6rUEiWh
         AsHyAOAnPFJugpJdCkf+2xZH5OahStVcM+lEhxOBPvgYZJWXKO4AL8lWs1oBLho5Gm9a
         CCTxSRwlGRIw2lor+5BLy03y3fpmoccu7p5PDG2mYeVS1WFd4LlvshZgHmNwwqqHz2sD
         15GYzNdqY5/HLtGGJhYhKO9VbYu5BVJsjMbX+Fa5okuNIhf60HnMdabF1PoMxvLFAm1q
         d//i4Xun91Hg9ANJXRihMQ/G/oFjExMXzfTKJMLDouPTaDRap+qMCbQ7hG1S9NP9BmYP
         c4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802309; x=1742407109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH2ddFSySXL8ljh40ScGRRkvOagkKQt0yLw/o+/C9xs=;
        b=m5e9FRx+6siqqI7WIbC9qdgnSVLOmPKrsTV9GjNC6g7U4pjEjAFW5ntb+gxXjnoDUq
         o33lIXoYYWNN26u5yu2X3x+t+peIP0WDbL8CMFYZ6Bk2QqYLHW1D9zHnqa9w+/nlqYP1
         cM4zXb0zJAVdrgydp8DPFByVkdzxaHBzgaXoMk2zEidsdDnpAekDENsU0+wgOdyMQ0YD
         OKe2V0eV9pcomyeG68Y6t6GPdc4gDIV0Lb4wQOmvCc7Lc0Fy0ksJ5qiJjJ1oWO4SQ/Uj
         vxhcsKmaBJ0v5R/BB0/0ZhLajJ9Uor70bAc5SETQYL2/pA9ZbfkwbfRe3mDetnzHr0X+
         mMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaqYH96Sg7YA/QXw/aL+cN3kqLdsdu4ltvpqfFLYf4e5Y1eq8/huyT4hmsbBjM6xoO9d+6ZOXDHw4ONq+c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2joE8wXuM867hKUP32JSLB01A0hMagU+W7biAtvLPBIvNlg0
	6ERA0va+jUMOOAPD36ZOlrwB3NGNoKLFLL9enki7gs4n5gqh7toZEQxeNpAvn3gQvSfBWHSkTA=
	=
X-Google-Smtp-Source: AGHT+IG3QL0FD0w8QJ+6eYUXr0ym7H16e0KnHlntRiSz0AzMSuHdXLBjD/jyLDhLgORTX5AXNY0xHban7Q==
X-Received: from wmbgz9-n2.prod.google.com ([2002:a05:600c:8889:20b0:43c:fcbd:f2eb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f90:b0:43d:fa:1f9a
 with SMTP id 5b1f17b1804b1-43d01c22acfmr99270665e9.30.1741802309618; Wed, 12
 Mar 2025 10:58:29 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:58:15 +0000
In-Reply-To: <20250312175824.1809636-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250312175824.1809636-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312175824.1809636-3-tabba@google.com>
Subject: [PATCH v6 02/10] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
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
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Before transitioning a guest_memfd folio to unshared, thereby
disallowing access by the host and allowing the hypervisor to
transition its view of the guest page as private, we need to be
sure that the host doesn't have any references to the folio.

This patch introduces a new type for guest_memfd folios, which
isn't activated in this series but is here as a placeholder and
to facilitate the code in the subsequent patch series. This will
be used in the future to register a callback that informs the
guest_memfd subsystem when the last reference is dropped,
therefore knowing that the host doesn't have any remaining
references.

This patch also introduces the configuration option,
KVM_GMEM_SHARED_MEM, which toggles support for mapping
guest_memfd shared memory at the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/kvm_host.h   |  7 +++++++
 include/linux/page-flags.h | 16 ++++++++++++++++
 mm/debug.c                 |  1 +
 mm/swap.c                  |  9 +++++++++
 virt/kvm/Kconfig           |  4 ++++
 5 files changed, 37 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f34f4cfaa513..7788e3625f6d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2571,4 +2571,11 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range);
 #endif
 
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+static inline void kvm_gmem_handle_folio_put(struct folio *folio)
+{
+	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
+}
+#endif
+
 #endif
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 6dc2494bd002..daeee9a38e4c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -933,6 +933,7 @@ enum pagetype {
 	PGTY_slab	= 0xf5,
 	PGTY_zsmalloc	= 0xf6,
 	PGTY_unaccepted	= 0xf7,
+	PGTY_guestmem	= 0xf8,
 
 	PGTY_mapcount_underflow = 0xff
 };
@@ -1082,6 +1083,21 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
 FOLIO_TEST_FLAG_FALSE(hugetlb)
 #endif
 
+/*
+ * guestmem folios are used to back VM memory as managed by guest_memfd. Once
+ * the last reference is put, instead of freeing these folios back to the page
+ * allocator, they are returned to guest_memfd.
+ *
+ * For now, guestmem will only be set on these folios as long as they  cannot be
+ * mapped to user space ("private state"), with the plan of always setting that
+ * type once typed folios can be mapped to user space cleanly.
+ */
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
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..4e759e8020c5 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -124,3 +124,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config KVM_GMEM_SHARED_MEM
+       select KVM_PRIVATE_MEM
+       bool
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


