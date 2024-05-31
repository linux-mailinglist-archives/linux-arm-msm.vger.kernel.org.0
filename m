Return-Path: <linux-arm-msm+bounces-21193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0F8D59CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 07:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D98491C216B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 05:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AE1282E5;
	Fri, 31 May 2024 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yHLSfYWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D142249F5;
	Fri, 31 May 2024 05:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717132887; cv=none; b=iY7dwRQI3PBwHoU0a+o1DTAGKIDQt4xKJ75O+5YXl/0+AuDCmymYXAKdj9fWyyPXvZBuQ1oKb6P3qwU2IyDK7xstIINjcO9LZiZJOjpBXCZsPi88YUChZQl4IHyszsqwkO5SFwjuxl6zD0R1oKPagFtSCgLwaiRSoA7ENm3aopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717132887; c=relaxed/simple;
	bh=WJYFVQABthkurcVYkwWrzXsplNA67V49oLFB3N0V99A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNoWGM/iCfp4h2Dq1ZMddytrW5z2TO4m4XNO2HAAZwTZPP1YUb88WTcX3gGEPcIM04XuQfB2js8SQtAPHWMhJx589pGLB14md31alVMJCRDtbT//Y5iXMA3JF5/I9XBqaAMQk2AlziIKvEL+Zr4pQVk8QJww7yt/coLOF547QjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yHLSfYWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192ECC116B1;
	Fri, 31 May 2024 05:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717132886;
	bh=WJYFVQABthkurcVYkwWrzXsplNA67V49oLFB3N0V99A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yHLSfYWGdwuyVoAzOb3yuif43BPrZEDs0ZasAB0wHoHw9z9XLTxEOlU5/1G2xtdlt
	 JZCL7g824tOR0gzim1SlUUBo22tOf1HyjOFne88JQfUJPzQUx7ALFkC5Cwp3AGzn8h
	 Nm/Gq6wVdmOe6ZbqQhG0iQH7ko+boNrUtbyw04k4=
Date: Fri, 31 May 2024 07:21:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Guanbing Huang <albanhuang@tencent.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] serial: port: Don't block system suspend even if
 bytes are left to xmit
Message-ID: <2024053112-subsonic-legibly-e386@gregkh>
References: <20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>

On Thu, May 30, 2024 at 08:48:46AM -0700, Douglas Anderson wrote:
> Recently, suspend testing on sc7180-trogdor based devices has started
> to sometimes fail with messages like this:
> 
>   port a88000.serial:0.0: PM: calling pm_runtime_force_suspend+0x0/0xf8 @ 28934, parent: a88000.serial:0
>   port a88000.serial:0.0: PM: dpm_run_callback(): pm_runtime_force_suspend+0x0/0xf8 returns -16
>   port a88000.serial:0.0: PM: pm_runtime_force_suspend+0x0/0xf8 returned -16 after 33 usecs
>   port a88000.serial:0.0: PM: failed to suspend: error -16
> 
> I could reproduce these problems by logging in via an agetty on the
> debug serial port (which was _not_ used for kernel console) and
> running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles.
> 
> Tracing through the code and doing some printf()-based debugging shows
> that the -16 (-EBUSY) comes from the recently added
> serial_port_runtime_suspend().
> 
> The idea of the serial_port_runtime_suspend() function is to prevent
> the port from being _runtime_ suspended if it still has bytes left to
> transmit. Having bytes left to transmit isn't a reason to block
> _system_ suspend, though. If a serdev device in the kernel needs to
> block system suspend it should block its own suspend and it can use
> serdev_device_wait_until_sent() to ensure bytes are sent.
> 
> The DEFINE_RUNTIME_DEV_PM_OPS() used by the serial_port code means
> that the system suspend function will be pm_runtime_force_suspend().
> In pm_runtime_force_suspend() we can see that before calling the
> runtime suspend function we'll call pm_runtime_disable(). This should
> be a reliable way to detect that we're called from system suspend and
> that we shouldn't look for busyness.
> 
> Fixes: 43066e32227e ("serial: port: Don't suspend if the port is still busy")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> In v1 [1] this was part of a 2-patch series. I'm now just sending this
> patch on its own since the Qualcomm GENI serial driver has ended up
> having a whole pile of problems that are taking a while to unravel.
> It makes sense to disconnect the two efforts. The core problem fixed
> by this patch and the geni problems never had any dependencies anyway.
> 
> [1] https://lore.kernel.org/r/20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid/
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

