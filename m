Return-Path: <linux-arm-msm+bounces-66881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA9B13DA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6DCF1887D97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C0126D4F7;
	Mon, 28 Jul 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9/d+OlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD7282EB;
	Mon, 28 Jul 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753714201; cv=none; b=I72p5+WUQK/RLONwIYEnBtKzv9PlTirXUn9CrFh2RuL7thWErVpNUmNYp/lqBvQZKVYBy0dwbvSwU1XRXfsWok6TGvSTzV0k7SebPNm2NI1RLwOPWv+cijwlBe9v8dLaKShfr+gp9ScoEI0Pj+JLRMLtwcFueLOrwMTEG4SQZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753714201; c=relaxed/simple;
	bh=8faeJ/6M1ZwZG9oWHwFVJobwid4nXuQaTELQoapgmcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkptaOu3ywVG3gi9qqcbgzDE2nLpIqINFAbpytHRksN01SzbnHROUFJ30ZhtXSxShQV1nfBw8osLLDyNzHA66S12Xb29Sgd77FucE7jzqNljTIdJFh7XnH8CQorfl9VKkprvqamvGV9Xy/EruXKmmZswyfzbOcwUjEFd9cMy3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9/d+OlQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5920C4CEE7;
	Mon, 28 Jul 2025 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753714201;
	bh=8faeJ/6M1ZwZG9oWHwFVJobwid4nXuQaTELQoapgmcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9/d+OlQaCLrFZCaBHTeRnV1AQjFfNx2atOf8Loi1kXuaaMcs9NjPnQzH65NBaG4e
	 9AW9XieRMTRJsOWUkV75c9XXSGxCHTl8lvZpvSQW/UfnIN5Yb4qBJrRSZ2FsaIXl9P
	 KMkgnhjdnXMIWmKSQHgRUsgNoOs2P449wjMAYLTeR8xg9tGhxAa9Sw7Xcs2p1HdKTq
	 QNzbeXql7tPwedHZjaJQ8PeaPzn/fR0Q64UKtDEDGW6I4JMApn1NVFo8XbYc13ZvD2
	 +KyhFMq6yKtjF4G7L5vxNUS/Xanui+3GVpTc817a6RIebiSDKy8JdxYbu7irx1e5Lk
	 l0KKVRgcevJ3g==
Date: Mon, 28 Jul 2025 20:19:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Bart Van Assche <bvanassche@acm.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: core: move some irq handling back to hardirq
 (with time limit)
Message-ID: <oadtogfaguydzayg6vsw5rbonterhdy7e7iqsvq64vffl7ha5v@akw4t4brrkyg>
References: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
 <2e7c2be8-dc58-4e18-9297-e8690565583b@acm.org>
 <bc14b93d49ee5ec022c29d5c5568c2c1d1c52ab1.camel@linaro.org>
 <cdpppjy6hljvr3duzc2y2dov27geclujdrvcxpllhazrbyhf7c@z4y7gt6siryy>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdpppjy6hljvr3duzc2y2dov27geclujdrvcxpllhazrbyhf7c@z4y7gt6siryy>

On Mon, Jul 28, 2025 at 08:12:39PM GMT, Manivannan Sadhasivam wrote:
> On Fri, Jul 25, 2025 at 04:00:42PM GMT, André Draszik wrote:
> > On Thu, 2025-07-24 at 09:02 -0700, Bart Van Assche wrote:
> > > On 7/24/25 2:54 AM, André Draszik wrote:
> > > > @@ -5656,19 +5689,39 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
> > > >   	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
> > > >   		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
> > > >   		  hba->outstanding_reqs);
> > > > -	if (queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
> > > > -		/* Do not complete polled requests from interrupt context. */
> > > > +	if (time_limit) {
> > > > +		/* Do not complete polled requests from hardirq context. */
> > > >   		ufshcd_clear_polled(hba, &completed_reqs);
> > > >   	}
> > > 
> > > This if-statement and the code inside the if-statement probably can be
> > > left out. This if-statement was introduced at a time when the block
> > > layer did not support completing polled requests from interrupt context.
> > > I think that commit b99182c501c3 ("bio: add pcpu caching for non-polling
> > > bio_put") enabled support for completing polled requests from interrupt
> > > context. Since this patch touches that if-statement, how about removing
> > > it with a separate patch that comes before this patch? Polling can be
> > > enabled by adding --hipri=1 to the fio command line and by using an I/O
> > > engine that supports polling, e.g. pvsync2 or io_uring.
> > 
> > Bart, thank you for taking the time to explain and the background info on
> > this, very helpful!
> > 
> 
> Yeah, I realized it after hitting 'y' in mutt. Added now.
> 

Oops, wrong thread. Please ignore the above message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

