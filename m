Return-Path: <linux-arm-msm+bounces-47563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096BA30B72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA9C1889A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E78243396;
	Tue, 11 Feb 2025 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XvyQYwLD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DF230276
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275905; cv=none; b=PaMkmXJKyKP5/Wb925D2IGl+ke0vTgJEbTMdIEkwwYWL8nNFEG2OVKEZ23inn7d0Ly5PqpoufZESdFX2PJvtX2A/IMwB1PEwUbATxPJKGE/A9/I5q1vrpd1vb7rjI6EBT8vhSGi/VHfVkeiNjHpHPvqQH8anQtdhkYN8Iu/Otmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275905; c=relaxed/simple;
	bh=k+3OFnLM2NMDoQpYe/i6ltXhsVyBeC0rDOk8mBxA1Zg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ctjnTArSGzSoRj6BASPZDYGJtKprxLPoFxQmGy2mT/c+7ZoQIr44aoi7cAuL2Q2QB526E0wU/8StCTcj5CLxHs4pcdlG4Y6hci5psauB/USfQ3iNMU91saFiGaeOMEWlifeO3k6ajWjEvUDWOBezWkNxxaEq073aXWSSyUu1q+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XvyQYwLD; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38de0a98043so772437f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 04:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275902; x=1739880702; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KX7W4swHrFK90elybvizfO8dqWilJCD1C4Wf1fKXSTM=;
        b=XvyQYwLDJsIXlkD9w/7HUfDfZ5Tnc3pCitKZl1Fl4aYWQ3B7NuxAhP0eiLnkDjM2ml
         5tHHxxyTXP/3F0Bn7+reWFyRtPGKtVLAao3Nv9AYX6HpEzKNXea22kkaCU6QXc08Kc5z
         WHNLvSBUHFtVkZL3TE4gEWPkWAaQgfMb6GXnHLbMqeSK132QyN5AEw+OGSIrsEgZr5uk
         l3Yzde+udHeJSzVM5Yg6xunGsjkX+9LwdcRzaw/Kxr/5NDdHGzflwJwPvo2V5d6smLaU
         ogsAg5NgYVrTNaXf9zgkqqKRUgB11BJOZY9EPhrHRhv81X4Qx9qFdiqn6AGoLIk7lFBY
         EieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275902; x=1739880702;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KX7W4swHrFK90elybvizfO8dqWilJCD1C4Wf1fKXSTM=;
        b=B6Q0+4Hn14KH71RYBXTw9tLWKfC7JqQqqLbOnEOxOMRPo7LYlo7Jv8XSvkiecCHLEf
         9RBF8YDWj6CyZ3wVp96DtMNage94j15xfOV35jLDdJmBV4inHKwmOeP/+kBlFWOt4gVX
         fi5hOtLH1yDwQBwN83siMwXWWYyCgH8UJeQNbe4QrDnVHIFAq1WgyAFlXWcNlretozYI
         nCa98IBfdlsFt68lC0l0qMw02LTNP1idK6/QmOrWK98ubiHtkMEKkaiJo86S2HUJh5Sp
         Bi1SVtMNTT1CmyeP2WM0plco7B86JXQj9VLJI5cjP9ie/jtzFrA4V/AzQkrXKFNsO9wh
         N4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVUrFC2aDuE6qQO9VjUAjzPZ2N0A2sta6XcQfUSofnwoa8l/NavI/vWMu+QIytjW8lSLkQaCm1Dpk+ZjhkB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kD3Az/wvsxweOSOBnUEt8eG6uWN5BVPXxYo7fWY1K3/wHkbt
	FbM8EAgqAu1ZFO6u7j4mlcc56lJKQb/jLvzuUE4i2iWBsLYfwcKDQkt0Lg5Z9PLEzF+eDpeizQ=
	=
X-Google-Smtp-Source: AGHT+IHXKJom7Ftu5yovrPwrI10XpRYiY2qBWkBSoqtXJLa6Rrj1843rKF5OjouXY03AyaMgB0W+/vXsEg==
X-Received: from wmqe4.prod.google.com ([2002:a05:600c:4e44:b0:439:3284:878b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1887:b0:38d:e430:8ec7
 with SMTP id ffacd0b85a97d-38de4309088mr3236903f8f.15.1739275902164; Tue, 11
 Feb 2025 04:11:42 -0800 (PST)
Date: Tue, 11 Feb 2025 12:11:22 +0000
In-Reply-To: <20250211121128.703390-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250211121128.703390-7-tabba@google.com>
Subject: [PATCH v3 06/11] KVM: x86: Mark KVM_X86_SW_PROTECTED_VM as supporting
 guest_memfd shared memory
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
index b15cde0a9b5c..1fb6cacbbeef 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2244,8 +2244,13 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
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
2.48.1.502.g6dc24dfdaf-goog


