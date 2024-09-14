Return-Path: <linux-arm-msm+bounces-31786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3A978D41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 06:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3BFBB23090
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 04:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB72017BC9;
	Sat, 14 Sep 2024 04:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="2+tYtd8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DA217BD6
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Sep 2024 04:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726287553; cv=none; b=JxJ7ePkJEici8qi1kJ2p7yf6QEQ/4mLK/s++zrbU1VqH3Xb0eV8hj1inMWVesv4O1e5LWDV1l8Oc35U1soAZ0D+5TkfSNVF86lM/dAL0aShCYM2r2Fm4KytM2X4IMckTIjnc3HzR+jH2hMVtM51Pj3TAtLXQ1jgsOvyQn3E4Snc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726287553; c=relaxed/simple;
	bh=5pv/MZIKEiYz9N3m5G1WhsFBoZTB7UhkGdAX4QafqJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rerd8Pdos2slFtCuFWgtdQ3n+GZcXHr3ia8dCUxugsoSkRMvTue+wgQNJz5YNM8/anC1/MVgOhvVMB13wg8lnAnA4ujCZuj8B1mDDV/tYSkcJ41swQWfIe38+Tw1PwfoLJ7QoTq5x5gup7jpXFel5mHXTSNIvt0hbvvtIIN5diY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=2+tYtd8p; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8a706236bfso88852666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 21:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1726287550; x=1726892350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdzadVk9hCYplQrNDal9GWkDbZ+tMfKYEigC2omyE3o=;
        b=2+tYtd8pF22xfJP0gq/7kOLbMANE/3oJvXRgQKlJEP5PTPS1hf/FdBp13y2N41GRQd
         SRz6KEUueHRnQQV1hIKXt1wVHlmpdHuFuaNBFaunu6shWV/g/pLoS0b10te+qHJ1EbUN
         66Jedg1Xtfs4FCtTS5IHQWbQTDW47KVeI7qn0jS1myZiC/lVaxpdR7tbdPtKGVE7C8nR
         8vH3spwE/W9oJL8oGjb1ms7D2lcKc0Vv1BXDzp3s4uq1nJ+OnTPfETFE8tgcs/LE/rwH
         BCU47ZC7ELaU0ZMPWWiM9V+BD+DqIZmdgbjSxzjD1V/4eGlEpTpzWebw0N8OAQclXoue
         P10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726287550; x=1726892350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdzadVk9hCYplQrNDal9GWkDbZ+tMfKYEigC2omyE3o=;
        b=Wn871urFnbCVfIp7QuR1MgJZjet2rVXOsqNgJpRzeyKYWY1+6tcaqktY48KFL1SHgU
         ZQ8yQCod5iEFMvYbgyD8hLqweVpi1jCc643KXuAxgrEjtXl3XsfYIafruQBUAY20vfKo
         9xhGGv2EJFqV4QEIxkRLOTT72TtgImbaUs125MUiD0yfUQs2rOrDucIwLSkBo+faXtUx
         2QcQ0e89QQUq0W3eYAN3wifRzD72crZ84wJkCYmPD3JXA2JVLAkGpoffY/4aAyRZHMhw
         bFP7e/kNHzXDvL7QHcD8S+qtf38VzaV4IEQu+DY6fKubiFG/IUnbFl7HwDp/OSTVnqGM
         Czgw==
X-Forwarded-Encrypted: i=1; AJvYcCWqNh5ppGkcFm6E5nCRd659mFIubREapx6C8Dgd0ItTbCbpETFGAhdia/9+zdLcF9/e/sD0Nj0rpEhVhABy@vger.kernel.org
X-Gm-Message-State: AOJu0YwMb23si28tODW1HsdgUBptY4ZvT2vJbRMLqmy8f6TROB8gGbqp
	mUjNOpl2gr1QOch3vyslF31dtLV80qBaEk/81joChZCY5SV2dlejN1HT3UtEWh2xL8WfeT7nqs7
	J8TBL9RhSrbM92wHen9YQcVD/IpICj/npONEs
X-Google-Smtp-Source: AGHT+IHKyAlNodHp9jqDCYy/kZ33HUiVSAxDJ22cKxBhLleyO3jKBpMnsTuQTySX16dpsNR6IO5FCODFvpksaSXzYDo=
X-Received: by 2002:a05:6402:2755:b0:5c4:2384:c485 with SMTP id
 4fb4d7f45d1cf-5c42384c535mr3496419a12.27.1726287550124; Fri, 13 Sep 2024
 21:19:10 -0700 (PDT)
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
In-Reply-To: <3zxgxxa75znxfvoufhtg3wm2vamjthogyacoybiket5js3kquf@yldiyczms4ou>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 13 Sep 2024 21:18:58 -0700
Message-ID: <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
To: Maxwell Bland <mbland@motorola.com>
Cc: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Neill Kapron <nkapron@google.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Andrew Wheeler <awheeler@motorola.com>, 
	Sammy BS2 Que <quebs2@motorola.com>, Todd Kjos <tkjos@google.com>, 
	Viktor Martensson <vmartensson@google.com>, "keescook@chromium.org" <keescook@chromium.org>, 
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	kernel-team <kernel-team@android.com>, adelva@google.com, jeffv@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 10:30=E2=80=AFAM Maxwell Bland <mbland@motorola.com=
> wrote:
>
> On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
>
> > These programs will not print out using PTRACE and are difficult to aud=
it
> > without patching the seccomp calls yourself because the ptrace call to
> > PTRACE_SECCOMP_GET_FILTER will fail. I believe (have not checked) becau=
se they
> > are not cBPF, and seccomp's logic makes prog->fprog evaluates to null d=
espite
> > prog existing if it is cBPF, at least on Android 14. I spent a whole da=
y
> > getting frustrated with the failing ptrace call before finally ending u=
p my
> > patches (attached to the end) that instrument ptrace and can print the
> > programs.
>
> LOL, this paragraph is a mess, apologies: I'm referencing the failure of
> get_seccomp_filter in seccomp.c here:
>
> fprog =3D filter->prog->orig_prog;
> if (!fprog) {
>         /* This must be a new non-cBPF filter, since we save
>          * every cBPF filter's orig_prog above when
>          * CONFIG_CHECKPOINT_RESTORE is enabled.
>          */
>         ret =3D -EMEDIUMTYPE;
>         goto out;
> }
>
> Though CONFIG_CHECKPOINT_RESTORE is not set on Android 14, so I think
> the ptrace probably failed for all sorts of reasons unrelated to cBPF.
>
> But don't let me distract from the issue, which is that
> cBPF/eBPF/however these filters get allocated to machine code,
> bpf_int_jit_compile ends up getting called and a new
> privileged-executable page gets allocated without compile-time
> provenance (at least, without reverse engineering) for where that code
> came from.

Mulling over this a bit, I think there are sort of two issues here,
and they're sort of orthogonal to each other.

The easy one first: can there be a static or somewhat static or at
least administrator-controlled list of seccomp cBPF programs?  (Where
administrator is, sadly, probably not the actual owner of a phone, but
that ship sailed a long time ago.). Trying to make a list *and
reference that list from programs loading filters* seems like a huge
breaking change, not to mention that getting it to work right in
namespaces will be extra complex.

But what if there was a mechanism to *cryptographically hash* a BPF
program as part of the loading process?  Then that hash could be
looked up in a list, and a decision could be made based on the result?
 Would this help solve any problems?


Okay, on to the hard part: code integrity.  I've mulled over this a
bit from the perspective of userspace JITs and their interaction with
kernel-enforced security.  Kernel-based JITs and their interactions
with hypervisor security are rather similar.  (They're *not* the same.
The kernel can and does muck with its own pagetables.  User code
can't.  But I don't think this is a huge difference here as to the big
picture.)  There's also self-modifying code (existing executable code
that changes) and code generation (code that is created where code
previously didn't exist).  I'm going to focus on the latter.

Today, userspace can use nasty APIs to allocate writable memory, then
write to it, then change it to be executable.  This comes with gnarly
architecture-specific coherency issues, and it doesn't give a great
way for the kernel to render an intelligent opinion.  And, today, the
kernel can allocate memory (by futzing with pagetables or just using
existing maps), write some code, then either change the permissions to
executable or create a new executable alias, and then do the
architecture-specific incantation to make it coherent, then run it.
In neither case is there an amazing way for the supervisor (kernel or
hypervisor) to render an opinion about the code, and in the userspace
case, the actual efficiency of the process is quite low.

So what would a good solution look like?  It seem to me that the
program being supervised (a userspace or kernel JIT) could generate
some kind of data structure along these lines:

- machine code to be materialized

- address and length at which to materialize it (probably
page-aligned, but maybe not)

- an "origin" of this code (perhaps a file handle?) -- I'm not 100%
sure this is useful

- a "justification" for the code.  This could be something like "Hey,
this is JITted from cBPF for seccomp, and here's the cBPF".

Or there could be a more indirect variant:

- source to be JITed (cBPF, WASM, eBPF, whatever)

- enough relocation info for the supervisor to JIT it appropriately

- address to materialize the code at, along with maximum size

and the supervisor JITs it and materializes it.


I could imagine this being used for userspace and for hypervisor-based
kernel integrity.  Does it do what's needed here if there was a
hypercall kind of like this?

I can also imagine this being considerably faster than what current
userspace does.  On x86, for example, the kernel could populate a page
with the JITted code, then map that page at an address where nothing
was previously mapped, and return to userspace, and userspace could
execute that code, even on a different CPU, with no heavyweight
serialization at all.  I think the only practical way on Linux today
to do this would be to create a memfd, use write(2) or similar to fill
in the code, then mmap it executable.  And to fight with LSMs to make
sure they allow it and to maybe seal it as read-only before mmapping
it.  That latter bit kind of kills it if the goal is to write a web
browser, though -- you don't really want a whole new memfd for each
javascript block that gets JITted.


Is any of this helpful?

--Andy

