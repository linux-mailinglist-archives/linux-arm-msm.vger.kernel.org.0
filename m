Return-Path: <linux-arm-msm+bounces-33815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E5998159
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4401028532E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C7E1A0AF7;
	Thu, 10 Oct 2024 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rvtb+ZoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C921B5ED6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550781; cv=none; b=gtDDL3LTvJtZF2ocMebpeUmyEZYcvzd7p814vKl6yOYP5jTJFXV+wDkbB2XA4VAvTM3aISNyeEB+y/BoR45+grEpNWJvsSnC3wlkeM5gTmmUG0oW5wi8B6m0YRipmngpZNjyfPgq9+0w0xtjqzVdKorzLspLNgKwZ1vxWVCd4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550781; c=relaxed/simple;
	bh=3zI2mMYBgDtaQ2CZ1B/ek40Jw4Rd0C6Kzftoo23lzPU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q3a4yvhMCKg/1bl4WEeH8165HfwOqhT/GGmlZ5hRflotb/L+Na5Jii5D+i3tkSEFi14BoKz25uxqwXsFhuV9XNmsOhiShCLPFHR88923SMKSN6QNrdXHztNnOFhKLIMM/6IDNr0IFASQmdndtKH0pWJ/Y+egB4WH/j4z2kizRa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rvtb+ZoI; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-430581bd920so4088935e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728550778; x=1729155578; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yV7g5zb1mLRm2mV+FxGCvZ9J58MmHKq+HH3QCFP3/A=;
        b=Rvtb+ZoIFD/YpmNoKTitqcpoic0AJAQGVKdbofn5bRAkvwgVKOlGwaDut2Q49Wo+N5
         4uMkXc3IB97udPr634UBNpN6KAXVdvNJjyuDqa3FjVZlUxFHHT0VjoMj8WbqxnyoVJjN
         jRwA6GayiX3lnay6jn7458FhPkWNWUXz6/uPk6QrNY/4Z5AcxfwlnO8rhtb3muyBh2xj
         XKMutfz7Ggqnsrm9eRHJwjXdrhwqqHaq3FBkgfgIg+0fEim2YoPcL+xuL+BolGXxpGik
         YX2C4yuOS1iA6ysg3EOPLoXvvsmmWhhpcm+VJilbx7Vp9mTni20cF04dQGAbvNwdoRow
         NgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550778; x=1729155578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yV7g5zb1mLRm2mV+FxGCvZ9J58MmHKq+HH3QCFP3/A=;
        b=dyPjBe9q16f0gVPzcVVBJlGm06dcWaEw+GuqLz9ExCK/zEfsty8Se+9CbOhhPumtDu
         1m7XeCvNTMvbP3m3ErByFRjzhSL//4oV2X3KPv5FX0rtSF72qMopT8sPwiAR8JhYjJX9
         5y+2J9fpAbFU4XzGpl1xNnG9C2HVspTG8/hTWqDIOqUtsESRxfMAAq7giE4FC8I/NIBk
         DN/a4jirTtF/nao6c0oYgJ2xYINSptlcn1nWTcgcE1/0v3eZFdgIGbqEOvmI88H37Ln0
         LFK7+iGHvITCQGYNtvIF1ZI/g8nI4jWaa8ZTK6DBRcQBSLm43d8xpDU2+RKKcaDELgqo
         ZDKg==
X-Forwarded-Encrypted: i=1; AJvYcCUu6hdaTghwsZ+TgT7pJx5IvCDQx8STpYG4NZW+pgHKl43OhWB/lYotWAG8/gg2lUj5bickfa2/dKDsJ3kD@vger.kernel.org
X-Gm-Message-State: AOJu0YzoVmB5fiLvBB4uWzYhArqfnRLG9vucpdTSiWNWzPdH80PYS+rv
	Uq9vnKW4x9Qk6jY0IO/x1RdQIGj2s2/2REv/ejV5kfyVIGGj8A/lk/1dUN/WAJt3gBP/1QfKmw=
	=
X-Google-Smtp-Source: AGHT+IEhajSTUGX0DrF4NwfEPAhnOGAT61tcgNDfAcBGm901JNES8kGjHixw5Cb+5EsBR7BggcxyXkjnrQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:600c:5357:b0:42c:b45c:5e95 with SMTP id
 5b1f17b1804b1-430ccf091e0mr139615e9.1.1728550777855; Thu, 10 Oct 2024
 01:59:37 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:59:21 +0100
In-Reply-To: <20241010085930.1546800-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010085930.1546800-3-tabba@google.com>
Subject: [PATCH v3 02/11] KVM: guest_memfd: Track mappability within a struct kvm_gmem_private
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
index 5d7fd1f708a6..4d3ba346c415 100644
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
@@ -307,8 +318,28 @@ static inline struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
 	return get_file_active(&slot->gmem.file);
 }
 
+static void kvm_gmem_evict_inode(struct inode *inode)
+{
+	struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
+
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+	/*
+	 * .free_inode can be called before private data is set up if there are
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
@@ -435,6 +466,7 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
 						      loff_t size, u64 flags)
 {
 	const struct qstr qname = QSTR_INIT(name, strlen(name));
+	struct kvm_gmem_inode_private *private;
 	struct inode *inode;
 	int err;
 
@@ -443,10 +475,19 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
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
@@ -459,6 +500,11 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
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
2.47.0.rc0.187.ge670bccf7e-goog


