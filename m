Return-Path: <linux-arm-msm+bounces-46538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D69A222C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ED027A22A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637241E0B77;
	Wed, 29 Jan 2025 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZiEA13Vn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45401E0E15
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171416; cv=none; b=mvoBEH8OhfomW46XA0EmQOyW97myBTnyfbl+I3Za6i8e/HddeXg8w8Ivo809C8P+2cnxY8GlnKpz8J9TmJnY4QITjNtMpGwOLxY/TCUscGE7Vjv08aYJoCmJH8oVd++tIBP03P+LbAugvYlzdRz3P/qdQGT346e6BzMFOFw3V1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171416; c=relaxed/simple;
	bh=Gv2OZPl1bMY0RPBa4hp+clbwB5r7GxE0cnVfY9KeGEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Am8GozBdHdnfYM+ucwwOT8ft9+AlWD82zO5Sw26J8/Ik5rN3IemVZn9xe4mIf0XjiUvCvn3gMqNbFbFXq3hhYfi7ONs4LnKdcGCzapFV6xDGaXqMRACkfcSVS1NT7WEJDbfxXAC4wSUA79vSc4Fs+pKSbFwnSyoXlIilbN1O230=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZiEA13Vn; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38c4a819c0aso1682967f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171413; x=1738776213; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUYJLmVCJmslu0EZ70wF3BbY2jfY7y/4QOInoyL0YSs=;
        b=ZiEA13VnHFuolh/qNk0VzlrLTaxI19RllMzy3/chwXVJ6d2LYwIhr1inrOIReahaBv
         OCzBUnHtIJ42m0+du1znjaEbcwfdZ6jpFLJsgsE2p6HYFiAX7ET3KvssAQ8Eyb8kpaHE
         NSf1atLsPf2IOsd6J5RQYbQPeP2c8KzJPDAUb6IddpC7gV3dwt1gKM2gTftFZV99v7wl
         Q9GXfkcVU3J04o7gwVYdOotKgvBpETM+YXHIck08V0Rk3Rftu4X4T4U2QF8/sxC7JpMg
         0AraXt2sVcDyfAtR7YTC/GoviWB8imGokmpEK4DUuTMEL4j3mePg7mx89sdQDc6NtJ4i
         j4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171413; x=1738776213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUYJLmVCJmslu0EZ70wF3BbY2jfY7y/4QOInoyL0YSs=;
        b=WDYNPIqHSIUnxWn0ZTxYqbCx1BiBhQ0YbbW94Q5npaq++W+LI4R42af5xmxSHdtyLO
         zmH1/hWeY/QKBIcqr/N1tWunvetqNDd4Tq2XByP4DOvggMA+zUnfHbQmwnsFDJ3KddqY
         83i2twuvBlVOJL9XwZIYXytulO16SCRE0U0ptqBSnNhgJEzEAEZa+5qW+d95aQjlXxDC
         DFA7gxXhAqSSLe6UJtQKoolm6yVnSoztoHxZs8QHMhrqO12ryWFrNG1v6kmsPaPf4R6R
         smByGNiA0KgUF5H09oMl454MbUxCFRezmfJWhh8NccCADN6BpPaVhQcBr4kwCbu5Een/
         4VHg==
X-Forwarded-Encrypted: i=1; AJvYcCWr+eViwshGo+rBW1yGejcPW1qgz0Qc5EfNKPxm1uCMB1IgS3JU30UPkm83CONPhBHfvENfDftLcoz6+A8l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+IczUraKVNCzvkUXQo6rEoU1Q3jeXUj+nhAiC6s8eqHs64fa
	A/gg2UqRgu1tAHLCga6OzJIu+flnVJ/0uIutfuiczH48M3it0UjRILzdg3y4EeT/Wtc+T72BXw=
	=
X-Google-Smtp-Source: AGHT+IEzz5y+mMN5wvE2N/WLUB8ZD0NYIc/aKjbCfNBDRcZwxKLOkunY2FkpKk8kIiLC8nBZsvQDYPVFww==
X-Received: from wmrn34.prod.google.com ([2002:a05:600c:5022:b0:436:3ea:c491])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1863:b0:386:37af:dd9a
 with SMTP id ffacd0b85a97d-38c5209037cmr4744111f8f.35.1738171413076; Wed, 29
 Jan 2025 09:23:33 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:14 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-6-tabba@google.com>
Subject: [RFC PATCH v2 05/11] KVM: guest_memfd: Handle in-place shared memory
 as guest_memfd backed memory
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
index 408429f13bf4..e57cdf4e3f3f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2503,7 +2503,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 #else
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return false;
+	return kvm_arch_gmem_supports_shared_mem(kvm) &&
+	       kvm_slot_can_be_private(gfn_to_memslot(kvm, gfn));
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-- 
2.48.1.262.g85cc9f2d1e-goog


