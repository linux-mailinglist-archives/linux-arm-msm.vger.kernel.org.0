Return-Path: <linux-arm-msm+bounces-80915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE1C45135
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C3534E19B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 06:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41587221F26;
	Mon, 10 Nov 2025 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMH1vK7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B095A926;
	Mon, 10 Nov 2025 06:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762755983; cv=none; b=R1eZQMUKXvFJTSqtzYifyob6dGv9GSu5jcy6c+sAYsM64bDEky7WivfYVT6tqX5mR5EhMPtBf4OELTUW5cipyCb9oUe6uM1c6M9kcgBUR7Ot9UpJTAG5DovLFvqvMVBkbzr8PKTAAsUbvxrA+6oby6UWMhzUXEeDB5UI+AwzVdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762755983; c=relaxed/simple;
	bh=nIzsOd/QzZdIzmfQ95EuRwsHBn8CkRY/XSv7X2cO2sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjO5VpPuWJAE703Hkj6hF5vjS6zENtpZEBLpINvFiotFAjYDZ1mJYGdrIowereA9iDiBmxf4m/C8f69Ijbgb6s6FTgW8ejQG0O97FqlzKBNz8b4AKqdYWX7g5Bwky7Ckd0nUNCcowZ705jyLYw+RSKGW58FETeh/egPvwQr4Zo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMH1vK7a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6C9C19421;
	Mon, 10 Nov 2025 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762755982;
	bh=nIzsOd/QzZdIzmfQ95EuRwsHBn8CkRY/XSv7X2cO2sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMH1vK7aSEtTI+tx/lXde7cWNMMNr1alGYm+tr0hLLbau2/dyDztYcjPztDCTegi+
	 avO5q3O7g+MNrPdMAH6/0EIFTQYWczlQEFlKprIFO/4RyQtHzoNJXxX2mECpUNm7SA
	 CwtCwggH6JjdbODlqKmswKwivBJHBf7oVQ6lBQFYmUP8Alva8qT8fUzVgAOeiKjFUl
	 SQ3ER4LQ0ny5f5Y/qjsQIDb0JKsgzKTDbnXk1xu7wE+v8rXeeG+UV8ReQXhAtgKfTB
	 ImaoTgDzpApv0AcNTessXOhyLv/k/w9HGngSNUEGeR3ibQ72paP6+ne2s0oD3GQk/8
	 cTI46p/wGCdpg==
Date: Mon, 10 Nov 2025 11:56:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com
Subject: Re: [PATCH v2 1/3] bus: mhi: host: Add loopback driver with sysfs
 interface
Message-ID: <fae5pl3su5mul7qnaealqvsgq37m6hlj2ckabrbjj55dqrixxw@q2dbbuq7pikw>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
 <20251104-loopback_mhi-v2-1-727a3fd9aa74@oss.qualcomm.com>
 <g7yr3psfoyya76wvcgjs24xyyofgkllmdsvworjnfjgc3q3qeq@vjkxyh5oabkd>
 <zkhtvquyhgvdqcft6s3jmfjh76hg62mrwn4wj4qqoecrxprq4y@w5zvgp5vbbn2>
 <5pfglosaovwja7lgxmjc56jieo6whcugnmvh6krydzfpdynmqe@qfswxlfuvw4n>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5pfglosaovwja7lgxmjc56jieo6whcugnmvh6krydzfpdynmqe@qfswxlfuvw4n>

On Sun, Nov 09, 2025 at 10:00:26PM -0600, Bjorn Andersson wrote:
> On Fri, Nov 07, 2025 at 05:58:18PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Nov 05, 2025 at 04:17:41PM -0600, Bjorn Andersson wrote:
> > > On Tue, Nov 04, 2025 at 11:09:05AM +0530, Sumit Kumar wrote:
> > > > Add loopback driver for MHI host controllers that provides sysfs based
> > >   ^--- Here would be e good place to explain why we want this driver. Per
> > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > start your commit message with a description of the problem you're
> > > solving.
> > > 
> > > > testing interface for data path validation. The driver supports the
> > > > "LOOPBACK" channel and offers configurable test parameters.
> > > > 
> > > > Sysfs interface provides:
> > > > - size: Configure TRE size
> > > > - num_tre: Set number of TREs for chained transfers
> > > > - start: Initiate loopback test
> > > > - status: Read test results
> > > 
> > > The words "loopback" and "testing" gives clear indications that this
> > > should live in debugfs and not sysfs.
> > > 
> > 
> > Though the wording gives an impression like that, this interface is for a MHI
> > channel that is defined in the MHI spec, so it is perfectly fine to have it
> > exposed as a sysfs interface to the users. This channel is intented to be used
> > for MHI protocol testing.
> > 
> 
> The fact that the protocol is defined in the specification doesn't imply
> that it's intended to be used by the typical user.
> 
> Also, the specification defines the LOOPBACK channel, it doesn't define
> an interface where the user can request that a certain number of packets
> of random data is sent and if those come back we can learn about that
> from a "results" file. Downstream has a completely different
> implementation of the same specification.
> 
> I could imagine that at some point one would want extend this test
> interface by altering the behavior of the packet generator, inject
> timestamps etc - to measure raw throughput, latency, jitter etc. Good
> reasons for not turning this into an ABI.
> 

I missed one important point while replying. This channel has an existing
interface between the host and endpoint i.e., the MHI based WLAN and modems out
there in the field already support an *interface* on top of this channel. We
cannot control the interface unless we change the endpoint firmware (which is
not feasible). And all the future extensions could only be possible if we could
modify the endpoint fw.

So for this specific reason, going by the sysfs ABI made sense to me. But to
admit, this point was never mentioned in the cover letter or in the patch
description and need to be fixed.

I also asked the Qcom PCIe team to verify that this interface, just works with
all kind of MHI devices if the devices support the LOOPBACK channel.

> 
> Thinking more about the use case, I also presume most MHI devices has a
> LOOPBACK channel, so every user is going to have this .ko auto-loaded,
> just so that they can poke sysfs to send some random data... So perhaps
> we should omit MODULE_DEVICE_TABLE()?
> 

I don't want to omit the MODULE_DEVICE_TABLE() since that will require users to
load the driver manually to use it. If users do not want this interface, then
they can always decide not to enable the driver while building the kernel :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

