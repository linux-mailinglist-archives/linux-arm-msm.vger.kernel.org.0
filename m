Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8B3A139A5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 20:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgAMTxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 14:53:54 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:43402 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgAMTxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 14:53:54 -0500
Received: by mail-io1-f66.google.com with SMTP id n21so11148041ioo.10;
        Mon, 13 Jan 2020 11:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3D6RX4kPp465nuJHe6ds/xdvyZ5HgtKM/YNzxn0jjII=;
        b=J/kbPo/SrAEYmMU5SKc9Pe3Fo1UCIq6ZpVBlUddGtqmBeeYGm7oLDFZTpPQuKRH3ZH
         cpreVnh46CPFAiwqx2EvSX7ph7khsbPNhsdsiuhKl5FSuyo+XvxKePl5F1KN3Ntnd6+Q
         L6bSaLM0JbFxajNvCASogHGpSlM6guErzCNz3RwzCoz3bxkJgeRYImTScajEE0k9a1zh
         IPyuXpyYh++R0NgV9J8u/z8677LvKnlN2j5P7Bi37LqRXkek/+4Y53uSEFUIQut1Y4YT
         klvh2WoREYD21dIkHbECJiOSXI5LrCFMZK4G/pMafO9UMvNCkj75rSTzlU4Ustexol4t
         XNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3D6RX4kPp465nuJHe6ds/xdvyZ5HgtKM/YNzxn0jjII=;
        b=gxyjH8KAL0+oDzkwIYBvVR2wpcsgkARg6qmgEz2gDntUuvNKiDkz4TOPZJkrUrU4qg
         bVP3MQjRG+D9kyKnqvhsHxXUdz6wJ3kz1W8txi+ytTDTL9dHuqrUDzPAw11tltB6HSqL
         ChiAp3DkcK5riy8lqxFJoTMsUJNuEUGRL9UrAxY9viEaT5EHns2qITX0txVZPW3+OTfS
         cqYk7t7E+QE2viZIshH+LPjZrQ97+77/lBc9Z35y6pxCkaFhAUb7KrDc1EIQRfxMzHLf
         dCQEq9bIT1qfr2wxhFSUhJwUohQ10w8MuZNeXQfFxMnPKtI37w4jarHGtQ+0fJO552hX
         HHrA==
X-Gm-Message-State: APjAAAVqc4Ep4V9SPQxI2FNClDhiEKxJDyBoIh0XrQNCv6JlOjoJN6dj
        hHX9O1JMu+MblOA1VplxXCPQf0FXP7ATFzoEyMg=
X-Google-Smtp-Source: APXvYqzP12AUSGR0sHWZXP2iodMl7s4a1LdpmMDxVdXFl+JUn7T+FHyZ5dMVqgdGTFNbL7A9VmBYAGKtlVESJUpDu6o=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr14478446iog.42.1578945233528;
 Mon, 13 Jan 2020 11:53:53 -0800 (PST)
MIME-Version: 1.0
References: <1578646684-17379-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1578646684-17379-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 13 Jan 2020 12:53:42 -0700
Message-ID: <CAOCk7NrSkaY5xUdA+Q3tCoDv01fVDYpakWmk-RnOuuBKsNN8Jg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: msm_serial: RX SW/FIFO mode fallback
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 10, 2020 at 1:55 AM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> During db410c stress test and when the system is low on memory,
> the UART/console becomes unresponsive and never recover back.
> This has been narrowed down to the msm_start_rx_dma which does
> not manage error cases correctly (e.g. dma mapping failure),
> indeed, when an error happens, dma transfer is simply discarded
> and so never completed, leading to unconfigured RX path.
>
> This patch fixes this issue by switching to SW/FIFO mode in case
> of DMA issue. This mainly consists in resetting the receiver to
> apply RX BAM/DMA disabling change and re-enabling the RX level
> and stale interrupts (previously disabled for DMA transfers).
>
> The DMA will be re-enabled once memory is available since the
> SW/FIFO read function (msm_handle_rx_dm) retries to start dma
> on completion.

Is there a risk of the same thing occurring in the TX path?

>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/tty/serial/msm_serial.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 1cbae07..a63b703 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -610,7 +610,7 @@ static void msm_start_rx_dma(struct msm_port *msm_port)
>                                    UARTDM_RX_SIZE, dma->dir);
>         ret = dma_mapping_error(uart->dev, dma->phys);
>         if (ret)
> -               return;
> +               goto sw_mode;
>
>         dma->desc = dmaengine_prep_slave_single(dma->chan, dma->phys,
>                                                 UARTDM_RX_SIZE, DMA_DEV_TO_MEM,
> @@ -661,6 +661,22 @@ static void msm_start_rx_dma(struct msm_port *msm_port)
>         return;
>  unmap:
>         dma_unmap_single(uart->dev, dma->phys, UARTDM_RX_SIZE, dma->dir);
> +
> +sw_mode:
> +       /*
> +        * Switch from DMA to SW/FIFO mode. After clearing Rx BAM (UARTDM_DMEN),

Where does this clear of UARTDM_DMEN occur?

> +        * receiver must be reset.
> +        */
> +       msm_write(uart, UART_CR_CMD_RESET_RX, UART_CR);
> +       msm_write(uart, UART_CR_RX_ENABLE, UART_CR);
> +
> +       msm_write(uart, UART_CR_CMD_RESET_STALE_INT, UART_CR);
> +       msm_write(uart, 0xFFFFFF, UARTDM_DMRX);
> +       msm_write(uart, UART_CR_CMD_STALE_EVENT_ENABLE, UART_CR);
> +
> +       /* Re-enable RX interrupts */
> +       msm_port->imr |= (UART_IMR_RXLEV | UART_IMR_RXSTALE);
> +       msm_write(uart, msm_port->imr, UART_IMR);
>  }
>
>  static void msm_stop_rx(struct uart_port *port)
> --
> 2.7.4
>
