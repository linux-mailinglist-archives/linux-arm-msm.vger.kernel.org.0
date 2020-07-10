Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCB721BCEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 20:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgGJS2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 14:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgGJS2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 14:28:08 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435CFC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 11:28:08 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id d11so987398vsq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLKh/X0uXeX2LGln8V38XdhqIytFWvmdivttEbfej3A=;
        b=T8gHEm7iKqdyoST5OEcE24mAxhUbWx/ujrm3+39tyFVSnNITZrImdgsKf4o14KEpH6
         xFCInhQJCQb11FGriDxPVd45l6X0wbiUg8mSX3FT1IduymyhHIDBYMsQfOfPJzhSZTRu
         nRe5eVDX9XxoTmNXd+01hakcw5MXFJS70VUPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLKh/X0uXeX2LGln8V38XdhqIytFWvmdivttEbfej3A=;
        b=G533Xm8c9m1+6YqZ16o9TOss0dY/cgMq0Whh5iQ4nYSvz1o40AZP7jrHTJuvjm59Y9
         bBKRkRGsGquOvkU6iXIGtS1T3ol2SO9HwV8/E7CDwNk2J/vvxLlKTVTgJOG/mZkJ9oT7
         zJv1ZRjjTOEbfSc/UBsWTIwXl4nu0pb7s2uyUv4Wih4qxwdIzA9UO9xquFQaP/VfjBjx
         SGMHbdonB81gm5c7+eCBkuYe6XmQpHNYKcCra1sz2paOYw3sSML5JlALE+2JM8/Xz4ct
         I9nU/oX3Bx23K03xCj7WE3YLXvm2Uqd5m7UDs0d4w5oYmAOL95vNe3Sby0ZSNQyg1Yd7
         Yj6w==
X-Gm-Message-State: AOAM530BXTt8VFpLjrh3QdVujN/w+ukDk6yhg1Tb/waMKT04N6aSwEjL
        AzxMVfwBp2LrvGvuDefxmjtroeu/xoE=
X-Google-Smtp-Source: ABdhPJxpDqiywuUWqS605BaoVXGjGZKLD246GhhOTFvKDCYEl6aaU5Awecke2xeoAd2I8mzgdgn0Uw==
X-Received: by 2002:a67:6d86:: with SMTP id i128mr36980768vsc.159.1594405687064;
        Fri, 10 Jul 2020 11:28:07 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id k187sm895265vkk.26.2020.07.10.11.28.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 11:28:05 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id q85so1440675vke.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 11:28:05 -0700 (PDT)
X-Received: by 2002:a1f:9d57:: with SMTP id g84mr27397611vke.100.1594405685296;
 Fri, 10 Jul 2020 11:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org>
 <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid> <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
In-Reply-To: <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 10 Jul 2020 11:27:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfYL0po+8Wm4hLYgwDQpREFSeGEaNSQMCZhmV2tP_u0A@mail.gmail.com>
Message-ID: <CAD=FV=XfYL0po+8Wm4hLYgwDQpREFSeGEaNSQMCZhmV2tP_u0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: qcom_geni_serial: Always use 4 bytes per TX
 FIFO word
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

On Fri, Jul 10, 2020 at 10:46 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 1:01 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The geni serial driver had a rule that we'd only use 1 byte per FIFO
> > word for the TX FIFO if we were being used for the serial console.
> > This is ugly and a bit of a pain.  It's not too hard to fix, so fix
> > it.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/tty/serial/qcom_geni_serial.c | 57 +++++++++++++++++----------
> >  1 file changed, 37 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 4610e391e886..583d903321b5 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -103,12 +103,18 @@
> >  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
> >  #define IO_MACRO_IO2_IO3_SWAP          0x4640
> >
> > +/* We always configure 4 bytes per FIFO word */
> > +#define BYTES_PER_FIFO_WORD            4
> > +
> >  struct qcom_geni_private_data {
> >         /* NOTE: earlycon port will have NULL here */
> >         struct uart_driver *drv;
> >
> >         u32 poll_cached_bytes;
> >         unsigned int poll_cached_bytes_cnt;
> > +
> > +       u32 write_cached_bytes;
> > +       unsigned int write_cached_bytes_cnt;
> >  };
> >
> >  struct qcom_geni_serial_port {
> > @@ -121,8 +127,6 @@ struct qcom_geni_serial_port {
> >         bool setup;
> >         int (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
> >         unsigned int baud;
> > -       unsigned int tx_bytes_pw;
> > -       unsigned int rx_bytes_pw;
> >         void *rx_fifo;
> >         u32 loopback;
> >         bool brk;
> > @@ -390,13 +394,25 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
> >  #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
> >  static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
> >  {
> > -       writel(ch, uport->membase + SE_GENI_TX_FIFOn);
> > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > +
> > +       private_data->write_cached_bytes =
> > +               (private_data->write_cached_bytes >> 8) | (ch << 24);
> > +       private_data->write_cached_bytes_cnt++;
> > +
> > +       if (private_data->write_cached_bytes_cnt == BYTES_PER_FIFO_WORD) {
> > +               writel(private_data->write_cached_bytes,
> > +                      uport->membase + SE_GENI_TX_FIFOn);
> > +               private_data->write_cached_bytes_cnt = 0;
> > +       }
> >  }
> >
> >  static void
> >  __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
> >                                  unsigned int count)
> >  {
> > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > +
> >         int i;
> >         u32 bytes_to_send = count;
> >
> > @@ -431,6 +447,15 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
> >                                                         SE_GENI_M_IRQ_CLEAR);
> >                 i += chars_to_write;
> >         }
> > +
> > +       if (private_data->write_cached_bytes_cnt) {
> > +               private_data->write_cached_bytes >>= BITS_PER_BYTE *
> > +                       (BYTES_PER_FIFO_WORD - private_data->write_cached_bytes_cnt);
> > +               writel(private_data->write_cached_bytes,
> > +                      uport->membase + SE_GENI_TX_FIFOn);
> > +               private_data->write_cached_bytes_cnt = 0;
> > +       }
>
> How does this not end up sending stray zeros? In other words, how does
> the hardware know which bytes of this word are valid?

We told it how many bytes we wanted to send in
qcom_geni_serial_setup_tx().  If the total number of bytes being sent
is not a multiple of the FIFO word size then it knows that the last
word will be a partial and it'll extract just the number of needed
bytes out of it.

Like receiving, sending bytes out of geni is also packet based.
Though the packets work a little differently for sending vs. receiving
in both cases you are supposed to fully finish a packet before you
send more bytes (you can sorta cancel / start a new packet, but that's
not what we're doing here).  So ahead of time we told it how many
bytes to expect and then we sent them all.

NOTE: if we wanted to simplify this function at the expense of
efficiency, we could change it to always send 1-byte packets.  Then
we'd start a packet, send 1 byte, wait for done, start a new packet,
send 1 byte, wait for done, etc.  In fact, that's how the polling code
does it...


-Doug
