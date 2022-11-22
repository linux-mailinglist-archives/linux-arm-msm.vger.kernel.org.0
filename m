Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67B596339EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 11:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbiKVKXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 05:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232970AbiKVKWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 05:22:11 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBBA6158
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 02:21:55 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso925974wmb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 02:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3G5fO4wTgQLmAcQSoo34y5bVfGZW9g4LW34a2D3VvA=;
        b=KJyK8MfSWfrc4rC2Zkedu9dXmu7sCfaGzpAr/Fb2RwQf+OEOysG8VS/C1CdLRuu8oU
         FkjQ5bQiMByI94zbTMKQB6WG3DPe93S7NyYzXMES+UPGNu+8CS4bnqSQhoZqJO8Cu2UF
         l6z0ay3iLonF8ILw4uB6Qbs3owHDZ6547HxsQUrHmYxicToSx5IJ/IzHlZIxHog2JtCD
         A/dkTVnlWljJHmXfF2oPAGqnKoijFOV/Kd2dfhM2JeA4YphuJ57UGQaL7sWREcKmc/yr
         /byQ+DSr1pfCMqfdWOMPUonOp6AJIn2MZB6WAFPLrq2vUOUaQuDhlEQgcVy2Q3081PL1
         A6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3G5fO4wTgQLmAcQSoo34y5bVfGZW9g4LW34a2D3VvA=;
        b=kGWM3bQrvUhml+pI2oso4eJxXRiGboYPpnKdCfgPRxoyJsEP4qTywYf+kkmpKXiewV
         9REFfg6lhF69CaF//LzXTx1Tpr8p2LTrVSms7HmDmr6wlPeOtjrny8rrP6IPqzDHfBDF
         wbWU9Z+4rcmS+PPL0ppXOIzoZA5qvuwZ3MA1sNxJGZOtBlkBbEwLncPONl6+pF1wLCGD
         hL0IYE/CjSCas//Zj4G0c5GnS2aLRSRSg6FJkq461tN2URgUxJju5K23vNOQSxdGtLUI
         I464PxZWW+CxkGwSc8T5eT0v4wUb0h86Sn2ZahOgMyoLQFkZo3Y4soiyadhinDX1aEmU
         Ot8g==
X-Gm-Message-State: ANoB5pmOcV5qR11s4v1fANv9co6MeD4PcasP19NibOVdIlIc/gei2qMw
        XIoXMN0eFjgMFzZWgqmOFGpTvw==
X-Google-Smtp-Source: AA0mqf7UtJVhOpuxEfqOmfdJ7uiz6mBk4TYK5xLxPVNQC24s+U4cvUEeWY4TYjct7XiOmHDXomcxgg==
X-Received: by 2002:a1c:f616:0:b0:3cf:b1c2:c911 with SMTP id w22-20020a1cf616000000b003cfb1c2c911mr8610482wmc.16.1669112513688;
        Tue, 22 Nov 2022 02:21:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e011:9e81:66f1:3415])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d4083000000b002366e8eee11sm13432873wrp.101.2022.11.22.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:21:53 -0800 (PST)
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 13/15] tty: serial: qcom-geni-serial: use devres for uart port management
Date:   Tue, 22 Nov 2022 11:21:23 +0100
Message-Id: <20221122102125.142075-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221122102125.142075-1-brgl@bgdev.pl>
References: <20221122102125.142075-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Shrink and simplify the probe() and remove() code by using the managed
variant of uart_add_one_port.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 82242a40a95a..53d09da0854a 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1454,7 +1454,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->private_data = &port->private_data;
 	platform_set_drvdata(pdev, port);
 
-	ret = uart_add_one_port(drv, uport);
+	ret = devm_uart_add_one_port(&pdev->dev, drv, uport);
 	if (ret)
 		return ret;
 
@@ -1463,7 +1463,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			IRQF_TRIGGER_HIGH, port->name, uport);
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-		uart_remove_one_port(drv, uport);
 		return ret;
 	}
 
@@ -1480,7 +1479,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 						port->wakeup_irq);
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
-			uart_remove_one_port(drv, uport);
 			return ret;
 		}
 	}
@@ -1490,12 +1488,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 static int qcom_geni_serial_remove(struct platform_device *pdev)
 {
-	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
-	struct uart_driver *drv = port->private_data.drv;
-
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-	uart_remove_one_port(drv, &port->uport);
 
 	return 0;
 }
-- 
2.37.2

