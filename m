Return-Path: <linux-arm-msm+bounces-66256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE4B0F055
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7849D17751E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2299A2E5407;
	Wed, 23 Jul 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kimrWw+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBA2E49A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267660; cv=none; b=oSW+yADywoueScMXrQ5OJgdfZdoG5WjvBSqhSe2RdgTwvbdkVw4qzxso6RqOPsULZvSfsLfTLu4JdSHvVpHIo3jAx7V93E77QS8OYaaafq5W6pF7UG16kyRBk2kt8hP4edycX8T5jfsgKOPa1GNeOZS301HbqqQB+jKPlAA7kGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267660; c=relaxed/simple;
	bh=ceGgI6WalVQIFbno2dDTnGm4SEvuo5FHl0K8sPnS0rM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SL10m9sZ/g4jPpXDrdTacY9CfUZpf2AIRJYkiKFXr+g2jp81o9XMcO6iJZoeA0SXZw8VL6xZ4BuCcAaIu7h716yEN5RaLx2vdh3S2x2Y5e6tFXUsP3F6gw8fkLH1nZDN9W9kqonCUKT04ll4FPQBKyWkwzzv8QW1OzJxs2nDmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kimrWw+N; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-456175dba68so51687495e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267656; x=1753872456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJPhpUUyhefgcIbSkuwiw95QjSbqiQA9zLACcCZ8gX0=;
        b=kimrWw+NPz+hkDx0LP8nrbwRO2slnbyRihGkaNua9E5zy4mTh/TL2DB1mqGp8qTgKx
         6O/oHy9ndlUK+reMesBkvllUOhNrYVfiea0m4rFKaa0c/Aq8L1+Vosyj83W66pWCZ1uw
         2UugzGANLbSv5pVcmt5FVfgP68NSNBPJ9oeBsHLQnsbqRlAiMXRBuL9hjMuvtJYeQ6OH
         ejbrUpFU5PoivNhrkebiq+ixjPXafn4hbVjlxyxPxDTpA714rQRnVE3Xfv7qaIiDWYHo
         vgbRX/sivc3Z23qGroejpNZbVhMl2QkMaI1OQs8NaGibLQBOBXLCYT3H6Gdec43SHFs/
         KSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267656; x=1753872456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJPhpUUyhefgcIbSkuwiw95QjSbqiQA9zLACcCZ8gX0=;
        b=li9uWQE74sDtCfiYmi5g6CnNH6yfu/stO/BarGRu1etYNUKeEYQZDiI8gnJKDCZ30H
         i8odvxAUiIH4uqH7XX0a/VN4cyoNPAHm++KqNYjfj1seLCfO6BomFzhjN92VPhEm7F8b
         oQ5lOZskTzJCvyVpRVWWo6SR2W7SCUyrBqDVC4JW5sfjXPrSKch4quG1DNjn8CdGfcZl
         1clyDY9RIF4Jk2hVXeHLEIXgCc3/6xSaoqs/VO8YyflHMnfMS9gB7keP7l10wtQqkUPP
         Xsv6MfrOBb3KOwZEntP0wPFbvgxKg29U/QDplb20Zh4ZSKNOuZb4efeupUAJukDPfkni
         gwMg==
X-Forwarded-Encrypted: i=1; AJvYcCWpzhifZQokJdQ8bdzIRepLmU9R+Lm3q7QLQrzyKYBwdNiRNzsg7csgcPHy8HgedQNMRyhrcK+dPjc0Q9yB@vger.kernel.org
X-Gm-Message-State: AOJu0YwMgXqFRYHGH9GFv96rDeSUFcJ/vm2nfZsdUDVpRB5vAd026GC/
	T5yGr3ce3Tm9P6hWEjiHppx/1aRjRHFFeKwlK4EuB2+SubjjxBBpNLAIdvYG++KSacqO8VuNQxG
	QxA==
X-Google-Smtp-Source: AGHT+IFg4amFUMT8SnQXmGfSL7jQcBmHONqp6DdPspIYde7f6m4gxAAek8vnyOnJeKOMl4Q0IeoumHUzug==
X-Received: from wmth16.prod.google.com ([2002:a05:600c:8b70:b0:455:e7b2:5b41])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358f:b0:456:43d:1198
 with SMTP id 5b1f17b1804b1-45868d4dbf7mr19148065e9.32.1753267656601; Wed, 23
 Jul 2025 03:47:36 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:47:12 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-21-tabba@google.com>
Subject: [PATCH v16 20/22] KVM: Allow and advertise support for host mmap() on
 guest_memfd files
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

Now that all the x86 and arm64 plumbing for mmap() on guest_memfd is in
place, allow userspace to set GUEST_MEMFD_FLAG_MMAP and advertise support
via a new capability, KVM_CAP_GUEST_MEMFD_MMAP.

The availability of this capability is determined per architecture, and
its enablement for a specific guest_memfd instance is controlled by the
GUEST_MEMFD_FLAG_MMAP flag at creation time.

Update the KVM API documentation to detail the KVM_CAP_GUEST_MEMFD_MMAP
capability, the associated GUEST_MEMFD_FLAG_MMAP, and provide essential
information regarding support for mmap in guest_memfd.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 Documentation/virt/kvm/api.rst | 9 +++++++++
 include/uapi/linux/kvm.h       | 2 ++
 virt/kvm/guest_memfd.c         | 7 ++++++-
 virt/kvm/kvm_main.c            | 2 ++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index f8cb0b18b6be..95a0697ec34d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6414,6 +6414,15 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+When the capability KVM_CAP_GUEST_MEMFD_MMAP is supported, the 'flags' field
+supports GUEST_MEMFD_FLAG_MMAP.  Setting this flag on guest_memfd creation
+enables mmap() and faulting of guest_memfd memory to host userspace.
+
+When the KVM MMU performs a PFN lookup to service a guest fault and the backing
+guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
+consumed from guest_memfd, regardless of whether it is a shared or a private
+fault.
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index aeb2ca10b190..0d96d2ae6e5d 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -961,6 +961,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_GUEST_MEMFD_MMAP 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1597,6 +1598,7 @@ struct kvm_memory_attributes {
 #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
+#define GUEST_MEMFD_FLAG_MMAP	(1ULL << 0)
 
 struct kvm_create_guest_memfd {
 	__u64 size;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index d5b445548af4..08a6bc7d25b6 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -314,7 +314,9 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 
 static bool kvm_gmem_supports_mmap(struct inode *inode)
 {
-	return false;
+	const u64 flags = (u64)inode->i_private;
+
+	return flags & GUEST_MEMFD_FLAG_MMAP;
 }
 
 static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
@@ -522,6 +524,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (kvm_arch_supports_gmem_mmap(kvm))
+		valid_flags |= GUEST_MEMFD_FLAG_MMAP;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4f57cb92e109..18f29ef93543 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4918,6 +4918,8 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_GUEST_MEMFD
 	case KVM_CAP_GUEST_MEMFD:
 		return 1;
+	case KVM_CAP_GUEST_MEMFD_MMAP:
+		return !kvm || kvm_arch_supports_gmem_mmap(kvm);
 #endif
 	default:
 		break;
-- 
2.50.1.470.g6ba607880d-goog


