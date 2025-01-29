Return-Path: <linux-arm-msm+bounces-46488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F01A21AC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34DA018885E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 10:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7835F1991A4;
	Wed, 29 Jan 2025 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QdC20sF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881A1AAA1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738145564; cv=none; b=YR+XtahoKZobp/8Bpl1LoNkroyAbwSp8va7IwQYsmFjcJWYnxAQ/gTJCCbygGEzxEkqXrCebA96o4ydDjFAi4019soFnSyZyFNd4R30JSExWsYCHzQhRKyyOYnD7E5As/bKWfntjP6WTyAMwUjJkLN5HEsQmhPMTX6kRSzY6dGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738145564; c=relaxed/simple;
	bh=KTyi69G5HL6i9bNpO1x7DJGsjNDBilJrKWbvtsh1dMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXkxBX2fLVD4m8xHaSqh6yczthgswpmtQ2OOHpbL2813gGuRUwCXfvuqlwv2wAS90NAU1D/pfJwv6Lt2NHF+vYnmba3NyH6aRi3GSiEwVjaI1cgmmOypx66xZoTWfM4G9Gob84UfWCPHXZGAyoaCFIFixU4t1cUr21a+4FB6AXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QdC20sF5; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679b5c66d0so493811cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738145561; x=1738750361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kzQG2opZhhOKKY7Si+vReF11GIIp44bAwoNf+bF++fc=;
        b=QdC20sF5jQR53mZLTrAxeJ7rQpbPdPseTq+39jfC5D0lcA0HHHOfuY/DSW+KejdsCq
         ldkl7N4LdJ0ou7xzAgqPlypw7UNAc5I+eyHPHKJz3HiikiC9o6vT9xt/p0/ugyMEjXmW
         tksimKgHQfgBOzXUCpB/lUFjHVjRkQwpKfqBJ4GzOjZEwgdBOOco/Bn5gVuk2po1R5ZP
         JOveADbGelETZbyciYo0A2CTiKKSl+7LCU8AKBP8C/cBJmQLW57m0umz/iHjqIYqjRCY
         VGTYZM2+JUurTjtYOEeD+47wpawJE6zLesOQcls5E9cOhK5fNTNqvixjOCBfO9iG/lzO
         AwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738145561; x=1738750361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzQG2opZhhOKKY7Si+vReF11GIIp44bAwoNf+bF++fc=;
        b=sz5Hsa82uRpoZ2YjKxjcEm+erMPiPjTqT806tVFTgYk5uT8UI9z/xR9VGba67wcQ0s
         aG6lTH82kDAJvs28MMVYBf2YTYNWLJYyZs+ZmV0HJgV49xyn2GNPNE8JXELLT20DYbIA
         DYNmZN8xQu/cpwCxbsmZqdf+5PAnXWrXqs2FxQct7w6CBotWwdN+j28L+GhocG5r6lgV
         inYdkHSjjqbyM5DNOyGfHjhLSx2G1qS63KHo/Dg8F/NtteCTfNgX6pYWyN7PBJeuaw5Q
         otoCqkKvqwja6yoLTmEg0uorC0gF+hIWwvsgLZWuQwaG7/UAsKj2c54TIEiEnw94LSiK
         Wk3w==
X-Forwarded-Encrypted: i=1; AJvYcCWghDMjL1VVWpkdCkNsxbm1dcUXJ2HHQbpNFpRH0vvW/DFkDEoHWPH9lQt900yBVpUzlc412IwDCNGiZFdc@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYEAaLeIi38Y6l6cvpME/SmN/gpnXF+L5AKbgCpSnv1w8pqzU
	7oWUXbhYHPtfUzGtIcif9glVW3J4ep5sQHA17POQIvccqkk41fNP1aKNYCbKiWURKATFxXMyuCD
	twYK93aL72AkUWWEiZLmOVDVDie4b00j4JhD9
X-Gm-Gg: ASbGncu1KQn0VNTdOof7qwM3KN3E1z+Ixl+LQsTEPvF0ETKYC0PlxdGvB4yhuqSyMBC
	XxXf3qR85KSc2hsv0c1Sln2h8ht7Dotm5mL/kSFZn+D4BDkqnHFf2/3fXo4IVN3xqp22zMGnOU+
	rOHuxSRCz2VnJCFI9yBspntFADXWT2M9PAWR6i
X-Google-Smtp-Source: AGHT+IEkJ52Lo2mOYxnqSwPjqqO5/Xoqdep/U5y1rZZYTLMHPafFjxzzbs2yJhPTmMNiun4xWSRUswxE+qBtG5Us8zA=
X-Received: by 2002:ac8:7dc2:0:b0:466:7a06:2d03 with SMTP id
 d75a77b69052e-46fd274a261mr1990311cf.1.1738145560803; Wed, 29 Jan 2025
 02:12:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-3-tabba@google.com>
 <186047ea-a782-494b-bfcf-f5088806bbb4@redhat.com>
In-Reply-To: <186047ea-a782-494b-bfcf-f5088806bbb4@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jan 2025 10:12:04 +0000
X-Gm-Features: AWEUYZlRk_QxpmELFibDAQ0cRPeKANrt0PkWChtkN5Z_TriadREt_68-o2Y91UQ
Message-ID: <CA+EHjTysdjH8DiSkNhObybTtxZFBN9e3vKqYLzFC473X2Vb4cg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 02/15] KVM: guest_memfd: Make guest mem use guest
 mem inodes instead of anonymous inodes
To: Gavin Shan <gshan@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Gavin,

On Fri, 24 Jan 2025 at 04:26, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 1/18/25 2:29 AM, Fuad Tabba wrote:
> > From: Ackerley Tng <ackerleytng@google.com>
> >
> > Using guest mem inodes allows us to store metadata for the backing
> > memory on the inode. Metadata will be added in a later patch to
> > support HugeTLB pages.
> >
> > Metadata about backing memory should not be stored on the file, since
> > the file represents a guest_memfd's binding with a struct kvm, and
> > metadata about backing memory is not unique to a specific binding and
> > struct kvm.
> >
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   include/uapi/linux/magic.h |   1 +
> >   virt/kvm/guest_memfd.c     | 119 ++++++++++++++++++++++++++++++-------
> >   2 files changed, 100 insertions(+), 20 deletions(-)
> >
> > diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> > index bb575f3ab45e..169dba2a6920 100644
> > --- a/include/uapi/linux/magic.h
> > +++ b/include/uapi/linux/magic.h
> > @@ -103,5 +103,6 @@
> >   #define DEVMEM_MAGIC                0x454d444d      /* "DMEM" */
> >   #define SECRETMEM_MAGIC             0x5345434d      /* "SECM" */
> >   #define PID_FS_MAGIC                0x50494446      /* "PIDF" */
> > +#define GUEST_MEMORY_MAGIC   0x474d454d      /* "GMEM" */
> >
> >   #endif /* __LINUX_MAGIC_H__ */
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 47a9f68f7b24..198554b1f0b5 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -1,12 +1,17 @@
> >   // SPDX-License-Identifier: GPL-2.0
> > +#include <linux/fs.h>
> > +#include <linux/mount.h>
>
> This can be dropped since "linux/mount.h" has been included to "linux/fs.h".
>
> >   #include <linux/backing-dev.h>
> >   #include <linux/falloc.h>
> >   #include <linux/kvm_host.h>
> > +#include <linux/pseudo_fs.h>
> >   #include <linux/pagemap.h>
> >   #include <linux/anon_inodes.h>
> >
> >   #include "kvm_mm.h"
> >
> > +static struct vfsmount *kvm_gmem_mnt;
> > +
> >   struct kvm_gmem {
> >       struct kvm *kvm;
> >       struct xarray bindings;
> > @@ -307,6 +312,38 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >       return gfn - slot->base_gfn + slot->gmem.pgoff;
> >   }
> >
> > +static const struct super_operations kvm_gmem_super_operations = {
> > +     .statfs         = simple_statfs,
> > +};
> > +
> > +static int kvm_gmem_init_fs_context(struct fs_context *fc)
> > +{
> > +     struct pseudo_fs_context *ctx;
> > +
> > +     if (!init_pseudo(fc, GUEST_MEMORY_MAGIC))
> > +             return -ENOMEM;
> > +
> > +     ctx = fc->fs_private;
> > +     ctx->ops = &kvm_gmem_super_operations;
> > +
> > +     return 0;
> > +}
> > +
> > +static struct file_system_type kvm_gmem_fs = {
> > +     .name            = "kvm_guest_memory",
> > +     .init_fs_context = kvm_gmem_init_fs_context,
> > +     .kill_sb         = kill_anon_super,
> > +};
> > +
> > +static void kvm_gmem_init_mount(void)
> > +{
> > +     kvm_gmem_mnt = kern_mount(&kvm_gmem_fs);
> > +     BUG_ON(IS_ERR(kvm_gmem_mnt));
> > +
> > +     /* For giggles. Userspace can never map this anyways. */
> > +     kvm_gmem_mnt->mnt_flags |= MNT_NOEXEC;
> > +}
> > +
> >   static struct file_operations kvm_gmem_fops = {
> >       .open           = generic_file_open,
> >       .release        = kvm_gmem_release,
> > @@ -316,6 +353,8 @@ static struct file_operations kvm_gmem_fops = {
> >   void kvm_gmem_init(struct module *module)
> >   {
> >       kvm_gmem_fops.owner = module;
> > +
> > +     kvm_gmem_init_mount();
> >   }
> >
> >   static int kvm_gmem_migrate_folio(struct address_space *mapping,
> > @@ -397,11 +436,67 @@ static const struct inode_operations kvm_gmem_iops = {
> >       .setattr        = kvm_gmem_setattr,
> >   };
> >
> > +static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
> > +                                                   loff_t size, u64 flags)
> > +{
> > +     const struct qstr qname = QSTR_INIT(name, strlen(name));
> > +     struct inode *inode;
> > +     int err;
> > +
> > +     inode = alloc_anon_inode(kvm_gmem_mnt->mnt_sb);
> > +     if (IS_ERR(inode))
> > +             return inode;
> > +
> > +     err = security_inode_init_security_anon(inode, &qname, NULL);
> > +     if (err) {
> > +             iput(inode);
> > +             return ERR_PTR(err);
> > +     }
> > +
> > +     inode->i_private = (void *)(unsigned long)flags;
> > +     inode->i_op = &kvm_gmem_iops;
> > +     inode->i_mapping->a_ops = &kvm_gmem_aops;
> > +     inode->i_mode |= S_IFREG;
> > +     inode->i_size = size;
> > +     mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
> > +     mapping_set_inaccessible(inode->i_mapping);
> > +     /* Unmovable mappings are supposed to be marked unevictable as well. */
> > +     WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> > +
> > +     return inode;
> > +}
> > +
> > +static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,
> > +                                               u64 flags)
> > +{
> > +     static const char *name = "[kvm-gmem]";
> > +     struct inode *inode;
> > +     struct file *file;
> > +
> > +     if (kvm_gmem_fops.owner && !try_module_get(kvm_gmem_fops.owner))
> > +             return ERR_PTR(-ENOENT);
> > +
>
> The validation on 'kvm_gmem_fops.owner' can be removed since try_module_get()
> and module_put() are friendly to a NULL parameter, even when CONFIG_MODULE_UNLOAD == N
>
> A module_put(kvm_gmem_fops.owner) is needed in the various erroneous cases in
> this function. Otherwise, the reference count of the owner (module) will become
> imbalanced on any errors.
>
>
> > +     inode = kvm_gmem_inode_make_secure_inode(name, size, flags);
> > +     if (IS_ERR(inode))
> > +             return ERR_CAST(inode);
> > +
>
> ERR_CAST may be dropped since there is nothing to be casted or converted?
>
> > +     file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR,
> > +                              &kvm_gmem_fops);
> > +     if (IS_ERR(file)) {
> > +             iput(inode);
> > +             return file;
> > +     }
> > +
> > +     file->f_mapping = inode->i_mapping;
> > +     file->f_flags |= O_LARGEFILE;
> > +     file->private_data = priv;
> > +
>
> 'file->f_mapping = inode->i_mapping' may be dropped since it's already correctly
> set by alloc_file_pseudo().
>
> alloc_file_pseudo
>    alloc_path_pseudo
>    alloc_file
>      alloc_empty_file
>      file_init_path         // Set by this function

Thanks for the fixes. Will include them when we respin.

Cheers,
/fuad

> > +     return file;
> > +}
> > +
> >   static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> >   {
> > -     const char *anon_name = "[kvm-gmem]";
> >       struct kvm_gmem *gmem;
> > -     struct inode *inode;
> >       struct file *file;
> >       int fd, err;
> >
> > @@ -415,32 +510,16 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> >               goto err_fd;
> >       }
> >
> > -     file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, gmem,
> > -                                      O_RDWR, NULL);
> > +     file = kvm_gmem_inode_create_getfile(gmem, size, flags);
> >       if (IS_ERR(file)) {
> >               err = PTR_ERR(file);
> >               goto err_gmem;
> >       }
> >
> > -     file->f_flags |= O_LARGEFILE;
> > -
> > -     inode = file->f_inode;
> > -     WARN_ON(file->f_mapping != inode->i_mapping);
> > -
> > -     inode->i_private = (void *)(unsigned long)flags;
> > -     inode->i_op = &kvm_gmem_iops;
> > -     inode->i_mapping->a_ops = &kvm_gmem_aops;
> > -     inode->i_mode |= S_IFREG;
> > -     inode->i_size = size;
> > -     mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
> > -     mapping_set_inaccessible(inode->i_mapping);
> > -     /* Unmovable mappings are supposed to be marked unevictable as well. */
> > -     WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> > -
> >       kvm_get_kvm(kvm);
> >       gmem->kvm = kvm;
> >       xa_init(&gmem->bindings);
> > -     list_add(&gmem->entry, &inode->i_mapping->i_private_list);
> > +     list_add(&gmem->entry, &file_inode(file)->i_mapping->i_private_list);
> >
> >       fd_install(fd, file);
> >       return fd;
>
> Thanks,
> Gavin
>

