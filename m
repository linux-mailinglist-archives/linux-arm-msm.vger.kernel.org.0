Return-Path: <linux-arm-msm+bounces-59588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F42AC59C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35D89E09EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C7F283129;
	Tue, 27 May 2025 18:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XDu7OiOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E238281375
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368983; cv=none; b=Ki8A0tb9TlyUI1pXHeI1RDq/gq6o/z3bBtQcX5ADVziJ7ybVw1QUERdHmGLSrDl+AFitSe3T1RunNpwmX/k/ZhU6wwtVAtgqyaRGiImD+Cs2cNpOPEKCNzyFxxz5dmeBKQVvF8E/aI7Jq456XrFDVsSB3NvvdoQrL0u011UeUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368983; c=relaxed/simple;
	bh=EYZFk7r1z2ql5hNYNrrRqdhAJfESDaEvZFcM+jE7e6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HKcSmGBvXMulYoMC+Vvp+yxbfkKxegJrWS+JtfNRPMN+7fFbOCKIlDxMbddnnwvJ1TRmQDzs8Nh0pwWNZh99lyPhZ0/mjfSI3ghfn4mX8je0X3otm3eZ3AYZ+La9mX9me4pYNxr5YiO4bc00K1tCPz93LIDU+ggpDn8oItcaX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XDu7OiOS; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4cceb558aso1554832f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748368978; x=1748973778; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lc19MQ2L83GFf4VOSaJH4jzsZICcJBsc7b6CwdqsbsI=;
        b=XDu7OiOSrC7QY8ovU4hv364sWaCpoXcgzuXtyRKyHRU2uFMU4MUdjOrpXBaXzOUpSu
         9T+piab848QWRNNvLr9yRYiRpt/hCU3jBn4et+sJIaG9RzyRzOHobh+Qk2e9CyOluXtJ
         whPz4Vb5PWSze8KGN5N+qGbwGiprvmvC5ks7hokz9Zr2yTgp94vgJ9c19eZVB2i2sMBP
         BwedcWOi6GWya0uuGLatt61PlDvixko7S0cOwV8cP+bgJD2Pmv9Q9/jcPdrAfIWhAfgc
         rbXH5j9su1TOL0nmD/JwQt4hK6KlbpIqWjgUC/sYbeoThxUYiGkBW1njl1wKaLHU7tNQ
         fGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368978; x=1748973778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lc19MQ2L83GFf4VOSaJH4jzsZICcJBsc7b6CwdqsbsI=;
        b=tkGJVs4qG14fApZF9LD5MI1n2+VArTPVzXvg6fu4/DAHaUjcq7KWaF4OwWpWz02d0A
         UvZ9hIjNSwpjkhZrZxJzwPZqHbPqx8hnNJfUWXsOoWe8ERlPV9DJA8XfZpln1q7JCNEY
         /7Kly/EvdPf2uqkTvP9AQ5revVWdnmck/VBsJwkE7GTsO2Aed5PIFXVCIybnbm+C6M8w
         pzYO0DYNsEIARhW2bmte9wPHiUBryysoLQ1fGepig4ASqUZvoXnmypoA8oL7RjT5DvJJ
         g+qIZGzc1Y5K47pJnAuyXBlSsvOJgNrdTrbx8g9eSzpK9Qi9GYjJYux4sbqFerzqJ7ec
         i4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRv79qlzGmCanw6Tu/XydaxfuHiNp8CbcpXHp/QYhEg82u4pUHjsPfPTKbFdl73wJ7+51etYn42Pgtn7yl@vger.kernel.org
X-Gm-Message-State: AOJu0YyL8wyifGSmuK5aQluFSCGcDuwnsU7W/ju++Dm9stfhV81YMzp2
	OQDX0jwE7klFVgJ3ycHMCjF+IzRx2uOoiV22qUJwMlDjbMUsbQBKAt3HZ1V2YW4pMZglBrKUSKG
	drQ==
X-Google-Smtp-Source: AGHT+IHLK7VmvWcDZxFTXIFk0nAZ8w70lzZCIbV5EYiVy8sWjQnhG8dciiR2hqbLtLd2GCHLUt22io7peQ==
X-Received: from wmbfl8.prod.google.com ([2002:a05:600c:b88:b0:442:cd17:732c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1881:b0:3a3:67bb:8f3f
 with SMTP id ffacd0b85a97d-3a4cb499cc0mr10465551f8f.53.1748368978280; Tue, 27
 May 2025 11:02:58 -0700 (PDT)
Date: Tue, 27 May 2025 19:02:35 +0100
In-Reply-To: <20250527180245.1413463-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250527180245.1413463-7-tabba@google.com>
Subject: [PATCH v10 06/16] KVM: Fix comments that refer to slots_lock
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fix comments so that they refer to slots_lock instead of slots_locks
(remove trailing s).

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 2 +-
 virt/kvm/kvm_main.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d9616ee6acc7..ae70e4e19700 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -859,7 +859,7 @@ struct kvm {
 	struct notifier_block pm_notifier;
 #endif
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
-	/* Protected by slots_locks (for writes) and RCU (for reads) */
+	/* Protected by slots_lock (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
 	char stats_id[KVM_STATS_NAME_SIZE];
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2468d50a9ed4..6289ea1685dd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -333,7 +333,7 @@ void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
 	 * All current use cases for flushing the TLBs for a specific memslot
 	 * are related to dirty logging, and many do the TLB flush out of
 	 * mmu_lock. The interaction between the various operations on memslot
-	 * must be serialized by slots_locks to ensure the TLB flush from one
+	 * must be serialized by slots_lock to ensure the TLB flush from one
 	 * operation is observed by any other operation on the same memslot.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
-- 
2.49.0.1164.gab81da1b16-goog


