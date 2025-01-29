Return-Path: <linux-arm-msm+bounces-46489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F0A21AD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8BE7162F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 10:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF90C1B0406;
	Wed, 29 Jan 2025 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wocQ7jso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2519992C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738145763; cv=none; b=clFLzG4A8Ku9maVXjm35k22gjLsq6uUICAYKTVw7ttG7vqJtBMfDCUYu/b0vmC/1qre+wPD0a5AazIX4L2nIVQhkENhsuwd38Ue/ChMkcsbWjw1rD4b21t1kqoH3fAaMneDtARBPkdm2fDdat/ZJ/BQbmAlqrD8N6tRXXC5d1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738145763; c=relaxed/simple;
	bh=Z1ukSY+HzR50EXhw4gmQ1nxnfWEt3CJmc63XivhLQqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cxw11diKAul+atXGNPN36CJe7kUEC/Xxmkrjgczwwq9bm9W37pLA/1icffEzcU2nZAg6YDa9fAY59uedWWSGVjP9rA2UysnjJio1ZroJ8VBpPNlsrsNya9JDODqadb1zyKZck6M8WG35vGLje4ronWbPfOjSTqWHsjmSN4Xh9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wocQ7jso; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679b5c66d0so494481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738145760; x=1738750560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6U2SXpqCOFEGtSvGg9hkV0+K0niYl2BidP59BfMEdR8=;
        b=wocQ7jsoJIpidmXXl5H/8/BXeGP9TM2FHk7wb/BFwcIXY9HY5RDYTKa0+lNMy/fiyJ
         XN18RBPePrlxLBdHo0XV+MkrdFe5WCTDjcKkUBa32HDGRb85Q9MbJmYvVILrSbvxyWaO
         vc3W2dMi6c/Evuw1NcuA4cR092eSV51FvzNFEYuesLIeeCYZ38+7Gy5u5mCH2O2W1V1+
         WnF22EoIvPyYlUILHz2mJrbT3c/hmxujUrOPe9eHrw6k1aJlRgZF7PdrwbUaPT2MUIP+
         SJfDzITm0LfCNqenfQ9xVmcqY/EY07G2b9fATaLG1j3A4FHYYx7GEZUjORUYrx4JG59g
         MPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738145760; x=1738750560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6U2SXpqCOFEGtSvGg9hkV0+K0niYl2BidP59BfMEdR8=;
        b=VrNh0dZgbl+CbEUKA+M9C58SZBCXNd8GPS43n7+XG5NtKzxvmktcNqKndoui02ovrN
         t0Bw/jlIE5ORh2zU6QmjvjknzZ6nBCpfzUBd864SRcI9MysuejbOmWwEZXtStuLuWCiL
         ANKUv6W4G43TkKDCrRKJY4kJgS7pz9prHaD8SR1cHP3wmK+iOO3ec+GpHcn+tYX49MSj
         MXHAUkyijgo2mKCIM2kc4o0ujw9uI2x0VWSsznoR8s8l32Wq2GJ1XHb23YcwkBe1sbVG
         q+hY7wbGEDK8lBlJyuM4W37pzxs2GNOawm5U68IHIOPhpabnRVjlyPKFhnxh6qdlAeHJ
         yzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxfV0PMNNs+CdpTH1UzBOMc6CyIkA6Nk/RL/3cQUGymVPf3BkFz9oXaaZbuQ+A1aI/8qOKeby5PKzFyiBJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7ciLwz6qsoUWJMeLqmSWfw+Mk/6A6EvBfIOyNllkWMdQemS1
	unfUdj5vQxk4CES21nnbNDpYxRcF/H/QOxlCeUQ3WE7jVqzD641pcVL70d6dYT+s8wlqGXl1Xyt
	QlQtnHzmG8m/BWvyvq+EXmw2v7fV32Pz+Mnl6
X-Gm-Gg: ASbGncsw247+llK4ai4yxYYTWwrGx2OE4ng32YAEPrqnH1Z5q8l+bC04UxSFO7sVW4q
	n9RUDrmaD69DD6Q0ZSPiikw/IbBkO+em67DV/MOJvYByT59bEMhbcDU0kx8duf58AMyDQMq3ktP
	4RKfrqg8kEDXTpHMTiZoSkksF9+A==
X-Google-Smtp-Source: AGHT+IEM754Svn5072T3T/OhYrjVi6u8afqNrNZNeiDMMfOE/htyj8uGMMSkJxhyO/Q6OtkEtp5aWwIRGzrPrqRKdWw=
X-Received: by 2002:a05:622a:1b09:b0:46c:78e4:a9cc with SMTP id
 d75a77b69052e-46fd280676amr2107791cf.25.1738145759555; Wed, 29 Jan 2025
 02:15:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-5-tabba@google.com>
 <3e1780db-6e39-4508-8ce5-4d28771400e8@redhat.com>
In-Reply-To: <3e1780db-6e39-4508-8ce5-4d28771400e8@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jan 2025 10:15:23 +0000
X-Gm-Features: AWEUYZm9lelCVBKVaBvZr7U_TRk8ojDzX_rnjnEo65PW-lx8H9lXqyH-4BRjatc
Message-ID: <CA+EHjTw1SCg1Eu4CeJv4Tg6Ono2+sXDVKeGshBMu4gg87Uk_bg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 04/15] KVM: guest_memfd: Track mappability within a
 struct kvm_gmem_private
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

On Fri, 24 Jan 2025 at 05:32, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 1/18/25 2:29 AM, Fuad Tabba wrote:
> > From: Ackerley Tng <ackerleytng@google.com>
> >
> > Track whether guest_memfd memory can be mapped within the inode,
> > since it is property of the guest_memfd's memory contents.
> >
> > The guest_memfd PRIVATE memory attribute is not used for two
> > reasons. First because it reflects the userspace expectation for
> > that memory location, and therefore can be toggled by userspace.
> > The second is, although each guest_memfd file has a 1:1 binding
> > with a KVM instance, the plan is to allow multiple files per
> > inode, e.g. to allow intra-host migration to a new KVM instance,
> > without destroying guest_memfd.
> >
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > Co-developed-by: Fuad Tabba <tabba@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   virt/kvm/guest_memfd.c | 56 ++++++++++++++++++++++++++++++++++++++----
> >   1 file changed, 51 insertions(+), 5 deletions(-)
> >
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 6453658d2650..0a7b6cf8bd8f 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -18,6 +18,17 @@ struct kvm_gmem {
> >       struct list_head entry;
> >   };
> >
> > +struct kvm_gmem_inode_private {
> > +#ifdef CONFIG_KVM_GMEM_MAPPABLE
> > +     struct xarray mappable_offsets;
> > +#endif
> > +};
> > +
> > +static struct kvm_gmem_inode_private *kvm_gmem_private(struct inode *inode)
> > +{
> > +     return inode->i_mapping->i_private_data;
> > +}
> > +
> >   /**
> >    * folio_file_pfn - like folio_file_page, but return a pfn.
> >    * @folio: The folio which contains this index.
> > @@ -312,8 +323,28 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >       return gfn - slot->base_gfn + slot->gmem.pgoff;
> >   }
> >
> > +static void kvm_gmem_evict_inode(struct inode *inode)
> > +{
> > +     struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
> > +
> > +#ifdef CONFIG_KVM_GMEM_MAPPABLE
> > +     /*
> > +      * .evict_inode can be called before private data is set up if there are
> > +      * issues during inode creation.
> > +      */
> > +     if (private)
> > +             xa_destroy(&private->mappable_offsets);
> > +#endif
> > +
> > +     truncate_inode_pages_final(inode->i_mapping);
> > +
> > +     kfree(private);
> > +     clear_inode(inode);
> > +}
> > +
> >   static const struct super_operations kvm_gmem_super_operations = {
> > -     .statfs         = simple_statfs,
> > +     .statfs         = simple_statfs,
> > +     .evict_inode    = kvm_gmem_evict_inode,
> >   };
> >
>
> As I understood, ->destroy_inode() may be more suitable place where the xarray is
> released. ->evict_inode() usually detach the inode from the existing struct, to make
> it offline. ->destroy_inode() is actually the place where the associated resource
> (memory) is relased.
>
> Another benefit with ->destroy_inode() is we're not concerned to truncate_inode_pages_final()
> and clear_inode().

I see. I'll give this a try.

>
> >   static int kvm_gmem_init_fs_context(struct fs_context *fc)
> > @@ -440,6 +471,7 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
> >                                                     loff_t size, u64 flags)
> >   {
> >       const struct qstr qname = QSTR_INIT(name, strlen(name));
> > +     struct kvm_gmem_inode_private *private;
> >       struct inode *inode;
> >       int err;
> >
> > @@ -448,10 +480,19 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
> >               return inode;
> >
> >       err = security_inode_init_security_anon(inode, &qname, NULL);
> > -     if (err) {
> > -             iput(inode);
> > -             return ERR_PTR(err);
> > -     }
> > +     if (err)
> > +             goto out;
> > +
> > +     err = -ENOMEM;
> > +     private = kzalloc(sizeof(*private), GFP_KERNEL);
> > +     if (!private)
> > +             goto out;
> > +
> > +#ifdef CONFIG_KVM_GMEM_MAPPABLE
> > +     xa_init(&private->mappable_offsets);
> > +#endif
> > +
> > +     inode->i_mapping->i_private_data = private;
> >
>
> The whole block of code needs to be guarded by CONFIG_KVM_GMEM_MAPPABLE because
> kzalloc(sizeof(...)) is translated to kzalloc(0) when CONFIG_KVM_GMEM_MAPPABLE
> is disabled, and kzalloc() will always fail. It will lead to unusable guest-memfd
> if CONFIG_KVM_GMEM_MAPPABLE is disabled.

Good point, thanks for pointing this out.

Cheers,
/fuad

> >       inode->i_private = (void *)(unsigned long)flags;
> >       inode->i_op = &kvm_gmem_iops;
> > @@ -464,6 +505,11 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
> >       WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> >
> >       return inode;
> > +
> > +out:
> > +     iput(inode);
> > +
> > +     return ERR_PTR(err);
> >   }
> >
> >   static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,
>
> Thanks,
> Gavin
>

