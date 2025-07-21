Return-Path: <linux-arm-msm+bounces-65970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF8B0CD3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 00:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 015045403D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 22:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFA123FC74;
	Mon, 21 Jul 2025 22:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xNaZ2f+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088123F403
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753136495; cv=none; b=sa+R10fTCSqQYeI53NxzOWBcxZgxAbwr5mUEEPmwbd/cPQ3Xi3IGgtKoDSrBiTZzwHTDWkWgGvSuDB0P+zL5+38sY7NK6kX8st2tG7cZimB1AKrYvxka5tBYW8ZrW7bXwQxpOPzp2V3ycU+0ZWR6uYF3SQMHDQfDfRn3f7Nhues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753136495; c=relaxed/simple;
	bh=O9oujs8lAUEQ118bulib3JUV3c8PKDVjfLU+hwZuwC0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mXsZ49BFd54npYkGeWQoZs6oH9S+b9YZBhD717ZDSWE9t7S3sv6oyXs6lRA6/MjXL/bz66oj8ufc0lttyYh/HPOTR2aGg5l/zrUxFxam5rC7ExhLnGXAI1OtC6zoRNoElfytin76iWhihVG8xnG+Vuyexo9+AwmDu4Gwue7+ICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xNaZ2f+S; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so2968782a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 15:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753136493; x=1753741293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n3DfUq9+hEwNPgG2lSxnRPPih9D3owzTYtcCu6Ji3E=;
        b=xNaZ2f+S94It0W9nB8g/d5zkywzBzFV1BU0LGVVxP6552z13FBSdKXlk+NqG9byCH+
         KhAppcAjtaB5ulHO9m+eJkdqCgm0McyNs12RYzKc1n8i+Un6HzH7aa4RHOZaSBUKKAjb
         jHxH8HI8NjAt2EFcuuXyDjWGUIb9oEThh1x2E4+D5ZbsDs6TCzCM5miSVux5dpJX0gR7
         vVcuijWW44LMDv5AiYhmDKGOB/O8jlBQ88RlJbgPjOewyDksxLyWUYY3g84pwyEnBVLG
         RivJJgolRiI2bKaMz4Lk7BoH2pUDYZxUkAHHshdjjKgvtR+3PtR/xOst5gUm1t2rKMmP
         nA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753136493; x=1753741293;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5n3DfUq9+hEwNPgG2lSxnRPPih9D3owzTYtcCu6Ji3E=;
        b=i0HBTSpQBw3BsIS0hJQgPoCZbi5UInR6FcO0twrRmoZpu/s65cQ8zAkkvybk6soly6
         8yZHbJVglaeRUyKIF0hskrFEr87rx6T9OMKCa1DmpLq2kV4/Zk6/HD3Z/lYRga/ROEzx
         YiPeA5Mc2n8dNe9YVJ6IgkKtmiqw9+Ur6RyssjrtMIMDe5EKlk43xF2BUN8DefGxI4w8
         QRaGAc5RaroXuo3OG2g/4yKvZh04DBKNMKmIiVFeMxnGA6zvJYKQUFBkcnywy1/otMuO
         dQd1GCjXXQATW1kJ3K4N30J8V8+dy9wxjauwJgh9nuAZdCvj8EE53izlfMvIk4ZBq4On
         /fwA==
X-Forwarded-Encrypted: i=1; AJvYcCUiAgXDn+72GBWKDJz2vf1Mjgpag5DNlul2yOG7sSpvF2ksOJyW2pCaTiJDGNxMFGMNnhSatYHYmudZpPWB@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmjsIm2yUM4tRHcBJXDrPcrfdvmnD/NbVRSLMWCppkolPBNaX
	rOcPJCDtc5O9Fxjt0ydsA2kFnjY7MXAntuLS9yFI/HwhbbLQuHJGFtKKn/EoSLh3KR/WD+M58hL
	brZ41SA==
X-Google-Smtp-Source: AGHT+IGVYoYyFSUy6kkP0xnDMkijp28Tq63+5NFoZx5vd/eebqwBJh/r6JAT/xPGMl6C6FANHbZf61n9I0k=
X-Received: from pjk13.prod.google.com ([2002:a17:90b:558d:b0:312:ea08:fa64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a4a:b0:312:f650:c795
 with SMTP id 98e67ed59e1d1-31c9f4a80b1mr26427314a91.21.1753136492866; Mon, 21
 Jul 2025 15:21:32 -0700 (PDT)
Date: Mon, 21 Jul 2025 15:21:31 -0700
In-Reply-To: <CAGtprH8H2c=bK-7rA1wC1-9f=g8mK3PNXja54bucZ8DnWF7z3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-15-tabba@google.com>
 <505a30a3-4c55-434c-86a5-f86d2e9dc78a@intel.com> <CAGtprH8swz6GjM57DBryDRD2c6VP=Ayg+dUh5MBK9cg1-YKCDg@mail.gmail.com>
 <aH5RxqcTXRnQbP5R@google.com> <1fe0f46a-152a-4b5b-99e2-2a74873dafdc@intel.com>
 <aH55BLkx7UkdeBfT@google.com> <CAGtprH8H2c=bK-7rA1wC1-9f=g8mK3PNXja54bucZ8DnWF7z3g@mail.gmail.com>
Message-ID: <aH69a_CVJU0-P9wY@google.com>
Subject: Re: [PATCH v15 14/21] KVM: x86: Enable guest_memfd mmap for default
 VM type
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025, Vishal Annapurve wrote:
> On Mon, Jul 21, 2025 at 10:29=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > >
> > > > > 2) KVM fetches shared faults through userspace page tables and no=
t
> > > > > guest_memfd directly.
> > > >
> > > > This is also irrelevant.  KVM _already_ supports resolving shared f=
aults through
> > > > userspace page tables.  That support won't go away as KVM will alwa=
ys need/want
> > > > to support mapping VM_IO and/or VM_PFNMAP memory into the guest (ev=
en for TDX).
>=20
> As a combination of [1] and [2], I believe we are saying that for
> memslots backed by mappable guest_memfd files, KVM will always serve
> both shared/private faults using kvm_gmem_get_pfn().=20

No, KVM can't guarantee that with taking and holding mmap_lock across hva_t=
o_pfn(),
and as I mentioned earlier in the thread, that's a non-starter for me.

For a memslot without a valid slot->gmem.file, slot->userspace_addr will be=
 used
to resolve faults and access guest memory.  By design, KVM has no knowledge=
 of
what lies behind userspace_addr (arm64 and other architectures peek at the =
VMA,
but x86 does not).  So we can't say that mmap()'d guest_memfd instance will=
 *only*
go through kvm_gmem_get_pfn().


> And I think the same story will be carried over when we get the stage2 i.=
e.
> mmap+conversion support.
>=20
> [1] https://lore.kernel.org/kvm/20250717162731.446579-10-tabba@google.com=
/
> [2] https://lore.kernel.org/kvm/20250717162731.446579-14-tabba@google.com=
/
>=20
> > > >
> > > > > I don't see value in trying to go out of way to support such a us=
ecase.
> > > >
> > > > But if/when KVM gains support for tracking shared vs. private in gu=
est_memfd
> > > > itself, i.e. when TDX _does_ support mmap() on guest_memfd, KVM won=
't have to go
> > > > out of its to support using guest_memfd for the @userspace_addr bac=
king store.
> > > > Unless I'm missing something, the only thing needed to "support" th=
is scenario is:
> > >
> > > As above, we need 1) mentioned by Vishal as well, to prevent userspac=
e from
> > > passing mmapable guest_memfd to serve as private memory.
> >
> > Ya, I'm talking specifically about what the world will look like once K=
VM tracks
> > private vs. shared in guest_memfd.  I'm not in any way advocating we do=
 this
> > right now.
>=20
> I think we should generally strive to go towards single memory backing
> for all the scenarios, unless there is a real world usecase that can't
> do without dual memory backing (We should think hard before committing
> to supporting it).
>=20
> Dual memory backing was just a stopgap we needed until the *right*
> solution came along.

I don't think anyone is suggesting otherwise.  I'm just pointing out that w=
hat
Xiaoyao is trying to do should Just Work once KVM allows creating mmap()-fr=
iendly
guest_memfd instances for TDX.

