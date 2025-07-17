Return-Path: <linux-arm-msm+bounces-65513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C4B091BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F52173A79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F872FD5B3;
	Thu, 17 Jul 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aYXneOfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299BF2FCFC9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769660; cv=none; b=hvhPnwo7qivCXL3SfJL92Cjq8ojdAW1W96k0EvLwDINZkHDRok+qlMVY/Zkg1jQsYgJepRVU1Qtt09la8BxVZyRj8IGhU2IZ0Wb+3NWAmsVk26ZO6YXWSbT2w/M6qpczGaTGASB4GPb9ERiIgf5DmyS6dSWWMKHCyDH0Sq/izsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769660; c=relaxed/simple;
	bh=CZbQqGKfq7lnOE8Dq04mQVdronOZ1uU380z2iWzGtbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ClkKUj+OY5ji+8aHH6M36qm4xogjVNl1wBMvVIRBIq5YkE1bHXA5rWoRQcMK+mX4QexZgW67HEia0l2BzIs25wFpBRT2Z4lrMXWxJSni3KNEsllhly58jntYdmw+GLAV5Q2h7KVUIKXTNMS6Ol+3ddbCJb+46VtO57M+COyhatU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aYXneOfT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45359bfe631so6058355e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752769655; x=1753374455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGm4OrF5AH9M0Efkqrqd3zCKs3Rhrec+30Q520+k5eI=;
        b=aYXneOfTXsS7Ca+Wp490FrUCAJCURiTDFp6aTD1Y0kG5VaFuHT2cYUX6vIKa/l4bqw
         Farbk9LbLi7u3TFP2D3RWsNCTAJ+6QyCE8dXHzcKwfOkAqWsMXP2F1vykdPUcWefMkzK
         8DIJbSMZKOjnJqVjmyDa1yQSFg8S6vTZYFeVvNsAJYWLODRKHOl05dek9hTKaafzCUb5
         i74A7taGK4h8lnUdQHYK2IWMQE7LPbklUm5qaIWrzHLv2UPZt1LkZZ8NXs/3oFsQe2mY
         Z1frBBB5Xe3i5KFwYtIvKT88jPS8NC2L0r97pjdM4yZBjLNHTFhIk3m5l3xnaHdhyY9y
         rIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769655; x=1753374455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGm4OrF5AH9M0Efkqrqd3zCKs3Rhrec+30Q520+k5eI=;
        b=FQlxydUR944NVUknuutGXAJu5KgjsjmcTiy1SfuKMh04cT1udDVWulCSkJ3cCRyaQx
         /+Ue+zxwdRVhGjsTQu9Fu2+/lK3tdHzxjvcCOJlqmfp9qr5ly6pHUvhu9qI5gsbkZnYE
         Blid5H0lXHyTZwZQG0xENcEtbVlLbr59fhRk6CVx0psTAli5YFWhZBbjMrWmgTSfefmN
         9UBs4hyiKMJeWKhO853ps9OZuebMLlQmYCnsJutAXIC17ISjDYM6AtiHmVwpUyP6rIHm
         uBljkih2EVU2sOFTqGBCEu3QgIqPnjdYIxDH9Q/Id3OOjV91mTXq6OPNm4veBzLiF3Xr
         niKg==
X-Forwarded-Encrypted: i=1; AJvYcCUoiI/GizwFpYRo1eC77GTjJy+gjY97glVnewAIIVE5w3HJqmhHTdxFnJdcsT8slRrh1XwVf7BZPn3U/ton@vger.kernel.org
X-Gm-Message-State: AOJu0YypkrZzWWDzTPk6BTDGOLfJFZVZv/a8yjsoGw5KeY2dCK3BNQVo
	ifXzW3e+rsc4sflR9pJSHm/lf50JorA8gAPWgrsYDTnCLmsbKwFoyp2ASCzpKI5QrT44FyYk2jF
	A1g==
X-Google-Smtp-Source: AGHT+IEysdP5DZqcnWuiBAUxwVt36pWakwMvarJj9IwwM8dKd2la2qqCW09A1R4Y5Id/zn0DFltlJZPS4w==
X-Received: from wmbek10.prod.google.com ([2002:a05:600c:3eca:b0:451:4d6b:5b7e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c16d:b0:442:dc75:5625
 with SMTP id 5b1f17b1804b1-456352d0b70mr31903115e9.5.1752769655271; Thu, 17
 Jul 2025 09:27:35 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:27:13 +0100
In-Reply-To: <20250717162731.446579-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717162731.446579-4-tabba@google.com>
Subject: [PATCH v15 03/21] KVM: Introduce kvm_arch_supports_gmem()
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

Introduce kvm_arch_supports_gmem() to explicitly indicate whether an
architecture supports guest_memfd.

Previously, kvm_arch_has_private_mem() was used to check for guest_memfd
support. However, this conflated guest_memfd with "private" memory,
implying that guest_memfd was exclusively for CoCo VMs or other private
memory use cases.

With the expansion of guest_memfd to support non-private memory, such as
shared host mappings, it is necessary to decouple these concepts. The
new kvm_arch_supports_gmem() function provides a clear way to check for
guest_memfd support.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h |  4 +++-
 include/linux/kvm_host.h        | 11 +++++++++++
 virt/kvm/kvm_main.c             |  4 ++--
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index acb25f935d84..bde811b2d303 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2277,8 +2277,10 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
 #ifdef CONFIG_KVM_GMEM
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
+#define kvm_arch_supports_gmem(kvm) kvm_arch_has_private_mem(kvm)
 #else
 #define kvm_arch_has_private_mem(kvm) false
+#define kvm_arch_supports_gmem(kvm) false
 #endif
 
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
@@ -2331,7 +2333,7 @@ enum {
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
 # define KVM_MAX_NR_ADDRESS_SPACES	2
-/* SMM is currently unsupported for guests with private memory. */
+/* SMM is currently unsupported for guests with guest_memfd private memory. */
 # define kvm_arch_nr_memslot_as_ids(kvm) (kvm_arch_has_private_mem(kvm) ? 1 : 2)
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 359baaae5e9f..ab1bde048034 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -729,6 +729,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 }
 #endif
 
+/*
+ * Arch code must define kvm_arch_supports_gmem if support for guest_memfd is
+ * enabled.
+ */
+#if !defined(kvm_arch_supports_gmem) && !IS_ENABLED(CONFIG_KVM_GMEM)
+static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
+{
+	return false;
+}
+#endif
+
 #ifndef kvm_arch_has_readonly_mem
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d5f0ec2d321f..162e2a69cc49 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1588,7 +1588,7 @@ static int check_memory_region_flags(struct kvm *kvm,
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
-	if (kvm_arch_has_private_mem(kvm))
+	if (kvm_arch_supports_gmem(kvm))
 		valid_flags |= KVM_MEM_GUEST_MEMFD;
 
 	/* Dirty logging private memory is not currently supported. */
@@ -4915,7 +4915,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #endif
 #ifdef CONFIG_KVM_GMEM
 	case KVM_CAP_GUEST_MEMFD:
-		return !kvm || kvm_arch_has_private_mem(kvm);
+		return !kvm || kvm_arch_supports_gmem(kvm);
 #endif
 	default:
 		break;
-- 
2.50.0.727.gbf7dc18ff4-goog


