Return-Path: <linux-arm-msm+bounces-46539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25EA222CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B84233A57B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55DD1DF979;
	Wed, 29 Jan 2025 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZepKiAEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3941E1A2B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171418; cv=none; b=kuCz8KFoi/8UBTeW9hTJDo92VAccqUmV8RYNbMbkQyHOlLNKlcrT1GgKLEMyhHFREXPBoUg2WYId/kFo7A6HKjvnliDHP0o/Nu92Q8nKoA6XmPL19Yvah7aa0G8r5tbIfx4K9qcETAh/Rm7R7b6OIVjs5BB2NwC5FFvPvs1xLL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171418; c=relaxed/simple;
	bh=6Cj8x5trvu+E+gGL2Qx+VGp5KiXv1bWgtMUMwuTGKao=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jsBuxQyJFWFLfAXX2dJfM9Tu6GZ2uCxvcdFMNzkzTf51S9tG9mwFZi05MVrSmLvtnmB3I2p8/4tjMfQ8bIWt0mdYNgZlXmx9sXmwe8TfJ5AAu20W+8oAsYW+BtZfUxYdISYMc+0x7LsTeGjKlfDsT2C02rHph0LHkx58y2kOSNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZepKiAEt; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43621907030so56596445e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171415; x=1738776215; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt94aUdAvXZMqsG3cEe+u7ei8ysAwqoWnN4dmeRVKOk=;
        b=ZepKiAEtO4TQXcWOYGyQmbLWGZ1T6Cls6ziRBGl40r8J3HbEoU5vSVWGRJlLPxahzm
         JUxghFYVkCKF+DW6VZGyuh9ChPPcwcVw8WKhTtrcuoSOpDJbmrhe37vXouwbYUaXaDsw
         HvEb//vOcSorZRe87yWqu/1NknGtuH+JpzKKEibKEo+bY+nJWMuF1VZGGRe6+ZprMw6g
         zLyEpfXUnrLSq5izHPxWw1XZmOph6BsU5RNt1mJ91UZCZaDsbNIvfQ9uTfCUognQUdwZ
         ghA1A5M8Ri/QoFRtm4STW4ADAdijnDZxWUxmzUnTSap1XWp6L0i/kPpDKnzps4X83Llz
         nJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171415; x=1738776215;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yt94aUdAvXZMqsG3cEe+u7ei8ysAwqoWnN4dmeRVKOk=;
        b=Ioney81KQY6Z5bJIrchMqdqmvFT+s4RNMoILRMOTJYpnAikJobmfrlAeNy+iXfqB4N
         aX0M2dUDafzCOo3RWd6mRw+eyis+XekUdAx8YzDtRtMnHL7ZmXfuUpx8ZiKo+rnkgV91
         F54DK8hqSYioE+A9PgbAJLYriIYtAUTZ9NoEm45B1Cq9Vy1HJB2x8ksffwUkZhEhOmrK
         /JpP3IO+HlM6e7otH1ybgMet4mNQjHrskFrO4XbT5PC5g5TbjdsvHx9ggyj5HK2VL/ad
         Zzg7MRdvz02u9kSVbX9Ge8nTY8RYNGTecxtKFQozNC+FlZgPirwaaDVuLZAGZ8qA6ozW
         Q56A==
X-Forwarded-Encrypted: i=1; AJvYcCWPpO97HWQZar1T2EZcYlpV7iMq8LCzFyWmq6plJDZr1FgHTf1I4u5d0pZzq2f7QDScObrua0oY0VoGqEPp@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbQ/KI8nn0FzeR9I8k/MBbrAcUNapHQvEqOcj6fk1DeZgkMsQ
	+Il5rtola3xUqDZ6c7inY9VKw7Zm4514QyQjmQFI2qr/xUaO+AZ1yw7dJdYcPAxZzdtL4CO/dQ=
	=
X-Google-Smtp-Source: AGHT+IEVZD0fIeUKq/vmlbjgjG2X+DT3UCWZpcJ4Ann1EaDXdRvf6zyGqzjMjCufoNNThN4KeHC2zb1K+A==
X-Received: from wmbfk10.prod.google.com ([2002:a05:600c:cca:b0:434:feb1:add1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d26:b0:436:916b:aaf4
 with SMTP id 5b1f17b1804b1-438dc3c31a3mr45515505e9.10.1738171415500; Wed, 29
 Jan 2025 09:23:35 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:15 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-7-tabba@google.com>
Subject: [RFC PATCH v2 06/11] KVM: x86: Mark KVM_X86_SW_PROTECTED_VM as
 supporting guest_memfd shared memory
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
does not have any underlying support for protected guests.  This
makes it a good candidate to use for testing this patch series.
Therefore, when the kconfig option is enabled, mark
KVM_X86_SW_PROTECTED_VM as supporting shared memory.

This means that this memory is considered by guest_memfd to be
shared with the host, with in-place conversion. This allows the
host to map and fault in guest_memfd memory belonging to this VM
type.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 5 +++++
 arch/x86/kvm/Kconfig            | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index e159e44a6a1b..35d5995350da 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2202,8 +2202,13 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
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
2.48.1.262.g85cc9f2d1e-goog


