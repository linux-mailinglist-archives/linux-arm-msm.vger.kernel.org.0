Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C801121967
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 19:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfLPSur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 13:50:47 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:33814 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfLPSuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 13:50:44 -0500
Received: by mail-il1-f195.google.com with SMTP id s15so3187943iln.1;
        Mon, 16 Dec 2019 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w0GqAeMADEza9fllh4bzbMMhhnGfJ6Bsr92tmvmU29Q=;
        b=XHIt33Sbu/oJ/7qVpTvsAHtZHBwLg9SQwva5srVojJiAus8eZEtoJILNZgBk+Se82t
         FRYS1X4R8m6hzUP68lIRVFnVJD+hI2lRDTA5ixyOhVYqgDo4ZWJP+8ZBuNG4SVR9q8wO
         f48dO6lyFE0ERpv55rIk8bc2mzlOH2eOg4FzQMLBjr1P719Q1rxCOLJCHh+Fdf8QS7L9
         325JLqgl73XAM4ATbXKycmRDjnBp3U579bTfSala8hC8MwADZ81HZldZSuRCnMP4ay1S
         GqpQ/CxGIuGVM3SqiNlNZKiYiP2Y1tyoFZIa1p1bDMx69MXIamsR6tRHFKv0ESL/sFKj
         1MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0GqAeMADEza9fllh4bzbMMhhnGfJ6Bsr92tmvmU29Q=;
        b=YF+BszQPLOW67TAcYK10XVO/xSV4M03gISSMLmWSIsZ8iK8tktABDMYsqFD4CV0nii
         V8rgwZPTThHUIhjrxgWgW4mMfPLBVhCf8zaOYe+LPPRKah/5RTz7DDZOEhFICEMwc9zC
         DmiXESZs65d2VdOBrbZKsXua0WYHVo97AgCHvWTVRcg9T8NO4eve4klVauFetXRPsG7y
         9tZRA7f1zDPFMjZQZLvxwLVd8zTKcO7kaBpJPh3P9FeZCQMtZto3AWL1gKdeaZQtsTt3
         YIcFJC+wbFNAYmpoWV99mFWnFu205xMcpvWJivOkOpIJ12BZMTyNaNn8K5eqxR3M9+8m
         ILqw==
X-Gm-Message-State: APjAAAXMt2qKOhLex1z3EwQ5zaFufBPIjzxbWqAHKuPWOsqbQzyNMCb1
        roZhGwj2bHR6cf3FeGRCKGZbuh5wbl7LTiCXRhU=
X-Google-Smtp-Source: APXvYqypJW7zX7JyFKFt7HBQ8IFzxMx8ab/QOfg5OvPPeZw6Wz/pWUWEXSfeBLH2Zai8aIypXtN8r03Gms7377jgnkw=
X-Received: by 2002:a92:d308:: with SMTP id x8mr13709006ila.42.1576522243125;
 Mon, 16 Dec 2019 10:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20191127141544.4277-1-leo.yan@linaro.org> <20191127141544.4277-3-leo.yan@linaro.org>
 <CAOCk7NqZmBYN4tY0_V8xzvBfWShDCP8gTa60Aoc78wK2tXx=6A@mail.gmail.com>
 <20191203082325.GC28241@leoy-ThinkPad-X240s> <CAOCk7NpYt_OVYB7yZz+U9OE7jdtdm4sKG9wzKY7_YvKKx2Q4fg@mail.gmail.com>
 <20191204161330.GA28567@leoy-ThinkPad-X240s> <CAD9cdQ6ROYf6B2PkQYJds_80-0dA=Jcew=TCNCSB=r+WEUNvdQ@mail.gmail.com>
In-Reply-To: <CAD9cdQ6ROYf6B2PkQYJds_80-0dA=Jcew=TCNCSB=r+WEUNvdQ@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 16 Dec 2019 11:50:31 -0700
Message-ID: <CAOCk7Np3DCYmeq1n3aemuLRK=krjOYp88rj_mdrwG2_vg0Gn_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tty: serial: msm_serial: Fix deadlock caused by
 recursive output
To:     Rainer Sickinger <rainersickinger.official@gmail.com>
Cc:     Leo Yan <leo.yan@linaro.org>, Andy Gross <agross@kernel.org>,
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

On Wed, Dec 4, 2019 at 9:21 AM Rainer Sickinger
<rainersickinger.official@gmail.com> wrote:
>
> Can't you just exit with System.exit()?

Isn't System.exit() a Java thing, and we are in a C environment?

>
> Am Mi., 4. Dez. 2019 um 17:14 Uhr schrieb Leo Yan <leo.yan@linaro.org>:
>>
>> On Tue, Dec 03, 2019 at 03:42:31PM -0700, Jeffrey Hugo wrote:
>>
>> [...]
>>
>> > > > > This patch fixes the deadlock issue for recursive output; it adds a
>> > > > > variable 'curr_user' to indicate the uart port is used by which CPU, if
>> > > > > the CPU has acquired spinlock and wants to execute recursive output,
>> > > > > it will directly bail out.  Here we don't choose to avoid locking and
>> > > > > print out log, the reason is in this case we don't want to reset the
>> > > > > uart port with function msm_reset_dm_count(); otherwise it can introduce
>> > > > > confliction with other flows and results in uart port malfunction and
>> > > > > later cannot output anymore.
>> > > >
>> > > > Is this not fixable?  Sure, fixing the deadlock is an improvement, but
>> > > > dropping logs (particularly a memory warning like in your example)
>> > > > seems undesirable.
>> > >
>> > > Thanks a lot for your reviewing, Jeffrey.
>> > >
>> > > Agreed with you for the concern.
>> > >
>> > > To be honest, I am not familiar with the msm uart driver, so have no
>> > > confidence which is the best way for uart port operations.  I can
>> > > think out one possible fixing is shown in below, if detects the lock
>> > > is not acquired then it will force to reset UART port before exit the
>> > > function __msm_console_write().
>> > >
>> > > This approach is not tested yet and it looks too arbitrary; I will
>> > > give a try for it.  At the meantime, welcome any insight suggestion
>> > > with proper register operations.
>> >
>> > According to the documentation, NCF_TX is only needed for SW transmit
>> > mode, where software is directly puttting characters in the fifo.  Its
>> > not needed for BAM mode.  According to your example, recursive console
>> > printing will only happen in BAM mode, and not in SW mode.  Perhaps if
>> > we put the NCF_TX uses to just the SW mode, we avoid the issue and can
>> > allow recursive printing?
>>
>> Thanks for the suggestion!  But based on the suggestion, I tried to
>> change code as below, the console even cannot work when boot the
>> kernel:
>>
>>  static void msm_reset_dm_count(struct uart_port *port, int count)
>>  {
>> +       u32 val;
>> +
>>         msm_wait_for_xmitr(port);
>> -       msm_write(port, count, UARTDM_NCF_TX);
>> -       msm_read(port, UARTDM_NCF_TX);
>> +
>> +       val = msm_read(port, UARTDM_DMEN);
>> +
>> +       /*
>> +        * NCF is only enabled for SW transmit mode and is
>> +        * skipped for BAM mode.
>> +        */
>> +       if (!(val & UARTDM_DMEN_TX_BAM_ENABLE) &&
>> +           !(val & UARTDM_DMEN_RX_BAM_ENABLE)) {
>> +               msm_write(port, count, UARTDM_NCF_TX);
>> +               msm_read(port, UARTDM_NCF_TX);
>> +       }
>>  }
>>
>>
>> Alternatively, when exit from __msm_console_write() and if detect the
>> case for without acquiring spinlock, invoke msm_wait_for_xmitr() to wait
>> for transmit completion looks a good candidate solution. The updated
>> patch is as below.  Please let me know if this is doable?
>>
>> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
>> index 1db79ee8a886..aa6a494c898d 100644
>> --- a/drivers/tty/serial/msm_serial.c
>> +++ b/drivers/tty/serial/msm_serial.c
>> @@ -190,6 +190,7 @@ struct msm_port {
>>         bool                    break_detected;
>>         struct msm_dma          tx_dma;
>>         struct msm_dma          rx_dma;
>> +       struct cpumask          curr_user;
>>  };
>>
>>  #define UART_TO_MSM(uart_port) container_of(uart_port, struct msm_port, uart)
>> @@ -440,6 +441,7 @@ static void msm_complete_tx_dma(void *args)
>>         u32 val;
>>
>>         spin_lock_irqsave(&port->lock, flags);
>> +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
>>
>>         /* Already stopped */
>>         if (!dma->count)
>> @@ -474,6 +476,7 @@ static void msm_complete_tx_dma(void *args)
>>
>>         msm_handle_tx(port);
>>  done:
>> +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
>>         spin_unlock_irqrestore(&port->lock, flags);
>>  }
>>
>> @@ -548,6 +551,7 @@ static void msm_complete_rx_dma(void *args)
>>         u32 val;
>>
>>         spin_lock_irqsave(&port->lock, flags);
>> +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
>>
>>         /* Already stopped */
>>         if (!dma->count)
>> @@ -594,6 +598,7 @@ static void msm_complete_rx_dma(void *args)
>>
>>         msm_start_rx_dma(msm_port);
>>  done:
>> +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
>>         spin_unlock_irqrestore(&port->lock, flags);
>>
>>         if (count)
>> @@ -932,6 +937,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
>>         u32 val;
>>
>>         spin_lock_irqsave(&port->lock, flags);
>> +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
>>         misr = msm_read(port, UART_MISR);
>>         msm_write(port, 0, UART_IMR); /* disable interrupt */
>>
>> @@ -963,6 +969,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
>>                 msm_handle_delta_cts(port);
>>
>>         msm_write(port, msm_port->imr, UART_IMR); /* restore interrupt */
>> +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
>>         spin_unlock_irqrestore(&port->lock, flags);
>>
>>         return IRQ_HANDLED;
>> @@ -1573,10 +1580,12 @@ static inline struct uart_port *msm_get_port_from_line(unsigned int line)
>>  static void __msm_console_write(struct uart_port *port, const char *s,
>>                                 unsigned int count, bool is_uartdm)
>>  {
>> +       struct msm_port *msm_port = UART_TO_MSM(port);
>>         int i;
>>         int num_newlines = 0;
>>         bool replaced = false;
>>         void __iomem *tf;
>> +       int locked = 1;
>>
>>         if (is_uartdm)
>>                 tf = port->membase + UARTDM_TF;
>> @@ -1589,7 +1598,15 @@ static void __msm_console_write(struct uart_port *port, const char *s,
>>                         num_newlines++;
>>         count += num_newlines;
>>
>> -       spin_lock(&port->lock);
>> +       if (port->sysrq)
>> +               locked = 0;
>> +       else if (oops_in_progress)
>> +               locked = spin_trylock(&port->lock);
>> +       else if (cpumask_test_cpu(smp_processor_id(), &msm_port->curr_user))
>> +               locked = 0;
>> +       else
>> +               spin_lock(&port->lock);
>> +
>>         if (is_uartdm)
>>                 msm_reset_dm_count(port, count);
>>
>> @@ -1625,7 +1642,12 @@ static void __msm_console_write(struct uart_port *port, const char *s,
>>                 iowrite32_rep(tf, buf, 1);
>>                 i += num_chars;
>>         }
>> -       spin_unlock(&port->lock);
>> +
>> +       if (!locked)
>> +               msm_wait_for_xmitr(port);
>> +
>> +       if (locked)
>> +               spin_unlock(&port->lock);
>>  }
