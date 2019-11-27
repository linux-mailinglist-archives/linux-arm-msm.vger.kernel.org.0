Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3123310B0FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 15:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfK0OQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 09:16:40 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:32811 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfK0OQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 09:16:39 -0500
Received: by mail-yb1-f196.google.com with SMTP id o63so481809ybc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2019 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CIUhEj1Cxl4mcTC+Hh8o1BVtvNMRQEU53pMe4Z0u5xw=;
        b=xDtklBSxpXCXUM/P4qgJEGo3w98bIz5pGXMkP4B03I3H/9KfBbAJot0wUh1KdzxTEN
         pxE2oHI6osm1ZQkG3bPbbTLiV8Dew0dg7nLKmFZedMyPR8W3OUTFCW4GvqBpDvKbuDF5
         olDE3NFrHm5QpDmOukxyOtmFiGgbRLISKz55cjBh7Njwpj3FQV7LLszpqklMpLAGKWMy
         1aArrg6nk/8ND6Ez/LJVOk0HeT+4WE8+lyEMkau4yyuebdZvL/sjiayLmqLU4R01ViXa
         Leq11dQX1KZdC6zEOAz5V3J8i5ZJpYRHbSFaz+RuzGe3wMwKTCrMn+qvkh8g4lXIH+MF
         HJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CIUhEj1Cxl4mcTC+Hh8o1BVtvNMRQEU53pMe4Z0u5xw=;
        b=r4MVCL6xJkFyz3mPX4uLyIZxeus+lBUJ+4Tpfq4BHoT37zRBJZ1V5l9Sb1rNUPAF5q
         SWxHuOm3whcnOg/uPEUlFjZhAStDe6LuUjEkWzISkgZOJzjqXpHqMaCgdp0Ms5IUSgd3
         wPdwRS4zhK2+1dxPIMFUCzo4pFt2hsbPUUVBstqNW7JOjLOvW5d+r5mU4ytbMzS5F0+s
         MMjj1Qe9EBOkVwb28S2nKD8LStrMjd5YeyxP3UI3ZBB+5aBMXeCn+X84DB4RUmGiSkNR
         NCBulWkiuPtD+vXIOR8fbgRrFiyI/zT/GnE1xSrgl7vhQbW01Nstb39FJHybPtoR08B8
         dSsg==
X-Gm-Message-State: APjAAAX01n1nK2Cd6hdOiI5t1Kl6dELT2NytojLuHUAT9SuMnHi12bD5
        zbzcGV5iQVphX6Ssbqw3MsOfeg==
X-Google-Smtp-Source: APXvYqzV12QvZsI3IM6caMeNz86H7K6ekm0izdoiqgIR4aCw110NrINyWls24m1l8P/VpKOPbObEKg==
X-Received: by 2002:a25:908d:: with SMTP id t13mr31248482ybl.265.1574864198588;
        Wed, 27 Nov 2019 06:16:38 -0800 (PST)
Received: from localhost.localdomain (li2093-158.members.linode.com. [172.105.159.158])
        by smtp.gmail.com with ESMTPSA id u123sm6911115ywd.105.2019.11.27.06.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 06:16:38 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 1/2] tty: serial: msm_serial: Fix lockup for sysrq and oops
Date:   Wed, 27 Nov 2019 22:15:43 +0800
Message-Id: <20191127141544.4277-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127141544.4277-1-leo.yan@linaro.org>
References: <20191127141544.4277-1-leo.yan@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the commit 677fe555cbfb ("serial: imx: Fix recursive locking bug")
has mentioned the uart driver might cause recursive locking between
normal printing and the kernel debugging facilities (e.g. sysrq and
oops).  In the commit it gave out suggestion for fixing recursive
locking issue: "The solution is to avoid locking in the sysrq case
and trylock in the oops_in_progress case."

This patch follows the suggestion (also used the exactly same code with
other serial drivers, e.g. amba-pl011.c) to fix the recursive locking
issue, this can avoid stuck caused by deadlock and print out log for
sysrq and oops.

Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/tty/serial/msm_serial.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 3657a24913fc..889538182e83 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1576,6 +1576,7 @@ static void __msm_console_write(struct uart_port *port, const char *s,
 	int num_newlines = 0;
 	bool replaced = false;
 	void __iomem *tf;
+	int locked = 1;
 
 	if (is_uartdm)
 		tf = port->membase + UARTDM_TF;
@@ -1588,7 +1589,13 @@ static void __msm_console_write(struct uart_port *port, const char *s,
 			num_newlines++;
 	count += num_newlines;
 
-	spin_lock(&port->lock);
+	if (port->sysrq)
+		locked = 0;
+	else if (oops_in_progress)
+		locked = spin_trylock(&port->lock);
+	else
+		spin_lock(&port->lock);
+
 	if (is_uartdm)
 		msm_reset_dm_count(port, count);
 
@@ -1624,7 +1631,9 @@ static void __msm_console_write(struct uart_port *port, const char *s,
 		iowrite32_rep(tf, buf, 1);
 		i += num_chars;
 	}
-	spin_unlock(&port->lock);
+
+	if (locked)
+		spin_unlock(&port->lock);
 }
 
 static void msm_console_write(struct console *co, const char *s,
-- 
2.17.1

