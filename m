Return-Path: <linux-arm-msm+bounces-21308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 082538D656F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A4D288BD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CA674BE2;
	Fri, 31 May 2024 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCEpMIhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC4074E3D;
	Fri, 31 May 2024 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717168418; cv=none; b=jt19rj4W6FypS99RqxawNb26ul+TKj+ExbSg5ziUZlmsufjtUj7gE9DfsJ9ZMet0TkMaTntIxsbBzJp6WXoDNNepL3iUf+4xw9Unk76QxBcal5yvjtKl+pvbaw5dCEwXCALliPscCTNRmqxjOoZC6oqKthQ4+m0sWmzZ6876wDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717168418; c=relaxed/simple;
	bh=6nPDK0mxpYsWJ6HFcH3NKwrXj8AR0/HGDru3QUYz1Fo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jT1oua5l2/vkdu6q/4v+u2Ev8i+1ocJ7ok/KZqV5tX8QKRlx+m1YeYKizt1F4IQsPTjJpWUHvgb429ERlEeZi9TNDE4vY58HGUEDSEifUJA82aqtk7JF1D642oXJ90i1E2OBPPwy9TyaUjtt6jdDwclYnk2EqaYeGUSD9ayGq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCEpMIhy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717168416; x=1748704416;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6nPDK0mxpYsWJ6HFcH3NKwrXj8AR0/HGDru3QUYz1Fo=;
  b=KCEpMIhyRDM9sXd7CCkm485JX4fa/F7kThFL+kmWfwRxQKeiwQ5rtjvh
   Neyt+8ArSBCq7EudRbrPqqvau9ZpfN7oj+6lr0Pcyb6+qpun8v4lC/hSU
   W2eFFbiv60Iov1jiaIOV7NUDODLOckgBnqJEPEGDmOyTs3ohVhV8G5CDp
   /aaPmTkRRPdT650hdTSEBW//jiOx4ty1EFdF/Qbl/eCuNYeYnqslFzY4+
   2x7FJiDPsx894flZqyeoN5utytu7iLUMiCtodfz8LUnlaq2U/20IRChl3
   AFJcmtAEHTbGTzJltuHZVpa5/EQu5bR03KXdAvwXDL7pJZW7bv2Zxk5Lf
   w==;
X-CSE-ConnectionGUID: +eDpn7WDT7O1fDODteqhzg==
X-CSE-MsgGUID: O/sXWrZ6Qd+wLsiivzn4cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13534190"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13534190"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:13:35 -0700
X-CSE-ConnectionGUID: XDBG4tgmTxesqIo669ObQA==
X-CSE-MsgGUID: PFZaJqeiR5Kf5OSbn4Yn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36271538"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.152])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:13:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 31 May 2024 18:13:26 +0300 (EEST)
To: Douglas Anderson <dianders@chromium.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org, 
    John Ogness <john.ogness@linutronix.de>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
    Tony Lindgren <tony@atomide.com>, Stephen Boyd <swboyd@chromium.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    Yicong Yang <yangyicong@hisilicon.com>, 
    Johan Hovold <johan+linaro@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Konrad Dybcio <konrad.dybcio@linaro.org>, 
    Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH v2 6/7] serial: qcom-geni: Fix suspend while active UART
 xfer
In-Reply-To: <20240530154553.v2.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
Message-ID: <5e4b2c9a-aa78-6ee6-f570-baf343cf2569@linux.intel.com>
References: <20240530224603.730042-1-dianders@chromium.org> <20240530154553.v2.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 May 2024, Douglas Anderson wrote:

> On devices using Qualcomm's GENI UART it is possible to get the UART
> stuck such that it no longer outputs data. Specifically, I could
> reproduce this problem by logging in via an agetty on the debug serial
> port (which was _not_ used for kernel console) and running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles.
> 
> Digging into this showed a number of problems that are all related.
> 
> The root of the problems was with qcom_geni_serial_stop_tx_fifo()
> which is called as part of the suspend process. Specific problems with
> that function:
> - When we cancel an in-progress "tx" command it doesn't appear to
>   fully drain the FIFO. That meant qcom_geni_serial_tx_empty()
>   continued to report that the FIFO wasn't empty. The
>   qcom_geni_serial_start_tx_fifo() function didn't re-enable
>   interrupts in this case so we'd never start transferring again.
> - We cancelled the current "tx" command but we forgot to zero out
>   "tx_remaining". This confused logic elsewhere in the driver
> - From experimentation, it appears that cancelling the "tx" command
>   could drop some of the queued up bytes. While maybe not the end of
>   the world, it doesn't seem like we should be dropping bytes when
>   stopping the FIFO, which is defined more of a "pause".
> 
> One idea to fix the above would be to add FIFO draining to
> qcom_geni_serial_stop_tx_fifo(). However, digging into the
> documentation in serial_core.h for stop_tx() makes this seem like the
> wrong choice. Specifically stop_tx() is called with local interrupts
> disabled. Waiting for a FIFO (which might be 64 bytes big) to drain at
> 115.2 kbps doesn't seem like a wise move.
> 
> Ideally qcom_geni_serial_stop_tx_fifo() would be able to pause the
> transmitter, but nothing in the documentation for the GENI UART makes
> me believe that is possible.
> 
> Given the lack of better choices, we'll change
> qcom_geni_serial_stop_tx_fifo() to simply disable the
> TX_FIFO_WATERMARK interrupt and call it a day. This seems OK as per
> the serial core docs since stop_tx() is supposed to stop transferring
> bytes "as soon as possible" and there doesn't seem to be any possible
> way to stop transferring sooner. As part of this, get rid of some of
> the extra conditions on qcom_geni_serial_start_tx_fifo() which simply
> weren't needed and are now getting in the way. It's always fine to
> turn the interrupts on if we want to receive and it'll be up to the
> IRQ handler to turn them back off if somehow they're not needed. This
> works fine.
> 
> Unfortunately, doing just the above change causes new/different
> problems with suspend/resume. Now if you suspend while an active
> transfer is happening you can find that after resume time you're no
> longer receiving UART interrupts at all. It appears to be important to
> drain the FIFO and send a "cancel" command if the UART is active to
> avoid this. Since we've already decided that
> qcom_geni_serial_stop_tx_fifo() shouldn't be doing this, let's add the
> draining / cancelling logic to the shutdown() call where it should be
> OK to delay a bit. This is called as part of the suspend process via
> uart_suspend_port().
> 
> Finally, with all of the above, the test case where we're spamming the
> UART with data and going through suspend/resume cycles doesn't kill
> the UART and doesn't drop bytes.
> 
> NOTE: though I haven't gone back and validated on ancient code, it
> appears from code inspection that many of these problems have existed
> since the start of the driver. In the very least, I could reproduce
> the problems on vanilla v5.15. The problems don't seem to reproduce
> when using the serial port for kernel console output and also don't
> seem to reproduce if nothing is being printed to the console at
> suspend time, so this is presumably why they were not noticed until
> now.

Hi,

This was quite tiring to read. :-) It's has lots of useful information but 
it could be structured better.

Could you try to rewrite this entire description so that it's easier to 
find the problem and final solution information from it. Start with those 
two things, and in that part, try to avoid detouring to extra branches you 
took while finding and solving the problem.

You can place how the problem can be reproduced after you've described the 
root cause & final solution first. Extra information why some other 
approaches do not work is also useful information, but please place it 
after the final solution has been covered first.

Also, try to avoid I/you/we, use imperative tone.

-- 
 i.


> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> There are still a number of problems with GENI UART after this but
> I've kept this change separate to make it easier to understand.
> Specifically on mainline just hitting "Ctrl-C" after dumping
> /var/log/messages to the serial port hangs things after the kfifo
> changes. Those issues will be addressed in future patches.
> 
> Changes in v2:
> - Totally rework / rename patch to handle suspend while active xfer
> 
>  drivers/tty/serial/qcom_geni_serial.c | 97 +++++++++++++++++++++------
>  1 file changed, 75 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index d7814f9e5c26..10aeb0313f9b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -131,6 +131,7 @@ struct qcom_geni_serial_port {
>  	bool brk;
>  
>  	unsigned int tx_remaining;
> +	unsigned int tx_total;
>  	int wakeup_irq;
>  	bool rx_tx_swap;
>  	bool cts_rts_swap;
> @@ -337,11 +338,14 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>  
>  static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
>  {
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
>  	u32 m_cmd;
>  
>  	writel(xmit_size, uport->membase + SE_UART_TX_TRANS_LEN);
>  	m_cmd = UART_START_TX << M_OPCODE_SHFT;
>  	writel(m_cmd, uport->membase + SE_GENI_M_CMD0);
> +
> +	port->tx_total = xmit_size;
>  }
>  
>  static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
> @@ -361,6 +365,64 @@ static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
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
> +	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, 0xffffffff,
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
> @@ -681,37 +743,18 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
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
> @@ -1093,7 +1136,15 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
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
> @@ -1102,6 +1153,8 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
>  
>  	qcom_geni_serial_stop_tx(uport);
>  	qcom_geni_serial_stop_rx(uport);
> +
> +	qcom_geni_serial_drain_tx_fifo(uport);
>  }
>  
>  static int qcom_geni_serial_port_setup(struct uart_port *uport)
> @@ -1560,7 +1613,7 @@ static const struct uart_ops qcom_geni_console_pops = {
>  	.startup = qcom_geni_serial_startup,
>  	.request_port = qcom_geni_serial_request_port,
>  	.config_port = qcom_geni_serial_config_port,
> -	.shutdown = qcom_geni_serial_shutdown,
> +	.shutdown = qcom_geni_serial_shutdown_fifo,
>  	.type = qcom_geni_serial_get_type,
>  	.set_mctrl = qcom_geni_serial_set_mctrl,
>  	.get_mctrl = qcom_geni_serial_get_mctrl,
> @@ -1582,7 +1635,7 @@ static const struct uart_ops qcom_geni_uart_pops = {
>  	.startup = qcom_geni_serial_startup,
>  	.request_port = qcom_geni_serial_request_port,
>  	.config_port = qcom_geni_serial_config_port,
> -	.shutdown = qcom_geni_serial_shutdown,
> +	.shutdown = qcom_geni_serial_shutdown_dma,
>  	.type = qcom_geni_serial_get_type,
>  	.set_mctrl = qcom_geni_serial_set_mctrl,
>  	.get_mctrl = qcom_geni_serial_get_mctrl,
> 

