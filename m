Return-Path: <linux-arm-msm+bounces-34914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 790439A39D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F5771C22781
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CFE1E9083;
	Fri, 18 Oct 2024 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8e1eYoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5018E748;
	Fri, 18 Oct 2024 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729243292; cv=none; b=PAZLf3LVcG1kks6lt7ZPKtDFS8fVk25X2dcKbhHWWHr6YNe/DdHI4i+EtzuQor78j6QYZiE7xA6yVn7AzC/ipl9ptZJCQohxD8oy3GfuZtIPq82lWEkvTm19UMYnVqA3pJDoOMCtjsRZSywpzBJ2xVoZv0CjVkffDZuc6IWsc0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729243292; c=relaxed/simple;
	bh=o8RYb+boopz9ONUb3znNlQTCvIN/RRJTyKCP3iQJtF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI3AMa2LI0Q65uod9PbEk16S11qzyotRTiyQbmGUcH3VzIBuahZNhDXVvFPFkCJBs3ST+eE7pK01cnOwaHnfC/VItxhVRN2o+h872y9eSOjpXKOVheA2Qs9cd13d6Om3rMHxq2tt91QxqGpi2T3uWtyxl+BCTUuvCnnr9joXDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8e1eYoS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CDBC4CEC3;
	Fri, 18 Oct 2024 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729243291;
	bh=o8RYb+boopz9ONUb3znNlQTCvIN/RRJTyKCP3iQJtF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8e1eYoSquj52NLzfEQws3o29doJr70ZoPqRNZxhaVrMlN4JNUTZ7vY0hWP3j9tqA
	 SFQ+ZK89RHaac3gopZOkZ43Rsvj4yVb6BHBWabklzBtHAAFG7G3v4dVHzIFm8Xxah4
	 iPRIW9nWd4+F32+p2RWZ5igh49B1cI4vhrYJjq4/kZ7W+U5cC8K7MKtme93BFB5/S9
	 9qG2NX0m/AfMRO712XIKRzv4FrnmcYQt5DwP5N57m4TONaLRKIh6nbcQkGZ3J6oOaB
	 MWzBQ5grln2JvumjsnRNGYd8KtIpNGp6SXsp6GKLwgzVuVqPek5spPYaDZEaa3iynV
	 8riFzF1gzPTzQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t1jAy-0000000022l-0D2C;
	Fri, 18 Oct 2024 11:21:40 +0200
Date: Fri, 18 Oct 2024 11:21:40 +0200
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
Message-ID: <ZxIopDwcqf8xqJK8@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-3-johan+linaro@kernel.org>
 <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>
 <ZwaO0hCKdPpojvnn@hovoldconsulting.com>
 <CAD=FV=UZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z0jkH4U30eQ@mail.gmail.com>
 <ZwjK-s0sMn9HOF04@hovoldconsulting.com>
 <CAD=FV=XuEPGtDCe4ssXPy2avigqviTBAycc0Q_U_Pwi9x6t23g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XuEPGtDCe4ssXPy2avigqviTBAycc0Q_U_Pwi9x6t23g@mail.gmail.com>

On Fri, Oct 11, 2024 at 07:30:30AM -0700, Doug Anderson wrote:
> On Thu, Oct 10, 2024 at 11:51 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > > > Not sure how your "console process" works, but this should only happen
> > > > if you do not enable the serial console (console=ttyMSM0) and then try
> > > > to use a polled console (as enabling the console will prevent port
> > > > shutdown from being called).

> > And this is with a Chromium kernel, not mainline?
> 
> Who do you take me for?!?!  :-P :-P :-P Of course it's with mainline.

Heh. Just checking. I was sure about shutdown() not being called when
closing ports, but yeah, you can indeed hit this via hangup() as serial
core was only half-converted over to use the tty port implementation in
2016.

> > If you take a look at tty_port_shutdown() there's a hack in there for
> > consoles that was added back in 2010 and that prevents shutdown() from
> > called for console ports.
> >
> > Put perhaps you manage to hit shutdown() via some other path. Serial
> > core is not yet using tty_port_hangup() so a hangup might trigger
> > that...
> >
> > Could you check that with a dump_stack()?

> lazor-rev9 ~ # stop console-ttyMSM0

> [   68.812702]  qcom_geni_serial_shutdown+0x38/0x110
> [   68.817578]  uart_port_shutdown+0x48/0x68
> [   68.821736]  uart_shutdown+0xcc/0x170
> [   68.825530]  uart_hangup+0x54/0x158
> [   68.829154]  __tty_hangup+0x20c/0x318
> [   68.832954]  tty_vhangup_session+0x20/0x38
> [   68.837195]  disassociate_ctty+0xe8/0x1a8
> [   68.841355]  do_exit+0x10c/0x358
> [   68.844716]  do_group_exit+0x9c/0xa8
> [   68.848441]  get_signal+0x408/0x4d8
> [   68.852071]  do_signal+0xa8/0x770

Thanks for confirming. I see this too when stopping a getty.

> > > Now I (via ssh) drop into the debugger:
> > >
> > > echo g > /proc/sysrq-trigger
> > >
> > > I see the "kgdb" prompt but I can't interact with it because
> > > qcom_geni_serial_shutdown() stopped RX.
> >
> > How about simply amending poll_get_char() so that it enables the
> > receiver if it's not already enabled?
> 
> Yeah, this would probably work.

Seems we should clean up serial core so that it at least behaves
consistently on hangup and close.

Having someone think trough and document how these polled consoles are
supposed to work would also be good and save people modifying these
drivers a lot of work.

If they are restricted to when the console is active, there would be no
need for most of poll_init(), and we already prevent the console from
being shut down on hangup() and close().

And then we now also have the detachable console mess to consider...

Johan

