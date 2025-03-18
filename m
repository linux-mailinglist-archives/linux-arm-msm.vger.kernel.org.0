Return-Path: <linux-arm-msm+bounces-51780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46171A67923
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D704D8850B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8D8211A0D;
	Tue, 18 Mar 2025 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OzCYUQwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D92116E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314722; cv=none; b=uFX23PJCJvCzzif/FTdfiOLJY4Pn2Hb9bo7Q2FsCmpJAijHk/Z1fEfvC7w4DCWdIw96xybUlm8OETHDC5U2JEalcLkJZvwz24S7J1W2vEeF0j0/tYowxlmcJOdObH3vmqnj9QC9GfxC9TEmBaIWO37EV/nkSX8LrQjDURkgfzus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314722; c=relaxed/simple;
	bh=jf+B2iS70Uwb6ZtEVIm5gx07fxqJEaEZ6wF2FlUqvaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u325Mjo9rYAB5/hw7jvpSvnz0bDAQuqdQP+EJE+9yHi3pA1CJKOhA8oUmbibZaAH4QdluxJbLBSvJOMO/yAOd+pihj5zfiOr1WMdIt/j+Qgpgg9qzcm/lXCBU38qwSDfGvL78SMh89wrVB8xw7yLjuvawE0ZdYIlTyXW960AciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OzCYUQwS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43943bd1409so23509115e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314715; x=1742919515; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fZ+plV8ov9Z8BdTSvHhlcpnsxWp2MsGy/DzmNzLSwM=;
        b=OzCYUQwSa40zpZxULJjvGJMA908t/BIgWYi7exYAX2mF8KRsw0aBFM1euiEPOMvee3
         xpjYU9Vvzu2bxpKQO5iEH1BA3ovHQKZ8ajqxo8DAwj7gvrkokFqkg32UHowOCO8cYF9g
         RmcjNN06aazcVxaBVqmSLMiPg/2ApKyeh8AU5eSTO+6zMJdzb5+V2VjeUaeD64J9zSDh
         2+qJQBr0sKNzS2zu8uVq61RhBMS0eXeFKRYmvywG+pRe2gKmXci0lJtacfjPWudKesAM
         2aKtMup0JBXvOZKepRQ8A74cmlqLim7byZVT46tGcHVmPuC9GINHUR7ScfImbfkNB48y
         9dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314715; x=1742919515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fZ+plV8ov9Z8BdTSvHhlcpnsxWp2MsGy/DzmNzLSwM=;
        b=ZnnmFYn0gUEpQDHZKXqE4M4MwWPLdzH8E+TxhjV75hzANNy+S6bK/xGZHlHu357SY1
         p9RGs9FuCgzU3Mb6XYYTk/c/5IJItiFakNwVRM0gjsx/zPejNIK5fxALqI/DJWvIduRq
         f89unSf6+TuqHEkSSvo36Aq/a5fSzCR+wrAh0QytnFL5vQjJg9El2R2z8jGIm3tNTBxl
         omLd0TMeGfmASq5cJXwEFgl7DM6ae5xjmtm3iUfRwAi4jjIfvNxBH6XhyKLhPminSjnv
         dDlCda5/Q/nl1q8dahM7t4XkI7iqF1M+hZwL48wMDmmP68AZer+hGpF+KWzUozjMKonS
         6ytA==
X-Forwarded-Encrypted: i=1; AJvYcCWbjISXIvvvmWk7TuN0K3u3cBbWBgcbG3BUTicV6Sr8cvqeHVAvwepG72LZFiuDzomXyNcJuEq6/Rwl3tNW@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvBO2i+8Z9QocKSo9q9WbG/fTR9T3w5nS1RJ944hY+A7W5s/Z
	+JrgPFx/vEtleVjn7FgSbyVH5FRjibK0UdgEtSvaOn+DuxazzwG99iBWTP+v6Yvb4+LI4VChuQ=
	=
X-Google-Smtp-Source: AGHT+IE5r6NZGIAwIlUsfF8t936pPzkXscDur3evGfQYik55htUq2uf1gHv3wGk0726Sq8CrcfH6U2o3QA==
X-Received: from wmbgx13.prod.google.com ([2002:a05:600c:858d:b0:43d:8f:dd29])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e0e:b0:43d:45a:8fbb
 with SMTP id 5b1f17b1804b1-43d3b9d46bdmr25410005e9.22.1742314714991; Tue, 18
 Mar 2025 09:18:34 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:18:19 +0000
In-Reply-To: <20250318161823.4005529-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318161823.4005529-6-tabba@google.com>
Subject: [PATCH v7 5/9] KVM: x86: Mark KVM_X86_SW_PROTECTED_VM as supporting
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
index 32ae3aa50c7e..b874e54a5ee4 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2246,8 +2246,13 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
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
2.49.0.rc1.451.g8f38331e32-goog


