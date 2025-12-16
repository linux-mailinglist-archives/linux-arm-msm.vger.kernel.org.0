Return-Path: <linux-arm-msm+bounces-85409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD3CC51FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 21:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B660C3014AE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 20:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0F625A2A2;
	Tue, 16 Dec 2025 20:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSb6JRhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF018AE3;
	Tue, 16 Dec 2025 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918339; cv=none; b=ROV5L9sIEeaj02dASUXdBO83doUpYp1EobzrgmuB2+jkWpnTxiIK3ZIW9CGx5uOUNGFkYmfJZFWFORmOOQGTr7iCcW7S3CeafguMKy+BEwkER6j0eI5c3RHgCi8fanbD7b1yzDUyHHfzfj/o/D1+M2IDfczUc744vXoxtP3OZTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918339; c=relaxed/simple;
	bh=R3Gqo6dLDWYEO09Br7CMtq0fB5tVDlUJisVLFSfkhWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrYWqk+oBleyvRNZwFOTIVu7/TTznuVKG5pgZXk40EZ+SCMecPvYbLwIrqe3eE1O3ONCduakDvKX4H3axqfo6XxKtjh1dyx0INpLi/Yvwyyn25NAEf02FhampjOFCAudDsXOt8oyWM0WKX314LWk3cgbrcicHgJ3RVMuiWR8NJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSb6JRhp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DCDC4CEF1;
	Tue, 16 Dec 2025 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765918338;
	bh=R3Gqo6dLDWYEO09Br7CMtq0fB5tVDlUJisVLFSfkhWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSb6JRhpYdtxpv1gysJ/ZbMKWR2wDQf0niCLwqIEV0txOl8/coq+wybS7L49O/V1x
	 GM74cn+SBcEO0e8QUw0abQuP9jO81FJRNOMAp02hVq+qInW4kVjoTjcYQAxE3S2exH
	 0ARtVlBHEB62m8oVvuWjYzYYy8GjZ3RK7CULu+K2kgX64bcCOqw9sPf9FBvIflxpNl
	 kgzsB0fdyDGLH2Wb5sqwwE/ZClW5aElgPfbl4KbkJ3g0TYWo3oZlLPNUd7VI8GpghF
	 pJNBYOLyAf6rkcooHPk2pNAesAPOKwpI8dt5RBWTWH8VqPXnGYnKBhm2PdeP2zAVM1
	 tepNxQ8ryXkiA==
Date: Tue, 16 Dec 2025 13:00:19 -0800
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
Message-ID: <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh>
 <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>

On Sat, Dec 13, 2025 at 08:24:55AM -0800, Matthew Maurer wrote:
> On Sat, Dec 13, 2025 at 5:57 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Shouldn't this all just be in 1 .rs file?  By not doing that, you have a
> > number of public symbols (that are very generic), that will "pollute"
> > the global namespace of the kernel symbol table (unless rust does this
> > somehow differently?)
> 
> Rust produces one compilation unit per "crate". In this case,
> `socinfo` is the crate, and the other files are included as "modules".
> Symbols defined in them are not public unless annotated with `pub`.
> `pub(crate)` makes them only exported within the scope of the crate,
> i.e. inside the single produced `.o` file.
> 

Does this imply that a fully converted drivers/soc/qcom would have ~50
subdirectories in it then?

Regards,
Bjorn

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

