Return-Path: <linux-arm-msm+bounces-80900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D6CC44DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 04:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 038784E6E17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 03:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9F428B407;
	Mon, 10 Nov 2025 03:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmlwjeyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2D14A4CC;
	Mon, 10 Nov 2025 03:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762746983; cv=none; b=XDTkGYLeT7GbTa8Pdpc+dU+3dVc9CcTmd9OrANhC3dWBD8BUGn2aV+f09A/61pSVlz/zZGbGkfnb+bDk187zF8eHdYxQqCslo85cHNc42SaQGx1VkE71VmTmgqwIT/EsSghXC7F+RcYHrDMu/UXIaGvEuCMqbJYFtWCoAFN4Yc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762746983; c=relaxed/simple;
	bh=Ko6UTuObw8qUA0cDGOYIoZibQbucSDCxolu3fam2u+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnVjOYSuCa60zTfNyrL8s7rPY8mvNH5vf4ojUsbZ/x9g0IuYRJ0ydNslDOyQnXAOdL88IotPLDayyRJ8sfu/If0YYDxMmRj5HlvPGlXyel2fYmJ7uvq5kYvbkcQrjJAgspsq6y2Fdqh4NKv2lWFRT05jfY1mmYpDgKe4ueyNIg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmlwjeyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E48C113D0;
	Mon, 10 Nov 2025 03:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762746982;
	bh=Ko6UTuObw8qUA0cDGOYIoZibQbucSDCxolu3fam2u+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmlwjeyHn/Ccc3vEKx9dqE3NRvkrqpyf6RN5WOhVI/tO2wQmiBTQ7+Ny+y/30KlNA
	 GAJ++XWS/CnyrMFeKINkfHU77/EhTv2stVsNumUZQkuBp+C5OqlLU6CZGD0fNuUwpJ
	 7IYf96uXKcRiNUVeWInLeiWD6PA8j3JFWrf+hPqcq+ht9Cbw1wDjd0bdY5yNn5T/y/
	 EH/G/goa1PdbMTdI13/ILx8463cg6beXJ3vkP0YC64vFaQ98Df8+YYWF4drGo4HuY2
	 uANpXu8FQ8lsbSS33BeXnf4IHNizVi3PID+PEHq5T0/Tb2ABvA/se6/4dOwoLkuVMI
	 yPzuOqdWr3TsQ==
Date: Sun, 9 Nov 2025 22:00:26 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com
Subject: Re: [PATCH v2 1/3] bus: mhi: host: Add loopback driver with sysfs
 interface
Message-ID: <5pfglosaovwja7lgxmjc56jieo6whcugnmvh6krydzfpdynmqe@qfswxlfuvw4n>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
 <20251104-loopback_mhi-v2-1-727a3fd9aa74@oss.qualcomm.com>
 <g7yr3psfoyya76wvcgjs24xyyofgkllmdsvworjnfjgc3q3qeq@vjkxyh5oabkd>
 <zkhtvquyhgvdqcft6s3jmfjh76hg62mrwn4wj4qqoecrxprq4y@w5zvgp5vbbn2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zkhtvquyhgvdqcft6s3jmfjh76hg62mrwn4wj4qqoecrxprq4y@w5zvgp5vbbn2>

On Fri, Nov 07, 2025 at 05:58:18PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Nov 05, 2025 at 04:17:41PM -0600, Bjorn Andersson wrote:
> > On Tue, Nov 04, 2025 at 11:09:05AM +0530, Sumit Kumar wrote:
> > > Add loopback driver for MHI host controllers that provides sysfs based
> >   ^--- Here would be e good place to explain why we want this driver. Per
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > start your commit message with a description of the problem you're
> > solving.
> > 
> > > testing interface for data path validation. The driver supports the
> > > "LOOPBACK" channel and offers configurable test parameters.
> > > 
> > > Sysfs interface provides:
> > > - size: Configure TRE size
> > > - num_tre: Set number of TREs for chained transfers
> > > - start: Initiate loopback test
> > > - status: Read test results
> > 
> > The words "loopback" and "testing" gives clear indications that this
> > should live in debugfs and not sysfs.
> > 
> 
> Though the wording gives an impression like that, this interface is for a MHI
> channel that is defined in the MHI spec, so it is perfectly fine to have it
> exposed as a sysfs interface to the users. This channel is intented to be used
> for MHI protocol testing.
> 

The fact that the protocol is defined in the specification doesn't imply
that it's intended to be used by the typical user.

Also, the specification defines the LOOPBACK channel, it doesn't define
an interface where the user can request that a certain number of packets
of random data is sent and if those come back we can learn about that
from a "results" file. Downstream has a completely different
implementation of the same specification.

I could imagine that at some point one would want extend this test
interface by altering the behavior of the packet generator, inject
timestamps etc - to measure raw throughput, latency, jitter etc. Good
reasons for not turning this into an ABI.


Thinking more about the use case, I also presume most MHI devices has a
LOOPBACK channel, so every user is going to have this .ko auto-loaded,
just so that they can poke sysfs to send some random data... So perhaps
we should omit MODULE_DEVICE_TABLE()?


That said, these are merely my humble opinions. If you think it's
broadly useful in this form, please proceed.

Regards,
Bjorn

