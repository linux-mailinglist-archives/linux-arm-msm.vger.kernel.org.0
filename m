Return-Path: <linux-arm-msm+bounces-56191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA660AA41E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 06:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F2F116C8A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 04:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BF51DD889;
	Wed, 30 Apr 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MB4UNh+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606581C84D5;
	Wed, 30 Apr 2025 04:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987456; cv=none; b=BPytZOiSEm6Hl4Ge2PhsqsJVPV0i0pwl28ZeLiYIOsSFjlAPS9UZbzI0yMPnLVIBmraEzVvWUpJPtw3jgfaAbGbtuXaPcbnQQAI8naHXX6I9WvQWVuePpEgSR04WmMGUjPYFsn7vYqGvZoc7ER1DxxUv1egY2k2Z2nsOiA7BL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987456; c=relaxed/simple;
	bh=Pit2CgoCB0xiMreoMAw4nX84ze5/3nKJOIzfhujSJ5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrJKZ9zPOZIRJhTorME6AARXSzQhVV+2whRCdvXqfeJGOUrKClNOVFokNGQvLJ0M9LGg7H/5joT4F0MfchVNOVLVnk+RE2HC8bNsS7L5oksA3rA9lW3FjDmxt7QWQE9omwcIOsTtPt/4ktc2J1991BDNLUOUKYops76lakx4gU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MB4UNh+O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED90C4CEE9;
	Wed, 30 Apr 2025 04:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745987455;
	bh=Pit2CgoCB0xiMreoMAw4nX84ze5/3nKJOIzfhujSJ5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MB4UNh+OqYAjIaIqEP1X731zD1floqa80U7If1kq1hNkMNeAOHfHcyZzY9bouzHjs
	 pahraQp/lHQI17uG06fZ9JiJS4FU6ZredOu9jc0DdcJPLzdLML7AbJspvtmsBqLjyK
	 bCc26bCzexTFnfi8KKaZqzws4ttIT18luTIqjWmXybWLq7LmlJpNyomYtOkvaMqQjB
	 CUK3y8Dhttk4LIyts3E8cuR0gopxHyKIxqMEB3hY3JoYCkhx9vi2xTaMwOixi4BU5c
	 X4NjeaCxdzSxTxf4h2TZmMa1f9llJqPahN/LdZlpJsj7t0B2+fzGn4QZLhYlN8StON
	 rlF4Id+XCX+sQ==
Message-ID: <b38a1ebf-90ce-4f95-b310-08145a588439@kernel.org>
Date: Wed, 30 Apr 2025 06:30:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: Enable support for half-duplex mode
To: Anup Kulkarni <quic_anupkulk@quicinc.com>, gregkh@linuxfoundation.org,
 johan+linaro@kernel.org, dianders@chromium.org, konradybcio@kernel.org,
 u.kleine-koenig@baylibre.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Cc: andersson@kernel.org, quic_msavaliy@quicinc.com, quic_vdadhani@quicinc.com
References: <20250429104339.321962-1-quic_anupkulk@quicinc.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250429104339.321962-1-quic_anupkulk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29. 04. 25, 12:43, Anup Kulkarni wrote:
> Currently the RTS pin is used as flow control in the UART controller by
> default.For half-duplex modes, use the RTS pin for direction control to
> prevent data collisions by allowing only one direction at a time. Utilize
> the rs485 structure and callbacks in the serial core framework to support
> half-duplex modes. Use the IOCTL value, 'TIOCSRS485', and the 'struct
> serial_rs485' supported by the serial framework to implement support for
> related callbacks. Enable RS485 mode with these callbacks.
> 
> Signed-off-by: Anup Kulkarni <quic_anupkulk@quicinc.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 61 ++++++++++++++++++++++++++-
>   1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index a80ce7aaf309..ad3c63cecda0 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
...
> @@ -637,6 +650,7 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
>   	struct tty_port *tport = &uport->state->port;
>   	unsigned int xmit_size;
>   	u8 *tail;
> +	bool pin_state;
>   	int ret;
>   
>   	if (port->tx_dma_addr)
> @@ -648,6 +662,12 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
>   	xmit_size = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
>   			UART_XMIT_SIZE);
>   
> +	if (uport->rs485.flags & SER_RS485_ENABLED) {
> +	/* For RS485 mode, the RTS can be set/cleared before transmission */
> +		pin_state = !!(uport->rs485.flags & SER_RS485_RTS_ON_SEND);

That !! is unnecessary.

> +		qcom_geni_set_rts_pin(uport, pin_state);
> +	}
> +
>   	qcom_geni_serial_setup_tx(uport, xmit_size);
>   
>   	ret = geni_se_tx_dma_prep(&port->se, tail, xmit_size,
...
> @@ -1055,8 +1076,17 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>   	}
>   
>   	if (dma) {
> -		if (dma_tx_status & TX_DMA_DONE)
> +		if (dma_tx_status & TX_DMA_DONE) {
>   			qcom_geni_serial_handle_tx_dma(uport);
> +			// Check if RS485 mode is enabled
> +			if (uport->rs485.flags & SER_RS485_ENABLED) {
> +				// Determine the RTS pin state based on the
> +				// RS485 RTS_AFTER_SEND flag.
> +				pin_state = !!(uport->rs485.flags & SER_RS485_RTS_AFTER_SEND);

The same here.

> +				// Set or clear the RTS pin according to the determined state
> +				qcom_geni_set_rts_pin(uport, pin_state);
> +		}
> +	}
>   
>   		if (dma_rx_status) {
>   			if (dma_rx_status & RX_RESET_DONE)
> @@ -1594,6 +1624,29 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>   	}
>   }
>   
> +/**
> + * qcom_geni_rs485_config - Configure RS485 settings for the UART port
> + * @uport: Pointer to the UART port structure
> + * @termios: Pointer to the termios structure
> + * @rs485: Pointer to the RS485 configuration structure
> + *
> + * This function configures the RTS (Request to Send) pin behavior for RS485 mode.
> + * When RS485 mode is enabled, the RTS pin is kept in the ACTIVE state.
> + * When RS485 mode is disabled, the RTS pin is controlled by the QUP hardware for auto flow control.
> + *
> + * Return: Always returns 0.
> + */
> +

This \n is superfluous. IIRC it is even problematic for kernel-doc.

> +static int qcom_geni_rs485_config(struct uart_port *uport,
> +				  struct ktermios *termios, struct serial_rs485 *rs485)
> +{
> +	if (rs485->flags & SER_RS485_ENABLED)
> +		qcom_geni_set_rts_pin(uport, true); // Set RTS pin to ACTIVE state

C style comments ^^ and vv.

> +	else
> +		writel(0, uport->membase + SE_UART_MANUAL_RFR); // Revert to auto flow control
> +	return 0;
> +}
> +
>   static const struct uart_ops qcom_geni_console_pops = {
>   	.tx_empty = qcom_geni_serial_tx_empty,
>   	.stop_tx = qcom_geni_serial_stop_tx_fifo,

thanks,
-- 
js
suse labs

