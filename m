Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEB7DF310
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 18:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbfJUQ0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 12:26:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43328 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729507AbfJUQ0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 12:26:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id a2so8729796pfo.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FeEqDDuvyH1j0FkwnEHXEhJ7z7vVV3mb+til5JuVy4E=;
        b=L8KbCMIZMxP2/ikOEVCaVOtgQiYYSXPdgW250Tq1STkF49vaQk3R5o7/jn3v5ajZbp
         ydqA0q4Y7eZeucZjxDPT/99FlOAjOoFBxXR+42r+/Rkiey25D2gehkw0tu3RhUlmCKpG
         o2oUle2jrjk5Q8f35+5xyrFgxajAkboXJop9KDriQvfZyaTxqY8uY3Bazh4lD8gAnlBZ
         2yU3WuGv0nljF2MGSgD1AkYO3QrFrbykPlnVsu+7xKD+/7ecDGB35eephrOR/tbVALDD
         1ImzxUDYILfSZGXq51tA24qE+j5WKw/gYMUVr0JgAIjxRFtWuQSpYxx3WYEg9n5T5D6/
         UjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FeEqDDuvyH1j0FkwnEHXEhJ7z7vVV3mb+til5JuVy4E=;
        b=p7PoO0uFYGuOvfe/H9n0FfiPjPxqqrEkXbwUkxlsTB4QGkgqs8I13TcROROY1WdWW3
         12iT3rqdR4VhjMPq/aXa73JwEeW9bHZIfeZid5zwpyEltIKE2gaBJQ1N7Gu1ov+nfCmH
         XD/1Ji9E3eDHoCRXH+/cyvscZ8FBI92D53yUAv8gIt8wADFf36npEt/X65VSs7sXoSuJ
         82XEhpx/CKQ/zRfj8SIYOyQj9LAgXdyAmRjj6xzcjbfM47+RvqcMlaqy2+v8jNwDHWTM
         m0nvoMK1zo/1vjdhUDf9+dgkg2664b7jZaapmleuS3rOWxAoyxD15Si20dO4N+ccOUFS
         iNSQ==
X-Gm-Message-State: APjAAAUo1VtYOGtt0L85HLzx1iXidOI74IqFWn0th7miGy7UncHRy1FP
        pUwSb0fbGqiGqih0aTWz6OnL2w==
X-Google-Smtp-Source: APXvYqy5d6rToN0TKdq5fL7MqUzExsdEL3H+tedaCNY+lPF4cHGJooqBtskg5MACrNiAARL8PJwnqw==
X-Received: by 2002:a62:b504:: with SMTP id y4mr15005944pfe.40.1571675173480;
        Mon, 21 Oct 2019 09:26:13 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x5sm15983429pfi.32.2019.10.21.09.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 09:26:12 -0700 (PDT)
Date:   Mon, 21 Oct 2019 09:26:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix flow control
Message-ID: <20191021162610.GC1204@tuxbook-pro>
References: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Oct 08:46 PDT 2019, Jeffrey Hugo wrote:

> hci_qca interfaces to the wcn3990 via a uart_dm on the msm8998 mtp and
> Lenovo Miix 630 laptop.  As part of initializing the wcn3990, hci_qca
> disables flow, configures the uart baudrate, and then reenables flow - at
> which point an event is expected to be received over the uart from the
> wcn3990.  It is observed that this event comes after the baudrate change
> but before hci_qca re-enables flow. This is unexpected, and is a result of
> msm_reset() being broken.
> 
> According to the uart_dm hardware documentation, it is recommended that
> automatic hardware flow control be enabled by setting RX_RDY_CTL.  Auto
> hw flow control will manage RFR based on the configured watermark.  When
> there is space to receive data, the hw will assert RFR.  When the watermark
> is hit, the hw will de-assert RFR.
> 
> The hardware documentation indicates that RFR can me manually managed via
> CR when RX_RDY_CTL is not set.  SET_RFR asserts RFR, and RESET_RFR
> de-asserts RFR.
> 
> msm_reset() is broken because after resetting the hardware, it
> unconditionally asserts RFR via SET_RFR.  This enables flow regardless of
> the current configuration, and would undo a previous flow disable
> operation.  It should instead de-assert RFR via RESET_RFR to block flow
> until the hardware is reconfigured.  msm_serial should rely on the client
> to specify that flow should be enabled, either via mctrl() or the termios
> structure, and only assert RFR in response to those triggers.
> 
> Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Looks good!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> v2:
> -mask out RX_RDY_CTL in msm_reset() to close a small race window for RFR
> 
>  drivers/tty/serial/msm_serial.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 3657a24913fc..00964b6e4ac1 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -980,6 +980,7 @@ static unsigned int msm_get_mctrl(struct uart_port *port)
>  static void msm_reset(struct uart_port *port)
>  {
>  	struct msm_port *msm_port = UART_TO_MSM(port);
> +	unsigned int mr;
>  
>  	/* reset everything */
>  	msm_write(port, UART_CR_CMD_RESET_RX, UART_CR);
> @@ -987,7 +988,10 @@ static void msm_reset(struct uart_port *port)
>  	msm_write(port, UART_CR_CMD_RESET_ERR, UART_CR);
>  	msm_write(port, UART_CR_CMD_RESET_BREAK_INT, UART_CR);
>  	msm_write(port, UART_CR_CMD_RESET_CTS, UART_CR);
> -	msm_write(port, UART_CR_CMD_SET_RFR, UART_CR);
> +	msm_write(port, UART_CR_CMD_RESET_RFR, UART_CR);
> +	mr = msm_read(port, UART_MR1);
> +	mr &= ~UART_MR1_RX_RDY_CTL;
> +	msm_write(port, mr, UART_MR1);
>  
>  	/* Disable DM modes */
>  	if (msm_port->is_uartdm)
> -- 
> 2.17.1
> 
