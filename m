Return-Path: <linux-arm-msm+bounces-66789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D65B12FDB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89051896409
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 14:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63061D86FF;
	Sun, 27 Jul 2025 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTPA1rtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0DDD528;
	Sun, 27 Jul 2025 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753627220; cv=none; b=JQoN8/UaFyGxDnBbCgdHdztr8JIGqrp8BElYO5SvvxO5VtA+kWc/Gtd/b7YtcKe8llr+8ZfdG7dSr6M7tm363a7ylvUPWnB+u0DcPI4RjY8tM301vy7S0VtzxFGtllaGUGsvvnhBtyeflhQlonTHB/9YiI2G0gyYTK9gsVXclIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753627220; c=relaxed/simple;
	bh=4gB7c6Bo1KbwKmtbUQQkIuQOJFnxtuhSBSlSch5v4qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVxsvnJLGfYM4CXvTpVqhgQyIjcdiUlZuSLMTzb+LHs3J75zLfMF6pp1TmMToeGDMxCro1WSV7SkynPFD6PCpkuAyMdVOrqT4pPeWDlH2Yr1nT4NKqg549yvm3GpKlWMvTxGk9685xBH+GZiTtL0fdhxN6O+mpJLzgUja7Nxa0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTPA1rtZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43EDC4CEEB;
	Sun, 27 Jul 2025 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753627219;
	bh=4gB7c6Bo1KbwKmtbUQQkIuQOJFnxtuhSBSlSch5v4qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTPA1rtZpfQ5rekZ4+lyWemlT/e5wYSz/muLOk+vfAYCIXjXskn/mH2fI6VNAbvIw
	 agyFn0Ye8yx3sR0/xp82r7k7u436F3+9FaLidb84pUNSBfqd5s9ZQf6h7zzXiS6GqQ
	 7ultCh4ppCtXyk5qCSZUpgyioehM5e4aJY0PxWyIA1EnaayqF111q9KNg6qwhjmdbE
	 ybISIFTs2+H4JNlYPvdcgszvkAPJzSi0q12cEIqLzZHKuhHqTcpyU+yDbz1Pt3Zaqw
	 d25hBoAC2pEia8nvoRULg9KF5KLzfNN/esJoHg1L2xz1m5MuvhZjWBm59pmi72jhPT
	 /6wOqDVn0k+/w==
Date: Sun, 27 Jul 2025 15:40:14 +0100
From: Simon Horman <horms@kernel.org>
To: Mihai Moldovan <ionic@ionic.de>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
	Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
Message-ID: <20250727144014.GX1367887@horms.kernel.org>
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
 <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>

+ Dan Carpenter

On Sun, Jul 27, 2025 at 03:09:38PM +0200, Mihai Moldovan wrote:
> * On 7/24/25 15:08, Simon Horman wrote:
> > [...]
> 
> Thank you for the reviews, to both you and Jakub.
> 
> 
> > This will leak holding qrtr_nodes_lock.
> 
> It certainly does, will be fixed in v4.
> 
> 
> > Flagged by Smatch.
> 
> I haven't used smatch before, and probably should do so going forward.
> 
> Curiously, a simple kchecker net/qrtr/ run did not warn about the locking
> issue (albeit it being obvious in the patch), while it did warn about the
> second issue with ret. Am I missing something?

TL;DR: No, I seem to have been able to reproduce what you see.

I ran Smatch, compiled from a recent Git commit, like this:

kchecker net/qrtr/af_qrtr.o

The warnings I saw (new to this patch) are:

net/qrtr/af_qrtr.c:498 qrtr_node_assign() warn: inconsistent returns 'global &qrtr_nodes_lock'.
  Locked on  : 484
  Unlocked on: 498
net/qrtr/af_qrtr.c:613 qrtr_endpoint_post() warn: missing error code 'ret'

That was with Smatch compiled from Git [1]
commit e1d933013098 ("return_efault: don't rely on the cross function DB")

I tried again with the latest head,
commit 2fb2b9093c5d ("sleep_info: The synchronize_srcu() sleeps").
And in that case I no longer see the 1st warning, about locking.
I think this is what you saw too.

This seems to a regression in Smatch wrt this particular case for this
code. I bisected Smatch and it looks like it was introduced in commit
d0367cd8a993 ("ranges: use absolute instead implied for possibly_true/false")

I CCed Dan in case he wants to dig into this.

[1] https://repo.or.cz/smatch.git

> 
> 
> > But ret is now 0, whereas before this patch it was -EINVAL.
> > This seems both to be an unintentional side effect of this patch,
> > and incorrect.
> 
> True. Will also fixed in v4.
> 
> 
> Mihai




