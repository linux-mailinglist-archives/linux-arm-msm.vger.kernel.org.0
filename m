Return-Path: <linux-arm-msm+bounces-22023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A448FFD64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 09:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA022B221E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 07:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC29915697D;
	Fri,  7 Jun 2024 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZO+zAtL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E3D155C93;
	Fri,  7 Jun 2024 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717746184; cv=none; b=qKhXCtmilFark/WWrM1al6Xtr5DFPD+YZVnjv0U6iFophDZ4xJUioPR5qyfkiSjEwlfCf6+1aG0q1jEDI8Mi3kvBYgl/oL+ifWpvYpT8Dzf3T+BuuDaLZ0TeYoHtspna2PixEgvnimQTPQWVtx7d6YTNwiuioosZzoCS4ngLH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717746184; c=relaxed/simple;
	bh=2Fj1r20Ipaa909NRGvY2/vVd1dWiYoUgS1kgPkKVQV0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gLvsWiPyQQogsUP0YTiZgzqSRw8u++Un/ay65wammbPMsAEtePrmJMhep7B2UDStNYIV7w9Haaj6+grm06wn7ZtfFNh76nikygbewJd3P5mNx3XwxHGvfknwxFU/zfgCSSu6kG9Snl9vsxdz3L2mMJe7nYAqjKAY/QWIGUklMkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZO+zAtL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717746183; x=1749282183;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2Fj1r20Ipaa909NRGvY2/vVd1dWiYoUgS1kgPkKVQV0=;
  b=fZO+zAtL5AClQB9pO1vMzbzowTJeAU2dXBuy/Ui1kmKok5RPlddNNHwb
   /FH58sRrZ/sTVPz2PgNUC1Zi2apu7rQNOw814nw4j0SxhEx3sdiotdz8L
   Smek/Xzs8JBIFkPPFmD7503qvdtPX9gVf7i4qU7dIs+cMlRI2YqrLWTQu
   yXqk6dC+xx1LVK9KRAanKYPP68CTc2PnFLHkfoiyaNysYWg1oC3OSRzrz
   Qv20XLKkn5NCpii/4qDTPSkbW8XZPVZMraUnK7ydzknwVyq+PCJpwHLDQ
   fqHy/HOEXhFrNOjOY0nnBLcFUwj15onOSZ5Ycgbyvn7hqWhoQ/022a2Xe
   g==;
X-CSE-ConnectionGUID: Og1sWsHDRDOHpqIVeTMDlQ==
X-CSE-MsgGUID: KAFc4zjxQha7yVAHRMCdMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14680065"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14680065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:43:02 -0700
X-CSE-ConnectionGUID: dqZkUrA/QGGjaGFIncyaUA==
X-CSE-MsgGUID: DmNFJIUVRFOrmEQ3ncBgxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38096713"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.184])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:42:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 7 Jun 2024 10:42:54 +0300 (EEST)
To: Douglas Anderson <dianders@chromium.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    John Ogness <john.ogness@linutronix.de>, 
    Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>, 
    Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan+linaro@kernel.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH v3 6/7] serial: qcom-geni: Fix suspend while active UART
 xfer
In-Reply-To: <20240604090028.v3.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
Message-ID: <2c5c3d46-5fe2-6678-34ea-647c28f5a4f0@linux.intel.com>
References: <20240604160123.2029413-1-dianders@chromium.org> <20240604090028.v3.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jun 2024, Douglas Anderson wrote:

> On devices using Qualcomm's GENI UART it is possible to get the UART
> stuck such that it no longer outputs data. Specifically, logging in
> via an agetty on the debug serial port (which was _not_ used for
> kernel console) and running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles
> causes the UART to stop transmitting.
> 
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
> 
> NOTE: It would be ideal if qcom_geni_serial_stop_tx_fifo() could
> "pause" the transmitter right away. There is no obvious way to do this
> in the docs and experimentation didn't find any tricks either, so
> stopping TX "as soon as possible" isn't very soon but is the best
> possible.
> 
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> There are still a number of problems with GENI UART after this but
> I've kept this change separate to make it easier to understand.
> Specifically on mainline just hitting "Ctrl-C" after dumping
> /var/log/messages to the serial port hangs things after the kfifo
> changes. Those issues will be addressed in future patches.
> 
> It should also be noted that the "Fixes" tag here is a bit of a
> swag. I haven't gone and tested on ancient code, but at least the
> problems exist on kernel 5.15 and much of the code touched here has
> been here since the beginning, or at least since as long as the driver
> was stable.
> 
> Changes in v3:
> - 0xffffffff => GENMASK(31, 0)
> - Reword commit message.
> 
> Changes in v2:
> - Totally rework / rename patch to handle suspend while active xfer
> 
>  drivers/tty/serial/qcom_geni_serial.c | 97 +++++++++++++++++++++------
>  1 file changed, 75 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 4dbc59873b34..46b6674d90c5 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -130,6 +130,7 @@ struct qcom_geni_serial_port {
>  	bool brk;
>  
>  	unsigned int tx_remaining;
> +	unsigned int tx_total;
>  	int wakeup_irq;
>  	bool rx_tx_swap;
>  	bool cts_rts_swap;
> @@ -311,11 +312,14 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>  
>  static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
>  {
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
>  	u32 m_cmd;
>  
>  	writel(xmit_size, uport->membase + SE_UART_TX_TRANS_LEN);
>  	m_cmd = UART_START_TX << M_OPCODE_SHFT;

Unrelated to this patch and won't belong to this patch but I noticed it 
while reviewing. This could be converted into:

	m_cmd = FIELD_PREP(M_OPCODE_MSK, UART_START_TX);

(and after converting the other use in the header file, the SHFT define 
becomes unused).

>  	writel(m_cmd, uport->membase + SE_GENI_M_CMD0);
> +
> +	port->tx_total = xmit_size;
>  }
>  
>  static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
> @@ -335,6 +339,64 @@ static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
>  	writel(irq_clear, uport->membase + SE_GENI_M_IRQ_CLEAR);
>  }
>  
> +static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +
> +	/*
> +	 * If the main sequencer is inactive it means that the TX command has
> +	 * been completed and all bytes have been sent. Nothing to do in that
> +	 * case.
> +	 */
> +	if (!qcom_geni_serial_main_active(uport))
> +		return;
> +
> +	/*
> +	 * Wait until the FIFO has been drained. We've already taken bytes out
> +	 * of the higher level queue in qcom_geni_serial_send_chunk_fifo() so
> +	 * if we don't drain the FIFO but send the "cancel" below they seem to
> +	 * get lost.
> +	 */
> +	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GENMASK(31, 0),

That GENMASK(31, 0) is a field in a register (even if it covers the 
entire register)? It should be named with a define instead of creating the 
field mask here in an online fashion.

> +				       port->tx_total - port->tx_remaining);
> +
> +	/*
> +	 * If clearing the FIFO made us inactive then we're done--no need for
> +	 * a cancel.
> +	 */
> +	if (!qcom_geni_serial_main_active(uport))
> +		return;
> +
> +	/*
> +	 * Cancel the current command. After this the main sequencer will
> +	 * stop reporting that it's active and we'll have to start a new
> +	 * transfer command.
> +	 *
> +	 * If we skip doing this cancel and then continue with a system
> +	 * suspend while there's an active command in the main sequencer
> +	 * then after resume time we won't get any more interrupts on the
> +	 * main sequencer until we send the cancel.
> +	 */
> +	geni_se_cancel_m_cmd(&port->se);
> +	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> +				       M_CMD_CANCEL_EN, true)) {
> +		/* The cancel failed; try an abort as a fallback. */
> +		geni_se_abort_m_cmd(&port->se);
> +		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> +						M_CMD_ABORT_EN, true);

Misaligned.

-- 
 i.

> +		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
> +	}
> +	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
> +
> +	/*
> +	 * We've cancelled the current command. "tx_remaining" stores how
> +	 * many bytes are left to finish in the current command so we know
> +	 * when to start a new command. Since the command was cancelled we
> +	 * need to zero "tx_remaining".
> +	 */
> +	port->tx_remaining = 0;
> +}
> +
>  static void qcom_geni_serial_abort_rx(struct uart_port *uport)
>  {
>  	u32 irq_clear = S_CMD_DONE_EN | S_CMD_ABORT_EN;
> @@ -655,37 +717,18 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
>  {
>  	u32 irq_en;
>  
> -	if (qcom_geni_serial_main_active(uport) ||
> -	    !qcom_geni_serial_tx_empty(uport))
> -		return;
> -
>  	irq_en = readl(uport->membase +	SE_GENI_M_IRQ_EN);
>  	irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
> -
>  	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
>  }
>  
>  static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
>  {
>  	u32 irq_en;
> -	struct qcom_geni_serial_port *port = to_dev_port(uport);
>  
>  	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
>  	irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
>  	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> -	/* Possible stop tx is called multiple times. */
> -	if (!qcom_geni_serial_main_active(uport))
> -		return;
> -
> -	geni_se_cancel_m_cmd(&port->se);
> -	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> -						M_CMD_CANCEL_EN, true)) {
> -		geni_se_abort_m_cmd(&port->se);
> -		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> -						M_CMD_ABORT_EN, true);
> -		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
> -	}
> -	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
>  }
>  
>  static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
> @@ -1067,7 +1110,15 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
>  }
>  
>  
> -static void qcom_geni_serial_shutdown(struct uart_port *uport)
> +static void qcom_geni_serial_shutdown_dma(struct uart_port *uport)
> +{
> +	disable_irq(uport->irq);
> +
> +	qcom_geni_serial_stop_tx(uport);
> +	qcom_geni_serial_stop_rx(uport);
> +}
> +
> +static void qcom_geni_serial_shutdown_fifo(struct uart_port *uport)
>  {
>  	disable_irq(uport->irq);
>  
> @@ -1076,6 +1127,8 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
>  
>  	qcom_geni_serial_stop_tx(uport);
>  	qcom_geni_serial_stop_rx(uport);
> +
> +	qcom_geni_serial_drain_tx_fifo(uport);
>  }
>  
>  static int qcom_geni_serial_port_setup(struct uart_port *uport)
> @@ -1533,7 +1586,7 @@ static const struct uart_ops qcom_geni_console_pops = {
>  	.startup = qcom_geni_serial_startup,
>  	.request_port = qcom_geni_serial_request_port,
>  	.config_port = qcom_geni_serial_config_port,
> -	.shutdown = qcom_geni_serial_shutdown,
> +	.shutdown = qcom_geni_serial_shutdown_fifo,
>  	.type = qcom_geni_serial_get_type,
>  	.set_mctrl = qcom_geni_serial_set_mctrl,
>  	.get_mctrl = qcom_geni_serial_get_mctrl,
> @@ -1555,7 +1608,7 @@ static const struct uart_ops qcom_geni_uart_pops = {
>  	.startup = qcom_geni_serial_startup,
>  	.request_port = qcom_geni_serial_request_port,
>  	.config_port = qcom_geni_serial_config_port,
> -	.shutdown = qcom_geni_serial_shutdown,
> +	.shutdown = qcom_geni_serial_shutdown_dma,
>  	.type = qcom_geni_serial_get_type,
>  	.set_mctrl = qcom_geni_serial_set_mctrl,
>  	.get_mctrl = qcom_geni_serial_get_mctrl,
> 


