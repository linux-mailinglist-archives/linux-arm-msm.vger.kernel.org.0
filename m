Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40A76AE4CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 16:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjCGPdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 10:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjCGPdD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 10:33:03 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC7C7C95E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 07:32:50 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id y2so13559286pjg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 07:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678203169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON/hRDAPf2AptDjynSCH9JnA/LFyPWk7i2ryXctmn+Y=;
        b=k/thYJ/FejPWQY4Da3JnlIuxHSfFvf4jPgd0UIQ0b2XdTdjVTjlWvj9Vx0coE8ZGNf
         TSjcSYegW3Cq0PnDGKlL2Mfhd98ZxGSjG6XDb53DyE4nz6OldnbCqYZUKhF9YiHygxIC
         fnVimmDFtsACmxvO0ejshyH9K8EW9IuNupb40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ON/hRDAPf2AptDjynSCH9JnA/LFyPWk7i2ryXctmn+Y=;
        b=v0MZ/BC2f8/gVqquhqB25yqtO7d37yhtsbI9K7P6PxJYRPdVNZJO9cNKTjE/esgpea
         bKbwz8sApOFenQSfHWVRa/EqIXhIFemTOFIKS0Z+4eVsOoGdIRmQJDiDT0bkcAgxgqd8
         6ZWZYk4DV/0hHFUEFcoVSpSHzztLk5Iw/80bJ+JyRBBJ8YUJxltziTn7nMBG4qaqgwkL
         bc2Rp36FbgWkeYN4NUmxWM2ZIJ5CTf9SlsGVFIH4Cp35yi7eIqWthT7WUw8x3oaBxD/h
         VBwojMqk57AVQCic6GYqaxBqfkIIbVf43Sc5tQ7WSYjvbGKUY24XUOKGHT4LF/X0femQ
         z2EA==
X-Gm-Message-State: AO0yUKV8FLZqKmq68aCrbZ/K4zd5g7UrNmtYENGZpnfi8d6cQ8pNfYe4
        NAoXHMBLa8HmxRfe5fqoUMWj5Q==
X-Google-Smtp-Source: AK7set8Pq0zKle5kvg0bl99RxErDbClwVzYTLcHrnnZKDUGJ1OcT5eP48PVWzvKPbEVb5LoqnGRxAA==
X-Received: by 2002:a17:902:7798:b0:19c:bcb1:d8c3 with SMTP id o24-20020a170902779800b0019cbcb1d8c3mr12668737pll.54.1678203169556;
        Tue, 07 Mar 2023 07:32:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2023:7dda:98bb:96dd])
        by smtp.gmail.com with ESMTPSA id jy16-20020a17090342d000b0019719f752c5sm8586843plb.59.2023.03.07.07.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:32:49 -0800 (PST)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] serial: uart_poll_init() should power on the UART
Date:   Tue,  7 Mar 2023 07:32:12 -0800
Message-Id: <20230307073155.2.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Qualcomm devices which use the "geni" serial driver, kdb/kgdb won't
be very happy if you use it but the resources of the port haven't been
powered on. Today kdb/kgdb rely on someone else powering the port
on. This could be the normal kernel console or an agetty running.
Let's fix this to explicitly power things on when setting up a polling
driver.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/serial_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 2bd32c8ece39..b14b5ed6fff4 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2593,6 +2593,7 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 {
 	struct uart_driver *drv = driver->driver_state;
 	struct uart_state *state = drv->state + line;
+	enum uart_pm_state pm_state;
 	struct tty_port *tport;
 	struct uart_port *port;
 	int baud = 9600;
@@ -2610,6 +2611,9 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		goto out;
 	}
 
+	pm_state = state->pm_state;
+	uart_change_pm(state, UART_PM_STATE_ON);
+
 	if (port->ops->poll_init) {
 		/*
 		 * We don't set initialized as we only initialized the hw,
@@ -2626,6 +2630,8 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		console_list_unlock();
 	}
 out:
+	if (ret)
+		uart_change_pm(state, pm_state);
 	mutex_unlock(&tport->mutex);
 	return ret;
 }
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

