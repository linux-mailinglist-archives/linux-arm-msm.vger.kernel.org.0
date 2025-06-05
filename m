Return-Path: <linux-arm-msm+bounces-60420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D9FACF98B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 00:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70598189CE40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 22:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3720A27FD43;
	Thu,  5 Jun 2025 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gOBqwyDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEFE27FB38
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749161533; cv=none; b=qllW789BKsMMQBu+FML+CdRbyvIyILa84N4mXJZ1i8QtmknURfwNOZp+hnSuOHnPXTdeMmtv10vI2sRQ2Cn7qjGsbJ2KQpAbcgwXV9OkYnyYkXEadr8wzf6h6FDCgb5pnKrgBvH79wwRQSOTOh+QfVCkSNtFG7YrmaHoBMqJRp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749161533; c=relaxed/simple;
	bh=PANd58hPjbNPTHa4l705McN2EG5oD6B2hiBJ/vJO2es=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tae9317L6GiJdCvyrnvhGfgI80EKRNewvgM59jP284BRE+9VWDudG7brTjJF+hH+eOdDVFEE4xinWdypeW5FCssYpVe9l9dngiUk52tg3M8Ug/hcY0b+tdNBjx6wDHb3bDTsNBlhCDCuoKhxgD+QnvE5uY1otIhFJ/gERvk4AHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gOBqwyDy; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b240fdc9c20so1498310a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749161531; x=1749766331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jOw1rIAPgLJUVWv/cCmbdBlNLRTe06PSJ8KQ26TsDA=;
        b=gOBqwyDy0XMh19JHWtrKpvKfEgU1Vr5JyfvTe68stSFhYqyuCtJWY0qPTj0zX04PGx
         z6n8XkdWmiGFstKJRN4eCi/tE/SYEHAEZ7s4r+/gpWpS9Y2fu0Csrb0cgrfgUbGoYCxP
         HKMuOkCSc77xHagBoOC4bUw8+pK5ocgV0q0n5xoBUYsoijMsaK9VdgBzAz8+lO83hGOr
         kwzO1axjH/irxSJFYk3OGFWwj+tJWKwOdSuIKZoYWUo8lhsltiURPAEyvAXP/MZF5dtu
         UslHPE1W8HufRLuy62czJyQIgOPadmxL4QJQCQaerOkNjlT4Z3E9+ITeSgaAOZf9B6Bl
         ijnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749161531; x=1749766331;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+jOw1rIAPgLJUVWv/cCmbdBlNLRTe06PSJ8KQ26TsDA=;
        b=nCi/dwLV1ZjUlILDN5Gs2xcmlg7dnOjRGR+eAbtd2MCrKWNE2WSSorROauKRtMnGLh
         eJgQrsWWxZPyU3+ZD4nD+62dvq6y413mAPqqNqUZuBbhWuPTCtnQwfQN8VKbsHG0Yw2T
         VSJmPEj33OXVQ0+8y9bbh7eS7O9bDAmFUrw0b/+oOGWJDNRArjKntRuPJTI7aWrMalxp
         FX4syYCXxE7KgKm4flNn5ns7TwrTZVFnBmICvA3pvsfQKHFT3B3WoghNJBitRwSQ4RHP
         F134HR4D34KukALlppiy38uWnU5oRQHCJ8yLlgj3LgC593c6zy6fmdihssZOXohLzGzb
         yzPA==
X-Forwarded-Encrypted: i=1; AJvYcCXQMBKf7k/93Rvc6pm/Kv4UpNxcq/x4EGlNgYFyvjAQRwgNO+9GvlRI6/0L8u9JORaFAO6Jlz4yB/O+vRs2@vger.kernel.org
X-Gm-Message-State: AOJu0YwSPcY2lsw4dF7utB6mxfIKXNZPwPRDmVJX3JiwjzNOx/zQpQ4N
	ot7B2yJnqhPvko8ZphoOiqelj2tszmDwRBFnp9ngrGugh3Zv9ca9CmYvomd1EPGVCVTQJ8VlQjs
	xg5PQwA==
X-Google-Smtp-Source: AGHT+IG6LzfASe3puScn/Qv3ruREwfR064s8V+HL6PEjTR9Oas02f/m6vRYzgkbGrD2ayUhiXQ3k4vsZIjY=
X-Received: from pfbli4.prod.google.com ([2002:a05:6a00:7184:b0:746:301b:10ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:431f:b0:21a:da01:e0cf
 with SMTP id adf61e73a8af0-21ee261054cmr1284527637.22.1749161530718; Thu, 05
 Jun 2025 15:12:10 -0700 (PDT)
Date: Thu, 5 Jun 2025 15:12:09 -0700
In-Reply-To: <CADrL8HVn_qswsZgWwXcBa-oP61nbWExWSQAKeSSKn2ffMTNtcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com> <20250605153800.557144-19-tabba@google.com>
 <CADrL8HVn_qswsZgWwXcBa-oP61nbWExWSQAKeSSKn2ffMTNtcg@mail.gmail.com>
Message-ID: <aEIWOSyFADsfXZnZ@google.com>
Subject: Re: [PATCH v11 18/18] KVM: selftests: guest_memfd mmap() test when
 mapping is allowed
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	peterx@redhat.com, pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025, James Houghton wrote:
> On Thu, Jun 5, 2025 at 8:38=E2=80=AFAM Fuad Tabba <tabba@google.com> wrot=
e:
> > @@ -34,12 +36,83 @@ static void test_file_read_write(int fd)
> >                     "pwrite on a guest_mem fd should fail");
> >  }
> >
> > -static void test_mmap(int fd, size_t page_size)
> > +static void test_mmap_supported(int fd, size_t page_size, size_t total=
_size)
> > +{
> > +       const char val =3D 0xaa;
> > +       char *mem;
>=20
> This must be `volatile char *` to ensure that the compiler doesn't
> elide the accesses you have written.
>=20
> > +       size_t i;
> > +       int ret;
> > +
> > +       mem =3D mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_PRIV=
ATE, fd, 0);
> > +       TEST_ASSERT(mem =3D=3D MAP_FAILED, "Copy-on-write not allowed b=
y guest_memfd.");
> > +
> > +       mem =3D mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHAR=
ED, fd, 0);
> > +       TEST_ASSERT(mem !=3D MAP_FAILED, "mmap() for shared guest memor=
y should succeed.");
> > +
> > +       memset(mem, val, total_size);
>=20
> Now unfortunately, `memset` and `munmap` will complain about the
> volatile qualification. So...
>=20
> memset((char *)mem, val, total_size);
>=20
> Eh... wish they just wouldn't complain, but this is a small price to
> pay for correctness. :)
>=20
> > +       for (i =3D 0; i < total_size; i++)
> > +               TEST_ASSERT_EQ(mem[i], val);
>=20
> The compiler is allowed to[1] elide the read of `mem[i]` and just
> assume that it is `val`.

I don't think "volatile" is needed.  Won't READ_ONCE(mem[i]) do the trick? =
 That
in turn will force the compiler to emit the stores as well.

> [1]: https://godbolt.org/z/Wora54bP6
>=20
> Feel free to add `volatile` to that snippet to see how the code changes.

