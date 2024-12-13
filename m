Return-Path: <linux-arm-msm+bounces-42095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8D29F12CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBD62281DC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A90E1F12EB;
	Fri, 13 Dec 2024 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o6oEiOVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0461E47C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108505; cv=none; b=asYR4IWlKQQdmF2bh7I2g6D6M/Q7RplMlZScGWKV0hIBkft4RcWruHOQKZNjCmjYvB78N5AIPo/L5MDmd2WTiFr8V/jnNEuvCxHiFyBZ0H0aDxg+bZ3cJBDaKcVCshr2Zq+Oba15JcBFArpz0JzBUx9UnNsERD2QT8f5ZyEJW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108505; c=relaxed/simple;
	bh=zcjkMhxoY1cdUKFs54GzqECSAze9A8v0uUzrNhnwYfo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MNOn9+EF9dQ4kLcazR1jWK3XLWu4i1TUdGL4jGu046GHO0QLAScujBkV60GE6+fWXrBFjD2CwMYmr35anPj4QdsZSzwUaHXm1idX9ayFCRavr9IcXZmtu3wGJEWBW+VWx/pwUUYt73SfayfHNS1VJMLZuWCkWUF155/i6EFfyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o6oEiOVd; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3860bc1d4f1so1298467f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108501; x=1734713301; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aq6uxvVbG5xxzgybZF/l/V4c8HPIK8uPOyna1cvYXWA=;
        b=o6oEiOVdDIxVCohrx0nZINc24jdT4HyfALhdEG5DdtWn9vUiiZDTquxygnfp0umc1F
         dnkt77AuGJdopTbg/oRxhoqn3VrvuB++ro5JgjHGFLo152tQZZqVwYTVeTPP3G9mOKJC
         ereY8BmSdNQfRU/GKE7uMZZKDlkLwQEqIQV1eXOj+AgUYBDtIRRGFPDOlGafLNzwJZbc
         tCuA4LpDh1vx8KmqbDkzLmudTMF1O5ZN8IZVo2RziUGMeGO+HtCjzAcN5LXy9XLJdfCy
         HvCNeHPDM4cuWV4SwNczXV+6y1VnwMbwgJly4yT1DMBjfj+mZPSViIXgviEPQGweGTDb
         xBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108501; x=1734713301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aq6uxvVbG5xxzgybZF/l/V4c8HPIK8uPOyna1cvYXWA=;
        b=QDR0bjnPLfspk3W4CIZVNkdKK+P7LxVzMReMxvfcH8VeS2RTaGShh+GasixUGSlJeF
         K3qWWagxaG64ABRqatF8k8LYqVe5gzjM0yB2YYtkzdjsnpFycEk5bmlOmjNjjx9Lothq
         mxA+C2M9D7d+BuoGj+DDLyfxY3E8dMKwfCXMw6RTOczgfv2In+1OdHd3naf3AwdvD9d6
         rz0MK36X9vI+pk2PAswsYgjEifPwd9wjlmHdfLVyJrPHcys5jR2/zreVlTAbjujaAfHT
         CyDpRH/n4vmnanQTEpoGy0gDOpUPnFUNwCw9Mk7W4dZ3pelncJQptkb5aEARujcsgn6W
         RoJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+KvX4JvLg+UGtAuBY0+6Ej99DhSYkI0+P/1amjo3nAQhuKHNQ/SVEg+4ywq9NtKGIRH0LQWO8OysNat5b@vger.kernel.org
X-Gm-Message-State: AOJu0YznSCaFAQ0yH/+ab8M7UYv2yzENkbNQLcXfcxvS23W2AduD9HJ5
	MRpm9YmCVgKQhxyl+x20WgcN+xx/mTgyggYZ+r/j//vjvA9uEoPAAjWMe7FYL+tAS+4SgWqoIA=
	=
X-Google-Smtp-Source: AGHT+IFSvG/fqSl7ZNJ3qm5zCF5qD4QOJhC1Avgrxg1Y/6IRPNfNklxASuKBBLtf2tg/8VDvraqzyfwYkg==
X-Received: from wmbjl5.prod.google.com ([2002:a05:600c:6a85:b0:434:f119:f1a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4b12:b0:385:fc70:7eb
 with SMTP id ffacd0b85a97d-38880ac252bmr2943992f8f.12.1734108501569; Fri, 13
 Dec 2024 08:48:21 -0800 (PST)
Date: Fri, 13 Dec 2024 16:48:00 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-5-tabba@google.com>
Subject: [RFC PATCH v4 04/14] KVM: guest_memfd: Track mappability within a
 struct kvm_gmem_private
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

From: Ackerley Tng <ackerleytng@google.com>

Track whether guest_memfd memory can be mapped within the inode,
since it is property of the guest_memfd's memory contents.

The guest_memfd PRIVATE memory attribute is not used for two
reasons. First because it reflects the userspace expectation for
that memory location, and therefore can be toggled by userspace.
The second is, although each guest_memfd file has a 1:1 binding
with a KVM instance, the plan is to allow multiple files per
inode, e.g. to allow intra-host migration to a new KVM instance,
without destroying guest_memfd.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 virt/kvm/guest_memfd.c | 56 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 6453658d2650..0a7b6cf8bd8f 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -18,6 +18,17 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
+struct kvm_gmem_inode_private {
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+	struct xarray mappable_offsets;
+#endif
+};
+
+static struct kvm_gmem_inode_private *kvm_gmem_private(struct inode *inode)
+{
+	return inode->i_mapping->i_private_data;
+}
+
 /**
  * folio_file_pfn - like folio_file_page, but return a pfn.
  * @folio: The folio which contains this index.
@@ -312,8 +323,28 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+static void kvm_gmem_evict_inode(struct inode *inode)
+{
+	struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
+
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+	/*
+	 * .evict_inode can be called before private data is set up if there are
+	 * issues during inode creation.
+	 */
+	if (private)
+		xa_destroy(&private->mappable_offsets);
+#endif
+
+	truncate_inode_pages_final(inode->i_mapping);
+
+	kfree(private);
+	clear_inode(inode);
+}
+
 static const struct super_operations kvm_gmem_super_operations = {
-	.statfs		= simple_statfs,
+	.statfs         = simple_statfs,
+	.evict_inode	= kvm_gmem_evict_inode,
 };
 
 static int kvm_gmem_init_fs_context(struct fs_context *fc)
@@ -440,6 +471,7 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
 						      loff_t size, u64 flags)
 {
 	const struct qstr qname = QSTR_INIT(name, strlen(name));
+	struct kvm_gmem_inode_private *private;
 	struct inode *inode;
 	int err;
 
@@ -448,10 +480,19 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
 		return inode;
 
 	err = security_inode_init_security_anon(inode, &qname, NULL);
-	if (err) {
-		iput(inode);
-		return ERR_PTR(err);
-	}
+	if (err)
+		goto out;
+
+	err = -ENOMEM;
+	private = kzalloc(sizeof(*private), GFP_KERNEL);
+	if (!private)
+		goto out;
+
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+	xa_init(&private->mappable_offsets);
+#endif
+
+	inode->i_mapping->i_private_data = private;
 
 	inode->i_private = (void *)(unsigned long)flags;
 	inode->i_op = &kvm_gmem_iops;
@@ -464,6 +505,11 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
 
 	return inode;
+
+out:
+	iput(inode);
+
+	return ERR_PTR(err);
 }
 
 static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,
-- 
2.47.1.613.gc27f4b7a9f-goog


