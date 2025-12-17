Return-Path: <linux-arm-msm+bounces-85419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F83CC5930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 01:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A9CE3016DC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 00:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D414A17A2FA;
	Wed, 17 Dec 2025 00:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjWXeR1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F337E0E8;
	Wed, 17 Dec 2025 00:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765930552; cv=none; b=IISIm9I5/b5QO2ke0ceOHJ/CL/BGW6j43mkTo5mFiPZRwZ05R4MwC5g0acCIQlpecshfO/vZzJ9GX2V4JxUGWh3Qk55Tjl+BaXahx2OM/ASfdlpOXSFfccstXtW+v1Qhz8IIW09QbXWSLI3WMZETLiOLG3EidteNdo8xa4DBvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765930552; c=relaxed/simple;
	bh=1fLaQXQMhAIIY9eYTYTesa9WGtZTwz0jbYAKYyGDJQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkZODT9+wUPH99h1QRYCMjsiTmyF4wUk9oUIO1UiK57/y8dXN+3ls8cwsebFFiVpY8SLlQwwreZV0qEF+inAiil4i+KlcokBGmtPyEWQZCqO+0kTUsjxrvwMZ5YrJZYOyI1XecxdS+a0TyhcixcGQikzlFST1erdCei4uVU/nsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjWXeR1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F576C4CEF1;
	Wed, 17 Dec 2025 00:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765930552;
	bh=1fLaQXQMhAIIY9eYTYTesa9WGtZTwz0jbYAKYyGDJQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjWXeR1ONyqKqG0QcMf/3Nv2u3TzWQBOf2sLo/F+oEvxIVO6iKSiwVYu+8PU1fSUY
	 CDbx77XmAtjoaUn7FBnJay52USa5BuIUG+gn+Sd6pZykxNMC9I0lih41KQBG346ajq
	 U9N/dF7ijEh0qL/c+n4u8Jblejm0P+YubteKQtHH9RAfvWu9OUx4DRkIsBc0mw8x75
	 YgvGVl+xrgCrqDdug9jI3R63qVj1UEw9nas8KwX96SWETjXifQBqes+Ecc6jpL7ci+
	 z4BpBXfDJPVSoUSJ9kp00vYHf/HIOYnOL1DCxFAt7598+iSwc2ALgqtF6xX5vQl6SE
	 OpmPq0LPGz0Yw==
Date: Tue, 16 Dec 2025 16:23:53 -0800
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
Message-ID: <msbgnz45owgcnx2q5e6kamhsfmslyed6kqbrprrttkoeruradr@nd3rbstjxds5>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
 <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>
 <ekngmao2rw4mktubhpodudnkfvx5of74uvlswr7csnyxcwlmo5@cb6jfgiyg4vc>
 <CAGSQo03+pVhjyfSLGHHcr=w1-3=C5AcEKJf-GbcEvfJ6NTid7g@mail.gmail.com>
 <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>
 <CAGSQo011pq+YX=AF0TczzzTw0JL2azvVtijCDDH8HJzzxFYOPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo011pq+YX=AF0TczzzTw0JL2azvVtijCDDH8HJzzxFYOPA@mail.gmail.com>

On Tue, Dec 16, 2025 at 03:32:53PM -0800, Matthew Maurer wrote:
> On Tue, Dec 16, 2025 at 3:05 PM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Tue, Dec 16, 2025 at 02:13:08PM -0800, Matthew Maurer wrote:
> > > On Tue, Dec 16, 2025 at 1:53 PM Bjorn Andersson <andersson@kernel.org> wrote:
> > > >
> > > > On Tue, Dec 16, 2025 at 12:53:28PM -0800, Matthew Maurer wrote:
> > > > > On Tue, Dec 16, 2025 at 12:49 PM Bjorn Andersson <andersson@kernel.org> wrote:
> > > > > >
> > > > > > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > > > > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > > > > > > bindings.
> > > > > >
> > > > > > Okay, but why?
> > > > > >
> > > > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > > >
> > > > > > [..]
> > > > >
> > > > > I'll move more of the text from the cover letter into the commit
> > > > > message, but the short version is that it's intended to be a low-risk
> > > > > driver to pilot vendor drivers in Android.
> > > > >
> > > >
> > > > The answers I'm looking for isn't in your cover letter either. I want to
> > > > know what benefits Rust provides in this particular case.
> > > >
> > >
> > > Rust likely does not provide any significant benefits for the socinfo
> > > driver itself, aside from having caught the slight disconnect
> > > (mentioned on the other thread) where it should probably be an
> > > auxiliary device because it assumes that the `qcom-smem` device will
> > > remain active as long as it does.
> > >
> >
> > Yes, this isn't unique to Rust. The smem API would benefit from an
> > overhaul in general... At the time I wrote it, you couldn't really boot
> > the system without SMEM, so I added the suppress_bind_attrs, these days
> > you can exercise a fair amount of use cases without it.
> >
> > > The primary intention of converting this driver is to be a low risk
> > > trial for GKI's ABI stability for vendor modules and a first Rust
> > > vendor module (we have platform modules already for binder and ashmem)
> > > on Android. This was discussed informally with Trilok (a long time
> > > ago) to act as an example for other vendor drivers and encourage usage
> > > of Rust for new drivers or those where memory safety has been a
> > > problem in the past, but nothing was ever formally committed to.
> >
> > But if the test bed for GKI ABI stability is the goal, don't you need
> > something with a more interesting interface?
> 
> We've been watching things manually for the 6.12 release and manually
> backtested on the 6.6 release (by looking at our ABI dumps) and
> believe that it works. The only way we can really progress further is
> by deploying a vendor driver in the field.

But this is the upstream kernel, you're not contributing to 6.6, 6.12,
or even 6.18. If we merge this rewrite for v6.20 it will be deploying
into the field in 2027.

Perhaps I'm misunderstanding what you're saying here though?

> If we pick something more
> interesting, there was concern around it being caught up on concerns
> related to the specific driver. The hope was that this driver would
> simultaneously be real enough to count as a driver in the eyes of
> other vendors watching for someone to take the lead, and simple enough
> to be low risk enough to be possible.
> 

Are you talking about upstream drivers, or downstream vendor drivers?

> We do have more interesting drivers in process, e.g. the tyr graphics
> driver, but those are longer term efforts.
> 
> >
> > Also, how would this manifest itself in the upstream kernel? Do you have
> > a test bed where you build GKI + vendor "kernel" out of the upstream
> > kernel tree today?
> 
> In Android, kernel modules are split into two categories - "GKI
> modules", which get shipped with the primary kernel to every system,
> and vendor modules, which are shipped and loaded by particular
> devices. Neither current builtin modules [1] nor current GKI modules
> [2] contain the qcom socinfo, so it is a vendor module. This
> categorization is not an "in-tree" / "out of tree" categorization, but
> a "every Android device" / "some Android devices" one.
> 

Forgive me, but I'm reading this as "Android downstream" + "Qualcomm
downstream", my question was how this relates to the upstream kernel.

> [1] https://ci.android.com/builds/submitted/14027866/kernel_aarch64/latest/modules.builtin
> [2] https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12/modules.bzl
> >
> > > Trying to apply Rust to more significant existing modules (where it
> > > would provide a greater benefit) raises concern about whether they
> > > will operate identically. Socinfo in particular can be more thoroughly
> > > tested for equivalency, as aside from the runtime DSP information
> > > modification that was mentioned in this discussion, the output of the
> > > socinfo driver is static and can just be checked. This means that a
> > > socinfo driver swap will essentially have the language change be the
> > > *only* significant thing about the change, keeping the risk to a
> > > minimum.
> > >
> > > Part of the reason for the RFC prefix on this patch is to solicit your
> > > feedback on whether you are open to this. If you have somewhere else
> > > you'd prefer we try this, I'd be open to that as well.
> > >
> >
> > Rust is a new dependency and it's a foreign language to the vast
> > majority of the contributors in the upstream Qualcomm community.
> >
> > So, IMHO sufficient value needs to come with such rewrite, and this
> > value needs to be properly documented in the git history. Rewriting
> > things for the sake of rewriting things, or the facilitate a downstream
> > experiment, is hard for me to force onto our community.
> 
> Since you brought it up, I took a brief look and found CVE-2024-58007
> [3] , which would have been prevented through use of Rust, as the
> access would have been bounds-checked. I understand that such
> vulnerabilities in socinfo.c are likely to be uncommon, but even for a
> driver this simple memory safety issues do happen, and have even
> happened recently.
> 

Yes, this is exactly the kind of argumentation I would like to see.

This is something we can weigh against the added cost of the Rust
implementation.

Regards,
Bjorn

> [3]: https://nvd.nist.gov/vuln/detail/CVE-2024-58007
> >
> > Regards,
> > Bjorn
> >
> > > > > >
> > > > > > > ---
> > > > > > > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > > > > > > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > > > > > > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> > > > > > > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> > > > > > > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> > > > > > > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> > > > > > > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> > > > > > > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > > > > > > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> > > > > > > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> > > > > > > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f
> > > > > >
> > > > > > So, it doesn't work on a clean v6.19-rc1 tree?
> > > > >
> > > > > Correct. Those other patchsets are patchsets I'm landing which add
> > > > > bindings used in this one.
> > > > >
> > > >
> > > > Okay, please make that explicit when submitting patches, so that the
> > > > maintainers know that your patch(es) can't be merged.
> > >
> > > I thought that was what I had done by using the combination of "RFC"
> > > and putting the prerequisite change IDs from b4, but I will include a
> > > statement to that effect in my cover letter in the future.
> > >
> > > >
> > > > Regards,
> > > > Bjorn
> > > >
> > > > > >
> > > > > > Regards,
> > > > > > Bjorn
> > > > > >
> > > > > > >
> > > > > > > Best regards,
> > > > > > > --
> > > > > > > Matthew Maurer <mmaurer@google.com>
> > > > > > >

