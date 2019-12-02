Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA9510ED5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 17:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfLBQlH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 11:41:07 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:34696 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbfLBQlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 11:41:07 -0500
Received: by mail-il1-f194.google.com with SMTP id w13so272437ilo.1;
        Mon, 02 Dec 2019 08:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OOh+Bc1DWdItpbvyDVMetDcI62XQS3JiY37nnuo0X1o=;
        b=bVNmOxsEVEp8YH+hiILRG3Pmj4Z+rGdDKJIJ8PbS5u/igb6I9ECpqn1bS+ZIHa29hD
         Mb4f+KFlFF4W8dmbVbYMk9CWwRcX63uAn9ZRvbOA7pEIkPZVMrfIvTD2InoGmjsf6BpC
         EPiGHHjnN/9CgI4G18iBQ2yJ56XZ6ZShTIs/qy9OEHiW+CjqmYjIN+cxns0GSWlZ78Cy
         RcSrPdvf59w/6+V9gjGlqkW9zRZyj+VGYmQ8710JRt7GDe6GqPya7N6x5fLBM9AQvHTP
         /W4Rtplt/vZgj8kDWyDgX6WpBJyRWbt+sVy+zkz7Le4l9rvmJ+ykCbVpoRhhPOeWkn3x
         /ZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OOh+Bc1DWdItpbvyDVMetDcI62XQS3JiY37nnuo0X1o=;
        b=nXJLcqnt/ytj6mE3SZnpZ3mEiU9gyf2eCcD35MleMk2bYT5FVoAfbh8Kh1TzlHdyUY
         T2rwjPzo2KHZAq8jgPBS9rresb9rZySwVfoXnCzeJSy/WZI0dOuXYAO07sgNcrvgHCnU
         LpYA9F/40RnUZOv/FhTb+QbZX/WtnMfDuRgMYB7Vt6+Pu2T7feUqU2qNUI2bFqLaK9QA
         /k5KRap0egqq+E3Lplb9yGDWU+J2dHFFwd9yd7VOFRySMf8DReG7VPgud8ZYgEwLVaPk
         FgUEMDLmFhiw/ABwA1Qx0gt9qpWnYVR4hL/yP8JXJ1fLoLEHAryfOAxhGmrxM/kYzqMu
         6FOw==
X-Gm-Message-State: APjAAAUic774GJ+ImF+vIkcd1BJvZepjj266rcGDRnUaNzsFaF/0vlzF
        bVgmbtYe6JkEQ1OaOSj1AW/Ij9Q01rfPsd1iTDM=
X-Google-Smtp-Source: APXvYqzAaEwIforOBiTI0rbJEPuiD0fNLEyhsjIOukX/xgCyOfdwPSFCmlouh1JsqHdxv3qOTLI5g78cx1qUMuTHvjk=
X-Received: by 2002:a92:b60e:: with SMTP id s14mr68371769ili.178.1575304866317;
 Mon, 02 Dec 2019 08:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20191127141544.4277-1-leo.yan@linaro.org> <20191127141544.4277-3-leo.yan@linaro.org>
In-Reply-To: <20191127141544.4277-3-leo.yan@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 2 Dec 2019 09:40:55 -0700
Message-ID: <CAOCk7NqZmBYN4tY0_V8xzvBfWShDCP8gTa60Aoc78wK2tXx=6A@mail.gmail.com>
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

On Wed, Nov 27, 2019 at 7:16 AM Leo Yan <leo.yan@linaro.org> wrote:
>
> The uart driver might run into deadlock caused by recursive output; the
> basic flow is after uart driver has acquired the port spinlock, then it
> invokes some functions, e.g. dma engine operations and allocate dma
> descriptor with kzalloc(), if the system has very less free memory, the
> kernel will give out warning by printing logs, thus recursive output
> will happen and at the second time the attempting to acquire lock will
> cause deadlock.  The detailed flow is shown as below:
>
>   msm_uart_irq()
>     spin_lock_irqsave(&port->lock, flags)  => First time to acquire lock
>     msm_handle_tx(port)
>       msm_handle_tx_dma()
>         dmaengine_prep_slave_single()
>           bam_prep_slave_sg()
>             kzalloc()
>                __kmalloc()
>                  ___slab_alloc()
>                    alloc_pages_current()
>                      __alloc_pages_nodemask()
>                        warn_alloc()
>                          printk()
>                            msm_console_write()
>                              __msm_console_write()
>                                spin_lock(&port->lock) => Cause deadlock
>
> This patch fixes the deadlock issue for recursive output; it adds a
> variable 'curr_user' to indicate the uart port is used by which CPU, if
> the CPU has acquired spinlock and wants to execute recursive output,
> it will directly bail out.  Here we don't choose to avoid locking and
> print out log, the reason is in this case we don't want to reset the
> uart port with function msm_reset_dm_count(); otherwise it can introduce
> confliction with other flows and results in uart port malfunction and
> later cannot output anymore.

Is this not fixable?  Sure, fixing the deadlock is an improvement, but
dropping logs (particularly a memory warning like in your example)
seems undesirable.

>
> Fixes: 99693945013a ("tty: serial: msm: Add RX DMA support")
> Fixes: 3a878c430fd6 ("tty: serial: msm: Add TX DMA support")
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  drivers/tty/serial/msm_serial.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 889538182e83..06076cd2948f 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -182,6 +182,7 @@ struct msm_port {
>         bool                    break_detected;
>         struct msm_dma          tx_dma;
>         struct msm_dma          rx_dma;
> +       struct cpumask          curr_user;
>  };
>
>  #define UART_TO_MSM(uart_port) container_of(uart_port, struct msm_port, uart)
> @@ -436,6 +437,7 @@ static void msm_complete_tx_dma(void *args)
>         u32 val;
>
>         spin_lock_irqsave(&port->lock, flags);
> +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
>
>         /* Already stopped */
>         if (!dma->count)
> @@ -470,6 +472,7 @@ static void msm_complete_tx_dma(void *args)
>
>         msm_handle_tx(port);
>  done:
> +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
>         spin_unlock_irqrestore(&port->lock, flags);
>  }
>
> @@ -544,6 +547,7 @@ static void msm_complete_rx_dma(void *args)
>         u32 val;
>
>         spin_lock_irqsave(&port->lock, flags);
> +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
>
>         /* Already stopped */
>         if (!dma->count)
> @@ -590,6 +594,7 @@ static void msm_complete_rx_dma(void *args)
>
>         msm_start_rx_dma(msm_port);
>  done:
> +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
>         spin_unlock_irqrestore(&port->lock, flags);
>
>         if (count)
> @@ -931,6 +936,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
>         u32 val;
>
>         spin_lock_irqsave(&port->lock, flags);
> +       cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
>         misr = msm_read(port, UART_MISR);
>         msm_write(port, 0, UART_IMR); /* disable interrupt */
>
> @@ -962,6 +968,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
>                 msm_handle_delta_cts(port);
>
>         msm_write(port, msm_port->imr, UART_IMR); /* restore interrupt */
> +       cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
>         spin_unlock_irqrestore(&port->lock, flags);
>
>         return IRQ_HANDLED;
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
> --
> 2.17.1
>
