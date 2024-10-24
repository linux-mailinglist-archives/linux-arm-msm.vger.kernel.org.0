Return-Path: <linux-arm-msm+bounces-35645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE69ADBDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 08:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0E01F216FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 06:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CAF176AA1;
	Thu, 24 Oct 2024 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UepaPorx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41717177998;
	Thu, 24 Oct 2024 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750505; cv=none; b=By9/XeMo0yRvwTFuaYIGTbYvMB0525R1rY8Bz2Zw5mnGbJEFoB2E42FNngTEomOM/rxGjRZK4MFWkEfQiTIV64Bqd7NLTx3wqrRD9F4uT6TBChMSAxkEdvhT24aE+7Rmnzp9qOVNpsrc6zI35PCxSQBO+DFIYt4ruIlt3w6zB9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750505; c=relaxed/simple;
	bh=slboK5q8uJWK2Rq3IME2ccochvGNGQSVeogqk/vnDYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoUtRJXNUfsQv7g9gkZJVcvLsZ9GHHI+1UiHqb3K8o+9Lx2qweubqPXuE6Cc6ZRmMLV7P+DMCuBfF46ogebVzbyCQZyF/yRpR7Ry4mMfbfuqnR0d1abMU+4BKZtBJkih6C1ohVSs6VbM0LOXbEEfzb6oIhxTb8xVTjkUdNVzdCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UepaPorx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GJu8E1kmcKaxN7Py5JO+aITM1D4B6y3Wcbyx8qaQDWQ=; b=UepaPorxu1MJbYkWEg5SHN+JOy
	i/HhX7ZFzlnyzKIPg74YMkm22c0nW1SHL8iJLDwOEcGbD537u9Wy49ZOG0hWV35xbqHsrq9jj7x+a
	HHiWJgl+KUmm3DYmuFyR4MJ54oHpRE2M1aIo7Bse+923LlNuC9EjnWTV+5OOl1qanoqHRjv4a9WH2
	xo+C6IShEO9oiGds5oiUOz3aqdBiQWWtpEai3VAgxAESu3X28MJSRpavA6gLacOfNuWDYz9JN2h6N
	lmzPn0uM1Mpeg+szxniBk5/30pInFfrNEPLxfgAMKej1085lTz5PsPE/m6lvlCaAtQXntQ1+d6IWD
	1NDkVlXQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r7Z-0000000GslD-1X4P;
	Thu, 24 Oct 2024 06:14:57 +0000
Date: Wed, 23 Oct 2024 23:14:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Adrian Vovk <adrianvovk@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk,
	song@kernel.org, yukuai3@huawei.com, agk@redhat.com,
	snitzer@kernel.org, Mikulas Patocka <mpatocka@redhat.com>,
	adrian.hunter@intel.com, quic_asutoshd@quicinc.com,
	ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org,
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Message-ID: <Zxnl4VnD6K6No4UQ@infradead.org>
References: <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org>
 <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org>
 <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org>
 <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
 <ZxieZPlH-S9pakYW@infradead.org>
 <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Oct 23, 2024 at 10:52:06PM -0400, Adrian Vovk wrote:
> > Why do you assume the encryption would happen twice?
> 
> I'm not assuming. That's the behavior of dm-crypt without passthrough.
> It just encrypts everything that moves through it. If I stack two
> layers of dm-crypt on top of each other my data is encrypted twice.

Sure.  But why would you do that?

> > No one knows that it actually is encryped.  The lower layer just knows
> > the skip encryption flag was set, but it has zero assurance data
> > actually was encrypted.
> 
> I think it makes sense to require that the data is actually encrypted
> whenever the flag is set. Of course there's no way to enforce that
> programmatically, but code that sets the flag without making sure the
> data gets encrypted some other way wouldn't pass review.

You have a lot of trusted in reviers. But even that doesn't help as
the kernel can load code that never passed review.

> Alternatively, if I recall correctly it should be possible to just
> check if the bio has an attached encryption context. If it has one,
> then just pass-through. If it doesn't, then attach your own. No flag
> required this way, and dm-default-key would only add encryption iff
> the data isn't already encrypted.

That at least sounds a little better.  But it still doesn't answer
why we need this hack instead always encrypting at one layer instead
of splitting it up.


