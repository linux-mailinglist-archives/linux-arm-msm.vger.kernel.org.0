Return-Path: <linux-arm-msm+bounces-53189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF75A7B7ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 08:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E474B3B6E4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 06:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADF3155316;
	Fri,  4 Apr 2025 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f0TXJWSF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2F847B
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 06:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749052; cv=none; b=EP7MXF7YlBPPI5Erz/7m1lW6rG072hRh9MwF7EXGqaEcegxXBdP+9FKd2jH8nOz7kedAqqdEeZDUg2eLORTSVR3od/F3Yd9RmnAmZptTjxjv5FGAqeUCVvf2WStEsYiDxbl9aTTeIyWIbm2bPst77V0GvySGYONyPs3fNgSe0JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749052; c=relaxed/simple;
	bh=6tboxHh39lsWBhL0q6KdQRyoD4CPiWoAevrPN4IVEBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu/1W3tnJSabYLA897Xc23ZQqqoa20hbXmKEHus7LSQt7xirQW8xxq0FRIRdgsv51dZIS92wSSj+LnXXQQ509YU82BgQGXEFKEuXPa5Vea3ygn4nQd3mIv4NvGp9uZu1JK2dANiJbJeiLE9Xl6+WSzK6dByVmcAKjHgGEe7sv+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f0TXJWSF; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4774611d40bso179771cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 23:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743749049; x=1744353849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QRp7k+A1pFrQ49ZEN8qzXLBlpSlTBAeehOkWfvELJA8=;
        b=f0TXJWSFvJuDyiUvltCyGdcfsFtZVImr7UawgnwcLt7IgXtGZvcpUa7n8DHgt5QzD6
         8ItV0erSurMjFhoVugBDKEPpRw1clsPWW8kmc6qe8TbFYy6jbcTnUkOTBgEMRtLqcqUO
         Mg9YcpxtYKuCvMzT/4Pmoz67hspNu0EbArTicuyuqAOBzf2DQa3CR/EW/cVBedjSPtcV
         HrtrNSWJhFM4nEvZrnr+EeNQhjHUnOrgS0kwv1YwuuwYxhcp5a20eMNeIEVkV2EFWSTf
         BrCBx+SrtSmOSVErRvQBYGApXPNxIvYDHZEiqJn9MCiHXFZa1a8/T9+bMDQTU6WLOkLr
         IQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743749049; x=1744353849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRp7k+A1pFrQ49ZEN8qzXLBlpSlTBAeehOkWfvELJA8=;
        b=F6L61d2XCwZeTJF8AlcZ0MXvmrbrBWqMTpGGAOe/Bw+TO0VY7zrwSsUVihwoW7AWSG
         QuULqi8EORFij3L6wunFr91b49LhuiePiELZH61FxVbty99WNdkrEYm9ytSphGmhs2FK
         iK9Rfzcmqm4QadwmeeELMGiCdd8Wo4HtYdpN4ij3uT7cDQj+LrwhxNxwCRBdQaNtdu3S
         WQQhkxN0d/tdpI3aowq7RysIQ2luKMfP/yRwu2+2Mze5gLuPJJGY4GVLqp8wxAPcp5th
         078Y2iGIhauUgDQa2jttq9H19Lfl4ZFSR2dOwYJNEuarq1MhAb0b+635SBUNB4/C/tca
         Saeg==
X-Forwarded-Encrypted: i=1; AJvYcCWiFuEw5VcWyek77Ub5cTWryIBOmaOZwke2Uvuz+m8IdP0wMJpfhSqy6bk+beSEJhtcgIDUZazCw1mQUqL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8JHK5ZopsqyorFG12M4EhKRAYNRf0bDCOANKUWw9dkR98mFxy
	pIRoeLm+BBtij0kQpjlEs5M6Obm+nFDnayRc6JOwICrlboiQcPi0Mn/z6lmLPQkWqMUXYM2AqJy
	DjFf7perU3cHoYfNhhOsF67R9dWIwztO4nvp5
X-Gm-Gg: ASbGncsMgkK9o5/7HF/EqDiIh1mglaCPxTNwLDqiJs4GFmmLaKy1JLZ130iT9MsHhMH
	xogxYJ8Odt6EaW4CQGP+ebBW2Lblu1+ev8WXqimJxUUqI1zoJP8kZAvV68dZF8h+58Nqzweq5b/
	l327V1fst508M05qvmIh9oq49y9w==
X-Google-Smtp-Source: AGHT+IG09thUi2Cg5lfaR7AITr07s/waMELK/8mVmq0xXQpugyCN1C8fMQdmgtAODVMkq1XoS/cFYvIp5rTrjTIV7Wc=
X-Received: by 2002:ac8:5790:0:b0:477:871c:5e80 with SMTP id
 d75a77b69052e-4792654b0f3mr2010081cf.5.1743749049397; Thu, 03 Apr 2025
 23:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153133.3504118-4-tabba@google.com> <diqz1puanquh.fsf@ackerleytng-ctop.c.googlers.com>
 <Z-3OtjCJYyMXuUX7@google.com> <CA+EHjTwEFm1=pS6hBJ++zujkHCDQtCq548OKZirobPbzCzTqSA@mail.gmail.com>
 <Z-6gZGSbOvfrTPjV@google.com>
In-Reply-To: <Z-6gZGSbOvfrTPjV@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 4 Apr 2025 07:43:32 +0100
X-Gm-Features: ATxdqUFnj4_SKvrYDsdE58wYUCji883bNG1U9QIzdDfMDlyNRgNZNbRwG-gZp1U
Message-ID: <CA+EHjTzpd4BW3RfCRK=S9oNnjAYj_1k2xwxku+msgVwVLwd4Fg@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] KVM: guest_memfd: Track folio sharing within a
 struct kvm_gmem_private
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Thu, 3 Apr 2025 at 15:51, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Apr 03, 2025, Fuad Tabba wrote:
> > On Thu, 3 Apr 2025 at 00:56, Sean Christopherson <seanjc@google.com> wrote:
> > > On Wed, Apr 02, 2025, Ackerley Tng wrote:
> > > > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > > > index ac6b8853699d..cde16ed3b230 100644
> > > > > --- a/virt/kvm/guest_memfd.c
> > > > > +++ b/virt/kvm/guest_memfd.c
> > > > > @@ -17,6 +17,18 @@ struct kvm_gmem {
> > > > >     struct list_head entry;
> > > > >  };
> > > > >
> > > > > +struct kvm_gmem_inode_private {
> > > > > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > > > > +   struct xarray shared_offsets;
> > > > > +   rwlock_t offsets_lock;
> > > >
> > > > This lock doesn't work, either that or this lock can't be held while
> > > > faulting, because holding this lock means we can't sleep, and we need to
> > > > sleep to allocate.
> > >
> > > rwlock_t is a variant of a spinlock, which can't be held when sleeping.
> > >
> > > What exactly does offsets_lock protect, and what are the rules for holding it?
> > > At a glance, it's flawed.  Something needs to prevent KVM from installing a mapping
> > > for a private gfn that is being converted to shared.  KVM doesn't hold references
> > > to PFNs while they're mapped into the guest, and kvm_gmem_get_pfn() doesn't check
> > > shared_offsets let alone take offsets_lock.
> >
> > You're right about the rwlock_t. The goal of the offsets_lock is to
> > protect the shared offsets -- i.e., it's just meant to protect the
> > SHARED/PRIVATE status of a folio, not more, hence why it's not checked
> > in kvm_gmem_get_pfn(). It used to be protected by the
> > filemap_invalidate_lock, but the problem is that it would be called
> > from an interrupt context.
> >
> > However, this is wrong, as you've pointed out. The purpose of locking
> > is to ensure  that no two conversions of the same folio happen at the
> > same time. An alternative I had written up is to rely on having
> > exclusive access to the folio to ensure that, since this is tied to
> > the folio. That could be either by acquiring the folio lock, or
> > ensuring that the folio doesn't have any outstanding references,
> > indicating that we have exclusive access to it. This would avoid the
> > whole locking issue.
> >
> > > ... Something needs to prevent KVM from installing a mapping
> > > for a private gfn that is being converted to shared.  ...
> >
> > > guest_memfd currently handles races between kvm_gmem_fault() and PUNCH_HOLE via
> > > kvm_gmem_invalidate_{begin,end}().  I don't see any equivalent functionality in
> > > the shared/private conversion code.
> >
> > For in-place sharing, KVM can install a mapping for a SHARED gfn. What
> > it cannot do is install a mapping for a transient (i.e., NONE) gfn. We
> > don't rely on kvm_gmem_get_pfn() for that, but on the individual KVM
> > mmu fault handlers, but that said...
>
> Consumption of shared/private physical pages _must_ be enforced by guest_memfd.
> The private vs. shared state in the MMU handlers is that VM's view of the world
> and desired state.  The guest_memfd inode is the single source of true for the
> state of the _physical_ page.
>
> E.g. on TDX, if KVM installs a private SPTE for a PFN that is in actuality shared,
> there will be machine checks and the host will likely crash.

I agree. As a plus, I've made that change and it actually simplifies the logic .

> > > I would much, much prefer one large series that shows the full picture than a
> > > mish mash of partial series that I can't actually review, even if the big series
> > > is 100+ patches (hopefully not).
> >
> > Dropping the RFC from the second series was not intentional, the first
> > series is the one where I intended to drop the RFC. I apologize for
> > that.  Especially since I obviously don't know how to handle modules
> > and wanted some input on how to do that :)
>
> In this case, the rules for modules are pretty simple.  Code in mm/ can't call
> into KVM.  Either avoid callbacks entirely, or implement via a layer of
> indirection, e.g. function pointer or ops table, so that KVM can provide its
> implementation at runtime.

Ack.

Thanks again!
/fuad

