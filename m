Return-Path: <linux-arm-msm+bounces-61650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 188C3ADE019
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 02:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3BF189AC56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 00:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEC570830;
	Wed, 18 Jun 2025 00:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AXXE/KGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153B2F5301
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 00:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750207226; cv=none; b=LWiqfNpTu6pwFvV8NPhH7TYLGNBwwRFYUfWZeLL8EZRrx69Dj5bB1NOgGrytl4qOfv/b/RnW506/1Y5OUGrGNQDtcrMaY2JuE1w1eaIWA5bWgxRm+bZsHinMpAUEshsWAlfIiKc5KNbQrNIMq7MkKdwVNTWe12mThOMXGsNqhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750207226; c=relaxed/simple;
	bh=Yvp8SNdsJcGrrxssUzVqkAxiC5tM/QgGNkfM+x9d4NA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aBWc5rTUliWeaPfwVtX8kL5b/24eD2W2iVatgoRoD7fSnfWsD5RXGj7J10oOg3fMp3xG8mLGaTqf9xOd82tdXtoXt/3lUfkZ2hy/v4Guks42SwvgGwTvpxJRiJuVxphfakrNe1JJW9bauGSx+2q4Immz+3Yny+RTNtmYRVuLnTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AXXE/KGG; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747af0bf0ebso5153227b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 17:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750207224; x=1750812024; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k/9aJlHm+goEi0z8rczKBwE3W8+faYM+8dllr+qUaic=;
        b=AXXE/KGGJVyqHCnH2vAzu3C+Kt2cXPpwYGA3xicHYL10YIrwkGBDgWXkYGHYGLjxEU
         PE1+KrDMBIM29DcqGlO5LAsiIHOjCw0B/1R8rwEnN8IQQc5atyVSHfQbwo0AgM2bzgOg
         5drJRBgPFr52ztNn1rLBprt0K+zr4cesVuv8z8uy9lYNnLvOOiXQ+/puraHjFhB++9+e
         iLXWSW2QlApVKu6vyvE9WFq5hXVzAOgOafFnCKVosm98ZI83ltlWqMsk2s7pz+/C2gK3
         5VYGQEvqAF2qI+XuXFYQdzAZ7W7X9eaRguXnfd1bOUBBnSB835FUWRVwvI+Bu/cW/Jnt
         YLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750207224; x=1750812024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/9aJlHm+goEi0z8rczKBwE3W8+faYM+8dllr+qUaic=;
        b=n0Es4D10trqCb1JtmuW3HODP7ULm+rdAxkY8RNxb/zfDpEnj5sDrinKXR3wbQWHHoZ
         CuGVEc+eCy1rFLNDhq7qHT9YWZB6pJsEb014g5lQOhMmbyRDbkmaskW6cLb5Li/W2+Jj
         A3zVXvDZafiud+elNaDEz9/1mjWBI0GkapN5NmXvbhQIIoahXHRQfXxPraQe/bsmtzhG
         JxgNf/Oy5mRPXBa/1HBZoumFDo/jAOf5yxetKeAA6hpZczBrRguS22AKAlmnb+7/+b5b
         5eIqbYSerOrTtl7dvs5tDpPfhbxfZeDM4wsRoq3dqAjQr/5KubqSSMYHcQdY7DKKJRIb
         DRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2a+Vmqmm0qlTnPU/O853VWKwUoQzwGNop+7OrhGRBKP5n2OWI8HZo0+V7w3t6ueS8jHRA1VqLSzoXNY79@vger.kernel.org
X-Gm-Message-State: AOJu0YwNn8cGJzVRK2ISyyrAfOcHR0qEtQfpdpN5r8yWulEW9QJLSlPl
	zZD52iAePwq5TjKF5QNMY6O4GnfgH4NmngjtF+FCYtBaDRAlYBR982kKl6Oll2ep5M6ohdNITJo
	4drXrGA==
X-Google-Smtp-Source: AGHT+IFnYwYFUetnQyZQ6TOSbasVaExJ476XGu1ioWQ0wajRmFxtx38py86YH2tJpmtJ5k1m1wGBTN+0spM=
X-Received: from pfbch3.prod.google.com ([2002:a05:6a00:2883:b0:746:22b3:4c0d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a19:b0:746:1e35:3307
 with SMTP id d2e1a72fcca58-7489cfd5ee0mr20211902b3a.14.1750207224147; Tue, 17
 Jun 2025 17:40:24 -0700 (PDT)
Date: Tue, 17 Jun 2025 17:40:22 -0700
In-Reply-To: <701c8716-dd69-4bf6-9d36-4f8847f96e18@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <20250611133330.1514028-9-tabba@google.com>
 <aEySD5XoxKbkcuEZ@google.com> <68501fa5dce32_2376af294d1@iweiny-mobl.notmuch>
 <bbc213c3-bc3d-4f57-b357-a79a9e9290c5@redhat.com> <CA+EHjTxvqDr1tavpx7d9OyC2VfUqAko864zH9Qn5+B0UQiM93g@mail.gmail.com>
 <701c8716-dd69-4bf6-9d36-4f8847f96e18@redhat.com>
Message-ID: <aFIK9l6H7qOG0HYB@google.com>
Subject: Re: [PATCH v12 08/18] KVM: guest_memfd: Allow host to map guest_memfd pages
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Fuad Tabba <tabba@google.com>, Ira Weiny <ira.weiny@intel.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 16, 2025, David Hildenbrand wrote:
> On 16.06.25 16:16, Fuad Tabba wrote:
> > On Mon, 16 Jun 2025 at 15:03, David Hildenbrand <david@redhat.com> wrote:
> > > > > IMO, GUEST_MEMFD_FLAG_SHAREABLE would be more appropriate.  But even that is
> > > > > weird to me.  For non-CoCo VMs, there is no concept of shared vs. private.  What's
> > > > > novel and notable is that the memory is _mappable_.  Yeah, yeah, pKVM's use case
> > > > > is to share memory, but that's a _use case_, not the property of guest_memfd that
> > > > > is being controlled by userspace.
> > > > > 
> > > > > And kvm_gmem_memslot_supports_shared() is even worse.  It's simply that the
> > > > > memslot is bound to a mappable guest_memfd instance, it's that the guest_memfd
> > > > > instance is the _only_ entry point to the memslot.
> > > > > 
> > > > > So my vote would be "GUEST_MEMFD_FLAG_MAPPABLE", and then something like
> > > > 
> > > > If we are going to change this; FLAG_MAPPABLE is not clear to me either.
> > > > The guest can map private memory, right?  I see your point about shared
> > > > being overloaded with file shared but it would not be the first time a
> > > > term is overloaded.  kvm_slot_has_gmem() does makes a lot of sense.
> > > > 
> > > > If it is going to change; how about GUEST_MEMFD_FLAG_USER_MAPPABLE?
> > > 
> > > If "shared" is not good enough terminology ...
> > > 
> > > ... can we please just find a way to name what this "non-private" memory
> > > is called?

guest_memfd?  Not trying to be cheeky, I genuinely don't understand the need
to come up with a different name.  Before CoCo came along, I can't think of a
single time where we felt the need to describe guest memory.  There have been
*many* instances of referring to the underlying backing store (e.g. HugeTLB vs.
THP), and many instances where we've needed to talk about the types of mappings
for guest memory, but I can't think of any cases where describing the state of
guest memory itself was ever necessary or even useful.
 
> > > That something is mappable into $whatever is not the right
> > > way to look at this IMHO.

Why not?  Honest question.  USER_MAPPABLE is very literal, but I think it's the
right granularity.  E.g. we _could_ support read()/write()/etc, but it's not
clear to me that we need/want to.  And so why bundle those under SHARED, or any
other one-size-fits-all flag?

> > > As raised in the past, we can easily support read()/write()/etc to this
> > > non-private memory.
> > > 
> > > I'll note, the "non-private" memory in guest-memfd behaves just like ...
> > > the "shared" memory in shmem ... well, or like other memory in memfd.
> > > (which is based on mm/shmem.c).
> > > 
> > > "Private" is also not the best way to describe the "protected\encrypted"
> > > memory, but that ship has sailed with KVM_MEMORY_ATTRIBUTE_PRIVATE.

Heh, I would argue that ship sailed when TDX called the PTE flag the Shared bit :-)

But yeah, in hindsight, maybe not the greatest name.

> > > I'll further note that in the doc of KVM_SET_USER_MEMORY_REGION2 we talk
> > > about "private" vs "shared" memory ... so that would have to be improved
> > > as well.
> > 
> > To add to what David just wrote, V1 of this series used the term
> > "mappable" [1].  After a few discussions, I thought the consensus was
> > that "shared" was a more accurate description --- i.e., mappability
> > was a side effect of it being shared with the host.

As I mentioned in the other thread with respect to sharing between other
entities, simply SHARED doesn't provide sufficient granularity.  HOST_SHAREABLE
gets us closer, but I still don't like that because it implies the memory is
100% shareable, e.g. can be accessed just like normal memory.

And for non-CoCo x86 VMs, sharing with host userspace isn't even necessarily the
goal, i.e. "sharing" is a side effect of needing to allow mmap() so that KVM can
continue to function.

> > One could argue that non-CoCo VMs have no concept of "shared" vs
> > "private".

I am that one :-)

> A different way of looking at it is, non-CoCo VMs have
> > their state as shared by default.

Eh, there has to be another state for there to be a default.  

> All memory of these VMs behaves similar to other memory-based shared memory
> backends (memfd, shmem) in the system, yes. You can map it into multiple
> processes and use it like shmem/memfd.

Ya, but that's more because guest_memfd only supports MAP_SHARED, versus KVM
really wanting to truly share the memory with the entire system.

Of course, that's also an argument to some extent against USER_MAPPABLE, because
that name assumes we'll never want to support MAP_PRIVATE.  But letting userspace
MAP_PRIVATE guest_memfd would completely defeat the purpose of guest_memfd, so
unless I'm forgetting a wrinkle with MAP_PRIVATE vs. MAP_SHARED, that's an
assumption I'm a-ok making.

If we are really dead set on having SHARED in the name, it could be
GUEST_MEMFD_FLAG_USER_MAPPABLE_SHARED or GUEST_MEMFD_FLAG_USER_MAP_SHARED?  But
to me that's _too_ specific and again somewhat confusing given the unfortunate
private vs. shared usage in CoCo-land.  And just playing the odds, I'm fine taking
a risk of ending up with GUEST_MEMFD_FLAG_USER_MAPPABLE_PRIVATE or whatever,
because I think that is comically unlikely to happen.

> I'm still thinking about another way to call non-private memory ... no
> success so far. "ordinary" or "generic" is .... not better.

As above, I don't have the same sense of urgency regarding finding a name for
guest_memfd.

