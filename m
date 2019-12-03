Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB76C111F93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 00:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfLCWmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 17:42:46 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35663 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbfLCWmn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 17:42:43 -0500
Received: by mail-io1-f65.google.com with SMTP id v18so5766475iol.2;
        Tue, 03 Dec 2019 14:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7IzGD4WRCCFYMOqCam4BvCa6vun6+n983tU2aRp2iZU=;
        b=UH1kpBk9yKxRH0ypieqZa+Q2WXbRw/ZTqYTb4ya23oy+TxAYdo9Og5iWGMhFMjaWXY
         417Ti/WAoNvtNAofwxvsCi2RnGdJnp+KhW1utFZKw0QBn0PyRgB3lYkKQdLwQFviOwii
         2l3ZeYczQdFzTyHUTacoqa9GT+IGIsJ9R+4or/akKpbDtSE/qU5WngSUZ9TOC0XsYr1m
         3CXFcccG3kkm/A01JgT8P5kRbEvp4ewj3qhyDCS49sudP5QWdKVVIh2BgUDZtHBQffXM
         rp7SCSS+9PbzwgvGWBktmhbqXuK/mGeGUrJvSs2PZkMvx8mzZt4JAeBV88aWAKz7cNTW
         jOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7IzGD4WRCCFYMOqCam4BvCa6vun6+n983tU2aRp2iZU=;
        b=dQJXY5FjChn4/b+V1w4ziuXP0jZ5xsrwJAfhcKZqPpswFCFY31p7JQ8wgmuHfzbUsn
         sBl2tYNG4p8M/WnCrbPs/IMhHUcOt23TXLYpTN//bUFqfqNIFHlKrZXaRyrrO9FgN02y
         s9SfLTAn2V0OXcFIjNbXldVmLQ8+JprY2pgK0X949J1/HPePVWaOqFlDLgel/1py0HpZ
         3NsIrqE3EsTeFnZGaBPXfUjHblcXgjCI5aWXNDuJNo36LUXlPpIZHeNkGOYy7IjrB01g
         fqONKo/5moPgHL07ur0tdqLj4tzBho520APG5Yt55F9gCxKRCU/Q248hlX23TqJrix2c
         XxEg==
X-Gm-Message-State: APjAAAU3pkm9934u7faKp/AdEwNkWtn8quJ09G2KF0z/s11+G4tvTJoW
        +UZa/Ka1mlNB3KQIT3IRAjBSsCNoZkhOp8luM6c=
X-Google-Smtp-Source: APXvYqxlocnGd3ImUL0RbOkWK2GwHagIyBlZUEDJ/dZeWGOnVpvNWlp5bM9omsnL4hVUCWHnsd3zxNVUxVAeuTS2AXY=
X-Received: by 2002:a6b:5914:: with SMTP id n20mr531342iob.42.1575412962306;
 Tue, 03 Dec 2019 14:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20191127141544.4277-1-leo.yan@linaro.org> <20191127141544.4277-3-leo.yan@linaro.org>
 <CAOCk7NqZmBYN4tY0_V8xzvBfWShDCP8gTa60Aoc78wK2tXx=6A@mail.gmail.com> <20191203082325.GC28241@leoy-ThinkPad-X240s>
In-Reply-To: <20191203082325.GC28241@leoy-ThinkPad-X240s>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 3 Dec 2019 15:42:31 -0700
Message-ID: <CAOCk7NpYt_OVYB7yZz+U9OE7jdtdm4sKG9wzKY7_YvKKx2Q4fg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tty: serial: msm_serial: Fix deadlock caused by
 recursive output
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 3, 2019 at 1:23 AM Leo Yan <leo.yan@linaro.org> wrote:
>
> On Mon, Dec 02, 2019 at 09:40:55AM -0700, Jeffrey Hugo wrote:
> > On Wed, Nov 27, 2019 at 7:16 AM Leo Yan <leo.yan@linaro.org> wrote:
> > >
> > > The uart driver might run into deadlock caused by recursive output; the
> > > basic flow is after uart driver has acquired the port spinlock, then it
> > > invokes some functions, e.g. dma engine operations and allocate dma
> > > descriptor with kzalloc(), if the system has very less free memory, the
> > > kernel will give out warning by printing logs, thus recursive output
> > > will happen and at the second time the attempting to acquire lock will
> > > cause deadlock.  The detailed flow is shown as below:
> > >
> > >   msm_uart_irq()
> > >     spin_lock_irqsave(&port->lock, flags)  => First time to acquire lock
> > >     msm_handle_tx(port)
> > >       msm_handle_tx_dma()
> > >         dmaengine_prep_slave_single()
> > >           bam_prep_slave_sg()
> > >             kzalloc()
> > >                __kmalloc()
> > >                  ___slab_alloc()
> > >                    alloc_pages_current()
> > >                      __alloc_pages_nodemask()
> > >                        warn_alloc()
> > >                          printk()
> > >                            msm_console_write()
> > >                              __msm_console_write()
> > >                                spin_lock(&port->lock) => Cause deadlock
> > >
> > > This patch fixes the deadlock issue for recursive output; it adds a
> > > variable 'curr_user' to indicate the uart port is used by which CPU, if
> > > the CPU has acquired spinlock and wants to execute recursive output,
> > > it will directly bail out.  Here we don't choose to avoid locking and
> > > print out log, the reason is in this case we don't want to reset the
> > > uart port with function msm_reset_dm_count(); otherwise it can introduce
> > > confliction with other flows and results in uart port malfunction and
> > > later cannot output anymore.
> >
> > Is this not fixable?  Sure, fixing the deadlock is an improvement, but
> > dropping logs (particularly a memory warning like in your example)
> > seems undesirable.
>
> Thanks a lot for your reviewing, Jeffrey.
>
> Agreed with you for the concern.
>
> To be honest, I am not familiar with the msm uart driver, so have no
> confidence which is the best way for uart port operations.  I can
> think out one possible fixing is shown in below, if detects the lock
> is not acquired then it will force to reset UART port before exit the
> function __msm_console_write().
>
> This approach is not tested yet and it looks too arbitrary; I will
> give a try for it.  At the meantime, welcome any insight suggestion
> with proper register operations.

According to the documentation, NCF_TX is only needed for SW transmit
mode, where software is directly puttting characters in the fifo.  Its
not needed for BAM mode.  According to your example, recursive console
printing will only happen in BAM mode, and not in SW mode.  Perhaps if
we put the NCF_TX uses to just the SW mode, we avoid the issue and can
allow recursive printing?

>
> @@ -1572,6 +1579,7 @@ static inline struct uart_port *msm_get_port_from_line(unsigned int line)
>  static void __msm_console_write(struct uart_port *port, const char *s,
>                                 unsigned int count, bool is_uartdm)
>  {
> +       struct msm_port *msm_port = UART_TO_MSM(port);
>         int i;
>         int num_newlines = 0;
>         bool replaced = false;
> @@ -1593,6 +1601,8 @@ static void __msm_console_write(struct uart_port *port, const char *s,
>                 locked = 0;
>         else if (oops_in_progress)
>                 locked = spin_trylock(&port->lock);
> +       else if (cpumask_test_cpu(smp_processor_id(), &msm_port->curr_user))
> +               return;
>         else
>                 spin_lock(&port->lock);
>
> @@ -1632,6 +1642,9 @@ static void __msm_console_write(struct uart_port *port, const char *s,
>                 i += num_chars;
>         }
>
> +       if (!locked && is_uartdm)
> +               msm_reset(port);
> +
>         if (locked)
>                 spin_unlock(&port->lock);
>  }
>
> Thanks,
> Leo
>
> > >
> > > Fixes: 99693945013a ("tty: serial: msm: Add RX DMA support")
> > > Fixes: 3a878c430fd6 ("tty: serial: msm: Add TX DMA support")
> > > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > > ---
> > >  drivers/tty/serial/msm_serial.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > > index 889538182e83..06076cd2948f 100644
> > > --- a/drivers/tty/serial/msm_serial.c
> > > +++ b/drivers/tty/serial/msm_serial.c
> > > @@ -182,6 +182,7 @@ struct msm_port {
> > >         bool                    break_detected;
> > >         struct msm_dma          tx_dma;
> > >         struct msm_dma          rx_dma;
> > > +       struct cpumask          curr_user;
> > >  };
> > >
> > >  #define UART_TO_MSM(uart_port) container_of(uart_port, struct msm_port, uart)
> > > @@ -436,6 +437,7 @@ static void msm_complete_tx_dma(void *args)
> > >         u32 val;
> > >
> > >         spin_lock_irqsave(&port->lock, flags);
> > > +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
> > >
> > >         /* Already stopped */
> > >         if (!dma->count)
> > > @@ -470,6 +472,7 @@ static void msm_complete_tx_dma(void *args)
> > >
> > >         msm_handle_tx(port);
> > >  done:
> > > +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
> > >         spin_unlock_irqrestore(&port->lock, flags);
> > >  }
> > >
> > > @@ -544,6 +547,7 @@ static void msm_complete_rx_dma(void *args)
> > >         u32 val;
> > >
> > >         spin_lock_irqsave(&port->lock, flags);
> > > +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
> > >
> > >         /* Already stopped */
> > >         if (!dma->count)
> > > @@ -590,6 +594,7 @@ static void msm_complete_rx_dma(void *args)
> > >
> > >         msm_start_rx_dma(msm_port);
> > >  done:
> > > +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
> > >         spin_unlock_irqrestore(&port->lock, flags);
> > >
> > >         if (count)
> > > @@ -931,6 +936,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
> > >         u32 val;
> > >
> > >         spin_lock_irqsave(&port->lock, flags);
> > > +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
> > >         misr = msm_read(port, UART_MISR);
> > >         msm_write(port, 0, UART_IMR); /* disable interrupt */
> > >
> > > @@ -962,6 +968,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
> > >                 msm_handle_delta_cts(port);
> > >
> > >         msm_write(port, msm_port->imr, UART_IMR); /* restore interrupt */
> > > +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
> > >         spin_unlock_irqrestore(&port->lock, flags);
> > >
> > >         return IRQ_HANDLED;
> > > @@ -1572,6 +1579,7 @@ static inline struct uart_port *msm_get_port_from_line(unsigned int line)
> > >  static void __msm_console_write(struct uart_port *port, const char *s,
> > >                                 unsigned int count, bool is_uartdm)
> > >  {
> > > +       struct msm_port *msm_port = UART_TO_MSM(port);
> > >         int i;
> > >         int num_newlines = 0;
> > >         bool replaced = false;
> > > @@ -1593,6 +1601,8 @@ static void __msm_console_write(struct uart_port *port, const char *s,
> > >                 locked = 0;
> > >         else if (oops_in_progress)
> > >                 locked = spin_trylock(&port->lock);
> > > +       else if (cpumask_test_cpu(smp_processor_id(), &msm_port->curr_user))
> > > +               return;
> > >         else
> > >                 spin_lock(&port->lock);
> > >
> > > --
> > > 2.17.1
> > >
