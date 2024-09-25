Return-Path: <linux-arm-msm+bounces-32517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B68198672E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 21:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4D50B21EA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 19:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DC7143871;
	Wed, 25 Sep 2024 19:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2DI90+uA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79E7483
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727294006; cv=none; b=MXO4jMO3gvmnHCBr9kbEO8NfZQEZbwYfEpEm1r2R0tUyFLVuX1q9oGNE70DTQCxXqN572hFvNUo4wIGWLqQ3h5Vh8xpo0uLHmnPU9Kxd+EBH7RHZaUUdckiwAOISJ8lNZ4VfpoDgayJRQFMDGfQE8QeskzZC2Ky1fhfakuncwl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727294006; c=relaxed/simple;
	bh=Fg1Q4r5alIq+aPcbKW2t8qeMcgkmQ1mUEEZCysct7dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQTQH/FHntnXUcZYKeA2BDu8ZfVjr0tZcoJElhjvU9DZQ/q7/vgn3SrWzU7C+hO21SbQ/B59Ik/NzabEWBVWiPXbuQu4wAgS0XFmuKfIn0WNDxC3Ul/Zmzqo4/AQ+L1rCTamSl1z+jG1XM10I3xzulNVoC2pTUIRy136xruCGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2DI90+uA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c2460e885dso5278a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 12:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727294003; x=1727898803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64iuJIfnqpegZPEOOgz7t5g5s7xlHStHb5OWTc/i12s=;
        b=2DI90+uAUKs1JEhjFvOSoNOLlsF9X3DoiDS/2TtorvgaQzwebM7M92S9guAZFlBN6O
         fRXUxnrMtxCkM+bww/UKQ/CVvkSD1oP+Gp6wXOPcAQ0jKvfgh6Rjyr80ZuyfRWGpYYx4
         BnL7i2gN32dphPvjxq446LCJV8Wg2JAzDq9gGVp6cgMAhSVyxNh2O3Nfd9DeWNR7gor1
         8ww4aZFB/OqYirTTRI/5j2s3oPKtPg+V5dEPWnBjsuZY+itwLNsPy1ti4h/FQpeV+any
         oBfGZtLcE3RbTHcBqbaHcGPDms6VoTeGKA9DTJtHK71FD+aywxutxnwst3Az4o5U1UWY
         wuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727294003; x=1727898803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64iuJIfnqpegZPEOOgz7t5g5s7xlHStHb5OWTc/i12s=;
        b=OoRJfTJhQ4cWmoPF++y88a+xP+wiQ/tosgU62HJHbuybNftk54FSRAOkPkhbHGGvl9
         UPkJpkmXzRRYLvKWXFuwuHj18+V/hSDdjyHOt640UNZNlJSFUZk/G6T+4QuhIDMfF09v
         7PvdgzqBKLdCPWvBVGHWQW52/bVr+fYO9NfnCkRvzQaG4TInPNPDYPPZMZIJAGRjSrfT
         +ojv1XunqXWWhG+8ADT9c2GRN34SKTGLlk7mwqr/5oRonK7Ozd4kvculHfSPzRB9Z60c
         ZJJnRC/Vyz2eNAwBO+sLrxw6V8ig7xJYZKubnroOW2E7rspjQBE7CPfNkpyf8mzFxjbQ
         dvKg==
X-Forwarded-Encrypted: i=1; AJvYcCW+5OxM/mdxgwcyhLyOtf+WETFcdknsNNrQL9d06oJ5JgeFHMD/Oz9sP3oA0pWNWHQsEvaMuDkWREDPiC2X@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhCSTetcAre5qQVuK7FGjttJEiHY7waZZpi1fUpIstu+lIF0Q
	pRjtdRmBcVmwxgQCnP5ejWaz32yAlSS0+rHxntXrUFZhDZ08yrK3Etn5MiTmx+MiezvQ3AqAZbp
	a/1A1M5UN3FzOTXCvSc3YGZXPCdB6Qd+dEHtk
X-Google-Smtp-Source: AGHT+IEd1dnIW3oCgVwSJa7j+LLjT/96q4gSCuvf+fcDBjjgJm6GwVRvUVsDeSitLYRdnFfLtWBbtOH+xijje9JxcCQ=
X-Received: by 2002:a05:6402:3513:b0:5c4:6376:bb68 with SMTP id
 4fb4d7f45d1cf-5c8785076e0mr46836a12.3.1727294002931; Wed, 25 Sep 2024
 12:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com> <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <3zxgxxa75znxfvoufhtg3wm2vamjthogyacoybiket5js3kquf@yldiyczms4ou>
 <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com>
 <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj>
 <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com> <CANP3RGcYSEd5h_2mV+EAB_ohCKe7zaf-82UotN40wq3K4V5OtQ@mail.gmail.com>
In-Reply-To: <CANP3RGcYSEd5h_2mV+EAB_ohCKe7zaf-82UotN40wq3K4V5OtQ@mail.gmail.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Wed, 25 Sep 2024 12:53:11 -0700
Message-ID: <CANP3RGceK4sxfk7YP-petxY+dmpD+SVCM9Eb79Fc0u1EwFAVVw@mail.gmail.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
To: Andy Lutomirski <luto@amacapital.net>
Cc: Maxwell Bland <mbland@motorola.com>, Neill Kapron <nkapron@google.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Andrew Wheeler <awheeler@motorola.com>, 
	Sammy BS2 Que <quebs2@motorola.com>, Todd Kjos <tkjos@google.com>, 
	Viktor Martensson <vmartensson@google.com>, "keescook@chromium.org" <keescook@chromium.org>, 
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	kernel-team <kernel-team@android.com>, adelva@google.com, jeffv@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 12:52=E2=80=AFPM Maciej =C5=BBenczykowski <maze@goo=
gle.com> wrote:
>
> On Wed, Sep 25, 2024 at 11:16=E2=80=AFAM Andy Lutomirski <luto@amacapital=
.net> wrote:
> >
> > On Tue, Sep 17, 2024 at 8:08=E2=80=AFAM Maxwell Bland <mbland@motorola.=
com> wrote:
> > >
> > > On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> > > > On Fri, Sep 13, 2024 at 10:30=E2=80=AFAM Maxwell Bland <mbland@moto=
rola.com> wrote:
> > > > > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> > > > >
> > > > > But don't let me distract from the issue, which is that
> > > > > cBPF/eBPF/however these filters get allocated to machine code,
> > > > > bpf_int_jit_compile ends up getting called and a new
> > > > > privileged-executable page gets allocated without compile-time
> > > > > provenance (at least, without reverse engineering) for where that=
 code
> > > > > came from.
> > > >
> > > > But what if there was a mechanism to *cryptographically hash* a BPF
> > > > program as part of the loading process?  Then that hash could be
> > > > looked up in a list, and a decision could be made based on the resu=
lt?
> > > >  Would this help solve any problems?
> > >
> > > The issue I have seen in the prior Qualys linked exploit from my init=
ial
> > > message and from talks by security researchers elsewhere, for example
> > > Google Project Zero's recent "Analyzing a Modern In-the-wild Android
> > > Exploit" by Seth Jenkins, is that people have the ability to target
> > > these pages during the window between the page being allocated as
> > > writable by vmalloc.c and the update to the PTE which makes it
> > > executable, so a signature does help (creates the requirement of more
> > > than one write to commit "forgery"), but doesn't totally 100% solve t=
he
> > > problem.
> > >
> > > Right now, every time I open up chrome on our latest flagship the
> > > browsers sandbox filters trigger my EL2 monitor because they are
> > > attempting to follow the standard W^X protocol. If I were to build on=
e
> > > of these exploits, I'd:
> > >
> > > (1) find out a non-crashing leak for code page and data values
> > > (2) determine from vmalloc's rb-tree where the next one-page allocati=
on
> > >     is likely to occur
> > > (3) prime my write gadget for an offset into that page
> > > (4) spin up chrome in a second thread
> > > (5) attempt to trigger a write (or two) at the right precise time usi=
ng
> > >     prior empirical measurement or my read gadget for kernel mem
> > >
> > > Which is messy, but people have been known to do more given good enou=
gh
> > > stakes. Hell, I spent a few months working on something similar for
> > > airplane communication management units.
> >
> > My vague proposal for a "better JIT API" (which you quoted below)
> > explicitly and completely solves this problem:
> >
> > >
> > > > So what would a good solution look like?  It seem to me that the
> > > > program being supervised (a userspace or kernel JIT) could generate
> > > > some kind of data structure along these lines:
> > > >
> > > > - machine code to be materialized
> > > >
> > > > - address and length at which to materialize it (probably
> > > > page-aligned, but maybe not)
> > > >
> > > > - an "origin" of this code (perhaps a file handle?) -- I'm not 100%
> > > > sure this is useful
> > > >
> > > > - a "justification" for the code.  This could be something like "He=
y,
> > > > this is JITted from cBPF for seccomp, and here's the cBPF".
> >
> > Even ignoring the origin and justification parts, there's no WX window
> > in here.  The code is generated, then it's shipped off to the
> > hypervisor/supervisor, and *exactly that code* is materialized !W, X.
> >
> > Of course, this still leaves verification to be handled.
> >
> > > Returning to the idea of origins, at the end of the work day yesterda=
y I
> > > queried Maciej to "have Android choose one compiler for seccomp polic=
ies
> > > to BPF and stick with it", because if I knew filters were chosen by
> > > libminijail or some other userspace system, I could pretty easily fig=
ure
> > > out what EL2 needs to expect at runtime. An "origin" field would be
> > > equally as effective, and retain flexibility.
> >
> > At the risk of a silly suggestion, what if the entire JIT compiler and
> > verifier (or a sufficient portion) were, itself, a WASM (or similar)
> > program, signed or whatever, and shipped off to the hypervisor?  The
> > hypervisor could run it (in whatever sandbox it likes -- hypervisors
> > are capable of spawning a separate VM to host it if needed), and only
> > then accept the output.
> >
> > I, personally, think that this is of extremely dubious value unless
> > it's paired with a control flow integrity system.  But maybe it could
> > be!  Something like x86 IBT would be a start, and FineIBT would be
> > better, as would an ARM equivalent.
> >
> > --Andy
>
> I've heard rumours (probably read some LWN article perhaps
> https://lwn.net/Articles/836693/ ) that protected kvm for Android has
> some mechanism to start the kernel in some higher priv level (EL2?),
> then move most of it to EL1 while keeping a protected VPN shim in EL2.

s/VPN/KVM/

>
> Perhaps the answer is to leave the bpf verifier + jit compiler in EL2?

