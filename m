Return-Path: <linux-arm-msm+bounces-23929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4070914969
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 393E2B23BCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F6E13B59B;
	Mon, 24 Jun 2024 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwTcRMHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F347413B58D;
	Mon, 24 Jun 2024 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231120; cv=none; b=J1POy5RL+3m0+wQrG3zNPuClzxEdxIQH58gjLI/n6I4c85JX+zA6bdcH/xS0eBb3Zn8erv51fWltDCseD+q35zWh/Nl/3ciDNRfs+JoFwMpPGykhzNZiPV9jmNkZF4vMuPOH7TrWIvZola65BASx9vqpmNrACJPnQS92LmDIFag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231120; c=relaxed/simple;
	bh=4Ot9tyWAtkoGaWuX0CtgzQSqJ/8GufECRvDvI/p6kFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArZUClo3+GvraR+FIA/zUV/eAKOhl2/7F9Tvokml3HwbbYCiWKOhwQyAIqkV0Adcz4HnLlSuePjHOpEs4aBdfFQNCib3ygdNHyxXh4l/3a1X4ObvyHVkeTg0UkFRafSjKkyRMsCOrWZ5MAJLJZmGRpkeNFrEAwZQybzBzbizrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwTcRMHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7395AC2BBFC;
	Mon, 24 Jun 2024 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719231119;
	bh=4Ot9tyWAtkoGaWuX0CtgzQSqJ/8GufECRvDvI/p6kFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwTcRMHmDNowzrtF+b41zPBQKJ1E2Ai6fuks7di4uBrIo2bhbjFbsaAYKVsTmf5Bv
	 k48hJuWaOLlmoaVeWsEuMb8Xbnk2WJgXnKqn9m0C7ZyR3dgYM1Jn+BFGuhgDyfWaMI
	 bxLp66r6TBNv89+BWjv0u+6XLEUj6Za0mF1FJ8FkJ2gOlxSzL20Fg/fDSbROIc3YTc
	 jklzhSeuc43dQDENgooKGiA4HaWzawbrSwqGLAME+cfgiX+FHeruN/tNTzxB8yVoQ9
	 nSaQ6Ud1I1CnVoAm44KXnud641lqsZFTduxqBY1SreRw2GmVzSJ+17PL4ErSI3+uyc
	 yDQE+H0P6b0bA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sLiYG-000000006Wl-1ZK9;
	Mon, 24 Jun 2024 14:12:05 +0200
Date: Mon, 24 Jun 2024 14:12:04 +0200
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
Message-ID: <ZnlilDj5UrvrVasv@hovoldconsulting.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.7.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610152420.v4.7.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>

On Mon, Jun 10, 2024 at 03:24:25PM -0700, Douglas Anderson wrote:
> On devices using Qualcomm's GENI UART it is possible to get the UART
> stuck such that it no longer outputs data. Specifically, logging in
> via an agetty on the debug serial port (which was _not_ used for
> kernel console) and running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles
> causes the UART to stop transmitting.

An easier way to trigger this old bug is to just run a command like
dmesg and hit ctrl-s in a serial console to stop tx. Interrupting the
command or hitting ctrl-q to restart tx then triggers the soft lockup.

> The root of the problems was with qcom_geni_serial_stop_tx_fifo()
> which is called as part of the suspend process. Specific problems with
> that function:
> - When an in-progress "tx" command is cancelled it doesn't appear to
>   fully drain the FIFO. That meant qcom_geni_serial_tx_empty()
>   continued to report that the FIFO wasn't empty. The
>   qcom_geni_serial_start_tx_fifo() function didn't re-enable
>   interrupts in this case so the driver would never start transferring
>   again.
> - When the driver cancelled the current "tx" command but it forgot to
>   zero out "tx_remaining". This confused logic elsewhere in the
>   driver.
> - From experimentation, it appears that cancelling the "tx" command
>   could drop some of the queued up bytes.
> 
> While qcom_geni_serial_stop_tx_fifo() could be fixed to drain the FIFO
> and shut things down properly, stop_tx() isn't supposed to be a slow
> function. It is run with local interrupts off and is documented to
> stop transmitting "as soon as possible". Change the function to just
> stop new bytes from being queued. In order to make this work, change
> qcom_geni_serial_start_tx_fifo() to remove some conditions. It's
> always safe to enable the watermark interrupt and the IRQ handler will
> disable it if it's not needed.
> 
> For system suspend the queue still needs to be drained. Failure to do
> so means that the hardware won't provide new interrupts until a
> "cancel" command is sent. Add draining logic (fixing the issues noted
> above) at suspend time.

So I spent the better part of the weekend looking at this driver and
this is one of the bits I worry about with your approach as relying on
draining anything won't work with hardware flow control.

Cancelling commands can result stalled TX in a number of ways and
there's still at least one that you don't handle. If you end up with
data in in the FIFO, the watermark interrupt may never fire when you try
to restart tx.

I'm leaning towards fixing the immediate hard lockup regression
separately and then we can address the older bugs and rework driver
without having to rush things.

I've prepared a minimal three patch series which fixes most of the
discussed issues (hard and soft lockup and garbage characters) and that
should be backportable as well.

Currently, the diffstat is just:

	 drivers/tty/serial/qcom_geni_serial.c | 36 +++++++++++++++++++++++++-----------
	 1 file changed, 25 insertions(+), 11 deletions(-)

Fixing the hard lockup 6.10-rc1 regression is just a single line.

Johan

