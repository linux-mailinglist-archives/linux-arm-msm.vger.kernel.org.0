Return-Path: <linux-arm-msm+bounces-24232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18C917A36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B081F248B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 07:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A1815F3EF;
	Wed, 26 Jun 2024 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgTcvQuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360F1FBB;
	Wed, 26 Jun 2024 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388471; cv=none; b=ooUvd7hqyiBzyz5iq9vUz25Dddvih2rZ7MayAmYFYdbLc5KXRQHmxNYX12cZnXgyZl7YyGL3RQ4M5cLWLwcu/Ps/ix2ICQ+DhojXyfVVBO91eGIsnLUrSSjNxPw8h78YbJCrV0HwaEK3JCVOyq1kgtwqjm/3+eryVZ9mmJV7ZqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388471; c=relaxed/simple;
	bh=SbtxvcursYPrSDJUEzv8uDtSs383JJZUnvYrA/hF/4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFbMd9Mo+TnhMIaQ/MOCsZrKE51a9tg2fOMDtxF/13H6UPTeQl9wGEU/rlNOiN2h38djAGBrqSDoNjkiNZR9FlMQmEHETDGoFf261GoeXf/a2QYolA++IvHWDE08AuIgnqXLokko0DYdU2MJkQ5+fCpAr/b44TVPrMbcSThm08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgTcvQuf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC22FC4AF0B;
	Wed, 26 Jun 2024 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719388470;
	bh=SbtxvcursYPrSDJUEzv8uDtSs383JJZUnvYrA/hF/4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgTcvQufTogBwZufUbCJXr2yc/1vPoRkdHFeGnYJY8ySQj3TD7HgjAALfFMVVoxqq
	 DusZlvg+ACiJuMUuqPhWYFVSTFJfLT6iImeTXdK/cGyPk4c8enuKMY06YeO10IwX0B
	 A3e+BWH0VqwyM1s4f1yfv1baYlUbGl+zOTMByjdfcvxGfC8fdtcuwmrnWtQ4PCCQZ9
	 0O4oX09quJh7KtFuLRz7oYNQUAJHIGQnbDqy+2UOb7fFcUckcmZHeOdddOxu2r/E9j
	 Hcor/tKZZ8lZV2YcS61nRuUTOXSQseEGXnMENVDnAnbdQz3uPOXXh2lkoQZl0g1gnR
	 g+HjSVatDOmlA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMNUG-000000007vt-0yGY;
	Wed, 26 Jun 2024 09:54:40 +0200
Date: Wed, 26 Jun 2024 09:54:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] serial: qcom-geni: fix soft lockup on sw flow
 control and suspend
Message-ID: <ZnvJQDX6NkyRCA8y@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-3-johan+linaro@kernel.org>
 <CAD=FV=UauWffRM45FsU2SHoKtkVaOEf=Adno+jV+Ashf7NFHuA@mail.gmail.com>
 <CAD=FV=XPKqjMcWhqk4OKxSOPgDKh-VM4J4oMEdQtgpFBw8WSXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XPKqjMcWhqk4OKxSOPgDKh-VM4J4oMEdQtgpFBw8WSXA@mail.gmail.com>

On Mon, Jun 24, 2024 at 02:58:39PM -0700, Doug Anderson wrote:
> On Mon, Jun 24, 2024 at 2:23 PM Doug Anderson <dianders@chromium.org> wrote:
> > On Mon, Jun 24, 2024 at 6:31 AM Johan Hovold <johan+linaro@kernel.org> wrote:

> > > +static void qcom_geni_serial_clear_tx_fifo(struct uart_port *uport)
> > > +{
> > > +       struct qcom_geni_serial_port *port = to_dev_port(uport);
> > > +
> > >         if (!qcom_geni_serial_main_active(uport))
> > >                 return;
> > >
> > > +       /*
> > > +        * Increase watermark level so that TX can be restarted and wait for
> > > +        * sequencer to start to prevent lockups.
> > > +        */
> > > +       writel(port->tx_fifo_depth, uport->membase + SE_GENI_TX_WATERMARK_REG);
> > > +       qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> > > +                                       M_TX_FIFO_WATERMARK_EN, true);
> >
> > Oh, maybe this "wait for sequencer to start to prevent lockups." is
> > the part that I was missing? Can you explain more about what's going
> > on here? Why does waiting for the watermark interrupt to fire prevent
> > lockups? I would have imagined that the watermark interrupt would be
> > part of the geni hardware and have nothing to do with the firmware
> > running on the other end, so I'm not sure why it firing somehow would
> > prevent a lockup. Was this just by trial and error?
> 
> Actually, the more I look at it the more confused I am about your
> qcom_geni_serial_clear_tx_fifo(). Can you explain and maybe add some
> inline comments in the function since it's not obvious? Specifically,
> things I'm confused about with your patch:
> 
> 1. The function is named qcom_geni_serial_clear_tx_fifo() which
> implies that when it finishes that the hardware FIFO will have nothing
> in it. ...but how does your code ensure this?

Yeah, I realised after I sent out the series that this may not be the
case. I was under the impression that cancelling a command would discard
the data in the FIFO (e.g. when starting the next command) but that was
probably an error in my mental model.

Do you see any way to discard the FIFO in the docs you have access to?
 
> 2. If the function is really clearing the FIFOs then why do we need to
> adjust the watermark level? The fact that you need to adjust the
> watermark levels implies (to me) that there are things stuck in the
> FIFO still. ...but then what happens to those characters? When are
> they sent?

Exactly, there is data there according to the FIFO status, but I
erroneously interpreted it as a it would be discarded (e.g. when
starting the next command).

> 3. On my hardware you're setting the FIFO level to 16 here. The docs I
> have say that if the FIFO level is "less than" the value you set here
> then the interrupt will go off and further clarifies that if you set
> the register to 1 here then you'll get interrupted when the FIFO is
> empty. So what happens with your solution if the FIFO is completely
> full? In that case you'd have to set this to 17, right? ...but then I
> could believe that might confuse the interrupt handler which would get
> told to start transmitting when there is no room for anything.

Indeed. I may implicitly be relying on the absence of hardware flow
control as well so that waiting for one character to be sent is what
makes this work.

> Maybe something is missing in my mental model here and testing your
> patch and hitting Ctrl-C seems to work, but I don't really understand
> why so hopefully you can clarify! :-)

I spent too much time trying to reverse engineer this hw over the
weekend and wanted to get this out as a counter proposal as it indicated
that we may be able to find a smaller fix. The series addresses the
serial getty issues, but as I mentioned yesterday there is some
interaction with the console left to be resolved before this can be an
alternative.

If it wasn't for the hard lockup I would have sent the whole thing as
an RFC.

Johan

