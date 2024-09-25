Return-Path: <linux-arm-msm+bounces-32516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D098672D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 21:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A0A281D95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 19:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E39A143871;
	Wed, 25 Sep 2024 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zzPWYso5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45A7483
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727293974; cv=none; b=ZQGAQ8+pYNm8f9BguA+LrNWwFDoIpUyHLWy97kJN/BRaBe2LXhC2TlKJ4goqcEbnai/8aSimk+MX6N01oA/+WH1WrB94uT6yEzM15kcJgvRLPjBG12L5h2wz5xXKwH6fiOS0kcDozbkAobzIevTzIErQxiCizFcPK75SwF3Z8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727293974; c=relaxed/simple;
	bh=qdWoiJdK2swAPZmqM3u62pkvEI/b9QDmb1hhkxkvKLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ub1wKRtjNJHbXcJPdxFMWYZRalQ6CuRWs3iR5Tc2sov7RqwZOWwUucZBVKB1cwMsJ+x25M5Xzl+2U2xOWnFh7aqu8rkgCNJud7pOqS2EQCrM9oGyModwapjQsIEd3ow/mOOy5IsE2DWTp1fuis8BVnxnc3pZnrEBIyn+novXOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zzPWYso5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c2460e885dso5259a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727293970; x=1727898770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gprvP7e1qkykpM3vPlM9n0gOW/iqHKlSh9kSfItEX+4=;
        b=zzPWYso5Opo5g+IGsw3MjA1/d21GifMpd7K3JobwMJNbuuifK+VKYYcVLUVFZ33h19
         YjEkyQZNF3vewTeGBvsqNaVycDaUt4FyH0VQMALSdO57uLe2onGEOJpZCsOdrZQl6srb
         E4uWnjQ2cMoZ8o/vDs1IGccaVojlCgE3/e5Uy5IR/cH1fry67RWMPph3emg+GkECxz3g
         rAQdm8QSrWB2gJVfDl2XJKb6YMtZG/Fk28zT5gjDXdUB/Cy7LlttYBfbLs7Ae5dXEFNX
         eQzsVI5YDaGbvXlRRh8V3gjWhQfoMppPfaNx3mJ7Dqx7JMBb99g5aQ1I1leguxsOitIT
         3Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727293970; x=1727898770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gprvP7e1qkykpM3vPlM9n0gOW/iqHKlSh9kSfItEX+4=;
        b=tQh7Qy0O1hfb2skULOpY4XRj2vvXBY5eMj3iWlfm8o5I9DqXvAcJQgPHlGzTdRfsF9
         axnrd9oYaw6QEoHuTX98uJ1ZnOjp0/y/bnQDzpUnlyivIuZ+2ytXvFh8evaJVt9qHEcD
         tjFSz99lUibrhXKimt288E//8fmGFuUA1DYE1HD7pHymdMpPvkxTRKWcLljO70u34GJV
         BOARD5BBYCaKNaLKDfMyrmto3hQ7zhR+d6Z+vTZ1+DSArsIPEHvKqPi/jjKczAlkbW2K
         gXhnficnsu2xqsZPxUeIEjdY26Y73P8DQenXEMsEESPli4d21DrRFSHScdqH4719W6Ho
         teHA==
X-Forwarded-Encrypted: i=1; AJvYcCViFVRfS/8og7IV8g5U6OPLcbfUV5Vd0HhVEKX/ulqS2zReSmlPRpq3UR6oubFEfwAXcvGLkUDDO7OFrpER@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36lwYi9/AGT2X6Z9Qgl13Y+g4kU5tdKvXRxsVJ977GeaHL5zJ
	gOeFcMO8yZmqgVu6ZQ1/7WyC5mF4AyDedr/WDEaggGPFAZ6dTByK9ngyKwwlYuFnqwarWr/m4GQ
	rhTnHGMq5dJCJ/6T6s2/dVsyLnZEjno2PPpc/
X-Google-Smtp-Source: AGHT+IFj3nzJZsnkUkRw2GH6Lg9tWCqeWStAv/WMVtH76ZZTHFY1/ZECPJYYIfHI0MMnOd3DOJCX/hWqFAfHb/jonuI=
X-Received: by 2002:a05:6402:5186:b0:5be:9bb0:1189 with SMTP id
 4fb4d7f45d1cf-5c878425ee9mr87593a12.2.1727293970058; Wed, 25 Sep 2024
 12:52:50 -0700 (PDT)
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
 <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj> <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com>
In-Reply-To: <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Wed, 25 Sep 2024 12:52:38 -0700
Message-ID: <CANP3RGcYSEd5h_2mV+EAB_ohCKe7zaf-82UotN40wq3K4V5OtQ@mail.gmail.com>
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

On Wed, Sep 25, 2024 at 11:16=E2=80=AFAM Andy Lutomirski <luto@amacapital.n=
et> wrote:
>
> On Tue, Sep 17, 2024 at 8:08=E2=80=AFAM Maxwell Bland <mbland@motorola.co=
m> wrote:
> >
> > On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> > > On Fri, Sep 13, 2024 at 10:30=E2=80=AFAM Maxwell Bland <mbland@motoro=
la.com> wrote:
> > > > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> > > >
> > > > But don't let me distract from the issue, which is that
> > > > cBPF/eBPF/however these filters get allocated to machine code,
> > > > bpf_int_jit_compile ends up getting called and a new
> > > > privileged-executable page gets allocated without compile-time
> > > > provenance (at least, without reverse engineering) for where that c=
ode
> > > > came from.
> > >
> > > But what if there was a mechanism to *cryptographically hash* a BPF
> > > program as part of the loading process?  Then that hash could be
> > > looked up in a list, and a decision could be made based on the result=
?
> > >  Would this help solve any problems?
> >
> > The issue I have seen in the prior Qualys linked exploit from my initia=
l
> > message and from talks by security researchers elsewhere, for example
> > Google Project Zero's recent "Analyzing a Modern In-the-wild Android
> > Exploit" by Seth Jenkins, is that people have the ability to target
> > these pages during the window between the page being allocated as
> > writable by vmalloc.c and the update to the PTE which makes it
> > executable, so a signature does help (creates the requirement of more
> > than one write to commit "forgery"), but doesn't totally 100% solve the
> > problem.
> >
> > Right now, every time I open up chrome on our latest flagship the
> > browsers sandbox filters trigger my EL2 monitor because they are
> > attempting to follow the standard W^X protocol. If I were to build one
> > of these exploits, I'd:
> >
> > (1) find out a non-crashing leak for code page and data values
> > (2) determine from vmalloc's rb-tree where the next one-page allocation
> >     is likely to occur
> > (3) prime my write gadget for an offset into that page
> > (4) spin up chrome in a second thread
> > (5) attempt to trigger a write (or two) at the right precise time using
> >     prior empirical measurement or my read gadget for kernel mem
> >
> > Which is messy, but people have been known to do more given good enough
> > stakes. Hell, I spent a few months working on something similar for
> > airplane communication management units.
>
> My vague proposal for a "better JIT API" (which you quoted below)
> explicitly and completely solves this problem:
>
> >
> > > So what would a good solution look like?  It seem to me that the
> > > program being supervised (a userspace or kernel JIT) could generate
> > > some kind of data structure along these lines:
> > >
> > > - machine code to be materialized
> > >
> > > - address and length at which to materialize it (probably
> > > page-aligned, but maybe not)
> > >
> > > - an "origin" of this code (perhaps a file handle?) -- I'm not 100%
> > > sure this is useful
> > >
> > > - a "justification" for the code.  This could be something like "Hey,
> > > this is JITted from cBPF for seccomp, and here's the cBPF".
>
> Even ignoring the origin and justification parts, there's no WX window
> in here.  The code is generated, then it's shipped off to the
> hypervisor/supervisor, and *exactly that code* is materialized !W, X.
>
> Of course, this still leaves verification to be handled.
>
> > Returning to the idea of origins, at the end of the work day yesterday =
I
> > queried Maciej to "have Android choose one compiler for seccomp policie=
s
> > to BPF and stick with it", because if I knew filters were chosen by
> > libminijail or some other userspace system, I could pretty easily figur=
e
> > out what EL2 needs to expect at runtime. An "origin" field would be
> > equally as effective, and retain flexibility.
>
> At the risk of a silly suggestion, what if the entire JIT compiler and
> verifier (or a sufficient portion) were, itself, a WASM (or similar)
> program, signed or whatever, and shipped off to the hypervisor?  The
> hypervisor could run it (in whatever sandbox it likes -- hypervisors
> are capable of spawning a separate VM to host it if needed), and only
> then accept the output.
>
> I, personally, think that this is of extremely dubious value unless
> it's paired with a control flow integrity system.  But maybe it could
> be!  Something like x86 IBT would be a start, and FineIBT would be
> better, as would an ARM equivalent.
>
> --Andy

I've heard rumours (probably read some LWN article perhaps
https://lwn.net/Articles/836693/ ) that protected kvm for Android has
some mechanism to start the kernel in some higher priv level (EL2?),
then move most of it to EL1 while keeping a protected VPN shim in EL2.

Perhaps the answer is to leave the bpf verifier + jit compiler in EL2?

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

