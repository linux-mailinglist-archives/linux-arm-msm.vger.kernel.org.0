Return-Path: <linux-arm-msm+bounces-85414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049ECC54FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 23:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E482E301503A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 22:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C38335565;
	Tue, 16 Dec 2025 22:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJ6g1u7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50262FFDE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765923203; cv=pass; b=hl+/jDGR/rUlx57dPPu/5ISMchPtUomL5fsMy/BqYidMjBMXrd5f/2JS5mDY5H3RhUnkwcZZoQdjfLuD8Ga8zXHfDSQVK0xA75XSmv9koAarv/xIoNEv1zpshDRVqTxMsY+qV3M50pSHSfEIHCeyiD8CUsgVXBrc+jNSqNcgtQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765923203; c=relaxed/simple;
	bh=cUEvUc3ZDuZl4rJT8RFG19fp3585V0q8p2wmfh2OT/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ldd0O2fOJ5BByGpTttkEhfmXk/HZtpoxWXVMoAnsqr7WhwoaIEN6tlzrAoHAKuklqcTQq697Y+VawqgXhlUpIhJ/tMcJieUO3p500FkpcSjp6INAFRcLS2UKfHzMRy1I5ioxMRo1hsOyWvaB7FksevRRVgJ2ERtEvzeMnQOlm7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJ6g1u7k; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64175f78a6fso3609a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765923200; cv=none;
        d=google.com; s=arc-20240605;
        b=aQjTAoz+ztLyNf5sZ+bfGzbRM3uiYWJlt+tAmKpJISTDc60fZoSOF+WBSjitonx0g1
         Os2aU4dRjlYC9xdUzwIAie159u8ilFacbCo4xyEd1EXZewv/LvfKlvtLLBSffAt6JYAu
         eIn+vObkHVkbLJE7whHkrW9i6gfeQz4TqnXEBu1kd29BbS1g7Pm5ZFYy2/JFZPLPWgW7
         RG7MC6jCeCSayhuXxQ32R6uVYQS7QhwNt4S4E9pqZp/eau4I+BdAZzvTiWma0gMxes4K
         pJ4fjHVrriSE7ABukPRsjFvBeElvD4MKS0jok8vIm3neQ6y8pDWQNEKV8r+Mtbkdmf8c
         CmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cUEvUc3ZDuZl4rJT8RFG19fp3585V0q8p2wmfh2OT/Y=;
        fh=Q09k5K7s6MNAjy2AGnIKzTsi1rVRGp28a3s5wDVgwEs=;
        b=KVk96Pvuc5TOqHFWTd3WisdPLpQ4D0zvSAHBID2e/W5GexcX5F3WBGY2udmPJSh+c4
         DeJwzqnTBeURI2yFOBhQZGIqMRzqvtlMUMjM6qNabWHEzxvs0A7GMod6GjTtgMAH88Ik
         EJLL5WZmo8L9tVaDPkVTA57nKG/j8WD7oElC8+NBTUDgWxtD8uqTpKcqP7sAUoaSuGuD
         CcPL4eJnPzTEZPubEb5CwYlKGQ8Sg2K+qQJtuI0ktF5AFezlbln7wDF03JF00SS7DbNm
         9wVHLGsZPQyBzOT7jWIHpJc8QZWkFeRsHiPKRlKDRTVh8+3dsdWoWARVrRtxvquXGK9W
         3X9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765923200; x=1766528000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUEvUc3ZDuZl4rJT8RFG19fp3585V0q8p2wmfh2OT/Y=;
        b=oJ6g1u7kGDOWXi3y1xpf1hgeShhTI07WyUZYNWsZc/EXvAt8dpA2QjJn0vCsUvFQyX
         jKWKz7aGj9OvwBQFs4WFXyYNQ57gG4A0MnZ3zlgb1FOq2pf0E0IP9flxIUswnHRivFK5
         Pr5foEtMNmLjJQw+QJGQbJWLyFbBRjNdWTcQaB/WwhGuJwkHOLwfGaVT/hmJ2AHwGTul
         6+ngjayF0TRbJWukM5MdFFmFLgUa2ohmRX46OI/MibW9gJH2Bypr0vI+oad0IlrpcVJF
         gI+OeoNS3lPIebWC4eYTtT25CP/mg3BzQ+VwFFQHN4PbhYh8ZM4Z5dWoIz2dw5+/ysuk
         DFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765923200; x=1766528000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUEvUc3ZDuZl4rJT8RFG19fp3585V0q8p2wmfh2OT/Y=;
        b=Crz9as4m7bnDaUyIWxSMlYyw8mY0T+C67a/VSUUI9wpiwBBSWNPKf02qnlG1YrdKWR
         iB6nCVEb6kBed1kuYisie2ZjNg8DJgsRRu6pgNqdiEDZDVSuyR4diWZXJxQXW4/Evlfo
         FnOPcocJnySpvOWY6jt2d+h35u7M8p7QZoQfJkFIfWi9v0ofj8y/ZD4ME9MUYKiqhrHU
         /Lin3Y5FMUeilbsUxkilMhP/Gm4qiC5lBi2ACiQuWbqZLPgI6rBcyfn4iSwBOzmJdvAu
         v4rxxdqFGvzqOtcGW3Ap8Px7oIrk3ayfC9QsmPylIlRT6vlMeA3ADJ9BPElKrSexOPeL
         jmfw==
X-Forwarded-Encrypted: i=1; AJvYcCX5YsbreuJskxND8LVybuTASTTeXn8FPUDBiUGAVJ+Bn1201KPwkc8Jmvo+kArzkxD3bT1GPV7Px2loDfLm@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkScUUtp4ynEe4dKIVymclCF9ONjYxkGexr1FTyXp08YL0Ltk
	svQM/vmVH6p55RE37h6sa6NdquurBfop7Y1pelM1kH4y7DDPDJ7ZsSd1gxME+/jxsE+vaZacSxN
	3ehcf2Kp/dBqMdH4FcFdkbL0GkjFaZk8UcEYyEvZq
X-Gm-Gg: AY/fxX5YKZ9H28kjMfA5fvSmIzwStB2IRqhk9mzAsxoUWb+VvmYrWV40ufsXtBfb6XN
	OTdrbzZOm7kap5AhdzV3AgJXB5tv4Vo4JE/uW1xxCBjr8j7XzvjF0RmOBjhkV7f8lneJC8B97hx
	uXFef25UhV6/m/YYE4hhWNLc2429kb97j3ygrmzK46G/Gg94hWaGX0pU4dNmp+OOq90/1mmTwOa
	J7HJFI9Ofh9crSG1HeZeGbSmGvmW3fBDU+Im+4MKVzEsg+1b4FeUwB+oIJhjAIubd0imrzWhZjC
	C5K4tNp4fh5ZDkCoGQ7ox+B0+CkE/5UWPTfa
X-Google-Smtp-Source: AGHT+IG/FmFNWV3Omwqz+JH1DeiH+PJe++/M1LPs79WvoTN0KK45J2x9HLQrCX+utdvzCFSre4q8kGjDsI/u79Lkg54=
X-Received: by 2002:a05:6402:4044:10b0:649:a572:e6e3 with SMTP id
 4fb4d7f45d1cf-64b40102f92mr18740a12.18.1765923200019; Tue, 16 Dec 2025
 14:13:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
 <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com> <ekngmao2rw4mktubhpodudnkfvx5of74uvlswr7csnyxcwlmo5@cb6jfgiyg4vc>
In-Reply-To: <ekngmao2rw4mktubhpodudnkfvx5of74uvlswr7csnyxcwlmo5@cb6jfgiyg4vc>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 14:13:08 -0800
X-Gm-Features: AQt7F2o5cn_So8YCGnXTSB4CvypEGtEAMNntJwp7-ilK1nVQ4cFEiPZ4NRVmqY4
Message-ID: <CAGSQo03+pVhjyfSLGHHcr=w1-3=C5AcEKJf-GbcEvfJ6NTid7g@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 1:53=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Dec 16, 2025 at 12:53:28PM -0800, Matthew Maurer wrote:
> > On Tue, Dec 16, 2025 at 12:49=E2=80=AFPM Bjorn Andersson <andersson@ker=
nel.org> wrote:
> > >
> > > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based Deb=
ugFS
> > > > bindings.
> > >
> > > Okay, but why?
> > >
> > > https://docs.kernel.org/process/submitting-patches.html#describe-your=
-changes
> > >
> > > [..]
> >
> > I'll move more of the text from the cover letter into the commit
> > message, but the short version is that it's intended to be a low-risk
> > driver to pilot vendor drivers in Android.
> >
>
> The answers I'm looking for isn't in your cover letter either. I want to
> know what benefits Rust provides in this particular case.
>

Rust likely does not provide any significant benefits for the socinfo
driver itself, aside from having caught the slight disconnect
(mentioned on the other thread) where it should probably be an
auxiliary device because it assumes that the `qcom-smem` device will
remain active as long as it does.

The primary intention of converting this driver is to be a low risk
trial for GKI's ABI stability for vendor modules and a first Rust
vendor module (we have platform modules already for binder and ashmem)
on Android. This was discussed informally with Trilok (a long time
ago) to act as an example for other vendor drivers and encourage usage
of Rust for new drivers or those where memory safety has been a
problem in the past, but nothing was ever formally committed to.
Trying to apply Rust to more significant existing modules (where it
would provide a greater benefit) raises concern about whether they
will operate identically. Socinfo in particular can be more thoroughly
tested for equivalency, as aside from the runtime DSP information
modification that was mentioned in this discussion, the output of the
socinfo driver is static and can just be checked. This means that a
socinfo driver swap will essentially have the language change be the
*only* significant thing about the change, keeping the risk to a
minimum.

Part of the reason for the RFC prefix on this patch is to solicit your
feedback on whether you are open to this. If you have somewhere else
you'd prefer we try this, I'd be open to that as well.

> > >
> > > > ---
> > > > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > > > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > > > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> > > > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> > > > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> > > > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> > > > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> > > > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > > > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> > > > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> > > > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f
> > >
> > > So, it doesn't work on a clean v6.19-rc1 tree?
> >
> > Correct. Those other patchsets are patchsets I'm landing which add
> > bindings used in this one.
> >
>
> Okay, please make that explicit when submitting patches, so that the
> maintainers know that your patch(es) can't be merged.

I thought that was what I had done by using the combination of "RFC"
and putting the prerequisite change IDs from b4, but I will include a
statement to that effect in my cover letter in the future.

>
> Regards,
> Bjorn
>
> > >
> > > Regards,
> > > Bjorn
> > >
> > > >
> > > > Best regards,
> > > > --
> > > > Matthew Maurer <mmaurer@google.com>
> > > >

