Return-Path: <linux-arm-msm+bounces-42093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CB9F12C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C69C3280F24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69B01F0E4B;
	Fri, 13 Dec 2024 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmSjY43c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3531F03D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108500; cv=none; b=Na1mjz8wF+/aUF9mRksgVTNazAxiCab8OqpyEaiBuFDZSaEAL3ZVSpRU1NYOZunBxbZF2MPdly5oiWi+G4bCF/ejylms9GRvJv7BpIxM4lhM4hlPwEBAwK/R95QsIrN+8iADj4uz9s9psruNHIj8Gqt+wSsIT38H78yA3kvVnh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108500; c=relaxed/simple;
	bh=6hWs3HynUV9F0pYtSrb9dYcQg0dIuQhd3cTg2777BS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YqoTSQ3eNVPNTgXAN4gDY+PgNAP3wHXQ6W/Ae9TSUofrN/t3seMj3gKEViQWeorM8GlZsZIRc9c6HqEDaViMDkfrDCDKBblt/woODPKRKreH988rqXgh7iNw/fHdusCecPtlgahA9GjsiQ6oSxz1643p1mXbniEaAY7cvpeeWrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmSjY43c; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so18656985e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108497; x=1734713297; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8sbfS8W1wicHM5vsGa5IMowjJ2CAstrX6T9HihvAEa4=;
        b=XmSjY43cYB00mvfWxmHEGcDaLjyD8JopszuZSiZ9Cwbg855UdVWIqMuUq9uMKTg707
         suvCB7a7sB+l9AnpJsSFtJ53BNkdObwSn1+dSuT5FSVMS93OkgLZ1wHeYnqopQW3Itmt
         nV3zNgySi7cIIquy+K2hu8YNal6ub6GaPq4Dmhuts6rhxW7sR1x3Xyo200giZQKa5EQs
         0sodABa2V9snAF7PyKWIJHqe3t5D1DVnJZ7AM/V8rMAjTG05MsJMfrDQly8I8hjONYKj
         ydYsPk78dvV7oX8+DFz+ZM/eHDQmEUm+l9scVRNFUNG8U6Cp1EumeXu5W59moFMbvhJh
         GlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108497; x=1734713297;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sbfS8W1wicHM5vsGa5IMowjJ2CAstrX6T9HihvAEa4=;
        b=qqjgfEmlX+MrtGB7cYgTd23ei8NaZzzTxuYiXnncQM6BD/yfJpQxz6xjaYm9eIfT+G
         tepGL+YNnS+73HAMi5W0bgI/FYHce4kJHkfMaVNzekWk/Lq69u9UE018AbDbyjcB16C0
         a8M91Z6rkRw8LZO+oVe3F2xTmkCs9CLQx9Gd2FpbjKEdLYA2A5xCdlHrc5B9QAQXbmZW
         I7i6oUXcMliTU8k1LjcBZHWYvPfzQP5mpWgwPxDKw+DHn5DD2Tx/rbNoYsQqLPK4YLWh
         jB6v2ojvZJN5narwyStRgnyVCjZHEuxkwjgpf7oldfa1+QhzLSE2vkxjS7rBHMlW00Ku
         Uxwg==
X-Forwarded-Encrypted: i=1; AJvYcCUBXgKR88UuwJGxJ8NpexwrsWwRkJpjs1/md8SVQsDuDel1Z735l/B+H6tFBN3Is9guF1xfygyj/jVjqOAj@vger.kernel.org
X-Gm-Message-State: AOJu0Yysfzv6OeOBbIzg1IPr50dXga3JvGJ9w//ePiRO71bNGnwrXPMu
	kjpSjpHl5qn5WO/WeVNcK6rRWWK3oh9QbhQecVbDqG8Q83Okr5Lt5IlfthT3foT3+GPWVezAuQ=
	=
X-Google-Smtp-Source: AGHT+IEPhjbYVrPG4OvpW3X6Nrv45wDkaxf1Je2UWVRf/3W/68PxH4JbNqktpfTiAT0Xl8J+JFcRBc200g==
X-Received: from wmnb22.prod.google.com ([2002:a05:600c:6d6:b0:434:a4bc:534f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1da4:b0:434:f753:6012
 with SMTP id 5b1f17b1804b1-4362aa509abmr35207575e9.17.1734108497542; Fri, 13
 Dec 2024 08:48:17 -0800 (PST)
Date: Fri, 13 Dec 2024 16:47:58 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-3-tabba@google.com>
Subject: [RFC PATCH v4 02/14] KVM: guest_memfd: Make guest mem use guest mem
 inodes instead of anonymous inodes
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

Using guest mem inodes allows us to store metadata for the backing
memory on the inode. Metadata will be added in a later patch to
support HugeTLB pages.

Metadata about backing memory should not be stored on the file, since
the file represents a guest_memfd's binding with a struct kvm, and
metadata about backing memory is not unique to a specific binding and
struct kvm.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/uapi/linux/magic.h |   1 +
 virt/kvm/guest_memfd.c     | 119 ++++++++++++++++++++++++++++++-------
 2 files changed, 100 insertions(+), 20 deletions(-)

diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index bb575f3ab45e..169dba2a6920 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -103,5 +103,6 @@
 #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
 #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
 #define PID_FS_MAGIC		0x50494446	/* "PIDF" */
+#define GUEST_MEMORY_MAGIC	0x474d454d	/* "GMEM" */
 
 #endif /* __LINUX_MAGIC_H__ */
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 47a9f68f7b24..198554b1f0b5 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1,12 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/fs.h>
+#include <linux/mount.h>
 #include <linux/backing-dev.h>
 #include <linux/falloc.h>
 #include <linux/kvm_host.h>
+#include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
 #include <linux/anon_inodes.h>
 
 #include "kvm_mm.h"
 
+static struct vfsmount *kvm_gmem_mnt;
+
 struct kvm_gmem {
 	struct kvm *kvm;
 	struct xarray bindings;
@@ -307,6 +312,38 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 	return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+static const struct super_operations kvm_gmem_super_operations = {
+	.statfs		= simple_statfs,
+};
+
+static int kvm_gmem_init_fs_context(struct fs_context *fc)
+{
+	struct pseudo_fs_context *ctx;
+
+	if (!init_pseudo(fc, GUEST_MEMORY_MAGIC))
+		return -ENOMEM;
+
+	ctx = fc->fs_private;
+	ctx->ops = &kvm_gmem_super_operations;
+
+	return 0;
+}
+
+static struct file_system_type kvm_gmem_fs = {
+	.name		 = "kvm_guest_memory",
+	.init_fs_context = kvm_gmem_init_fs_context,
+	.kill_sb	 = kill_anon_super,
+};
+
+static void kvm_gmem_init_mount(void)
+{
+	kvm_gmem_mnt = kern_mount(&kvm_gmem_fs);
+	BUG_ON(IS_ERR(kvm_gmem_mnt));
+
+	/* For giggles. Userspace can never map this anyways. */
+	kvm_gmem_mnt->mnt_flags |= MNT_NOEXEC;
+}
+
 static struct file_operations kvm_gmem_fops = {
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
@@ -316,6 +353,8 @@ static struct file_operations kvm_gmem_fops = {
 void kvm_gmem_init(struct module *module)
 {
 	kvm_gmem_fops.owner = module;
+
+	kvm_gmem_init_mount();
 }
 
 static int kvm_gmem_migrate_folio(struct address_space *mapping,
@@ -397,11 +436,67 @@ static const struct inode_operations kvm_gmem_iops = {
 	.setattr	= kvm_gmem_setattr,
 };
 
+static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
+						      loff_t size, u64 flags)
+{
+	const struct qstr qname = QSTR_INIT(name, strlen(name));
+	struct inode *inode;
+	int err;
+
+	inode = alloc_anon_inode(kvm_gmem_mnt->mnt_sb);
+	if (IS_ERR(inode))
+		return inode;
+
+	err = security_inode_init_security_anon(inode, &qname, NULL);
+	if (err) {
+		iput(inode);
+		return ERR_PTR(err);
+	}
+
+	inode->i_private = (void *)(unsigned long)flags;
+	inode->i_op = &kvm_gmem_iops;
+	inode->i_mapping->a_ops = &kvm_gmem_aops;
+	inode->i_mode |= S_IFREG;
+	inode->i_size = size;
+	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_inaccessible(inode->i_mapping);
+	/* Unmovable mappings are supposed to be marked unevictable as well. */
+	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
+
+	return inode;
+}
+
+static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,
+						  u64 flags)
+{
+	static const char *name = "[kvm-gmem]";
+	struct inode *inode;
+	struct file *file;
+
+	if (kvm_gmem_fops.owner && !try_module_get(kvm_gmem_fops.owner))
+		return ERR_PTR(-ENOENT);
+
+	inode = kvm_gmem_inode_make_secure_inode(name, size, flags);
+	if (IS_ERR(inode))
+		return ERR_CAST(inode);
+
+	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR,
+				 &kvm_gmem_fops);
+	if (IS_ERR(file)) {
+		iput(inode);
+		return file;
+	}
+
+	file->f_mapping = inode->i_mapping;
+	file->f_flags |= O_LARGEFILE;
+	file->private_data = priv;
+
+	return file;
+}
+
 static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 {
-	const char *anon_name = "[kvm-gmem]";
 	struct kvm_gmem *gmem;
-	struct inode *inode;
 	struct file *file;
 	int fd, err;
 
@@ -415,32 +510,16 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 		goto err_fd;
 	}
 
-	file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, gmem,
-					 O_RDWR, NULL);
+	file = kvm_gmem_inode_create_getfile(gmem, size, flags);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
 		goto err_gmem;
 	}
 
-	file->f_flags |= O_LARGEFILE;
-
-	inode = file->f_inode;
-	WARN_ON(file->f_mapping != inode->i_mapping);
-
-	inode->i_private = (void *)(unsigned long)flags;
-	inode->i_op = &kvm_gmem_iops;
-	inode->i_mapping->a_ops = &kvm_gmem_aops;
-	inode->i_mode |= S_IFREG;
-	inode->i_size = size;
-	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
-	mapping_set_inaccessible(inode->i_mapping);
-	/* Unmovable mappings are supposed to be marked unevictable as well. */
-	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
-
 	kvm_get_kvm(kvm);
 	gmem->kvm = kvm;
 	xa_init(&gmem->bindings);
-	list_add(&gmem->entry, &inode->i_mapping->i_private_list);
+	list_add(&gmem->entry, &file_inode(file)->i_mapping->i_private_list);
 
 	fd_install(fd, file);
 	return fd;
-- 
2.47.1.613.gc27f4b7a9f-goog


