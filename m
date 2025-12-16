Return-Path: <linux-arm-msm+bounces-85415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A92CC55CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 23:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAAC3300C6F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 22:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5000B33F368;
	Tue, 16 Dec 2025 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3G8Y0ntc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6AA322B62
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 22:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765924373; cv=pass; b=W1wtciI247oVuXa+ctxup29CKX0CeJhRyhCh0IzEeXS6eYOmCLCb6Ttk1TQh3dD6RXMzy7OvWqG6a/YkirLoz/aNNdniKFY8+38eYT90qWiZ4IUH0pvvbQPfbaha/+rS01aBE4KXYTlvNMEam4cJBtfc9QccPPFSfHc/lPLuocc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765924373; c=relaxed/simple;
	bh=bpI3qgmct85d99Wdu8ysJv2aQrdBxKxtFJJfm0j7Fas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btnR/4kZC29FSZ8Of+5syeoiptwyIvtj1RHsm+YhhjUvgXkqihHRKWUNdd8G7vzClVPWfBSfziH7drkuG2rsjypnmyxKxT2LDDOhCbCTfWZL9mVaM8+k0zemRp9A7+e2ihZV4ejshpB6Rz9CVP/yIFG52rTjHZew0YjIlxtZFFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3G8Y0ntc; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64175f78a6fso3770a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:32:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765924370; cv=none;
        d=google.com; s=arc-20240605;
        b=fM2rLAN095WGY8gBGQWy06XM75uSoexCMvmfjHD71IkeTa/5fMMwevKRPd7QaD+6jb
         1Ty/QwXZXuqw+FC0oZ5/Rq3E0zQd39i3ZRQ2u7Aj5yBnmP7ObQr4n35Ps1YW/eJbAl8a
         BTfgh/nBzjVuYyTwkJ5zjSKzo8Lt48HDEQIqKqMuwCoLKpoDvXEcmfV+vZdCEcpHuMYD
         +A0ZicgzVKG6syzM4YUhdCXn1ZyHgH/OcF9kac4d99HmyytmwlswLIHMPOkIZ0LpQEU1
         krv+NLwF8oPVhHtg8j5XfRyTHyOxvy2aDulWOIh0NMoPiyo8x9xLTXZ6skvcmkLUj22z
         wryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/uRByAbRJbo58zgegW29bIt1a9CPOIK3a+qOu5T88E=;
        fh=DVG4jimYG78EKGTuL6udn9xGtkCH1PPAudWtsJIYePc=;
        b=U2xptMY5H90vKPO/5BVjZ5w0y4MUZtMOKSJ1hD+VsiPuBtpL48i8hfle1HzbYnTkjl
         3NBX6gCojt56v9m5VTY2NAUFXl6+bphFWMOH83YG/IXzuHENXpcDwhCZdaZ8WVA9190o
         OeLZ2NHatAUXepr0eojCFWNvIPmQybwfJD2NNCQvuL/xVCVlFKr0zxi4N3kp0K52hmvM
         6A7I6McXFr8lyWFXz99f7BoCyVL7CwLJ5cvGDzqSe24/UoQeRPieJuwzD732cr3A/YQ5
         gceQLcs5ZDY9H/79uHl/ZTZdS8/y7E0MBi15Tv1OtFLbbh+Y0pwXaMfs4Ue4fzRHfB80
         jCOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765924370; x=1766529170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/uRByAbRJbo58zgegW29bIt1a9CPOIK3a+qOu5T88E=;
        b=3G8Y0ntc89S11XNGwjl0tL6CoUWCmOZwkV9hh632nXInvKkngMf9yaxZxx70Pzd4JI
         3ueD3QdPhPQzKj+sMyazPs8+lGLm1qgAPt+6tA/RLoqcVmGcC9+i6PTy2mGT8zArELDr
         9HWTbnDOfNZWcgcx1Pphg+NPkxOIBhDEcexCpARbj7qt3SEdol3hquMA48C0XJ5hWW6F
         LumiRInZstQ598Z6vGL9KYd+g8cq92JjlzE852t4/rWiFgj0FKUv61P84KfWYyfAjBZN
         touSz/ZKRTLhqkcCrPdn4aw3C4wlU7GmSXBRHVyn2C0emHfgd9sQOdmbzPrFKG6Uanxm
         vbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765924370; x=1766529170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/uRByAbRJbo58zgegW29bIt1a9CPOIK3a+qOu5T88E=;
        b=v9E2GPveJQJbGNjviQ82MuLR29XKAC+/3yXJklaDLOs027vvTLgUYMFZ4P9JBoQGXX
         4prRqFRU6qRBE1V1dfhNC0us1RF1cnudAUnVeJhyj1wWCXbnadezbywIiwftyJz7y75g
         8DLe7tNYcLWfH8jpAsVLykXJmdNUUQY1koUUvN5cGmZ7BEp9n5g4OA9b7TcXmqggpcdC
         YmP/ZDH6nfPmQo9HE+9a17w0dOQ9F9VYV8YXd/w1NaEhUn7aIgYzgq7KnUcFZTi3lRqy
         Li/8RVXjx6nNXboK3mEBfe67KDkmT/2ViohQISTaocjCXgrCCTFC9nnn2nlecRRWKcPM
         5A6g==
X-Forwarded-Encrypted: i=1; AJvYcCWD+sun8HiQXhL2cK1bCOwhBLzHFY4Dm1qlK5f/l7QcGFXdHjclIklO2e2YjXPGQzqWTBL2fp2KFWJl1g97@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4UCq3B92MUAOskG25QaFzE7dCDmTOgbP435wPk2m1Q6ACq4M6
	tzV/QfWAQjHSmGqJ8gqojR16Oj8osRjpjebUw4kuD4gQyiA0ScAcdbsTjql2IqJ4b+W7YPO28a2
	pCvpGfIpDuxCGtyCbUeyG0ipa8IlWzhx9HnxNQRNm
X-Gm-Gg: AY/fxX4MEZ6CEuWe6gSXUExNEV8tfCJVXi6bIFQ0EA0XaaJdJ6GASVsiQwjyJ4MhHdp
	v+6vrh5lCm0I8+cmTE4BG10F9mRZcO73uCKaWNK5KG1Zc7sr9/2zkGwFGFc6SPrER/hpNyYi97B
	nS7ocftFItaTacTF/rmhBLd8T5KBrHepRIdXuZ4YhazuRMpwC1nEpVM1eegqO+IDANjNLrc4ywT
	ItlL8c3AwvMFqfGjONOnQ9a77zsp4YHgHOeCTQShfWU9fZI7QNX9RJqVAogLA0ZeRG6SJhnH4JQ
	T4cOyalCAel9g6UHSAFPilx6lw==
X-Google-Smtp-Source: AGHT+IGk+uzAq4KrDl4d6gp44pXmFrmRq7YrqGJeM6IUZ/xwN2/FNI9D5PEuR/uqGEmokbJ/ruk9yr3kVNSu4r9RbYE=
X-Received: by 2002:aa7:de93:0:b0:643:6984:ceea with SMTP id
 4fb4d7f45d1cf-64b420db90cmr3076a12.13.1765924369503; Tue, 16 Dec 2025
 14:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh> <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
 <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
 <CAGSQo02mx361GmTzCCiMyQZUfnsWCRTbvFpBX73W=PZnhJ0wcA@mail.gmail.com> <tbypgxb6ksoa3b5lshlczfozcpz4vvor3ypkpwocl4oczi5iyl@ufbhyyljn3zo>
In-Reply-To: <tbypgxb6ksoa3b5lshlczfozcpz4vvor3ypkpwocl4oczi5iyl@ufbhyyljn3zo>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 14:32:38 -0800
X-Gm-Features: AQt7F2peL8HajVvvFgsPh5Inmu10tO1nxbHHDTz5Irq_1l5Geotc52icf8ueFUY
Message-ID: <CAGSQo00DqmA1ihePtOWqv37h3U0NjN3ka853XA7w+6aCUkxS5g@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 2:06=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Dec 16, 2025 at 12:55:11PM -0800, Matthew Maurer wrote:
> > On Tue, Dec 16, 2025 at 12:52=E2=80=AFPM Bjorn Andersson <andersson@ker=
nel.org> wrote:
> > >
> > > On Sat, Dec 13, 2025 at 08:24:55AM -0800, Matthew Maurer wrote:
> > > > On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > > > > Shouldn't this all just be in 1 .rs file?  By not doing that, you=
 have a
> > > > > number of public symbols (that are very generic), that will "poll=
ute"
> > > > > the global namespace of the kernel symbol table (unless rust does=
 this
> > > > > somehow differently?)
> > > >
> > > > Rust produces one compilation unit per "crate". In this case,
> > > > `socinfo` is the crate, and the other files are included as "module=
s".
> > > > Symbols defined in them are not public unless annotated with `pub`.
> > > > `pub(crate)` makes them only exported within the scope of the crate=
,
> > > > i.e. inside the single produced `.o` file.
> > > >
> > >
> > > Does this imply that a fully converted drivers/soc/qcom would have ~5=
0
> > > subdirectories in it then?
> >
> > Not necessarily. Directories are not mandatory for a Rust module,
> > whether to do things this way is a code structure/stylistic decision.
> > I did it in this case primarily because I wanted to separate out the
> > large in-code data table (e.g. SOC_IDS) and the logic for speaking to
> > the smem driver from the rest of the code.
>
> Separating out the logic for interfacing the smem driver sounds like a
> quite reasonable proposition, to the point that I'd expect this to be a
> module of its own?

Currently the socinfo driver is the only user of that code, so
splitting it into a full kernel module would just add overhead to no
benefit. If we had multiple Rust drivers, we could consider between
either referencing the same file multiple places (would cause minor
code bloat, but avoid module overhead) or making it a module.

>
> > If you have a preference
> > for a single file, I can very easily put it all in a single file.
>
> My preference is that this follows whatever is the idiomatic model for
> in-kernel Rust. Whichever way that pulls us would be the answer to my
> question above...

drivers/gpu/{drm/nova,nova-core} use multi-file layout (with a single
kernel module, and multiple Rust files), so I would say that it is
idiomatic to use multiple files to define a single kernel module.

As far as a directory per kernel module, it generally appears that
multi-file Rust modules happen to have an exclusive directory with the
exception of the binder driver. However, that may be coincidence, as
most of those are defining a single high level kernel module, not a
cluster of related kernel modules.

Danilo or Miguel might have an opinion here on when directories should
be used? The Rust Coding Guidelines [1] don't seem to have any
opinions on directory structure, and I was unable to find any generic
guidance for general kernel development.

Were it my project, I would use directories for any Rust module that
was multi-file, and just use a regular file for Rust modules which
don't have a natural division into multiple pieces.

[1]: https://docs.kernel.org/rust/coding-guidelines.html

>
> Regards,
> Bjorn
>
> >
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > > But putting this all in 1 file should solve all of that, and remo=
ve all
> > > > > global symbols.  Especially for just a small and simple driver li=
ke
> > > > > this, no need to split it up at all.
> > > >
> > > > I'm willing to put it all in one file if that's preferred for
> > > > organizational purposes, but as explained above, this shouldn't blo=
at
> > > > the symbol count in Rust. If it were my own codebase this would be
> > > > separate files, so up to y'all what level of granularity you'd pref=
er.
> > > >
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h

