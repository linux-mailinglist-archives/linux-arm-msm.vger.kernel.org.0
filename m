Return-Path: <linux-arm-msm+bounces-66877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF20AB13D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E467ABDAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C69126D4E2;
	Mon, 28 Jul 2025 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bi3DUMBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02062686A0;
	Mon, 28 Jul 2025 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753713760; cv=none; b=Jfh0gEm9OjZPb7ivQPC4pLljGuECF81yxymfg5HLczCF1mmIgo9b4OIqi8JrPpOAL4GRxqp8idw+kJ/IMePDgwNgcUh8niFF6PiUvp96zcl/1eufqihpRVi5qdNrhrw9FnxkkwmyTr9NRRN/76wnPTbU6IKRupd6QDUo1qo6LRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753713760; c=relaxed/simple;
	bh=HkJFJCc+y/1YRjoXccCYzwtPnDEpAkBXbvQXlsll7wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+3s4lDG+F23AU536aciMzwRK944ntvNo9QDJeg3Omc3NDKQ2DA1bhFAfNAWhAy+C4aBw+Y3JNTPHutKjUY4KseG1QqHO4rwJsGeht+k/2jxZjBZCaBmc/Lkg/TztGgKK6bG0IfCaSI0EfdVAnBRBG3LLrpEl57ew1X/RsoF9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bi3DUMBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A2FC4CEE7;
	Mon, 28 Jul 2025 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753713759;
	bh=HkJFJCc+y/1YRjoXccCYzwtPnDEpAkBXbvQXlsll7wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bi3DUMBMV9Yyl8mMsVA2wNZ9TiRS2dtiJsomOl0sS2B04CYJAhzxr/Ti0My8OMVZ9
	 1BwkcA2yYv6bu4OXKqs9rv0cszb+PkSugd3c19L1JZz7nIJFIxLt5p403mdvnTwCpd
	 h54JMQZkcwS+5uQRyZZt6XtqiWXNv8gT+ggnzn0zt5K1pxwviRTEHDtErYiuTikN+i
	 +zekugSEEN8WIfYRMkKHpzOWYKsfid8iSbb1s4J86uMfoaWk3NSUWdA8mCFvMuHyG2
	 BQEG2IkaPl54TmmWevbsFpJFSTcHzKMcvLBuDlhN2igoGWzYkniEe/B6ZefzA6Netg
	 LU3cfCXSv8bQA==
Date: Mon, 28 Jul 2025 20:12:30 +0530
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
Message-ID: <cdpppjy6hljvr3duzc2y2dov27geclujdrvcxpllhazrbyhf7c@z4y7gt6siryy>
References: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
 <2e7c2be8-dc58-4e18-9297-e8690565583b@acm.org>
 <bc14b93d49ee5ec022c29d5c5568c2c1d1c52ab1.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc14b93d49ee5ec022c29d5c5568c2c1d1c52ab1.camel@linaro.org>

On Fri, Jul 25, 2025 at 04:00:42PM GMT, André Draszik wrote:
> On Thu, 2025-07-24 at 09:02 -0700, Bart Van Assche wrote:
> > On 7/24/25 2:54 AM, André Draszik wrote:
> > > @@ -5656,19 +5689,39 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
> > >   	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
> > >   		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
> > >   		  hba->outstanding_reqs);
> > > -	if (queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
> > > -		/* Do not complete polled requests from interrupt context. */
> > > +	if (time_limit) {
> > > +		/* Do not complete polled requests from hardirq context. */
> > >   		ufshcd_clear_polled(hba, &completed_reqs);
> > >   	}
> > 
> > This if-statement and the code inside the if-statement probably can be
> > left out. This if-statement was introduced at a time when the block
> > layer did not support completing polled requests from interrupt context.
> > I think that commit b99182c501c3 ("bio: add pcpu caching for non-polling
> > bio_put") enabled support for completing polled requests from interrupt
> > context. Since this patch touches that if-statement, how about removing
> > it with a separate patch that comes before this patch? Polling can be
> > enabled by adding --hipri=1 to the fio command line and by using an I/O
> > engine that supports polling, e.g. pvsync2 or io_uring.
> 
> Bart, thank you for taking the time to explain and the background info on
> this, very helpful!
> 

Yeah, I realized it after hitting 'y' in mutt. Added now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

