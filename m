Return-Path: <linux-arm-msm+bounces-47135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E1A2C0DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 11:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C17B7A2663
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905F71DE89A;
	Fri,  7 Feb 2025 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ktwtlZ95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C081DE899
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925177; cv=none; b=BcRt6lWxObvdSK7XD6YUfEaSgIKUZze6OT5WIPbdFBxo/lNCL4S3WhOfTmyugSXrzMYY8tO3vWCWuqxJlNYxA4clxmiTYm9obFTthuvutQEjvyyEsN6sFBHJcqpaYEKBA2S5QrTFK0bv15cU2APae3+a31NArzu+auLObk/3Lqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925177; c=relaxed/simple;
	bh=nDka+Wkes2u8+YcERcSiOALoLDiKyz4IRHXsaBV74sw=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=jvVIQNiuUlg3/dT5XMl8xcoLoyeV+8rsm6FT+4qBo7WdFRrXOkgKbQWMGokaATuDlyslB2JTvhw4aN2L/GjgJeKGSmxpr5zz9fMIkDPRtw82KcDM/uReshQZm5nbzr7VehCCVmoFoq3Aqsal5Zsjz+YcrDAL5FcAfVpR6bd6eIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ktwtlZ95; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21f0d8b7647so58505225ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 02:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738925175; x=1739529975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Dl1LIULh/Hk0Dh3VLCiWHTYgwIdPTs5L1n9NPa7EY4=;
        b=ktwtlZ95QTGanLL+2+YrTgi41LDaSljvBqizRBcrgNmT1yTEvdyQGYpqyAhSgTuMxs
         2Zc6oCqek2LNG6jRTJqjpN3c26yja4cboI5HjQ7Fb/h2mnozb/zvt+5/J8joVdaH0ytc
         2xuK+QzMl/9MuQZiduhLHkMZyed7+bVhknye9vtTJFT83+rnL3czzs5GFX7+OWCHDsPG
         /67OBbxrvPeH4Vc8GtcYdgxgTHuK2A+5iGwOMj9HWYTcPkbKmEXg3VRaqvmiu73PbIKh
         paC8J648RxnbmYNYweNLyApt7CdHB84TeHMNaHxWYLBZKYAfGGNS8k7q4VlwRv/23SjG
         vVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925175; x=1739529975;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Dl1LIULh/Hk0Dh3VLCiWHTYgwIdPTs5L1n9NPa7EY4=;
        b=tT5Aq1PBsGAHSV5CnL+fkg0HPBLrdWv1OLg83nWxUwO/DmoHiBfwCMhWWGSp5PzQWD
         ueJsOQ1xHsMC29oZAk4iWYhpUhYdhDhZYe6zvRJHDFWh8s5uSMYwmiHIKgsKBX4drtcz
         O7TRck7fl56g/bBslIrHl5Xa6igK3pwSeguwTXjQovHfc4M9P2FYoZORr7OmGEd4KVw6
         Vu0WYbO2t32j8XxL/+B6w4KpCxDVFR/vc0cfZqtF5leOqvUmVhvN/C6J+s+xaJ4/z6Mv
         gLv4Ipw6nnc29aBbO59B+3MSjUTtAI+yht0ZSutZrgTk9YpECRDIGvjcD6kXeo8ReUX5
         mMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5SDjLcQc9SA8snXNVfYWE9q9v724nune+AtmcbDATHaMVx5+Uwi7o18Uu7HPB43iKldQgLlQYP1p4lqWu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/56EX9dVxJlSe08dBv90qa9lKVdhBr1jb6qKqsyD/GJxHUNxP
	xEv/0sREWIxZrDT70ITyVigHbFmKE0K4ll/tNvmP8W0pAJbkq2jI9Bj4/G2jP1y0rKrROLsyebW
	Mwyln/WYlnFDk84VYu0YjLg==
X-Google-Smtp-Source: AGHT+IHvDCkHXioeXTkvRcwHbNoG5B0oy0/KVX0GTCimiHJWUHjr8iro5mTlsf5sd+mlLHrxITtVvmIlBJE3c8u3bw==
X-Received: from pgbcm3.prod.google.com ([2002:a05:6a02:a03:b0:aa5:c436:1469])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9e46:b0:1e0:d19c:c950 with SMTP id adf61e73a8af0-1ee03a45e13mr5558700637.16.1738925175098;
 Fri, 07 Feb 2025 02:46:15 -0800 (PST)
Date: Fri, 07 Feb 2025 10:46:13 +0000
In-Reply-To: <CAGtprH-K0hKYXbH82_9pObn1Cnau74JWVNQ+xkiSSqnmh6BUUQ@mail.gmail.com>
 (message from Vishal Annapurve on Wed, 5 Feb 2025 09:42:17 -0800)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzed0aowwa.fsf@ackerleytng-ctop-specialist.c.googlers.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
From: Ackerley Tng <ackerleytng@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: tabba@google.com, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Vishal Annapurve <vannapurve@google.com> writes:

> On Wed, Feb 5, 2025 at 9:39=E2=80=AFAM Vishal Annapurve <vannapurve@googl=
e.com> wrote:
>>
>> On Wed, Feb 5, 2025 at 2:07=E2=80=AFAM Fuad Tabba <tabba@google.com> wro=
te:
>> >
>> > Hi Vishal,
>> >
>> > On Wed, 5 Feb 2025 at 00:42, Vishal Annapurve <vannapurve@google.com> =
wrote:
>> > >
>> > > On Fri, Jan 17, 2025 at 8:30=E2=80=AFAM Fuad Tabba <tabba@google.com=
> wrote:
>> > > >
>> > > > Before transitioning a guest_memfd folio to unshared, thereby
>> > > > disallowing access by the host and allowing the hypervisor to
>> > > > transition its view of the guest page as private, we need to be
>> > > > sure that the host doesn't have any references to the folio.
>> > > >
>> > > > This patch introduces a new type for guest_memfd folios, and uses
>> > > > that to register a callback that informs the guest_memfd
>> > > > subsystem when the last reference is dropped, therefore knowing
>> > > > that the host doesn't have any remaining references.
>> > > >
>> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
>> > > > ---
>> > > > The function kvm_slot_gmem_register_callback() isn't used in this
>> > > > series. It will be used later in code that performs unsharing of
>> > > > memory. I have tested it with pKVM, based on downstream code [*].
>> > > > It's included in this RFC since it demonstrates the plan to
>> > > > handle unsharing of private folios.
>> > > >
>> > > > [*] https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/=
guestmem-6.13-v5-pkvm
>> > >
>> > > Should the invocation of kvm_slot_gmem_register_callback() happen in
>> > > the same critical block as setting the guest memfd range mappability
>> > > to NONE, otherwise conversion/truncation could race with registratio=
n
>> > > of callback?
>> >
>> > I don't think it needs to, at least not as far potencial races are
>> > concerned. First because kvm_slot_gmem_register_callback() grabs the
>> > mapping's invalidate_lock as well as the folio lock, and
>> > gmem_clear_mappable() grabs the mapping lock and the folio lock if a
>> > folio has been allocated before.
>>
>> I was hinting towards such a scenario:
>> Core1
>> Shared to private conversion
>>   -> Results in mappability attributes
>>       being set to NONE
>> ...
>>         Trigger private to shared conversion/truncation for
>> ...
>>         overlapping ranges
>> ...
>> kvm_slot_gmem_register_callback() on
>>       the guest_memfd ranges converted
>>       above (This will end up registering callback
>>       for guest_memfd ranges which possibly don't
>>       carry *_MAPPABILITY_NONE)
>>
>
> Sorry for the format mess above.
>
> I was hinting towards such a scenario:
> Core1-
> Shared to private conversion -> Results in mappability attributes
> being set to NONE
> ...
> Core2
> Trigger private to shared conversion/truncation for overlapping ranges
> ...
> Core1
> kvm_slot_gmem_register_callback() on the guest_memfd ranges converted
> above (This will end up registering callback for guest_memfd ranges
> which possibly don't carry *_MAPPABILITY_NONE)
>

In my model (I'm working through internal processes to open source this)
I set up the the folio_put() callback to be registered on truncation
regardless of mappability state.

The folio_put() callback has multiple purposes, see slide 5 of this deck
[1]:

1. Transitioning mappability from NONE to GUEST
2. Merging the folio if it is ready for merging
3. Keeping subfolio around (even if refcount =3D=3D 0) until folio is ready
   for merging or return it to hugetlb

So it is okay and in fact better to have the callback registered:

1. Folios with mappability =3D=3D NONE can be transitioned to GUEST
2. Folios with mappability =3D=3D GUEST/ALL can be merged if the other subf=
olios
   are ready for merging
3. And no matter the mappability, if subfolios are not yet merged, they
   have to be kept around even with refcount 0 until they are merged.

The model doesn't model locking so I'll have to code it up for real to
verify this, but for now I think we should take a mappability lock
during mappability read/write, and do any necessary callback
(un)registration while holding the lock. There's no concern of nested
locking here since callback registration will purely (un)set
PGTY_guest_memfd and does not add/drop refcounts.

With the callback registration locked with mappability updates, the
refcounting and folio_put() callback should keep guest_memfd in a
consistent state.

>> >
>> > Second, __gmem_register_callback() checks before returning whether all
>> > references have been dropped, and adjusts the mappability/shareability
>> > if needed.
>> >
>> > Cheers,
>> > /fuad

[1] https://lpc.events/event/18/contributions/1764/attachments/1409/3704/gu=
est-memfd-1g-page-support-2025-02-06.pdf

