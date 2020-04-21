Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854101B31AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 23:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgDUVPe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 17:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726398AbgDUVP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 17:15:29 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B701BC03C1A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 14:15:29 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id g30so7207244pfr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 14:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BjXLxKYx2J4SfneKVn6eyAIDqxc8kteAmWSGrEv3s1Q=;
        b=CcJCluHY3oWgCqfj8YhfZKPo0NR/BUu6kAlYc9e5Oewk1f5pCuZN7xV0s8bJRPKSaa
         jN+bzjxqRaMU7hrDRd5nNyB2ufRcJdE8b+aIVwOlnZcSoBmTm7+6Ka+Hyjdbn8I/xBdB
         1FpGO292NE9dv3pw6YfLq20gXxSIurqzigZRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BjXLxKYx2J4SfneKVn6eyAIDqxc8kteAmWSGrEv3s1Q=;
        b=ZGjD2lsvwA0tFDqcn7mZhP1v1OFRD/mGx5UHMyBXOwFd9lKgio+FTJoB7uOev/waUs
         25J46Shc95P1sUXvqcZIxx0wHz8PunKnZxGE02fmXyLMmyeJYTwE7KDf1mV5JO40dDrA
         D+1wZynOZPCjYpjPdBWEN8AGT1McB28VXt5y0xuA6R42lJQlYSsGIYJGieYvJpFOwbKC
         4Om1L0WW4rxO0bLYE27UQTlNv96HQrFG4xFlLwb65yrsdKPF62/x/aFYfAjmmfb89rac
         X6UrzIYIV70ecpF9xSpH4/9oaz2C2AYI4kuVm0e7tIc2rgRekPIU6ScdgcKi3CdSnqh/
         Z0pw==
X-Gm-Message-State: AGi0PuYS5dmT3GyXrWqmaz8ruJHW0fFoKl2gQVbz/lH3p4hdx+x/0Jo+
        CrxeH75rXQxj2oq6jLEDNYjRcA==
X-Google-Smtp-Source: APiQypKbzNZ3tNv1+91oSCmg1IIaM8GOSYYn0L8dUZkcD300x8Du/f0RDrz/WsZ9Oyq+POo+vU2dNg==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr24165243pgk.429.1587503729162;
        Tue, 21 Apr 2020 14:15:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 14:15:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jason.wessel@windriver.com, daniel.thompson@linaro.org,
        gregkh@linuxfoundation.org
Cc:     kgdb-bugreport@lists.sourceforge.net, mingo@redhat.com,
        hpa@zytor.com, bp@alien8.de, linux-serial@vger.kernel.org,
        agross@kernel.org, tglx@linutronix.de, frowand.list@gmail.com,
        bjorn.andersson@linaro.org, jslaby@suse.com,
        catalin.marinas@arm.com, corbet@lwn.net, will@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] serial: qcom_geni_serial: Support earlycon_kgdboc
Date:   Tue, 21 Apr 2020 14:14:46 -0700
Message-Id: <20200421141234.v2.8.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
References: <20200421211447.193860-1-dianders@chromium.org>
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

Changes in v2: None

 drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6119090ce045..4563d152b39e 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1090,6 +1090,36 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
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
@@ -1136,6 +1166,8 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 
 	dev->con->write = qcom_geni_serial_earlycon_write;
 	dev->con->setup = NULL;
+	qcom_geni_serial_enable_early_read(&se, dev->con);
+
 	return 0;
 }
 OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
-- 
2.26.1.301.g55bc3eb7cb9-goog

