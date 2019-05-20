Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C0D24087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 20:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfETSiz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 14:38:55 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56137 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfETSiy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 14:38:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id x64so358596wmb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QefnsvwV3d7y65V0/j2nW7pHukGB8D2WmP+WVKnMlIQ=;
        b=KBECxKjGA5xCv9a1o+snOgsUUJD68d0TAtUrPBibx++X/DXEjQy3l4l7REcbRK12dj
         CsbMf9EC4kQZ59sWHbglpE0OAMt05ZiaskBpgo1OymMjBWPFFI09+ecDdv1PEdaYsrYx
         JKFLXoxhfmMxvzYQHuUdBiyVpc1t2MLtOdGWdUjYMIREDZ5k1Dfct0RP0um/pCvPkeRz
         L+6Dingo+H2gBtH/bbv2UVddT/O7O1Set1bW5di+N62iYRer8ejVVOhFEg0qvLjJV8Go
         X/DGqMomCd9JvcmgDakQkvA5z/N6BmhmOekxyo0oBBBR8PenMpi/u8GFH+kUSuG0M+4a
         fuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QefnsvwV3d7y65V0/j2nW7pHukGB8D2WmP+WVKnMlIQ=;
        b=R1ZudOSzOTpS+UXQR1ka3v6N3PDNmHnPGEnmHRii5pkipV3jMdQtV42ZjQdqy1exo6
         QpgfrCtk1moDPVEgg4trQst8uedh24eaCVh5NbNQ85eDw8ZMYofqUJ0xZdTqEEUp6oMx
         xClXg+/rFDnk9d7NujXZL0Do+KtoDa/VCiESEpmoK06eU9WR/6s8ph/Psb5cEu+W80KD
         QMiKHNAE/hoZjJhsLsRUy74E8M5XqLgNFwH6i0JV+7/Ycolx9BqmrisBQBm51Aj2kBkp
         mn+9k/+fnNoUSC9qOOIZGGjlnYanr0SQjUSJ/yQ/v1gWJzUsbe27d9ABUfX8FlNkm3zW
         4ufg==
X-Gm-Message-State: APjAAAWOoZdgPxh6E0+lRGLOb9sS8duaPxmhTQKhFysZrsTczZYJkLIN
        NP1oEcdDq6WnxQXyWLVn7PXI2A==
X-Google-Smtp-Source: APXvYqxhw/eMY6lJtu6rgMmt3g2Nme0rl/8xFpmZ5o0h0dksezQ5TAgIqGhpzlxFBG9U33SkCbiVDw==
X-Received: by 2002:a1c:2c89:: with SMTP id s131mr378016wms.142.1558377532506;
        Mon, 20 May 2019 11:38:52 -0700 (PDT)
Received: from localhost.localdomain (139.red-79-146-81.dynamicip.rima-tde.net. [79.146.81.139])
        by smtp.gmail.com with ESMTPSA id m13sm17332790wrs.87.2019.05.20.11.38.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 11:38:51 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org,
        sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     jslaby@suse.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] tty: serial: msm_serial: Fix XON/XOFF
Date:   Mon, 20 May 2019 20:38:48 +0200
Message-Id: <20190520183848.27719-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the tty layer requests the uart to throttle, the current code
executing in msm_serial will trigger "Bad mode in Error Handler" and
generate an invalid stack frame in pstore before rebooting (that is if
pstore is indeed configured: otherwise the user shall just notice a
reboot with no further information dumped to the console).

This patch replaces the PIO byte accessor with the word accessor
already used in PIO mode.

Fixes: 68252424a7c7 ("tty: serial: msm: Support big-endian CPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/tty/serial/msm_serial.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 109096033bb1..23833ad952ba 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -860,6 +860,7 @@ static void msm_handle_tx(struct uart_port *port)
 	struct circ_buf *xmit = &msm_port->uart.state->xmit;
 	struct msm_dma *dma = &msm_port->tx_dma;
 	unsigned int pio_count, dma_count, dma_min;
+	char buf[4] = { 0 };
 	void __iomem *tf;
 	int err = 0;
 
@@ -869,10 +870,12 @@ static void msm_handle_tx(struct uart_port *port)
 		else
 			tf = port->membase + UART_TF;
 
+		buf[0] = port->x_char;
+
 		if (msm_port->is_uartdm)
 			msm_reset_dm_count(port, 1);
 
-		iowrite8_rep(tf, &port->x_char, 1);
+		iowrite32_rep(tf, buf, 1);
 		port->icount.tx++;
 		port->x_char = 0;
 		return;
-- 
2.21.0

