Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C509813AE03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 16:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgANPuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 10:50:39 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:38896 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgANPuj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 10:50:39 -0500
Received: by mail-io1-f68.google.com with SMTP id i7so5908837ioo.5;
        Tue, 14 Jan 2020 07:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rI5lJN6/79ZPLgE/0LMECL73PZbPngS/ckfgAshohJg=;
        b=kPXEn3PZnAK8MnGou9j8Md3CiPm60AY+9VVvJjREEbaFgdy9BtwCNnqaxHnilhv2u2
         l/Vr2o76I7z5SSYo3w3KTbkLbtNzqIPfqmmNirkHJQYeXGXjV/7zdHt1SAUrdigI3Wlu
         W1GbIVGgd+aTegNsfrPuB2l8L98CApW/Qb/HLYn/6V2BDsP74E7mhWe7Yggwx/Jr+JGV
         yaifa2Gu05EeTpI/k4XdsRF6DftQ/Ma/Z2aa/BAE3WPaJHxNiUV+vzHzF7OVmVlrX2lr
         /fyAeZJ/eBIuFoFT41gsAFpzoxbB0sxmhjwM1XbmBP8y7MO9nVs0hOcktAVi+iUiG+MT
         CF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rI5lJN6/79ZPLgE/0LMECL73PZbPngS/ckfgAshohJg=;
        b=oKklUPw05LeGisaHpw9hu6Jh9ALhBJtAe6AcdyWgiAICfk88r7d0BklDMCei+ufdDa
         hJcykeqeSJwGYo/YrC4bYyzA33kq7XGC0TbXQeSJP3Ct0nYl9st+RytMG+hnrER+3RP5
         W5YavePqEUP9KgVaOaVTqC8Lkv3OtMfEykzIZ8kG+bRgnWuJ8OhL8cwW4a19E0hZ+hO8
         NP1iqQqkjjcIORn9HBgG0nOCRLm7S4j2Xwjhn45cGlSAXkAKRy7MaLSX3epEuwbb7geU
         /S/oxo0Db34gjXZ+jFZbi08WodYbUlw2vVpjeUSQQ746paPi8W3vPJu9tOPaSLnQwZM7
         qYzg==
X-Gm-Message-State: APjAAAVdc7urdbREofv+p1ZaUG4yA+oU5Yegt9uC6SSIT/uor3Xkc0T3
        IyB51GdUJrho6WPJm5j5UzNqApZVCriTm8xQkXeFYw==
X-Google-Smtp-Source: APXvYqwGR3PKKsZrHoRPMMgc6XZlAt8YbcWMGOsClm4vNCdDiziFEEZvIfh+g4Xq4YQWBU44kBcsCmcqPirtkjNbDU8=
X-Received: by 2002:a6b:148c:: with SMTP id 134mr17687642iou.178.1579017038380;
 Tue, 14 Jan 2020 07:50:38 -0800 (PST)
MIME-Version: 1.0
References: <1578646684-17379-1-git-send-email-loic.poulain@linaro.org>
 <CAOCk7NrSkaY5xUdA+Q3tCoDv01fVDYpakWmk-RnOuuBKsNN8Jg@mail.gmail.com> <CAMZdPi8ih2LukVsGvG_w2HOSZL9DSbYDmD_U=PTnk96vbE=u8g@mail.gmail.com>
In-Reply-To: <CAMZdPi8ih2LukVsGvG_w2HOSZL9DSbYDmD_U=PTnk96vbE=u8g@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 14 Jan 2020 08:50:27 -0700
Message-ID: <CAOCk7Nq721M3HZ0+gtasnQkzq_+b33z5hGkyE6YAa+GJzTyBuQ@mail.gmail.com>
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

On Tue, Jan 14, 2020 at 12:52 AM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> On Mon, 13 Jan 2020 at 20:53, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Fri, Jan 10, 2020 at 1:55 AM Loic Poulain <loic.poulain@linaro.org> wrote:
> > >
> > > During db410c stress test and when the system is low on memory,
> > > the UART/console becomes unresponsive and never recover back.
> > > This has been narrowed down to the msm_start_rx_dma which does
> > > not manage error cases correctly (e.g. dma mapping failure),
> > > indeed, when an error happens, dma transfer is simply discarded
> > > and so never completed, leading to unconfigured RX path.
> > >
> > > This patch fixes this issue by switching to SW/FIFO mode in case
> > > of DMA issue. This mainly consists in resetting the receiver to
> > > apply RX BAM/DMA disabling change and re-enabling the RX level
> > > and stale interrupts (previously disabled for DMA transfers).
> > >
> > > The DMA will be re-enabled once memory is available since the
> > > SW/FIFO read function (msm_handle_rx_dm) retries to start dma
> > > on completion.
> >
> > Is there a risk of the same thing occurring in the TX path?
>
> Yes, but the TX case is already handled. If msm_handle_tx_dma fails,
> msm_handle_tx_pio is used to directly write the FIFO.
>
> >
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  drivers/tty/serial/msm_serial.c | 18 +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > > index 1cbae07..a63b703 100644
> > > --- a/drivers/tty/serial/msm_serial.c
> > > +++ b/drivers/tty/serial/msm_serial.c
> > > @@ -610,7 +610,7 @@ static void msm_start_rx_dma(struct msm_port *msm_port)
> > >                                    UARTDM_RX_SIZE, dma->dir);
> > >         ret = dma_mapping_error(uart->dev, dma->phys);
> > >         if (ret)
> > > -               return;
> > > +               goto sw_mode;
> > >
> > >         dma->desc = dmaengine_prep_slave_single(dma->chan, dma->phys,
> > >                                                 UARTDM_RX_SIZE, DMA_DEV_TO_MEM,
> > > @@ -661,6 +661,22 @@ static void msm_start_rx_dma(struct msm_port *msm_port)
> > >         return;
> > >  unmap:
> > >         dma_unmap_single(uart->dev, dma->phys, UARTDM_RX_SIZE, dma->dir);
> > > +
> > > +sw_mode:
> > > +       /*
> > > +        * Switch from DMA to SW/FIFO mode. After clearing Rx BAM (UARTDM_DMEN),
> >
> > Where does this clear of UARTDM_DMEN occur?
>
> The DMEN clear occurs on DMA RX completion (msm_complete_tx_dma()) and
> set on DMA
> restart (msm_start_rx_dma). In our case, since DMA start fails, we
> just reset the RX path to
> effectively apply the SW/FIFO mode.

Oh, now I see the entire flow.  Not bad.

Seems sane to me from reviewing the code.

>
> >
> > > +        * receiver must be reset.
> > > +        */
> > > +       msm_write(uart, UART_CR_CMD_RESET_RX, UART_CR);
> > > +       msm_write(uart, UART_CR_RX_ENABLE, UART_CR);
> > > +
> > > +       msm_write(uart, UART_CR_CMD_RESET_STALE_INT, UART_CR);
> > > +       msm_write(uart, 0xFFFFFF, UARTDM_DMRX);
> > > +       msm_write(uart, UART_CR_CMD_STALE_EVENT_ENABLE, UART_CR);
> > > +
> > > +       /* Re-enable RX interrupts */
> > > +       msm_port->imr |= (UART_IMR_RXLEV | UART_IMR_RXSTALE);
> > > +       msm_write(uart, msm_port->imr, UART_IMR);
> > >  }
> > >
> > >  static void msm_stop_rx(struct uart_port *port)
> > > --
> > > 2.7.4
> > >
>
> Regards,
> Loic
