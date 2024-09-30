Return-Path: <linux-arm-msm+bounces-32812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE598B0DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 01:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D4D3B216B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 23:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1718B188A17;
	Mon, 30 Sep 2024 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fwhr2Jrq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D08188730
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 23:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739337; cv=none; b=FksxcHH07XahvcJhGLxiKQHmTURcCuS2gIuwHyxgHDT6MMLuq1Rpms9J1NRub9hGrYxLXoNkxlocamLy/7PwcG+wlIR3TunL6JQh0QBn2ScbairiMZUSDmMrdTQ68mdazT+G5/OWcdk9VaGrv4UcyOEjFldR3nIVr+3JBcpuDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739337; c=relaxed/simple;
	bh=4dGpEVpM22+02GGw0RvO1Wgd10W94qtxpjUGXFrAeJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWbqm8TjibvAvhGbbj94EfJxd8BzvMa60HV2wrISt+kPZZu0IAoKoIvwt5bEV2xx6oPK1vbyZIueWsIF7tXRpcmLvT/NmXxjbruNjCa19jWe9SNVjtgHcLrgsC906MMYPqMvcbvSquaT1/aNIz/mbQLc4dgADLPM5ipatrZGtJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fwhr2Jrq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cb1dd2886so103535e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 16:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727739333; x=1728344133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4AuIkz+eLPnUcRcrWL9J7+PfBfzWjJP5evAxPDFm+E=;
        b=fwhr2Jrqgb2OCV3uRNSnicXkIAvV+hzCD0sMzYL/0N+6c53CGRvOY1sQXGr6I5jRXJ
         ouua50bjnco6Un0E1PPye9DFGbpiWM0qaReC3XFtjBeyzkCTppE93kD4u3lRLUAhMEtm
         n6n0Nb+5WCbXdtSdbMjywtf1RKxJe4PJiDZVHamguPigNjaGot74qvmY5lb9lBYNCpbr
         0mlIAlLs5yJJVHquef/vI4EeZyslaCWKPii+SkKWxn+sSnDrBBRQCKwRcn3gJ3em/AEC
         JjzWxrdV7bRbwPFS10rorTv17BalQNo5LAVEcCnlp0p9H+sR70I7CGcsi4CNWDGUXlJb
         cl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727739333; x=1728344133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4AuIkz+eLPnUcRcrWL9J7+PfBfzWjJP5evAxPDFm+E=;
        b=IFZBLnpfSzvq4/14NXG56b8pjbUfJ/Eysocg9z0RyQNCsKI6sjEdpscWOQeyG3ZJIu
         RI2HRAfhENmbK6PfiR3ERFijDc8NdDlHJYDxzSAMPaLjZpxD1PJyiurXRWkuYhKsphp3
         xGNFQtr95l1lf3icXMxAtSQdz8gLvZCcjFKvNOlrNayk1o7Ip6rGty2/pUIlWl5tyCSj
         ZxMI9RIna2f7kJaUXactJF2zbsP4hORIrI71/beUXihnleVLDxiIBW3DuZRAM0pMx8CN
         QN3XOAICKSsTcCSW67rhY2rpcRqzW98/50Fv8mw8ZDT88tWxekvXwu4TwOkZu5XzdboD
         XhAw==
X-Forwarded-Encrypted: i=1; AJvYcCWLaiiwcxZOqX/duPnQH5QpVfsBs+yTdnLW2LMjlHI4EEJxTkGV3D4T4eeuODI2pKTSh2fjsA9ydL+DEXHS@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqhUhhBA+oUvdEiA9N26TSvSIkgiM9KcyMFtrcK8dminA8/1j
	WGmyG99Seu+mzl+03OdcZhPD7DP8cWJAmZJDYuEWhLSHJ20anfaEih8qPwCcMAhP6gDjJ6zhUw1
	zSH/WkhPPzENQFcOHu3l8hB+53vs1WmNVlOCU
X-Google-Smtp-Source: AGHT+IEwoTGzKCb16Z6H4ePnQeeMHdhGEVN9FmSkiOJ+n/KlqGyQl1dMwWMg/uhERA/3r3LVQkfMUZNLNJMMLZ05zf0=
X-Received: by 2002:a05:600c:3d92:b0:426:7018:2e2f with SMTP id
 5b1f17b1804b1-42f73053d71mr1039545e9.5.1727739332576; Mon, 30 Sep 2024
 16:35:32 -0700 (PDT)
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
 <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com>
 <CANP3RGcYSEd5h_2mV+EAB_ohCKe7zaf-82UotN40wq3K4V5OtQ@mail.gmail.com>
 <CANP3RGceK4sxfk7YP-petxY+dmpD+SVCM9Eb79Fc0u1EwFAVVw@mail.gmail.com> <ZvqJ7rAc_pRUdW3b@google.com>
In-Reply-To: <ZvqJ7rAc_pRUdW3b@google.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 30 Sep 2024 16:35:16 -0700
Message-ID: <CANP3RGcGrP3ppuC0FVAmKdWwbtnfPMu48mmDO=UfJi6C_XmS2Q@mail.gmail.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
To: Sebastian Ene <sebastianene@google.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Maxwell Bland <mbland@motorola.com>, 
	Neill Kapron <nkapron@google.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Andrew Wheeler <awheeler@motorola.com>, 
	Sammy BS2 Que <quebs2@motorola.com>, Todd Kjos <tkjos@google.com>, 
	Viktor Martensson <vmartensson@google.com>, "keescook@chromium.org" <keescook@chromium.org>, 
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	kernel-team <kernel-team@android.com>, adelva@google.com, jeffv@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:22=E2=80=AFAM Sebastian Ene <sebastianene@google.=
com> wrote:
>
> On Wed, Sep 25, 2024 at 12:53:11PM -0700, 'Maciej =C5=BBenczykowski' via =
kernel-team wrote:
> > On Wed, Sep 25, 2024 at 12:52=E2=80=AFPM Maciej =C5=BBenczykowski <maze=
@google.com> wrote:
> > >
> > > On Wed, Sep 25, 2024 at 11:16=E2=80=AFAM Andy Lutomirski <luto@amacap=
ital.net> wrote:
> > > >
> > > > On Tue, Sep 17, 2024 at 8:08=E2=80=AFAM Maxwell Bland <mbland@motor=
ola.com> wrote:
> > > > >
> > > > > On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> > > > > > On Fri, Sep 13, 2024 at 10:30=E2=80=AFAM Maxwell Bland <mbland@=
motorola.com> wrote:
> > > > > > > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> > > > > > >
> > > > > > > But don't let me distract from the issue, which is that
> > > > > > > cBPF/eBPF/however these filters get allocated to machine code=
,
> > > > > > > bpf_int_jit_compile ends up getting called and a new
> > > > > > > privileged-executable page gets allocated without compile-tim=
e
> > > > > > > provenance (at least, without reverse engineering) for where =
that code
> > > > > > > came from.
> > > > > >
> > > > > > But what if there was a mechanism to *cryptographically hash* a=
 BPF
> > > > > > program as part of the loading process?  Then that hash could b=
e
> > > > > > looked up in a list, and a decision could be made based on the =
result?
> > > > > >  Would this help solve any problems?
> > > > >
> > > > > The issue I have seen in the prior Qualys linked exploit from my =
initial
> > > > > message and from talks by security researchers elsewhere, for exa=
mple
> > > > > Google Project Zero's recent "Analyzing a Modern In-the-wild Andr=
oid
> > > > > Exploit" by Seth Jenkins, is that people have the ability to targ=
et
> > > > > these pages during the window between the page being allocated as
> > > > > writable by vmalloc.c and the update to the PTE which makes it
> > > > > executable, so a signature does help (creates the requirement of =
more
> > > > > than one write to commit "forgery"), but doesn't totally 100% sol=
ve the
> > > > > problem.
> > > > >
> > > > > Right now, every time I open up chrome on our latest flagship the
> > > > > browsers sandbox filters trigger my EL2 monitor because they are
> > > > > attempting to follow the standard W^X protocol. If I were to buil=
d one
> > > > > of these exploits, I'd:
> > > > >
> > > > > (1) find out a non-crashing leak for code page and data values
> > > > > (2) determine from vmalloc's rb-tree where the next one-page allo=
cation
> > > > >     is likely to occur
> > > > > (3) prime my write gadget for an offset into that page
> > > > > (4) spin up chrome in a second thread
> > > > > (5) attempt to trigger a write (or two) at the right precise time=
 using
> > > > >     prior empirical measurement or my read gadget for kernel mem
> > > > >
> > > > > Which is messy, but people have been known to do more given good =
enough
> > > > > stakes. Hell, I spent a few months working on something similar f=
or
> > > > > airplane communication management units.
> > > >
> > > > My vague proposal for a "better JIT API" (which you quoted below)
> > > > explicitly and completely solves this problem:
> > > >
> > > > >
> > > > > > So what would a good solution look like?  It seem to me that th=
e
> > > > > > program being supervised (a userspace or kernel JIT) could gene=
rate
> > > > > > some kind of data structure along these lines:
> > > > > >
> > > > > > - machine code to be materialized
> > > > > >
> > > > > > - address and length at which to materialize it (probably
> > > > > > page-aligned, but maybe not)
> > > > > >
> > > > > > - an "origin" of this code (perhaps a file handle?) -- I'm not =
100%
> > > > > > sure this is useful
> > > > > >
> > > > > > - a "justification" for the code.  This could be something like=
 "Hey,
> > > > > > this is JITted from cBPF for seccomp, and here's the cBPF".
> > > >
> > > > Even ignoring the origin and justification parts, there's no WX win=
dow
> > > > in here.  The code is generated, then it's shipped off to the
> > > > hypervisor/supervisor, and *exactly that code* is materialized !W, =
X.
> > > >
> > > > Of course, this still leaves verification to be handled.
> > > >
> > > > > Returning to the idea of origins, at the end of the work day yest=
erday I
> > > > > queried Maciej to "have Android choose one compiler for seccomp p=
olicies
> > > > > to BPF and stick with it", because if I knew filters were chosen =
by
> > > > > libminijail or some other userspace system, I could pretty easily=
 figure
> > > > > out what EL2 needs to expect at runtime. An "origin" field would =
be
> > > > > equally as effective, and retain flexibility.
> > > >
> > > > At the risk of a silly suggestion, what if the entire JIT compiler =
and
> > > > verifier (or a sufficient portion) were, itself, a WASM (or similar=
)
> > > > program, signed or whatever, and shipped off to the hypervisor?  Th=
e
> > > > hypervisor could run it (in whatever sandbox it likes -- hypervisor=
s
> > > > are capable of spawning a separate VM to host it if needed), and on=
ly
> > > > then accept the output.
> > > >
> > > > I, personally, think that this is of extremely dubious value unless
> > > > it's paired with a control flow integrity system.  But maybe it cou=
ld
> > > > be!  Something like x86 IBT would be a start, and FineIBT would be
> > > > better, as would an ARM equivalent.
> > > >
> > > > --Andy
> > >
>
> Hi,
>
> In response to your previous message (this is Seb from pKVM team):
>
>
> > > I've heard rumours (probably read some LWN article perhaps
> > > https://lwn.net/Articles/836693/ ) that protected kvm for Android has
> > > some mechanism to start the kernel in some higher priv level (EL2?),
> > > then move most of it to EL1 while keeping a protected VPN shim in EL2=
.
> >
> > s/VPN/KVM/
>
> Yes we do initialize the pKVM hypervisor at EL2 fairly early at
> device_initcall_sync (initcall 5) before we depriviledge the rest of the
> kernel at EL1.

I'd love to learn more about this for some unrelated reasons.
Even been considering dropping by London to chat about it (with Will)
at some point.

> > > Perhaps the answer is to leave the bpf verifier + jit compiler in EL2=
?
> >
> What are the gains to move this at EL2 ? I am a bit late to this party.
> We don't have any init at that stage because it is too early. We do
> support some EL2 vendor modules loading from a ramdisk but this is a
> different story.

I think the OP is trying to verify the 'sanctity' of EL1 code pages.
(ie. prove via signature that they're all legit, which is hard with jit)
Presumably he's doing this from EL2 (I seriously doubt he's in EL3).
There's been talk of
unjitting/rejitting/regenerating/peephole-verifying the BPF jitted
dynamically generated kernel executable pages - to verify they're
'safe'.
Moving just the 'bpf verifier/jit' into EL2 would seem to solve that
particular problem.
Though of course that is a fair bit of code (though the only untrusted
input to it, post boot completion, is cBPF which is pretty small in
scope)...
Compromises of EL0/EL1 would no longer be able to write gadget over
the bpf jitted kernel executable page prior to them being marked -W+X.
I'm not certain how much of a win in safety this is though?
I guess it depends on how easy the bpf verifier/jitter is to audit.


>
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to kernel-team+unsubscribe@android.com.
> >
>
> Thanks,
> Seb

