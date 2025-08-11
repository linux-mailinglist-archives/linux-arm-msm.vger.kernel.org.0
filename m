Return-Path: <linux-arm-msm+bounces-68523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 353ADB21134
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 983525014C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B702E0909;
	Mon, 11 Aug 2025 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q08EK/7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363052DECA3;
	Mon, 11 Aug 2025 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927431; cv=none; b=W9wuUAX31v6tbv3QidcVzLqF9SfCMQDpvc71Bt/vDSSrslzQ46gOM4PXY72WgrTlKxUQVoafFFHZLNTRE7kR2vCjBV9EXa9YQuu0JRTAOGpVuEQbpdko9iDG4M/jtMMW0RYdnXuH2sXJgDr7K6Cxf1eIQoIPAGpUFIsF8k+5NAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927431; c=relaxed/simple;
	bh=xz5SsscxKSvb837vq9ZUhdv9db22CG35nOkoNIMi8HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqaFtBy+InK7fC0syZV0jBkJAPw94b9LtZF+O+uKCbwsKcpgNupkUCHIjmm3jd4/4J8gJMBGKiAICmUvnBQRg9h6f2gyWlkOPo85xEbtOy7FFo6Of4XbfiVa9oh4zPuZSuhluZDBiEUfLgGYR9JQCmyHKbVpUKgF9l6uNNXHjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q08EK/7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9228CC4CEED;
	Mon, 11 Aug 2025 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754927430;
	bh=xz5SsscxKSvb837vq9ZUhdv9db22CG35nOkoNIMi8HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q08EK/7GHBssiZw8op5dwHH01YjSrLS+vTvGeX2ipEeo4sQ6g8vVlIdr39/fFpQLu
	 vYdWPRkUz3Ko+Loo643LYY0V80TLhXAjzdF8SouifuFxPCJ4i8+xbTu68NDQr5rQkZ
	 gd3maA4A591/fDF056ZxnBhPKHOf7Fb1mcucQlq0Kl5sD08b8tdt6GI4CUWo8uc2t/
	 HQ2o15UrQ3uYP74g3mxOK5dTv9fRRIAVib3/E3WIFUtI4z1rrj4lY8Ck4XQirGN2wN
	 7ZKSjKeg4VAdMqlJmDf5XqirhlAHLzbxxeUK2mWDmnlILKboc8AL85Thru8cB/+hsu
	 KMeyV2c6xu0WA==
Date: Mon, 11 Aug 2025 10:50:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, 
	conor+dt@kernel.org, bvanassche@acm.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <kwp3q4r5rzahzro5f6l6ml24vbiutyxokrhjsbtzcb5kvanx5e@elagxv6w5dq7>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <8c7f8cfc-2090-449e-b6ec-688a0021bac4@oss.qualcomm.com>
 <14566f49-7f7b-4583-98b7-8a473054f7c3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14566f49-7f7b-4583-98b7-8a473054f7c3@sirena.org.uk>

On Thu, Aug 07, 2025 at 08:09:56PM +0100, Mark Brown wrote:
> On Thu, Aug 07, 2025 at 07:43:15PM +0200, Konrad Dybcio wrote:
> > On 8/7/25 7:26 PM, Mark Brown wrote:
> 
> > > Note that that's specifying OPPs which is different...
> 
> > The microamp properties are in the top-level, not under OPP if
> > that's what you meant
> 
> I mean the OPPs use case is an existing well known one for dumping stuff
> into DT.
> 
> > > That doesn't mean that it's a good idea to put that information in the
> > > DT, nor if it is sensible to put in DT does it mean that it's a good
> > > idea to define a generic property that applies to all regulator
> > > consumers which is what I now think Konrad is proposing.
> 
> > Yeah, that's what I had in mind
> 
> > I was never able to get a reliable source for those numbers myselfe
> > either.. At least some of them are prooooobably? chosen based on the
> > used regulator type, to ensure it's always in HPM..
> 
> That's what set_mode() is for.  Like I say it's becoming less and less
> relevant though.
> 

set_mode() just applies the mode to the regulator_dev, so in cases where
you have multiple consumers of a regulator_dev things would break.

Further, there are numerous cases where we have multiple consumers each
needing a "low" mode, but their combined load requires a "high" mode.

set_load() and its aggregation of the inputs deals with both of these
issues.


Whether mode setting is becoming less relevant in our hardware, that I
don't have the definitive answer to.

> > That said, our drivers cover a wide variety of hardware, built on a
> > wide variety of process nodes, with different configurations, etc.,
> > so it's either polluting the DT, or polluting the driver with
> > per-compatible hardcoded data (and additional compatibles because
> > fallbacks wouldn't work most of the time)

If this is our reason for putting it in DeviceTree, then we should write
that in the commit message :)

> 
> That's really not a persuasive argument for adding a genric property
> that applies to all regulator consumers...
> 

I agree, even if we determine that this belongs in DT, because it needs
to be tweaked on a per-board basis, it's still only applicable to a
fraction of our device nodes.

Regards,
Bjorn

> My instinct with this stuff is generally to avoid putting it in the DT,
> we see far too many instances where someone's typed some numbers in
> wrongly or discovers the ability to drive the hardware harder and needs
> to tune the numbers - once something is ABI you're stuck just trusting
> the numbers.  That said I'm not going to stop you putting something
> specific to this driver in there, I just don't think this is a good idea
> as a generic property.


