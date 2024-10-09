Return-Path: <linux-arm-msm+bounces-33702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF127996D6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97C9C1F258A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2247B198E96;
	Wed,  9 Oct 2024 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0TzdbhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A10224DC;
	Wed,  9 Oct 2024 14:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483435; cv=none; b=FDWwEfqf6TafoklQ7qYMrmyt9jXSX8GGR8aPA3wUyuvUFykkbJNWlUMhOLU5S3rRlKv29L4NlJyMjseGvKguVTe12vPQ4C9c2f4cIsIKHJiyocpJgMv6OoLtV1ZcOkqTlJI6hrlfs7Cj4aNmLh/SODHtxLKPRb3TJQgSdovccww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483435; c=relaxed/simple;
	bh=+t66X/Ryhu0xoS7clwdliHC1P2bHUBLcpyoNdRlStu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAXCOccCZ0EBCi8A0zkcg1UvUdTlOHtiV01zizNs4EhLb9IipEdd5atJCwl5u/949yjzCnoodJ05hpjKn6cFfUjqyd1w+Po8S2jtcnaVZgJh6i95khosDLvARuKFChHh8mCUcgU7YSXECJEteRJrPMtW3mOOBJCqXg+IjavVa/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0TzdbhF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DC7C4CEC3;
	Wed,  9 Oct 2024 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728483434;
	bh=+t66X/Ryhu0xoS7clwdliHC1P2bHUBLcpyoNdRlStu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0TzdbhFmEdbRDeQXlzf1yEBt8ALj1VOD2rRTNqlqzoxnOA/OUoM2uqijgdZObmkH
	 4jsgkmKdrZekITqioUtyz84V3MaEUhofxtL+7UpFqoRZTN1NzwmdpAqbEJGgnEWxZ3
	 heKwMfd/tkOjVGdACvKBAWRLwjktb9Oh65aJhGmn56REFxt/55IcCknfI0PFE77JP8
	 FFqngHyEiLIZg4OzjaK9GNdRBOr9b2rOhAdUbADegnF0S/hUoDstwCsp+TYlG/w+sa
	 FmRJe+INgNpgwr4enSy/msGzQTwFYvfJv8BXVtGeCLsob4SciZ096ahr6+W0YPz3g0
	 rVwdq/NxuZ7gg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syXV7-000000003kS-1gTL;
	Wed, 09 Oct 2024 16:17:18 +0200
Date: Wed, 9 Oct 2024 16:17:17 +0200
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
Subject: Re: [PATCH v2 4/7] serial: qcom-geni: fix receiver enable
Message-ID: <ZwaQbcuIPrR9HwKi@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-5-johan+linaro@kernel.org>
 <CAD=FV=Vwmb8Miyca4kE1sdjMCx7LVCYqaXhLmPPqsojUHdEk-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vwmb8Miyca4kE1sdjMCx7LVCYqaXhLmPPqsojUHdEk-g@mail.gmail.com>

On Thu, Oct 03, 2024 at 01:10:47PM -0700, Doug Anderson wrote:
> On Tue, Oct 1, 2024 at 5:51 AM Johan Hovold <johan+linaro@kernel.org> wrote:

> > @@ -1179,6 +1179,11 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
> >                 if (ret)
> >                         return ret;
> >         }
> > +
> > +       uart_port_lock_irq(uport);
> > +       qcom_geni_serial_start_rx(uport);
> > +       uart_port_unlock_irq(uport);
> 
> I _think_ you don't need the locking here. The documentation for the
> "startup" callback say:
> 
>  * Interrupts: globally disabled.

Heh, yeah, that comment dates back to 2002 and probably wasn't even
correct back then.

This function is called with the port mutex held (and interrupts
enabled), and I need to take the port lock to serialise against the
console code.

> Other than that, this looks reasonable to me. I seem to recall
> previous discussions where _someone_ was relying on the
> qcom_geni_serial_start_rx() at the end of termios for some reason
> (which always felt like a bad design), but I can't find those old
> discussions. I suspect that the fact that you've added the start_rx in
> startup() is what we needed.

Yeah, I tried to find a reason for why things were done this way, but it
was probably just copied from the vendor driver. The hardware doesn't
seem to require stopping rx in set_termios() (and tx is not stopped
anyway), which could otherwise have been a reason.

Johan

