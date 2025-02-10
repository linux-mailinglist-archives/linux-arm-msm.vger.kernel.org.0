Return-Path: <linux-arm-msm+bounces-47440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C9A2F27B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F2D1162316
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FCA247DF0;
	Mon, 10 Feb 2025 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrTNYMcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83D244EB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203488; cv=none; b=I5LtLosUSzDn57nSHiif7UgkopgYlimPNLfTmM2czGR8WWs6BBdK/XM84bauCbH/DG8zPz20ct67JnMCcjVgwjS5PZJ+GVPEotxO+A0w+Dr+JiWI+oCfvgsvdY44APunjuEphiG5G5tbfE08ZmYGAw18cDcRjKGzpCZkqcJLSiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203488; c=relaxed/simple;
	bh=8DHJ2UWLp7t2pVbkAlQFBbotjxQbfZDhI8zO9c6/tJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmZRYOMVhH9yk2B3hKGoe/gUGjHmbMcpDj8Dzhkz7AoipRxqrPFaVJcRIzadsnZlUVgyabUU28Ba0Kk4dRgGYNW5y1lDyVlpiGC+iYpDJUK96MkVk0ZlZyph5il36RFuT3hQj7MQfc5sR3T4NHmQ3LzbpQsDO9RmH9+/ZrdtS+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrTNYMcE; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47180c199ebso409491cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 08:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739203485; x=1739808285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcBTg4Wgx9l1UkrbP4fO7M94HUL3Hslq3degNWAQgeA=;
        b=rrTNYMcE+UCzVN4tqDqmGpA8gB8RtWyw5yTW0/r0EI5kbVtpt4OOhEC39tf8rd8MKi
         NoTiNjbE8+368PWV6QaQq06A+4HF8SKADRmDGiGpOHAHQM2Tcz5pmikvwoC1b9OQ82l/
         MOegItFUx59Q52mtrD3XjGoualbE1LMTvGAFiXPPbbbcUY9gfMjyLxulb19PM9b15y1J
         QIvwNz855tZZhBFPKSMAJXtBYv7ZSsBpZPQibgDogEjLvBIFgnXRDwDOeCH2HOMGOQNf
         vtg1hgc1zPR44cfcRewo3LRXiMNB0ny/Kf2AQ1Cb+u3r374aI+LZOPwEZJe28bdsa4Ny
         8DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203485; x=1739808285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcBTg4Wgx9l1UkrbP4fO7M94HUL3Hslq3degNWAQgeA=;
        b=SmP2ke87Yup2i5u0Lrcak1JeeIY+uX8Du6lkSNrC9dIa2AzXH1uZRS2obifHBJuEDo
         K3JhCvC0Uhmd7x2sBxXPro7yNrkCQrgAlPkwOX9XSUPUhgrbeu1uHN1j8Yv4QMjI2SC1
         nPU94bBF+GhqaZzmZMXlZJ9D0aT6lQgMvJ3D0BbwP3i8MRRc+E+nUZg6sTTrK5n08VKL
         pG1Oxkx7fwHqpThgOehts+8XFb+lUBIso6qymmv9f1km2j3R7QzIChDS7mvXaDPYvgmT
         A574mvhhErKbRqyfHWks1svqtUgq7FPITMmxftve7aA+uVj5KxyQF2uUl9dw9A52hQ2X
         9WXg==
X-Forwarded-Encrypted: i=1; AJvYcCVbK1KFiWKfrWrfmhI/fy9bwyjzkcdk6KX5os2maYkfIEhUU62lFm0uK/Suzm+UAzbgsLe97dCkl0ySkCzb@vger.kernel.org
X-Gm-Message-State: AOJu0YwDxJ8eWASGnUfqeaaG8p3Elzd/CKSEuNDUWQ+WiUSlR85FjqQZ
	yDCKJGeTjUw81T3QL+O1BAoknSNEB8GII9t/wOtMmREi3MmBJh2D9DafRvWXD5KsuwRiqSx1r4S
	OfIFMkJTqg/qzQh7MZf7djkk/oiDGX2fkjFEL
X-Gm-Gg: ASbGncv7TCsveZsRD09KMAV5GYu2kdbeN/eREXITayPFoYf0siu1+ntSa5BXy2jGFTx
	fq7IolU7i1390QyrwfDJ0MAqWYTAU4sLziKMVxYCvcZdUGRp48ZGz4YD+cEOeQiQW8v7Qiz4=
X-Google-Smtp-Source: AGHT+IEPhqgOY7/vjDJO9G9Kayo09mPAh4Owza9DV8lkYNo3V2kODOd7QSjFL6dbJJ0yHi4xvJ0CuU/eQiqf60I7yl4=
X-Received: by 2002:ac8:4a02:0:b0:465:3d28:8c02 with SMTP id
 d75a77b69052e-471837d8db6mr4873031cf.26.1739203484270; Mon, 10 Feb 2025
 08:04:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGtprH-K0hKYXbH82_9pObn1Cnau74JWVNQ+xkiSSqnmh6BUUQ@mail.gmail.com>
 <diqzed0aowwa.fsf@ackerleytng-ctop-specialist.c.googlers.com>
In-Reply-To: <diqzed0aowwa.fsf@ackerleytng-ctop-specialist.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 10 Feb 2025 16:04:07 +0000
X-Gm-Features: AWEUYZlYCTGs061p_Xgk33zraHEj1D0BCc_wrNzz8QY6p-YEtOzRpN_eEkVL548
Message-ID: <CA+EHjTwGMYkGUWCghBqN=MTuLLn_SCWZJNhdGYAmg=mn-YQiyg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
To: Ackerley Tng <ackerleytng@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, yu.c.zhang@linux.intel.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
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
Content-Transfer-Encoding: quoted-printable

Hi Ackerley,

On Fri, 7 Feb 2025 at 10:46, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Vishal Annapurve <vannapurve@google.com> writes:
>
> > On Wed, Feb 5, 2025 at 9:39=E2=80=AFAM Vishal Annapurve <vannapurve@goo=
gle.com> wrote:
> >>
> >> On Wed, Feb 5, 2025 at 2:07=E2=80=AFAM Fuad Tabba <tabba@google.com> w=
rote:
> >> >
> >> > Hi Vishal,
> >> >
> >> > On Wed, 5 Feb 2025 at 00:42, Vishal Annapurve <vannapurve@google.com=
> wrote:
> >> > >
> >> > > On Fri, Jan 17, 2025 at 8:30=E2=80=AFAM Fuad Tabba <tabba@google.c=
om> wrote:
> >> > > >
> >> > > > Before transitioning a guest_memfd folio to unshared, thereby
> >> > > > disallowing access by the host and allowing the hypervisor to
> >> > > > transition its view of the guest page as private, we need to be
> >> > > > sure that the host doesn't have any references to the folio.
> >> > > >
> >> > > > This patch introduces a new type for guest_memfd folios, and use=
s
> >> > > > that to register a callback that informs the guest_memfd
> >> > > > subsystem when the last reference is dropped, therefore knowing
> >> > > > that the host doesn't have any remaining references.
> >> > > >
> >> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> >> > > > ---
> >> > > > The function kvm_slot_gmem_register_callback() isn't used in thi=
s
> >> > > > series. It will be used later in code that performs unsharing of
> >> > > > memory. I have tested it with pKVM, based on downstream code [*]=
.
> >> > > > It's included in this RFC since it demonstrates the plan to
> >> > > > handle unsharing of private folios.
> >> > > >
> >> > > > [*] https://android-kvm.googlesource.com/linux/+/refs/heads/tabb=
a/guestmem-6.13-v5-pkvm
> >> > >
> >> > > Should the invocation of kvm_slot_gmem_register_callback() happen =
in
> >> > > the same critical block as setting the guest memfd range mappabili=
ty
> >> > > to NONE, otherwise conversion/truncation could race with registrat=
ion
> >> > > of callback?
> >> >
> >> > I don't think it needs to, at least not as far potencial races are
> >> > concerned. First because kvm_slot_gmem_register_callback() grabs the
> >> > mapping's invalidate_lock as well as the folio lock, and
> >> > gmem_clear_mappable() grabs the mapping lock and the folio lock if a
> >> > folio has been allocated before.
> >>
> >> I was hinting towards such a scenario:
> >> Core1
> >> Shared to private conversion
> >>   -> Results in mappability attributes
> >>       being set to NONE
> >> ...
> >>         Trigger private to shared conversion/truncation for
> >> ...
> >>         overlapping ranges
> >> ...
> >> kvm_slot_gmem_register_callback() on
> >>       the guest_memfd ranges converted
> >>       above (This will end up registering callback
> >>       for guest_memfd ranges which possibly don't
> >>       carry *_MAPPABILITY_NONE)
> >>
> >
> > Sorry for the format mess above.
> >
> > I was hinting towards such a scenario:
> > Core1-
> > Shared to private conversion -> Results in mappability attributes
> > being set to NONE
> > ...
> > Core2
> > Trigger private to shared conversion/truncation for overlapping ranges
> > ...
> > Core1
> > kvm_slot_gmem_register_callback() on the guest_memfd ranges converted
> > above (This will end up registering callback for guest_memfd ranges
> > which possibly don't carry *_MAPPABILITY_NONE)
> >
>
> In my model (I'm working through internal processes to open source this)
> I set up the the folio_put() callback to be registered on truncation
> regardless of mappability state.
>
> The folio_put() callback has multiple purposes, see slide 5 of this deck
> [1]:
>
> 1. Transitioning mappability from NONE to GUEST
> 2. Merging the folio if it is ready for merging
> 3. Keeping subfolio around (even if refcount =3D=3D 0) until folio is rea=
dy
>    for merging or return it to hugetlb
>
> So it is okay and in fact better to have the callback registered:
>
> 1. Folios with mappability =3D=3D NONE can be transitioned to GUEST
> 2. Folios with mappability =3D=3D GUEST/ALL can be merged if the other su=
bfolios
>    are ready for merging
> 3. And no matter the mappability, if subfolios are not yet merged, they
>    have to be kept around even with refcount 0 until they are merged.
>
> The model doesn't model locking so I'll have to code it up for real to
> verify this, but for now I think we should take a mappability lock
> during mappability read/write, and do any necessary callback
> (un)registration while holding the lock. There's no concern of nested
> locking here since callback registration will purely (un)set
> PGTY_guest_memfd and does not add/drop refcounts.
>
> With the callback registration locked with mappability updates, the
> refcounting and folio_put() callback should keep guest_memfd in a
> consistent state.

So if I understand you correctly, we'll need to always register for
large folios, right? If that's the case, we could expand the check to
whether to register the callback, and ensure it's always registered
for large folios. Since, like I said, the common case for small folios
is that it would be just additional overhead. Right?

Cheers,
/fuad

> >> >
> >> > Second, __gmem_register_callback() checks before returning whether a=
ll
> >> > references have been dropped, and adjusts the mappability/shareabili=
ty
> >> > if needed.
> >> >
> >> > Cheers,
> >> > /fuad
>
> [1] https://lpc.events/event/18/contributions/1764/attachments/1409/3704/=
guest-memfd-1g-page-support-2025-02-06.pdf

