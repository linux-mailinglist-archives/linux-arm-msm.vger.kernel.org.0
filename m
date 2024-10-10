Return-Path: <linux-arm-msm+bounces-33816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D01F99815B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2869628500A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B221BB6BF;
	Thu, 10 Oct 2024 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l38jt1YA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD41C3F18
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550784; cv=none; b=kSlqk15a5fGJpnaYKmGAMo0QTx61OrEIPSsv/aUAmBNtihW4JBvDKt8n3xk4mQSuxdznSwj7QYinF7sFxzDkLd0QvVIG+BWmrfKu1mesinvfaRjHWH3JjI/P6C5rIKMqcUcmGFHD6/6I2Q+//DuH8osXoVMltC7d1Lm3cdGsceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550784; c=relaxed/simple;
	bh=N/7Xc8SNlJ2wkKm4Jwyhcut9fezoJcEGmUEf+H2ES0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A5fWA0yzWNRi215NfmnzUVAKq/Xrfj7xZeNuJDUEgsYb3VklGxSLZuaOonQe8LLC5ny1uJmx6hCa86yprQnJ4YhwOlnurLrJZgghGNWCWJkEpcZ3Kx2Rjl2cXOjIizea4To+BiFerC/Qs99LkqB/7HjXvVqHWyaowYkx3yGz++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l38jt1YA; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-a994d8d6004so58371166b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728550781; x=1729155581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zi/pjPr4ta3drldcSk6p6o77eOYFs/2AcZb+H+YLVPU=;
        b=l38jt1YAF+eJSiyqiHD7yf7A2HLOcBNC18aR8RrbUn7ugOkQ9Ur04RIfuYRv1Ily8X
         JJRkzEYX4GysvRe4tR7G0zS5V2mLbT2k8esC8N4R1BNKQEQe39KQXmPBKcYLEYsRS3Ak
         go5gHpHhxdrcZ70SUloIe9G9qwyPG4y7yloHV2AXZDby7aMCy/HzXdHktvTP+WRw87sQ
         sjyxua4X4SMWqH4/3GvUEvlQ4RvDExQC/dYWrkxIjOXZa0C31VOw/Tj8eFos2namoTeE
         aTPKBlHFyzFzk41tSQyVrESA3vSm2xsX1ieZ+LUoc/KCRx92IPKYBvZOUytR67iONmno
         tMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550781; x=1729155581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zi/pjPr4ta3drldcSk6p6o77eOYFs/2AcZb+H+YLVPU=;
        b=Mh5ttn5206KnQxdqw3SwdKNGFp7XhpaJHCRDyXmoS/rlxapOeyoBOOXZD1oxMPK8Az
         JeBNked2DRWnTtDgqpCjl4lPZ0Z8Om+LhcT2mB07MJ6mQevHQR/zTVDRVS35LyzykncC
         KBGJjR5kQ11V8WuLGY7ltYCU6UYZ/w52ilRNRnJ3n8UfUbkdAas3usU8J2Flf3BldNkY
         bK3AneOd8wlNzAYbzzVWjhvUOcQN5PcB1GZjxfjeoTqKwgR5a+ltraz2vg9s/ZYpXAQF
         rZ65iBjQT+maaGF5BkhsAnOuGcUg+TAeqBZYC97Zzt0wYP0SBjmD6CRFuz9q8bziPWnh
         bGwg==
X-Forwarded-Encrypted: i=1; AJvYcCWzbeW3kA0vwBLOHJbHKeKr7vZp2dCUfbFsUJXLgdrnjwdS2Ti2LF2Jm+lGDy+eEfo4pPOy3PhfZ1wiBSP4@vger.kernel.org
X-Gm-Message-State: AOJu0YzfEQ9GsH1WP1YqZPqvNr2r66QIoVQyUTj9PofbudjH3/ySgZtB
	KJCZ1BC3Rc/3KcoAocr9eAxHjbhTYNx4TkVMTex82SQVWKnJ2lY4YgfU3gYEHu2EUIeGUCFzMQ=
	=
X-Google-Smtp-Source: AGHT+IFJwsaDfsra9si5hSwL5TQTTo4RhmMq+iKHIyBjxFdz3SDsa44kizohADHJBxPg0EWk39rrAlUrlw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a17:906:e207:b0:a89:ee2b:e2dd with SMTP id
 a640c23a62f3a-a998d31c253mr128966b.12.1728550780668; Thu, 10 Oct 2024
 01:59:40 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:59:22 +0100
In-Reply-To: <20241010085930.1546800-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010085930.1546800-4-tabba@google.com>
Subject: [PATCH v3 03/11] KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(),
 which retains the folio lock
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

Create a new variant of kvm_gmem_get_pfn(), which retains the
folio lock if it returns successfully. This is needed in
subsequent patches in order to protect against races when
checking whether a folio can be mapped by the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 11 ++++++++++
 virt/kvm/guest_memfd.c   | 45 +++++++++++++++++++++++++++++++---------
 2 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index db567d26f7b9..acf85995b582 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2464,6 +2464,9 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+int kvm_gmem_get_pfn_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
@@ -2472,6 +2475,14 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
 }
+static inline int kvm_gmem_get_pfn_locked(struct kvm *kvm,
+					  struct kvm_memory_slot *slot,
+					  gfn_t gfn,
+					  kvm_pfn_t *pfn, int *max_order)
+{
+	KVM_BUG_ON(1, kvm);
+	return -EIO;
+}
 #endif /* CONFIG_KVM_PRIVATE_MEM */
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 4d3ba346c415..f414646c475b 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -714,34 +714,59 @@ __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 	return folio;
 }
 
-int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+static int
+kvm_gmem_get_pfn_folio_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			      gfn_t gfn, kvm_pfn_t *pfn, int *max_order,
+			      struct folio **folio)
 {
 	struct file *file = kvm_gmem_get_file(slot);
-	struct folio *folio;
 	bool is_prepared = false;
 	int r = 0;
 
 	if (!file)
 		return -EFAULT;
 
-	folio = __kvm_gmem_get_pfn(file, slot, gfn, pfn, &is_prepared, max_order);
-	if (IS_ERR(folio)) {
-		r = PTR_ERR(folio);
+	*folio = __kvm_gmem_get_pfn(file, slot, gfn, pfn, &is_prepared, max_order);
+	if (IS_ERR(*folio)) {
+		r = PTR_ERR(*folio);
 		goto out;
 	}
 
 	if (!is_prepared)
-		r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
+		r = kvm_gmem_prepare_folio(kvm, slot, gfn, *folio);
 
-	folio_unlock(folio);
-	if (r < 0)
-		folio_put(folio);
+	if (r) {
+		folio_unlock(*folio);
+		folio_put(*folio);
+	}
 
 out:
 	fput(file);
 	return r;
 }
+
+int kvm_gmem_get_pfn_locked(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+{
+	struct folio *folio;
+
+	return kvm_gmem_get_pfn_folio_locked(kvm, slot, gfn, pfn, max_order, &folio);
+
+}
+EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn_locked);
+
+int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+{
+	struct folio *folio;
+	int r;
+
+	r = kvm_gmem_get_pfn_folio_locked(kvm, slot, gfn, pfn, max_order, &folio);
+	if (!r)
+		folio_unlock(folio);
+
+	return r;
+}
 EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
 
 #ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
-- 
2.47.0.rc0.187.ge670bccf7e-goog


