Return-Path: <linux-arm-msm+bounces-46965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E96A297DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F64918846A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 17:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337AE1FCCE8;
	Wed,  5 Feb 2025 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bfud4iyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9B1FC7FE
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 17:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777353; cv=none; b=BfZS7Y5jh4nVXdVqhbb9gKkWASljK6qx78dr4wBhzbjwYFqQABMaaZNM9L2tdlvyIz+GrarNW6cXlXW9N0OxBM2wMaWsv1+ug5hJcxF29Q1lp1dbS7cRSGmPwQmUc2OaHEqbHSlnzbqu4DR1u5HRhGhTvKZqJ8oZU1njlSCvD78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777353; c=relaxed/simple;
	bh=OySUaZABQxgu026OiyuhK9hfQ8w2Ug2r+AdmqGHSrLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQf6rVJM9bdKNbQz/SOCDL2D80/8Yd28rTXEveqteWbZeQHE4KcUODDvdPlrV7suwuxoVXU7tHCMd3wVO7Ki4s3vwj0VAXhn6uVdWa4lakNquVmb63grNUvF28S2iamnqwcQNiG1TcejE6MECfvs6fvofA42hsupH7YUTrXijYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bfud4iyq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-543e4d1cf43so146e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 09:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738777349; x=1739382149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39c+iL+aHSl4jq49mlc9PUTlqGClZes8zykHwWAJyCc=;
        b=bfud4iyqSSJqiunUWxL5LDFt67e6thalR5bEh7CUfaxHG6N9QYh05ovqDpltsP9xOc
         e1gLzl4LN4D0qVR17QYqH1pdv2IvqftqVkg3Cy+KajCdWM9osKTSUq2o8C9LfIjuSkUo
         f5l22MLcZbe0mt0z/DwAaaADjS56aqOaJQII6zdst1PZ9/krBM8l7/kz+uNyDAiKoRdh
         DoqWV0n2V79evD8g7fc0dfw/i5sxV5wboZinHNLOeRe/xUuFMUwMH4Tie1Y669sOji9b
         N4Whgtbs7bl/GHnjEAIQXxhtUwjDLKrISi/XeA8XNgI28Mld5f2BQutpDqUfYNg96Zqa
         O1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738777349; x=1739382149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39c+iL+aHSl4jq49mlc9PUTlqGClZes8zykHwWAJyCc=;
        b=Kz+IkGsrIC0FSztreC/iYnGS6jAw020j8mA6eFnk4dkfWigXB5rxhgbxBPSlFUQRhw
         JsVhp4mQY4s0WbljUKH5aHnCk8rOPkRnaucd7eeIjYGETp/RPGbaOCfHZ8dVidVzL4wp
         KO4Kf+6nfIYlpyJbybwRK28b8OakqSLqJWFiIARGI5UVh8bUvZGCln+nk0/bu1pma89y
         kagXUoUKg4Wz06abAmN4uJu9WGVWNwaehmGezoyWlAyD8hkSYi/HE+OcKM+riQgrNfsy
         /EV97QpfnOWCqDAhF0XRxK3KAAqWcqCaGpXGvV3cagHRcVXLnmCGgvKnykHyYgHNZQrj
         uk8w==
X-Forwarded-Encrypted: i=1; AJvYcCVRJD7sXnBz4yKKTITM5+KHMKgaOZzdi0TkIAYCMJL18OM75QuGQyH56/A+9+kOwxIqEovG0BuHv8bZSLR5@vger.kernel.org
X-Gm-Message-State: AOJu0YxglWIY9I5hoRf4G9fSvzZnyDwHQnq1Q1u7jRj+oz82h0NuNDs4
	eTbZ0lSC+bKqc93c9Hc2DXcCpVYMAj9Lf+m9VCWLReX6/zA2Wdsfc9+iUotDiD5JCoL8eHSnUeF
	al+0O6WBAtTlqPC53HynRckZ8nucK8NgDXKzl
X-Gm-Gg: ASbGncsxBbVqMWc+4VMTREjTfmwkULbUY+0S4GHQOdwU5b1yRac1c+7cvgTxOgnaH3x
	hcWfadD3AGe/d00BmKFjrU3m+0DOkJLmClPhoSEcM2eRkbyFlyvO4bzoWL36I89AkMJhk6WTrxS
	pzhqNqjgVVD8bPlTUucaeuHf1oivt2pA==
X-Google-Smtp-Source: AGHT+IE26OeD9m5IOF6U9oJIPVdqv6JXeBCc5CiNKTmlzHx15ZKQXbrAbjXcGlTg8m1ENRsNRij4hhyZetgnn+exia0=
X-Received: by 2002:a05:6512:1044:b0:53d:f0a2:1fe3 with SMTP id
 2adb3069b0e04-54400220e0dmr654101e87.2.1738777348802; Wed, 05 Feb 2025
 09:42:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-7-tabba@google.com>
 <CAGtprH90zc3EWSuyqy4hE7hsmSZSYfB3JBC8KBvc1PdMcw5a4w@mail.gmail.com>
 <CA+EHjTxhdQR1FrYXepVRb_Fy7Gk0q_ew+g-t8o1qxdJ63r6sPQ@mail.gmail.com> <CAGtprH_JLgxAS1-DMVk_MBAQMFx7jnGEyLPJDp-9QG4mzmvSxw@mail.gmail.com>
In-Reply-To: <CAGtprH_JLgxAS1-DMVk_MBAQMFx7jnGEyLPJDp-9QG4mzmvSxw@mail.gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 5 Feb 2025 09:42:17 -0800
X-Gm-Features: AWEUYZmJ7u229YhlH0rclHuieGR4uFgxbfBd2XaG6hmgURrEu_RxRmpMubZ2jQk
Message-ID: <CAGtprH-K0hKYXbH82_9pObn1Cnau74JWVNQ+xkiSSqnmh6BUUQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 9:39=E2=80=AFAM Vishal Annapurve <vannapurve@google.=
com> wrote:
>
> On Wed, Feb 5, 2025 at 2:07=E2=80=AFAM Fuad Tabba <tabba@google.com> wrot=
e:
> >
> > Hi Vishal,
> >
> > On Wed, 5 Feb 2025 at 00:42, Vishal Annapurve <vannapurve@google.com> w=
rote:
> > >
> > > On Fri, Jan 17, 2025 at 8:30=E2=80=AFAM Fuad Tabba <tabba@google.com>=
 wrote:
> > > >
> > > > Before transitioning a guest_memfd folio to unshared, thereby
> > > > disallowing access by the host and allowing the hypervisor to
> > > > transition its view of the guest page as private, we need to be
> > > > sure that the host doesn't have any references to the folio.
> > > >
> > > > This patch introduces a new type for guest_memfd folios, and uses
> > > > that to register a callback that informs the guest_memfd
> > > > subsystem when the last reference is dropped, therefore knowing
> > > > that the host doesn't have any remaining references.
> > > >
> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > ---
> > > > The function kvm_slot_gmem_register_callback() isn't used in this
> > > > series. It will be used later in code that performs unsharing of
> > > > memory. I have tested it with pKVM, based on downstream code [*].
> > > > It's included in this RFC since it demonstrates the plan to
> > > > handle unsharing of private folios.
> > > >
> > > > [*] https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/g=
uestmem-6.13-v5-pkvm
> > >
> > > Should the invocation of kvm_slot_gmem_register_callback() happen in
> > > the same critical block as setting the guest memfd range mappability
> > > to NONE, otherwise conversion/truncation could race with registration
> > > of callback?
> >
> > I don't think it needs to, at least not as far potencial races are
> > concerned. First because kvm_slot_gmem_register_callback() grabs the
> > mapping's invalidate_lock as well as the folio lock, and
> > gmem_clear_mappable() grabs the mapping lock and the folio lock if a
> > folio has been allocated before.
>
> I was hinting towards such a scenario:
> Core1
> Shared to private conversion
>   -> Results in mappability attributes
>       being set to NONE
> ...
>         Trigger private to shared conversion/truncation for
> ...
>         overlapping ranges
> ...
> kvm_slot_gmem_register_callback() on
>       the guest_memfd ranges converted
>       above (This will end up registering callback
>       for guest_memfd ranges which possibly don't
>       carry *_MAPPABILITY_NONE)
>

Sorry for the format mess above.

I was hinting towards such a scenario:
Core1-
Shared to private conversion -> Results in mappability attributes
being set to NONE
...
Core2
Trigger private to shared conversion/truncation for overlapping ranges
...
Core1
kvm_slot_gmem_register_callback() on the guest_memfd ranges converted
above (This will end up registering callback for guest_memfd ranges
which possibly don't carry *_MAPPABILITY_NONE)

> >
> > Second, __gmem_register_callback() checks before returning whether all
> > references have been dropped, and adjusts the mappability/shareability
> > if needed.
> >
> > Cheers,
> > /fuad

