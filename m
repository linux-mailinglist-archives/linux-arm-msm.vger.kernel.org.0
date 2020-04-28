Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B801BCE6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 23:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgD1VOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 17:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726697AbgD1VOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 17:14:31 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A829C03C1AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 14:14:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a32so47524pje.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/OLrWf8x1qLHrBr/Q6vF9daUHKkS3VqdNLwPQBuWJDU=;
        b=ceR7s4QLjCxcwBopolOS/b+gt1XS1V44hpA4RaLu3U7xz4gbiad0ZwvuUfq2zoDgWW
         LUxBaQE0WU7cVAqQaq42UbdsZLHipbJutBdwwdZhBMU9LwbKFUAMsXICh1j8qxyF2HLT
         XNOSxdPCyaFKmbg5uLtxCtuq/CZhkE8K72skM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/OLrWf8x1qLHrBr/Q6vF9daUHKkS3VqdNLwPQBuWJDU=;
        b=Bw4QOjO9uA0Qaq0Co8zKWqzCis9WJNBhJ1t4vDt4D0wzhXURgd37SIg+zyWq33Heng
         1CZJMmp3SMwO5TNfiu4dypwbzzOkSMu3qEZPFWrjP6vrjUBiAuk88buStovpVgcy5Gk8
         kHea6w1ROJQfm43ENrBeauTAgJ9vT8HiMHQc/ukVSyaF5IX0tR6K+CNUIz+D56YMZHHn
         jHD5TUqUqTl72LDEq3zWwod4cAEqpHdBq0ORs0lTvqSNeRR5H/m5K09bWvo2ZTt7uoRe
         82sE2zZrIH4ZX7E7ddsjZplsrmWnhn28MhzDKWsv6DPPYW/qQ1o+AUABDbPmW7CdZdQg
         k6nA==
X-Gm-Message-State: AGi0PubmHNJEenGe2rTZWlZ87qjlo2QuwyNJbvMNcTxK/AFWEnDjEjDj
        eDtjVqHjDueSrkALIPHUuhnhJw==
X-Google-Smtp-Source: APiQypImFZwATzuEOLMe75yAljMn4Bd02aw2txf/8JfWQMe0c5vUhr/j2Svo3I7xFuBIbvpRPemi7A==
X-Received: by 2002:a17:902:904a:: with SMTP id w10mr16025829plz.17.1588108471172;
        Tue, 28 Apr 2020 14:14:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 14:14:30 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jason.wessel@windriver.com, daniel.thompson@linaro.org,
        gregkh@linuxfoundation.org
Cc:     agross@kernel.org, kgdb-bugreport@lists.sourceforge.net,
        catalin.marinas@arm.com, linux-serial@vger.kernel.org,
        sumit.garg@linaro.org, corbet@lwn.net, mingo@redhat.com,
        will@kernel.org, hpa@zytor.com, tglx@linutronix.de,
        frowand.list@gmail.com, bp@alien8.de, bjorn.andersson@linaro.org,
        jslaby@suse.com, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/11] serial: qcom_geni_serial: Support kgdboc_earlycon
Date:   Tue, 28 Apr 2020 14:13:49 -0700
Message-Id: <20200428141218.v3.9.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428211351.85055-1-dianders@chromium.org>
References: <20200428211351.85055-1-dianders@chromium.org>
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
2.26.2.303.gf8c07b1a785-goog

