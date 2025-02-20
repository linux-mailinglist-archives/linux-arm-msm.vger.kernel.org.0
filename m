Return-Path: <linux-arm-msm+bounces-48760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE474A3E4EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 20:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1309A19C0E9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 19:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACA21DF987;
	Thu, 20 Feb 2025 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Li1wYMRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381B15A858;
	Thu, 20 Feb 2025 19:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740079182; cv=none; b=abmYATMLJR0ejm1y/Ti7VQ7sDgtB6EoxwnECX4nF+fExxImOgRQD2pCLI4rd9rzCUvG31o5W06IOWURJJByKr71FwH1OifNTWuCgfYnGso27XVLgN/bAip8HVXWWooyu2pBUwQq1t6Y3xnYdxHMzbgEiVpbzT35yrPFLKwk4pO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740079182; c=relaxed/simple;
	bh=+0OClTSDtciyZQXNExzuhepJzGzEk7ZP1QX/R7XxbUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA02/4dV5lEHSyWn2tWq+neJddk6CiJTKLNQBXC4LVodM2RLVGWEJ7winc8W6kcfoNjQo6ONzXGO1khGS2vnSe1M0uzQlaRqBc5MD/I7HiNpJq+g1UPlU073cLKO24KqnhTlLkjFERo3TIxFkVmismkZjlSBKHVXyD8TGB1/rSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Li1wYMRm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5697CC4CED1;
	Thu, 20 Feb 2025 19:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740079181;
	bh=+0OClTSDtciyZQXNExzuhepJzGzEk7ZP1QX/R7XxbUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Li1wYMRmL9KK6l4WaYL0PcSVJKqrcCa10Y6PHxcMEmTa6dtMdvVsK9SC3SnMWeIT7
	 9PC+m6PbqUF0f2cSKFxu2XNJ9j4JN/0wfhzFnlSYwM2hMJTnzd4tfnI3u8ZuexbzLr
	 h/5+jea8bk80FA7Sif/DJo+n5mb4iQFTc33VmwYqD4vk7Ex1KxBXvj5jvpXoUT6HZr
	 ds3TV1OFRECgpfpbFNhSbCL7JcxmHFv8GZTq/NeiSyR4YHxXJWDb4lV3LO3LkqjTuZ
	 lRVDG+fDGn4xH4rpa0fSsjMSlxhn4olEvUQX2gU5Vi76hsjkLwgmkP7O5x0y6sCEFz
	 GLVhh/JbmCuIA==
Date: Thu, 20 Feb 2025 19:19:39 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: neil.armstrong@linaro.org, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
Message-ID: <20250220191939.GA2098877@google.com>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
 <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org>
 <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>
 <20250118080604.GA721573@sol.localdomain>
 <CAMRc=MeFMYzMY4pU9D6fEpg9bQuuzqg4rQhBU8=z_2eMU+Py-g@mail.gmail.com>
 <20250118175502.GA66612@sol.localdomain>
 <CAMRc=MdR-8AnwAsMzHn8zj2awZUumO32C_S1-CkjBEqbuKPdeg@mail.gmail.com>
 <CAMRc=MetohPUcxRLO0qS-LYyzZhiAMAHzLm0xqX8_TXdTgBnVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MetohPUcxRLO0qS-LYyzZhiAMAHzLm0xqX8_TXdTgBnVA@mail.gmail.com>

On Thu, Feb 20, 2025 at 10:14:20AM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 20, 2025 at 2:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Sat, Jan 18, 2025 at 6:55 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Sat, Jan 18, 2025 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
> > > > I was testing with kcapi-speed and cryptsetup benchmark. I've never
> > > > seen any errors.
> > > >
> > > > Is this after my changes only or did it exist before? You're testing
> > > > with the tcrypt module? How are you inserting it exactly? What params?
> > >
> > > Those are all benchmarks, not tests.  The tests run at registration time if you
> > > just enable the kconfig options for them:
> > >
> > >     # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> > >     CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
> > >
> > > The test failures and KASAN error occur on mainline too, so yes they occur
> > > before your patchset too.
> > >
> > > > >
> > > > > I personally still struggle to understand how this driver could plausibly be
> > > > > useful when the software crypto has no issues, is much faster, and is much
> > > > > better tested.  What is motivating having this driver in the kernel?
> > > >
> > > > We want to use it in conjunction with the upcoming scminvoke (for
> > > > loading TAs and invoking objects - used to program the keys into the
> > > > QCE) to support the DRM use-case for decrypting streaming data inside
> > > > secure buffers upstream.
> > >
> > > Notably lacking is any claim that any of the current features of the driver are
> > > actually useful.
> > >
> >
> > Noted. I'm still quite early into working on the upstream-bound code
> > supporting the streaming use-case but I will consider a proposal to
> > remove existing features that are better provided by ARM CE.
> >
> > Thanks,
> > Bartosz
> 
> Just an FYI, I was informed by Qualcomm that upcoming platforms will
> contain an upgrade to this IP and it will be up to 3x faster than ARM
> CE.

I suspect that is measured under some ideal condition that won't be reached in
the real world, but we'll see.

- Eric

