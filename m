Return-Path: <linux-arm-msm+bounces-60324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFDCACF32C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68613176430
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7115D1DE4D8;
	Thu,  5 Jun 2025 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nv8j8Sm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEC01E2307
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137890; cv=none; b=qmvhTQs55OKqTKBNTodqrg3SQH2ntKxdtJN5T0XIZWdM2kRb7EO+ukMN+5BEvZod+JSc3Cqkg1KH+hFqRQbt3tf3+RWgSEJcUDPc2Fp2p2tVL3qDzIv2AWzRbtsIQXlkZWzlqCNQxSJFzkngqB8cvd+JI7+iyOB5OhTdZBwZ7yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137890; c=relaxed/simple;
	bh=2VuJxxeEdPk1NuoOUAref3sHBbXvtsLb6Ibpy4iCMvc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bn18GkQ6y66BPHp4+GvN9UInqPQhZEsEN3cxCzwo0JHbjsBHUDYdRSEG8pthJl8uahnBpzO1Cpy10xzhZ2Y7uIx/WNewOaVN/dhkoZp1WX1zfNNEukyC6mIiE/yNzkJDZpnYp3ot6flt6256buhWmK4dFB/KPTP3Irnb3rflTJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nv8j8Sm1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so6480305e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137887; x=1749742687; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhZAQ4aK83zrMF9SKfn+FWhuWPngzvibSn3iVZ1J5Jw=;
        b=nv8j8Sm1O3y65B7G7Vb+fmXflX5/yCye08/x3hCODXyqTXdGOkUF4SvfYB3Ee5/LQx
         fNln2uAV2ueq0evEsKp5xy25hmeZK4OipJGqT9ajqZ+8w+RexutKYkye/GrlwA1vj/Ti
         Jf4YZ9dmqDdEO9+hLkX/JKRqnc5hURaAKjiUIu+cSCC7p+Xa3oM3FysA/64FG+afqeqP
         jJtUm+rLBSNws/nikchCKnnKoT7oaS3qfj23EuPA/H35kf5gMHbgi7MKbwjXcaYzZDZ1
         tUXe8u3nUaKaQvwYkNJklZL7aEtUyFa27Qi5Q5JU+AYHk5v5NWxkMUwUpUaz054FlnWd
         gzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137887; x=1749742687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhZAQ4aK83zrMF9SKfn+FWhuWPngzvibSn3iVZ1J5Jw=;
        b=Icsi8U2ZUz/1Eyjm5LmNpKPhh4w5+M96rBL8BxLpJ6wcZ4Jp+D+cEEF/pZfNgSccv0
         QR0GJxU4MyWLWxXnc1WHfXd/7rnY5whjkPCQVOtHnSYV755tTYwmLZVV16PLfUvsUtfE
         CBx+zOsiNKx9A3XVPvT8g2F0umdKpD1RcOXr/sdx6lmeU7AaKJ+BtFcaFzg37tIvfCHR
         yYe6KIwXUu8C/WQbEDQ30WBqBzbNn3YWsBztFWswgmLjqG2d9HXU6HT9O3gUwu/I99fi
         FgglpJltz4MS86YZJSBnbu3pXau4YCgnWRrm7ALRWUHrHA/d1Mke3ShUNvFIieo3zShS
         MWYw==
X-Forwarded-Encrypted: i=1; AJvYcCWknQjHXgHnm1Yn0JgTY5dFoc+vtr2mZtf0LMRZ6ef2oQt67RTHHADio9XbIIbTxt9H//Is9LAsJyi+soBd@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/yfS19xCYeei6hGHb78KSP6IszrxP2orWgfWo1HWS+G0l8+o
	1dIs32Ayz0D9WuiYSyUaHvNC5DsvFf+FBn4m3POwqJ1NURFrxD9eFrNkRDI4N84nKFOwsnRDYRD
	lzA==
X-Google-Smtp-Source: AGHT+IGVAW8RhzH9WjiYAssyXVbepy4JWLsKd7LxHBjpMmhSdfVYPolb9YZ1XYxvqQQiU+J/OJ/TTBXl0Q==
X-Received: from wmqe10.prod.google.com ([2002:a05:600c:4e4a:b0:43d:abd:278f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a03:b0:441:b3f0:e5f6
 with SMTP id 5b1f17b1804b1-451f0b27a05mr61468365e9.25.1749137886759; Thu, 05
 Jun 2025 08:38:06 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:44 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-3-tabba@google.com>
Subject: [PATCH v11 02/18] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
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

The option KVM_GENERIC_PRIVATE_MEM enables populating a GPA range with
guest data. Rename it to KVM_GENERIC_GMEM_POPULATE to make its purpose
clearer.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
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
2.49.0.1266.g31b7d2e469-goog


