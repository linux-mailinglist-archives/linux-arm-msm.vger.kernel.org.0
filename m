Return-Path: <linux-arm-msm+bounces-85413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722ECC54C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 23:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59A7230155F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 22:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84612328B6E;
	Tue, 16 Dec 2025 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsyOpDtp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E192DEA87;
	Tue, 16 Dec 2025 22:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765922786; cv=none; b=KwbcodqNM2+WphTJniwno3xEHIsFFaojZW7bNiaKLBU3jycsd3meETwt/SBYMnNvsfcMqpbwxTqgkC9BAD6YAK7BkrjO3PzhGrVPYAvNSH9q1vwI6F8HTjQn3EeII0uSRp3fz+W+OOR+oa/v8pefzrUhliyqcEEzcHAN0M7qJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765922786; c=relaxed/simple;
	bh=cw0uAjn/fwBA2u9wMxNabSDd0yXhxWpJlwYANPYhTFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ter2ZlY7lSR6Hng1aoOaQsKOFSgjklYMEFlhmMKB2V1WvRENYO+zd1tIHqNKN90+A05YtOIX3k/EJclUZzuZjau8JepFLGrKqlfui0HkFonC9nzPSTu/zLRhsF9EXTNbshqgCTq22OTo3ALgwO61PG35BE6lGs/C0cfYZH1dI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsyOpDtp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56A6C4CEF1;
	Tue, 16 Dec 2025 22:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765922785;
	bh=cw0uAjn/fwBA2u9wMxNabSDd0yXhxWpJlwYANPYhTFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gsyOpDtp7uhiWyCZnbdUn6p8gC846NfR4l+E8WTIu0CMef8vaEQ0gYV3ldsR09jL4
	 JQFBY5vcrLth8ow+fFOZwT1ZDSG4DRnJvp505QMZVI9NOLfX04rBSn1KjylJC3LyeD
	 7F0BetOagkxvzbIypffYs6qMwoD0yz3IfasE1vPk36kXzac2W3oxyCcU4/SGpx9yvE
	 WnkjZiLbijffZb4hsNHVgrbD+UaqVRoDJTusYplVoVxCAgHalIPhhBTGd4ZrBQi008
	 zlVI6+OZ3jkXYVZFENsYwRetD0yL0Nit57CxmJLOm4FWmRxjikbM0xe3xYcEGKL6QZ
	 cdgRSWeI8lwRw==
Date: Tue, 16 Dec 2025 14:14:26 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <tbypgxb6ksoa3b5lshlczfozcpz4vvor3ypkpwocl4oczi5iyl@ufbhyyljn3zo>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh>
 <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
 <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
 <CAGSQo02mx361GmTzCCiMyQZUfnsWCRTbvFpBX73W=PZnhJ0wcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo02mx361GmTzCCiMyQZUfnsWCRTbvFpBX73W=PZnhJ0wcA@mail.gmail.com>

On Tue, Dec 16, 2025 at 12:55:11PM -0800, Matthew Maurer wrote:
> On Tue, Dec 16, 2025 at 12:52 PM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Sat, Dec 13, 2025 at 08:24:55AM -0800, Matthew Maurer wrote:
> > > On Sat, Dec 13, 2025 at 5:57 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > Shouldn't this all just be in 1 .rs file?  By not doing that, you have a
> > > > number of public symbols (that are very generic), that will "pollute"
> > > > the global namespace of the kernel symbol table (unless rust does this
> > > > somehow differently?)
> > >
> > > Rust produces one compilation unit per "crate". In this case,
> > > `socinfo` is the crate, and the other files are included as "modules".
> > > Symbols defined in them are not public unless annotated with `pub`.
> > > `pub(crate)` makes them only exported within the scope of the crate,
> > > i.e. inside the single produced `.o` file.
> > >
> >
> > Does this imply that a fully converted drivers/soc/qcom would have ~50
> > subdirectories in it then?
> 
> Not necessarily. Directories are not mandatory for a Rust module,
> whether to do things this way is a code structure/stylistic decision.
> I did it in this case primarily because I wanted to separate out the
> large in-code data table (e.g. SOC_IDS) and the logic for speaking to
> the smem driver from the rest of the code.

Separating out the logic for interfacing the smem driver sounds like a
quite reasonable proposition, to the point that I'd expect this to be a
module of its own?

> If you have a preference
> for a single file, I can very easily put it all in a single file.

My preference is that this follows whatever is the idiomatic model for
in-kernel Rust. Whichever way that pulls us would be the answer to my
question above...

Regards,
Bjorn

> 
> >
> > Regards,
> > Bjorn
> >
> > > > But putting this all in 1 file should solve all of that, and remove all
> > > > global symbols.  Especially for just a small and simple driver like
> > > > this, no need to split it up at all.
> > >
> > > I'm willing to put it all in one file if that's preferred for
> > > organizational purposes, but as explained above, this shouldn't bloat
> > > the symbol count in Rust. If it were my own codebase this would be
> > > separate files, so up to y'all what level of granularity you'd prefer.
> > >
> > > >
> > > > thanks,
> > > >
> > > > greg k-h

