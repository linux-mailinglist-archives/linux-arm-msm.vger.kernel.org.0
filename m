Return-Path: <linux-arm-msm+bounces-52781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0816A74DC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E078017B472
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8701C146A66;
	Fri, 28 Mar 2025 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FoJwqyne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3EA1E4AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175900; cv=none; b=fSgTaauzxhuSyAWL3NQQBXADhQaVO1PkXX8e8v2oHlnB70rA1F91TjN/Yv4aNpRLg8cItSZ52cvqJRHOLAs6N++lzk43udBtEhSvgxBL8HC7HgofQKesn5CDzOz7VY83pUvsp+b3pMj/IqY9f93HvWG09UjBjI90LB4CMl6SFsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175900; c=relaxed/simple;
	bh=/DbJqIf5jARzMrFbUI/9YBIhv5OcRrzbdxbR00O3bKo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eNYj+O3c6GTLGvpVz73QuH0E6FVR7HdnJhVBS+ty+7ER/wgCsBrGETV/qJ2iocdNsndEV0KMjJRB8gWhuO2xOm/wJrpgzB4G6JFl6cAmhmPRv+jvghwLSGQi32hhNeS7/mEGYz16OE5xU5q6veIHqVsJQIppHiNlSjHTvAfmT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FoJwqyne; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so13880695e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743175897; x=1743780697; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pob1TR9dEqi7MIBnWCqwy033V3I8qaqnlKaqyDYFuI0=;
        b=FoJwqyneD4NHahCGtNSatjczyFolhh5y3whqWvGV6Ezk0CIB8VJnBx+4IQg5xyX+Nu
         j3lFO0Dy6hV8aa5lhQqXYQF3JbaXjkBDTgmb/TOmBXPUoQzDx07VHxTeCeo8H++XNPGH
         WT1WwNY9PDPfTfkMPnrcp3ZL33HjeUHndQP/QV9pffa7sAQj1/xxUFce5rvFyxTNie9+
         64KHcxVaaSfBB7/h0tBabCNZZj3+AONCRZJF7P4SHrzhIUjwpESB6ya8+DYOUFbp2csG
         qT9jZbCpNZNnvTfiUpP9ugvOxhRL0XOLfpP+AjQgrqUEzAIkc1MoKsVx9FwwgmMRCIe4
         +wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175897; x=1743780697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pob1TR9dEqi7MIBnWCqwy033V3I8qaqnlKaqyDYFuI0=;
        b=qJxxTb9Tn/LS6uqw3XOLwxL1Icu0mNeIbT9pQZOFUEbKnnrVnoYtni4JPZDSWB3UZd
         GpmcB/LmIlvvyDMXjQTMLpAj/6kXTCL4P2h8opipinuKXr4wmB2NLC9WNqWMQtJyRXEd
         /8R5dhCJCaTGjKQKr0MIQgHjSu6koggVBaNB76HW4SCj1QjTrKwoGDpYAEaG59G7BOQ+
         /69UMY1dY8Exq1lwXoVZJNT7lsRv5/YHnTEC3Wrqop2+bwSowPw/0oaJLhLhOz6mVWN7
         o/Sk2TD7AEIyT0WZtvknoPVd9sBhKHA1MWOKjpa55ESi6xFLh/DHqUEGjZ9Pl2UcoOoE
         g0jA==
X-Forwarded-Encrypted: i=1; AJvYcCVrtuTXloL8Yh4jR1ol5D2JnqcGxV1i+MGmuJiNb4H1/D5wKbO8UUQC/ccHYkNAuLBZAvKBVPM1nw1dC+UM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8dYyetqEBnrXSK9BZYhaYekTRxnTPTnbtHuIteXS+4n7c7wDX
	T8lasq9V2JiOib4ecPOtXSpk6Eg+ux6BR56BzHMOxmPz0X0EfFRI7oyD0fRoo3iLE3rKIpUkLw=
	=
X-Google-Smtp-Source: AGHT+IGngaZfLNR9G+mSoTgx2073MmGnWMrkl6EslGCWKeowY0DzmJkEF+mR9oXw1GyqKOgR3dKkpwK4uw==
X-Received: from wmbay1.prod.google.com ([2002:a05:600c:1e01:b0:43d:9f1:31a9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c15:b0:43c:eeee:b713
 with SMTP id 5b1f17b1804b1-43d85065ab9mr84209735e9.20.1743175897006; Fri, 28
 Mar 2025 08:31:37 -0700 (PDT)
Date: Fri, 28 Mar 2025 15:31:27 +0000
In-Reply-To: <20250328153133.3504118-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328153133.3504118-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328153133.3504118-2-tabba@google.com>
Subject: [PATCH v7 1/7] KVM: guest_memfd: Make guest mem use guest mem inodes
 instead of anonymous inodes
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
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

Using guest mem inodes allows us to store metadata for the backing
memory on the inode. Metadata will be added in a later patch to support
HugeTLB pages.

Metadata about backing memory should not be stored on the file, since
the file represents a guest_memfd's binding with a struct kvm, and
metadata about backing memory is not unique to a specific binding and
struct kvm.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/uapi/linux/magic.h |   1 +
 virt/kvm/guest_memfd.c     | 130 +++++++++++++++++++++++++++++++------
 2 files changed, 111 insertions(+), 20 deletions(-)

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
index fbf89e643add..844e70c82558 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/fs.h>
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
@@ -320,6 +324,38 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
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
 #ifdef CONFIG_KVM_GMEM_SHARED_MEM
 static bool kvm_gmem_offset_is_shared(struct file *file, pgoff_t index)
 {
@@ -430,6 +466,8 @@ static struct file_operations kvm_gmem_fops = {
 void kvm_gmem_init(struct module *module)
 {
 	kvm_gmem_fops.owner = module;
+
+	kvm_gmem_init_mount();
 }
 
 static int kvm_gmem_migrate_folio(struct address_space *mapping,
@@ -511,11 +549,79 @@ static const struct inode_operations kvm_gmem_iops = {
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
+	int err;
+
+	err = -ENOENT;
+	if (!try_module_get(kvm_gmem_fops.owner))
+		goto err;
+
+	inode = kvm_gmem_inode_make_secure_inode(name, size, flags);
+	if (IS_ERR(inode)) {
+		err = PTR_ERR(inode);
+		goto err_put_module;
+	}
+
+	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR,
+				 &kvm_gmem_fops);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_put_inode;
+	}
+
+	file->f_flags |= O_LARGEFILE;
+	file->private_data = priv;
+
+out:
+	return file;
+
+err_put_inode:
+	iput(inode);
+err_put_module:
+	module_put(kvm_gmem_fops.owner);
+err:
+	file = ERR_PTR(err);
+	goto out;
+}
+
 static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 {
-	const char *anon_name = "[kvm-gmem]";
 	struct kvm_gmem *gmem;
-	struct inode *inode;
 	struct file *file;
 	int fd, err;
 
@@ -529,32 +635,16 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
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
2.49.0.472.ge94155a9ec-goog


