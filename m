Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 835EF1A4BE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 00:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgDJWSc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 18:18:32 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51102 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgDJWS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 18:18:28 -0400
Received: by mail-pj1-f68.google.com with SMTP id b7so1267328pju.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Xvr0zLScn2nLCI1oJV5OmhbqIZY3/XDOPCMztpMIRU=;
        b=k4p/J0RkQWbVJUKkTEJkmAlkTUHSGfQUMbPY5oEJl0LlPckFTu8/+Cq9PSIYVOTAMF
         Cl7i8VarjWIpiZwgsCIXffNBCRoDzx5zRIs2DL/a1TP/GQCnX0rVVMXb+UubxNRsVGE/
         H02eTDq2K8FVOWnJiLXE/ZsILItbjVpsEFQBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Xvr0zLScn2nLCI1oJV5OmhbqIZY3/XDOPCMztpMIRU=;
        b=BLx/BdxLQtC36cwJjMoOWp3U4dPB9AidaN/m6yNOgoqipxMUNWt2rw/pMd7f60/Vmv
         yW+uz8pCQVdBfRSBj0Yd1Zf6vx0uNdyom0dSYfO1/7Nmpw5QDQYJbSNjMKqq+35C5rL7
         gdrYuJui3IIgIHs1bNKGW/XWuY3gPDHT/s/rwQ3yUQzt43lgIrPf7tB1yjPZZi2FyMtT
         It0OHbQpMe8SJw0h7b5oJRPAnifPUEn+I6xPvZYz6ExCI8v7BCbNCyiWridzxSLm3uxb
         e3gNzhIITUF/WDCwsGtC3vIBr13yKRgtcuy9nk1c4uOnYbO1zRN5/L2l+a7XACE/mOwD
         +uKQ==
X-Gm-Message-State: AGi0PubdQKVw00oQozPcbqekTmTr6H5RN65J24OcEQaGestcF7XHNGRa
        mhU8uqT84C3W5yI9yKgrFobUpg==
X-Google-Smtp-Source: APiQypKJ94vBioTXZPIp0dI7ctcYkCPzkMjxyO4M1PLccd96ucK1TAvxhGD7obO0jnob1QYfSWfzmw==
X-Received: by 2002:a17:902:8e8b:: with SMTP id bg11mr6257430plb.139.1586557107068;
        Fri, 10 Apr 2020 15:18:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id x2sm2646600pfq.92.2020.04.10.15.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:18:26 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jason.wessel@windriver.com, daniel.thompson@linaro.org,
        gregkh@linuxfoundation.org
Cc:     hpa@zytor.com, kgdb-bugreport@lists.sourceforge.net,
        corbet@lwn.net, frowand.list@gmail.com, tglx@linutronix.de,
        jslaby@suse.com, linux-serial@vger.kernel.org, mingo@redhat.com,
        will@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        bp@alien8.de, catalin.marinas@arm.com,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] serial: qcom_geni_serial: Support earlycon_kgdboc
Date:   Fri, 10 Apr 2020 15:17:25 -0700
Message-Id: <20200410151632.6.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200410221726.36442-1-dianders@chromium.org>
References: <20200410221726.36442-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement the read() function in the early console driver.  With
recent kgdb patches this allows you to use kgdb to debug fairly early
into the system boot.

We only bother implementing this if polling is enabled since kgdb
can't be enabled without that.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0bd1684cabb3..e3bb90404ab5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1084,6 +1084,36 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
 	__qcom_geni_serial_console_write(&dev->port, s, n);
 }
 
+#ifdef CONFIG_CONSOLE_POLL
+static int qcom_geni_serial_earlycon_read(struct console *con,
+					  char *s, unsigned int n)
+{
+	struct earlycon_device *dev = con->data;
+	struct uart_port *uport = &dev->port;
+	int num_read = 0;
+	int ch;
+
+	while (num_read < n) {
+		ch = qcom_geni_serial_get_char(uport);
+		if (ch == NO_POLL_CHAR)
+			break;
+		s[num_read++] = ch;
+	}
+
+	return num_read;
+}
+
+static void __init qcom_geni_serial_enable_early_read(struct geni_se *se,
+						      struct console *con)
+{
+	geni_se_setup_s_cmd(se, UART_START_READ, 0);
+	con->read = qcom_geni_serial_earlycon_read;
+}
+#else
+static inline void qcom_geni_serial_enable_early_read(struct geni_se *se,
+						      struct console *con) { ; }
+#endif
+
 static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 								const char *opt)
 {
@@ -1130,6 +1160,8 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 
 	dev->con->write = qcom_geni_serial_earlycon_write;
 	dev->con->setup = NULL;
+	qcom_geni_serial_enable_early_read(&se, dev->con);
+
 	return 0;
 }
 OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
-- 
2.26.0.110.g2183baf09c-goog

