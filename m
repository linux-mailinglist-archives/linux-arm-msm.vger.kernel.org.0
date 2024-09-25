Return-Path: <linux-arm-msm+bounces-32510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B798662B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 20:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61E56B20F9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 18:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25542E646;
	Wed, 25 Sep 2024 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="pnTQ1Wyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A332040870
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727288175; cv=none; b=CCByfgaicMoAtY3XQmM5Gfl62vMeBPWHutiw2V1mB9M4reBKw98eXVZ1qjp0p8cpDgW0jAh/aSGe+BFBR7jDpVNBKyRPCwpct8BeGLnrPPzDRmXVUnwxPk4iD3YG1tuZAiE6gbGVztyfOV5ivXnq8Aa1SlCTtozkdSi9lyTkYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727288175; c=relaxed/simple;
	bh=4DcvhFYfT2AE81dZjObAZ3BxCK094YtvdQFRaxTL0EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0hJyu+Ku4L1h8Tqxg5OA9vJtGWiIc2WpF1InFg6zP45kd58HEzjc89pgtcFeyWnb0FFbdgznib21ikmqY6j4pB4lS1YHZZe0GBbpUTJjlo5I/mcuNEFYTB1zlN2ok8kBp/b80K/1P+daF/KRZ9/UlIakW+dR5xvlFE8Sl7Qj88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=pnTQ1Wyo; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8d24f98215so19360266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1727288172; x=1727892972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpuLG24ZCGv71UbThjxre5Spo20qpnUmQzNaIPgoeOI=;
        b=pnTQ1Wyob0Gp2/5L9nIgdXjr9Gm196GLTUQJT01xNo1V7QEx6Hunk7rLxZLc98TR5a
         eZ29J1VNgUmpBRheIihoWpJ0zv79JZ2LQ6NMa7zounHp58JvuTChAHuJ7j/6IyeDyjGQ
         efj8U90WJfoNRa7EgilmggB3qg/JCT6PNWyCxJNG2+P9ITghiYJVJEHE7MtOuXMMVRBs
         xNhhwlr5/uHGnOKM/a+qMNcn97BYq6MC1iNjReDwyFrLLmvnvW4knEyHz/+wWlH1cIbp
         pwDXimjArkPaxXGSbu4tmm/TVtlK9sU3HniBote0B+gB0R/49o01C87PZ9k0ISjHjof4
         gZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727288172; x=1727892972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpuLG24ZCGv71UbThjxre5Spo20qpnUmQzNaIPgoeOI=;
        b=hFje1gtw7y460JNbEm9yZhQRQQLwx1mpmIzHZFQMpu6Dy04Ik1N9G3Q7BpH2NkCgc9
         aerhTDNbnFoeeemoFI1ndrdwmCcQNGLz7XsiErnzpkgve4NnCJMNIwU+rkr9iiLaiwKA
         wH85iOodOGVaIQSIYJrOCWoHrVU4sLVGKnE7QKlpdDMjsgE/SJHGO/l7XdCTxHn/KqiC
         M/HgH+HLEXSEL+kfxZjn36KegWsWsmqLvElWXcMiBTnHaaQVamcmAzWANeDfs6DEw/W1
         k9ez5U7M9eiDzv0XOwX0mumOC55PmBh1PKSGx7Mb0jBgpXNmJAJMuj7kYqodmamC2ahu
         xONQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEX9GJwYYlB8Xz2egwLb3jn9EmJsG8c3Fea/MWpKaUZbM52eHNrIYir4vvrJT+fPlsz7XPk80+2g6p/wiF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0m0TDbFpwT7FHXUx8GL7h0BGPDlHQbTodD+YuC4digi7VL9dm
	Nz6nYjd1Hc6e3iN7ZpIQV3TL6OsAtOsRCeJjkYYwIEmtPMNTr21DBZUf6MW8pt6UQEoRQBsJ/1y
	MbTnqM+089nIrlyr02M+qSrV9fcEqfLZiWXOg
X-Google-Smtp-Source: AGHT+IGIbjo1SJjR+7nUhJeyZNp9sE3nHGpQKuQ3ToGu0SkOxQeMaHhqobWVR8j7UEcM2RJRbNO3IlCvWJG+o3B6Xu0=
X-Received: by 2002:a17:907:60c9:b0:a86:43c0:4270 with SMTP id
 a640c23a62f3a-a93a0343450mr391948866b.13.1727288171687; Wed, 25 Sep 2024
 11:16:11 -0700 (PDT)
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
 <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com> <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj>
In-Reply-To: <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 25 Sep 2024 11:16:00 -0700
Message-ID: <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com>
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

On Tue, Sep 17, 2024 at 8:08=E2=80=AFAM Maxwell Bland <mbland@motorola.com>=
 wrote:
>
> On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> > On Fri, Sep 13, 2024 at 10:30=E2=80=AFAM Maxwell Bland <mbland@motorola=
.com> wrote:
> > > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> > >
> > > But don't let me distract from the issue, which is that
> > > cBPF/eBPF/however these filters get allocated to machine code,
> > > bpf_int_jit_compile ends up getting called and a new
> > > privileged-executable page gets allocated without compile-time
> > > provenance (at least, without reverse engineering) for where that cod=
e
> > > came from.
> >
> > But what if there was a mechanism to *cryptographically hash* a BPF
> > program as part of the loading process?  Then that hash could be
> > looked up in a list, and a decision could be made based on the result?
> >  Would this help solve any problems?
>
> The issue I have seen in the prior Qualys linked exploit from my initial
> message and from talks by security researchers elsewhere, for example
> Google Project Zero's recent "Analyzing a Modern In-the-wild Android
> Exploit" by Seth Jenkins, is that people have the ability to target
> these pages during the window between the page being allocated as
> writable by vmalloc.c and the update to the PTE which makes it
> executable, so a signature does help (creates the requirement of more
> than one write to commit "forgery"), but doesn't totally 100% solve the
> problem.
>
> Right now, every time I open up chrome on our latest flagship the
> browsers sandbox filters trigger my EL2 monitor because they are
> attempting to follow the standard W^X protocol. If I were to build one
> of these exploits, I'd:
>
> (1) find out a non-crashing leak for code page and data values
> (2) determine from vmalloc's rb-tree where the next one-page allocation
>     is likely to occur
> (3) prime my write gadget for an offset into that page
> (4) spin up chrome in a second thread
> (5) attempt to trigger a write (or two) at the right precise time using
>     prior empirical measurement or my read gadget for kernel mem
>
> Which is messy, but people have been known to do more given good enough
> stakes. Hell, I spent a few months working on something similar for
> airplane communication management units.

My vague proposal for a "better JIT API" (which you quoted below)
explicitly and completely solves this problem:

>
> > So what would a good solution look like?  It seem to me that the
> > program being supervised (a userspace or kernel JIT) could generate
> > some kind of data structure along these lines:
> >
> > - machine code to be materialized
> >
> > - address and length at which to materialize it (probably
> > page-aligned, but maybe not)
> >
> > - an "origin" of this code (perhaps a file handle?) -- I'm not 100%
> > sure this is useful
> >
> > - a "justification" for the code.  This could be something like "Hey,
> > this is JITted from cBPF for seccomp, and here's the cBPF".

Even ignoring the origin and justification parts, there's no WX window
in here.  The code is generated, then it's shipped off to the
hypervisor/supervisor, and *exactly that code* is materialized !W, X.

Of course, this still leaves verification to be handled.

> Returning to the idea of origins, at the end of the work day yesterday I
> queried Maciej to "have Android choose one compiler for seccomp policies
> to BPF and stick with it", because if I knew filters were chosen by
> libminijail or some other userspace system, I could pretty easily figure
> out what EL2 needs to expect at runtime. An "origin" field would be
> equally as effective, and retain flexibility.

At the risk of a silly suggestion, what if the entire JIT compiler and
verifier (or a sufficient portion) were, itself, a WASM (or similar)
program, signed or whatever, and shipped off to the hypervisor?  The
hypervisor could run it (in whatever sandbox it likes -- hypervisors
are capable of spawning a separate VM to host it if needed), and only
then accept the output.

I, personally, think that this is of extremely dubious value unless
it's paired with a control flow integrity system.  But maybe it could
be!  Something like x86 IBT would be a start, and FineIBT would be
better, as would an ARM equivalent.

--Andy

