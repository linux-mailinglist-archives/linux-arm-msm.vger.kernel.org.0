Return-Path: <linux-arm-msm+bounces-63092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC98AEE204
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 17:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3124A7B1347
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 15:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F8328DF00;
	Mon, 30 Jun 2025 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F3CmB5gD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B897128BA85
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296145; cv=none; b=bjaQ+h/tFJkqEiUecNbqFfWfLOcX9OTz/CHr4DvjZI9aEHzwhpV/SGkgjTHPoQzu4H7v+9mhHV7y8SmFVy7/CuBxVdDDHOhZ5y04p5FOlr7n7VGVAjSsyS+qcWQdPp5sg9sbfpZeRFMA0Hh8UV650oHZXfiK63J5GFtnuIdILOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296145; c=relaxed/simple;
	bh=TJsvvXyM+K58ELlwYgcAkN0MrOQu+7dIlgp7ep7x7/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/b1ltrw/ew8pcwv/S/SrBtT5GzM9Ez0xPYGETAqXvfBAJd6kb6+N3+iKrKIpBNx4eGm8dk0cl+jA9donMxlVlYErg00+6iOzjmjuBMKmLc80NQrGSr9dvdLXkqOmkcPDkQy4kQTcHSu5s/IfB4FPEi19wkJs6ruWmAJ82V7lJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F3CmB5gD; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a7f5abac0aso610831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751296133; x=1751900933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9zc7dh7P1lgWJS7mxDw9ucf5qE4W+JY3tTCTmV57Sk=;
        b=F3CmB5gDWOwrY4Sy393Vjf/eIrj9D0WPJHOsJ/Qx31FGZ4T/DJsXlTh58hKelo5sv1
         bG4mCrAqRTUQmaCoeF7C5TyvZDENb0yBnzTB5n3tZbLUsVfjM1TZ3aFBRIiG3hirjN9n
         BGV1PeQPRiPD7MJh3qQlLfMkuMbPsDTEJxC4TXNIgBL4wBvKHo/2/2PZ6T0qerMbSg2o
         ynXHDYBVH+qF7jsUvbjwaf+yrn+8sZw3uDC7rdk9ng42m/smWygKDJXqp4k8fssoL/2H
         FktxsFaghjj1qthBwf1c7x0LJTVFK6/XQT7zgw/Sn6M6WOclO55rTVspOg83QmzcSwIf
         IUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751296133; x=1751900933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9zc7dh7P1lgWJS7mxDw9ucf5qE4W+JY3tTCTmV57Sk=;
        b=HNzOKhtbjmFSjt1iR7RY/hRHpaqIvW3S2b81SYkyZEIz44QIZosnDXHHC62FuqCfCC
         4YUCz7WpXSzMICWTt780xwaRKXKwIoNkNaEk9XusQeX2ZC8MnuWLbjuyqDeABT0TzT56
         z+L83zWGEfrGO5vW7Ux4XbF0cWHRzeA64Q5Ek6uyBwlM/nBHPXWRAwJh5hjABEHcXTP/
         /2mLbvzuHJknWC+jH0w9PbqO5qZul2QO5/E0D5AlXvUVyLOdZuANy1SqmbET4PGtvlA/
         8+NYIGAhNqL9NrxysBUN/Nz7+3HxmPa9iBSmM1sNAR0f9wL5Jzp0aguPJtMqNQ0P+O8p
         AQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBVHFl7tCbDPdxTmVe7LugA8pCD3I8CbRGZ9eBHazZJQz4trG0IZr4OCo2ZojGrxK0yIyCaNlGbSLSaP76@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu78k8VtatL6JCnvV+bdKVk4CWuwZdplVKZlRSfMCtvSX1RK+I
	6ArzDBwAm7BGjOJZPJ0hX2bdYBpxETizTOIYRilpEVST13hdnWqNGjEzCyby0adBNmcSvxCrzxP
	F/fUe8T49hv72IgvouV3c4vVfphH9eGQ6pnDeR4Vo
X-Gm-Gg: ASbGncumqGuZ0VsATAd/u66byesyxt1HBYsHn9tqh+94nmPI05B3pR9QyJAXwxJ5QaS
	Orp0cuJnK/Mx/uZ22UwmfFb/98vaxUpyig4Q2M04FWLIUoG6u5znm+1sTu1hDIWzuf9oEVRixFG
	zWhMmKPPmyRcRcNsy4AerJKMtoc8BrbggzSu3PESc9GDuuNtkysILrZ/ocurGUdsykJU148kXo
X-Google-Smtp-Source: AGHT+IEAJHntXvAOV1chFvSWMzzoa2E2Wr2z/57HwB/g/e31w0jd5eukZ0N4vcyJ/fQ4WL3KEcCE5QT8BRvAm0FGvTw=
X-Received: by 2002:a05:622a:45:b0:4a5:9b0f:a150 with SMTP id
 d75a77b69052e-4a807a7ea01mr8193561cf.16.1751296132075; Mon, 30 Jun 2025
 08:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <20250611133330.1514028-11-tabba@google.com>
 <aEyhHgwQXW4zbx-k@google.com> <diqz1pr8lndp.fsf@ackerleytng-ctop.c.googlers.com>
 <diqza55tjkk1.fsf@ackerleytng-ctop.c.googlers.com> <CA+EHjTxECJ3=ywbAPvpdA1-pm=stXWqU75mgG1epWaXiUr0raw@mail.gmail.com>
 <diqzv7odjnln.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzv7odjnln.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 30 Jun 2025 16:08:15 +0100
X-Gm-Features: Ac12FXycjJtBWANvsS5V_wk3Bnhi9TM26-KzVDt2bOQ1K3HTN8DgGikkfAsHdWI
Message-ID: <CA+EHjTwqOwO2zVd4zTYF7w7reTWMNjmCV6XnKux2JtPwYCAoZQ@mail.gmail.com>
Subject: Re: [PATCH v12 10/18] KVM: x86/mmu: Handle guest page faults for
 guest_memfd with shared memory
To: Ackerley Tng <ackerleytng@google.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ackerley,

On Mon, 30 Jun 2025 at 15:44, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > Hi Ackerley,
> >
> > On Fri, 27 Jun 2025 at 16:01, Ackerley Tng <ackerleytng@google.com> wro=
te:
> >>
> >> Ackerley Tng <ackerleytng@google.com> writes:
> >>
> >> > [...]
> >>
> >> >>> +/*
> >> >>> + * Returns true if the given gfn's private/shared status (in the =
CoCo sense) is
> >> >>> + * private.
> >> >>> + *
> >> >>> + * A return value of false indicates that the gfn is explicitly o=
r implicitly
> >> >>> + * shared (i.e., non-CoCo VMs).
> >> >>> + */
> >> >>>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >> >>>  {
> >> >>> -   return IS_ENABLED(CONFIG_KVM_GMEM) &&
> >> >>> -          kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIB=
UTE_PRIVATE;
> >> >>> +   struct kvm_memory_slot *slot;
> >> >>> +
> >> >>> +   if (!IS_ENABLED(CONFIG_KVM_GMEM))
> >> >>> +           return false;
> >> >>> +
> >> >>> +   slot =3D gfn_to_memslot(kvm, gfn);
> >> >>> +   if (kvm_slot_has_gmem(slot) && kvm_gmem_memslot_supports_share=
d(slot)) {
> >> >>> +           /*
> >> >>> +            * Without in-place conversion support, if a guest_mem=
fd memslot
> >> >>> +            * supports shared memory, then all the slot's memory =
is
> >> >>> +            * considered not private, i.e., implicitly shared.
> >> >>> +            */
> >> >>> +           return false;
> >> >>
> >> >> Why!?!?  Just make sure KVM_MEMORY_ATTRIBUTE_PRIVATE is mutually ex=
clusive with
> >> >> mappable guest_memfd.  You need to do that no matter what.
> >> >
> >> > Thanks, I agree that setting KVM_MEMORY_ATTRIBUTE_PRIVATE should be
> >> > disallowed for gfn ranges whose slot is guest_memfd-only. Missed tha=
t
> >> > out. Where do people think we should check the mutual exclusivity?
> >> >
> >> > In kvm_supported_mem_attributes() I'm thiking that we should still a=
llow
> >> > the use of KVM_MEMORY_ATTRIBUTE_PRIVATE for other non-guest_memfd-on=
ly
> >> > gfn ranges. Or do people think we should just disallow
> >> > KVM_MEMORY_ATTRIBUTE_PRIVATE for the entire VM as long as one memslo=
t is
> >> > a guest_memfd-only memslot?
> >> >
> >> > If we check mutually exclusivity when handling
> >> > kvm_vm_set_memory_attributes(), as long as part of the range where
> >> > KVM_MEMORY_ATTRIBUTE_PRIVATE is requested to be set intersects a ran=
ge
> >> > whose slot is guest_memfd-only, the ioctl will return EINVAL.
> >> >
> >>
> >> At yesterday's (2025-06-26) guest_memfd upstream call discussion,
> >>
> >> * Fuad brought up a possible use case where within the *same* VM, we
> >>   want to allow both memslots that supports and does not support mmap =
in
> >>   guest_memfd.
> >> * Shivank suggested a concrete use case for this: the user wants a
> >>   guest_memfd memslot that supports mmap just so userspace addresses c=
an
> >>   be used as references for specifying memory policy.
> >> * Sean then added on that allowing both types of guest_memfd memslots
> >>   (support and not supporting mmap) will allow the user to have a seco=
nd
> >>   layer of protection and ensure that for some memslots, the user
> >>   expects never to be able to mmap from the memslot.
> >>
> >> I agree it will be useful to allow both guest_memfd memslots that
> >> support and do not support mmap in a single VM.
> >>
> >> I think I found an issue with flags, which is that GUEST_MEMFD_FLAG_MM=
AP
> >> should not imply that the guest_memfd will provide memory for all gues=
t
> >> faults within the memslot's gfn range (KVM_MEMSLOT_GMEM_ONLY).
> >>
> >> For the use case Shivank raised, if the user wants a guest_memfd memsl=
ot
> >> that supports mmap just so userspace addresses can be used as referenc=
es
> >> for specifying memory policy for legacy Coco VMs where shared memory
> >> should still come from other sources, GUEST_MEMFD_FLAG_MMAP will be se=
t,
> >> but KVM can't fault shared memory from guest_memfd. Hence,
> >> GUEST_MEMFD_FLAG_MMAP should not imply KVM_MEMSLOT_GMEM_ONLY.
> >>
> >> Thinking forward, if we want guest_memfd to provide (no-mmap) protecti=
on
> >> even for non-CoCo VMs (such that perhaps initial VM image is populated
> >> and then VM memory should never be mmap-ed at all), we will want
> >> guest_memfd to be the source of memory even if GUEST_MEMFD_FLAG_MMAP i=
s
> >> not set.
> >>
> >> I propose that we should have a single VM-level flag to solve this (in
> >> line with Sean's guideline that we should just move towards what we wa=
nt
> >> and not support non-existent use cases): something like
> >> KVM_CAP_PREFER_GMEM.
> >>
> >> If KVM_CAP_PREFER_GMEM_MEMORY is set,
> >>
> >> * memory for any gfn range in a guest_memfd memslot will be requested
> >>   from guest_memfd
> >> * any privacy status queries will also be directed to guest_memfd
> >> * KVM_MEMORY_ATTRIBUTE_PRIVATE will not be a valid attribute
> >>
> >> KVM_CAP_PREFER_GMEM_MEMORY will be orthogonal with no validation on
> >> GUEST_MEMFD_FLAG_MMAP, which should just purely guard mmap support in
> >> guest_memfd.
> >>
> >> Here's a table that I set up [1]. I believe the proposed
> >> KVM_CAP_PREFER_GMEM_MEMORY (column 7) lines up with requirements
> >> (columns 1 to 4) correctly.
> >>
> >> [1] https://lpc.events/event/18/contributions/1764/attachments/1409/37=
10/guest_memfd%20use%20cases%20vs%20guest_memfd%20flags%20and%20privacy%20t=
racking.pdf
> >
> > I'm not sure this naming helps. What does "prefer" imply here? If the
> > caller from user space does not prefer, does it mean that they
> > mind/oppose?
> >
>
> Sorry, bad naming.
>
> I used "prefer" because some memslots may not have guest_memfd at
> all. To clarify, a "guest_memfd memslot" is a memslot that has some
> valid guest_memfd fd and offset. The memslot may also have a valid
> userspace_addr configured, either mmap-ed from the same guest_memfd fd
> or from some other backing memory (for legacy CoCo VMs), or NULL for
> userspace_addr.
>
> I meant to have the CAP enable KVM_MEMSLOT_GMEM_ONLY of this patch
> series for all memslots that have some valid guest_memfd fd and offset,
> except if we have a VM-level CAP, KVM_MEMSLOT_GMEM_ONLY should be moved
> to the VM level.

Regardless of the name, I feel that this functionality at best does
not belong in this series, and potentially adds more confusion.

Userspace should be specific about what it wants, and they know what
kind of memslots there are in the VM: userspace creates them. In that
case, userspace can either create a legacy memslot, no need for any of
the new flags, or it can create a guest_memfd memslot, and then use
any new flags to qualify that. Having a flag/capability that means
something for guest_memfd memslots, but effectively keeps the same
behavior for legacy ones seems to add more confusion.

> > Regarding the use case Shivank mentioned, mmaping for policy, while
> > the use case is a valid one, the raison d'=C3=AAtre of mmap is to map i=
nto
> > user space (i.e., fault it in). I would argue that if you opt into
> > mmap, you are doing it to be able to access it.
>
> The above is in conflict with what was discussed on 2025-06-26 IIUC.
>
> Shivank brought up the case of enabling mmap *only* to be able to set
> mempolicy using the VMAs, and Sean (IIUC) later agreed we should allow
> userspace to only enable mmap but still disable faults, so that userspace
> is given additional protection, such that even if a (compromised)
> userspace does a private-to-shared conversion, userspace is still not
> allowed to fault in the page.

I don't think there's a conflict :)  What I think is this is outside
of the scope of this series for a few reasons:

- This is prior to the mempolicy work (and is the base for it)
- If we need to, we can add a flag later to restrict mmap faulting
- Once we get in-place conversion, the mempolicy work could use the
ability to disallow mapping for private memory

By actually implementing something now, we would be restricting the
mempolicy work, rather than helping it, since we would effectively be
deciding now how that work should proceed. By keeping this the way it
is now, the mempolicy work can explore various alternatives.

I think we discussed this in the guest_memfd sync of 2025-06-12, and I
think this was roughly our conclusion.

> Hence, if we want to support mmaping just for policy and continue to
> restrict faulting, then GUEST_MEMFD_FLAG_MMAP should not imply
> KVM_MEMSLOT_GMEM_ONLY.
>
> > To me, that seems like
> > something that merits its own flag, rather than mmap. Also, I recall
> > that we said that later on, with inplace conversion, that won't be
> > even necessary.
>
> On x86, as of now I believe we're going with an ioctl that does *not*
> check what the guest prefers and will go ahead to perform the
> private-to-shared conversion, which will go ahead to update
> shareability.

Here I think you're making my case that we're dragging more complexity
from future work/series into this series, since now we're going into
the IOCTLs for the conversion series :)

> > In other words, this would also be trying to solve a
> > problem that we haven't yet encountered and that we have a solution
> > for anyway.
> >
>
> So we don't have a solution for the use case where userspace wants to
> mmap but never fault for userspace's protection from stray
> private-to-shared conversions, unless we decouple GUEST_MEMFD_FLAG_MMAP
> and KVM_MEMSLOT_GMEM_ONLY.
>
> > I think that, unless anyone disagrees, is to go ahead with the names
> > we discussed in the last meeting. They seem to be the ones that make
> > the most sense for the upcoming use cases.
> >
>
> We could also discuss if we really want to support the use case where
> userspace wants to mmap but never fault for userspace's protection from
> stray private-to-shared conversions.

I would really rather defer that work to when it's needed. It seems
that we should aim to land this series as soon as possible, since it's
the one blocking much of the future work. As far as I can tell,
nothing here precludes introducing the mechanism of supporting the
case where userspace wants to mmap but never fault, once it's needed.
This was I believe what we had agreed on in the sync on 2025-06-26.

Cheers,
/fuad

