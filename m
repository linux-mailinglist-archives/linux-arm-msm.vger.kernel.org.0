Return-Path: <linux-arm-msm+bounces-23195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E50890E697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 11:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147D71F21BA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 09:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EA72139CD;
	Wed, 19 Jun 2024 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zhnxfwmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8E7E794
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718788335; cv=none; b=Fc2OXgogaVHvEgfGs2Q6LudY8FulL4VhXPdS2pn6MttlUAGzLnwrkGrlQmOf+Xau9YhlI0H51PDRScjOL5NYPjKzQ3Sage/qjva3Idq2YHdDK2nrYm/9arPMeQF6BM3NOGtzUgKaqww+6dRpbjBIQASoQdJyCMnHBccoaUR6ykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718788335; c=relaxed/simple;
	bh=devHkRkV7shlB9En5cc49p7lL4U/8UsLhV/aO+tvt60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAIEyoj/DRrPslcMcZ8vZUGOjV+cEd1hOqIu8dvNkIQPI1zEcVXAilCq7Zb1hOlSux9S6Wjp7ecPECkv7DBIwoWKQyyPpmS9XsofcmlOAd5tENSSL6chGCfx2fmyZ+qTHbb6AoapZPi43XAMZ84f/f2Zuy1hP4smy5yyWX89+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zhnxfwmF; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-48c50e74fe6so2285397137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718788333; x=1719393133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYkYh6+hMVb+fOYqcnMpeJBX33GChbsvZ+EqmJ1i9Cw=;
        b=zhnxfwmFWaNH7Hos+1tqrH8ezXV2ludv7BsjJvDRtXVXZP/PkYpPbovOp3Ys0+D6Dj
         8rhAHj1d4XPoJdrsziss9kx6dgvOcwxMoSzNRDySWhjhOitTyc+7oXHukZsG0PzcWNnu
         eaDbYfHyRjEnY2uQ7zCEdRx5obbr3+1xDF6JBOFQjpSsXjJZjqtvToZoutYbO3HiIAOa
         7QmrsKH2TUuJ9WqSKrA93N7eo5nut4WDCtvuWFMrBNh53ok7CY4uAv2c1dHRjK4h6Iiu
         xBZupjo7QhzeDSkR/4ageeJzY31yjauTXU5PtfSVgBTBwQVwYUxx5WVm9MrupW5WgLKp
         WvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718788333; x=1719393133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYkYh6+hMVb+fOYqcnMpeJBX33GChbsvZ+EqmJ1i9Cw=;
        b=FH6QD9HAHREWyVYoxg6Rjm8S/st5i4TRBZP+IGniJvjp30bSPJMbKzFkBUTtg6wgxf
         lO/xKOsYS0zMtqeoya+8lzWrKxzdjKOBjbpnFdIGPV4efxMmhErzPx8B8vmys7GvbPzy
         HUgek4hgVkqrL0h96ddMN4NBLm+QE3HvjlLFyq+8KLw9wwesGJo8OtlICTGKGR0dTXbz
         HjeTPqRM20emmFx6hehgHfIKtIpBJk+FtqtGISgSLNhYTAG0CQJWb1UcHiJjulirkkOe
         BaggYqnB1EON5rOyHP4QWVVfTXnskhOAR/ileyh5+3gG3l9iCwufYf1k+uuTWdNMPl9Q
         vGiA==
X-Forwarded-Encrypted: i=1; AJvYcCXrPEmbjzniIy8uImrUfZd5DzseKlSEy09DpqODGb6o9zZudCTN7BfbC8GAFt9TnplcpS8xSZYQY9gxQn+w/7MuaQnivODAXDa5jUxJ5A==
X-Gm-Message-State: AOJu0YxIKjIt9vLIxzE4pQNpPbYk9nH1VI2lz2dcPLIxEEhurIs96YuW
	Cf/EohaUNvV4BSR0raTJrO++liu1DO0lZC70Q90Y1WE9hxT3m515ArPKd+h6gaXSqoubAYXPoEp
	PvrBdvEUD6LOMyajgcyurDoSkazPv30vD+pl2
X-Google-Smtp-Source: AGHT+IFULFV5uhgABgZzBXYJqHVOU0QqocPAW9nYgm8HwHd5Y1v9lYw0r20cKwTG9sBBXkjoh+WhigVT8vp4bpfmLgc=
X-Received: by 2002:a67:ef8e:0:b0:48c:3c3f:3696 with SMTP id
 ada2fe7eead31-48f13015e86mr2161505137.10.1718788332754; Wed, 19 Jun 2024
 02:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618-exclusive-gup-v1-0-30472a19c5d1@quicinc.com>
 <7fb8cc2c-916a-43e1-9edf-23ed35e42f51@nvidia.com> <14bd145a-039f-4fb9-8598-384d6a051737@redhat.com>
In-Reply-To: <14bd145a-039f-4fb9-8598-384d6a051737@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 19 Jun 2024 10:11:35 +0100
Message-ID: <CA+EHjTxWWEHfjZ9LJqZy+VCk43qd3SMKiPF7uvAwmDdPeVhrvQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
To: David Hildenbrand <david@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Elliot Berman <quic_eberman@quicinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, maz@kernel.org, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	pbonzini@redhat.com, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John and David,

Thank you for your comments.

On Wed, Jun 19, 2024 at 8:38=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> Hi,
>
> On 19.06.24 04:44, John Hubbard wrote:
> > On 6/18/24 5:05 PM, Elliot Berman wrote:
> >> In arm64 pKVM and QuIC's Gunyah protected VM model, we want to support
> >> grabbing shmem user pages instead of using KVM's guestmemfd. These
> >> hypervisors provide a different isolation model than the CoCo
> >> implementations from x86. KVM's guest_memfd is focused on providing
> >> memory that is more isolated than AVF requires. Some specific examples
> >> include ability to pre-load data onto guest-private pages, dynamically
> >> sharing/isolating guest pages without copy, and (future) migrating
> >> guest-private pages.  In sum of those differences after a discussion i=
n
> >> [1] and at PUCK, we want to try to stick with existing shmem and exten=
d
> >> GUP to support the isolation needs for arm64 pKVM and Gunyah.
>
> The main question really is, into which direction we want and can
> develop guest_memfd. At this point (after talking to Jason at LSF/MM), I
> wonder if guest_memfd should be our new target for guest memory, both
> shared and private. There are a bunch of issues to be sorted out though .=
..
>
> As there is interest from Red Hat into supporting hugetlb-style huge
> pages in confidential VMs for real-time workloads, and wasting memory is
> not really desired, I'm going to think some more about some of the
> challenges (shared+private in guest_memfd, mmap support, migration of
> !shared folios, hugetlb-like support, in-place shared<->private
> conversion, interaction with page pinning). Tricky.
>
> Ideally, we'd have one way to back guest memory for confidential VMs in
> the future.

As you know, initially we went down the route of guest memory and
invested a lot of time on it, including presenting our proposal at LPC
last year. But there was resistance to expanding it to support more
than what was initially envisioned, e.g., sharing guest memory in
place migration, and maybe even huge pages, and its implications such
as being able to conditionally mmap guest memory.

To be honest, personally (speaking only for myself, not necessarily
for Elliot and not for anyone else in the pKVM team), I still would
prefer to use guest_memfd(). I think that having one solution for
confidential computing that rules them all would be best. But we do
need to be able to share memory in place, have a plan for supporting
huge pages in the near future, and migration in the not-too-distant
future.

We are currently shipping pKVM in Android as it is, warts and all.
We're also working on upstreaming the rest of it. Currently, this is
the main blocker for us to be able to upstream the rest (same probably
applies to Gunyah).

> Can you comment on the bigger design goal here? In particular:

At a high level: We want to prevent a misbehaving host process from
crashing the system when attempting to access (deliberately or
accidentally) protected guest memory. As it currently stands in pKVM
and Gunyah, the hypervisor does prevent the host from accessing
(private) guest memory. In certain cases though, if the host attempts
to access that memory and is prevented by the hypervisor (either out
of ignorance or out of malice), the host kernel wouldn't be able to
recover, causing the whole system to crash.

guest_memfd() prevents such accesses by not allowing confidential
memory to be mapped at the host to begin with. This works fine for us,
but there's the issue of being able to share memory in place, which
implies mapping it conditionally (among others that I've mentioned).

The approach we're taking with this proposal is to instead restrict
the pinning of protected memory. If the host kernel can't pin the
memory, then a misbehaving process can't trick the host into accessing
it.

>
> 1) Who would get the exclusive PIN and for which reason? When would we
>     pin, when would we unpin?

The exclusive pin would be acquired for private guest pages, in
addition to a normal pin. It would be released when the private memory
is released, or if the guest shares that memory.

> 2) What would happen if there is already another PIN? Can we deal with
>     speculative short-term PINs from GUP-fast that could introduce
>     errors?

The exclusive pin would be rejected if there's any other pin
(exclusive or normal). Normal pins would be rejected if there's an
exclusive pin.

> 3) How can we be sure we don't need other long-term pins (IOMMUs?) in
>     the future?

I can't :)

> 4) Why are GUP pins special? How one would deal with other folio
>     references (e.g., simply mmap the shmem file into a different
>     process).

Other references would crash the userspace process, but the host
kernel can handle them, and shouldn't cause the system to crash. The
way things are now in Android/pKVM, a userspace process can crash the
system as a whole.

> 5) Why you have to bother about anonymous pages at all (skimming over s
>     some patches), when you really want to handle shmem differently only?

I'm not sure I understand the question. We use anonymous memory for pKVM.

> >> To that
> >> end, we introduce the concept of "exclusive GUP pinning", which enforc=
es
> >> that only one pin of any kind is allowed when using the FOLL_EXCLUSIVE
> >> flag is set. This behavior doesn't affect FOLL_GET or any other folio
> >> refcount operations that don't go through the FOLL_PIN path.
>
> So, FOLL_EXCLUSIVE would fail if there already is a PIN, but
> !FOLL_EXCLUSIVE would succeed even if there is a single PIN via
> FOLL_EXCLUSIVE? Or would the single FOLL_EXCLUSIVE pin make other pins
> that don't have FOLL_EXCLUSIVE set fail as well?

A FOLL_EXCLUSIVE would fail if there's any other pin. A normal pin
(!FOLL_EXCLUSIVE) would fail if there's a FOLL_EXCLUSIVE pin. It's the
PIN to end all pins!

> >>
> >> [1]: https://lore.kernel.org/all/20240319143119.GA2736@willie-the-truc=
k/
> >>
> >
> > Hi!
> >
> > Looking through this, I feel that some intangible threshold of "this is
> > too much overloading of page->_refcount" has been crossed. This is a ve=
ry
> > specific feature, and it is using approximately one more bit than is
> > really actually "available"...
>
> Agreed.

We are gating it behind a CONFIG flag :)

Also, since pin is already overloading the refcount, having the
exclusive pin there helps in ensuring atomic accesses and avoiding
races.

> >
> > If we need a bit in struct page/folio, is this really the only way? Wil=
ly
> > is working towards getting us an entirely separate folio->pincount, I
> > suppose that might take too long? Or not?
>
> Before talking about how to implement it, I think we first have to learn
> whether that approach is what we want at all, and how it fits into the
> bigger picture of that use case.
>
> >
> > This feels like force-fitting a very specific feature (KVM/CoCo handlin=
g
> > of shmem pages) into a more general mechanism that is running low on
> > bits (gup/pup).
>
> Agreed.
>
> >
> > Maybe a good topic for LPC!
>
> The KVM track has plenty of guest_memfd topics, might be a good fit
> there. (or in the MM track, of course)

We are planning on submitting a proposal for LPC (see you in Vienna!) :)

Thanks again!
/fuad (and elliot*)

* Mistakes, errors, and unclear statements in this email are mine alone tho=
ugh.

> --
> Cheers,
>
> David / dhildenb
>

