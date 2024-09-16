Return-Path: <linux-arm-msm+bounces-31868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE297A969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 00:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 433B51C22860
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 22:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0187F18E05B;
	Mon, 16 Sep 2024 22:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zzaKRyl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5D18D65C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 22:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726527023; cv=none; b=RQUMvM2bLvqxQfaJYi617mCrjywBRpE4CyQApCwYtIPEPcG2MDS67VZaUfgCeFrUj4flju+LxMgFAInCR+yN/dY0ONbaH/dGleZQPcyPF8fq+c9zQY9zbNHp8KWlcTzEjZIDjswHICYrU9Jkt2oRCVTpQ7O3Yp4RY0vydlzeQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726527023; c=relaxed/simple;
	bh=KsW+4r3ujD+d4pXDw9N0iYHXqBhIrSHgIcZDPMo6WOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6TOOFpL6i6gCWWM5yDlBYrRZWCqkj9gyukVCezueQPIzuUHfnb8YZi9zvyaw9S6JZ/NxaXwCDCg47Z0Tx3FscYEo4UX6N63a7CLBPH1+Jjmnm+oOLc0084AgH7tkhlV+HcfQ8R10KZqO1/imDLtnuxkFGSRI+8SScQwhjvVBao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zzaKRyl/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c24374d8b6so4674a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726527020; x=1727131820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBXbtJIo6ugy7bh+sB9Le9skY1KBW4qr9ZLUfX5H+oQ=;
        b=zzaKRyl/1ae6MUdraLG80YhU5liJV3Teke5cl+222YI1dXR66g0+0u6sOVbY+pPfka
         rMJbqZY3ZnExbANPDOjH3Qh64eXnCzwDX3UTk7eMEzWSETf6hgYky7hb+g6IBU3MusPM
         2jwp5JfK0jFZXNe7aRu+gXr34HP9GuNLDhkCeSgT1Zfm4iNT56AwOZGZZVGBGSawnnxO
         sc9VZfskzwR4+jwlWggKebZLLfsZbYzxWLv7MoqxHon7gdBsBeWaE6N42iHKW9fIbJ8v
         BRCU/vlkVJ2b7nLVZo7HobxY3H1qDFpm6UpGhla+AfVNoeUmcKuPA3j9NRNrgJvQwmuy
         ye3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726527020; x=1727131820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBXbtJIo6ugy7bh+sB9Le9skY1KBW4qr9ZLUfX5H+oQ=;
        b=G5R6Oc5l4aFARo4IxqX4u+Qofw0PvgQxiPrp6K1fLMSzTRAgPFcvk9aM5246aFLvEO
         4mckpSgU/WzI/V+NjIij0P00F3x60gC2JHxhFYndllaMG1dDoA68o0/MCCd9Y8ERAvkI
         mYym2qsYBdcPNx7zMi2Wt3YWvInXnt3wDDHVk0AmlTrZQzilgEEsoz31g4ruQyO6JgJT
         7e++b93jZFSY+hQ5rHLiZbI7dGeAS/rV3aKwQbdojHDjx10gdRcb8uPCaNK08eNiu3II
         ORvQQ3V+dnYzVGcqYl3n4a4bGMYIyc0AqUAngEh7+Z+PkIeahefI0p+EVoJguroV4VYW
         ZRjw==
X-Forwarded-Encrypted: i=1; AJvYcCW5nNyN3mgJzAXsTi+zpqBCaIm0wJVFVF7paRLBYff/jApFDxEcksY6kZb5C809Samqvq+nosbQorAPyTCh@vger.kernel.org
X-Gm-Message-State: AOJu0YzLeCFmGhg8z2EsQ2WJpuWsqm1Wz5FFZDVOZgzpcfY77beqeTf2
	BLCvTwDHSemwgpe58lTEu12hzZRPiGMKoEH6qDqJ+wVZAfzrHwhqh8mdthSemCwU6pu5IvAdGcd
	6odPze56i0acul84GbV70QEEy5aArg+k0FLd1
X-Google-Smtp-Source: AGHT+IEW3SM47Q6eOT+WFh0WxA4Y3CnrOx9r78+izxYZcrFCLB/v+l2ne+Az53BOD2TsBuIor88WLrX/pdorDRdlwWY=
X-Received: by 2002:a05:6402:5202:b0:5c4:2e9f:4cfc with SMTP id
 4fb4d7f45d1cf-5c446b84427mr195050a12.6.1726527019504; Mon, 16 Sep 2024
 15:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com> <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <CANP3RGfwL1OigoSkhmnRFDy=y+sstabiRAREPxEbEiEfuDaweQ@mail.gmail.com> <rlgx2zq3s6vs6t26fut3ez6bix5jphvofyuw2amnbdpyb6c55m@kxzqput2rry5>
In-Reply-To: <rlgx2zq3s6vs6t26fut3ez6bix5jphvofyuw2amnbdpyb6c55m@kxzqput2rry5>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 16 Sep 2024 15:50:04 -0700
Message-ID: <CANP3RGf_WoEOCgJ=X_nVBDYuwDty0BDiCSZQxONLX-dVbd2-UQ@mail.gmail.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
To: Maxwell Bland <mbland@motorola.com>
Cc: Neill Kapron <nkapron@google.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Andrew Wheeler <awheeler@motorola.com>, 
	=?UTF-8?B?U2FtbXkgQlMyIFF1ZSB8IOmYmeaWjOeUnw==?= <quebs2@motorola.com>, 
	Todd Kjos <tkjos@google.com>, Viktor Martensson <vmartensson@google.com>, 
	Andy Lutomirski <luto@amacapital.net>, "keescook@chromium.org" <keescook@chromium.org>, 
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	kernel-team <kernel-team@android.com>, "adelva@google.com" <adelva@google.com>, 
	"jeffv@google.com" <jeffv@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 3:18=E2=80=AFPM Maxwell Bland <mbland@motorola.com>=
 wrote:
>
> Another long email follows. The TL;DR is considering the related issues
> such as changes in cBPF and some interesting thoughts regarding Google's
> maintenance of seccomp inside Android, Android maintainers should make
> the decision to "use minijail" or "use bionic's tools" for compiling
> policies to BPF. Is there any reason multiple seccomp policy to BPF
> program compilers need to exist in the AOSP (or even, maybe, Linux's use
> of seccomp)? The shift to a single project for policy compilation to BPF
> would remove duplicate effort in maintaining seccomp policy to BPF
> compilers, solve the code page integrity issue, and lower potential
> sources of policy compiler errors. See below.
>
> On Fri, Sep 13, 2024 at 02:16:40PM GMT, Maciej =C5=BBenczykowski wrote:
> > On Fri, Sep 13, 2024 at 10:07=E2=80=AFAM Maxwell Bland <mbland@motorola=
.com> wrote:
> > > Add a hook to seccomp which triggers/enables hooks in BPF's JIT to in=
strument
> > > the output machine code  page so that EL2 can (1) invert the machine =
code back
> > > to BPF then (2) check the BPF corresponds to a valid seccomp filter p=
olicy.
> >
> > If you care that deeply about this: you could simply turn of jit
> > compilation of cBPF (including seccomp) - but you'll take a
> > performance hit.
> > If you care about performance you could only jit compile *recognized*
> > cBPF programs.
> > Hell, instead of jit-ing them you could replace them with outright
> > (pre)compiled into the kernel native functions that accomplish the
> > same thing.
> > There's probably only somewhere <10 of these in common use / part of
> > the platform.
> > That said, you'd still pay a performance hit for (Chrome web browser
> > style) sandboxes since those policies *will* be updated without os
> > updates.  Similarly with the mainline shipped cBPF code (which does
> > process all packets) - you can't guarantee it won't change.
>
> I am hesistant with opting to turn off JIT, as a few months ago I got a
> warning from Alexei Starovoitov about this approach:
> https://lore.kernel.org/all/CAADnVQJCxFt2R=3Dfbqx1T_03UioAsBO4UXYGh58kJaY=
HDpMHyxw@mail.gmail.com/
>
> I would be hesitant for Moto (or anyone) to maintain a dynamic list of
> acceptable code pages for each AOSP (or subpackage) release, and the
> list will only grow with time. It would be really difficult, as well,
> for me to even begin to figure out if I have "caught" all of them, since
> Qualcomm services use seccomp and I have no idea if I am testing every
> edge condition in the phone while developing this.
>
> In lieu of knowing exactly what these code pages will be and the dangers
> or growing lack of support for the BPF interpreter: the current
> SYS_Seccomp user environment, e.g. libminijail or bionic's libc or
> whatever Qualcomm is using, ends up being the de dacto specification of
> the seccomp BPF "language", rather than a translation layer to a
> standard policy file format which uniformly gets translated to BPF for
> the kernel's consumption. The disconnect is that the current seccomp.c
> semantics _only_ encode the cBPF operations and some sensibility
> checking for the ranges of referenced memory, but seccomp.c is currently
> not sufficient to provide an EL2-enforcable or Android-enforceable
> contract on the integrity of the desired policy.
>
> For example, I took some measurements today on-device, and the three
> programs that were triggering EL2-level code page integrity failures in
> the basic case follow the same general structure:
>
> - Load systemcall _NR_ definition values
> - Generate "priority" JEQ statements (opcode 0x15)
> - Generate additional jump statements (opcode 0xa5, 0x35, etc)
> - Standard(ish) suffix consisting of loads/movs/exits (opcode 0x61,0xb4,0=
x95)
>
> But there's nothing to guarantee that this is what will happen in for
> arbitrary programs with SYS_seccomp permission, as they could be using
> different generators for their BPF. For example,
> compile_seccomp_policy.py under the minijail project and genseccomp.py
> under the bionic libc project solve this same problem in two different
> ways, though they both generate a couple of _NR_ checks and jump
> statements, but with different python code.
>
> Can Android just say "use minijail" or "use bionic's tools" and call it
> a day, similar to the intent system, or binder, or any number of the
> ecosystem "hard rules"? That way, Google also does not have to maintain
> the two separate projects doing the same thing, we can figure out what
> the heck Qualcomm is doing, and I can sleep better at night. Seccomp is
> not C, there's not the fight over clang vs gcc: system call numbers are
> baked into struct seccomp_data, why bother with multiple (potentially
> buggy and differing in flexibility) ways of compiling the desired policy
> into BPF. Maybe this is too opinionated, but the nice world we would get
> as a result is every single code page in Android's kernel would be
> verifiable (and, if it was adopted in Linux generally) most ARM systems.
>
> Regardless, the clear hack, to me, is that when EL2 gets a code page
> integrity failure on one of these seccomp pages, for now I do some
> simple binary analysis to check that the code page consists only of what
> is effectively a giant case statement. Over time, this needs to be
> refined to ensure the adversary has not mucked with the policy in a
> valid way, like seccomp_check_filter in kernel/seccomp.c but better.
>
> > I guess for the mainline shipped cBPF programs we could technically
> > probably swap them for eBPF.  Taking a quick glance at uses of
> > BpfClassic.h in aosp I see 6 socket filter cBPF programs, of which
> > only 1 is dynamic (for matching clat IP addresses), so the remaining 5
> > are probably trivial to eBPF-ify (and thus hide behind selinux
> > restrictions).
>
> clatd, netd, gpuWork, and others turned out to not be an issue (or I
> have not run into any code page errors) yet, maybe because I'm running
> drivers for the kernel protection at the book-ends of the kernel boot
> process: one prior to any memory allocation so that it can ensure pages
> get allocated in regions permissible for the Snapdragon chipset's
> performance constraints on EL2 write checks, and the second after the
> allocation of all boot-time kernel modules and BPF program loads, since
> at that point I can check the allocated pages w.r.t. SHA256 hashes
> computed (considering holes for self-patching and static_keys) at build
> time using the .ko files, only because I am paranoid someone will
> circumvent the existing verified boot routines.
>
> As mentioned, I will work with Motorola see if I can figure out a
> permissive license for the EL2 components for this part, especially
> considering I have seen ... questionable promises ... regarding this
> subject in my research and a apparent lack of acknowledgement of issues
> like dynamic datastructures and seccomp filters from others (not Google)
> promising hypervisor-enforced code integrity. Thankfully, due to GPL-2.0
> the EL1 drivers will be open source. I will share them once they are
> ready with testcases of existing exploits for page table modification,
> code page modification, system control register modification, kworker
> queue manipulation, BPF page manipulation, like the below:
>
> #define MODIFY_KERNEL_CODE                                               =
      \
>         do {                                                             =
      \
>                 fake_je =3D (struct jump_entry *)kallsyms_lookup_name_ind=
(       \
>                         "spectre_bhb_state");                            =
      \
>                 attack_addr =3D kallsyms_lookup_name_ind("udp_recvmsg"); =
        \
>                 if (register_kprobe(&kp2)) {                             =
      \
>                         return -1;                                       =
      \
>                 }                                                        =
      \
>                 arch_jump_label_transform =3D                            =
        \
>                         (arch_jump_label_transform_t)kp2.addr;           =
      \
>                 fake_je->code =3D attack_addr - (unsigned long)&(fake_je-=
>code); \
>                 fake_je->target =3D stext - (unsigned long)&(fake_je->tar=
get);   \
>                 arch_jump_label_transform(fake_je, JUMP_LABEL_JMP);      =
      \
>                 return 0;                                                =
      \
>         } while (0)

That's not valid cBPF

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

