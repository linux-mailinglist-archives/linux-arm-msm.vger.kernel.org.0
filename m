Return-Path: <linux-arm-msm+bounces-51182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E1A5E344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B3A3A9C32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530251DED52;
	Wed, 12 Mar 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XKyN6VIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851392586CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802320; cv=none; b=C+KjC5P1OHo97ewQJW8n4AO9u7ZZx+WlX5kcWkX/PTl+T6VOhLak8G1VU5WmFaFTyJpK588SkjDerb7hXTHbS6MbDhoLG1kEdzsKyRxNHo+zN2DuwlMEnSJdBOOuLi9EvkOq3tVUgNXyaeWmUV4H6n92nyKJ5GAwsSgTIAQesaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802320; c=relaxed/simple;
	bh=7edp0M7HHdxVW9XbqQLME1hZfP7MTAt+1whGabMX0dY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b4EX+FWJkzuSw/+XCceHP09MRz6+RcZWYuawyOhr3YOFLTjqFSpaI4DxXBueB4klEoboyZ8/p4o788IvaYDW8r56pP4on5+eUxEyk8IQNtYghFv6c/SaBa0v5ERmhga89wz9/NSPRARL7DL7CaJuLKoTsZdvz+uWA80NB/Ed+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XKyN6VIR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-438e180821aso337675e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741802317; x=1742407117; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntFxQQNzKKyJM2lZzgIL3uflnY89YGPG26G1RQYhb04=;
        b=XKyN6VIRtdA0BAWlGmvHZzE+xJdcaWvqNntO1pu6ILQYq5cVlTcnFm2RymtzleuSvC
         SDM/qTIrc0mjddtwFr2WzLV7JER12JfsrbBKyuViOsHz7hXKYthRCFjGIZDoIZFQkjT5
         6HeBy62JGevJi1IgG0JkIreXMxI/vy4VE4A6NdYT9JWqfb02PXbjMAKqht04U4hXMLFf
         aDJegy1YMLArhrjVJ0osPzODGiR4JcxOgIkhT6uSA3A905zMiWC+Ep0wmrjAaP1Dx9+d
         dTETVbst6dAc2HPzOLefIg3upps4JXQHmFDhZ+7aAkMVjVlQumR8h54/9zybCpieMLU+
         ey9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802317; x=1742407117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntFxQQNzKKyJM2lZzgIL3uflnY89YGPG26G1RQYhb04=;
        b=MS0RQBf7IZ8h2nWzU0dUxCFb7DR8pAvmgdxzrBlE1KCcgx+NpG8xSmAI03OHllHfkF
         KfdVL4SCAyoN51Zcmh9Z7n7kUaT6ICS5sfDw9inkYS5Xo8c1QGIXNJsKPtCpbwyuWkuZ
         BYIlADWt8oLXgA9TuVpOSd9gHrzT6KEfsAFINApurEv5uUIql0V01Io8XzV0Lz3W29Y9
         V24iuUrNGUDHFJLSmmZNIBeDJJj/v8XJkXv/8c7qFyRW+UiI1JQy3qgnbQIyinGiBcOz
         mHjT3UjT2WJPgisymwV9YhPyHpT5bfP0UbFuQmS5X317X4JGBiAxlzCGPlcmjtiuxKgP
         q1XA==
X-Forwarded-Encrypted: i=1; AJvYcCU5H2clDohSRa3zlA+PaMP/IhbDC/xYf2aTQ28If+kD9G/aPBHA8Pb0WjVzAlioyl7jZyKhmhrvhfDiWwCv@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpCHmdDPS/8JNbt4JM8StnWXv10mwnmXcWfyAsWg+jv/DUwbc
	O6izBTG8y1FD6v//pPXbqi2UtJGLQAKXqQYUD7VyaLcE8K1ZbPBNjYZEmn395cZSqVnXwk6wdg=
	=
X-Google-Smtp-Source: AGHT+IHx2UGNc3sxVMFxnpaPRw6zK2nrSSbS+Z6p3nzgLh0TKg+a144XW1OZZX2F42XTW0aAYQXWeSM0QA==
X-Received: from wmbhc26.prod.google.com ([2002:a05:600c:871a:b0:43c:f050:8fdf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4751:b0:43c:fffc:7886
 with SMTP id 5b1f17b1804b1-43cfffc7ca2mr104987635e9.8.1741802315742; Wed, 12
 Mar 2025 10:58:35 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:58:18 +0000
In-Reply-To: <20250312175824.1809636-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250312175824.1809636-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312175824.1809636-6-tabba@google.com>
Subject: [PATCH v6 05/10] KVM: guest_memfd: Handle in-place shared memory as
 guest_memfd backed memory
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

For VMs that allow sharing guest_memfd backed memory in-place,
handle that memory the same as "private" guest_memfd memory. This
means that faulting that memory in the host or in the guest will
go through the guest_memfd subsystem.

Note that the word "private" in the name of the function
kvm_mem_is_private() doesn't necessarily indicate that the memory
isn't shared, but is due to the history and evolution of
guest_memfd and the various names it has received. In effect,
this function is used to multiplex between the path of a normal
page fault and the path of a guest_memfd backed page fault.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 601bbcaa5e41..3d5595a71a2a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2521,7 +2521,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 #else
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return false;
+	return kvm_arch_gmem_supports_shared_mem(kvm) &&
+	       kvm_slot_can_be_private(gfn_to_memslot(kvm, gfn));
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


