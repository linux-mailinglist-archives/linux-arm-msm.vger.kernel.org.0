Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06C8C108412
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2019 16:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfKXPn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Nov 2019 10:43:59 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:37965 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKXPn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Nov 2019 10:43:59 -0500
Received: by mail-yb1-f194.google.com with SMTP id k206so4987119ybb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2019 07:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7GoVKZppoRs4H8MV5EKljB+lt4NwFU2QYQ4kHf9aeFM=;
        b=gcN26IH29ommNyDhhBdS4LUjBSrhnXAY5ZK1+Yfk+Ut2ikTr3yycJPIH/+RCBpTxej
         N3TJayJ955EbCu045tGM2rEeL1myhqCn4BIxYOU16q0Shyq0hjbSHBw/MRfXxxVnzG2a
         hoiIRe8KalUW2+Fl4zEqdIbGYkOibTEl4kdeDcDIM9ExUeU8to+bnMXaGRqKOFlooUmy
         OWxikAkr9yZ/fEAc3KUdjeUrD7Tzb78Z4PkiftSuvzZAtAvNtPDacWCgA+Kyxle6eoo2
         H4tCC/DHHg6AbTdmSWPMpy8WHZHMZBfOfC2TZhYTLcO3OoW0VYxhjd/iz+a8H9oY7niu
         m3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7GoVKZppoRs4H8MV5EKljB+lt4NwFU2QYQ4kHf9aeFM=;
        b=OHrfAnRh6FsTztdjjugMZs83l9XMwhTNQP/sSTS0q2Tp3MUQm3yVI3/Oa8hjA5fQfQ
         TpbTj32DlS5WvUQfKFj+/l0DHOfn5PDeKunPQX99Hfhi2fy5i+Lwf3W+TnvEh+5EcFXT
         FQU7RNCD4+v5pvC8xvCg6pf/MEa5QY+dZQNJhDFHSC9lqv83KpauSUalQMjEWvXIlyn+
         3R1qQBeHMpY1Cs2hfLB0SLOHW7pXWW5fk9Stq7u7HlFExA7uDFzaG11knvuVymhgEFIM
         NV8vq9n1+ALEDVQeVkzqxvCYwkW2/7Eis9/oSrbjA764rd9bkQ91Mn50WhYOpSbuwrm+
         cggg==
X-Gm-Message-State: APjAAAW6UTRosFyNTMOkk3X1QcQGdeg17WlXj5YjzxG2Ru+Vd/7Dt41k
        Q1ounj/IXDmxC9PIxNNeYuU5aQ==
X-Google-Smtp-Source: APXvYqyEZRjk614ciccDP+789BFWvngD1xEZFN1RKPsZLP+LMRQQPwNkhHtc3XCbgw+xJQsROxYehg==
X-Received: by 2002:a25:8281:: with SMTP id r1mr19218080ybk.489.1574610237279;
        Sun, 24 Nov 2019 07:43:57 -0800 (PST)
Received: from localhost.localdomain (li2093-158.members.linode.com. [172.105.159.158])
        by smtp.gmail.com with ESMTPSA id h81sm2222564ywa.78.2019.11.24.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 07:43:56 -0800 (PST)
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
Subject: [PATCH 1/2] tty: serial: msm_serial: Fix lockup for sysrq and oops
Date:   Sun, 24 Nov 2019 23:43:33 +0800
Message-Id: <20191124154334.15366-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
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

