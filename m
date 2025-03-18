Return-Path: <linux-arm-msm+bounces-51786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84192A67929
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97C4916C446
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB73212B32;
	Tue, 18 Mar 2025 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="psWOqlp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A72A211462
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314857; cv=none; b=RHu4lj4dm6y5lZnLnc3IEpHDMM2VGHP5xHKE2m0lRA/fd69LvJdb0S9nBoxk2sIb1XymV85gNG6ZTzF5nHa8e3WEpYYZ7XcsKwvFzn28BtE5DB8fC2l5W8zb9/uqqi7SgckL9qORraDA7JQXwTqvbXB9gvBdBYFYwxZWmcniPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314857; c=relaxed/simple;
	bh=MdRVeER1PZ/FEW6epRUMXcL213LNtkO/Ybt8s7G9jg8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TD2j8fy9RgcSmIUwsZCtopYNkBTQrJLh/sBV1/fp/RPnLf3i21bNdVKjxvj/GATxxQQTzwxGFb28rnXshWFo7PkzVTMViSNhtbUPQN38AKIMwwF+J7jCubXQEoGwzBJziqvrvbW8QIBs/Ii8V9Ynpo5sMcRCTaYxG75sL1Wj7NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=psWOqlp5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4394040fea1so17463865e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314854; x=1742919654; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wGT6XUfvwyo20nNpxU+yI0gtyvy9pE2xbzRktK0coPQ=;
        b=psWOqlp54UddZiKTsFCmf9PcRV3/qSbmO7iUb6DEc1/Fzq+0X8lp0pKDHJ66j+vmRG
         fndayrmwGU8m+XnBC16xMq6mSbAut7SNq6sZO9Zw2ovNWh/wCrSjHOOlYG001OakyBr+
         /Slfxt6+WETCV77CHqsV6rKDd0Vot4A9u0KBEHW3UwFqE/cJgwZCyqR9hFVyPUefK1Nj
         LSfR8W4H+RpDj1v37E4z6jT8xVdJ91cTSMfDhuza0wujKONIOa5pc0dIPLN9haWXB8Qg
         zy8m2WuyNe/eG2NucKLfj+ijdWi5LPRi0DOfPLIGlE18jMxPojT/qjBRa6bV3z8OgvrR
         +O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314854; x=1742919654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGT6XUfvwyo20nNpxU+yI0gtyvy9pE2xbzRktK0coPQ=;
        b=HVS1hAGchbd37QuJ1T9onQUO8tb06lSavAzdkkUihkk5D8WuqaKT4p6bLSptcVF9z8
         7/QZ5/1qoUORS6Lv4hDDE4dasqAE1IhKjiX2SvH5bz9pDvuzYh3ZHTYSW7paCOYZwwhD
         ZvWL7nCh5cwFAbXiEC/9HCmazdQlNj8hfRYycf67q01pn+ey3+HGiNvDcZC5cOlGK8YQ
         yNuhuaLUUQbDqQ0AlNBY/65aI6PEmaXmE2JVdDh4DfIMgxVZ3DkEogv19IGBFzzEiqQl
         Mdjn/ncdFClLDNQAVaEMd3go+oHjZC+2z4zR1Iy8oM3ufB54qeb0rxNJeMQXP+ukbsnj
         n7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIpuDfL+TP7x9qndjN5LkJf/BskeY7X88It/4GC2+nh6lQh3XKBr8v2n/CKdxhS/202q91QtSMypH3z3Wz@vger.kernel.org
X-Gm-Message-State: AOJu0Yys6PbK8sityu0EOWdj7osigoOIz56jrobD8T9VjEcbf+Lzm4k/
	avHjMWQeKps8bUhmwL6DkJvqtNDcsPv6DEiD4H1TKw92eim6Vwdxqr9bK7KNdXET7kNCMYWMQA=
	=
X-Google-Smtp-Source: AGHT+IGl0L+YQjnz7OSpay/gXAo8oxSXXskgyTEmCA9MZ9D7uSR+5ym8M6rluFfuo6rcX+QX8YfBK7dWiQ==
X-Received: from wmqe11.prod.google.com ([2002:a05:600c:4e4b:b0:43d:4038:9229])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1504:b0:43c:ed33:a500
 with SMTP id 5b1f17b1804b1-43d3b9cc07fmr27713425e9.10.1742314853967; Tue, 18
 Mar 2025 09:20:53 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:20:42 +0000
In-Reply-To: <20250318162046.4016367-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318162046.4016367-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162046.4016367-4-tabba@google.com>
Subject: [PATCH v6 3/7] KVM: guest_memfd: Track folio sharing within a struct kvm_gmem_private
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

From: Ackerley Tng <ackerleytng@google.com>

Track guest_memfd folio sharing state within the inode, since it is a
property of the guest_memfd's memory contents.

The guest_memfd PRIVATE memory attribute is not used for two reasons. It
reflects the userspace expectation for the memory state, and therefore
can be toggled by userspace. Also, although each guest_memfd file has a
1:1 binding with a KVM instance, the plan is to allow multiple files per
inode, e.g. to allow intra-host migration to a new KVM instance, without
destroying guest_memfd.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 virt/kvm/guest_memfd.c | 56 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index ac6b8853699d..a7f7c6eb6b4a 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -17,6 +17,17 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
+struct kvm_gmem_inode_private {
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	struct xarray shared_offsets;
+#endif
+};
+
+static struct kvm_gmem_inode_private *kvm_gmem_private(struct inode *inode)
+{
+	return inode->i_mapping->i_private_data;
+}
+
 #ifdef CONFIG_KVM_GMEM_SHARED_MEM
 void kvm_gmem_handle_folio_put(struct folio *folio)
 {
@@ -324,8 +335,28 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+static void kvm_gmem_evict_inode(struct inode *inode)
+{
+	struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
+
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	/*
+	 * .evict_inode can be called before private data is set up if there are
+	 * issues during inode creation.
+	 */
+	if (private)
+		xa_destroy(&private->shared_offsets);
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
@@ -553,6 +584,7 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
 						      loff_t size, u64 flags)
 {
 	const struct qstr qname = QSTR_INIT(name, strlen(name));
+	struct kvm_gmem_inode_private *private;
 	struct inode *inode;
 	int err;
 
@@ -561,10 +593,19 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
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
+#ifdef CONFIG_KVM_GMEM_SHARED_MEM
+	xa_init(&private->shared_offsets);
+#endif
+
+	inode->i_mapping->i_private_data = private;
 
 	inode->i_private = (void *)(unsigned long)flags;
 	inode->i_op = &kvm_gmem_iops;
@@ -577,6 +618,11 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
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
2.49.0.rc1.451.g8f38331e32-goog


