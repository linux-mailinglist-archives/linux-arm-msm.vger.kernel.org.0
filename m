Return-Path: <linux-arm-msm+bounces-32771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F328D98A0A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6030BB2841E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 11:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C73A1537D7;
	Mon, 30 Sep 2024 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mb2Ijax+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5498018D627
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695349; cv=none; b=cvvhgn+L3eMg4lVWv32O9Pj9qphWQNN/BkAvWBV8Y6K61nQQdFeVL2gURgMb2a2IguPAU8eqh/zT28FMJkzBOBPVNREeOvi5YnFxxnmLpSBEtfvN4kR+KTcYs7x1+JzAd83RFXbv7vUnS3Bnbct6CltbkZOOwjC+mHLQXR1fZv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695349; c=relaxed/simple;
	bh=CEZ7lrD9QDD0CTqnMfiFWNPXmEyiP8b5n+eT0zXVoww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWKUP5nbBLDP/I5Nxn0n/1SvbodTkmKeJ5yF++7S0AJ073WT0VfI0hIsrC9hQDwJp1UJIBvUZXv9icTyjSyk8bp2gZ4F/4AaZ2QHdjmicmRnvEjoe41qkgEB8v+WT8RqRSuG1FszXqmq+Owf0T3nFpgGfGM7nDHWNcXBPCf8IWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mb2Ijax+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cae4ead5bso191155e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727695345; x=1728300145; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7kaIJvpdVmrr4S9yfM1yX5sV3pFEiW9uLSq1xVmx9AM=;
        b=mb2Ijax+McXisnwJFqzKxtvOSGdjuB9JfkV2fqvxdovvs9rDKBuW4TZ+vM1HAHfcR0
         peKs4MzuIGzOLEV3TYZ8VQmwmCkmFSRIhEfCklAcWGMmDPM89nt0a8B2z5Ac43wJfI8O
         b2XM5ajMOrtwvRlvuN8ZTsO4+HPxleAt/9pW/41yn3M+1omgDatF484EqkC7uBaMeFdE
         YQM77O9kUwV1SIlMGJWo2UkCMQzaN7uzTLiseGTqEpBPTP4vcvbdlRuMF2OoxcDCD4t9
         doO24eIj1APZYI78pwxfMg0/BlT1CbRpExH/XzZpu1hQ2ksTr4jblYuU6P2I9S51Yz4V
         bT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727695345; x=1728300145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kaIJvpdVmrr4S9yfM1yX5sV3pFEiW9uLSq1xVmx9AM=;
        b=ldp4mUcGjiuimZ0xjkV1V4W5gPuK7+RHROXYApoyTkHYtBouw+ybLFI+OJm2/3O+bj
         /0J6PTaQfqK7XmJzxKJtJoq6m9UEC5USqEpXMHP8XrSLEbE5htV/2ZZ/gtexYUe68q91
         Ug/sUgab79dO3yJ1/K8fVW7PuixrmR4CnQGBzQf/VUSyfdx2JdpcBGLU67/5FXSno9fK
         ORu0u1+FHEsADhOciWzHAe8Z2VI2vKJWXhsG/PNGSMuf3heAoo8a40Nw9NHAwUpwu6kQ
         bmtKWu90fyrTUwHkkICafleFKzsU9P9kj9I3ZW8HCtXv4VjYJhS9pVbywyCtQGkpU8Lx
         jIXw==
X-Forwarded-Encrypted: i=1; AJvYcCUhHXB8ZZl/HgF24zup5+Ac9dVxiVjenaZocqOosFvmbjasUA7oGYThE97KT11hW7MJFrnZ3hqDqQTWWvEp@vger.kernel.org
X-Gm-Message-State: AOJu0Yygp2jrJeft7Rbm0T/tcvkLXhV30CeR0yn/APFKOEn+ehynpspk
	kbXYiquflpVSkpMHhMmhjjQoksBgQoSxF7VJS2qLz+ApL9cioOeypeF0M0fy8g==
X-Google-Smtp-Source: AGHT+IEp69jsgiv4QRIMDpN+o0lZgSlFolBWYYA0mWvyeYVee3fRAA+hdDfSg3+bh5dojn9kPKDMVw==
X-Received: by 2002:a05:600c:c15:b0:42c:acba:2011 with SMTP id 5b1f17b1804b1-42f6cdccaa4mr1760485e9.1.1727695345419;
        Mon, 30 Sep 2024 04:22:25 -0700 (PDT)
Received: from google.com (93.20.140.34.bc.googleusercontent.com. [34.140.20.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e767sm8854028f8f.38.2024.09.30.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 04:22:24 -0700 (PDT)
Date: Mon, 30 Sep 2024 11:22:22 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Maxwell Bland <mbland@motorola.com>,
	Neill Kapron <nkapron@google.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	Andrew Wheeler <awheeler@motorola.com>,
	Sammy BS2 Que <quebs2@motorola.com>, Todd Kjos <tkjos@google.com>,
	Viktor Martensson <vmartensson@google.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	kernel-team <kernel-team@android.com>, adelva@google.com,
	jeffv@google.com
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <ZvqJ7rAc_pRUdW3b@google.com>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com>
 <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <3zxgxxa75znxfvoufhtg3wm2vamjthogyacoybiket5js3kquf@yldiyczms4ou>
 <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com>
 <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj>
 <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com>
 <CANP3RGcYSEd5h_2mV+EAB_ohCKe7zaf-82UotN40wq3K4V5OtQ@mail.gmail.com>
 <CANP3RGceK4sxfk7YP-petxY+dmpD+SVCM9Eb79Fc0u1EwFAVVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANP3RGceK4sxfk7YP-petxY+dmpD+SVCM9Eb79Fc0u1EwFAVVw@mail.gmail.com>

On Wed, Sep 25, 2024 at 12:53:11PM -0700, 'Maciej Żenczykowski' via kernel-team wrote:
> On Wed, Sep 25, 2024 at 12:52 PM Maciej Żenczykowski <maze@google.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 11:16 AM Andy Lutomirski <luto@amacapital.net> wrote:
> > >
> > > On Tue, Sep 17, 2024 at 8:08 AM Maxwell Bland <mbland@motorola.com> wrote:
> > > >
> > > > On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> > > > > On Fri, Sep 13, 2024 at 10:30 AM Maxwell Bland <mbland@motorola.com> wrote:
> > > > > > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> > > > > >
> > > > > > But don't let me distract from the issue, which is that
> > > > > > cBPF/eBPF/however these filters get allocated to machine code,
> > > > > > bpf_int_jit_compile ends up getting called and a new
> > > > > > privileged-executable page gets allocated without compile-time
> > > > > > provenance (at least, without reverse engineering) for where that code
> > > > > > came from.
> > > > >
> > > > > But what if there was a mechanism to *cryptographically hash* a BPF
> > > > > program as part of the loading process?  Then that hash could be
> > > > > looked up in a list, and a decision could be made based on the result?
> > > > >  Would this help solve any problems?
> > > >
> > > > The issue I have seen in the prior Qualys linked exploit from my initial
> > > > message and from talks by security researchers elsewhere, for example
> > > > Google Project Zero's recent "Analyzing a Modern In-the-wild Android
> > > > Exploit" by Seth Jenkins, is that people have the ability to target
> > > > these pages during the window between the page being allocated as
> > > > writable by vmalloc.c and the update to the PTE which makes it
> > > > executable, so a signature does help (creates the requirement of more
> > > > than one write to commit "forgery"), but doesn't totally 100% solve the
> > > > problem.
> > > >
> > > > Right now, every time I open up chrome on our latest flagship the
> > > > browsers sandbox filters trigger my EL2 monitor because they are
> > > > attempting to follow the standard W^X protocol. If I were to build one
> > > > of these exploits, I'd:
> > > >
> > > > (1) find out a non-crashing leak for code page and data values
> > > > (2) determine from vmalloc's rb-tree where the next one-page allocation
> > > >     is likely to occur
> > > > (3) prime my write gadget for an offset into that page
> > > > (4) spin up chrome in a second thread
> > > > (5) attempt to trigger a write (or two) at the right precise time using
> > > >     prior empirical measurement or my read gadget for kernel mem
> > > >
> > > > Which is messy, but people have been known to do more given good enough
> > > > stakes. Hell, I spent a few months working on something similar for
> > > > airplane communication management units.
> > >
> > > My vague proposal for a "better JIT API" (which you quoted below)
> > > explicitly and completely solves this problem:
> > >
> > > >
> > > > > So what would a good solution look like?  It seem to me that the
> > > > > program being supervised (a userspace or kernel JIT) could generate
> > > > > some kind of data structure along these lines:
> > > > >
> > > > > - machine code to be materialized
> > > > >
> > > > > - address and length at which to materialize it (probably
> > > > > page-aligned, but maybe not)
> > > > >
> > > > > - an "origin" of this code (perhaps a file handle?) -- I'm not 100%
> > > > > sure this is useful
> > > > >
> > > > > - a "justification" for the code.  This could be something like "Hey,
> > > > > this is JITted from cBPF for seccomp, and here's the cBPF".
> > >
> > > Even ignoring the origin and justification parts, there's no WX window
> > > in here.  The code is generated, then it's shipped off to the
> > > hypervisor/supervisor, and *exactly that code* is materialized !W, X.
> > >
> > > Of course, this still leaves verification to be handled.
> > >
> > > > Returning to the idea of origins, at the end of the work day yesterday I
> > > > queried Maciej to "have Android choose one compiler for seccomp policies
> > > > to BPF and stick with it", because if I knew filters were chosen by
> > > > libminijail or some other userspace system, I could pretty easily figure
> > > > out what EL2 needs to expect at runtime. An "origin" field would be
> > > > equally as effective, and retain flexibility.
> > >
> > > At the risk of a silly suggestion, what if the entire JIT compiler and
> > > verifier (or a sufficient portion) were, itself, a WASM (or similar)
> > > program, signed or whatever, and shipped off to the hypervisor?  The
> > > hypervisor could run it (in whatever sandbox it likes -- hypervisors
> > > are capable of spawning a separate VM to host it if needed), and only
> > > then accept the output.
> > >
> > > I, personally, think that this is of extremely dubious value unless
> > > it's paired with a control flow integrity system.  But maybe it could
> > > be!  Something like x86 IBT would be a start, and FineIBT would be
> > > better, as would an ARM equivalent.
> > >
> > > --Andy
> >

Hi,

In response to your previous message (this is Seb from pKVM team):


> > I've heard rumours (probably read some LWN article perhaps
> > https://lwn.net/Articles/836693/ ) that protected kvm for Android has
> > some mechanism to start the kernel in some higher priv level (EL2?),
> > then move most of it to EL1 while keeping a protected VPN shim in EL2.
> 
> s/VPN/KVM/

Yes we do initialize the pKVM hypervisor at EL2 fairly early at
device_initcall_sync (initcall 5) before we depriviledge the rest of the
kernel at EL1.

> 
> >
> > Perhaps the answer is to leave the bpf verifier + jit compiler in EL2?
> 

What are the gains to move this at EL2 ? I am a bit late to this party.
We don't have any init at that stage because it is too early. We do
support some EL2 vendor modules loading from a ramdisk but this is a
different story. 

> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

Thanks,
Seb

