Return-Path: <linux-arm-msm+bounces-66833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27618B1393C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 12:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873E13A89AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267762472B0;
	Mon, 28 Jul 2025 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNraNSpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4A246BA5;
	Mon, 28 Jul 2025 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753699908; cv=none; b=QU2zNSO1LZQSqv1uohgabpMMLbUUFTYszaekSY/MeYq0NoLOXePxy1Rviu7ORgR8ARFPH+I/8kcRxiNsfTnKOrUppMyjyoJ5v/ZLLSwQJIgGdaRLr+6ZefvLfxZkOdx5YJDj9oauGz6G5Grqt4eQvWfnb1Ri0IqKZwNQTNnCagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753699908; c=relaxed/simple;
	bh=zqnx9HuowZ+lHyObY59ewf0mnjXI/dNEhmmcovb74DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BV86KOcdvnBUczIeU3UZMF9qF7zQJUaPhgmwh04paiC4yjp/p9TUUtDVCvdVKEkHrdM4ulqAAMeAUCrXphCuIde9NadulOmqJymeb8C0gb2sCyOudOorBtpLqYdRa6saRfiL82m90lQ/3omy472/IX+bZktChmMKmrLwab00LwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNraNSpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5F7C4CEE7;
	Mon, 28 Jul 2025 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753699907;
	bh=zqnx9HuowZ+lHyObY59ewf0mnjXI/dNEhmmcovb74DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nNraNSpYEiG8XjSnMc8aUz9uHrdzsWQAEbAWu1xhb7mnCgD+rdHM7S6M1PMnAhRvF
	 pJEss3vzIcDjh1X4nphyBLQLOw/9e+ktT05YSxfB26BnAE742YD00VBHFpFNFm/sKX
	 99Q5mjHSh9FD+9i2hc2lsBzcLmNEKMHnWoe6VnuMGAPkMBqFKUBYxnYtrNWMe4QW5U
	 25DKhcSS6ZUd7QQu/fI2UqfJZHzVIfkqj9n2lhZ7MzmnEy9ObZmO8nr6ueKpuJxwtV
	 e7/1DyBChj7oPDlahFGsSnDKF4H5dQl5yfUUQGuH+LkW53wr6/HuQX5yr/OkCK0y1D
	 sbU67Op6o9JvQ==
Date: Mon, 28 Jul 2025 11:51:42 +0100
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
Message-ID: <20250728105142.GZ1367887@horms.kernel.org>
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
 <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
 <20250727144014.GX1367887@horms.kernel.org>
 <19b393bf-6ba3-406b-8b5b-48a60e5aa855@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19b393bf-6ba3-406b-8b5b-48a60e5aa855@ionic.de>

On Sun, Jul 27, 2025 at 07:33:58PM +0200, Mihai Moldovan wrote:
> * On 7/27/25 16:40, Simon Horman wrote:
> > I tried again with the latest head,
> > commit 2fb2b9093c5d ("sleep_info: The synchronize_srcu() sleeps").
> > And in that case I no longer see the 1st warning, about locking.
> > I think this is what you saw too.
> 
> Exactly! Together with impossible condition warnings, but those are actually
> fine/intended.

Yeah, I saw them too.
I agree they are not correctness issues.

> 
> > This seems to a regression in Smatch wrt this particular case for this
> > code. I bisected Smatch and it looks like it was introduced in commit
> > d0367cd8a993 ("ranges: use absolute instead implied for possibly_true/false")
> Oh, thank you very much. I suspected that I'm just missing a special script
> or option or even addition to Smash (given that Dan seems to have revamped
> its locking check code in 2020), especially since it seems to be so widely
> used in kernel development, but not a bug in the software itself.

Likewise, thanks for pointing out this problem.



