Return-Path: <linux-arm-msm+bounces-32052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E819997D2E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 10:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272AE1C206A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 08:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3BB1311AC;
	Fri, 20 Sep 2024 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RivngTb6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D4712EBEA;
	Fri, 20 Sep 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726821617; cv=none; b=olJI+ouE7nNJ4xJ2fgk63RyQTP5et1JUZRqIkEHoYiOTV+yK4O8rbPp22nCp3RF8UJj0a+/TmC35Vw4ptJHNK8rZQqm6Epzj9y6XLbGcCAhFWFJ2h5BOx1D0wVTZa+4NH3S++25Oi/Vi5VvHZCSPSbMxdtJNvtipc5mQy2jM8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726821617; c=relaxed/simple;
	bh=T6eEFVRQyoo07Wn65ust8kGnoZmk5hgOcPaHEAsIAro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lh9fUhy4Ifs2zQDAX2e1hC0Ljd57LfW4FFhy0uo7ZoEfG53xSJWDiOA9n7H7pqgD0Eu5EbMQNVGycLJQWpCkyBOZ8d/WCuyxnAEpJv7cnJmc0FfOgUyL8z3trR72/e8beImuqYaZ1B1IGfCvdL6hGe4tvpY2clQGf6pK8FPVwVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RivngTb6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B680FC4CEC3;
	Fri, 20 Sep 2024 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726821616;
	bh=T6eEFVRQyoo07Wn65ust8kGnoZmk5hgOcPaHEAsIAro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RivngTb6Y2tJZX2EcEVdvwZQjnyjsIOsb0U0ekD1XiAs/JuCA1XOwRDGbiMpX7HO0
	 KtpPrn3yL1Cmr8hVUl2QJqDbg9VkFlB95ie0Id5dyVOq8x9JH2FaL+zDm28XA/pwnP
	 BKE2QWAQ8q3fYnQ6kkRVjR1YhU9aD40erxUGYBnatZUTBsgMdovSaTb326mpJ0uQNR
	 G4yJ7cNfOwUkfyqxSDaWELVDadb+8cMCWn/b7JjsAxF2w8TEd28Ia+4F12HvT9AMi6
	 lO8xw8n1bqtv/XrP3AjM/Qs7JnXxfsBmOXkxIa5Pjy/I7Ta6+JhHf0XRyKmBOUTAwM
	 /lpcRWu0m/F6g==
Received: from johan by theta with local (Exim 4.98)
	(envelope-from <johan@kernel.org>)
	id 1srZBV-000000001PK-0Nj4;
	Fri, 20 Sep 2024 10:40:13 +0200
Date: Fri, 20 Sep 2024 10:40:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
Message-ID: <Zu007YUYie7bEQvj@hovoldconsulting.com>
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
 <ZuqmB3Cn7mGfA2PU@hovoldconsulting.com>
 <ZurRLf8S1j6s8GPz@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZurRLf8S1j6s8GPz@linaro.org>

On Wed, Sep 18, 2024 at 04:10:05PM +0300, Abel Vesa wrote:
> On 24-09-18 12:05:59, Johan Hovold wrote:
> > On Sat, Sep 07, 2024 at 06:25:21PM +0300, Abel Vesa wrote:
> > > Enable runtime PM support by adding proper ops which will handle the
 
> > > clocks and regulators. These resources will now be handled on power_on and
> > > power_off instead of init and exit PHY ops.
> > 
> > No, this is simply a false claim and indicates that you haven't reviewed
> > how PHY runtime PM works. Core will increment the usage count on init()
> > and decrement it on exit().
> 
> Yeah, I guess the better argument here would be that the PHY needs
> regulators and clocks enabled

No, that's already handled today so is clearly not a valid argument.

> Anyway, ignore this version as it was already NACKed by Dmitry.

No, my feedback is still valid, and you're bound to repeat the same
mistakes over and over again unless you try to understand what I've been
saying here.

> > > Also enable these resources on
> > > probe in order to balance out the disabling that is happening right after.
> > > Prevent runtime PM from being ON by default as well.
> > 
> > And here you just regressed all current systems that do not have udev
> > rules to enable runtime PM, and which will now be stuck with these
> > resources always-on (e.g. during DPMS off and system suspend).
> > 
> > In fact, you are even regressing systems that would enable runtime PM,
> > as the runtime suspend callback would not currently be called when you
> > enter system suspend so the regulators and clocks will be left on.
> > 
> > This clearly hasn't been tested and analysed properly.

Johan

