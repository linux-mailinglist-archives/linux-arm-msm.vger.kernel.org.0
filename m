Return-Path: <linux-arm-msm+bounces-42094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF89F12DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69BE188DDAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF311F0E52;
	Fri, 13 Dec 2024 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQCrWHiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95011F12EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108503; cv=none; b=HGFD8MtaKAX/oVEPkx+Q2RVXdeFk5aemvJSR4v3oMGMM7lVilqBSCkNBCipkbzENRULd0fSnvY4cvZEGKpPnnB+InfJxv2VmstgQMKTIhT8c+K8FKrI+cIhjcFXMa0Csy9cz1ddrA1RBYkBYmWQIfu77oyFq1vfg9LJb/GIFX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108503; c=relaxed/simple;
	bh=iCi7APSFa/qYdDys/K0F8mdRcZOCsK0RuWlqnSzupl8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NHCr0FAv/71dXNDlAdS5yVu80DxH6W8+m0NzZJw67s5rOL9hbrKoqtH3HJyiCkhIaicORaXVkc3y/6MVCQxfVb0da4la1xnwmQugMXBHf11CsUiyP3wdcSITcj0bTEv/GFo0nhmFv3A/FLUmrmVccJ3Cc4ZnrdFtjQouS7S9tb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lQCrWHiK; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361ac607b6so16011865e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108500; x=1734713300; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn98e+WujoBnk4EYt4M9w4x2TZk0zk8clmlBtUUAHUE=;
        b=lQCrWHiK5qLMHEIjGmkmS+3Vxk46/P1ZKpKwBM/IAu+JEzrffVWV7sAZwkF7gUTp3S
         nmGO5iMq8EmLg+88632ZN+6hWo1zGwSQUhB+4Qd5lroq6qfZfJpxUIXZl2HAkNN+/Uz+
         QchVY3uiwTSAA5lwKqHr3XJgwfIjm6fT/FAIOOQhca0XvN/jf7cMgZLPgrXbIN+qyVFu
         bcO0+u89sShy4YuM9zEJvpWgVhrY1WLeY4DiGGgdJk9BvxxAvlN1YX2b4xG2PIMc7iPi
         XjX9g7Ndxxw5nF+jJSn5lDDg7t6xwcQlnHpqx6C9u+1FzBFuXPIDCYm0tWBJf8REnb0n
         6tHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108500; x=1734713300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn98e+WujoBnk4EYt4M9w4x2TZk0zk8clmlBtUUAHUE=;
        b=hfbIjFLjwzkmAIbRB0IsZsd/1rBEwvBZcG1q5OoqscQj80IzA99zXEMT0jjaKlBLbM
         AW+S4w/KuzpZ25gf827+475HokXMjpH1/x1dDQCepfTM73fi+qsVoMY24syHWv9n688j
         eysb6N/Aw9m5CYDnvXAnCw89i1YTLnKbF4Q3WUqrxVm6/xJZJZIz0oLQuBJatF0XB/BW
         h+A9+HoaLnP7++9bYKBvfFzNdidWQcO98LnnZCRhFyZ1idfKdPrpdLM1hhYHPnjTRYLw
         LMXa1SPT1ey5Y8puDFl6nL1qYXyk9hYdHuoT/Ja4ZpMNbTNN4M1SUfZgDF4L0KsVoCdE
         +5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdrvdcVHTfa4D/yzxjV2N2Wil0RfdV3qlmit/FtZPxid7sPViHsGEVbn5qdhzns0p+D0GW7O1AH+qjSd2I@vger.kernel.org
X-Gm-Message-State: AOJu0YyXxZjnrF2/1f31AfwbBvb+ShAppHCi8nLCgBCw3Xe5SaFGz/Pr
	C5pXfud7kOgD+24Q0nzutkKeR82K6Gmlo9BjEgCNXKSmibqN/n3hLYOKKC3u0LStOrJQh9piGA=
	=
X-Google-Smtp-Source: AGHT+IGbUUdOrO+LdNxgwAJN5RVrV2s69jyBzXe2ihtQ1qCa2+mzNDnn/emZBrvQ9OXRTxBEpqDlu0D2/g==
X-Received: from wmma26.prod.google.com ([2002:a05:600c:225a:b0:434:f299:5633])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e8a:b0:434:f5d1:f10f
 with SMTP id 5b1f17b1804b1-4362aa52fa7mr31352765e9.17.1734108499591; Fri, 13
 Dec 2024 08:48:19 -0800 (PST)
Date: Fri, 13 Dec 2024 16:47:59 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-4-tabba@google.com>
Subject: [RFC PATCH v4 03/14] KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(),
 which retains the folio lock
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

Create a new variant of kvm_gmem_get_pfn(), which retains the
folio lock if it returns successfully. This is needed in
subsequent patches in order to protect against races when
checking whether a folio can be mapped by the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 11 +++++++++++
 virt/kvm/guest_memfd.c   | 27 ++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..cda3ed4c3c27 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2500,6 +2500,9 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
 		     int *max_order);
+int kvm_gmem_get_pfn_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+			    int *max_order);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
@@ -2509,6 +2512,14 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
 }
+static inline int kvm_gmem_get_pfn_locked(struct kvm *kvm,
+					  struct kvm_memory_slot *slot,
+					  gfn_t gfn, kvm_pfn_t *pfn,
+					  struct page **page, int *max_order)
+{
+	KVM_BUG_ON(1, kvm);
+	return -EIO;
+}
 #endif /* CONFIG_KVM_PRIVATE_MEM */
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 198554b1f0b5..6453658d2650 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -672,9 +672,9 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 	return folio;
 }
 
-int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
-		     int *max_order)
+int kvm_gmem_get_pfn_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+			    int *max_order)
 {
 	pgoff_t index = kvm_gmem_get_index(slot, gfn);
 	struct file *file = kvm_gmem_get_file(slot);
@@ -694,17 +694,30 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!is_prepared)
 		r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
 
-	folio_unlock(folio);
-
-	if (!r)
+	if (!r) {
 		*page = folio_file_page(folio, index);
-	else
+	} else {
+		folio_unlock(folio);
 		folio_put(folio);
+	}
 
 out:
 	fput(file);
 	return r;
 }
+EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn_locked);
+
+int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order)
+{
+	int r = kvm_gmem_get_pfn_locked(kvm, slot, gfn, pfn, page, max_order);
+
+	if (!r)
+		unlock_page(*page);
+
+	return r;
+}
 EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
 
 #ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
-- 
2.47.1.613.gc27f4b7a9f-goog


