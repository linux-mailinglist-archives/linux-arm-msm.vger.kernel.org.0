Return-Path: <linux-arm-msm+bounces-46933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08262A28793
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFCC7188A583
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 10:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B3A22C339;
	Wed,  5 Feb 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lqOAu5iL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD0822B8C0
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750046; cv=none; b=E5OHyx7yUWL7hB6nOx7mHrhS9Rv98Raew0DVK5gCGm5xhjI1aUw6U/oBYlmVjFmzL0Ymp47k+ZpSiLcv17kP/G4gEtJwk+p2HDoOGE44zrLvyODwt6+dJTBlpjdsBn0WViZbHXrVi3DttdLyrG2zXGCwLjEmAhXaAhO7Akk7M08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750046; c=relaxed/simple;
	bh=c20MAwUWneOb5uhlqcc0oyAOyqlg08B0X2hw2T3qX4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jF/rlpdlu0pgfhSvHb5lmWtM9Mtne9DOi8XZ0/m3/rj1EBna1dAE+t/sb4ydUoyVYkxBHf528HZSs90xhjUXiBXBudlVzYOnvrf61d/X18Fs/4GUczuNnhTnqhVH7zVSasN5QJkE0BEHM4rEad6cgRRr5cLnZMAKwPlRSVUMUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lqOAu5iL; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467abce2ef9so550731cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 02:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738750043; x=1739354843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c20MAwUWneOb5uhlqcc0oyAOyqlg08B0X2hw2T3qX4k=;
        b=lqOAu5iL/NXV+Pkkv9wlDQLmvzOaYX60wHS1RHvvuw/ml+bb8FHPfeSuPhMyUx4ccM
         r2CHAdy4HGXbkwIMOMz0dvbaC4Rg0hxwLMIwy6g4eI/141b3B2Kg1iGJN7IMnNZZsnBX
         68KmtK3PIJU+x22Yfz13ISj4NneAPPJQw9XPKAQBB91IDSQUujadwhei6QCfTG2LbWfu
         72d/0Uz94+wEquObZCa6QjGJtgnIr+kZeKPUzTLa+AqaUHw2MWcw8fCbiXVxjBTAzMie
         x6kYnLfoCzebLyTNtFHR5+9RwT9usP00bD1+7AU4gZUZLUsUJzc799DVBl9HF0Vn99Ci
         EgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750043; x=1739354843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c20MAwUWneOb5uhlqcc0oyAOyqlg08B0X2hw2T3qX4k=;
        b=YKWsOi2lCzWk+odN6V8yg2HMmMRXLwpYjFVmdrd7G8+VKWTv7AAKZaKWOgTUfCIVh+
         eGf7fpgC6B9xCedzlU30Yh3W4VjFka0XExuY7cPiRG53rStQPN1c1rWOhRNCBuYn0rQX
         bWfIqPvq8mkF6eQj8i6MR8efu7yHjUSkjC73uqCrYQjNXFx6SkJj8WbcKuN0l5O4pdv4
         WjA3myC/F2nrkrZNH9nt2wb07fAy811tIEFWDAfLPm1S1lp2dhdrAlSJZZez2PJ1FFFY
         5DfTzIZpb8xAvHgYzkiQzDB2mriLPddJyyoBOen8+GOFaaXNWueYl12tdKdBuBZD2ToW
         VCCw==
X-Forwarded-Encrypted: i=1; AJvYcCWhVLrKLpd/qmBJK2T1E7WFHGuOtp1OM2NJ3CiVuPezvYqkAp4zJiu1gvuFHMcub+vShEH8U4Y04Nt44iJg@vger.kernel.org
X-Gm-Message-State: AOJu0YzXiqB2Swxuhxbk902/AmyBkojN5NJOGV7eL9kTYWG03NaTYat6
	79b0d/D/vm1FH4CeF7fYmIEPUXZ9727g6FDBBitmee2aaDaWxXkiv1uQW39iDkggcWAfoi2M20z
	qbc6aS91hjSlR/PShu2gEtpfYJU6puDfxTq6y
X-Gm-Gg: ASbGncvTAejhC1fuyEY4lpoYPYwE8xYkPbcCmnyOHlJA7jorS6BwmDQknkK3VZyziNL
	4KutaZC/K84z7DrYbkA3KWeV/jrwXukpP0NYekdYuinXNDS+FpcvRzpWBJI4099lB0V1kF0AO/q
	TS1pqYBFCuPMRoL1XvuJ+TCnmhvw==
X-Google-Smtp-Source: AGHT+IHJm5eP5IJraAdJ0l6P0p5bxXXWPNTIiR8y/Td3Y7ipBJy3707qicLON2w7/iwRKT9isEWGJ+QrxjhJcHJHUKw=
X-Received: by 2002:a05:622a:1452:b0:466:8887:6751 with SMTP id
 d75a77b69052e-4701ab5f39emr6496161cf.23.1738750042843; Wed, 05 Feb 2025
 02:07:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-7-tabba@google.com>
 <CAGtprH90zc3EWSuyqy4hE7hsmSZSYfB3JBC8KBvc1PdMcw5a4w@mail.gmail.com>
In-Reply-To: <CAGtprH90zc3EWSuyqy4hE7hsmSZSYfB3JBC8KBvc1PdMcw5a4w@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 5 Feb 2025 10:06:45 +0000
X-Gm-Features: AWEUYZmTnCpbaOTYVgyU9KFr2DxYz2vXTf9wZYg7lmcYPkuAFt5b5SD3LUAFzWs
Message-ID: <CA+EHjTxhdQR1FrYXepVRb_Fy7Gk0q_ew+g-t8o1qxdJ63r6sPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
To: Vishal Annapurve <vannapurve@google.com>
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

Hi Vishal,

On Wed, 5 Feb 2025 at 00:42, Vishal Annapurve <vannapurve@google.com> wrote=
:
>
> On Fri, Jan 17, 2025 at 8:30=E2=80=AFAM Fuad Tabba <tabba@google.com> wro=
te:
> >
> > Before transitioning a guest_memfd folio to unshared, thereby
> > disallowing access by the host and allowing the hypervisor to
> > transition its view of the guest page as private, we need to be
> > sure that the host doesn't have any references to the folio.
> >
> > This patch introduces a new type for guest_memfd folios, and uses
> > that to register a callback that informs the guest_memfd
> > subsystem when the last reference is dropped, therefore knowing
> > that the host doesn't have any remaining references.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> > The function kvm_slot_gmem_register_callback() isn't used in this
> > series. It will be used later in code that performs unsharing of
> > memory. I have tested it with pKVM, based on downstream code [*].
> > It's included in this RFC since it demonstrates the plan to
> > handle unsharing of private folios.
> >
> > [*] https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/guest=
mem-6.13-v5-pkvm
>
> Should the invocation of kvm_slot_gmem_register_callback() happen in
> the same critical block as setting the guest memfd range mappability
> to NONE, otherwise conversion/truncation could race with registration
> of callback?

I don't think it needs to, at least not as far potencial races are
concerned. First because kvm_slot_gmem_register_callback() grabs the
mapping's invalidate_lock as well as the folio lock, and
gmem_clear_mappable() grabs the mapping lock and the folio lock if a
folio has been allocated before.

Second, __gmem_register_callback() checks before returning whether all
references have been dropped, and adjusts the mappability/shareability
if needed.

Cheers,
/fuad

