Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C7E6AE4CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 16:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjCGPdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 10:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbjCGPdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 10:33:00 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBDD7BA2A
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 07:32:48 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so1530490pjn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678203168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3oD+VWh6vfXWKl1YinwYukVpyEX7O+ZCt88fiLI0g4=;
        b=RKiWq7kI7n6XmLArIWP1AnEyouczbA5z2QjZxwSdk9/YWDVGfDjQfkhiJtdsvXIhHZ
         31v5iScnAoLMLvPeOkkr7apGnVHUR3f/0qXKPKEJr1wFwS3r/nEQ0mv/BloFixdhp1XV
         z+ULops+ColVZDGxpN+z2x9m6T0yFpAE42FHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3oD+VWh6vfXWKl1YinwYukVpyEX7O+ZCt88fiLI0g4=;
        b=MVCxuwF+xz/jCMVw/2vkhRh55Li+zq7dFSRc2exRPBlVlDNeXOOQac/hE9l7av6WrW
         7mLCjVPr6XAs3yI3X+i1iwBcsWSF2zMGXwgfaDvndaZKlI15qGm0OUfKXbRefIfjKHSm
         o1hjLpEmU7DsTUzlMpdFpddQ5iLq8+WgIl6iJ6MnJjlUt+6OObd0TT9cftxPfErXSG5v
         zfKOMsyw1D60ItZT6NLANrafqHtA0RJ2CJ5EbApSB2nClhDz97JhNWHaA+gTHIk33CU/
         kndbJLF7ATAdwv8yzt+jVl9NMO6qI3l6Vgicbcwh0zWiAPkaISGHrQ7vNL3H73qhSfmb
         vIQQ==
X-Gm-Message-State: AO0yUKXo+rb2wPpqgneaIWVJSzZz10qeJN0/Vv+Jb3nAqQsiK2X75ySm
        E/xb0Gs90hap9oX1tz2tjcNYpA==
X-Google-Smtp-Source: AK7set+HF+uHK6o7uusM0NKP4C1wBRuoJGtW9phRDx4xNRHTf+wnthartYKd0Z8578jfS7OlD/PVxQ==
X-Received: by 2002:a17:902:e748:b0:19e:82d5:634c with SMTP id p8-20020a170902e74800b0019e82d5634cmr16558648plf.53.1678203167946;
        Tue, 07 Mar 2023 07:32:47 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2023:7dda:98bb:96dd])
        by smtp.gmail.com with ESMTPSA id jy16-20020a17090342d000b0019719f752c5sm8586843plb.59.2023.03.07.07.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:32:47 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] tty: serial: qcom-geni-serial: Fix kdb/kgdb after port shutdown (again)
Date:   Tue,  7 Mar 2023 07:32:11 -0800
Message-Id: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
in progress at shutdown") was basically a straight revert of the
commit it claims to fix without any explanation of why the problems
talked about in the original patch were no longer relevant. Indeed,
commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
in progress at shutdown") re-introduces the same problem that commit
e83766334f96 ("tty: serial: qcom_geni_serial: No need to stop tx/rx on
UART shutdown") fixed.

The problems are very easy to see by simply doing this on a
sc7180-based Chromebook:

1. Boot in developer mode with serial console enabled and kdb setup on
   the serial console.
2. via ssh: stop console-ttyMSM0; echo g > /proc/sysrq-trigger

When you do the above you'll see the "kdb" prompt printed on the
serial console but be unable to interact with it.

Let's fix the problem again by noting that the console port is never
configured in DMA mode and thus we don't need to stop things for the
console.

Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in progress at shutdown")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index d69592e5e2ec..74a0e074c2de 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1070,8 +1070,10 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
-	qcom_geni_serial_stop_tx(uport);
-	qcom_geni_serial_stop_rx(uport);
+	if (!uart_console(uport)) {
+		qcom_geni_serial_stop_tx(uport);
+		qcom_geni_serial_stop_rx(uport);
+	}
 }
 
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

