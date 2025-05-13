Return-Path: <linux-arm-msm+bounces-57731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C01AB59FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D342C17362F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5207E2BE0E6;
	Tue, 13 May 2025 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rWhGSHXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814AC2BF3D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154089; cv=none; b=Aw3OJ+6RJsZehqTPYeBwDm4ewXKmBaXmY1p7H9rwNYZAAgkYwgwqNLJgrheYf8gM4wZWxwX/UAuN62U4TwY+5uPn57dNJLiKUjEsUxywSij2LLbw0zuqaCXHpeQxLdY+LuauChHppChCT0UkfA2D5xcqpjPTZtFKlKXaMGpUhRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154089; c=relaxed/simple;
	bh=bUDNNNHJW1Nq2iKV/dPi2YnKYzPovvJALR70i2Ogl8I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NA4t6d1KOvOOFdpKI1mfVsFPCo/GEKctwSGnsEkUruZIsFLtGfU+5myG2vUpbzunmwwLr71m0/8jm0tbEpaqqQ3BaKJla892ts7Iwr8Of5QjQkTrNLCrecct/ndLWpYH+C5I7HtDK0VRO4fyb2kETboh9/zGUPcCwLJzSQtnCO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rWhGSHXS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so33309315e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 09:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154085; x=1747758885; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TW58tdeuujPQSfLrI4Dejm7n8vR9oSFyuhN6cUvPKqQ=;
        b=rWhGSHXSf5p/rPJ71yxaLKXAkI9VKdygr5EhM9xgCB9TGQylrJgAnX3sh33sGGquRJ
         T5JwV3bsuyfZDt2oIH6y6PlIMcXa92NI9Hg4ZiSp+PG7RazE7+0jRLJrny9E1096ZNig
         cEm4AOYIdzINCkgZqUieD9SpMjcGzWZO3HJrO/jfsOMAYejY9on7Cj5M3CBLF60m/+N7
         eYbYGuQ1TRc6eJOOBgma01om8IKjzmR50u5goloXozW4sPxkVaG6MOKTzuHQ1DHvdJry
         Eem3cocs6qSH+MnaZ+IQRwrdMS7a/u3dF/19h3nJd4UUiPwpksn1S0HQ4809IGR92XOn
         4mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154085; x=1747758885;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TW58tdeuujPQSfLrI4Dejm7n8vR9oSFyuhN6cUvPKqQ=;
        b=OmtKz4z0W/c1v5qhEXO1Jr1oMNVKFnD08KLNT3ubwG7waTg9T1Z3308tk+IMhfMOnU
         7+zS3yoLOeTbv1zgl5sLF2mufIrvyzAQKXLRmhFVkGMHZllOtrXfaEI6GIN8z+uA5TO6
         1GCYfuLxEfQyLnpsARb89W2hZ9+9Hn+WwAdac1ySa9Lqh3a+MTU2UxjVwx94NN/smPdU
         ub0oqaFz731D4M+hr5PTWX3lJ2xro225G/7e42mbe7cUn0LuMfXs70Py9kQ67YnDSF+0
         VvAw2WbbrSXbtnWWB5zYrztHn9E3z/QloWFFhPWzCTZ84/I6TRa6ReZM7isbLQjV/vHM
         LJew==
X-Forwarded-Encrypted: i=1; AJvYcCUKbXLCeEUKb9aOWEagiE+FWdfQzlXaWccx5Flz3KtEN9Qw97Poo9Ednp9Y8vmq490sDrsFHxY1IzqDkDxl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QZYnsC/PmNmaWLP7BOp/2x3zBFUoNOrRneVSkTvLRihhl/LS
	FTL2lm8yqI2BQYZR7rcR2A2jrb88GHtv7WH/l3COIAvYnZa/no4Du4ZGmPNRBAXTnTMGiQJSFw=
	=
X-Google-Smtp-Source: AGHT+IFj9pRKN/DH8YfxglgQfsZpXnJ3j3ZI0jXCzgoNzxGRBHeHeZF3xHQiYbURdskXxs29GTD5d6vGGA==
X-Received: from wmrm4.prod.google.com ([2002:a05:600c:37c4:b0:43d:1dd4:37f2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e46:b0:441:b3f0:e5f6
 with SMTP id 5b1f17b1804b1-442d6dd2276mr134025105e9.25.1747154084667; Tue, 13
 May 2025 09:34:44 -0700 (PDT)
Date: Tue, 13 May 2025 17:34:23 +0100
In-Reply-To: <20250513163438.3942405-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513163438.3942405-3-tabba@google.com>
Subject: [PATCH v9 02/17] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
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
2.49.0.1045.g170613ef41-goog


