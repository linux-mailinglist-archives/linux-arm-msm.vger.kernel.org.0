Return-Path: <linux-arm-msm+bounces-57744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E859AB5A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06ABF188842A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E782BF962;
	Tue, 13 May 2025 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lY7cVdTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C972C031D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154114; cv=none; b=qW8W/WJjhYq06D6vWJSG5Ev5wxcGyM6G31fJyKhj0YWrH0CyY9phdosIxs2V3pAdhIZgLMEJejCPUOmw5d9C6aPOzdhrAOLqCwv+8nMoz627fcmk+pt//4l2D6uiEBDC3EB8SFsLJQIkVBc7SVfWw/1MiPiOdav1bb6Jml/irTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154114; c=relaxed/simple;
	bh=bNE8fjz0DjqD61kI2dV9cmfzEuqeWV0E/d5rTeYbx6I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HEGKiT5M/X7nr6tIWRqbRsmUJQ3/hozaXGJOTBRe8CO26AQZ81qLRbeL43VdyTg+5I58s2AfXX9ObADvUCbV6tQZ0cAsjIc6+QVcjTgdGU58E+ypmyAj5ACzcC8XuFI/FofYsNUof8FOrR0rBgMZ6ratF24oSaN9gJ5sQfCjbKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lY7cVdTb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so28826825e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154111; x=1747758911; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZWH6ggb1hC8uB3wzLXpUmgA6cvqTdmcA385l2vtyqo=;
        b=lY7cVdTbcSiy8Ez4lAPqt+XIj2In95/VC4Z6jqtC9laCHhqd1vZsRZ3ILiH04p5Lzp
         SiwYLtmgGHnihmWTNBvqyatm2qjgLBGGAjxFCQZK1NXHno5tfqVvEmhgCib3Q6eaP6Us
         mGAjW+uFeOqYI/Ogagf5jUKXWYyagpCpgctsx0A2JV1nuSBwN14dZA+0PVBiuo+Hrjby
         eVyLkSDeF76iV+79V64KbH55U3mPwkYXOmsYFnA78lp7NDV+tqlmZ4aZS91apBykQEwM
         a3DmMa4PZ8t1kzpzlB7N6dk8zCqNE/wVRx3RCBWpkXKQeucUja2nqEN6DoKIgmWdtmV8
         0v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154111; x=1747758911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZWH6ggb1hC8uB3wzLXpUmgA6cvqTdmcA385l2vtyqo=;
        b=HiOWIeodOnmz6tMaTPrfnPDH6+gujPDCRQ5/uPyvh1pq6BsKOJLwlPe+zAQwqOdBB5
         kmpq5BXx7Z74AA8JLWkiILDshGl5mnEMYkqpE2X3+SfRLwEhatlNnM4tdp/6mPR0+On7
         /HHR34QKlxRa8FjtiaymcKaeTlD1Jr1yAwdwrDaZlbpf2ig1i1LmddPjTm2lFJBL3uU0
         QvsJcl5a4X868JKAS10DdzrN1xxgx13yTQFKWb5la1Iva7M3TZ4XLktVJYs5Uck9eH+g
         2u+peEvcG40Mytwzb8AR64nUpceYNkmWHxvgRqBqwRA5SBGlUR7eFuQnbLbTfb3dkhNH
         nYSg==
X-Forwarded-Encrypted: i=1; AJvYcCUIpqPHdmqJbfaIsOGs2aWOcu2aXct4j+d3YGhifWxp6CsT8mB4MfpabYQvveXadBUhyObpUGOTW8VWABf8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxim7BwfLTwk9qipnEIiLyy3fV/2pE57gAEtWlWxIppm6ykBWgj
	6MbnNXBjx9Eoemq0opc5xkuR2iWTS/WcEVpQaHT0etai5hwzYTVOwiHzQ4oOM+bCrYc9ascS1Q=
	=
X-Google-Smtp-Source: AGHT+IGHTibNt10zPPbfcc7hWBFBZ+4Wb9WgnMsxL3M8OZ9mvTxE/IBubiT+QXo86B+nchX57b8DoHTPkg==
X-Received: from wmbjg17.prod.google.com ([2002:a05:600c:a011:b0:441:d228:3918])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:154b:b0:441:ac58:ead5
 with SMTP id 5b1f17b1804b1-442d6ddd0afmr192218995e9.31.1747154111449; Tue, 13
 May 2025 09:35:11 -0700 (PDT)
Date: Tue, 13 May 2025 17:34:36 +0100
In-Reply-To: <20250513163438.3942405-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513163438.3942405-16-tabba@google.com>
Subject: [PATCH v9 15/17] KVM: Introduce the KVM capability KVM_CAP_GMEM_SHARED_MEM
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

This patch introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
indicates that guest_memfd supports shared memory (when enabled by the
flag). This support is limited to certain VM types, determined per
architecture.

This patch also updates the KVM documentation with details on the new
capability, flag, and other information about support for shared memory
in guest_memfd.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
 include/uapi/linux/kvm.h       |  1 +
 virt/kvm/kvm_main.c            |  4 ++++
 3 files changed, 23 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 47c7c3f92314..86f74ce7f12a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6390,6 +6390,24 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+When the capability KVM_CAP_GMEM_SHARED_MEM is supported, the 'flags' field
+supports GUEST_MEMFD_FLAG_SUPPORT_SHARED.  Setting this flag on guest_memfd
+creation enables mmap() and faulting of guest_memfd memory to host userspace.
+
+When the KVM MMU performs a PFN lookup to service a guest fault and the backing
+guest_memfd has the GUEST_MEMFD_FLAG_SUPPORT_SHARED set, then the fault will
+always be consumed from guest_memfd, regardless of whether it is a shared or a
+private fault.
+
+For these memslots, userspace_addr is checked to be the mmap()-ed view of the
+same range specified using gmem.pgoff.  Other accesses by KVM, e.g., instruction
+emulation, go via slot->userspace_addr.  The slot->userspace_addr field can be
+set to 0 to skip this check, which indicates that KVM would not access memory
+belonging to the slot via its userspace_addr.
+
+The use of GUEST_MEMFD_FLAG_SUPPORT_SHARED will not be allowed for CoCo VMs.
+This is validated when the guest_memfd instance is bound to the VM.
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 9857022a0f0c..4cc824a3a7c9 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -930,6 +930,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_GMEM_SHARED_MEM 240
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6261d8638cd2..6c75f933bfbe 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4840,6 +4840,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_GMEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_supports_gmem(kvm);
+#endif
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	case KVM_CAP_GMEM_SHARED_MEM:
+		return !kvm || kvm_arch_vm_supports_gmem_shared_mem(kvm);
 #endif
 	default:
 		break;
-- 
2.49.0.1045.g170613ef41-goog


