Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABDE112FC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 17:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbfLDQNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 11:13:41 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35477 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbfLDQNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 11:13:41 -0500
Received: by mail-ot1-f65.google.com with SMTP id o9so6826967ote.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2019 08:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zAp/OfIcdhHiVfey2BQfd9GRAX5eQwP1sGtcPfd5nTI=;
        b=PLmW5gI7IMkg8SJI9WFzZcNZnku+L7lt++BL/4Sg6cQ7jUUHMY7+3JTTpbtnoLH5b7
         rP/Hp8YaFvrQUiIyUxlEjwmoAzPNgiFtnxN8ZoEUSgruX0ydXCX8rgFaGHPyIHg+NJMF
         16OVCkG45fgTE9lJRk5IRyMdv3HYX/jc6xm8yxsYvic90Ihh8AqG3WsgWWXzfRGW95dB
         wZHMWjaCesV1LgZvEx55pfzpIQ1RR2TJ8DvNtMH2PVa7NP4sEhMM25cpNyKtybab6xrh
         qg9NQfXAFEkwiR3MzoQd3Rn0Y8zK9wpmrC01Pa3FS8GalkYuOgxCarhqUycw6k1zWCNq
         EoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zAp/OfIcdhHiVfey2BQfd9GRAX5eQwP1sGtcPfd5nTI=;
        b=aYbGGYFnF9MpyQhLU7yYcCXlsxJ55NtGNQ+/IeagtZtG0i9ljrdLvjYFKtmqxuF/pm
         9/r12WeBDEYw61tm8orn6NPsm0gWUK/kwrf07vVM+0yyYGV/5rfJ6xB2BxQTIDzQG072
         HxR7vV9+u4E7ZAdDygb6bK4tSbqYMfw5uELY3mAW4/WkVlfBAw7YJZMdi/m4ixqXPyU3
         OHDPjkQSFCGcTDcPYYtT7bVaAjW8UiyqkWmR1EzTneBf+ct2taWi90lY0qbc/6BGryLQ
         AWEA+lOhPFRCM6DMnRmf4tf5ex/y6zVO1860en6qUtoxiBpZ0caB/tNPLw6P4RBrplgt
         Nkyw==
X-Gm-Message-State: APjAAAU1KJXNjLP9UzqIWJjkN3RRv7OQRCo4W4Tfgw+cz3wRhbVHcFLJ
        GSHwlkuukOA0Kf39n8rVnVTTGQ==
X-Google-Smtp-Source: APXvYqwB1vlrYc/VPdkLcgOM7DJT6JQsrtZO7rrvUbe0kFALn4mMYOzIKl1ChoMbpzBkqgMuxKrMcQ==
X-Received: by 2002:a05:6830:1582:: with SMTP id i2mr3139990otr.50.1575476019954;
        Wed, 04 Dec 2019 08:13:39 -0800 (PST)
Received: from leoy-ThinkPad-X240s (li1058-79.members.linode.com. [45.33.121.79])
        by smtp.gmail.com with ESMTPSA id s83sm1498372oif.33.2019.12.04.08.13.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 08:13:39 -0800 (PST)
Date:   Thu, 5 Dec 2019 00:13:30 +0800
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
Message-ID: <20191204161330.GA28567@leoy-ThinkPad-X240s>
References: <20191127141544.4277-1-leo.yan@linaro.org>
 <20191127141544.4277-3-leo.yan@linaro.org>
 <CAOCk7NqZmBYN4tY0_V8xzvBfWShDCP8gTa60Aoc78wK2tXx=6A@mail.gmail.com>
 <20191203082325.GC28241@leoy-ThinkPad-X240s>
 <CAOCk7NpYt_OVYB7yZz+U9OE7jdtdm4sKG9wzKY7_YvKKx2Q4fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NpYt_OVYB7yZz+U9OE7jdtdm4sKG9wzKY7_YvKKx2Q4fg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 03, 2019 at 03:42:31PM -0700, Jeffrey Hugo wrote:

[...]

> > > > This patch fixes the deadlock issue for recursive output; it adds a
> > > > variable 'curr_user' to indicate the uart port is used by which CPU, if
> > > > the CPU has acquired spinlock and wants to execute recursive output,
> > > > it will directly bail out.  Here we don't choose to avoid locking and
> > > > print out log, the reason is in this case we don't want to reset the
> > > > uart port with function msm_reset_dm_count(); otherwise it can introduce
> > > > confliction with other flows and results in uart port malfunction and
> > > > later cannot output anymore.
> > >
> > > Is this not fixable?  Sure, fixing the deadlock is an improvement, but
> > > dropping logs (particularly a memory warning like in your example)
> > > seems undesirable.
> >
> > Thanks a lot for your reviewing, Jeffrey.
> >
> > Agreed with you for the concern.
> >
> > To be honest, I am not familiar with the msm uart driver, so have no
> > confidence which is the best way for uart port operations.  I can
> > think out one possible fixing is shown in below, if detects the lock
> > is not acquired then it will force to reset UART port before exit the
> > function __msm_console_write().
> >
> > This approach is not tested yet and it looks too arbitrary; I will
> > give a try for it.  At the meantime, welcome any insight suggestion
> > with proper register operations.
> 
> According to the documentation, NCF_TX is only needed for SW transmit
> mode, where software is directly puttting characters in the fifo.  Its
> not needed for BAM mode.  According to your example, recursive console
> printing will only happen in BAM mode, and not in SW mode.  Perhaps if
> we put the NCF_TX uses to just the SW mode, we avoid the issue and can
> allow recursive printing?

Thanks for the suggestion!  But based on the suggestion, I tried to
change code as below, the console even cannot work when boot the
kernel:

 static void msm_reset_dm_count(struct uart_port *port, int count)
 {
+       u32 val;
+
        msm_wait_for_xmitr(port);
-       msm_write(port, count, UARTDM_NCF_TX);
-       msm_read(port, UARTDM_NCF_TX);
+
+       val = msm_read(port, UARTDM_DMEN);
+
+       /*
+        * NCF is only enabled for SW transmit mode and is
+        * skipped for BAM mode.
+        */
+       if (!(val & UARTDM_DMEN_TX_BAM_ENABLE) &&
+           !(val & UARTDM_DMEN_RX_BAM_ENABLE)) {
+               msm_write(port, count, UARTDM_NCF_TX);
+               msm_read(port, UARTDM_NCF_TX);
+       }
 }


Alternatively, when exit from __msm_console_write() and if detect the
case for without acquiring spinlock, invoke msm_wait_for_xmitr() to wait
for transmit completion looks a good candidate solution. The updated
patch is as below.  Please let me know if this is doable?

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 1db79ee8a886..aa6a494c898d 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -190,6 +190,7 @@ struct msm_port {
 	bool			break_detected;
 	struct msm_dma		tx_dma;
 	struct msm_dma		rx_dma;
+	struct cpumask		curr_user;
 };
 
 #define UART_TO_MSM(uart_port)	container_of(uart_port, struct msm_port, uart)
@@ -440,6 +441,7 @@ static void msm_complete_tx_dma(void *args)
 	u32 val;
 
 	spin_lock_irqsave(&port->lock, flags);
+	cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
 
 	/* Already stopped */
 	if (!dma->count)
@@ -474,6 +476,7 @@ static void msm_complete_tx_dma(void *args)
 
 	msm_handle_tx(port);
 done:
+	cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -548,6 +551,7 @@ static void msm_complete_rx_dma(void *args)
 	u32 val;
 
 	spin_lock_irqsave(&port->lock, flags);
+	cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
 
 	/* Already stopped */
 	if (!dma->count)
@@ -594,6 +598,7 @@ static void msm_complete_rx_dma(void *args)
 
 	msm_start_rx_dma(msm_port);
 done:
+	cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	if (count)
@@ -932,6 +937,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
 	u32 val;
 
 	spin_lock_irqsave(&port->lock, flags);
+	cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
 	misr = msm_read(port, UART_MISR);
 	msm_write(port, 0, UART_IMR); /* disable interrupt */
 
@@ -963,6 +969,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
 		msm_handle_delta_cts(port);
 
 	msm_write(port, msm_port->imr, UART_IMR); /* restore interrupt */
+	cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	return IRQ_HANDLED;
@@ -1573,10 +1580,12 @@ static inline struct uart_port *msm_get_port_from_line(unsigned int line)
 static void __msm_console_write(struct uart_port *port, const char *s,
 				unsigned int count, bool is_uartdm)
 {
+	struct msm_port *msm_port = UART_TO_MSM(port);
 	int i;
 	int num_newlines = 0;
 	bool replaced = false;
 	void __iomem *tf;
+	int locked = 1;
 
 	if (is_uartdm)
 		tf = port->membase + UARTDM_TF;
@@ -1589,7 +1598,15 @@ static void __msm_console_write(struct uart_port *port, const char *s,
 			num_newlines++;
 	count += num_newlines;
 
-	spin_lock(&port->lock);
+	if (port->sysrq)
+		locked = 0;
+	else if (oops_in_progress)
+		locked = spin_trylock(&port->lock);
+	else if (cpumask_test_cpu(smp_processor_id(), &msm_port->curr_user))
+		locked = 0;
+	else
+		spin_lock(&port->lock);
+
 	if (is_uartdm)
 		msm_reset_dm_count(port, count);
 
@@ -1625,7 +1642,12 @@ static void __msm_console_write(struct uart_port *port, const char *s,
 		iowrite32_rep(tf, buf, 1);
 		i += num_chars;
 	}
-	spin_unlock(&port->lock);
+
+	if (!locked)
+		msm_wait_for_xmitr(port);
+
+	if (locked)
+		spin_unlock(&port->lock);
 }
