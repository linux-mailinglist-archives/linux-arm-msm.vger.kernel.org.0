Return-Path: <linux-arm-msm+bounces-24227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D19179F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 180BE1C20A3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 07:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECDB15AD83;
	Wed, 26 Jun 2024 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJikzk+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619AF158DA2;
	Wed, 26 Jun 2024 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719387733; cv=none; b=bMlZUOFz1sjIAurMwydmsMkF0aWP4b9jw0BHwAc4y3SeFsynPCZBqJDEPd+yR2+bf/WtjLzv0jTZxVKew7rUP7Ew9GecwZHSaURO+YUI8lgne1inbLDsChBJaTZgLunLeFXATQGM4D2v72wgId3yBQsxtIQ8ntlQbim5L2sbJHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719387733; c=relaxed/simple;
	bh=dB83+lS8DT+Bwbmqz303OM73yCGI1mgZtovsGSCsPHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eb+eeC9o2niWMENuUJa+wcMJml/47yyvwlPmqlxy1YLQk1x5RehEIynzhEaqqIigSYlrN93zh8nGfND0BrdiRn9HG/UJE1PFAuH/bQd4jjf3RPZTgzKs0iarFNqN9bw1hhRxpW+9UMQMeQIjBxI0WqHU+nmek/baUlr1j6mZ/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJikzk+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D5CC2BD10;
	Wed, 26 Jun 2024 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719387732;
	bh=dB83+lS8DT+Bwbmqz303OM73yCGI1mgZtovsGSCsPHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJikzk+xmMFkDtkMUhV2R95zS7ukxoX9o8YFfztlj75TPHUKRvUkXFiZczDgh095K
	 ZozrmmebDCZg9vqXti140BhJjTskn7g6CINQrAbGqR5Rm9pIVtsBoJH9H4GJ1yitP/
	 6m4lhiZtl5rXNlUhUw3SyctCyVenI/ALunH3Qg1BMvPfm0w0lcmYo9tA1s47VI7Ghc
	 988dWdDn7hmTAqfmO6B0X7PoPjOjXR2Icpk1bWk8ClZAfWtuixh++MLVvGKzQcBJyh
	 ZbG6/qh8pcWcuftc1Hol3JDeZWomcIvTbN7bZolrqz0GTlQcragronQkhLfc0GIr56
	 nfSthlSFdFyng==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMNIM-000000007lD-0vjH;
	Wed, 26 Jun 2024 09:42:22 +0200
Date: Wed, 26 Jun 2024 09:42:22 +0200
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
Message-ID: <ZnvGXiWdwNKl7MHA@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-3-johan+linaro@kernel.org>
 <CAD=FV=UauWffRM45FsU2SHoKtkVaOEf=Adno+jV+Ashf7NFHuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UauWffRM45FsU2SHoKtkVaOEf=Adno+jV+Ashf7NFHuA@mail.gmail.com>

On Mon, Jun 24, 2024 at 02:23:52PM -0700, Doug Anderson wrote:
> On Mon, Jun 24, 2024 at 6:31 AM Johan Hovold <johan+linaro@kernel.org> wrote:

> > @@ -665,16 +660,28 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
> >  static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
> >  {
> >         u32 irq_en;
> > -       struct qcom_geni_serial_port *port = to_dev_port(uport);
> >
> >         irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
> >         irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
> >         writel(0, uport->membase + SE_GENI_TX_WATERMARK_REG);
> >         writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> > -       /* Possible stop tx is called multiple times. */
> 
> If qcom_geni_serial_stop_tx_fifo() is supposed to be used for UART
> flow control and you have a way to stop the transfer immediately
> without losing data (by using geni_se_cancel_m_cmd), maybe we should
> do that? If the other side wants us to stop transferring data and we
> can stop it right away that would be ideal...

Right, but since cancelling commands seems fragile at best (e.g.
potentially lost data, lockups) it seems best to just let the fifo
drain. But sure, if we can get cancel and restart to work reliably
eventually then even better.

> > +}
> > +
> > +static void qcom_geni_serial_clear_tx_fifo(struct uart_port *uport)
> > +{
> > +       struct qcom_geni_serial_port *port = to_dev_port(uport);
> > +
> >         if (!qcom_geni_serial_main_active(uport))
> >                 return;
> >
> > +       /*
> > +        * Increase watermark level so that TX can be restarted and wait for
> > +        * sequencer to start to prevent lockups.
> > +        */
> > +       writel(port->tx_fifo_depth, uport->membase + SE_GENI_TX_WATERMARK_REG);
> > +       qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> > +                                       M_TX_FIFO_WATERMARK_EN, true);
> 
> Oh, maybe this "wait for sequencer to start to prevent lockups." is
> the part that I was missing? Can you explain more about what's going
> on here? Why does waiting for the watermark interrupt to fire prevent
> lockups? I would have imagined that the watermark interrupt would be
> part of the geni hardware and have nothing to do with the firmware
> running on the other end, so I'm not sure why it firing somehow would
> prevent a lockup. Was this just by trial and error?

Yes, I saw two kinds of lockups in my experiments. The first was due to
data being left in the fifo so that the watermark interrupt never fired
on start_tx(), but there was one more case where it seemed like the hw
would get stuck if a cancel command was issues immediately after a new
command had been started.

Waiting for one character to be sent to avoid that race and seems to
address the latter hang.

Note that I hit this also when never filling the FIFO completely (e.g.
so that a watermark of 16 should have fired as there were never more
than 15 words in the fifo).

> > @@ -684,6 +691,8 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
> >                 writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
> >         }
> >         writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
> > +
> > +       port->tx_remaining = 0;
> >  }
> >
> >  static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
> > @@ -1069,11 +1078,10 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
> >  {
> >         disable_irq(uport->irq);
> >
> > -       if (uart_console(uport))
> > -               return;
> 
> Can you explain this part of the patch? I'm not saying it's wrong to
> remove this special case since this driver seems to have lots of
> needless special cases that are already handled by the core or by
> other parts of the driver, but this change seems unrelated to the rest
> of the patch. Could it be a separate patch?

We need to stop tx and clear the FIFO also when the port is used as a
console.

I added back the above check in commit 9aff74cc4e9e ("serial: qcom-geni:
fix console shutdown hang") as a quick way to work around a previous
regression where we would hit this soft lockup. With the issue fixed,
the workaround is no longer needed.

Johan

