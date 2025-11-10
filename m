Return-Path: <linux-arm-msm+bounces-81031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C812C47292
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878BB3BC3C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B6C313537;
	Mon, 10 Nov 2025 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8vg/nax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526E313522;
	Mon, 10 Nov 2025 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784668; cv=none; b=orztZDLcWZZf89VTBZdjVkGXRsoIhBnlFNf0VEM9rOC8Hz79Vups/+U/X+tmwIhTYoXUO8FN30oM98uIE2Wofn4HK+m6aXSecpIn9vyyzw1A55jNWMgxActRJftf5AkGsNk/s6ezrEJlvBPpxPElw9sVlHP0ga181Z6oXchS2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784668; c=relaxed/simple;
	bh=GaKv8q6+/jqwS770QPc+kVw036xa5WBZMlcSt21L4v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3c95Fibbv+ngIrXSFvt8KeI71CqQJ4gCtjgm6ombTri39aJzWHG6xDwu772Poa9sZ6CpY5ecOEwOgOcMvSlFwtNg00h1UeCjrLfTuwC8jy7klB/wMQZPKIB3IDOH5r5E4qMrHFJXKHVhXPfR29W4a1LU4ebdkIlL0MQS/evC5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8vg/nax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E6DC16AAE;
	Mon, 10 Nov 2025 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762784667;
	bh=GaKv8q6+/jqwS770QPc+kVw036xa5WBZMlcSt21L4v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8vg/nax9wtAltYG7PrG7pIwys+BgVU8AxVxEbt3u2AxTvlnShqwlZ7K3cU8bf5H8
	 1iQk+gbSYciAw105VvJ2KKf4r1BeRvDmpHaWoJnNkN85ZWICW/fnXHR/dbXGB9DjSH
	 24UJa37oo1eS404v+118BUH8jGDvvl7xrUVgIqIG3HnRke5VAwumJyW8P0zJIB7RXH
	 zdfD1xJI9EMN/YKz8kf79DhBum7gZHLIGeK5uj1BRCNgz+egQhfLN/fkIdeXWbz7d9
	 fP0EtWA0/knHpiV1RX4vrhWGBb63YjBk4NqoJdgeW0VRfM20ydMk5S7XkY/l3d913v
	 yZ0fvfGW7PkRg==
Date: Mon, 10 Nov 2025 08:28:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com
Subject: Re: [PATCH v2 1/3] bus: mhi: host: Add loopback driver with sysfs
 interface
Message-ID: <3r5biv2frrk4bjtdqulmpruieaocrktrfxwwq5f3xossjikyef@hoxb4fgitjqs>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
 <20251104-loopback_mhi-v2-1-727a3fd9aa74@oss.qualcomm.com>
 <g7yr3psfoyya76wvcgjs24xyyofgkllmdsvworjnfjgc3q3qeq@vjkxyh5oabkd>
 <zkhtvquyhgvdqcft6s3jmfjh76hg62mrwn4wj4qqoecrxprq4y@w5zvgp5vbbn2>
 <5pfglosaovwja7lgxmjc56jieo6whcugnmvh6krydzfpdynmqe@qfswxlfuvw4n>
 <fae5pl3su5mul7qnaealqvsgq37m6hlj2ckabrbjj55dqrixxw@q2dbbuq7pikw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fae5pl3su5mul7qnaealqvsgq37m6hlj2ckabrbjj55dqrixxw@q2dbbuq7pikw>

On Mon, Nov 10, 2025 at 11:56:11AM +0530, Manivannan Sadhasivam wrote:
> On Sun, Nov 09, 2025 at 10:00:26PM -0600, Bjorn Andersson wrote:
> > On Fri, Nov 07, 2025 at 05:58:18PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Nov 05, 2025 at 04:17:41PM -0600, Bjorn Andersson wrote:
> > > > On Tue, Nov 04, 2025 at 11:09:05AM +0530, Sumit Kumar wrote:
> > > > > Add loopback driver for MHI host controllers that provides sysfs based
> > > >   ^--- Here would be e good place to explain why we want this driver. Per
> > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > start your commit message with a description of the problem you're
> > > > solving.
> > > > 
> > > > > testing interface for data path validation. The driver supports the
> > > > > "LOOPBACK" channel and offers configurable test parameters.
> > > > > 
> > > > > Sysfs interface provides:
> > > > > - size: Configure TRE size
> > > > > - num_tre: Set number of TREs for chained transfers
> > > > > - start: Initiate loopback test
> > > > > - status: Read test results
> > > > 
> > > > The words "loopback" and "testing" gives clear indications that this
> > > > should live in debugfs and not sysfs.
> > > > 
> > > 
> > > Though the wording gives an impression like that, this interface is for a MHI
> > > channel that is defined in the MHI spec, so it is perfectly fine to have it
> > > exposed as a sysfs interface to the users. This channel is intented to be used
> > > for MHI protocol testing.
> > > 
> > 
> > The fact that the protocol is defined in the specification doesn't imply
> > that it's intended to be used by the typical user.
> > 
> > Also, the specification defines the LOOPBACK channel, it doesn't define
> > an interface where the user can request that a certain number of packets
> > of random data is sent and if those come back we can learn about that
> > from a "results" file. Downstream has a completely different
> > implementation of the same specification.
> > 
> > I could imagine that at some point one would want extend this test
> > interface by altering the behavior of the packet generator, inject
> > timestamps etc - to measure raw throughput, latency, jitter etc. Good
> > reasons for not turning this into an ABI.
> > 
> 
> I missed one important point while replying. This channel has an existing
> interface between the host and endpoint i.e., the MHI based WLAN and modems out
> there in the field already support an *interface* on top of this channel.

But, that defines what happens "on the wire", right?

The MHI specification doesn't state that you have to expose this to the
user in the form of taking a "size" and a "num_tre" number and then
expose a "start" knob which performs a loopback test, of which result
you can then find in a "status" file?

> We
> cannot control the interface unless we change the endpoint firmware (which is
> not feasible).

You're already changing the user-facing interface, because downstream
this is implemented using UCI...and I bet it's not sysfs files in
Windows...

> And all the future extensions could only be possible if we could
> modify the endpoint fw.
> 

I'm not talking about extensions to the protocol, or how the endpoint is
supposed to react.

I'm saying that it should be perfectly fine to have a test that just
fills the out-pipe with packets containing say the current timestamp,
and when they return I compare the timestamp in the payload with the
clock to see how long time the particular message took to loop back.
Same LOOPBACK protocol, different user-interface.

> So for this specific reason, going by the sysfs ABI made sense to me. But to
> admit, this point was never mentioned in the cover letter or in the patch
> description and need to be fixed.
> 

I think you should include a comment in the driver as well, stating that
the user-facing interface is ABI and the MHI LOOPBACK protocol defines
that the payload has to be random etc. If that is the case...

> I also asked the Qcom PCIe team to verify that this interface, just works with
> all kind of MHI devices if the devices support the LOOPBACK channel.
> 
> > 
> > Thinking more about the use case, I also presume most MHI devices has a
> > LOOPBACK channel, so every user is going to have this .ko auto-loaded,
> > just so that they can poke sysfs to send some random data... So perhaps
> > we should omit MODULE_DEVICE_TABLE()?
> > 
> 
> I don't want to omit the MODULE_DEVICE_TABLE() since that will require users to
> load the driver manually to use it.

Fair enough.

> If users do not want this interface, then
> they can always decide not to enable the driver while building the kernel :)
> 

I expect even you will use this interface approximately 0% of the times
you boot the kernel. _Users_ will never use it.

So, I guess per your suggestion, we leave this disabled everywhere
(defconfig, distros etc), and then those few _developers_ who want it
can enable it?

Regards,
Bjorn

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

