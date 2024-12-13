Return-Path: <linux-arm-msm+bounces-42099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A00919F12E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76BEE188E3EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5651F37A0;
	Fri, 13 Dec 2024 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="brPBSZ8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5B51F2C46
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108513; cv=none; b=ZnpnW0OTUoJiPy2z6Nbl98vNofwYqo5+HVFEA2P66me3k0/fqL57fDtcwRKDGqZEXSsZSt0G6J1o8iRf0jAp8v70MVASBQMX1tV6k/cFdUo9XdI0onaszVPlDk5EdBagYvF1W/mLIKe0m9ji5DEKsCucjia2Qvmg+s8qBR3Owdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108513; c=relaxed/simple;
	bh=nMkhlDZRvzFOXfebvNzr3xwtg7I4O+5NgpfnfSuZnDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ck59qlloZl1ZhPkRBmgwWb8o9tcstlS57MRnpd17EuxQ/zSIQ7XmesA10RYwud5n70eFMlyHOKHawhtPdmofyn/ux2KdYjHygsR8ortbHRtBTOOyftzNttHFoIZ8L1bqWPp3EoEzxgfa3cfeCK6WF4uwoMg63CWBqXd/TzftMNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=brPBSZ8j; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3862a49fbdaso319829f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108510; x=1734713310; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5zxHybLV3NWne95v7ysBYYUl2v+8+sVLD5dfkruHJg=;
        b=brPBSZ8juYxt2zyf6eCXcjqxhFcnO85lVq0WzYTOHtCd9Pa752fd3AsZBqZIT4B9n+
         H0KYrUhzna2lQOEA1qqe+6ZioZnYmFqN8WqbVQERMzoVFz8DGvwKY6qnsqW+iP8EuIhZ
         NFtGA2gUUtV8mAMBs9vq2A1xtURuyiCvz2YHpFxhtcZiG3sIvACFuaBgDBgl4ebw2+LM
         jot3IZrxVo1trTcfQI7Z3t0HVcTZNzRWZxOuDlM8a9+pcXCYdbUPPGGjC6TB+3L6of8N
         WFa+p7K2Fo5KDQJ3U2VlKXOj7/rAPakY7aeF6swdO5ua0CFjjrey3Ly20fddzyF86XmX
         bq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108510; x=1734713310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5zxHybLV3NWne95v7ysBYYUl2v+8+sVLD5dfkruHJg=;
        b=Q3Kap/RU869umlUZKlSaiy4twBGooEWKHK1VXkdSLtWUatBmCALYSXKAfwJKdUMzbf
         Lj6xph/c7zzzcL+AwY+D/mtvq4iJouAbCScc5cPEGTlrcSfgfLurRxGt7tCdrxcXUmmD
         PJv7D7Cbe0LYj9pGf8r4zzp0Zo4ERbPIEIBMVjoHtC7L+Pfg/pGlF0dWyZjfXQQLe6lr
         DIlF2amLK1NQ1oKaCPWDPb9RnbpwLtYxO3PuD/7oYw99uNMJsKcLfMhO6DbQplJjzUy8
         XjnyZEzdPvtRKTI27Lo4bCCNIL9bu4S3RBwcvLL6qw9LegkSHhrIsJCylEx5qAs+JOKl
         zZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGlWnlvCmF6YYs6/EgExRHipxNMvUOthaHblV/2CsOLTiMq0jUW8WCR/T1heCPYxqtSW7C49Mlz/MzzUb/@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvqlnGb+CtDRULgenAYc3EUeK3A4hJWWKuehv1irAvJkUZ4y4
	ikumsXtFjTVceZPneAZlSZIIMxigDKyZYJJDNzWYbr4+HQ/OSqRX34X2NyqZQaDRKmtGA5jqiQ=
	=
X-Google-Smtp-Source: AGHT+IE5qr7blgR8UT1xyGN9dbKV8Uu0Nxy8xzMzxQfp0eU0uQYPzB6TjeBHpyTiJ8UPA6pvno7rqFYahw==
X-Received: from wmmu14.prod.google.com ([2002:a05:600c:ce:b0:434:f0a3:7876])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4b12:b0:385:edb7:69ba
 with SMTP id ffacd0b85a97d-38880ac5f25mr3423932f8f.1.1734108510104; Fri, 13
 Dec 2024 08:48:30 -0800 (PST)
Date: Fri, 13 Dec 2024 16:48:04 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-9-tabba@google.com>
Subject: [RFC PATCH v4 08/14] KVM: guest_memfd: Add guest_memfd support to kvm_(read|/write)_guest_page()
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

Make kvm_(read|/write)_guest_page() capable of accessing guest
memory for slots that don't have a userspace address, but only if
the memory is mappable, which also indicates that it is
accessible by the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 virt/kvm/kvm_main.c | 133 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 19 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fffff01cebe7..53692feb6213 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3184,23 +3184,110 @@ int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start, gfn_t end)
 	return r;
 }
 
+static int __kvm_read_guest_memfd_page(struct kvm *kvm,
+				       struct kvm_memory_slot *slot,
+				       gfn_t gfn, void *data, int offset,
+				       int len)
+{
+	struct page *page;
+	u64 pfn;
+	int r;
+
+	/*
+	 * Holds the folio lock until after checking whether it can be faulted
+	 * in, to avoid races with paths that change a folio's mappability.
+	 */
+	r = kvm_gmem_get_pfn_locked(kvm, slot, gfn, &pfn, &page, NULL);
+	if (r)
+		return r;
+
+	if (!kvm_gmem_is_mappable(kvm, gfn, gfn + 1)) {
+		r = -EPERM;
+		goto unlock;
+	}
+	memcpy(data, page_address(page) + offset, len);
+unlock:
+	unlock_page(page);
+	if (r)
+		put_page(page);
+	else
+		kvm_release_page_clean(page);
+
+	return r;
+}
+
+static int __kvm_write_guest_memfd_page(struct kvm *kvm,
+					struct kvm_memory_slot *slot,
+					gfn_t gfn, const void *data,
+					int offset, int len)
+{
+	struct page *page;
+	u64 pfn;
+	int r;
+
+	/*
+	 * Holds the folio lock until after checking whether it can be faulted
+	 * in, to avoid races with paths that change a folio's mappability.
+	 */
+	r = kvm_gmem_get_pfn_locked(kvm, slot, gfn, &pfn, &page, NULL);
+	if (r)
+		return r;
+
+	if (!kvm_gmem_is_mappable(kvm, gfn, gfn + 1)) {
+		r = -EPERM;
+		goto unlock;
+	}
+	memcpy(page_address(page) + offset, data, len);
+unlock:
+	unlock_page(page);
+	if (r)
+		put_page(page);
+	else
+		kvm_release_page_dirty(page);
+
+	return r;
+}
+#else
+static int __kvm_read_guest_memfd_page(struct kvm *kvm,
+				       struct kvm_memory_slot *slot,
+				       gfn_t gfn, void *data, int offset,
+				       int len)
+{
+	WARN_ON_ONCE(1);
+	return -EIO;
+}
+
+static int __kvm_write_guest_memfd_page(struct kvm *kvm,
+					struct kvm_memory_slot *slot,
+					gfn_t gfn, const void *data,
+					int offset, int len)
+{
+	WARN_ON_ONCE(1);
+	return -EIO;
+}
 #endif /* CONFIG_KVM_GMEM_MAPPABLE */
 
 /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
-static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
-				 void *data, int offset, int len)
+
+static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
+				 gfn_t gfn, void *data, int offset, int len)
 {
-	int r;
 	unsigned long addr;
 
 	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
 		return -EFAULT;
 
+	if (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE) &&
+	    kvm_slot_can_be_private(slot) &&
+	    !slot->userspace_addr) {
+		return __kvm_read_guest_memfd_page(kvm, slot, gfn, data,
+						   offset, len);
+	}
+
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
-	r = __copy_from_user(data, (void __user *)addr + offset, len);
-	if (r)
+	if (__copy_from_user(data, (void __user *)addr + offset, len))
 		return -EFAULT;
 	return 0;
 }
@@ -3210,7 +3297,7 @@ int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 {
 	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
 
-	return __kvm_read_guest_page(slot, gfn, data, offset, len);
+	return __kvm_read_guest_page(kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_GPL(kvm_read_guest_page);
 
@@ -3219,7 +3306,7 @@ int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
 {
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 
-	return __kvm_read_guest_page(slot, gfn, data, offset, len);
+	return __kvm_read_guest_page(vcpu->kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_read_guest_page);
 
@@ -3296,22 +3383,30 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_read_guest_atomic);
 
 /* Copy @len bytes from @data into guest memory at '(@gfn * PAGE_SIZE) + @offset' */
 static int __kvm_write_guest_page(struct kvm *kvm,
-				  struct kvm_memory_slot *memslot, gfn_t gfn,
-			          const void *data, int offset, int len)
+				  struct kvm_memory_slot *slot, gfn_t gfn,
+				  const void *data, int offset, int len)
 {
-	int r;
-	unsigned long addr;
-
 	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
 		return -EFAULT;
 
-	addr = gfn_to_hva_memslot(memslot, gfn);
-	if (kvm_is_error_hva(addr))
-		return -EFAULT;
-	r = __copy_to_user((void __user *)addr + offset, data, len);
-	if (r)
-		return -EFAULT;
-	mark_page_dirty_in_slot(kvm, memslot, gfn);
+	if (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE) &&
+	    kvm_slot_can_be_private(slot) &&
+	    !slot->userspace_addr) {
+		int r = __kvm_write_guest_memfd_page(kvm, slot, gfn, data,
+						     offset, len);
+
+		if (r)
+			return r;
+	} else {
+		unsigned long addr = gfn_to_hva_memslot(slot, gfn);
+
+		if (kvm_is_error_hva(addr))
+			return -EFAULT;
+		if (__copy_to_user((void __user *)addr + offset, data, len))
+			return -EFAULT;
+	}
+
+	mark_page_dirty_in_slot(kvm, slot, gfn);
 	return 0;
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog


