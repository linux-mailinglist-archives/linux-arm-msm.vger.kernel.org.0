Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3E6240A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 20:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfETStm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 14:49:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45442 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfETStm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 14:49:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id s11so7637598pfm.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 11:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vJJECp0MXM+eJWnIRjXUD1/ASNuSVEfMK8V8t4znXkU=;
        b=HZXj+31ZYY4EetINXb7mkWZbDqY6Fg0lbVDC/GCSkTgV+0v3J6syLMb4kqRIvDjfP1
         NHHUIG4SKCx6HjQqY7b6xrv1Gx8dMUYN23qnyrYbxywzlaFq52q5kGkC4L5/rrSXkYkm
         f/OFSAsNoVnXqzbvPzHeIRxiLwh9Ksv6pCHXKgn1wrIzTwKiB54+hV3nccBldLcUxNlZ
         Sw0jTEsPeXnzCQtgYY9KKr49XedDbtVQnTEmoYYYWR0yZ/jGhqj3SQEVBVAZRz6Rhxlt
         +TFjSThQet9+AJ6FRVSdSTeM8I+1P1QRzVmazrDlt3e0GYa3qIAgAJro5NxY6SLMPzeI
         5SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vJJECp0MXM+eJWnIRjXUD1/ASNuSVEfMK8V8t4znXkU=;
        b=Tsfx4IthdAr3sJyiZUGHinBylMLA1TX7NvMabAmNNhzJk3V2QkYg5S2ifrXiTwjZQH
         sD10Cq8HQFnUKLPa+X3FQsRgpPOaP7fHIvV6j7ujWdu7IB7tlhqocT76PaSYwvaZqcnI
         C753fnOFAbRFaSSYwqji7oXWZKHe/8JrvhVNCEvAvURpqG8e+ymZ4YaPZwxlJ+Ip8sYp
         LjdiKWC/i9KauSVsPc7QH13mmA8hQ8XHntJnhS8Y9GpmY4BBy6LQ8tPTCggSXAa9BwyC
         wETv6PQbLX3oIvv2vzEbcH8YBNLoScLwXIT3KOrzMisGPDO4axAceN4ZRfRy40jooQ+d
         7aSA==
X-Gm-Message-State: APjAAAV5PJdZ40P1sJZrA7g9/3sAF/S9DXnsnSw2Zdtunjk7I/dXtZDT
        V6gfK+VA2MtyQtEp5gE02AesFg==
X-Google-Smtp-Source: APXvYqxTXwbbq3D+od0+Bx4gQ0t6J+1TElbsgm6HtmILrAJ+dXlh61nvDyLEYwaqO6JbRCWRpYRL0Q==
X-Received: by 2002:a62:604:: with SMTP id 4mr82640684pfg.38.1558378181831;
        Mon, 20 May 2019 11:49:41 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v40sm25152531pgn.17.2019.05.20.11.49.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 11:49:41 -0700 (PDT)
Date:   Mon, 20 May 2019 11:50:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, sboyd@kernel.org, jslaby@suse.com,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix XON/XOFF
Message-ID: <20190520185008.GX2085@tuxbook-pro>
References: <20190520183848.27719-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520183848.27719-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 May 11:38 PDT 2019, Jorge Ramirez-Ortiz wrote:

> When the tty layer requests the uart to throttle, the current code
> executing in msm_serial will trigger "Bad mode in Error Handler" and
> generate an invalid stack frame in pstore before rebooting (that is if
> pstore is indeed configured: otherwise the user shall just notice a
> reboot with no further information dumped to the console).
> 
> This patch replaces the PIO byte accessor with the word accessor
> already used in PIO mode.
> 
> Fixes: 68252424a7c7 ("tty: serial: msm: Support big-endian CPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

You missed Stephen's

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Regards,
Bjorn

> ---
>  drivers/tty/serial/msm_serial.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 109096033bb1..23833ad952ba 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -860,6 +860,7 @@ static void msm_handle_tx(struct uart_port *port)
>  	struct circ_buf *xmit = &msm_port->uart.state->xmit;
>  	struct msm_dma *dma = &msm_port->tx_dma;
>  	unsigned int pio_count, dma_count, dma_min;
> +	char buf[4] = { 0 };
>  	void __iomem *tf;
>  	int err = 0;
>  
> @@ -869,10 +870,12 @@ static void msm_handle_tx(struct uart_port *port)
>  		else
>  			tf = port->membase + UART_TF;
>  
> +		buf[0] = port->x_char;
> +
>  		if (msm_port->is_uartdm)
>  			msm_reset_dm_count(port, 1);
>  
> -		iowrite8_rep(tf, &port->x_char, 1);
> +		iowrite32_rep(tf, buf, 1);
>  		port->icount.tx++;
>  		port->x_char = 0;
>  		return;
> -- 
> 2.21.0
> 
