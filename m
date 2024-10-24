Return-Path: <linux-arm-msm+bounces-35710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F4B9AEB36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71B2DB215F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1191F584D;
	Thu, 24 Oct 2024 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jR74GHFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507D1B0F26;
	Thu, 24 Oct 2024 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729785556; cv=none; b=myuPGUCzeBImOGuJSIf77aS/SvHbS6gL291Gw15n9ZSLCPOPRbibGqn2db0AhHkoVvaHWMJHtXMvH+UJ5+bsS0ACczUrA3/loNHZl7udSLEs+bc9SXpBKkd/w8jCkgSDLoU6yII/oWw1ukfwkEvYS/8x9mnn/ZPja1zBQVQodJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729785556; c=relaxed/simple;
	bh=LY3Xnn6E2dg53LDWA9RvAxOsaLUHM37Ouf3miNSZxtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nse+Ff2Ki9ZS3VvMI4VqwVbiAwAmczUSfCOXB35+xt/NjFg1rTIx/ZrUW9kpO3P4/lfSwfTX4RveS51BQ0XJEbkCG7pD0LUhceTEfQiLrbqnyF+JHHHAWykw4cTD5FgKRrEzl5iPCXbvPzj4gaSI4ZMZkWhYBz7hes1DAewFf9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jR74GHFp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=S3nsdWvZ1qxMreWvwL33cyPfVPTO4nDA5dJi8VcaG2k=; b=jR74GHFpaaOQ5UfJX7u+wDtrMj
	DXWoonzQdUnbIkEx3sxak0L+QM47hr7mI3bbqFrKMGu6Hx8IhxxIaDGxSiy1ueQ82XdXWArZ2Gm6l
	bWOPnAYvB89JeZZjpPoChoPOt6ViPuKLgHfCJX/iFcxFOkLMLH7WBPmScq5x7Jk7IQWYiWQg9hfD7
	NLNPlabaftRym5uUFPRHW9F8IElncXBlEu/6w8gnr2GTKekqbSg2cdL05ESTewL5HrLveWT5nNYYD
	OhXzUJ8UMvdFDDSU1lV2SgtYYNtglYxFfhgE+dLBAo++twXJbY30q8B6Bz40RlvSVYGBNwRbmcSn1
	OVGuiu0g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Ev-000000010mi-2Tc2;
	Thu, 24 Oct 2024 15:59:09 +0000
Date: Thu, 24 Oct 2024 08:59:09 -0700
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
Message-ID: <Zxpuzbjtq0eNP49Z@infradead.org>
References: <ZxHwgsm2iP2Z_3at@infradead.org>
 <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org>
 <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
 <ZxieZPlH-S9pakYW@infradead.org>
 <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
 <Zxnl4VnD6K6No4UQ@infradead.org>
 <14126375-5F6F-484A-B34B-F0C011F3A9C5@gmail.com>
 <ZxoNgmwFVCXivbd3@infradead.org>
 <CAAdYy_kKHx-91hWxETu_4TJKr+h=-Q0WdoyQwXjRZiwiXCOOYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAdYy_kKHx-91hWxETu_4TJKr+h=-Q0WdoyQwXjRZiwiXCOOYQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Oct 24, 2024 at 11:32:58AM -0400, Adrian Vovk wrote:
> >> I'm not assuming. That's the behavior of dm-crypt without passthrough.
> >> It just encrypts everything that moves through it. If I stack two
> >> layers of dm-crypt on top of each other my data is encrypted twice.
> >
> >Sure.  But why would you do that?
> 
> As mentioned earlier in the thread: I don't have a usecase
> specifically for this and it was an example of a situation where
> passthrough is necessary and no filesystem is involved at all. Though,
> as I also pointed out, a usecase where you're putting encrypted
> virtual partitions on an encrypted LVM setup isn't all that absurd.

It's a little odd but not entirely absurd indeed.  But it can also
be easily handled by setting up a dm-crypt table just for the
partition table.

> In my real-world case, I'm putting encrypted loop devices on top of a
> filesystem that holds its own sensitive data. Each loop device has
> dm-crypt inside and uses a unique key, but the filesystem needs to be
> encrypted too (because, again, it has its own sensitive data outside
> of the loop devices). The loop devices cannot be put onto their own
> separate partition because there's no good way to know ahead of time
> how much space either of the partitions would need: sometimes the loop
> devices need to take up loads of space on the partition, and other
> times the non-loop-device data needs to take up that space. And to top
> it all off, the distribution of allocated space needs to change
> dynamically.

And that's exactly the case I worry about.  The file system can't
trust a layer entirely above it.  If we want to be able to have a
space pool between a file systems with one encryption policy and
images with another we'll need to replace the loop driver with a 
block driver taking blocks from the file system space pool.  Which
might be a good idea for various other reasons.

> Ultimately, I'm unsure what the concern is here.
> 
> It's a glaringly loud opt-in marker that encryption was already
> performed or is otherwise intentionally unnecessary. The flag existing
> isn't what punches through the security model. It's the use of the
> flag that does. I can't imagine anything setting the flag by accident.
> So what are you actually concerned about? How are you expecting this
> flag to actually be misused?
> 
> As for third party modules that might punch holes, so what? 3rd party
> modules aren't the kernel's responsibility or problem

On the one hand they are not.  On the other if you have a file system
encryption scheme that is bypassed by a random other loadable code
setting a single flag I would not consider it very trust worth or in
fact actively dangerous.

> In my loopback file scenario, what would be the one layer that could
> handle the encryption?

But getting rid of loopback devices.


