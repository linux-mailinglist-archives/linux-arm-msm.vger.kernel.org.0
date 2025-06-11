Return-Path: <linux-arm-msm+bounces-60986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17480AD5741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76CC1176865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EBB2BE7C7;
	Wed, 11 Jun 2025 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CYmv5jbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF228B7C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648850; cv=none; b=cwrZMNee0Oo26Xflu51Y6mtmJg5L268CkWbPzJSynQfX9BG5+0x9SucISbFd/HlRCgl1KqwlNG4SoZu9Qca4AH2TS2ZgBbYusZPwgmMkYZvuPqP5MDDXJ3W+N4u0ARs8WV3fR0J+Ln5Svi+EHjLguw7yNjnD6TkQX59J4SwbKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648850; c=relaxed/simple;
	bh=85h3na1gsYFMlWN8UpZMM/0gWDZKX7wBW0lX7RlGk8Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NO4f0i6Mt6McHKhBc8j63lTwPUm9cO7DSHFiDluV3FjFmEPD3ExR7+I0iR9IzqTikwUAVMfcJ9eIsQy/CJDez7tjEe+vC+IoRymVEzpE7EtKUU2QqdCduiPXwhohc00L39/xBkyrR4HuqF8e9y+0XV31EQTU2OQO92TNjUhpVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CYmv5jbr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450cb8ff0c6so36646115e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749648845; x=1750253645; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XR59PTGuiW1gb55TNwkuIBSMjZG1XsBaxGQqCed/os=;
        b=CYmv5jbrhSQGYyDbuhLIMPBEFG6/Z3s6qES0hJveb9yZASR0UlgBPdXU0X3PQ4o/uL
         T9OkBezO/Qm3ggR2PCm5CKztMqKvQsm/kLhGMBihO1QJw+cFXmj6YWpmz/my6ZoxLLrG
         tnrup4PUZC9Cnz16BU0KLJRC6ihuz4LNPdDa7G3rL9iZ88WdHpobmyHvsAOH5qHRWLmC
         WCsdPmOp5/7VXdB2+t6N0oZ5/ApSlSDmJi/xpnN6HSvqtxxovVsr7YZvBUAYBDkaLOaT
         MOj+Cl2MYB0BmA/U4SoNZ8dbkcWe3ae7xZ03FyypMTXSYb7s60Te3EEh3IF3sc8NuK5t
         dajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648845; x=1750253645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XR59PTGuiW1gb55TNwkuIBSMjZG1XsBaxGQqCed/os=;
        b=pLL7bykhQr7eA8aaWse/4S48Gf1Mt5RyliikB8dJuWj3T6w/fTjR6Z5yXqieGFVCGM
         dwfr9e2ro4Jn4R7GeWQVn2rHdmvNRcaesZXbyTN9aWfFoPw+jowm3xpHTuTI3TbBxwm1
         FGSIckE2XdtIW6KzvvbmLt/k+O5SPpEU6Z1DPwdZUm8Nst4j9KZpoBelICLfevxX2BUi
         TZehismSAogwdBHRTvjOqz0LMUy2bj9KKTsfexhQOkqm1cMNYj1aoi11eTcJNFsIuvB7
         DefGwVZNxGo+Y+UFC6cja5RTKFZ5AAhEgjwfX4FVB6WyvTITqRJqsoyDo4jj2Ax8pIVs
         eByw==
X-Forwarded-Encrypted: i=1; AJvYcCWm/e3T08dQqyllKHGkLy7a/aD7r3jfponYLUjQcADrBbj82dbonIKEAm26VbLExKmagdMSJYLg5v4se/fl@vger.kernel.org
X-Gm-Message-State: AOJu0YypWcrv7+DU3iz1+LteYrbSla2ndybWQKiNhboD3hWjabVehlgV
	3Ol5bxnCRpIf/A1Q5PJFx9nhTaH++gAoY+O0ja+Xm+gZtlkezc6krJo+zjvi+AFloeNWLo2CQXS
	QKw==
X-Google-Smtp-Source: AGHT+IEfAr/l95Kf+rwSAj9mppIOYExWAEsd3FitYHNfOu71BGp8Mi+xQZ98YDO3SYy4dT9bCQ1C1E+czA==
X-Received: from wmbep25.prod.google.com ([2002:a05:600c:8419:b0:442:ea0c:c453])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6986:b0:439:9424:1b70
 with SMTP id 5b1f17b1804b1-45324f6a144mr26676635e9.30.1749648845441; Wed, 11
 Jun 2025 06:34:05 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:33:28 +0100
In-Reply-To: <20250611133330.1514028-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611133330.1514028-17-tabba@google.com>
Subject: [PATCH v12 16/18] KVM: Introduce the KVM capability KVM_CAP_GMEM_SHARED_MEM
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
index 1bd2d42e6424..4ef3d8482000 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6407,6 +6407,15 @@ most one mapping per page, i.e. binding multiple memory regions to a single
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
index cb19150fd595..c74cf8f73337 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -934,6 +934,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_GMEM_SHARED_MEM 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d41bcc6a78b0..441c9b53b876 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4913,6 +4913,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
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
2.50.0.rc0.642.g800a2b2222-goog


