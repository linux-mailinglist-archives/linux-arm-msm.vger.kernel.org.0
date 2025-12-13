Return-Path: <linux-arm-msm+bounces-85158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4500CBB1CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 18:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B571C3049B3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 17:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51952DAFA8;
	Sat, 13 Dec 2025 17:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1j8UIb1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F61C84CB
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645737; cv=pass; b=JRw+i4NiWH0HYiawNtA5ut6JF+zA/I49BltY8DQC9ni7mjjIIyJVQmQ/uYXcJE09XpdYTmte8glGbL1C1c8NOjgB4qARdY0Tw2yeDfKne6kbsFMh7cX1O565GeRLrRPLEtrmlzY2V65n5jZ7tYu5mxk2+zjfm+MfG6phhRoKHAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645737; c=relaxed/simple;
	bh=t9JIb8QO135EY6M46vjmO0ixlchRQbC1rgVIQHJnezk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAPTakeU6NyIN7uxHgVf452bomRLZ+ridc8xyHX9cVZDmUVmodribYUzWM25LIVWu8SfsfbFkGxsWaQ8lK/jIfMc0bTakNuAj5isrWsvKpp3SvKw2NUOWxKDzPAl17Q6aX3hAvimwMC8NqHk4fkj8s7ltIpcc+jgm05DbfMV9eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1j8UIb1a; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso28996a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765645734; cv=none;
        d=google.com; s=arc-20240605;
        b=i8Cy5CUay/93Rnad3VWeU8yoTdGO0D3ER9eS3hG5vULWvFkuDPoVNxfbm8cf8N9auP
         xnM5HrUPkJ55XAF1RhZKQuTPCn+WMRydTK9yVjc8NzDB/k1k538DBoge5ijmXmXCQ1ZC
         1+Mi1TcxkruEQ/Qay/y4z9JvzmhKB0sFvQzvXCpQKakeCw6bmiy80b8C2sd1zy8zkbaA
         5SEaND21bxGZpXvEH+yScDHEJc1VBp0BPxe/Hsx7CcO6TuttwTj4ekM53n5PV/fiKCBe
         5TmZDvMduNvjMlprn8YD7+T3hAkGk6CbFEKlwsjSZDF0yGRdOkaFR+7gMGBFJzgTefxB
         xh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PR6IrNem4+1GT63TbNNE6XIVgBmCZ50K2RrZ5zPf7Tg=;
        fh=kVe9ManWTi/YqbdFnFQUjUikOUEbR1IcgNxFw7t65g0=;
        b=Xqa0ePXRbUZlfcvzC+sYI8oUd6Jbb8h0ELxwOzXcOfYgwUXFzJxicJJPS2BGexdZ1t
         7gfURUH7zsAfcme583fnkoqB2sVQ8cOMYpmcJ4bksZOyeutnkLuFK3V82EDHtORxIyie
         v4d4dZbMHhWBwtUPtUnVATGAflpO9seFRjyNdMBQ50v+3ps35F5V1b5w9rRCLWjTi9Sg
         EKnNBD5JPXstOaCV0ukqZKOVpVr3i6fokV2VWSBtx3msFo06Q0NlIb9HLNmY4bbis56a
         /KTHprjAv6tbY/17R0Wp1CAtZS2c49K2fQ8hkKa9PytzxB1j0SLM2mV55EjVgrsRS2zp
         UBgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765645734; x=1766250534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR6IrNem4+1GT63TbNNE6XIVgBmCZ50K2RrZ5zPf7Tg=;
        b=1j8UIb1aQ3IMGr0l0Q7aUZ+2F4J2M6Aj1lfSpgRMn0bviucOYJMRrhjyB8h7/1uPIx
         Qwdub/Nfskx9Ec9dG9rAv68KV9SGYxqdeKJ26AkP8sB4KdmJNzscp38zPotcOzl8Qspg
         4fLzZi5LrqD/6pJ1E8AIGVRVQmSQcNEUTA5AVH30jHtVeeLpnJ1/0zRLUp3arsUKvGOl
         00k6slLaeLMQfuwCJn771MuG7dluGkZ2JmIeKY9zwKP0QfbAK3w1LgsUJCa+yjJAub/3
         LsgfI1GraUx2HAY3yObz8+DLS/spfdWTbC6w6r6uMHapmvDyrSbiyR8z04A4uvBIOphp
         cZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765645734; x=1766250534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PR6IrNem4+1GT63TbNNE6XIVgBmCZ50K2RrZ5zPf7Tg=;
        b=r49fKUN/vp4pQtGAZqubBU7DdCqWoYrVmaj71AHZ7jvgQCxURLriR/drLUFBSKdu4f
         +0tTlmu9vKpqcyMbWJISX+0+BtzjvRB7ijnDpndpbCLcnv1kpGYyB70Ep3xwjkck2l03
         tyKSFtlhgov2JOsPf0VeA+yaFq40rLsuCnzE9jRA3UkxL9FggVO6fJGXDC/JQHi13wqf
         B6sU/cvxHO5do4hyOjD/N3o2s5/FZ0cLFKtsThWn2FGFGfrGbHTrRV9i9V7+ljZDcrSe
         XpVmq6SU3oKKB2JlNi1MF173YPEYJx1YDTRXbxr88yJHBciWfGlVsjVVIK8YGvXzD6KV
         1nuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOcYDuxJc6qAtnSTnjvBEPyQnwvn79XpuoB8y1S6Zghci1U+aX1/KkxoLU+xNNPXUWg7m9LdI0wUqyEB63@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82NheHRzpGS821XkYa842FRCTEV64shvQgd1D2wctlYvJpgNp
	qzpFGJMmqqnqrqTrC84ZO1x9EOgvePPW0KoXg/l2w6t08CsJUdMnAgyiY4zf35bVPNfGxm7ubDP
	lkwuMCTkgiVVwnbyhLkTDeY+Zb7/R5Bj15iqz+Dpt
X-Gm-Gg: AY/fxX5JrAIKjho66Zsypw00yzeqRMLnStIF5rMhHq/cQINWg7leLu6rJMzwesuUAmr
	/XNqrom6KebkTJoWD1b8J62WG1MC0Lf3dyvUjDKbvPADJD1ZwnoCpkAXugwbQJItqenBrF+0q9F
	5tAjxOm0aN3j5mvLqInkRgAaqAQfjkZRUJHnREhZXQeSsdUKjzN7hNBEcb+Mx5wwJZUxRdKtCoC
	/8/VPmzscN8ECjn7K5Dh816MT6FxTi8uG9RI0NelCS0IP7Tnnqxxvg9HS7F55hKqj7R5VRtMe3W
	f2veu5j4kVdI3D0w8o5D9DYTkLqV
X-Google-Smtp-Source: AGHT+IFRpFp1ArfchM3fI2xzUyKVKtpZwa7VqhYBXnP4tk1+gimkbuC910Uk2M+v5nxqKnd9Zh6AYAxMvH4zJbJzwYk=
X-Received: by 2002:a05:6402:4546:b0:643:6975:537f with SMTP id
 4fb4d7f45d1cf-649b08ea5c1mr44819a12.13.1765645734148; Sat, 13 Dec 2025
 09:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh> <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
In-Reply-To: <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 09:08:42 -0800
X-Gm-Features: AQt7F2rqSGpO1-alELZxkgJyqvorGcv7dwi7ALlvc2OyFXBCFXBTYmlRhepfD-E
Message-ID: <CAGSQo02gw0hB8gBYTpEmkaa9GfDHQ82-J6q+ksBb29zukkDeFg@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 8:24=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > Shouldn't this all just be in 1 .rs file?  By not doing that, you have =
a
> > number of public symbols (that are very generic), that will "pollute"

One other comment - unless you see `#[no_mangle]` on a Rust symbol,
don't worry about the symbol name being generic. The regular symbols
are all mangled with their path and some Rust compiler info, so for
example, `SOC_IDS` is actually a mangled variant of
`socinfo::data::SOC_IDS`.

> > the global namespace of the kernel symbol table (unless rust does this
> > somehow differently?)
>
> Rust produces one compilation unit per "crate". In this case,
> `socinfo` is the crate, and the other files are included as "modules".
> Symbols defined in them are not public unless annotated with `pub`.
> `pub(crate)` makes them only exported within the scope of the crate,
> i.e. inside the single produced `.o` file.

Slight further clarification - putting them in a separate file doesn't
affect visibility in the final `.o` file that's produced, but it is
technically possible for functions or data which are not public at the
language level to be public at the object level, usually due to
polymorphism. Additionally, an item being `pub` in a module doesn't
necessarily get exported at the language level unless the module
declaration itself is `pub` or the parent module re-exports it
explicitly through `pub use`.

>
> > But putting this all in 1 file should solve all of that, and remove all
> > global symbols.  Especially for just a small and simple driver like
> > this, no need to split it up at all.
>
> I'm willing to put it all in one file if that's preferred for
> organizational purposes, but as explained above, this shouldn't bloat
> the symbol count in Rust. If it were my own codebase this would be
> separate files, so up to y'all what level of granularity you'd prefer.
>
> >
> > thanks,
> >
> > greg k-h

