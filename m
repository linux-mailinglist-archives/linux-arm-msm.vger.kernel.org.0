Return-Path: <linux-arm-msm+bounces-67653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE68B19F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 11:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A25E189B32E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 09:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED7C245031;
	Mon,  4 Aug 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrFu5NEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE217CA1B;
	Mon,  4 Aug 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754301328; cv=none; b=stzxl1q1SHBQEFg5imfQEzJqoiqFP+b8WdXfpfB1/5x9PLPMZDx5e5JmnBc4hZqC+g75PQLxh48WebjpTLn5MZYCcsnCUbNH2D/yH5oWAitAPX8Qonozpp8JGriA3UdW1JWI01KnG2m1PKDITyyczbCoiLKQ74Qzv0Qk+1vRJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754301328; c=relaxed/simple;
	bh=UbbUVv84Rlwn9CmduoTQy8dFL7t7tWtW9/qdyU/IcX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sy0z3m3rWysG8VMFgPAEakZJwdiGu5tAHoN/2fN3n23tOeG2lBPhhXXPkmQKV0EChoZTGnkLnOBwgjHxcDg2/jx12A6S+XJyECMnVx3Okifmka6P6D4M1kZWrjhcihqIDElwcSzbssg8EfjYHhdIlJyQbDO34n6nTXtNlqimaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrFu5NEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7A1C4CEE7;
	Mon,  4 Aug 2025 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754301327;
	bh=UbbUVv84Rlwn9CmduoTQy8dFL7t7tWtW9/qdyU/IcX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrFu5NEKJ1pkNYIbgCRSByxXB1Dj+6RrIvxBDdfZdN07Qc+r8ymXgTZOgB7bBZumj
	 L2TnSpvXhSCKg1TL6htk9fhUpUedQixM2P75pOnb1i5WJhp3APJFaTOBmemHKH9t3o
	 b+z5jBHidCdUxOVDck402h0doLNvJocqFjBygcm0sDlOCaM/1pxwcjt8mDPT5Jh/Id
	 II7Xe+gSmGnPBTyW9S1AdBwSzkqZSsCEJligiopXr1H4ggBgNItlG4LA+1gv7foJK9
	 /Bvf9/v6ywGrzsEZ9+ncTUeLSsrmJV3xa2T/dYStbuNzMllWL3UVsv4HaWgvZ0kfzi
	 5Fnzd13cx1hVA==
Date: Mon, 4 Aug 2025 10:55:22 +0100
From: Simon Horman <horms@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mihai Moldovan <ionic@ionic.de>, linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
Message-ID: <20250804095522.GP8494@horms.kernel.org>
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
 <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
 <20250727144014.GX1367887@horms.kernel.org>
 <aIz4pj5qgXSNg8mt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIz4pj5qgXSNg8mt@stanley.mountain>

On Fri, Aug 01, 2025 at 08:25:58PM +0300, Dan Carpenter wrote:
> On Sun, Jul 27, 2025 at 03:40:14PM +0100, Simon Horman wrote:
> > + Dan Carpenter
> > 
> > On Sun, Jul 27, 2025 at 03:09:38PM +0200, Mihai Moldovan wrote:
> > > * On 7/24/25 15:08, Simon Horman wrote:

...

> > This seems to a regression in Smatch wrt this particular case for this
> > code. I bisected Smatch and it looks like it was introduced in commit
> > d0367cd8a993 ("ranges: use absolute instead implied for possibly_true/false")
> > 
> > I CCed Dan in case he wants to dig into this.
> 
> The code looks like this:
> 
> 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
> 
>         if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
>             nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
>                 return -EINVAL;
> 
> The problem is that QRTR_INDEX_HALF_UNSIGNED_MAX is U32_MAX and
> node->ep->id and nid are both u32 type.  The return statement is dead
> code and I deliberately silenced warnings on impossible paths.
> 
> The following patch will enable the warning again and I'll test it tonight
> to see what happens.  If it's not too painful then I'll delete it
> properly, but if it's generates a bunch of false positives then, in the
> end, I'm not overly stressed about bugs in dead code.

Thanks Dan,

I think the key point here is that neither Mihai nor I noticed
the dead code. Thanks for pointing that out.

...

