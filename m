Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38023B004
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 09:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387947AbfFJH4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 03:56:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34757 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387855AbfFJHz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 03:55:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id e16so8137318wrn.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=59OBAj0fI25tEYttQXITetWvFu8mb0M8xC0iXb+r1/Q=;
        b=ac55uDWvwtnRMO4dwo2jOwokokoGQqChSr8nLRQkch3cqmntcsHmIs5Enlxes4BMmD
         whsoQL32Phf74kG9p3ykb4BQpVNP5cJqt+cKlIDj4Zdm24Diem/ePySIdftWtIgPyWvy
         5p0cqzqB9FFQq+TYlniqybtJAIfZ4NAgd1YaG7zkhbQvdpOCxk7J5mc279Hc2osCt1vd
         Yl1fUWZqlbXJ/w97BoASau/j4/JSf2CTqRYtgMXw2CLCv729XFXLUeFukUuYvVJ5gmQM
         G4SPTb4u2rAhJ5Y4dX5clBzE9vGyNBmO2HARalYO+9+qToitJnp5HTEtK2qpmoVHbXQM
         nsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=59OBAj0fI25tEYttQXITetWvFu8mb0M8xC0iXb+r1/Q=;
        b=G65MGVQMYQdgUK2DUAN7rOQqzvY/v9L01BL2Kl9ONHj5oioCzixDq3/IAfBDMxIzDo
         8peGHjbTsOtQ3ZNifCWeZMYy+T6W5i0bwP48XMibsKhVghbOM63bsaGxb10o76LKg0zz
         0r3OX8u+vsjtx4lRv8gSpO7BwqmKKNJjdjXfqhh6dMzX2+z1RpYdfU1HYsSykPd43ecx
         qn2bBiQ85IS5km9CFcqH41Hgk3L3OjmMUzXLlWTK8Jkv3C2YxnpQyftu4yE2r9l67Vc9
         zTP/KGWDejWYksPUY9O82dRm7ih1imUVzAqd/r/XymCvtoqXds/td87YLhApK4zcyRC7
         VIZA==
X-Gm-Message-State: APjAAAWo2a2h0Q2D3XomIlMKU9WobkIakmmlNQV2qYWZjM/0DQH4A0uK
        kHazDNriROHSqolR6PExWLV4cQ==
X-Google-Smtp-Source: APXvYqxbn9YaeW8aGMKMh2aP+dx2pUtvPkFwVo6Ly0icmWY5OKpn9BPA1ZwRVm/Nm5h9j9ZfLAU01g==
X-Received: by 2002:adf:9ed3:: with SMTP id b19mr21441431wrf.292.1560153358334;
        Mon, 10 Jun 2019 00:55:58 -0700 (PDT)
Received: from localhost.localdomain (233.red-79-146-84.dynamicip.rima-tde.net. [79.146.84.233])
        by smtp.gmail.com with ESMTPSA id e13sm22627166wra.16.2019.06.10.00.55.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 10 Jun 2019 00:55:57 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        bjorn.andersson@linaro.org
Subject: [PATCH v2] tty: serial: msm_serial: avoid system lockup condition
Date:   Mon, 10 Jun 2019 09:55:54 +0200
Message-Id: <20190610075554.24979-1-jorge.ramirez-ortiz@linaro.org>
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

