Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A9E3AFC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 09:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388157AbfFJHhm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 03:37:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35461 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388071AbfFJHhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 03:37:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id m3so8081039wrv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aJUsVJEK9+CBcf4UpPeGea/cLMYkv5xsZDArHsWziA=;
        b=x7cXKFFBTeToSOdu9ScaVUDjqDt66N6zxwx5eiCRELdilz4D9HOV0PNBw0USpTHZyo
         pRyDwvR7FHnybSkI/LJYZw00nrY/2UmFQdxuklZCaowJP0dgKU9AkSgaiLYbmq16A1rq
         DZhmYxD5o/LDMc4Bu6RveBnZNWrIFtzHcRYI17JXx+3s1EhRfi7ZJoKoeFB+qZ0J7ubW
         TWeaZgAjZcBYdfawOgOIIxbBa7oRvhWafut/epTazByr2fkOnHkbS4hFO2iTzqmGTZlE
         Tx928gmgtLkiMPbuQdxchrEQ2aYEWIhfSjfrLSGV2PuhiExO1oP4JRtM0C/TY9hRwPWh
         zb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aJUsVJEK9+CBcf4UpPeGea/cLMYkv5xsZDArHsWziA=;
        b=EaLyCCudxwocvr5XfVIeZKn5B3ZYUAkaTVt34yOK7qOuQq9TQmrrDR5WBcL6uFFarA
         vwWH4sZ0kzHPoBSwI0yI+4g4EU9p7eqHovmu130J7yq7MuxA8RQj90D7NaoNjLYQdTZR
         dXIruDpMax9Tl5khpUYAyvJTH+dqcqjOzaOI5FdKFRi18UZS9kwiGJLpYZSnd8R3neK7
         crkkmzAmy4/r01jO/Zqj1G5OhfbwysOBE7B4Y9MDF8y2qvT7a8Y+SPZcQ6k0OaGcq5ho
         09OyZfdFF87EP5aYRcMbE1O+hRiPgISgvJYbXqNXZnRuaqgrWPpldee+HyC1G12kqtDt
         tdWw==
X-Gm-Message-State: APjAAAUzQhw25TQqNkJ8M7hk9haaGnUfB9OEY1Vz5gkynbJPtAGq1ET7
        Z8lOxaixbxLIabEc5IVDIAKupQh6ubA=
X-Google-Smtp-Source: APXvYqxFZIVaBoMnIveU6WQwFqVvm62qPtjos9GCmyqHffI7iTlBHH5oTNEWoqPqzxf7MS571LsXFw==
X-Received: by 2002:adf:f951:: with SMTP id q17mr16745992wrr.173.1560152260502;
        Mon, 10 Jun 2019 00:37:40 -0700 (PDT)
Received: from localhost.localdomain (233.red-79-146-84.dynamicip.rima-tde.net. [79.146.84.233])
        by smtp.gmail.com with ESMTPSA id t7sm8769520wrn.52.2019.06.10.00.37.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 10 Jun 2019 00:37:40 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        bjorn.andersson@linaro.org
Subject: [PATCH] tty: serial: msm_serial: avoid system lockup condition
Date:   Mon, 10 Jun 2019 09:37:37 +0200
Message-Id: <20190610073737.22856-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function msm_wait_for_xmitr can be taken with interrupts
disabled. In order to avoid a potential system lockup - demonstrated
under stress testing conditions on SoC QCS404/5 - make sure we wait
for a bounded amount of time.

Tested on SoC QCS404.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/tty/serial/msm_serial.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 23833ad952ba..0d4f1fe2b3a2 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -383,10 +383,14 @@ static void msm_request_rx_dma(struct msm_port *msm_port, resource_size_t base)
 
 static inline void msm_wait_for_xmitr(struct uart_port *port)
 {
+	unsigned int timeout = 500000;
+
 	while (!(msm_read(port, UART_SR) & UART_SR_TX_EMPTY)) {
 		if (msm_read(port, UART_ISR) & UART_ISR_TX_READY)
 			break;
 		udelay(1);
+		if (timeout--)
+			break;
 	}
 	msm_write(port, UART_CR_CMD_RESET_TX_READY, UART_CR);
 }
-- 
2.21.0

