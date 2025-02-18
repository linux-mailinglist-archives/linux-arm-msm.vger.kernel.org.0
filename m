Return-Path: <linux-arm-msm+bounces-48410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B55A3A43C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D700175261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53FA270ED9;
	Tue, 18 Feb 2025 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nx/EwAxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C2F26FA5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 17:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899516; cv=none; b=ihTbKtduSVXa+rrtZ6+yzt8FijUrPEt1VXR4v6xFA8Ja/GFQzFCCAHgTqD4NGEXJsFKSW5KV/AURXteReRdRlGyWei7rIfj9SB5K2FxBX/oVlpkvTMYULH1UXJkovcrQcqFi3weMGPkvgYMJnFI1ad0W4gBNMwCj+oxD1chvhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899516; c=relaxed/simple;
	bh=mNYbzmjpONWEgttJIZvgUptAcnSe94VpmpCixNC/n8U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MN3B88rGzV9piqO+Z+CVTe104PQ2tL/ninNNxPPR5RS1SQDGFX3YA2dMv02gq4iVmgav1gmO1O/Pr9UnrKhKXS9pIQngEyufnZm6QrfOX2n67T6HEDfDFmWnpcDiUvruSj4D2aa9uG4e25hbdUGOE81RWKkP/MAVFHSmj4Yu9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nx/EwAxi; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38f338525e1so1745463f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739899513; x=1740504313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGoNX/Glm+WMVatJb0FvEqCK9D+bw5+r1sAfGUD7IRg=;
        b=Nx/EwAxiY2+UQa7+fyGgMNp916DRlxiKZHqf8lF1le50gVKBXRo5dTeqtOytg8By6N
         Mdku/DjB/TaSqFPePZvmjGqmMyPNCKIzHlMIzJWQe99PSM7ccd7HPwE4KVusatCMe9U4
         hKtpX65rJzqXyhUEdg4SIhH5FdKZ4ZE29qttkzR9N/YeanD33tdYwSnqrwRfZrSqJ/Hr
         NrPsHITesQ3LQxwr/LobqTQPyHJNL8w+Ky2nOvop4Gd+iRDcvr45lvSnwmElcliUbTT+
         6zNi6rLPFqnydWSHL6zshN2B0oCL/57uY6uIJJx8rYea+9CUfy+ZNu/0br7VeMfoxCFO
         wJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899513; x=1740504313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGoNX/Glm+WMVatJb0FvEqCK9D+bw5+r1sAfGUD7IRg=;
        b=SnHnrbj4w7ZAgrzE7t++/cN2IKkQkue9RsV88t5CO3zSHa0Y6wVkm+XPL/C186IMYX
         u2nM+4NIcy5978G+kGD1jDqfSjs+/1MNqthdbvW+SHjiFL6gG2P+EBbYXCO92SvXe7MU
         w1t3V+HMBppoabJvY3Xi0LInovRHb+e3uy8grGnbvJitYpgrAGqdceQVliG2hgq5OnCt
         jj4fDV9Wyp++uFAK3nam45LEwpfTmXiRCazGRrwEdNqB5MtuqlumCt/MiphmElWoMsWG
         noWxK7xiqkl9GQ4MnU0dkDSfbEmvJpO/lQHhUcRXMLHmh8iX1DBNfJyZuvJKEEHSFZSS
         JE6g==
X-Forwarded-Encrypted: i=1; AJvYcCXN5DFel673CpqZAwKOmHnjljGQe6SDi2725jBp6umqVWhvOF0V5Dke/Cr0lplQXSKil7s2JrAel24ojvzd@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0tipCFXdS2JMWvJaRgEKlP5/wm5tKKjMq034SrRgR0PDBNw6
	nDapAMn0yVOqw/D6VJYcLUH4PUaV61Jwp9ljeyMjf2eC2yyv8GueES/XbBaGH62M0CqeK6eK/Q=
	=
X-Google-Smtp-Source: AGHT+IGyVyR6Cc0fgExYmIOuVxu5DOaZXMab5x34lQgOdyuWaPWAIeIyXdXc2E/LoCQ4Y0Nq1mwGNRpbtA==
X-Received: from wmbbh16.prod.google.com ([2002:a05:600c:3d10:b0:439:985c:9199])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:47c9:0:b0:38f:4493:e274
 with SMTP id ffacd0b85a97d-38f4493ffe2mr8630057f8f.54.1739899513086; Tue, 18
 Feb 2025 09:25:13 -0800 (PST)
Date: Tue, 18 Feb 2025 17:24:55 +0000
In-Reply-To: <20250218172500.807733-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250218172500.807733-6-tabba@google.com>
Subject: [PATCH v4 05/10] KVM: guest_memfd: Handle in-place shared memory as
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
index f9e8b10a4b09..83f65c910ccb 100644
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
2.48.1.601.g30ceb7b040-goog


