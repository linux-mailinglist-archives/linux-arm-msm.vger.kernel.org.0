Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB53D245E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 11:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388898AbfJJIoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 04:44:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53986 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387593AbfJJIoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 04:44:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9C4166110F; Thu, 10 Oct 2019 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570697053;
        bh=UDhKVkz9QY0QGvMmnBlutkzlXc66C4GbTuW0RB9n/1w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XwHGMQYup3q6hldfwXVxCPlhzQEYoYZxtFYduY0lcR3Xm8iUd2zfvCPi5oGkYZzFP
         qSGyKjZ9A81q9h08zOMmh7XSDxhSSWU0N91j7WuhCXwBw0ft8NnYFTWr3p4PVB5Unv
         c5vSe8ETLQ4VxurHXZhKcQp79ayblw8N4oQxTRhk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 94CEC6119F;
        Thu, 10 Oct 2019 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570697050;
        bh=UDhKVkz9QY0QGvMmnBlutkzlXc66C4GbTuW0RB9n/1w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fLEX2doG+P+oecPqTV5RAMF6Leho228CZoNyzMKT6Yw5BGnUdx8oSJAJFGI6xl5vI
         ITRFM4COQ/VrA9hrm3M4bH+kSu5PR8JVjVIUBRrzbkRt0iTijaQbdCSuRKdxS8VbbU
         EsLiXhCHSSy3dz1JN3uHrTrUnPfqJOQ/NP1Q0vLE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Oct 2019 14:14:09 +0530
From:   akashast@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, jslaby@suse.com,
        bjorn.andersson@linaro.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Wakeup over UART RX
In-Reply-To: <5d83c725.1c69fb81.9e57a.5569@mx.google.com>
References: <1568877366-1758-1-git-send-email-akashast@codeaurora.org>
 <5d83c725.1c69fb81.9e57a.5569@mx.google.com>
Message-ID: <f50ca3b2bd4dbd081c3270d93df4ca7a@codeaurora.org>
X-Sender: akashast@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-19 23:51, Stephen Boyd wrote:
> Quoting Akash Asthana (2019-09-19 00:16:06)
>> Add system wakeup capability over UART RX line for wakeup capable 
>> UART.
>> When system is suspended, RX line act as an interrupt to wakeup system
>> for any communication requests from peer.
>> 
>> Cleanup of IRQ registration, moving it to probe from startup function.
> 
> Probably should be a different patch than the one that adds wakeup irq
> handling.
> 

Sure, will do it.

>> 
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>>  drivers/tty/serial/qcom_geni_serial.c | 73 
>> +++++++++++++++++++++++++++++------
>>  1 file changed, 62 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index 35e5f9c..43d1da4 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -19,6 +19,8 @@
>>  #include <linux/slab.h>
>>  #include <linux/tty.h>
>>  #include <linux/tty_flip.h>
>> +#include <linux/pm_wakeirq.h>
>> +#include <linux/irq.h>
> 
> Can you sort these includes alphabetically? Or at least attempt to 
> place
> this somewhere in there alphabetically?
> 

ok

>> 
>>  /* UART specific GENI registers */
>>  #define SE_UART_LOOPBACK_CFG           0x22c
>> @@ -98,6 +100,8 @@
>>  #define CONSOLE_RX_BYTES_PW 4
>>  #endif
>> 
>> +#define WAKEUP_EVENT_MSEC   2000
> 
> This is used one place. Just inline it and drop this define.
> 

ok

>> +
>>  struct qcom_geni_serial_port {
>>         struct uart_port uport;
>>         struct geni_se se;
>> @@ -115,6 +119,7 @@ struct qcom_geni_serial_port {
>>         bool brk;
>> 
>>         unsigned int tx_remaining;
>> +       int wakeup_irq;
>>  };
>> 
>>  static const struct uart_ops qcom_geni_console_pops;
>> @@ -756,6 +761,15 @@ static void qcom_geni_serial_handle_tx(struct 
>> uart_port *uport, bool done,
>>                 uart_write_wakeup(uport);
>>  }
>> 
>> +static irqreturn_t qcom_geni_serial_wakeup_isr(int isr, void *dev)
>> +{
>> +       struct uart_port *uport = dev;
>> +
>> +       pm_wakeup_event(uport->dev, WAKEUP_EVENT_MSEC);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>>  static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>>  {
>>         u32 m_irq_en;
>> @@ -1290,6 +1297,8 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>         port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>         port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>> 
>> +       scnprintf(port->name, sizeof(port->name), 
>> "qcom_geni_serial_%s%d",
>> +               (uart_console(uport) ? "console" : "uart"), 
>> uport->line);
> 
> This looks like an unrelated change?
> 

We moved this change to probe from startup as part of IRQ cleanup. We 
are initializing port->name variable here that is used in 
devm_request_irq call.

>>         irq = platform_get_irq(pdev, 0);
>>         if (irq < 0) {
>>                 dev_err(&pdev->dev, "Failed to get IRQ %d\n", irq);
>> @@ -1297,6 +1306,39 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>         }
>>         uport->irq = irq;
>> 
>> +       irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>> +       ret = devm_request_irq(uport->dev, uport->irq, 
>> qcom_geni_serial_isr,
>> +                               IRQF_TRIGGER_HIGH, port->name, uport);
>> +       if (ret) {
>> +               dev_err(uport->dev, "Failed to get IRQ ret %d\n", 
>> ret);
>> +               return ret;
>> +       }
>> +
>> +       if (!console) {
>> +               port->wakeup_irq = platform_get_irq(pdev, 1);
> 
> Can you use dev_pm_set_wake_irq() instead?
> 

okay, we are using this API this will take care of 
enable_irq_wake/disable_irq_wake during suspend and resume but still, we 
need to enable/disable wakeup irq in suspend and resume call.

>> +               if (port->wakeup_irq < 0) {
>> +                       dev_err(&pdev->dev, "Failed to get wakeup IRQ 
>> %d\n",
>> +                                                       
>> port->wakeup_irq);
>> +               } else {
>> +                       dev_info(&pdev->dev, "wakeup_irq =%d\n",
>> +                               port->wakeup_irq);
> 
> Please no dev_info() messages like this.
> 

ok

>> +                       irq_set_status_flags(port->wakeup_irq, 
>> IRQ_NOAUTOEN);
>> +                       ret = devm_request_irq(uport->dev, 
>> port->wakeup_irq,
>> +                               qcom_geni_serial_wakeup_isr,
>> +                               IRQF_TRIGGER_FALLING, "uart_wakeup", 
>> uport);
>> +                       if (ret) {
>> +                               dev_err(uport->dev, "Failed to 
>> register wakeup "
>> +                                       "IRQ ret %d\n", ret);
> 
> Don't split format strings across many lines. The arguments can go to a
> different line, but the string can be on a single line.
> 

ok

>> +                               return ret;
>> +                       }
>> +
>> +                       device_init_wakeup(&pdev->dev, true);
>> +                       ret = enable_irq_wake(port->wakeup_irq);
>> +                       if (unlikely(ret))
>> +                               dev_err(uport->dev, "%s:Failed to set 
>> IRQ "
>> +                                       "wake:%d\n", __func__, ret);
>> +               }
>> +       }
>>         uport->private_data = drv;
>>         platform_set_drvdata(pdev, port);
>>         port->handle_rx = console ? handle_rx_console : 
>> handle_rx_uart;
>> @@ -1311,6 +1353,7 @@ static int qcom_geni_serial_remove(struct 
>> platform_device *pdev)
>>         struct uart_driver *drv = port->uport.private_data;
>> 
>>         uart_remove_one_port(drv, &port->uport);
>> +
>>         return 0;
>>  }
>> 
> 
> This hunk shouldn't be here. Please drop

ok

