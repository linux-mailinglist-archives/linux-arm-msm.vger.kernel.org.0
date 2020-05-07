Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC43F1C9BCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 22:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgEGUJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 16:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728635AbgEGUJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 16:09:14 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2292AC05BD43
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 13:09:14 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mq3so3138795pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDitJmCYI6w8zpra4JuK0k+hw0gGmgK6hNM/TsrDerA=;
        b=k06JzvMvr6IYLZzGXi5MfjXYuByqlDZ5Ov7mPhaAbBAYC2WDtJlBDj/9PSIX63fckv
         yvcOSjPw7/Q1Vr8lprU6X2yuu+hUFrZgmNJmmkEF8/JQfVgtWlgprpvoRq5+dHn2sEWv
         beDgToAgENRUasSAvNZUqtFk/E56syR3ia0zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDitJmCYI6w8zpra4JuK0k+hw0gGmgK6hNM/TsrDerA=;
        b=mnJDvmt8G7xpZZkxs1qeN4EawH5XFeHX3EjEfkaSnK3rwurlgCvjb8iMGaKdo3yarJ
         vazuEOS0m7fnnJI2QD71y+EPcM0wfLUp3P6KNy7UXHSHzzxsTJwijN3nfbcBQtOaCMkz
         kmF9eGl3N4Bw0glEs6inBGfxNYdIIaGJQhy0nnMWKriPvn0OcQUfqUMgKj7SY0O3/6e7
         GqKWFifj0SNOT54fU9vqPqYncuAzCe9Z3wzZAsOL3unV3Gy+O4gfI+XbxlOD/AAly525
         cYFG8XLG/4uhK8B6d0PJMgY4OrFogbSB74jl8hqBbnT6DTf5wiU85HgaqdiujAMLUB0e
         /IWQ==
X-Gm-Message-State: AGi0Pua2HZchugnpMKuaSfKL+vcKm6VO2b/YhkIEK4NEpHLPhIqV1wfv
        PJRHBCL+C814qwTNCqKxsI1M2g==
X-Google-Smtp-Source: APiQypJ7eLBdCYVxkzItvTQhjgPKMPikSZLf+2fArLtn+DXLDcEsLN3jFlCfrxAqCJRgj8wo2lxu1w==
X-Received: by 2002:a17:902:7593:: with SMTP id j19mr15341546pll.62.1588882153625;
        Thu, 07 May 2020 13:09:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 13:09:13 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jason.wessel@windriver.com, daniel.thompson@linaro.org,
        gregkh@linuxfoundation.org
Cc:     corbet@lwn.net, frowand.list@gmail.com, bjorn.andersson@linaro.org,
        linux-serial@vger.kernel.org, mingo@redhat.com, hpa@zytor.com,
        jslaby@suse.com, kgdb-bugreport@lists.sourceforge.net,
        sumit.garg@linaro.org, will@kernel.org, tglx@linutronix.de,
        agross@kernel.org, catalin.marinas@arm.com, bp@alien8.de,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/12] serial: qcom_geni_serial: Support kgdboc_earlycon
Date:   Thu,  7 May 2020 13:08:48 -0700
Message-Id: <20200507130644.v4.10.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

Changes in v4: None
Changes in v3:
- Renamed earlycon_kgdboc to kgdboc_earlycon.
- { ; } ==> { }

Changes in v2: None

 drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6119090ce045..6bace1c6bb09 100644
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
+						      struct console *con) { }
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
2.26.2.645.ge9eca65c58-goog

