Return-Path: <linux-arm-msm+bounces-21306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC38D6502
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CCCC1F22452
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FFE6CDCC;
	Fri, 31 May 2024 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0Y2n+7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CE57CAC;
	Fri, 31 May 2024 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717167490; cv=none; b=SOitnZVRC4wvhwkfP1lR+tOxq/vdwy26F/6sq13TzP7+e2TUslc0kl01HhIkBWaqxBqs6pdmzV39Rh8RLm1WC2s+z6IKxgSnH0LqEGlW3t5WWegsr5XJ4eRV2q3f39IU3lsp3QxlmNv6qiAWabJGhT4RiwZDB3AJxopr+BB20hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717167490; c=relaxed/simple;
	bh=guC3Efigyil0S3SxtobdMAomm8kQ8iXzg+HWuL6hpOs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XerCNS7UDV+W+KPOXo2yr3FwpAyes+pBI8X96zvw4gPNLSKpL3bUTyBZhugucKFjXZUEKndIiiuhxFFuMa9I96MDLVOloCUxUkgSAvRn6s/LfOw+DXHl8aYYgWBGzBJTfVjO1DsBQyXukxir6+CDMXKDpLz3Xbo/588brktJEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0Y2n+7y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717167490; x=1748703490;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=guC3Efigyil0S3SxtobdMAomm8kQ8iXzg+HWuL6hpOs=;
  b=J0Y2n+7yME4zAREiHSm3vMHTvu+Z5eXq5Zk6NTV9YPHjTzbaNZjtSVYx
   V+sf/u1xBbQBzPBWT1j0JSGznk5V4ai7fUEkElcv+PICLQsZ+LTIwegrv
   UW4MK9usI5+CkT6CFBCp+P1CIgLTCunOytEH9STw10PZdfumsd3djuYBF
   9reW3bNDhmP6SpnShkEsbmEXrYhMlZleH8o3WPErOZ2pV3hptxeKhO2y0
   kAxqI5R2o0o1rQAEGodBn69uzczX/bUKkdM5sPgiJUlkEaoSB4qU3GfrX
   ocGdNyu57o7J0TbC2gGv5Ti6Wv1MD42X029tfjbMbIZnNUAEWAa0eOWep
   w==;
X-CSE-ConnectionGUID: GL0DbUrmSSa8WlGmkNhjeg==
X-CSE-MsgGUID: ZP5jXrqySbSGCbfGDgbtFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17543863"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17543863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:58:09 -0700
X-CSE-ConnectionGUID: xpS9hxDTT72W9A1inqvudA==
X-CSE-MsgGUID: FAW2eByGTHmqmrkY3wCBWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36645406"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.152])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:58:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 31 May 2024 17:57:59 +0300 (EEST)
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
    Thomas Gleixner <tglx@linutronix.de>, 
    Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH v2 2/7] serial: qcom-geni: Fix the timeout in
 qcom_geni_serial_poll_bit()
In-Reply-To: <20240530154553.v2.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Message-ID: <d68297dd-302e-9780-d141-34531faa13af@linux.intel.com>
References: <20240530224603.730042-1-dianders@chromium.org> <20240530154553.v2.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 May 2024, Douglas Anderson wrote:

> The qcom_geni_serial_poll_bit() is supposed to be able to be used to
> poll a bit that's will become set when a TX transfer finishes. Because
> of this it tries to set its timeout based on how long the UART will
> take to shift out all of the queued bytes. There are two problems
> here:
> 1. There appears to be a hidden extra word on the firmware side which
>    is the word that the firmware has already taken out of the FIFO and
>    is currently shifting out. We need to account for this.
> 2. The timeout calculation was assuming that it would only need 8 bits
>    on the wire to shift out 1 byte. This isn't true. Typically 10 bits
>    are used (8 data bits, 1 start and 1 stop bit), but as much as 13
>    bits could be used (14 if we allowed 9 bits per byte, which we
>    don't).
> 
> The too-short timeout was seen causing problems in a future patch
> which more properly waited for bytes to transfer out of the UART
> before cancelling.
> 
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - New
> 
>  drivers/tty/serial/qcom_geni_serial.c | 32 ++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 2bd25afe0d92..32e025705f99 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -271,7 +271,8 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>  	u32 reg;
>  	struct qcom_geni_serial_port *port;
>  	unsigned int baud;
> -	unsigned int fifo_bits;
> +	unsigned int max_queued_bytes;
> +	unsigned int max_queued_bits;
>  	unsigned long timeout_us = 20000;
>  	struct qcom_geni_private_data *private_data = uport->private_data;
>  
> @@ -280,12 +281,37 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>  		baud = port->baud;
>  		if (!baud)
>  			baud = 115200;
> -		fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
> +
> +		/*
> +		 * Add 1 to tx_fifo_depth to account for the hidden register
> +		 * on the firmware side that can hold a word.
> +		 */
> +		max_queued_bytes =
> +			DIV_ROUND_UP((port->tx_fifo_depth + 1) * port->tx_fifo_width,
> +				     BITS_PER_BYTE);
> +
> +		/*
> +		 * The maximum number of bits per byte on the wire is 13 from:
> +		 * - 1 start bit
> +		 * - 8 data bits
> +		 * - 1 parity bit
> +		 * - 3 stop bits
> +		 *
> +		 * While we could try count the actual bits per byte based on
> +		 * the port configuration, this is a rough timeout anyway so
> +		 * using the max is fine.
> +		 */
> +		max_queued_bits = max_queued_bytes * 13;
> +
>  		/*
>  		 * Total polling iterations based on FIFO worth of bytes to be
>  		 * sent at current baud. Add a little fluff to the wait.
> +		 *
> +		 * NOTE: this assumes that flow control isn't used, but with
> +		 * flow control we could wait indefinitely and that wouldn't
> +		 * be OK.
>  		 */
> -		timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> +		timeout_us = ((max_queued_bits * USEC_PER_SEC) / baud) + 500;

You should try to generalize the existing uart_fifo_timeout() to suit what 
you're trying to do here instead of writing more variants of code with 
this same intent.

-- 
 i.


