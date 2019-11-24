Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C246E108414
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2019 16:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKXPoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Nov 2019 10:44:04 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:34095 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfKXPoE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Nov 2019 10:44:04 -0500
Received: by mail-yw1-f65.google.com with SMTP id l14so1713126ywh.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2019 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GqQQ8sAnCYygNP94HJPDN0z12tYLH4hLXTaPwjkO9+w=;
        b=nh+CvKWEoocTUrSe/I48NOPbqzjjzQmkgbEoRWg8dOwwTRVeUULRRO1wGLj8dFX33D
         mdJJ4ssRJhV66a4TqHsFKV8Saq1KbocEVBCtv8nBv1Yf1fsBxga1r5fxBgVq/UfqsSfa
         9yGxhlFlUUWi3rwFaLFwHLCwjj4mvtvNofc2bzk3fDYBNRVmwRZKQDBRjIuRP4mYsH9O
         tOjsi4vzdN3SirpEuvVuapfoISnOZX1uDkOMpYL1S0ahQyLZfilYi6rztySsfSHMAgia
         vrqwt0HknnOXHhQj6OwyI06jwL2MxHrjcne19ifUni014Dl/LOcQE4iTJwrvJe6GSleS
         Gu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GqQQ8sAnCYygNP94HJPDN0z12tYLH4hLXTaPwjkO9+w=;
        b=VTA13nzRUMKpI+mzUfhX5junrLjXsONUF+ufUpcdRW1BuggeVq5+6Lha8B+2dYZZn+
         80IeUYJ0beVZp8UKZBQMF9dQeHN0oykWKucx3DC1zCG01mxxy51ZNY35KN0AGBI1OAb3
         AmAbc1/4dlqfpTwWmmpKYq+3GHSV0MqLRWgZSbJFPc1tKy/7aEWJjRdP9M6QNmrC+/Z0
         BlXDz3MGYkuQspTw9IYKNO0YzesIOPsFQY5yuM13XULaffkIb3Pfdrxto31a1+lH8Lfl
         PtrJ1ygGFNmsW7nXcXjz1mcI37oAnue/01AqTLiSszXYKf46dbnp5XEER2pCW+XjhBYb
         74CQ==
X-Gm-Message-State: APjAAAVo1wazNg/RxpvM9xfAyP9e616I5pCf4OHrg6GLrCDpXymVaCPB
        dPPeBJ2nXfcWZ84FMVxHNUT6VQ==
X-Google-Smtp-Source: APXvYqzQMxNKBRsdGeSsn/59/PqlcKP9o5gQMIaZahjp75Xr5m/pW3qW4Nev8c/uGw8zj0uQ7+OhAA==
X-Received: by 2002:a0d:d651:: with SMTP id y78mr16840971ywd.365.1574610243206;
        Sun, 24 Nov 2019 07:44:03 -0800 (PST)
Received: from localhost.localdomain (li2093-158.members.linode.com. [172.105.159.158])
        by smtp.gmail.com with ESMTPSA id h81sm2222564ywa.78.2019.11.24.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 07:44:02 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH 2/2] tty: serial: msm_serial: Fix deadlock caused by recursive output
Date:   Sun, 24 Nov 2019 23:43:34 +0800
Message-Id: <20191124154334.15366-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124154334.15366-1-leo.yan@linaro.org>
References: <20191124154334.15366-1-leo.yan@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The uart driver might run into deadlock caused by recursive output; the
basic flow is after uart driver has acquired the port spinlock, then it
invokes some functions, e.g. dma engine operations and allocate dma
descriptor with kzalloc(), if the system has very less free memory, the
kernel will give out warning by printing logs, thus recursive output
will happen and at the second time the attempting to acquire lock will
cause deadlock.  The detailed flow is shown as below:

  msm_uart_irq()
    spin_lock_irqsave(&port->lock, flags)  => First time to acquire lock
    msm_handle_tx(port)
      msm_handle_tx_dma()
        dmaengine_prep_slave_single()
          bam_prep_slave_sg()
            kzalloc()
               __kmalloc()
                 ___slab_alloc()
                   alloc_pages_current()
                     __alloc_pages_nodemask()
                       warn_alloc()
                         printk()
                           msm_console_write()
                             __msm_console_write()
                               spin_lock(&port->lock) => Cause deadlock

This patch fixes the deadlock issue for recursive output; it adds a
variable 'curr_user' to indicate the uart port is used by which CPU, if
the CPU has acquired spinlock and wants to execute recursive output,
it will directly bail out.  Here we don't choose to avoid locking and
print out log, the reason is in this case we don't want to reset the
uart port with function msm_reset_dm_count(); otherwise it can introduce
confliction with other flows and results in uart port malfunction and
later cannot output anymore.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/tty/serial/msm_serial.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 889538182e83..06076cd2948f 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -182,6 +182,7 @@ struct msm_port {
 	bool			break_detected;
 	struct msm_dma		tx_dma;
 	struct msm_dma		rx_dma;
+	struct cpumask		curr_user;
 };
 
 #define UART_TO_MSM(uart_port)	container_of(uart_port, struct msm_port, uart)
@@ -436,6 +437,7 @@ static void msm_complete_tx_dma(void *args)
 	u32 val;
 
 	spin_lock_irqsave(&port->lock, flags);
+	cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
 
 	/* Already stopped */
 	if (!dma->count)
@@ -470,6 +472,7 @@ static void msm_complete_tx_dma(void *args)
 
 	msm_handle_tx(port);
 done:
+	cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -544,6 +547,7 @@ static void msm_complete_rx_dma(void *args)
 	u32 val;
 
 	spin_lock_irqsave(&port->lock, flags);
+	cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
 
 	/* Already stopped */
 	if (!dma->count)
@@ -590,6 +594,7 @@ static void msm_complete_rx_dma(void *args)
 
 	msm_start_rx_dma(msm_port);
 done:
+	cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	if (count)
@@ -931,6 +936,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
 	u32 val;
 
 	spin_lock_irqsave(&port->lock, flags);
+	cpumask_set_cpu(smp_processor_id(), &msm_port->curr_user);
 	misr = msm_read(port, UART_MISR);
 	msm_write(port, 0, UART_IMR); /* disable interrupt */
 
@@ -962,6 +968,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
 		msm_handle_delta_cts(port);
 
 	msm_write(port, msm_port->imr, UART_IMR); /* restore interrupt */
+	cpumask_clear_cpu(smp_processor_id(), &msm_port->curr_user);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	return IRQ_HANDLED;
@@ -1572,6 +1579,7 @@ static inline struct uart_port *msm_get_port_from_line(unsigned int line)
 static void __msm_console_write(struct uart_port *port, const char *s,
 				unsigned int count, bool is_uartdm)
 {
+	struct msm_port *msm_port = UART_TO_MSM(port);
 	int i;
 	int num_newlines = 0;
 	bool replaced = false;
@@ -1593,6 +1601,8 @@ static void __msm_console_write(struct uart_port *port, const char *s,
 		locked = 0;
 	else if (oops_in_progress)
 		locked = spin_trylock(&port->lock);
+	else if (cpumask_test_cpu(smp_processor_id(), &msm_port->curr_user))
+		return;
 	else
 		spin_lock(&port->lock);
 
-- 
2.17.1

