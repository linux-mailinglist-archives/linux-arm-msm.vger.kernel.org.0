Return-Path: <linux-arm-msm+bounces-34033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCE999D1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3121F239AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233DE20968C;
	Fri, 11 Oct 2024 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRBQYA7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B7E635;
	Fri, 11 Oct 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629495; cv=none; b=a6g0hQ6tGEV8bCnJmKxqPAXdugBDSNUw2G8Obvk8XbTvYZsFjINDnt+sygCKSZJeZSeBXNmUG9YHrFiL0yAryghHS88gKzvVYpqEiM/jouwKoZaUlNYKKAniFtno+iyqVkTC0O12420Ro24IwWq8GiuPe0Tz899sh8J8lp09wuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629495; c=relaxed/simple;
	bh=+0iB7lhXfWq7DqrCSFd6XGMnOkBMJBJqsGrenA+Xx88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIg6Nm5zKCloazIUwxJ+gvGndnKBK/x0pUqPMlYSwSqif75QVJ+5wfJp2Oxih12K8PJDsxO6bhGpudKxGQT6NDUE2AHFgPYf3lnq3sfsie8mw/SPdR9/ImtVzKlKCFnJvPsjh67Vnf7nqICNQGj9OKkJ2P/G5aaWUzh7GQ/aUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRBQYA7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77380C4CEC3;
	Fri, 11 Oct 2024 06:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728629493;
	bh=+0iB7lhXfWq7DqrCSFd6XGMnOkBMJBJqsGrenA+Xx88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRBQYA7GFLuhHYSd66dZg2SxXhrLQ7eVgv5miU9v0Z2IKctjswjEQAr4ld1mfWVx2
	 uxODuFIllGfIVrC7zroT21W0ypzHBUFTh5Ni2/o+JInbcR7QFYDCIJydpqMptHERJm
	 /rPzn9HsSomN489uWpoIZagIVZc0ItcTOYW1pUQndAz3B9vcqHFVUxK/wMW07gcJlU
	 oDE0XDzL51/j3pM9tGo6Uac2E8MZGEuvqdeGTOZ8eNo/NK21oFhT0AsoCvLLg/tEqD
	 MVcScuL+TSus/TBhJh04INQtPIosxPnfBHNGbV58HTHssFFeqiEhPBaKHkKMUv2yqc
	 hkPgmOKgLK90g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sz9Uw-000000002k0-1PKt;
	Fri, 11 Oct 2024 08:51:39 +0200
Date: Fri, 11 Oct 2024 08:51:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/7] serial: qcom-geni: fix shutdown race
Message-ID: <ZwjK-s0sMn9HOF04@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-3-johan+linaro@kernel.org>
 <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>
 <ZwaO0hCKdPpojvnn@hovoldconsulting.com>
 <CAD=FV=UZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z0jkH4U30eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z0jkH4U30eQ@mail.gmail.com>

On Thu, Oct 10, 2024 at 03:30:05PM -0700, Doug Anderson wrote:
> On Wed, Oct 9, 2024 at 7:10 AM Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Oct 03, 2024 at 11:30:08AM -0700, Doug Anderson wrote:

> > > Hmmm, when I look at that commit it makes me think that the problem
> > > that commit e83766334f96 ("tty: serial: qcom_geni_serial: No need to
> > > stop tx/rx on UART shutdown") was fixing was re-introduced by commit
> > > d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in
> > > progress at shutdown"). ...and indeed, it was. :(
> > >
> > > I can't interact with kgdb if I do this:
> > >
> > > 1. ssh over to DUT
> > > 2. Kill the console process (on ChromeOS stop console-ttyMSM0)
> > > 3. Drop in the debugger (echo g > /proc/sysrq-trigger)
> >
> > Yeah, don't do that then. ;)
> 
> The problem is, I don't always have a choice. As talked about in the
> message of commit e83766334f96 ("tty: serial: qcom_geni_serial: No
> need to stop tx/rx on UART shutdown"), the above steps attempt to
> simulate what happened organically: a crash in late shutdown. During
> shutdown the agetty has been killed by the init system and I don't
> have a choice about it. If I get a kernel crash then (which isn't
> uncommon since shutdown code tends to trigger seldom-used code paths)
> then I can't debug it. :(

Ok, thanks for clarifying.

> > Not sure how your "console process" works, but this should only happen
> > if you do not enable the serial console (console=ttyMSM0) and then try
> > to use a polled console (as enabling the console will prevent port
> > shutdown from being called).
> 
> That simply doesn't seem to be the case for me. The port shutdown
> seems to be called. To confirm, I put a printout at the start of
> qcom_geni_serial_shutdown(). I see in my /proc/cmdline:
> 
> console=ttyMSM0,115200n8
> 
> ...and I indeed verify that I see console messages on my UART. I then run:
> 
> stop console-ttyMSM0
> 
> ...and I see on the UART:
> 
> [   92.916964] DOUG: qcom_geni_serial_shutdown
> [   92.922703] init: console-ttyMSM0 main process (611) killed by TERM signal
> 
> Console messages keep coming out the UART even though the agetty isn't
> there.

And this is with a Chromium kernel, not mainline? 

If you take a look at tty_port_shutdown() there's a hack in there for
consoles that was added back in 2010 and that prevents shutdown() from
called for console ports.

Put perhaps you manage to hit shutdown() via some other path. Serial
core is not yet using tty_port_hangup() so a hangup might trigger
that...

Could you check that with a dump_stack()?

> Now I (via ssh) drop into the debugger:
> 
> echo g > /proc/sysrq-trigger
> 
> I see the "kgdb" prompt but I can't interact with it because
> qcom_geni_serial_shutdown() stopped RX.

How about simply amending poll_get_char() so that it enables the
receiver if it's not already enabled?

Johan

