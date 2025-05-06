Return-Path: <linux-arm-msm+bounces-56891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F0AABAE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C88E11C41577
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F55128D84C;
	Tue,  6 May 2025 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pvn31hhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729B28C869
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509346; cv=none; b=VxRu0gDUqWl7Bt3RnKdraxLiG3qxG6UspHk6q/S9PRgNrwLfoMPrHljL0GgvokQZiYsv9NO6fLqS/IzRJwxqcNqMxbDPGNg75LQL68f+UrIRu1b36Lcjo40uJ7IXS1CBhHMmkUCfAzrKDF/kJcRaMsk2BqrJb+Flur4bgeOy/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509346; c=relaxed/simple;
	bh=wjuZP8JElURxyEXLHtfSNCq4yuHrsaOCzYwpYIxLc3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CN/syxVSUTkeYI55fpFMJgD7a9v1cL0JFcobc0hnZi6qpiKhE0eiPBgTYJA4DrVsn0cJkkOUkYESsnUgqwwI1jCYFx+zvmf8ZvcdOOo+KMD/ZnoclYQLZw3HK4zOpBnOjGcpCpVxO0TF6WIRsnz+IDenu7FLhpGn2u9wrqkpQog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pvn31hhw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e39fbad5fso66815ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 22:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746509344; x=1747114144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lKEB5k3HxIIDe0cms88dba//bFVC0zSsTglMVdhTdQ=;
        b=pvn31hhw4ka3CtzugjKjTe23AOJqIwpmBKQJqO97U7WdTxM1wM2AttJI7Mhi7p76MP
         tOsa+A4wVR7fd50atfW8MzLRawL81dpputh7ON0eFWL720p5PLlllbot2eGuMbGC3SMF
         kBpsnl2N4mAwVu8vEBE3DoxHhBdyxfS4M/dci+kMHwtfrRhKZllVL2naaqxJGqfWRZ/r
         LpsxajimEXm6H+mTgY4Cybgpo9CmHlKTO3Vd9w2RctiybSZcCGJexV6dzc38kCZa9E4J
         G5NbGerDMWU3ue9H9YBZLOsvC7FAxzAaUo+S5jUcdmT5iLOTmNjyBQkV0xYLxUF2cBQn
         Xv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746509344; x=1747114144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lKEB5k3HxIIDe0cms88dba//bFVC0zSsTglMVdhTdQ=;
        b=Xt3+080pemaspbtxViOKWaN4cI75j53vm/gdPOvDAz8P0Jyr0M80x7WxITRg65UqYn
         YFsxh3NkRpOm/AOdNxcJZXfxxKsG2O1GAvz2OzCrj9YBPwuNXm5Om0stQefhM7jr6FEF
         vpfyQN4uZSS9RzvMClLM+u3LnuO69Qr9VsqYfQXl0KAjzf2fEXxeU2bn/F9vODf7xroN
         6M3Dto9kPLadjt4OaL+Tp88lu8GgCZi1cWOVPzyUdKbt245Vy8R35NdScNQSJibeXFfi
         qghmjpnxIomYdWCaf9D1ePTnab15OQfDv5pglBDt2WGwgmNPQSzcyHvy5Dm13K2fiB+J
         haBg==
X-Forwarded-Encrypted: i=1; AJvYcCUnxEghj3nuvg1remFZ/NL2mbn4rilkqvc0Y9/XcSQHq3fr5n3hYayXPbvNq4fnxn+PWpRgB8mY3MUirIdr@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjKC4ELD6weiAp2RenYwvZHMwMjOPAx5VK50ZZGk6ej1kAVb8
	ppDaffYNG0oZIvcnEkU6tXvfneOXR7VWwKUsvIFpVvgdqYfuhfQjGvrW3qxJlgfdUILyWlcjTFG
	QlaVavlkb3ysB57p/z7G8BLXjEgID4iXcKc9Y
X-Gm-Gg: ASbGncv3/FS+rc9aqDvY+G5GBPws/PVTO68dixDGH3/hJw2WIF9faqEnLNImWyYwXco
	otu+zFWNstYzgZfZYOjmrOVn6hBnG1WPBPcAaIsBZ9qKg/rrdMtsvQUdeevecNWAb6arI3AY1aO
	MrgBU0meDG9XBpVTHO+grwMv0YAkQ3z8oj4XU+gdZmdAg6zbfv1gcH7x0=
X-Google-Smtp-Source: AGHT+IGwP1SKPwt/vtIJlYZ900Cxz2LT+AxXPcnHmyrXr5wchbo2E0xH9OpvxlPkZnYK2crcfarvY3+ODrHWYOxROP0=
X-Received: by 2002:a17:903:4410:b0:215:aca2:dc04 with SMTP id
 d9443c01a7336-22e3508dfb7mr1649445ad.26.1746509343525; Mon, 05 May 2025
 22:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
 <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com> <aBTxJvew1GvSczKY@google.com>
 <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com> <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com>
 <aBlCSGB86cp3B3zn@google.com> <CAGtprH8DW-hqxbFdyo+Mg7MddsOAnN+rpLZUOHT-msD+OwCv=Q@mail.gmail.com>
In-Reply-To: <CAGtprH8DW-hqxbFdyo+Mg7MddsOAnN+rpLZUOHT-msD+OwCv=Q@mail.gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 5 May 2025 22:28:50 -0700
X-Gm-Features: ATxdqUGXwDZ11ffKoeTta9OzQcx_M0fYA3TqS1Q4kf5Xbu-qRP3DA_ZY9TBWlyw
Message-ID: <CAGtprH9AVUiFsSELhmt4p24fssN2x7sXnUqn39r31GbA0h39Sw@mail.gmail.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
To: Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 10:17=E2=80=AFPM Vishal Annapurve <vannapurve@google=
.com> wrote:
>
> On Mon, May 5, 2025 at 3:57=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > > ...
> > > And not worry about lpage_infor for the time being, until we actually=
 do
> > > support larger pages.
> >
> > I don't want to completely punt on this, because if it gets messy, then=
 I want
> > to know now and have a solution in hand, not find out N months from now=
.
> >
> > That said, I don't expect it to be difficult.  What we could punt on is
> > performance of the lookups, which is the real reason KVM maintains the =
rather
> > expensive disallow_lpage array.
> >
> > And that said, memslots can only bind to one guest_memfd instance, so I=
 don't
> > immediately see any reason why the guest_memfd ioctl() couldn't process=
 the
> > slots that are bound to it.  I.e. why not update KVM_LPAGE_MIXED_FLAG f=
rom the
> > guest_memfd ioctl() instead of from KVM_SET_MEMORY_ATTRIBUTES?
>
> I am missing the point here to update KVM_LPAGE_MIXED_FLAG for the
> scenarios where in-place memory conversion will be supported with
> guest_memfd. As guest_memfd support for hugepages comes with the
> design that hugepages can't have mixed attributes. i.e. max_order
> returned by get_pfn will always have the same attributes for the folio
> range.
>
> Is your suggestion around using guest_memfd ioctl() to also toggle
> memory attributes for the scenarios where guest_memfd instance doesn't
> have in-place memory conversion feature enabled?

Reading more into your response, I guess your suggestion is about
covering different usecases present today and new usecases which may
land in future, that rely on kvm_lpage_info for faster lookup. If so,
then it should be easy to modify guest_memfd ioctl to update
kvm_lpage_info as you suggested.

