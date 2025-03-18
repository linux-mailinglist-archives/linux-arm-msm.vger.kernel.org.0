Return-Path: <linux-arm-msm+bounces-51689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3EA66DD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 790D41893E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781631EF365;
	Tue, 18 Mar 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8Y7XW7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B01E8356;
	Tue, 18 Mar 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742285797; cv=none; b=on2OOY+8zI0BoK+IyvFZSnQAoDv6NMv5BLV02NVqSGu5/UCCxuDsvv1/mfraZr/uhrlMXYhIsQJ8wvzTKrD4S6Rn90TvSP3ybvu5pUnNu0UQa25bKMutOs5osCGoZjJMSg2Zn+NiOGg15KIsxFcDndhwDZzGXFygxwUcYf5dUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742285797; c=relaxed/simple;
	bh=ctxArK0RpxAFnJgXHJlRkE8b4/gTvieT1jUwQ07e0jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVxTWogbsurgP7T+xgtuEHp3IewnRbH2UvYvPK1SeJvLeEVlep0zTHS3ZAAOKZsxlGsDwFW8MBh3C6StFnxHrk8fGLEK4q2Fpy096dhcjlz3RaBZAD6e7mtqFZGiCL0dqiLLAhrMHkiH4YXUhYYqhMgCDx5U6KjICxV41R9fnww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8Y7XW7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCB1C4CEDD;
	Tue, 18 Mar 2025 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742285797;
	bh=ctxArK0RpxAFnJgXHJlRkE8b4/gTvieT1jUwQ07e0jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8Y7XW7hzpfItFHELZ/8j1dQL2eDtHW9hAeFsBoh+Pp3wmMaT1DpgSeWP+diyzkWp
	 fedNDoTih7mCcRUmSh4fzwGcE0k5SRvpSZnjhZjbNRNgWrCTur5r9SvoWobN/GJstl
	 yLgWUrpvNiEd7f5CxKHWhWF/UgUvwaBRCZcJAx3ogxnnAjeQWuZS4WhjzgWl7EDmpR
	 bH9fKGn/GeUtG8ov/l0oKt8Ku0lV2ES5MUbthZWiAts6zV3BTL/2sRz6Tu2MGsEZHS
	 FI8VRl4eKBdgoDad70jALtXRXJCvE8XYcQVyDqLDSy1WzKoVJEiRLwY59iTxVIKzzk
	 720J+HyDVPj8w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tuS7o-000000004IM-0Crf;
	Tue, 18 Mar 2025 09:16:36 +0100
Date: Tue, 18 Mar 2025 09:16:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z9kr5ABbqO27_BM-@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
 <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>

Hi Cristian,

On Mon, Mar 03, 2025 at 11:53:52AM +0100, Johan Hovold wrote:
> On Thu, Feb 27, 2025 at 08:34:44AM +0000, Cristian Marussi wrote:
> > On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:
> 
> > > Something like that, yes. :) I didn't try to implement it, but it seems
> > > like it should be possible implement this is a way that keeps the quirk
> > > handling isolated.
> > 
> > I hope next week to have a better look at this, in tne meantime just a
> > few considerations....
> > 
> > Sooner or later we should have introduced some sort of quirk framework
> > in SCMI to deal systematically with potentially out-of-spec FW, but as
> > in the name, it should be some sort of framework where you have a table of
> > quirks, related activation conditions and a few very well isolated points
> > where the quirks are placed and take action if enabled...this does not
> > seem the case here where instead an ad-hoc param is added to the function
> > that needs to be quirked...this does not scale and will make the codebase
> > a mess IMHO...
> 
> Sounds good. At least we have a good understanding now of how this
> particular firmware is broken so it would be great if you could use
> this as a test case for the implementation.
> 
> In summary, we need to force the use of a fast channel for
> PERF_LEVEL_GET on these machines, or possibly fall back to the current
> behaviour of only using the domain attribute to determine whether the
> fast channels should be initialised.
> 
> The latter may allow for a less intrusive implementation even if we'd
> still see:
> 
> 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
> 
> when not supported for all messages (e.g. with the current firmware).

> > Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
> > up and see if I can prototype something generic to deal with quirks, possibly
> > next week...

Have you made any progress on the quirk framework prototyping?

Do you need any input from Sibi on the protocol versioning for that?

We'd really like to enable cpufreq on this platform and ideally in 6.15.
I think that should be possible given that we now understand in what
ways the firmware is broken and what is needed to handle it even if we
still need to decide on how best to implement this.

Johan

