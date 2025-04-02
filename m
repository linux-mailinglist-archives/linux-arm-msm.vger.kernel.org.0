Return-Path: <linux-arm-msm+bounces-53066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 678ABA79926
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 01:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A923B4641
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 23:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF381F8726;
	Wed,  2 Apr 2025 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r4yfJmgl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EC1F0E36
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 23:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743638201; cv=none; b=B/h4Hn2TpoZy0n+j3qnb1j/DUVjh/sNECe5WptIXAxSVhqHytcohaz5eOnMgyfaut7MxOY6Ku86+ym02+RdbrEvi7e5Wp6cvee625obqltg3yv09onRpzr/XX2ZvhC45ufayFKdAMThPwHvI/OWYdBsnca8mGKWzAPhkqrJjxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743638201; c=relaxed/simple;
	bh=nNa8PH8NePgpbzvnqhnNn/kePEDAWggcqoTK0ZxFYMo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SaFELgUUwXLThid9cLzV8i/g4GOIBNJFlSF00Mur1AOWpaCPHn1c0pYtDaYItmT+nzcwfy9p4ZauQYJLSWSJBUYIXQyWHkIW5Iufoug735Rihar0o0p0NQtt9B6CdtTUuQBC3le2JVyT4yTceQcKUxsfNQHHyrsdwTeomz0Rw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r4yfJmgl; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2254bdd4982so5268555ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 16:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743638200; x=1744243000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4vIm6df2fo6Fewjd44SIeiPxj02slwP9HDZ1sfVq81A=;
        b=r4yfJmglBNpbTHlwXtjRl0U51WWAfndbnNMFWFNzIUSsz+rjn/EBFKaZm+436j4ggo
         qccmlw89PqYmHwAfdKLAjmoufyypxXi1RzHxHOxZveFRnx80mQtw7tqO3kmmK/Oa+v/7
         aJt26j3zyJ7/kxPrvNNacy7Bnzc1B+QvjX3NeSJGUcusmrHSGZRqaauKq8YZt11pBjhl
         Cp9ZaXNLcoJXkDPlDhj5QBUoUTDfCYeoqgDaq8j6VrMWnlo+ljBdnqAwQmjjENY83rZK
         cxWnV5MyAA91LNvSUy8CBPAXQ1Rm7gO/bFCvAtIZygRLgArtZflLSvJM/mDq7SSD1vhM
         MZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638200; x=1744243000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vIm6df2fo6Fewjd44SIeiPxj02slwP9HDZ1sfVq81A=;
        b=i7cF+GBn2kh+4n26xkySY9iFvkUp9kjAX5Bfy41YQpZf4JeOHo1KlS5XWyQcz5R2MI
         A36Vm5KejGBeXLz5yWWEvIoQX2YJI5YfExkAYzKqKi92m4/Z5JvtxpWWGFDmmKYFf3K9
         Q+UwVEC52YoxTGHHkbzy90BsAUo6YLX1zPfiXHzsiUevDMUGbn9eqNSF3iZQKUoFGZut
         3keI3wJBqE59EedBK/1vSZQD8tetEuYMmlru9l2jN0ommF0NWa3FvxdotbSFlsTIChA6
         St9Q/Wf+ew2ZjtyvN3SQzsWj7xCr2o5XT0UQa6gJ9lZEZBpFFPxp2vvGfsMb31fMbLdb
         alOw==
X-Forwarded-Encrypted: i=1; AJvYcCVGkBF9GM0PcVGOjeJ8G9cLh/qTH5f8dz5Hy74ETpidVe3fSjAjVfS7QIxAyYK48ApZaEt1SEmALEqznKue@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9rngMT1smnVHld1rkESGssQkHUYMPW+xOcHCS3AivRwNK9HNP
	ZQ5s4c/S+pwaZJ2ZhOwxNHsTDcWbaWegUCOrL3zYZk1Q6i4h0qe75a36MZRyJofXkMvRhdTWS8G
	Pxw==
X-Google-Smtp-Source: AGHT+IGFMwLksy4XiBzz9HIDdqWCU4ltuYagyIkABhVEC+CyeQTlhxy73EaRBIaDFauOrErYz/GyNbcvcZ8=
X-Received: from pfbg6.prod.google.com ([2002:a05:6a00:ae06:b0:736:3d80:706e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db05:b0:21f:1bd:efd4
 with SMTP id d9443c01a7336-2296c65f460mr54081795ad.19.1743638199570; Wed, 02
 Apr 2025 16:56:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:56:38 -0700
In-Reply-To: <diqz1puanquh.fsf@ackerleytng-ctop.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328153133.3504118-4-tabba@google.com> <diqz1puanquh.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <Z-3OtjCJYyMXuUX7@google.com>
Subject: Re: [PATCH v7 3/7] KVM: guest_memfd: Track folio sharing within a
 struct kvm_gmem_private
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 02, 2025, Ackerley Tng wrote:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index ac6b8853699d..cde16ed3b230 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -17,6 +17,18 @@ struct kvm_gmem {
> >  	struct list_head entry;
> >  };
> >  
> > +struct kvm_gmem_inode_private {
> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > +	struct xarray shared_offsets;
> > +	rwlock_t offsets_lock;
> 
> This lock doesn't work, either that or this lock can't be held while
> faulting, because holding this lock means we can't sleep, and we need to
> sleep to allocate.

rwlock_t is a variant of a spinlock, which can't be held when sleeping.

What exactly does offsets_lock protect, and what are the rules for holding it?
At a glance, it's flawed.  Something needs to prevent KVM from installing a mapping
for a private gfn that is being converted to shared.  KVM doesn't hold references
to PFNs while they're mapped into the guest, and kvm_gmem_get_pfn() doesn't check
shared_offsets let alone take offsets_lock.

guest_memfd currently handles races between kvm_gmem_fault() and PUNCH_HOLE via
kvm_gmem_invalidate_{begin,end}().  I don't see any equivalent functionality in
the shared/private conversion code.

In general, this series is unreviewable as many of the APIs have no callers,
which makes it impossible to review the safety/correctness of locking.  Ditto
for all the stubs that are guarded by CONFIG_KVM_GMEM_SHARED_MEM.  

Lack of uAPI also makes this series unreviewable.  The tracking is done on the
guest_memfd inode, but it looks like the uAPI to toggle private/shared is going
to be attached to the VM.  Why?  That's just adds extra locks and complexity to
ensure the memslots are stable.

Lastly, this series is at v7, but to be very blunt, it looks RFC quality to my
eyes.  On top of the fact that it's practically impossible to review, it doesn't
even compile on x86 when CONFIG_KVM=m.

  mm/swap.c:110:(.text+0x18ba): undefined reference to `kvm_gmem_handle_folio_put'
  ERROR: modpost: "security_inode_init_security_anon" [arch/x86/kvm/kvm.ko] undefined!

The latter can be solved with an EXPORT, but calling module code from core mm/
is a complete non-starter.

Maybe much of this has discussed been discussed elsewhere and there's a grand
plan for how all of this will shake out.  I haven't been closely following
guest_memfd development due to lack of cycles, and unfortunately I don't expect
that to change in the near future.  I am more than happy to let y'all do the heavy
lifting, but when you submit something for inclusion (i.e. not RFC), then it needs
to actually be ready for inclusion.

I would much, much prefer one large series that shows the full picture than a
mish mash of partial series that I can't actually review, even if the big series
is 100+ patches (hopefully not).

