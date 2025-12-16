Return-Path: <linux-arm-msm+bounces-85412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3FCC5454
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 22:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A0653048411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 21:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034BE336EE4;
	Tue, 16 Dec 2025 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwoKCSuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE332861F;
	Tue, 16 Dec 2025 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765922001; cv=none; b=hfSuYr376eCBffeQlP9IMJhsKJ2058r+yAq6hS3PSLFA9aevlyQyl4ciOP+uUolIXgIoK84WeI2qtfWyI+eRrYySTNH3XcBzQaT6o/9HfMgP1LS943frJVlejgy0H54fWN4YCWGOusfVtLLiEuqQMC8J5e1GF+wv0O6Xl1WxU/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765922001; c=relaxed/simple;
	bh=aedm3dWMT9hsur2NFQ6yDQv/BWTvpcuO/26EBHF56ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjDjxQMrI7Vfr3IbGPLkLqeMbVB6HUDobjPetnTdMqUSAFiUM2M/K73sOMR5Zt/YLL62EL0qKdPAIGyCmSRmEm/brRdYJnDe+SeYBwHwrvZx8/AgSWyuD9hogb4/i3Kb6oq0FzQ7m+RxfIEcgh8lIO5rhlXHl5uugIeMmlKsdYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwoKCSuH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C369CC4CEF1;
	Tue, 16 Dec 2025 21:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765922001;
	bh=aedm3dWMT9hsur2NFQ6yDQv/BWTvpcuO/26EBHF56ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwoKCSuHhCVG+4EYpuXQsHmwS2qAjQLMWwRHclt4GWMJ8PK7kJh70EqQfRDEoAfdo
	 13pBAQG1kkOiIRbpOl/G04KK4CG7mecY7PUPQx0/nFfqfjAyW3HJQbp18r+nHQEnZy
	 kC1gGN9RLL/kGcl3T19TIesXyhdpbQuNYKtD+FVSlPqKrg4FJRmAV2yJDlWRoNqbEN
	 atTojcWFs6n9wrDskT0iDmZ75cB168TWC5RAX1TCO27en5u3+kYDBOAjfozHjCOexU
	 XucSTsI/Yb1G5e9QrVxTADKxoWTFk0sLPApp2tmomniDFPG5mDy3Ru6txvagAFJ8ZN
	 3rjAOeBMAeObg==
Date: Tue, 16 Dec 2025 14:01:22 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <ekngmao2rw4mktubhpodudnkfvx5of74uvlswr7csnyxcwlmo5@cb6jfgiyg4vc>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
 <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>

On Tue, Dec 16, 2025 at 12:53:28PM -0800, Matthew Maurer wrote:
> On Tue, Dec 16, 2025 at 12:49 PM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > > bindings.
> >
> > Okay, but why?
> >
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> >
> > [..]
> 
> I'll move more of the text from the cover letter into the commit
> message, but the short version is that it's intended to be a low-risk
> driver to pilot vendor drivers in Android.
> 

The answers I'm looking for isn't in your cover letter either. I want to
know what benefits Rust provides in this particular case.

> >
> > > ---
> > > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> > > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> > > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> > > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> > > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> > > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> > > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> > > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f
> >
> > So, it doesn't work on a clean v6.19-rc1 tree?
> 
> Correct. Those other patchsets are patchsets I'm landing which add
> bindings used in this one.
> 

Okay, please make that explicit when submitting patches, so that the
maintainers know that your patch(es) can't be merged.

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > >
> > > Best regards,
> > > --
> > > Matthew Maurer <mmaurer@google.com>
> > >

