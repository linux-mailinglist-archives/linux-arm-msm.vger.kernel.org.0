Return-Path: <linux-arm-msm+bounces-32813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAD98B123
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 01:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78E60B251D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 23:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C3B1A3BDB;
	Mon, 30 Sep 2024 23:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MdbEF/fG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50018E042
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 23:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739700; cv=none; b=XB6vPzg+mqPxxrrRlGe0sRgCAlLqGBHjLkzCNHgKZptXuqjnNLGq6QV51nzSwbAlKTQjU5qeaXrhfxykNOrT/1b1CZr3hiE+9S6DAOPf+Gd2b16pXtiQ+RZEVu+IJkNinwxR4yyU+9Psv6u44HPoorMCofjeaN5JmgSm7J0kcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739700; c=relaxed/simple;
	bh=J2CSm9vVuCxFxBQZz01NRI+j8yZmZ5EoEicb9/KjULo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tk1eMMJEWWePqTul26Y5ZI67s0Yw9Ivux8Gd1F76Z9hT56fbvsEwEJgNo5f1dXikoWOc4RZWSHZd+/2IiKZ+6A0V7N028UZzOuY26SgFwbir6LfCiQwHWaAyFbDoWSLFHWPUv0gC9RMa2yTw4KR9bqTxM2+qVOq7SWqn/3Iob7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MdbEF/fG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c87aebabd7so114a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 16:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727739696; x=1728344496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6MMz3Vs1Zog1bWYMj7tLQZ+3RB1sRaWlv3wzncSYfo=;
        b=MdbEF/fGh35ZMT8KhqogvkxrXEwDrwkLYSr+i/ACPcPzh/ein8cae4QmWT+JQ+UL44
         /7RGqR6V7XOAhSSD/3gibsPnec/s5LnSOOHMxKNbU59zbPNWmxEgGrowg99A7lXJ2PPx
         LhGhaDm+PnjqqRGFFEgqOXBDyLfPOtm9523/+yYtRidHNUEdtn+66+Awq4jHwpMBxyPX
         ohTzV9kqNLpuGbWZOjCkdh+u3cI16xMmHE0ffKgpuiD2YOy6VASfNjDrcp65gBFPet7+
         wd0tUELBL8r2p/E3p9zH2R3u7FGq7rP3OwqmEMMXgf4Uj/eNKsYKvA/ya6eKUkJd1BtV
         fXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727739696; x=1728344496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6MMz3Vs1Zog1bWYMj7tLQZ+3RB1sRaWlv3wzncSYfo=;
        b=D7mQdSNfZ4H5EiRM17F/rfDoq8MArdtKEVfa59K7QzFLE8tsk57bE5E+LVZcn21tD2
         7ETYMjW8R9e+wNjEDmfZRbtPWTmTkygwlYpMuPH4jQcKL8waZ9vSeFsx7s208u8NT55/
         I57AAq10JfO3Sqc89MQGbxcw9t9J4EnerximhnwSq8plT4KHPv+WuJN68ByMVcWFVUsA
         AKORsuZ3uoqTUu4XxtmRG0h0bPj9mmGi61wUsemdUfB80nxBpEcIwHmkNc3zpmOvccSy
         eKmdSn3JXR2Rc3gVkXy4TfVMcZf0XIOh7tp0isZxgld1ew0WmnBtULgAMvG2Y4pfjTjD
         c5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWcy/nx5ZXwsUUIVL0iDKyy2GLypFzfkMYkMN9pG5ZEO0uxTAdjiWrkg1K80HNimy4dtFZmPrwSIKmUmJno@vger.kernel.org
X-Gm-Message-State: AOJu0YytTJjJQ1L+ybzHma3GV45sQJNdp1ueCR56Sr2riBKYpuKRjQeb
	ndFf0axZOx2i4StGoFEwgsmXgdVcmkL/tPvy6u8I+oPzIrUfCvyZ5hXi861ReToBN5FzTzINyBx
	fS/vZbhu+VgKCJKaO+y2wZwI51apDYVeeslgR
X-Google-Smtp-Source: AGHT+IHGWmFOesmk64g07JyFst/4cig59YsXCQPqe8cwII/OLdWS1mB8WGDW3VBvrcRs8CUEsCJh9G+T1+frr7181aY=
X-Received: by 2002:a05:6402:430c:b0:5c5:c5fb:d3f0 with SMTP id
 4fb4d7f45d1cf-5c8a87d8668mr1091a12.4.1727739696149; Mon, 30 Sep 2024 16:41:36
 -0700 (PDT)
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
 <CANP3RGceK4sxfk7YP-petxY+dmpD+SVCM9Eb79Fc0u1EwFAVVw@mail.gmail.com>
 <ZvqJ7rAc_pRUdW3b@google.com> <CANP3RGcGrP3ppuC0FVAmKdWwbtnfPMu48mmDO=UfJi6C_XmS2Q@mail.gmail.com>
In-Reply-To: <CANP3RGcGrP3ppuC0FVAmKdWwbtnfPMu48mmDO=UfJi6C_XmS2Q@mail.gmail.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 30 Sep 2024 16:41:19 -0700
Message-ID: <CANP3RGfBarmSZ7ixTUXz04jOH5=VMxTEFqTxec9UzLvhE+DcXw@mail.gmail.com>
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

On Mon, Sep 30, 2024 at 4:35=E2=80=AFPM Maciej =C5=BBenczykowski <maze@goog=
le.com> wrote:
>
> On Mon, Sep 30, 2024 at 4:22=E2=80=AFAM Sebastian Ene <sebastianene@googl=
e.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 12:53:11PM -0700, 'Maciej =C5=BBenczykowski' vi=
a kernel-team wrote:
> > > On Wed, Sep 25, 2024 at 12:52=E2=80=AFPM Maciej =C5=BBenczykowski <ma=
ze@google.com> wrote:
> > > >
> > > > On Wed, Sep 25, 2024 at 11:16=E2=80=AFAM Andy Lutomirski <luto@amac=
apital.net> wrote:
> > > > >
> > > > > On Tue, Sep 17, 2024 at 8:08=E2=80=AFAM Maxwell Bland <mbland@mot=
orola.com> wrote:
> > > > > >
> > > > > > On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> > > > > > > On Fri, Sep 13, 2024 at 10:30=E2=80=AFAM Maxwell Bland <mblan=
d@motorola.com> wrote:
> > > > > > > > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote=
:
> > > > > > > >
> > > > > > > > But don't let me distract from the issue, which is that
> > > > > > > > cBPF/eBPF/however these filters get allocated to machine co=
de,
> > > > > > > > bpf_int_jit_compile ends up getting called and a new
> > > > > > > > privileged-executable page gets allocated without compile-t=
ime
> > > > > > > > provenance (at least, without reverse engineering) for wher=
e that code
> > > > > > > > came from.
> > > > > > >
> > > > > > > But what if there was a mechanism to *cryptographically hash*=
 a BPF
> > > > > > > program as part of the loading process?  Then that hash could=
 be
> > > > > > > looked up in a list, and a decision could be made based on th=
e result?
> > > > > > >  Would this help solve any problems?
> > > > > >
> > > > > > The issue I have seen in the prior Qualys linked exploit from m=
y initial
> > > > > > message and from talks by security researchers elsewhere, for e=
xample
> > > > > > Google Project Zero's recent "Analyzing a Modern In-the-wild An=
droid
> > > > > > Exploit" by Seth Jenkins, is that people have the ability to ta=
rget
> > > > > > these pages during the window between the page being allocated =
as
> > > > > > writable by vmalloc.c and the update to the PTE which makes it
> > > > > > executable, so a signature does help (creates the requirement o=
f more
> > > > > > than one write to commit "forgery"), but doesn't totally 100% s=
olve the
> > > > > > problem.
> > > > > >
> > > > > > Right now, every time I open up chrome on our latest flagship t=
he
> > > > > > browsers sandbox filters trigger my EL2 monitor because they ar=
e
> > > > > > attempting to follow the standard W^X protocol. If I were to bu=
ild one
> > > > > > of these exploits, I'd:
> > > > > >
> > > > > > (1) find out a non-crashing leak for code page and data values
> > > > > > (2) determine from vmalloc's rb-tree where the next one-page al=
location
> > > > > >     is likely to occur
> > > > > > (3) prime my write gadget for an offset into that page
> > > > > > (4) spin up chrome in a second thread
> > > > > > (5) attempt to trigger a write (or two) at the right precise ti=
me using
> > > > > >     prior empirical measurement or my read gadget for kernel me=
m
> > > > > >
> > > > > > Which is messy, but people have been known to do more given goo=
d enough
> > > > > > stakes. Hell, I spent a few months working on something similar=
 for
> > > > > > airplane communication management units.
> > > > >
> > > > > My vague proposal for a "better JIT API" (which you quoted below)
> > > > > explicitly and completely solves this problem:
> > > > >
> > > > > >
> > > > > > > So what would a good solution look like?  It seem to me that =
the
> > > > > > > program being supervised (a userspace or kernel JIT) could ge=
nerate
> > > > > > > some kind of data structure along these lines:
> > > > > > >
> > > > > > > - machine code to be materialized
> > > > > > >
> > > > > > > - address and length at which to materialize it (probably
> > > > > > > page-aligned, but maybe not)
> > > > > > >
> > > > > > > - an "origin" of this code (perhaps a file handle?) -- I'm no=
t 100%
> > > > > > > sure this is useful
> > > > > > >
> > > > > > > - a "justification" for the code.  This could be something li=
ke "Hey,
> > > > > > > this is JITted from cBPF for seccomp, and here's the cBPF".
> > > > >
> > > > > Even ignoring the origin and justification parts, there's no WX w=
indow
> > > > > in here.  The code is generated, then it's shipped off to the
> > > > > hypervisor/supervisor, and *exactly that code* is materialized !W=
, X.
> > > > >
> > > > > Of course, this still leaves verification to be handled.
> > > > >
> > > > > > Returning to the idea of origins, at the end of the work day ye=
sterday I
> > > > > > queried Maciej to "have Android choose one compiler for seccomp=
 policies
> > > > > > to BPF and stick with it", because if I knew filters were chose=
n by
> > > > > > libminijail or some other userspace system, I could pretty easi=
ly figure
> > > > > > out what EL2 needs to expect at runtime. An "origin" field woul=
d be
> > > > > > equally as effective, and retain flexibility.
> > > > >
> > > > > At the risk of a silly suggestion, what if the entire JIT compile=
r and
> > > > > verifier (or a sufficient portion) were, itself, a WASM (or simil=
ar)
> > > > > program, signed or whatever, and shipped off to the hypervisor?  =
The
> > > > > hypervisor could run it (in whatever sandbox it likes -- hypervis=
ors
> > > > > are capable of spawning a separate VM to host it if needed), and =
only
> > > > > then accept the output.
> > > > >
> > > > > I, personally, think that this is of extremely dubious value unle=
ss
> > > > > it's paired with a control flow integrity system.  But maybe it c=
ould
> > > > > be!  Something like x86 IBT would be a start, and FineIBT would b=
e
> > > > > better, as would an ARM equivalent.
> > > > >
> > > > > --Andy
> > > >
> >
> > Hi,
> >
> > In response to your previous message (this is Seb from pKVM team):
> >
> >
> > > > I've heard rumours (probably read some LWN article perhaps
> > > > https://lwn.net/Articles/836693/ ) that protected kvm for Android h=
as
> > > > some mechanism to start the kernel in some higher priv level (EL2?)=
,
> > > > then move most of it to EL1 while keeping a protected VPN shim in E=
L2.
> > >
> > > s/VPN/KVM/
> >
> > Yes we do initialize the pKVM hypervisor at EL2 fairly early at
> > device_initcall_sync (initcall 5) before we depriviledge the rest of th=
e
> > kernel at EL1.
>
> I'd love to learn more about this for some unrelated reasons.
> Even been considering dropping by London to chat about it (with Will)
> at some point.
>
> > > > Perhaps the answer is to leave the bpf verifier + jit compiler in E=
L2?
> > >
> > What are the gains to move this at EL2 ? I am a bit late to this party.
> > We don't have any init at that stage because it is too early. We do
> > support some EL2 vendor modules loading from a ramdisk but this is a
> > different story.
>
> I think the OP is trying to verify the 'sanctity' of EL1 code pages.
> (ie. prove via signature that they're all legit, which is hard with jit)
> Presumably he's doing this from EL2 (I seriously doubt he's in EL3).
> There's been talk of
> unjitting/rejitting/regenerating/peephole-verifying the BPF jitted
> dynamically generated kernel executable pages - to verify they're
> 'safe'.
> Moving just the 'bpf verifier/jit' into EL2 would seem to solve that
> particular problem.
> Though of course that is a fair bit of code (though the only untrusted
> input to it, post boot completion, is cBPF which is pretty small in
> scope)...
> Compromises of EL0/EL1 would no longer be able to write gadget over
> the bpf jitted kernel executable page prior to them being marked -W+X.
> I'm not certain how much of a win in safety this is though?
> I guess it depends on how easy the bpf verifier/jitter is to audit.

Note: if the full blown bpf verifier/jitter is too hard to audit, you
could potentially write a new EL2 jitter just for cBPF.  It could just
be a trimmed down version of the generic eBPF jitter.  cBPF is much
much simpler.

>
>
> >
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to kernel-team+unsubscribe@android.com.
> > >
> >
> > Thanks,
> > Seb

