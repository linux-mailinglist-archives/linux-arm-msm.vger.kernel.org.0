Return-Path: <linux-arm-msm+bounces-45943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C449DA1A27E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2B91880210
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120941C5F14;
	Thu, 23 Jan 2025 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="evZUeoim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA120E032
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630173; cv=none; b=ZPv04GkCKRdClJcOfRKU/Z158bjvG2jUxWeJYWyx9oLc1kOX3ifI/LtCx405Xue8shBG0mK/vxKv6/fuqKCgO90rpyUP79Bh88xIsjSRUrB3xuZS5RSP19PfQrP8N8UOfbAAOO+OZS0DmcsenMIACLCjjiLa+Rwsg8ZgmqmPIOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630173; c=relaxed/simple;
	bh=3cSXteBWHqWocUZF8xYps6+3vZKpYE0MD7XfXphybQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGQrZ24swwfOhiitQylmuHiXHNEevrBbxepgBL9/pk0SgTGKYrjfK3BhNMXS8xETMF5OF3vm8ZorGkmAL/fLvU4vG3tXveKRf4in8AXSW0CA2NRRCvobbssC7SoikJLVap+2mGDkINrYSQdttPX4IchGPikbPoKT0s0nlFZ5ps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=evZUeoim; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467abce2ef9so215101cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737630170; x=1738234970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=534qKq2nBqfa72deztRkj55ApSevdTMjZbwAxpL0RdM=;
        b=evZUeoimymLPkILZfDxlprumFCZnKpbpQ+UoirN7GiemeeZD1K8BsZsrhsY8sauP58
         OBL5hLse1cPsozH10W8gVpZ+D25/M/MRH2yYZ4Vd4gh1uX/1bI/d4ZN1yTUHCy41j9M5
         oFLvetE+hmI9oWXBwoabulm4UU43Cr4gr3IP5W6CoHJZp2kr6M8k9ub46c68ibKsVawY
         Dngzo1yQaBLnR0qhaONMHMNcc2YitWgecGWo2a7Q6L7Rho3jpbxxB1bgGdY+gtIsvozI
         UwkmJBp8nQ1XenRdQa+YOYz1ZGVneF8ztN/luO6/T0xMmkbzWWcYE7mmNNJ7JlVJW19u
         7yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630170; x=1738234970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=534qKq2nBqfa72deztRkj55ApSevdTMjZbwAxpL0RdM=;
        b=VYlRi643taz9o1EnPUH1fx7+exW/1bVI0fwI322f7KvJxGlkM4bCtGZx2O2/lJbQli
         6UGP9T/nPk7nOE88pPBSok6YXOW+3ceTumPja0oeg3vjujERvn8DWJIvBWTgfFtNfy36
         XX7a2Hx8uFgMBI6QG91DugMcjf6wFNzCMn8ef6UTjs/pSYk4NGmuYUUJ/8mATvxsr6X/
         gks77NKJzpqg55svu+x7u1oZijWdW8lvDexOYGT9xhY55GumCO1sMwAeL89tjCGj00Gc
         sJgUjiKPBXpL1PNJHfyHItv4BdmczGAxQ19oI7/nD9RIRwL5ZtWoMVSJOosH34iKNQ60
         xe7g==
X-Forwarded-Encrypted: i=1; AJvYcCU+stzbcNCR3ZMsp3V5Zh800f0a7BU1PrGZMKoX26A+4ZQrcBq3xjjztBjjsGl+CZXXsxdMiIpyBHDT38Mh@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXPDVVaQXhxGf3tX+/2p2bIJD6tkAcwAJ8sp6Pb6SH+wVqA6N
	EpC6wUCTeRPk9hRn9z2nQS5Oj6yepcI1SwRtUu6RUpX5jeZ8dHKCF0DlvJ75WMo7U1C27WvPk+k
	2aw7DMBQqKMmWNerFfdmsCBOgSmq5gKGWnx4i
X-Gm-Gg: ASbGncvuy361SRAc4gy8zLY3GhSxX9BQ09nj9c/hc0z1MvVSHQCRqwPk/X6keSK7xhx
	U7KRx0hT9xSk0AtDK2W4BlnQBnj/lvoKmPKjI5J7lL+H3zj7HxjdMjvQy3fu2eYkbEfCTr1tooc
	lIkG+mP+LI2+nU2A==
X-Google-Smtp-Source: AGHT+IE5A0w2L1X658+LHB+HyANHlVbiZyxxn5KgmXf+b2y2M19U2pR8HBDe43GiSVDq5CUFfSxQSwUh+0yGvl72/Pg=
X-Received: by 2002:a05:622a:2b04:b0:466:a11c:cad2 with SMTP id
 d75a77b69052e-46e5dac8664mr2664671cf.7.1737630169569; Thu, 23 Jan 2025
 03:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com> <20250122152738.1173160-2-tabba@google.com>
 <647bbdac-df82-4cdb-a3e9-287d439b4ef7@redhat.com> <CA+EHjTyuVfveW7=seF0uvfpyQtLdZ1ywZ3Z1VmtGZ-z+kzhc7Q@mail.gmail.com>
 <dfb9d814-e728-441a-bd2f-172090db1e76@redhat.com>
In-Reply-To: <dfb9d814-e728-441a-bd2f-172090db1e76@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jan 2025 11:02:12 +0000
X-Gm-Features: AWEUYZnu-D_Bl2EeCiXhDS-e4549NCyPHJb7KJVcA8GOOTXtl1qu8IfoC4op6eE
Message-ID: <CA+EHjTwa43JrYoAJs+doELFuoEKgMp4+Wi74_ZpLS29HMHgRkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/9] KVM: guest_memfd: Allow host to mmap
 guest_memfd() pages
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
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

On Thu, 23 Jan 2025 at 10:28, David Hildenbrand <david@redhat.com> wrote:
>
> >>> +       bool
> >>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> >>> index 47a9f68f7b24..9ee162bf6bde 100644
> >>> --- a/virt/kvm/guest_memfd.c
> >>> +++ b/virt/kvm/guest_memfd.c
> >>> @@ -307,7 +307,78 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >>>        return gfn - slot->base_gfn + slot->gmem.pgoff;
> >>>    }
> >>>
> >>> +#ifdef CONFIG_KVM_GMEM_MAPPABLE
> >>> +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> >>> +{
> >>> +     struct inode *inode = file_inode(vmf->vma->vm_file);
> >>> +     struct folio *folio;
> >>> +     vm_fault_t ret = VM_FAULT_LOCKED;
> >>> +
> >>> +     filemap_invalidate_lock_shared(inode->i_mapping);
> >>> +
> >>> +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> >>
> >>
> >> Would the idea be later that kvm_gmem_get_folio() would fail on private
> >> memory, or do you envision other checks in this code here in the future?
> >
> > There would be other checks in the future, the idea is that they would
> > be the ones in:
> > https://lore.kernel.org/all/20250117163001.2326672-8-tabba@google.com/
> >
>
> Thanks, so I wonder if this patch should just add necessary callback(s)
> as well, to make this patch look like it adds most of the infrastructure
> on the mmap level.
>
> kvm_gmem_is_shared() or sth like that, documenting that it must be
> called after kvm_gmem_get_folio() -- with a raised folio reference /
> folio lock.
>
> Alternatively, provide a
>
>         kvm_gmem_get_shared_folio()
>
> that abstracts that operation.
>
> We could also for now ensure that we really only get small folios back,
> and even get rid of the clearing loop.
>
>
> The "WARN_ON_ONCE(folio_test_guestmem(folio)" would be added separately.
>
> In the context of this series, the callback would be a nop and always
> say "yes".

I agree, especially if this patch series were to serve as a prelude to
the other one that adds restricted mmap() support.

Cheers,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

