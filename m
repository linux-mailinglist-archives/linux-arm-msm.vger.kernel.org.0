Return-Path: <linux-arm-msm+bounces-60338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57360ACF346
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 181B6176A37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277A92750F8;
	Thu,  5 Jun 2025 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tNN1d1NB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C12D274FFE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137919; cv=none; b=oJoPk+qt2LSaHRMSLjF2dpFqDDwbOvBpYv26v+q/DZVpUX7ZpDkH7K3Zk9e4GmlSwuHEBudDBA0aw5+YxqDXifxK+dL32ILx3J58chlo4eL+UMcwJlIcaj+4T/1VJ/MpLEMWFIZmUUizl9SXqPbJ9OmkCc+QTJolxmo7pe7qIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137919; c=relaxed/simple;
	bh=rdPDhyaoW6mSYLiuwo9TvHfdujxfWtJwzIYzqV3Hw8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A5GOpFrhnKUyOEBsCiXYz6bqfruWUJVCrTwcuHnTm/T31jgGJQ380ie6cXt1VVLt9vNXh56DAR7UTDRpUqOi2BU58/gIPWeO4Lxehg46lSTyNJ3gRS27AqXe0J/DkHw0/d31nly31ADVTKIjexiKHgVd2ktOjZOBWcY9ND5k+9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tNN1d1NB; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a503f28b09so575170f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137916; x=1749742716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WvGWYKbUHc1QjOWUUi5+rgbSvPXaQdRqcKS/O0QgOdg=;
        b=tNN1d1NBLZbCIW1ICAHeUhnhOUVb6hxZCDYhEHYPMo98JLuzzmycTMfIJQBYf/B7pr
         MKiz4UaN0KMIcPEkqrQ4hn/3QTeafaat7Gwnp+oMx0hEe9V+eADujBOA21ycG7BrZ42A
         pfJm7dUQGHgj5AyvhXZ/riF/zlvrbET3ot3MW6toI3RpZbdHkvu1tDxewz3FfMNmX6LU
         sjcdBtQfLV6IOzoCRZ3PUZplBinWq0uDW7N8JxwGhJWbT3zBwhYwYsCW9ucxobfaQbpR
         2oYqrztA8rzYuvvkwcOORBGjl7rV/PhiMnUf08V1EsjJBsnGMHV/qG3frYBUg1f2KHxg
         3qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137916; x=1749742716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvGWYKbUHc1QjOWUUi5+rgbSvPXaQdRqcKS/O0QgOdg=;
        b=ZbN8XQuHgIo9tEtBFLAUgFZFqj2J7D02eI+7OGqAjzAN+KhXx2EVUCrcpg+PzD6Ds1
         fS2U3mbKM11tpqmYbzFyj1f9UEYN4uBT7LxkfQ76+sRE3TPWXKmLe3WTC/iijoKdWC86
         DEFkkDzeXrZRu6BXAQV6GDGI31tBIh0xWNge7SQbpHrkTicvvFChr3YuwZ5PtYEr/FIA
         9+LLCjY26cSAs7nnCpYBS2fIhUULgUT1sfuXSV3huk8sJgN5u6wm5GWX9MUqrfkMKAIe
         57dIiwm4rQ7LsqDyZL6sSV7jwHZHXu+fzBTEuewZv/P87uIhwpwKvlY0Dn7t2v/gVNCd
         weHg==
X-Forwarded-Encrypted: i=1; AJvYcCUrxg+ITX16u8xzEC21dZmy+sTd/WhazWAHGGuPxjWhkOib2mfAbgpUhdiiM8VXFxQ/Zx97KCFPRdR1whmQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3qd2b0ThRVheT5GJ5ASeZwZSCz0uIywU+6PXHlxCdpyPsZIU
	yWWp7Poq1jjyYxqXPXLwIZD7qpD4JDf4Qi6sWF0h2/RRclJ219MssTvZvAPqwsMKCDOziRCHFzb
	AKA==
X-Google-Smtp-Source: AGHT+IH7KfeqxCmjb0WiUWXwmgleVKgVdPR9DackR9YTnqc3z+eX4w/0VPhkSS5eE5dAxaZVOhq2HozL3g==
X-Received: from wmbhg22.prod.google.com ([2002:a05:600c:5396:b0:450:d422:69f9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:290c:b0:3a5:24cc:6d5e
 with SMTP id ffacd0b85a97d-3a526dc5198mr3567855f8f.3.1749137915770; Thu, 05
 Jun 2025 08:38:35 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:58 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-17-tabba@google.com>
Subject: [PATCH v11 16/18] KVM: Introduce the KVM capability KVM_CAP_GMEM_SHARED_MEM
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

This patch introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
indicates that guest_memfd supports shared memory (when enabled by the
flag). This support is limited to certain VM types, determined per
architecture.

This patch also updates the KVM documentation with details on the new
capability, flag, and other information about support for shared memory
in guest_memfd.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 Documentation/virt/kvm/api.rst | 9 +++++++++
 include/uapi/linux/kvm.h       | 1 +
 virt/kvm/kvm_main.c            | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 47c7c3f92314..59f994a99481 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6390,6 +6390,15 @@ most one mapping per page, i.e. binding multiple memory regions to a single
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
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c2714c9d1a0e..5aa85d34a29a 100644
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
index 6289ea1685dd..64ed4da70d2f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4845,6 +4845,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_GMEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_supports_gmem(kvm);
+#endif
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	case KVM_CAP_GMEM_SHARED_MEM:
+		return !kvm || kvm_arch_supports_gmem_shared_mem(kvm);
 #endif
 	default:
 		break;
-- 
2.49.0.1266.g31b7d2e469-goog


