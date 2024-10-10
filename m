Return-Path: <linux-arm-msm+bounces-33887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F39989D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B111F286A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16C11CEAAB;
	Thu, 10 Oct 2024 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vbt9iVoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA21CDA3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570561; cv=none; b=Nm9614QjTD93xq99N5KvEyiOHe3IWo7HuYD9vP9B3ffXMlRJemjU7RBOBzajuN54MBxeq0lNS94LTC8W3TkA1Mpi18Mm+cEGsEQChV1Hky/T7RctJuve95PGzdwoca/SkvaC5Tvx/sgybMp2gaMR56zHz1cewKCVbP3esgofhJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570561; c=relaxed/simple;
	bh=CCB5dxHRqZ3E8RkltIzsE4os1BC4I/6J3V+V/1aEnks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVvMkqXAZZ32AILbVF1RkA33vZ/amqRjeibXV7SXxHcH+0Hklvj/YbSB3H7GxZItsk/uKZ9j/qKO5YrrHpHSgUFRYeeuE1TpA4SrR43oJWd0r1iXeeZ9b9sWQHX45fzwFOcx+jRqoKwgzVDbY6zx1OchBPipQ/hvUPi/sM7U4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vbt9iVoU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-431141cb4efso277715e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728570558; x=1729175358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8MdpTiU/8iDEZirrA0ytrwejnbRM73TiuqSnyMFm3AI=;
        b=vbt9iVoUQRQzw/O7jaGp4qXOkw2DhsPmvHp1NQZjoj5cS4ZWameG6tvZSq+QkbbSI9
         KOXlIdZ1u/dM+eiIwO4PHlNq8f5bKWQGH2JA/KLtDVjNbeFoxPwZCxvrkZuslnPxh8d7
         k/ze7NHxh05ebK7iMhgQpf97Jh11ZsJbqNphDH+lA9V4RlLOI4uF4O2v7/XmNdIeemBU
         3k3s37jr1cFJEvPwdCT8Ebl18V16XJdpNTTU2GWes8dleBT9Q9xMgJtNdhACSim6Cp1U
         lSagJsEFV3L6docZb6bhTOsUvr//GscqzF7eUU8ybN9M0VoOujGTF9wDLzxrAsQ6zBr2
         mkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728570558; x=1729175358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MdpTiU/8iDEZirrA0ytrwejnbRM73TiuqSnyMFm3AI=;
        b=jBdjCRWjRDjsB8AJjyOGTdfBz/Bh4dtoQ8byN4KfHnLxmgaLhcT2JTOMPEtD9ncI2S
         S7rJmdYEnuML5AshX4LxxF+v07Y4ig/9h7bjOV5rDlarXs54/fBovnROkFFZ+rzZO10w
         axHi2VWicTpIxDkdQ+vAr4scTqfhAHPWmI3REjDnqnFxQ+5fsldq+IXP/ebo32fqxfQQ
         o9Mzrt0cUQ5coWFKa/K+xheyzRGtp6s1tU7rTQ8FmEJwep07ZkE5la4G1CwdrqA0Cbu2
         tE2gN2D3wpBXcnBpf2OEooEAYzN6Tf4Sw8XOQASmzIkcgWGIRRcjamPpHmFFo2U2fTtq
         oKpw==
X-Forwarded-Encrypted: i=1; AJvYcCU6VPCXzY4YbBZi2prtWinuMXzodBYYnRUmorqsR7w7iXsJ06GelqTAKqBD8l0RKHWFfDhX1AOS+m2ML3B/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8l1gDC/AHiL6iTy5KDe6TkHsk9O0yGlPqdxcmnNCYWpHWM5bf
	pfucoRRI2FVYbo8ijv0TGhIgjLo/cTjWvAH8C+SUUXu1vluWQiqxCLrkxRTkPVG7tAw+o/jYTxN
	h2Ioc2b26wqyKQLmosp6KSGNY/4+lNR7N7GSN
X-Google-Smtp-Source: AGHT+IGDlV0po9Jumm88kvuGyKalS6PB54bj2tx+G/ByJVCxW8t/jUeSVdSnS+jsqlCX5oBA9QNKb96GtclSgTJJmBc=
X-Received: by 2002:a05:600c:1e21:b0:42b:a8fc:3937 with SMTP id
 5b1f17b1804b1-431161b4011mr4685945e9.4.1728570556312; Thu, 10 Oct 2024
 07:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com> <20241010085930.1546800-5-tabba@google.com>
 <i44qkun5ddu3vwli7dxh27je72ywlrb7m5ercjhvprhleapv6x@52dwi3kwp2zx>
 <CA+EHjTwOsbNRN=6ZQ4rAJLhpVNifrtmLLs84q4_kOixghaSHBg@mail.gmail.com> <mr26r6uvvvdevwqz6flhnzbqjwkf7ucictnjhk3xsuktwsujh5@ncf57r3v6w6p>
In-Reply-To: <mr26r6uvvvdevwqz6flhnzbqjwkf7ucictnjhk3xsuktwsujh5@ncf57r3v6w6p>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Oct 2024 15:28:38 +0100
Message-ID: <CA+EHjTwEmXcQhCzGJG1icBzHvWEBUVVH33-ng60ngup6LMcC4Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] KVM: guest_memfd: Allow host to mmap
 guest_memfd() pages when shared
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 13:21, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Thu, Oct 10, 2024 at 11:23:55AM +0100, Fuad Tabba wrote:
> > Hi Kirill,
> >
> > On Thu, 10 Oct 2024 at 11:14, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> > >
> > > On Thu, Oct 10, 2024 at 09:59:23AM +0100, Fuad Tabba wrote:
> > > > +out:
> > > > +     if (ret != VM_FAULT_LOCKED) {
> > > > +             folio_put(folio);
> > > > +             folio_unlock(folio);
> > >
> > > Hm. Here and in few other places you return reference before unlocking.
> > >
> > > I think it is safe because nobody can (or can they?) remove the page from
> > > pagecache while the page is locked so we have at least one refcount on the
> > > folie, but it *looks* like a use-after-free bug.
> > >
> > > Please follow the usual pattern: _unlock() then _put().
> >
> > That is deliberate, since these patches rely on the refcount to check
> > whether the host has any mappings, and the folio lock in order not to
> > race. It's not that it's not safe to decrement the refcount after
> > unlocking, but by doing that i cannot rely on the folio lock to ensure
> > that there aren't any races between the code added to check whether a
> > folio is mappable, and the code that checks whether the refcount is
> > safe. It's a tiny window, but it's there.
> >
> > What do you think?
>
> I don't think your scheme is race-free either. gmem_clear_mappable() is
> going to fail with -EPERM if there's any transient pin on the page. For
> instance from any physical memory scanner.

I remember discussing this before. One question that I have is, is it
possible to get a transient pin while the folio lock is held, or would
that have happened before taking the lock?

Thanks,
/fuad

> --
>   Kiryl Shutsemau / Kirill A. Shutemov

