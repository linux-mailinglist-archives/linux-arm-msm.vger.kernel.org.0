Return-Path: <linux-arm-msm+bounces-26355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD074932D42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 18:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634622855FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 16:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07994199EA3;
	Tue, 16 Jul 2024 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mX8mJtYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EE919D8A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721145783; cv=none; b=Qfp1/ZiWQwpq0Ed+RgCL6YcKP4p1RDD8RF26suaDJnmyjjCa3HsQZz/sqRsMXwGzsq5L0YftR3cn8uM1hvaN2QRpfihHDPyhPrlFZJrP22N/+NfrABuiAyA/wyS3OB1lMEsL1gOSpWfsRNSJvjkIaUnXuqnWE4b85vYhQSTAjv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721145783; c=relaxed/simple;
	bh=V3XIltUZy+EAGhbi36SoKcnYH8QOpAigc2QQmc3zTsw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HIxy/vyTIuO3mh5eqzhMmkKxR9STfObtwdCgPD63PC/zkrOlviZpj2AmzHu4qGlKf6t68LcSZLMScv60S1PMQESR8katacB/AoGruJRyG0uvNRcvg/CVSwK6JjOuIrfQ68HVL4AHCjB+lyKv4cHybcYr55iO6oslvGonfiKHJFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mX8mJtYc; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-650b621f4cdso99921027b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721145781; x=1721750581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMs2wY7Im2gJwcvsvkhutz6yojdHTU9eBYvDppSee3o=;
        b=mX8mJtYcq9zluHtVnzREhZxbiiULi7i2I+mJi4Mt08+GskaWUHf5gWVjXt5W27r0kS
         weqAWKColS7fzPZ/XyCf6qTaU0n4l/g7QwS3RhBGURMGs/LVEzq36zwElFVxRZhLx7lw
         WM4Qhv+0Ncj+0SqxX5NvtCupt3zX+r1L0TUqx6Iuu9YGo1CYTh0XeX1iRlwd2+DQNEty
         BbckODM0k85fY+vvYTBvHD9S4Fdwdn6B6PX51Nl5yJXu8bXWlahlEPRa6AKnEg7ZRT/y
         t2h3IS26gKTSfcnSeOM5iK4Iojjn4cq2rHi+vxzF1YUGVruUttEyEf7Gx19q0X5j/I5I
         sVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721145781; x=1721750581;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BMs2wY7Im2gJwcvsvkhutz6yojdHTU9eBYvDppSee3o=;
        b=Gc8hqbvxt4vq3UBtkDJeOrvS6Qb4w7nwAaeDLWelNOM4wzPRwWThP04BZ7IDK+VE81
         nfBEqeMMqvWcMDYGz2BuaOLNo1h/ge+if4eYi1PM+FcSNU1rVfyaDu4UdAjROQnfNCoP
         UKx++V4Ff/QabVlmnZFGC+gJ+qe8kgT3gExtgni1VZsLusavG16ogumOXKizzmfQgZkm
         n8kF7ySJcL870VTIWEPJDB1mdbiHyOLzyf7nXdhcTXVKBZfBkpaawm/zoHQE5VhUm2/P
         ZCC92P5905Wynt+ACjj5glHRpOoo+B9y+SES7xoUaD0cEgEpE0oCRyROyzMUfeHAuVVn
         XEaw==
X-Forwarded-Encrypted: i=1; AJvYcCUGyzf+kwtZp9W+O+UD3u+MDCOYQB+GWpOXU5iWlJBoAhuf2hDB6jnMr4NfKX+QKcJBePkqnGsQlHKyxn24dUcB7AH098+836Sf9jDhww==
X-Gm-Message-State: AOJu0YwB3jq6Fpa5YhOyV1oRdG31A6Oo2vy96LBXWmzzWerI4t6vbCEF
	9UEojCxog2mnVHFZ4yY76AU0cVewleD8R9w7QpPgeF+1bVsl9NLulzJWbn8QPNHCSpSuar5rWHo
	noQ==
X-Google-Smtp-Source: AGHT+IHGZLEiSniWpPk9RJXTJkROIXXHkCGmFW1fdkqpo+4QpAqRJbF6e6n8zR9oFjopeWKxjqT3PAofiHk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:fd4:b0:62d:cef:67dd with SMTP id
 00721157ae682-6637f1c259emr1606177b3.1.1721145781339; Tue, 16 Jul 2024
 09:03:01 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:03:00 -0700
In-Reply-To: <20240712232937.2861788-1-ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240618-exclusive-gup-v1-0-30472a19c5d1@quicinc.com> <20240712232937.2861788-1-ackerleytng@google.com>
Message-ID: <ZpaZtPKrXolEduZH@google.com>
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: quic_eberman@quicinc.com, akpm@linux-foundation.org, david@redhat.com, 
	kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, maz@kernel.org, pbonzini@redhat.com, shuah@kernel.org, 
	tabba@google.com, willy@infradead.org, vannapurve@google.com, 
	hch@infradead.org, jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, 
	qperret@google.com, smostafa@google.com, fvdl@google.com, hughd@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for doing the dirty work!

On Fri, Jul 12, 2024, Ackerley Tng wrote:
> Here=E2=80=99s an update from the Linux MM Alignment Session on July 10 2=
024, 9-10am
> PDT:
>=20
> The current direction is:
>=20
> + Allow mmap() of ranges that cover both shared and private memory, but d=
isallow
>   faulting in of private pages
>   + On access to private pages, userspace will get some error, perhaps SI=
GBUS
>   + On shared to private conversions, unmap the page and decrease refcoun=
ts

Note, I would strike the "decrease refcounts" part, as putting references i=
s a
natural consequence of unmapping memory, not an explicit action guest_memfd=
 will
take when converting from shared=3D>private.

And more importantly, guest_memfd will wait for the refcount to hit zero (o=
r
whatever the baseline refcount is).

> + To support huge pages, guest_memfd will take ownership of the hugepages=
, and
>   provide interested parties (userspace, KVM, iommu) with pages to be use=
d.
>   + guest_memfd will track usage of (sub)pages, for both private and shar=
ed
>     memory
>   + Pages will be broken into smaller (probably 4K) chunks at creation ti=
me to
>     simplify implementation (as opposed to splitting at runtime when priv=
ate to
>     shared conversion is requested by the guest)

FWIW, I doubt we'll ever release a version with mmap()+guest_memfd support =
that
shatters pages at creation.  I can see it being an intermediate step, e.g. =
to
prove correctness and provide a bisection point, but shattering hugepages a=
t
creation would effectively make hugepage support useless.

I don't think we need to sort this out now though, as when the shattering (=
and
potential reconstituion) occurs doesn't affect the overall direction in any=
 way
(AFAIK).  I'm chiming in purely to stave off complaints that this would bre=
ak
hugepage support :-)

>     + Core MM infrastructure will still be used to track page table mappi=
ngs in
>       mapcounts and other references (refcounts) per subpage
>     + HugeTLB vmemmap Optimization (HVO) is lost when pages are broken up=
 - to
>       be optimized later. Suggestions:
>       + Use a tracking data structure other than struct page
>       + Remove the memory for struct pages backing private memory from th=
e
>         vmemmap, and re-populate the vmemmap on conversion from private t=
o
>         shared
>   + Implementation pointers for huge page support
>     + Consensus was that getting core MM to do tracking seems wrong
>     + Maintaining special page refcounts for guest_memfd pages is difficu=
lt to
>       get working and requires weird special casing in many places. This =
was
>       tried for FS DAX pages and did not work out: [1]
>=20
> + Implementation suggestion: use infrastructure similar to what ZONE_DEVI=
CE
>   uses, to provide the huge page to interested parties
>   + TBD: how to actually get huge pages into guest_memfd
>   + TBD: how to provide/convert the huge pages to ZONE_DEVICE
>     + Perhaps reserve them at boot time like in HugeTLB
>=20
> + Line of sight to compaction/migration:
>   + Compaction here means making memory contiguous
>   + Compaction/migration scope:
>     + In scope for 4K pages
>     + Out of scope for 1G pages and anything managed through ZONE_DEVICE
>     + Out of scope for an initial implementation
>   + Ideas for future implementations
>     + Reuse the non-LRU page migration framework as used by memory ballon=
ing
>     + Have userspace drive compaction/migration via ioctls
>       + Having line of sight to optimizing lost HVO means avoiding being =
locked
>         in to any implementation requiring struct pages
>         + Without struct pages, it is hard to reuse core MM=E2=80=99s
>           compaction/migration infrastructure
>=20
> + Discuss more details at LPC in Sep 2024, such as how to use huge pages,
>   shared/private conversion, huge page splitting
>=20
> This addresses the prerequisites set out by Fuad and Elliott at the begin=
ning of
> the session, which were:
>=20
> 1. Non-destructive shared/private conversion
>   + Through having guest_memfd manage and track both shared/private memor=
y
> 2. Huge page support with the option of converting individual subpages
>   + Splitting of pages will be managed by guest_memfd
> 3. Line of sight to compaction/migration of private memory
>   + Possibly driven by userspace using guest_memfd ioctls
> 4. Loading binaries into guest (private) memory before VM starts
>   + This was identified as a special case of (1.) above
> 5. Non-protected guests in pKVM
>   + Not discussed during session, but this is a goal of guest_memfd, for =
all VM
>     types [2]
>=20
> David Hildenbrand summarized this during the meeting at t=3D47m25s [3].
>=20
> [1]: https://lore.kernel.org/linux-mm/cover.66009f59a7fe77320d413011386c3=
ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com/
> [2]: https://lore.kernel.org/lkml/ZnRMn1ObU8TFrms3@google.com/
> [3]: https://drive.google.com/file/d/17lruFrde2XWs6B1jaTrAy9gjv08FnJ45/vi=
ew?t=3D47m25s&resourcekey=3D0-LiteoxLd5f4fKoPRMjMTOw

