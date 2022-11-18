Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE18462F4A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241828AbiKRM1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241846AbiKRM0c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:26:32 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1609AC83
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:15 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id t4so3509593wmj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j23hZnphv0jcgZfiOY9qWXNDpMCFFj9PRM3bEUKGmc4=;
        b=XgxLUl8pt1XNL0iLDiU427YWuA+WEaiaCkEvGhMxKvHS7AzO0WGlJgFy/efbY2ozcc
         DOQb1IEBoBtO3VW7x+t4MJQYkrfiPsUkhRvFkGp9UAoID4XLDZR8DnoIwBtbmXRAHpOc
         1oAXfiRsZyf4XuQMoOBnck65CaxmocuvADWKoZ3v+xS5uJMkpxOVxStEib7omyU7FG7X
         C0XU2f6TZgVvuoiBIgwqpOGHZ+qbVlVWTpDgUyO2oTqQxS4y7gMJWOMZmlX9oupLSzvj
         V5IED7b3gL8JPqwwin/Vx0dh/ewtVRM8QWnjapPvxRs6gVqFpNBCjdSiH9oBrQFTwi9T
         vmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j23hZnphv0jcgZfiOY9qWXNDpMCFFj9PRM3bEUKGmc4=;
        b=AtKspoOXSobFULYrIbrUEUl7NVv0g30kJ25IFC+p7WM+wIVEY1jte5RRALEsMRJmYd
         ARB/mMetWTh+Nor0ecCzMhizifqVAxDt0iV7eC9wJiijlUK1q0rcplSFSKP/azS+R1n6
         o29xUBX2cMUCVWB+2z64MaJOgolTLk6sufA44WkzO6Ma67va0hzbYe/nUKEuszdzFj8d
         uLI7N6a9SfKdU8atI1RlsKG8e4xSjGmRXHeNhrl9UxCi4Ma4K93xaSYFS4VFcT9uSFmk
         V9ueGcUouFkIzADFMOJlO/3vcP3qb1DqT1donszxZyJChtb0AvY4oV6KaTej4CiZsS8E
         7JMg==
X-Gm-Message-State: ANoB5pmxhQ59l9cCTqQHtct8WHsQL3wrO3T14qz9Bt+kVp/uavnaoDyE
        BBHgaSL8hvxHoLIqfuxnGqs5oA==
X-Google-Smtp-Source: AA0mqf6r1UopoD85mncIUva/+dvusTt3tcZCpOD8lLQGcqCaB9WfI6v27mi+Pj5NXkUPSpwj0H1JlQ==
X-Received: by 2002:a05:600c:19d0:b0:3cf:e7b7:d87d with SMTP id u16-20020a05600c19d000b003cfe7b7d87dmr7852582wmq.95.1668774373630;
        Fri, 18 Nov 2022 04:26:13 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b10c:1279:a704:75d4])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm9873958wmg.46.2022.11.18.04.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:26:13 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 12/15] tty: serial: provide devm_uart_add_one_port()
Date:   Fri, 18 Nov 2022 13:25:36 +0100
Message-Id: <20221118122539.384993-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118122539.384993-1-brgl@bgdev.pl>
References: <20221118122539.384993-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a devres variant of uart_add_one_port() that removes the managed
port at device detach.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../driver-api/driver-model/devres.rst        |  3 ++
 drivers/tty/serial/serial_core.c              | 36 +++++++++++++++++++
 include/linux/serial_core.h                   |  6 ++++
 3 files changed, 45 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 56082265e8e5..5d07a8c1eadb 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -436,6 +436,9 @@ RTC
 SERDEV
   devm_serdev_device_open()
 
+SERIAL
+  devm_uart_add_one_port()
+
 SLAVE DMA ENGINE
   devm_acpi_dma_controller_register()
 
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 179ee199df34..005190b279b3 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3217,6 +3217,42 @@ int uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)
 }
 EXPORT_SYMBOL(uart_remove_one_port);
 
+struct uart_port_devres {
+	struct uart_driver *drv;
+	struct uart_port *port;
+};
+
+static void devm_uart_remove_one_port(struct device *dev, void *data)
+{
+	struct uart_port_devres *res = data;
+
+	uart_remove_one_port(res->drv, res->port);
+}
+
+int devm_uart_add_one_port(struct device *dev,
+			   struct uart_driver *drv, struct uart_port *port)
+{
+	struct uart_port_devres *res;
+	int ret;
+
+	res = devres_alloc(devm_uart_remove_one_port, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return -1;
+
+	ret = uart_add_one_port(drv, port);
+	if (ret) {
+		devres_free(res);
+		return -1;
+	}
+
+	res->drv = drv;
+	res->port = port;
+	devres_add(dev, res);
+
+	return 0;
+}
+EXPORT_SYMBOL(devm_uart_add_one_port);
+
 /**
  * uart_match_port - are the two ports equivalent?
  * @port1: first port
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index d657f2a42a7b..d0911f04706e 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -771,6 +771,12 @@ int uart_remove_one_port(struct uart_driver *reg, struct uart_port *port);
 bool uart_match_port(const struct uart_port *port1,
 		const struct uart_port *port2);
 
+/*
+ * UART devres
+ */
+int devm_uart_add_one_port(struct device *dev,
+			   struct uart_driver *drv, struct uart_port *port);
+
 /*
  * Power Management
  */
-- 
2.37.2

