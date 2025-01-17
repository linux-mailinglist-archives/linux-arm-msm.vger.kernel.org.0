Return-Path: <linux-arm-msm+bounces-45449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DADA15463
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C638E3A7956
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6B01A071C;
	Fri, 17 Jan 2025 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aS1JJ/Av"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919E1A23B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131439; cv=none; b=RfBkHQxf86qca1TQvaC9npBVEbxS2s+4QTl8HMoXc5vF6IFj28FsYdYonNRNvPwSYjq78+Hzpcj8vJNKX6tfo2eCdxsGDBC5sG22LBSonWrxC5ph0neyMz2DXx/U78WJjx2sKNBrQ68hWX7iPwn53XooFmoZu4mIje04dx+o20Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131439; c=relaxed/simple;
	bh=ov/aP3Y+4MuQtfaO1n89Q3B+yIR9wQkukgo/NFRSto4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cI5B9CqUF27euD33y2pOXus3I9wyZZAJUj0wKfUez9PNu9WkpUXaqo1d0MiiCuS7mc2Wwm1s8wg9OTmYysq6amlbXMemEybddLg0muyi3cwJpE54RkqnYu7zFjv3NZ9dkNj9N3FeWk2yVCjWxhrG0DHqa7FnuBx0FWLOeI06bWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aS1JJ/Av; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436248d1240so11066655e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131436; x=1737736236; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sA2koc6FnlEdGg8+Jdk53M7JzqxYQGk2KRekvS8wCYA=;
        b=aS1JJ/AvV03qQPujlgLlYyhJtr/1bePn8YTqOJJADqRFga9YzbKhUxfg72OzGR25RJ
         FYKhbi9KMLJn+ZgYWBRkwiaboXlJwMTA4sGM8koXF5CH6PQ9jZypKmwpdUhDRXjrVLYg
         LopHWYlc4OBQ0GDP6MZUDMZRM9g1Qfu41Zt5T9ntAy9odUMh1ovjUAM0PowHIFv0Xym1
         zkYXpFgpE4mpAy31XFq/hP/MGrKNaSz050MbWNGOaSaDnbE6MAT94bZPnoErDpVlR6TU
         A5+5tBq9+iXJgYc1rr1uD3ztltt1mdPtyZzqgwh/oms9cEZ+FmvwU3LhpUvR2YJOzCdD
         aj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131436; x=1737736236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA2koc6FnlEdGg8+Jdk53M7JzqxYQGk2KRekvS8wCYA=;
        b=GylKPGq65v8O2GcuOg4RbSlWCf9KVI74CWP7IfCFDIHmIFeaE9PXlolN6uEOGPhfbD
         1phcAgndnp0RgFLpRsP59qR4AfeckcNzUBlTb6NZAQe+hTKMzyXpBJ4iRBcDBiGNwf2K
         o6vX4ANZLMXCOQtQB6Ittt5yDLte4tDpcFtWTeqWtvvu16kmXNyI6rlx7wcpeD6ijmvw
         TSBtBW7Rv3dauv5+2l1MQfxoIo36Wh5poJ39GAYvvp2ijXekzVo6ViipTLJytOKVuzH1
         nBnMn+/sEXadnZ/Gz5dvCMnyodVownCtQIFGPM5mSVl8PEaLA4ldlM5qSKK53O58Q2Hc
         y4eg==
X-Forwarded-Encrypted: i=1; AJvYcCURHLVPoMzon1XytIxodyIg1YqEf/gXjOUPzO5XC68FC5kjpkawaRZb9p8I4PhA+ss8uU4817pQhX4pkEpS@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1fMruTxhZi1/S0ZyeqOIlBJ5DZI1JVFdl0Wp61UFoKG7+IXx
	KyBxfGIaGq6lcHorTL4Bjr3J2Xp5Hx9xDZGfFVe37Bzr2aN25yX94CfW9ILNPB8924r8q9sjdw=
	=
X-Google-Smtp-Source: AGHT+IH7ncc07mfLHgb8ED3VwsB7jAbdBmUiBlZXXQcjVPwCGbKKIuWYuOy6q8Z5dH2n+Fog8Taxczd8hg==
X-Received: from wmrn7.prod.google.com ([2002:a05:600c:5007:b0:436:185e:c91d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5486:b0:434:a10f:c3
 with SMTP id 5b1f17b1804b1-438913cae48mr33877825e9.9.1737131435727; Fri, 17
 Jan 2025 08:30:35 -0800 (PST)
Date: Fri, 17 Jan 2025 16:30:01 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-16-tabba@google.com>
Subject: [RFC PATCH v5 15/15] KVM: arm64: Enable guest_memfd private memory
 when pKVM is enabled
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

Implement kvm_arch_has_private_mem() in arm64 when pKVM is
enabled, and make it dependent on the configuration option.

Also, now that the infrastructure is in place for arm64 to
support guest private memory, enable it in the arm64 kernel
configuration.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/Kconfig            | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e18e9244d17a..8dfae9183651 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1529,4 +1529,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1poe(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
+#define kvm_arch_has_private_mem(kvm)					\
+	(IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) && is_protected_kvm_enabled())
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..fe3451f244b5 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM_MAPPABLE
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.48.0.rc2.279.g1de40edade-goog


