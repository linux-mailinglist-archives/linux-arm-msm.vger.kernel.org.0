Return-Path: <linux-arm-msm+bounces-47999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C39A35998
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1931316F084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 09:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875AE22A4C3;
	Fri, 14 Feb 2025 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/xkqLGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580822135B3;
	Fri, 14 Feb 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523716; cv=none; b=MuMAiSMoMPephlDzqPSzOTOOMaQcZ00j2AAGyf+rrIXC3DQF/ZjEJQlTmciQKGzL/bwNnFTshB/6grisi6P04LVcAlXppJGLELceBb0uMOYmmIbECutWfzjkb7SAT80b3866pcV+5S/KGHiOwIxPav30fjybhL2mXa1ZtHCC0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523716; c=relaxed/simple;
	bh=EgLgzCrv/qBPOyDd4OU9mDEx8AfdL88weeWAthnioMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K01/Ofgvx2ybxU1x5oIl9aYqt0cYlsyrtu24ZnM9mCulkuBv66QKIAt2TFq2vYpY9GxiR6h1HnxXsee0qi7PvG5tZy4+QPwyosjuy5/tdM5yG0On1SrdBRKm1ZUEDNNnm76Xoy332vMNwmEkEBpZMltW06wIgy22b7a5MinpN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/xkqLGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF991C4CED1;
	Fri, 14 Feb 2025 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739523715;
	bh=EgLgzCrv/qBPOyDd4OU9mDEx8AfdL88weeWAthnioMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/xkqLGeQGghNFr1UXpBpJRHIIje3QwfnTJTBpNw6Ra8d8dAPE4Q8WlcdkpFjPULY
	 6fiY8XSsnWRQaOGEO9Fn/LUFdm59gBRy63nOZ5JDwuJnWFx3Ti15VEZ73bQYHe58bH
	 QpMMrmThdQ6un8gTOHIRlQgHM4Tp1JLabTifPT0RztTYAZvD898m+TTR6uD7gI+W61
	 5wsuCC4Np6I3McOTrzAoeuniD1join6UrtkvFbwqHjWZdhDVpSzQWh2L4fG+BkLdR0
	 9VQl41n/7fSxn64C/prTvjPHDS44kCN0kUlgVRrQH+GOESdGXYoyXK+x/mJMj7H24B
	 1JsU87DUZ+oUA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tiraG-000000006Eq-0Iki;
	Fri, 14 Feb 2025 10:02:04 +0100
Date: Fri, 14 Feb 2025 10:02:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support to reconfigure PLL
Message-ID: <Z68GjM-X7Qkpyv7B@hovoldconsulting.com>
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
 <Z6HnOUfsSaKYyYfh@hovoldconsulting.com>
 <15d16afd-8e1a-479f-9573-8845d1408178@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15d16afd-8e1a-479f-9573-8845d1408178@quicinc.com>

On Tue, Feb 04, 2025 at 11:13:08PM +0530, Taniya Das wrote:
> On 2/4/2025 3:38 PM, Johan Hovold wrote:
> > On Mon, Jan 13, 2025 at 10:57:03PM +0530, Taniya Das wrote:
> >> During boot-up, there is a possibility that the PLL configuration might
> >> be missed even after invoking pll_configure() from the clock controller
> >> probe. This is often due to the PLL being connected to rail or rails
> >> that are in an OFF state and current clock controller also cannot vote
> >> on multiple rails. As a result, the PLL may be enabled with suboptimal
> >> settings, leading to functional issues.
> >>
> >> The PLL configuration, now part of clk_alpha_pll, can be reused to
> >> reconfigure the PLL to a known good state before scaling for frequency.
> >> The 'clk_alpha_pll_reconfigure()' can be updated to support more PLLs
> >> in future.
> > 
> > This sounds like a hack. You already describe the underlying problem (and
> > indirectly its solution) in the first paragraph above, namely that the
> > video clock controller has not enabled the power domain needed to
> > configure the PLL.
> 
> This is not a hack, but another alternative way to ensure the PLL is 
> configured to the right configuration before being used.

I say it's a hack since it sounds like since you're relying on some
other entity to have enabled resources that this clock controller
depends on.

> > I believe support for clock controllers that need to enable multiple
> > power domains is on its way into 6.15:
> > 
> > 	https://lore.kernel.org/lkml/20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org/
> > 
> > Perhaps that's what you need to fix this properly.
> 
> Yes, this is just to add a dependency on clock controller to put the 
> rail vote, but this series does not fully solve the clock controller's 
> PLL requirement problems.

Why not? What else is needed beyond enabling the video (?) power domain
before configuring the PLL?

Johan

