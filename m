Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3346223162
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 12:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731386AbfETKen (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 06:34:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52242 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731266AbfETKen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 06:34:43 -0400
Received: by mail-wm1-f65.google.com with SMTP id y3so12733316wmm.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJaOf0A2/Xd/g+78Nlk/c2RYeLP2fm2K/KoH/Yw8zbU=;
        b=ypVliwq7SwcxaYxl4+KiThvD4LBr7BJikL4QOM8mIJ1xCwBblENKpU/2RMOMFrDXhu
         ZCEZ+yDmJHVEgB2KWcttKNH0OvBVItB+jFrmE7BTTwD7UMwrV7UnHc0PecqPCuAXmcOl
         w2B8sFUdppF3vAnZ8wUjq65AEXMemnsy26U6g+dAdMiY5pWxP8zvy//xpmBvZesOpLLq
         R4BfkZlqIvXbOShH6BB+h2YXfWzRxGcjEx2QEiua6ZQLxHMLi+WFyoThOP39eJ9meyvi
         A41aoqlxNOmH8Yr9WBqjUy42j43/Ff3Ui29P773BgS2uly+rHJXXsYmn/u/nIh+J7VuY
         /cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJaOf0A2/Xd/g+78Nlk/c2RYeLP2fm2K/KoH/Yw8zbU=;
        b=PHCYfCbrDtX/97qqZ+Xtg9/MnqyIstHF+egChPao2hoeCDFGRaSwAZ0aUiS6n7jdHh
         kOvuZ5kcLvY2Zt+unWshbwX5vh4XVtwXruPpnRpXqaX1tY9m675qgPeLu7zHKV1eRkpo
         iW/fMoU21iQP9xzIGwlQFZv3Ucc/DWtqQJHIbeBwZrskXHPeuNdEQuo+6U+WBgDUdz5k
         z+tKIfwyAih/ZYRiDPVMDo2WcjAMbHFFc4m+7PyU7N+6n7NzPuBrskqhFM4ts2CuBtFN
         rkk6iBj7o5fXLXyYErE5dzEOF3V/E1X1ymm5ID9G6N0Tj3+Kq5z2zilapGaZXvDYeCP9
         nkQQ==
X-Gm-Message-State: APjAAAWdg7JVzj1+hT3iX7IfPXKlXBWN8As535WK+EJgshrdF06SkWG7
        w+pvlr10Ir1qNhg0aKgF6rBeaw==
X-Google-Smtp-Source: APXvYqwX9w3fvgtsddUeORMpPjPJpygGZ2d2dpnnMtIHE7PR28RyVQbZiw+0IFSL0wKLtzL2qxf8yA==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr20213217wmk.116.1558348481406;
        Mon, 20 May 2019 03:34:41 -0700 (PDT)
Received: from localhost.localdomain (139.red-79-146-81.dynamicip.rima-tde.net. [79.146.81.139])
        by smtp.gmail.com with ESMTPSA id l2sm23451641wmf.16.2019.05.20.03.34.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 03:34:40 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org
Cc:     jslaby@suse.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        agsumit@qti.qualcomm.com
Subject: [PATCH] tty: serial: msm_serial: Fix XON/XOFF
Date:   Mon, 20 May 2019 12:34:35 +0200
Message-Id: <20190520103435.30850-1-jorge.ramirez-ortiz@linaro.org>
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

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
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

