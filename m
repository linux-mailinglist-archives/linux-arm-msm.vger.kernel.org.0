Return-Path: <linux-arm-msm+bounces-24013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A119154D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 18:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95BA21F24210
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D111F19DF8F;
	Mon, 24 Jun 2024 16:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzfZLeE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37522F24;
	Mon, 24 Jun 2024 16:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719248093; cv=none; b=fmsoEKJ+hBvz30rrOqN7dbK19Jp8MkCgJ6wloVeQJhdRmzbLa+hFaNBJ+tTciiBLPfPQC9lEMESHbRgVDSdg9psHUQhc9EaUBGSwhx6D0UPvPHVJSrFP8Xt0qkDlS7zl/bdiy0y+HyHXtbfHnJPL9ctIYC5G1dBo7PmfTWeOEJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719248093; c=relaxed/simple;
	bh=Uwv+K0RBgShdFEgwsCqjkVywOnyT8K9fp50gjDKdzSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSX7E/c5O+mHLLXZzxXhJYV9dbuwWBs86fxwlgelGGM8bYyeQdxDIq3kXSqs0F9+Ji+oAOeeHWJNbOLXK8bawfFWDPmzDvNNS01p/SZYxvc+pZA/6l5Bzk4E/uHFtfS5QEwgvqtD2094qfYYveF9/uz1F4rdtU8rtgLKfPx4MTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzfZLeE7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188AEC2BBFC;
	Mon, 24 Jun 2024 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719248093;
	bh=Uwv+K0RBgShdFEgwsCqjkVywOnyT8K9fp50gjDKdzSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzfZLeE74prGw8oCXjR5/rO1KjhmsGoc9161nfGRNSbcvYsMdPHOfZKTwHeqHX9Yh
	 3JatS+dLKc9d4qecawuIGwKbC8NtSegb90VteEJf/B5AtLQ0mIDoCrhC7+hItOtDfr
	 lC7CHLnkFKq0SyuZ1AoDAEhxF23ZbMfRXo2+QcYVFOJIBAr8X7cMR/rjsuSdrCVG54
	 CpRIrwVZS2eIonaEphM9fE7qF/w//pazAU+9OfE27fA1U091NNzVhvxyP+DIJVoDkJ
	 QBhuOvoMqo3eyNPhoD5ogN34E5p+w6QIfWy/1rmgeSaN6rqdaXzP+O/sIiWsxtiJy9
	 iX0mWI909Cy6g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sLmy2-0000000038V-2H1o;
	Mon, 24 Jun 2024 18:54:59 +0200
Date: Mon, 24 Jun 2024 18:54:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 7/8] serial: qcom-geni: Fix suspend while active UART
 xfer
Message-ID: <Znmk4oYapM9EQH37@hovoldconsulting.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.7.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
 <ZnlilDj5UrvrVasv@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnlilDj5UrvrVasv@hovoldconsulting.com>

On Mon, Jun 24, 2024 at 02:12:04PM +0200, Johan Hovold wrote:

> I've prepared a minimal three patch series which fixes most of the
> discussed issues (hard and soft lockup and garbage characters) and that
> should be backportable as well.
> 
> Currently, the diffstat is just:
> 
> 	 drivers/tty/serial/qcom_geni_serial.c | 36 +++++++++++++++++++++++++-----------
> 	 1 file changed, 25 insertions(+), 11 deletions(-)
> 
> Fixing the hard lockup 6.10-rc1 regression is just a single line.

For the record, I've posted the series here:

	https://lore.kernel.org/lkml/20240624133135.7445-1-johan+linaro@kernel.org/
 
Johan

