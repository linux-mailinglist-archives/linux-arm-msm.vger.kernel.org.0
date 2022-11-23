Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C5B635B2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 12:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237539AbiKWLJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 06:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237183AbiKWLIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 06:08:35 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD7DB0422
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:16 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso1030513wmp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBSJ9X9pr9Z0i2+NFcnle+eN9VzlxNW46WoYTtGtQAo=;
        b=ja4+W1jEpsH8IErFm7dMfOR6osTp3PvRK/79rIXT0E+hHFA5TgZynARrHm1/8P3WnR
         EJt1uCTQKkJxt2DdA4lpEzHSNSq/FUNk/JGIwbSIl7yzE1uR5W+Z9l+a69RC63LmUHl1
         n5ZmZ/4m51Z7+ZZPJTkVwcooV7FndRr4kiiCUZ7OD+bxCO7pgWDapJgVH7fkdi8A3RFd
         510VYT98Hik+yO6mhv5z3eP7DEAjnKnJKmlDIW/gnF6lIlC/5FYtzZJX8fDE0/+rhRky
         w7dhyStbmJyQ7C8Ah+mhPXG8g/8h3GQ37ubmGb8n+w1ZJH0IFf9B+sJa6DHBWZN3vr8a
         s66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBSJ9X9pr9Z0i2+NFcnle+eN9VzlxNW46WoYTtGtQAo=;
        b=r4XBLz4SFqYLdyTbvXvTFjI+o3T17ZZ2zo3oWAW/6Yg22rzkn3ub0F3qiQOhQdLjZ0
         8X8Qe/YhdjglIZTMV3R4yLA6DQ1djtRZ0pKyeEvkXwxGBpo5HGeB0KHpnEk1rhCex7PI
         EGdSdk6OPMkDtCLdRp0PHRUdYcZunBKGnUmy7m0Sflv/mQmtIY1vQs6+CT2hCFiNaXN8
         P3LwhL7mRU3APTbpTsAEb0kctoradyBthb5uNmJe7IBu5j51CYmSDZZD2eaOf3muw3FT
         gRZpM7lph5MVowRC9Zk54yvdvPmpRY37+k+/OA9SA3aqYpbHhe63bybFbrhJf++cka6k
         x8sw==
X-Gm-Message-State: ANoB5pl9gM6M8S8is3LrlOkYHqdOcrR7k/C3JUdtzzi0Z/UTK+QS8+0Y
        rcr26wE9W9PPYlpZNz37a9BbGQ==
X-Google-Smtp-Source: AA0mqf6vsa+V+vsSi3bWTVFs3TJdUlWUuW5z8+WoTDBQzJSHc/V3on/vqmuOTF0NzH09nBzYfRK6Gw==
X-Received: by 2002:a05:600c:654c:b0:3d0:110c:d25f with SMTP id dn12-20020a05600c654c00b003d0110cd25fmr13782378wmb.125.1669201695202;
        Wed, 23 Nov 2022 03:08:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae74:d94f:4677:3378])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm2560406wmq.36.2022.11.23.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:08:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 11/13] tty: serial: qcom-geni-serial: stop operations in progress at shutdown
Date:   Wed, 23 Nov 2022 12:07:57 +0100
Message-Id: <20221123110759.1836666-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221123110759.1836666-1-brgl@bgdev.pl>
References: <20221123110759.1836666-1-brgl@bgdev.pl>
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

We don't stop transmissions in progress at shutdown. This is fine with
FIFO SE mode but with DMA it causes trouble so fix it now.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 036231106321..82242a40a95a 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -865,6 +865,9 @@ static void get_tx_fifo_size(struct qcom_geni_serial_port *port)
 
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
+	qcom_geni_serial_stop_tx(uport);
+	qcom_geni_serial_stop_rx(uport);
+
 	disable_irq(uport->irq);
 }
 
-- 
2.37.2

