Return-Path: <linux-arm-msm+bounces-51763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65851A67826
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E67EC17CB0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5211819C56C;
	Tue, 18 Mar 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaRF461u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED128FD;
	Tue, 18 Mar 2025 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312459; cv=none; b=LjrugoYeDZ5PTDn1sLFeD9KIFfsMuT+sVLnzTT4rCDAaSIYXG9iyTOkBIT5/fgr3gm89OecnqQITHAl8P18rxhqh/QqmuWb9eaN7fJ7fO939j/mX5VMhykY2gIgkP91Ky51ai3r9cpnu7yBtdBG2cjSbU3nuW9ydE3fzNZyWW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312459; c=relaxed/simple;
	bh=8XU+uzlDIVHp8KPdPZ+SQ58qTW7pc8uMOtHULNZO6zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLmLFxgWWuQPgenn3iubBoo0Ah65lf1zlHhxJd9KYYpmKQ1YRZA6fKHu2QxJf95fueT+oYw3Zb3cU/gDyfg5QmISthyTGEiVQAvdYJGt4ET4zuMHdXKSxcoXDLry1B+dICUkQmJaJ6DQy3bLH9GrnbZYJQx4O/K+2q+MtKQzGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaRF461u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867C7C4CEDD;
	Tue, 18 Mar 2025 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742312458;
	bh=8XU+uzlDIVHp8KPdPZ+SQ58qTW7pc8uMOtHULNZO6zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaRF461uLgkFESqexYg+JyYJMVoKk5NVmQR7HipojvNON3b7EmXQ/MgTOZZXIrj/n
	 TklI1rzC65IMk6/Bh4u0wwQfRquGxxdKAqbzvqiEv1QLeU2poojlDmVtE+yK0krYag
	 DY4pcVj6FJa9zOduwD346Hp5rLoKkgldHkPSjCSbkg1o6uFIn4Rny07ogHt0dJn4Ww
	 NuLMpvLTwcCrmknhC2aHFplU/4nsaOR7L1TVrYhhC6KdeAgrF1m5Dq1ShyjJIlJJYZ
	 h+LSeTYbOfu5mEQL7x5NYVGru0KQ40gOO4rSIdm0yED7zr5CHi2bNvvnnh3x0NzziO
	 v3B0EFuEDtgBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tuZ3q-000000006vp-47Uz;
	Tue, 18 Mar 2025 16:40:59 +0100
Date: Tue, 18 Mar 2025 16:40:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z9mUCmQW7L3yx7qt@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
 <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
 <Z9kr5ABbqO27_BM-@hovoldconsulting.com>
 <Z9l1L1WICMYXSoIu@pluto>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9l1L1WICMYXSoIu@pluto>

On Tue, Mar 18, 2025 at 01:29:19PM +0000, Cristian Marussi wrote:
> On Tue, Mar 18, 2025 at 09:16:36AM +0100, Johan Hovold wrote:

> > Have you made any progress on the quirk framework prototyping?
> 
> I have not forgot, tried a few things, but nothing really to post as of
> now...dont wnat to rush either .... I was hoping to push something out at
> the end of this next merge window...
> 
> > Do you need any input from Sibi on the protocol versioning for that?
> 
> No I am fine, I am planning anyway for something generic enough to be
> easy then to plug your own quirks separately...

Sounds good, thanks.

> > We'd really like to enable cpufreq on this platform and ideally in 6.15.
> > I think that should be possible given that we now understand in what
> > ways the firmware is broken and what is needed to handle it even if we
> > still need to decide on how best to implement this.
> 
> v6.15 seems hard/impossible even using the original Sibi patch 
> given the usual upstreaming-timeline of the SCMI stack where everything has
> to be usually reviewed and accepted by rc4/rc5.....so both Sibi initial
> patch and my own babbling were alreaady sort of late.

Yes, sorry, I wasn't referring to Sibi's SCMI patches, but the
devicetree changes needed to enable cpufreq on these platforms (that
will go through the qcom tree).

It may be a little late for that too, but with an understanding of the
problem and a quirk implementation around the corner, we could enable
cpufreq as long as we make sure that Sibi's per-channel FC fix (that
addresses the FC warnings) is not merged without the quirk in place (to
avoid the crashes).

Johan

