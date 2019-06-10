Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C48A3BADB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 19:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfFJRXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 13:23:14 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41434 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728394AbfFJRXO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 13:23:14 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so10001605wrm.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hE4cR11QUq+RsE+T2OXtTk5Fiz8rk9hoeeEatdOHPQM=;
        b=DYCkAdiUnfostkm8Hivw7VIDgB6ztRtb5vpXxRVM8Gy7u2qzeKbULe2FAkpkmxsGuC
         e8dFxmka3vVJmQtR0L+lKeCuI5rECXgOeNiuiqkohPLon3Zu/J6pIJGpDH6sAnVNBRdy
         iYj0cmRtJLOZIRfdYpm5c+25f1k1lOIQ9se8RXYe2kigfn9PjhP/jMhsnV4/FWwA8LMe
         vZ1pMlKVQDJHiSjjNr7yYS8h0bO1PSPX8pdEk1bbuu6UeNB+/3RqzTrG0tOSEYGNUQu0
         XM6/RHV4jttnLWJzsGRkz+OgNKuLBkLRBKKRjzkOgNcrw86Cci352k8OrtwaNR0g+ul9
         PiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hE4cR11QUq+RsE+T2OXtTk5Fiz8rk9hoeeEatdOHPQM=;
        b=fF46AP/x9yPGfX31DWKOOgZ/Q5bRJbK2FI5w6sw0XDaWEGw6ecPuU6omjZMvdFC/wz
         009bkAlzSGnFbL/Yxr0YHDKyqgvDaAQbMQfBYGNWMxeWn9LpAltO4w6CXtvCkIG0OlJi
         W9Q+s2jcQfnlkqq+rrWH5pR6DYKh2gYfbD7FXACqfc5f0K3RXMx4Dkhpqaf0C5A7hIZy
         shME0tHVkd5lOV3/zft8n32C/veoDVKtWaatdxl5tODCHaVwIarfA3XdZah7BhyHfUCH
         AAalFGZiwoaeEZpaJGXLpoOkJZ1WHDK6LpJ4RzPAvifRthHIApSGL4TLP0MnyHtgy0V/
         PXeQ==
X-Gm-Message-State: APjAAAWCtrqkL8/Lczi8J305dWNu0ZZTTDPg4NyhDpIPC+y8bQcHRq46
        bwC3J1JBSQN28QeAuCBqzqlO9g==
X-Google-Smtp-Source: APXvYqyoZES/st9Q7kYb+Li6V2PdFuszQXBxanwuOTUOBVBPdGObPs4cF7PE4Wf0IvDmw5hHlnnD1g==
X-Received: by 2002:a5d:4489:: with SMTP id j9mr656490wrq.15.1560187393072;
        Mon, 10 Jun 2019 10:23:13 -0700 (PDT)
Received: from localhost.localdomain (233.red-79-146-84.dynamicip.rima-tde.net. [79.146.84.233])
        by smtp.gmail.com with ESMTPSA id f2sm19853686wrq.48.2019.06.10.10.23.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 10 Jun 2019 10:23:12 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org,
        agross@kernel.org, david.brown@linaro.org, jslaby@suse.com
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        bjorn.andersson@linaro.org
Subject: [PATCH v3] tty: serial: msm_serial: avoid system lockup condition
Date:   Mon, 10 Jun 2019 19:23:08 +0200
Message-Id: <20190610172308.21129-1-jorge.ramirez-ortiz@linaro.org>
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
 v2: fix exit condition (timeout --> !timeout)
 v3: add these clarification messages
 
 drivers/tty/serial/msm_serial.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 23833ad952ba..3657a24913fc 100644
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
+		if (!timeout--)
+			break;
 	}
 	msm_write(port, UART_CR_CMD_RESET_TX_READY, UART_CR);
 }
-- 
2.21.0

