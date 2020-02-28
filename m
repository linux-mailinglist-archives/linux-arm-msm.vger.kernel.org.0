Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C8017432B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 00:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgB1XdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 18:33:05 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39393 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB1XdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 18:33:05 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so1828345plp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 15:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sn5GXMIGwl26J0A2bH2+Hj/TmmTI1dt3PT8+BN12Qxo=;
        b=U2w15Sqi1qH+a7S8nZw4/e2p+gCc4zjYUDd4jOc/HPLwMtw84S907xCHmri8NFC5xu
         QiIZ9MHbeNvAKizc8u1i/WjHnSjjHi1KkGuKaYwNr5neRxuNtFiNG6j9tuP5s7HwT1+N
         nA+oDth3pH3yszaxls9HKLLlAQ2MXmapyP0vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sn5GXMIGwl26J0A2bH2+Hj/TmmTI1dt3PT8+BN12Qxo=;
        b=mKpcjtnjMXFBZajw3JeEzt4jyXBANQa/Js4n4T5WUuI8Ndmz6m3aqgF0PY0dVMUodw
         ZQfoEOKDmEdS8ea67RccYN7fAHnNUShTVnA1r5VTKO9uausYOKgQl7kr18rS/CL3ImTC
         7VMOk56c01u7ARCq27jzhQ9MlQMyIUFu3LkkHOQYJs2l3rBku52ZLvtRc4NyFR57y75h
         yoZeHc6Fy8GplkRhgG5DxxUZAIjFHD/id9bS7z0JCVWuYYNJ+rt0JciiKHJl9QYydzO4
         +aEjP2kWmL7y3K1jUYN1BXv313xFEiAkIq8k5E8wf43KqWQ9abcNGsXA44lXTgGWEcQn
         ezJQ==
X-Gm-Message-State: APjAAAXHuBxL4j30Eje/BpKbc2ikniWBQfkqtcHbWKJiq3LzM6oyoHLl
        BaYEtsYW3DyYmQvuywbvUTOExw==
X-Google-Smtp-Source: APXvYqzD0VVHoZHU8BvAHy/7+a/mWne3NJuZdgZCDcRMHEXt6xKMiMfEFDXHCuKZl3oTBviA6+Zg7A==
X-Received: by 2002:a17:90b:3c9:: with SMTP id go9mr7170956pjb.7.1582932782453;
        Fri, 28 Feb 2020 15:33:02 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id t189sm12356006pfd.168.2020.02.28.15.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 15:33:01 -0800 (PST)
Date:   Fri, 28 Feb 2020 15:33:00 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        skakit@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3] tty: serial: qcom_geni_serial: Support pin swapping
Message-ID: <20200228233300.GO24720@google.com>
References: <20200228124810.31543-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228124810.31543-1-rojay@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 28, 2020 at 06:18:10PM +0530, Roja Rani Yarubandi wrote:
> Add capability to supoort RX-TX, CTS-RTS pins swap in HW.
> 
> Configure UART_IO_MACRO_CTRL register accordingly if RX-TX pair
> or CTS-RTS pair or both pairs swapped.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
> Changes in V2:
> - As per Greg's comment removed the change id.
> 
> Changes in V3:
> - As per Bjorn's comment using of_property_read_bool() to read dtsi entries.
> - As per Matthias's comment add capability to support individual pairs swap,
>   that is, only RX-TX swap and only CTS-RTS swap cases.
> 
> Dt-bindings support for this is posted at
> https://patchwork.kernel.org/patch/11385969/
> 
>  drivers/tty/serial/qcom_geni_serial.c | 30 +++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 191abb18fc2a..2ad041cde4d7 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -21,6 +21,7 @@
>  
>  /* UART specific GENI registers */
>  #define SE_UART_LOOPBACK_CFG		0x22c
> +#define SE_UART_IO_MACRO_CTRL		0x240
>  #define SE_UART_TX_TRANS_CFG		0x25c
>  #define SE_UART_TX_WORD_LEN		0x268
>  #define SE_UART_TX_STOP_BIT_LEN		0x26c
> @@ -95,6 +96,12 @@
>  #define CTS_RTS_SORTED	BIT(1)
>  #define RX_TX_CTS_RTS_SORTED	(RX_TX_SORTED | CTS_RTS_SORTED)
>  
> +/* UART pin swap value */
> +#define DEFAULT_IO_MACRO_IO0_IO1_MASK		GENMASK(3, 0)
> +#define IO_MACRO_IO0_SEL		GENMASK(1, 0)

not sure the use of GENMASK adds value here since it's not a mask, I
rather find it obfuscating, IMO just 0x03 / 0x3 would be clearer.

> +#define DEFAULT_IO_MACRO_IO2_IO3_MASK		GENMASK(15, 4)
> +#define IO_MACRO_IO2_IO3_SWAP		0x4640
> +
>  #ifdef CONFIG_CONSOLE_POLL
>  #define CONSOLE_RX_BYTES_PW 1
>  #else
> @@ -119,6 +126,8 @@ struct qcom_geni_serial_port {
>  
>  	unsigned int tx_remaining;
>  	int wakeup_irq;
> +	bool rx_tx_swap;
> +	bool cts_rts_swap;
>  };
>  
>  static const struct uart_ops qcom_geni_console_pops;
> @@ -826,6 +835,7 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
>  	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>  	u32 rxstale = DEFAULT_BITS_PER_CHAR * STALE_TIMEOUT;
>  	u32 proto;
> +	u32 pin_swap;
>  
>  	if (uart_console(uport)) {
>  		port->tx_bytes_pw = 1;
> @@ -846,6 +856,20 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
>  	get_tx_fifo_size(port);
>  
>  	writel(rxstale, uport->membase + SE_UART_RX_STALE_CNT);
> +
> +	pin_swap = readl(uport->membase + SE_UART_IO_MACRO_CTRL);
> +	if (port->rx_tx_swap) {
> +		pin_swap &= ~DEFAULT_IO_MACRO_IO2_IO3_MASK;
> +		pin_swap |= IO_MACRO_IO2_IO3_SWAP;
> +	}
> +	if (port->cts_rts_swap) {
> +		pin_swap &= ~DEFAULT_IO_MACRO_IO0_IO1_MASK;
> +		pin_swap |= IO_MACRO_IO0_SEL;
> +	}
> +	/* Configure this register if RX-TX, CTS-RTS pins are swapped */
> +	if (port->rx_tx_swap || port->cts_rts_swap)
> +		writel(pin_swap, uport->membase + SE_UART_IO_MACRO_CTRL);
> +
>  	/*
>  	 * Make an unconditional cancel on the main sequencer to reset
>  	 * it else we could end up in data loss scenarios.
> @@ -1289,6 +1313,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (!console)
>  		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
> +		port->rx_tx_swap = true;
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
> +		port->cts_rts_swap = true;
> +
>  	uport->private_data = drv;
>  	platform_set_drvdata(pdev, port);
>  	port->handle_rx = console ? handle_rx_console : handle_rx_uart;

Tested-by: Matthias Kaehlcke <mka@chromium.org>
(TX/RX swap)
