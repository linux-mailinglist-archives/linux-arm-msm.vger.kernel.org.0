Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D8E21BD95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 21:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgGJTYt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 15:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbgGJTYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 15:24:48 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC2BC08E6DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 12:24:48 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c7so2166448uap.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+vQ5bCEDo/wAIf1ZUXjz+6JfFL28SkBOOq1PBkPvnRQ=;
        b=H4xhE7XHt8JqXnE4hlBIa5eWGSIYw7MEmpaIhYty5d9voEZk9UbD+jqrRn2rFMb1au
         sZXtOExGVgsbcUGtzj04mAtL2yW5goTImH+u2VgK6NJ+Z7uwtu+W0JDgbdDn+nF22ksW
         ezLJIO+FO4IYha+iAgV+yLDmw0lMZsi0l5sKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+vQ5bCEDo/wAIf1ZUXjz+6JfFL28SkBOOq1PBkPvnRQ=;
        b=FajcVEpDntKr5q3wpiXGV3XfCQYrcc3WdJ5n6o1jLoYDVviZPEohzuzsSIJ4+hrpG3
         joGWzpeQOx1m1NgqmZ4dNYgWLWtggrZTxi08U8J+fGjYe8W1dmd4WYUMYrpNBQ2vzKZq
         oCvQjXqqhv776gQRh4vEqmw8s5qhVTeZ+rpv/+YrKZU9rS/Qpf6YZD0SZpfg3n7jCrQC
         u70x7uGt4HsddphgeJhMOVUMnqfAkJtzqik3VOnfLcHHzZTdWQsPaAEeDW0wOO+DwqPe
         Nwypeagx/v0vkpqq3nM0C5VYsxQQWhMrdXYzp5JYD4XdO9tRZ1eVrVzRnkKfcKPS3Tq/
         yA4w==
X-Gm-Message-State: AOAM532LI7g87mnuaUq8tBrjaKBFGt0g5uwetKJu8JKUVjjDNwttELxd
        qX5sqMJKIPX7BaCG/C/ZMmz5cMGv+pQ=
X-Google-Smtp-Source: ABdhPJx7DYpRW+JSlZo5K/SN6vZo7y2w5xtZu0CH4uzEVKyqz5NMcvp1MBuphXLJQbtFnLfOhQfllw==
X-Received: by 2002:ab0:2850:: with SMTP id c16mr50739943uaq.143.1594409086374;
        Fri, 10 Jul 2020 12:24:46 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id f25sm802040vsr.1.2020.07.10.12.24.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 12:24:45 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id k7so3587036vso.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 12:24:44 -0700 (PDT)
X-Received: by 2002:a67:69c1:: with SMTP id e184mr22206473vsc.119.1594409084255;
 Fri, 10 Jul 2020 12:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org>
 <20200626125844.1.I8546ecb6c5beb054f70c5302d1a7293484212cd1@changeid>
 <CAE=gft7Q-KC2+9kGVT1k3BaAHZv61iWaeEODZEf7FnXX6i=1LA@mail.gmail.com>
 <CAD=FV=VS9e_rj1ufEDw5+Vu_WMVrSqJWjSdK-oZ2OtPxahsMvg@mail.gmail.com> <CAE=gft7kJErXN2WYzRMjbV0LBSH0sw80XVph14OhaYccWh=RBA@mail.gmail.com>
In-Reply-To: <CAE=gft7kJErXN2WYzRMjbV0LBSH0sw80XVph14OhaYccWh=RBA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 10 Jul 2020 12:24:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGPY2a7SKZVUz+Sruf59qEtH+fdhWz0ypL-cHknPQkzQ@mail.gmail.com>
Message-ID: <CAD=FV=XGPY2a7SKZVUz+Sruf59qEtH+fdhWz0ypL-cHknPQkzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: qcom_geni_serial: Make kgdb work even if UART
 isn't console
To:     Evan Green <evgreen@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        kgdb-bugreport@lists.sourceforge.net,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jslaby@suse.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 10, 2020 at 12:03 PM Evan Green <evgreen@chromium.org> wrote:
>
> On Fri, Jul 10, 2020 at 11:19 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Jul 10, 2020 at 10:39 AM Evan Green <evgreen@chromium.org> wrote:
> > >
> > > On Fri, Jun 26, 2020 at 1:01 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > The geni serial driver had the rather sketchy hack in it where it
> > > > would adjust the number of bytes per RX FIFO word from 4 down to 1 if
> > > > it detected that CONFIG_CONSOLE_POLL was enabled (for kgdb) and this
> > > > was a console port (defined by the kernel directing output to this
> > > > port via the "console=" command line argument).
> > > >
> > > > The problem with that sketchy hack is that it's possible to run kgdb
> > > > over a serial port even if it isn't used for console.
> > > >
> > > > Let's avoid the hack by simply handling the 4-bytes-per-FIFO word case
> > > > for kdb.  We'll have to have a (very small) cache but that should be
> > > > fine.
> > > >
> > > > A nice side effect of this patch is that an agetty (or similar)
> > > > running on this port is less likely to drop characters.  We'll
> > > > have roughly 4 times the RX FIFO depth than we used to now.
> > > >
> > > > NOTE: the character cache here isn't shared between the polling API
> > > > and the non-polling API.  That means that, technically, the polling
> > > > API could eat a few extra bytes.  This doesn't seem to pose a huge
> > > > problem in reality because we'll only get several characters per FIFO
> > > > word if those characters are all received at nearly the same time and
> > > > we don't really expect non-kgdb characters to be sent to the same port
> > > > as kgdb at the exact same time we're exiting kgdb.
> > > >
> > > > ALSO NOTE: we still have the sketchy hack for setting the number of
> > > > bytes per TX FIFO word in place, but that one is less bad.  kgdb
> > > > doesn't have any problem with this because it always just sends 1 byte
> > > > at a time and waits for it to finish.  The TX FIFO hack is only really
> > > > needed for console output.  In any case, a future patch will remove
> > > > that hack, too.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  drivers/tty/serial/qcom_geni_serial.c | 80 ++++++++++++++++++---------
> > > >  1 file changed, 55 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > > index 0300867eab7a..4610e391e886 100644
> > > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > > @@ -103,11 +103,13 @@
> > > >  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
> > > >  #define IO_MACRO_IO2_IO3_SWAP          0x4640
> > > >
> > > > -#ifdef CONFIG_CONSOLE_POLL
> > > > -#define CONSOLE_RX_BYTES_PW 1
> > > > -#else
> > > > -#define CONSOLE_RX_BYTES_PW 4
> > > > -#endif
> > > > +struct qcom_geni_private_data {
> > > > +       /* NOTE: earlycon port will have NULL here */
> > > > +       struct uart_driver *drv;
> > > > +
> > > > +       u32 poll_cached_bytes;
> > > > +       unsigned int poll_cached_bytes_cnt;
> > > > +};
> > > >
> > > >  struct qcom_geni_serial_port {
> > > >         struct uart_port uport;
> > > > @@ -129,6 +131,8 @@ struct qcom_geni_serial_port {
> > > >         int wakeup_irq;
> > > >         bool rx_tx_swap;
> > > >         bool cts_rts_swap;
> > > > +
> > > > +       struct qcom_geni_private_data private_data;
> > > >  };
> > > >
> > > >  static const struct uart_ops qcom_geni_console_pops;
> > > > @@ -264,8 +268,9 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> > > >         unsigned int baud;
> > > >         unsigned int fifo_bits;
> > > >         unsigned long timeout_us = 20000;
> > > > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > > >
> > > > -       if (uport->private_data) {
> > > > +       if (private_data->drv) {
> > > >                 port = to_dev_port(uport, uport);
> > > >                 baud = port->baud;
> > > >                 if (!baud)
> > > > @@ -331,23 +336,42 @@ static void qcom_geni_serial_abort_rx(struct uart_port *uport)
> > > >  }
> > > >
> > > >  #ifdef CONFIG_CONSOLE_POLL
> > > > +
> > > >  static int qcom_geni_serial_get_char(struct uart_port *uport)
> > > >  {
> > > > -       u32 rx_fifo;
> > > > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > > >         u32 status;
> > > > +       u32 word_cnt;
> > > > +       int ret;
> > > > +
> > > > +       if (!private_data->poll_cached_bytes_cnt) {
> > > > +               status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> > > > +               writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
> > > >
> > > > -       status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> > > > -       writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
> > > > +               status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> > > > +               writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> > > >
> > > > -       status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> > > > -       writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> > > > +               status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> > > > +               word_cnt = status & RX_FIFO_WC_MSK;
> > > > +               if (!word_cnt)
> > > > +                       return NO_POLL_CHAR;
> > > >
> > > > -       status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> > > > -       if (!(status & RX_FIFO_WC_MSK))
> > > > -               return NO_POLL_CHAR;
> > > > +               if (word_cnt == 1 && (status & RX_LAST))
> > >
> > > I forget how the partial word snapping works. Are you sure you want
> > > word_cnt == 1? I see qcom_geni_serial_handle_rx() looks at RX_LAST
> > > independently as long as word_cnt != 0. I'm worried the hardware
> > > allows one FIFO entry with say 2 bytes in it and RX_LAST set, but then
> > > also piles new stuff in the FIFO behind it, so that word_cnt can be
> > > >1.
> >
> > So I guess one point of evidence that the logic I have there is OK is
> > that it works.  :-P
> >
> > ...but also looking closer.  Maybe first it's important to understand
> > the REALLY WEIRD protocol that geni serial uses.  This was discovered
> > through a bunch of trial and error long ago when poking at how the
> > driver worked.
> >
> > When you're reading from geni it essentially breaks things into
> > packets.  If you're midway through reading a packet of data and more
> > bytes come in then geni will hide them from you until you read the
> > whole packet.  I'm not totally sure the exact conditions for when it
> > decides to make a packet out of the data, but it's not important for
> > this discussion.
> >
> > So when you read "RX_FIFO_WC" it tells you the total number of FIFO
> > words in the current packet.  That number will only ever go down.  A
> > packet is made up of some number of whole words plus one word that
> > could be a whole word or could be a partial word.  So if "RX_FIFO_WC"
> > says 4 it means you've got 3 whole words (3 * 4 = 12 bytes) and one
> > word that might be partial.  You can find out about that one partial
> > word (always the last word in the FIFO) by reading "RX_LAST" and
> > "RX_LAST_BYTE_VALID".
> >
> > Once you finally read the last word in the FIFO then geni can tell you
> > about the next packet of data.
> >
> > OK, so hopefully that made sense?
>
> I see, yes. In your description, the status register is a single
> storage element with a decrementing counter that stores the state for
> this current packet. Then it's a mystery how/where additional packets
> are buffered.
>
> In my mental model, RX_FIFO_WC tells you how many elements are
> occupied in the FIFO, regardless of packet boundaries. RX_LAST and
> byte count are actually little tags in each FIFO element. So a FIFO
> element internally consists of 4 data bytes + 3 status bits. Then that
> portion of the status register shows you the status/tag bits for the
> element at the top of the FIFO. I can't remember why I think it works
> this way, but it does explain how the hardware can queue/store
> multiple RX packets, and how it would handle overflows.
>
> >
> > So qcom_geni_serial_handle_rx() is trying to read ALL bytes.  It first
> > figures out the total count of bytes and then reads them all.  That's
> > why it needs to look at RX_LAST all the time.  Also of note: RX_LAST
> > only ever applies to the last word in the FIFO.  If it was possible
> > for the word count to grow _before_ fully clearing out the FIFO then
> > it would be a race and software would never be able to tell which byte
> > RX_LAST applied to.
>
> In my world, I was imagining word count could grow, since it showed
> the current fullness of the FIFO, but RX_LAST and BYTE_COUNT_MSK
> showed the tag bits for the current element. It looked like
> qcom_geni_serial_handle_rx() was coded for that since it seemed to
> only check that FIFO_WC was non-zero.

Ah, but look at how the ->handle_rx() call works.  Specifically let's
look at handle_rx_console().  It takes in a count and just reads
everything without referring back to RX_LAST and RX_LAST_BYTE_VALID.
If your model was the one geni was actually using then wouldn't that
call need to be re-checking RX_LAST and RX_LAST_BYTE_VALID for each
FIFO entry?  You can see that as it's reading from the FIFO it reads
all whole words first and then only reads a partial word for the very
last word in the packet.


> If you only check RX_LAST, and remove the word_cnt == 1, then the code
> is correct in both of our mental models of the hardware, right?

No.  RX_LAST simply means "the last FIFO entry you read out will be
partial".  So if:

RX_FIFO_WC = 2
RX_LAST = 1
RX_LAST_BYTE_VALID = 2

Then it's important to realize that if you read one FIFO element that
it will be a full word big.  RX_LAST only applies to the last element.


> But TBH I've basically fabricated my mental model out of the air. So
> I'll defer to you if you're sure it works the way you've described.

Hopefully reading through handle_rx_console() and seeing that it never
looks at RX_LAST clarifies?

-Doug
