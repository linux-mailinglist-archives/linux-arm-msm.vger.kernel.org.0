Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2116D12B18B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 06:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfL0Fwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 00:52:44 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45349 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbfL0Fwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 00:52:43 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so35039685otp.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 21:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fbsPvvZhyUEETqP1XztX+8HPssG9Yi77OXnSRzUeKaA=;
        b=d06iPXzY9ugRCpfA/oe/H3cmFN0CPR7qPMlbmpaaPhT9BiHnOFbh57VdXNObpGDAal
         X7lofcemsrXLxDDp2D6N6khryQlWcxletwRE+lsHbdoNPugMPAFDuzqji5f5McJ/4k16
         Hc1pUPvwA21sLkNQNNpSBBdiRCoDbPiW2knUhsMtx2+wu/OstAosLiTS6p59ddc4kTne
         907ji1wgXhIjpYGOHInQnOjy4hVUcxiDBvvdQ9SwvjRMCW1QcUE7a/t77aKwJAjPWDGS
         fozyHPmmjxU900KXyrCYSlBL9xzheKBF+3p5Y/Zi15V2i1bQp5uUVCpPO1aoMW+mtENu
         GZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fbsPvvZhyUEETqP1XztX+8HPssG9Yi77OXnSRzUeKaA=;
        b=EuxARlT0Z6LUZ/1SuxOxoVZqLCpmrbTJwaIiL9fHARkmozPVTyATyKjudakGeVgvHv
         9pJSlZuhVfm2qieAv367g1EgGDDhkXMXNu76BF66WsHUXYUxQTwqBTGQWgrnmckc0MJd
         HktVMCwfIgNHHxhZci2tUP92wKjPtP71ezNY1LTjvoYNywudvknZmoN9h7LN63x+JgMO
         yUUBjaCHckAx4FZmMGVJU64HaKfFyElDCvZRfTFKo2ySwuA0oQv9VnRd1iphHNc0tNEB
         QUtis7U6bS6yn6+tnvBFJ6ikuVdrdwNDWvzhi4DZeTIlJWxiGSFJFP/PhmPQsFVwzzRZ
         QM2w==
X-Gm-Message-State: APjAAAU3BII4g41AgsuhrfTolu0Ujs1kmqtB1GjgsOplElI5/aMdmR/C
        va/98ywGQ3HgO8NZP9GkrSPWeQ==
X-Google-Smtp-Source: APXvYqzjv3TODw6DetObqbLTckDwU26BwLwRS57bC+Hg2ggaRLds1AOvjT3CnLJqJRSwC87r/yLw5A==
X-Received: by 2002:a05:6830:681:: with SMTP id q1mr56554676otr.162.1577425962408;
        Thu, 26 Dec 2019 21:52:42 -0800 (PST)
Received: from leoy-ThinkPad-X240s (li1058-79.members.linode.com. [45.33.121.79])
        by smtp.gmail.com with ESMTPSA id r10sm11724334otn.37.2019.12.26.21.52.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2019 21:52:41 -0800 (PST)
Date:   Fri, 27 Dec 2019 13:52:34 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] tty: serial: msm_serial: Fix deadlock caused by
 recursive output
Message-ID: <20191227055233.GA4552@leoy-ThinkPad-X240s>
References: <20191127141544.4277-1-leo.yan@linaro.org>
 <20191127141544.4277-3-leo.yan@linaro.org>
 <CAOCk7NqZmBYN4tY0_V8xzvBfWShDCP8gTa60Aoc78wK2tXx=6A@mail.gmail.com>
 <20191203082325.GC28241@leoy-ThinkPad-X240s>
 <CAOCk7NpYt_OVYB7yZz+U9OE7jdtdm4sKG9wzKY7_YvKKx2Q4fg@mail.gmail.com>
 <20191204161330.GA28567@leoy-ThinkPad-X240s>
 <CAOCk7NpN3=Hj2g-O3-8=MreJ65CReQR+EaMDbV=Af14pgg87FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NpN3=Hj2g-O3-8=MreJ65CReQR+EaMDbV=Af14pgg87FQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

On Mon, Dec 16, 2019 at 11:49:52AM -0700, Jeffrey Hugo wrote:
> On Wed, Dec 4, 2019 at 9:13 AM Leo Yan <leo.yan@linaro.org> wrote:
> >
> > On Tue, Dec 03, 2019 at 03:42:31PM -0700, Jeffrey Hugo wrote:
> >
> > [...]
> >
> > > > > > This patch fixes the deadlock issue for recursive output; it adds a
> > > > > > variable 'curr_user' to indicate the uart port is used by which CPU, if
> > > > > > the CPU has acquired spinlock and wants to execute recursive output,
> > > > > > it will directly bail out.  Here we don't choose to avoid locking and
> > > > > > print out log, the reason is in this case we don't want to reset the
> > > > > > uart port with function msm_reset_dm_count(); otherwise it can introduce
> > > > > > confliction with other flows and results in uart port malfunction and
> > > > > > later cannot output anymore.
> > > > >
> > > > > Is this not fixable?  Sure, fixing the deadlock is an improvement, but
> > > > > dropping logs (particularly a memory warning like in your example)
> > > > > seems undesirable.
> > > >
> > > > Thanks a lot for your reviewing, Jeffrey.
> > > >
> > > > Agreed with you for the concern.
> > > >
> > > > To be honest, I am not familiar with the msm uart driver, so have no
> > > > confidence which is the best way for uart port operations.  I can
> > > > think out one possible fixing is shown in below, if detects the lock
> > > > is not acquired then it will force to reset UART port before exit the
> > > > function __msm_console_write().
> > > >
> > > > This approach is not tested yet and it looks too arbitrary; I will
> > > > give a try for it.  At the meantime, welcome any insight suggestion
> > > > with proper register operations.
> > >
> > > According to the documentation, NCF_TX is only needed for SW transmit
> > > mode, where software is directly puttting characters in the fifo.  Its
> > > not needed for BAM mode.  According to your example, recursive console
> > > printing will only happen in BAM mode, and not in SW mode.  Perhaps if
> > > we put the NCF_TX uses to just the SW mode, we avoid the issue and can
> > > allow recursive printing?
> >
> > Thanks for the suggestion!  But based on the suggestion, I tried to
> > change code as below, the console even cannot work when boot the
> > kernel:
> >
> >  static void msm_reset_dm_count(struct uart_port *port, int count)
> >  {
> > +       u32 val;
> > +
> >         msm_wait_for_xmitr(port);
> > -       msm_write(port, count, UARTDM_NCF_TX);
> > -       msm_read(port, UARTDM_NCF_TX);
> > +
> > +       val = msm_read(port, UARTDM_DMEN);
> > +
> > +       /*
> > +        * NCF is only enabled for SW transmit mode and is
> > +        * skipped for BAM mode.
> > +        */
> > +       if (!(val & UARTDM_DMEN_TX_BAM_ENABLE) &&
> > +           !(val & UARTDM_DMEN_RX_BAM_ENABLE)) {
> > +               msm_write(port, count, UARTDM_NCF_TX);
> > +               msm_read(port, UARTDM_NCF_TX);
> > +       }
> >  }
> >
> >
> > Alternatively, when exit from __msm_console_write() and if detect the
> > case for without acquiring spinlock, invoke msm_wait_for_xmitr() to wait
> > for transmit completion looks a good candidate solution. The updated
> > patch is as below.  Please let me know if this is doable?
> >
> > diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > index 1db79ee8a886..aa6a494c898d 100644
> > --- a/drivers/tty/serial/msm_serial.c
> > +++ b/drivers/tty/serial/msm_serial.c
> > @@ -190,6 +190,7 @@ struct msm_port {
> >         bool                    break_detected;
> >         struct msm_dma          tx_dma;
> >         struct msm_dma          rx_dma;
> > +       struct cpumask          curr_user;
> >  };
> >
> >  #define UART_TO_MSM(uart_port) container_of(uart_port, struct msm_port, uart)
> > @@ -440,6 +441,7 @@ static void msm_complete_tx_dma(void *args)
> >         u32 val;
> >
> >         spin_lock_irqsave(&port->lock, flags);
> > +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
> >
> >         /* Already stopped */
> >         if (!dma->count)
> > @@ -474,6 +476,7 @@ static void msm_complete_tx_dma(void *args)
> >
> >         msm_handle_tx(port);
> >  done:
> > +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
> >         spin_unlock_irqrestore(&port->lock, flags);
> >  }
> >
> > @@ -548,6 +551,7 @@ static void msm_complete_rx_dma(void *args)
> >         u32 val;
> >
> >         spin_lock_irqsave(&port->lock, flags);
> > +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
> >
> >         /* Already stopped */
> >         if (!dma->count)
> > @@ -594,6 +598,7 @@ static void msm_complete_rx_dma(void *args)
> >
> >         msm_start_rx_dma(msm_port);
> >  done:
> > +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
> >         spin_unlock_irqrestore(&port->lock, flags);
> >
> >         if (count)
> > @@ -932,6 +937,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
> >         u32 val;
> >
> >         spin_lock_irqsave(&port->lock, flags);
> > +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
> >         misr = msm_read(port, UART_MISR);
> >         msm_write(port, 0, UART_IMR); /* disable interrupt */
> >
> > @@ -963,6 +969,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
> >                 msm_handle_delta_cts(port);
> >
> >         msm_write(port, msm_port->imr, UART_IMR); /* restore interrupt */
> > +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
> >         spin_unlock_irqrestore(&port->lock, flags);
> >
> >         return IRQ_HANDLED;
> > @@ -1573,10 +1580,12 @@ static inline struct uart_port *msm_get_port_from_line(unsigned int line)
> >  static void __msm_console_write(struct uart_port *port, const char *s,
> >                                 unsigned int count, bool is_uartdm)
> >  {
> > +       struct msm_port *msm_port = UART_TO_MSM(port);
> >         int i;
> >         int num_newlines = 0;
> >         bool replaced = false;
> >         void __iomem *tf;
> > +       int locked = 1;
> >
> >         if (is_uartdm)
> >                 tf = port->membase + UARTDM_TF;
> > @@ -1589,7 +1598,15 @@ static void __msm_console_write(struct uart_port *port, const char *s,
> >                         num_newlines++;
> >         count += num_newlines;
> >
> > -       spin_lock(&port->lock);
> > +       if (port->sysrq)
> > +               locked = 0;
> > +       else if (oops_in_progress)
> > +               locked = spin_trylock(&port->lock);
> > +       else if (cpumask_test_cpu(smp_processor_id(), &msm_port->curr_user))
> > +               locked = 0;
> > +       else
> > +               spin_lock(&port->lock);
> > +
> >         if (is_uartdm)
> >                 msm_reset_dm_count(port, count);
> >
> > @@ -1625,7 +1642,12 @@ static void __msm_console_write(struct uart_port *port, const char *s,
> >                 iowrite32_rep(tf, buf, 1);
> >                 i += num_chars;
> >         }
> > -       spin_unlock(&port->lock);
> > +
> > +       if (!locked)
> > +               msm_wait_for_xmitr(port);
> 
> Sorry, catching up from some travel.
> 
> I don't understand this.  At this point, haven't we already called
> msm_reset_dm_count() and "corrupted" the state of the hardware?

Yeah, at here msm_reset_dm_count() has been called.

msm_wait_for_xmitr() is used to wait for completing transmition.
So we can get flow as:

  msm_complete_tx_dma()
    kmalloc() fail
      __msm_console_write()
        msm_reset_dm_count()
        output logs
        msm_wait_for_xmitr()  => ensure to not impact out flow

My essential reason for adding msm_wait_for_xmitr() is to cleanup
the "corrupted" state before return to out flow.

Thanks,
Leo Yan

> > +
> > +       if (locked)
> > +               spin_unlock(&port->lock);
> >  }
