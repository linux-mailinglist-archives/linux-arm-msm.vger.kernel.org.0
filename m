Return-Path: <linux-arm-msm+bounces-53077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FDBA79ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 10:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDEF16C24E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 08:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9966C24167F;
	Thu,  3 Apr 2025 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0w0+3dwh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFDF224B15
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670731; cv=none; b=qtHIghn1Cv0aTM0WzI4KXL01AfezXX5twmhOZXrNlMaNnLPq2w8PuvKo4HqJyF4Jpjif4liyPUXxWeBiIMv1eCL+d6/WWOs7A8Y7yOVjgIKOs+UOPjTnuAut7bxIWzgPoe5MRwsBnAeoiKv2uRQmGO5aSXrg6IvK1jtjyfx1rkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670731; c=relaxed/simple;
	bh=F1CpqMw42M8Io79kf29gChKLPc31UvSyOkK2mkqVeN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvbhbQZ54QqistEvfa7rVD8iCYriCnt7+Xqe1yzmq3SaoRj+XK2P8ngVV4q7rgMvYcHyX1p9LZrj7pqzg1OlQH1mXsXIBvYhosERXj1pht7NF0M6snCaPNqtJ/hCGsyKpplWclOME26t2zNYiQ4pUWRSjNQCmXNuTwwKZD2Q7A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0w0+3dwh; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so853441cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743670729; x=1744275529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fgEvXXGP1m3zmYeTcI4rgOS5YVwaXYUmFGOy6VOVNWo=;
        b=0w0+3dwhryFBCxG2KcYIBp6FZk/AZkluE5C82yXeHV4oZoUMmQ742zn/jI664wMuQc
         eY8J+7wxM2zJjYlyQnYmcrkzw/nPOwoymyfIzlolPJNXK0K4g2xBnJ2mNwXiiYWN5eHy
         MdwGQO3icxLFOonwlskKBdg+EaLIyFBtu7XxlB5xPCjLjLtDXaKPrtj5ne6oLuTc3/Oe
         QRqfOelceNWnIjE6Rn9U7b8WAaYWN3NWZeaPU/9Z1TeIBZgzErREtqO7ivTdKEULJohw
         /g3PCaiqZYRi7xW/qJidxelqgA0rRX/hUcDY6uUwWgLPQZhfD6QGmgP2SIOW7oLlNwD/
         xx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670729; x=1744275529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgEvXXGP1m3zmYeTcI4rgOS5YVwaXYUmFGOy6VOVNWo=;
        b=iBBtcdOnz8KuHqlZtv4qXjkaUmfXo64xBzun9QgkHADKymgjZf9C2rZHuOMcNQzSMl
         QqTOSbnIfnW3wqECCzjHxuD6iZswsMc0V53apk3/gYrd0lBKI84PA8HR8Ma+Dg2j5ABg
         N2xhTJMISJ/JAEPNTN9DgyhXzld+M68Px2YyE/4keoc3ualDW+u9jTMq8IwxWBkx1rC0
         qP0ylL6R8TqHtR6wsEaRkHD7UY7oogRT7Y1hgEW+Eppt4+sZSGoVButuzXXmM0Pdt1UP
         zFDvuYgvpHLY9O7w0j7LvsMyxUmxMUVyV2GxDraxfw9G3m69NoFug7gePXOssY7VoZjq
         zyhA==
X-Forwarded-Encrypted: i=1; AJvYcCW7xiNOHubOf1fr/t2iUzbOZPr/xuDKFb6Yv6BE+RiLXKM66CIecVpsODv8Xt+4otT0QPSsXmjsNR0BkLiZ@vger.kernel.org
X-Gm-Message-State: AOJu0YznBXt2oJZLqKNFptBv+UA1X4HK87cpfIBBdOKN8HpblWqJSfFF
	gRtJHh/3tf0cFDnCmC0C4JCftCX9Ip/s2T1NFEaq307PtdOXCys2+83IJ4c8t/GdNUdsmzYWlnU
	AWixwpISLDr8NEFJxFz3OO8PoTMW7ZQ7Z6BhL5RBs4TX8EPAfeMdlWBg=
X-Gm-Gg: ASbGncsVkU6hOinn/L6IB4KUvBSxy6bH4b6aAUVgxZTk93PHXn7mtagl2e3jZDM0szd
	ZNCkag59fwXCLV4lssNEM9N4iKR0kjW+yIlUlUXmFU2qOpdjzIHn82v88zciW3l/87dQ+Bo7hqu
	sU7TQSfBLsDcSbtxtK6rbXbejdXw==
X-Google-Smtp-Source: AGHT+IH4z1ZoSa8PwetB2kA35wKdfJ5q0G85rEwN1y8WRnFjZbzsNpHMZmrHEnpAA2ytzXMV3Aqw3jt3qenjGkw42No=
X-Received: by 2002:ac8:754f:0:b0:479:1985:6687 with SMTP id
 d75a77b69052e-47919856707mr2761801cf.10.1743670728422; Thu, 03 Apr 2025
 01:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153133.3504118-4-tabba@google.com> <diqz1puanquh.fsf@ackerleytng-ctop.c.googlers.com>
 <Z-3OtjCJYyMXuUX7@google.com>
In-Reply-To: <Z-3OtjCJYyMXuUX7@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 3 Apr 2025 09:58:11 +0100
X-Gm-Features: ATxdqUEvRL22zZX7SKy0CqhFyY24csNGzfb54MwVhadb3Rb98o--x59svE21pzI
Message-ID: <CA+EHjTwEFm1=pS6hBJ++zujkHCDQtCq548OKZirobPbzCzTqSA@mail.gmail.com>
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

Hi Ackerley and Sean,


On Thu, 3 Apr 2025 at 00:56, Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Apr 02, 2025, Ackerley Tng wrote:
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index ac6b8853699d..cde16ed3b230 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -17,6 +17,18 @@ struct kvm_gmem {
> > >     struct list_head entry;
> > >  };
> > >
> > > +struct kvm_gmem_inode_private {
> > > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > > +   struct xarray shared_offsets;
> > > +   rwlock_t offsets_lock;
> >
> > This lock doesn't work, either that or this lock can't be held while
> > faulting, because holding this lock means we can't sleep, and we need to
> > sleep to allocate.
>
> rwlock_t is a variant of a spinlock, which can't be held when sleeping.
>
> What exactly does offsets_lock protect, and what are the rules for holding it?
> At a glance, it's flawed.  Something needs to prevent KVM from installing a mapping
> for a private gfn that is being converted to shared.  KVM doesn't hold references
> to PFNs while they're mapped into the guest, and kvm_gmem_get_pfn() doesn't check
> shared_offsets let alone take offsets_lock.

You're right about the rwlock_t. The goal of the offsets_lock is to
protect the shared offsets -- i.e., it's just meant to protect the
SHARED/PRIVATE status of a folio, not more, hence why it's not checked
in kvm_gmem_get_pfn(). It used to be protected by the
filemap_invalidate_lock, but the problem is that it would be called
from an interrupt context.

However, this is wrong, as you've pointed out. The purpose of locking
is to ensure  that no two conversions of the same folio happen at the
same time. An alternative I had written up is to rely on having
exclusive access to the folio to ensure that, since this is tied to
the folio. That could be either by acquiring the folio lock, or
ensuring that the folio doesn't have any outstanding references,
indicating that we have exclusive access to it. This would avoid the
whole locking issue.

> ... Something needs to prevent KVM from installing a mapping
> for a private gfn that is being converted to shared.  ...

> guest_memfd currently handles races between kvm_gmem_fault() and PUNCH_HOLE via
> kvm_gmem_invalidate_{begin,end}().  I don't see any equivalent functionality in
> the shared/private conversion code.

For in-place sharing, KVM can install a mapping for a SHARED gfn. What
it cannot do is install a mapping for a transient (i.e., NONE) gfn. We
don't rely on kvm_gmem_get_pfn() for that, but on the individual KVM
mmu fault handlers, but that said...

> In general, this series is unreviewable as many of the APIs have no callers,
> which makes it impossible to review the safety/correctness of locking.  Ditto
> for all the stubs that are guarded by CONFIG_KVM_GMEM_SHARED_MEM.
>
> Lack of uAPI also makes this series unreviewable.  The tracking is done on the
> guest_memfd inode, but it looks like the uAPI to toggle private/shared is going
> to be attached to the VM.  Why?  That's just adds extra locks and complexity to
> ensure the memslots are stable.

You're right. Back to your point from above, it might make more sense
to have that logic in kvm_gmem_get_pfn() instead. I'll work something
out.

> Lastly, this series is at v7, but to be very blunt, it looks RFC quality to my
> eyes.  On top of the fact that it's practically impossible to review, it doesn't
> even compile on x86 when CONFIG_KVM=m.
>
>   mm/swap.c:110:(.text+0x18ba): undefined reference to `kvm_gmem_handle_folio_put'
>   ERROR: modpost: "security_inode_init_security_anon" [arch/x86/kvm/kvm.ko] undefined!
>
> The latter can be solved with an EXPORT, but calling module code from core mm/
> is a complete non-starter.
>
> Maybe much of this has discussed been discussed elsewhere and there's a grand
> plan for how all of this will shake out.  I haven't been closely following
> guest_memfd development due to lack of cycles, and unfortunately I don't expect
> that to change in the near future.  I am more than happy to let y'all do the heavy
> lifting, but when you submit something for inclusion (i.e. not RFC), then it needs
> to actually be ready for inclusion.
>
> I would much, much prefer one large series that shows the full picture than a
> mish mash of partial series that I can't actually review, even if the big series
> is 100+ patches (hopefully not).

Dropping the RFC from the second series was not intentional, the first
series is the one where I intended to drop the RFC. I apologize for
that.  Especially since I obviously don't know how to handle modules
and wanted some input on how to do that :)

Splitting this series into two was my attempt at making it easier to
review, but I see it ended up making things more complicated. The next
one will be just one series.

Cheers,
/fuad

