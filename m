Return-Path: <linux-arm-msm+bounces-50038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94577A4C9DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 18:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 809C03B9D64
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 17:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6694524E007;
	Mon,  3 Mar 2025 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nX3DUxyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C63124E015
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021829; cv=none; b=JAjRGuXcClVOezBfQzGfoX7FH0ZCplA/q7GE6Y9qfCdEECS0YogKfof6B1gvcuHFcDBQKP9wlcnUXVgIkisa/57+u+8lFaoQYFZIH42Yh72nskneYYvC/6yY4hM/uwd2BnWdaJn4Vi5mjfY9ZzivASogoJurTlVwNDoMZLLQ/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021829; c=relaxed/simple;
	bh=DUkn5GbyH5CsPI0C4PwuQxIiwtGgSakNH9hZfIYfgMo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H54wRawSXrfR14wCN2xaZGdqu4HtzcR/7dRBDAZOA/sOLtqrIFu38H3OA6KnIWwrRvOGJZvsh6XIsk159L5Q6AVXUxkZN4I/BuKmrSceIc1yeB/NsTTsC8gKb4aHk17x0EpUET5dDc8gjGc+A7i5dPlTj5HBFGsn+tKErBxOEds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nX3DUxyR; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bcb061704so4835e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 09:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741021826; x=1741626626; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBo9cxuckkLxj1P4sgBwDTqSuyzpVc+06bRUFpsmRRk=;
        b=nX3DUxyRqDrCgDK4MjhAent2+2t0M3XT5ynD2zKc7891zaeMUSLNWmm1sxIGPCZcZI
         mZdRbC18DZ88V0JxDN3ZpIlbXkQBatZklhDcIprgxoTwFkO0xUx8UJo8EaseJQfVSUhH
         NT8TiFSZI91ULRBXgLZoFKl32LqxM/DG+DE0CUlF349xp1erKquxA3cFrnPHHG8umSiL
         XpCBL2ygMnoS1oRN/aq25IE9MHZSdqRurv5Hh/rYzDcAELaQv3RlJhTOhyrCpqZRBGAx
         4RLvY0ScfQUzKcKmOoH80wz8/uvW9i2z+2Gk3VX580fpcr5MKhE9Ey0mbK1pYljjnqok
         Xr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741021826; x=1741626626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBo9cxuckkLxj1P4sgBwDTqSuyzpVc+06bRUFpsmRRk=;
        b=QyAcJrC9VT0qcpbrY5i8Ub4vgf6sQBwcCmWScsi3mw7N6wyeb/0Oy2X5fBk9uxysvv
         s3dciSzetGwF5t9+VIh2emHCxEBqn2yDX2FOc+ltD2qGVI7T/jKVhLn/e/mhp+OBMwjo
         kO8cOJiwYTZNnB8V6ijPdcjjyrOSA/dCUTzW27EMANqq7g29+e9zXfHVCtvEAycUJHsN
         t58PoP5wPdsj9SZOWqj44gNHyBzw1vLrWmvu/vbhsUFQnunFzGwm5+gvopAd4NM8FWdA
         SrW7iSyQkw4UbZ8Jdq8m4uiu56gpht2VsWb3FfKJaoghiD/wk5htK2hIQFCHY59Nhqg+
         DzJA==
X-Forwarded-Encrypted: i=1; AJvYcCXVEwCP7jYGZ5EE8YfXNNv/I+5Dr33aM4M4QCnndU5DvGjlbf9gYrZdoo5dLFQ6ewtYM7ASo8lS4AkKVzLL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Ul9Dv1AEO5yjkOzNDYHmpI2N/hDHAUcxtOWr8Q2PQGlb02aS
	6OH7SkZItW00a0jtk5sag7cVRiUfzJaYWyDT/RAV3cq3a/neuiCZuLQe+uHIMTxhhQD0sFSfRQ=
	=
X-Google-Smtp-Source: AGHT+IEzzWpqEnLXSXMECYOpjexIXQkN5OcLraeoWVVOWbC+GmYVuhkSVhxjsVgVJQAszWAWjCT5GaMLGQ==
X-Received: from wmqa13.prod.google.com ([2002:a05:600c:348d:b0:439:64f9:d801])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f89:b0:439:96b2:e8f
 with SMTP id 5b1f17b1804b1-43bb4550794mr52549605e9.28.1741021826102; Mon, 03
 Mar 2025 09:10:26 -0800 (PST)
Date: Mon,  3 Mar 2025 17:10:09 +0000
In-Reply-To: <20250303171013.3548775-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250303171013.3548775-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250303171013.3548775-6-tabba@google.com>
Subject: [PATCH v5 5/9] KVM: x86: Mark KVM_X86_SW_PROTECTED_VM as supporting
 guest_memfd shared memory
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

The KVM_X86_SW_PROTECTED_VM type is meant for experimentation and
does not have any underlying support for protected guests. This
makes it a good candidate for testing mapping shared memory.
Therefore, when the kconfig option is enabled, mark
KVM_X86_SW_PROTECTED_VM as supporting shared memory.

This means that this memory is considered by guest_memfd to be
shared with the host, with the possibility of in-place conversion
between shared and private. This allows the host to map and fault
in guest_memfd memory belonging to this VM type.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 5 +++++
 arch/x86/kvm/Kconfig            | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 0b7af5902ff7..c6e4925bdc8a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2245,8 +2245,13 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
 #ifdef CONFIG_KVM_PRIVATE_MEM
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
+
+#define kvm_arch_gmem_supports_shared_mem(kvm)         \
+	(IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&      \
+	 ((kvm)->arch.vm_type == KVM_X86_SW_PROTECTED_VM))
 #else
 #define kvm_arch_has_private_mem(kvm) false
+#define kvm_arch_gmem_supports_shared_mem(kvm) false
 #endif
 
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ea2c4f21c1ca..22d1bcdaad58 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -45,7 +45,8 @@ config KVM_X86
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
-	select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
+	select KVM_PRIVATE_MEM if KVM_SW_PROTECTED_VM
+	select KVM_GMEM_SHARED_MEM if KVM_SW_PROTECTED_VM
 	select KVM_WERROR if WERROR
 
 config KVM
-- 
2.48.1.711.g2feabab25a-goog


