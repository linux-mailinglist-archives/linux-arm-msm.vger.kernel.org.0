Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5835E658E8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 16:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbiL2Pvl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 10:51:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbiL2Pup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 10:50:45 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F69C3A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 07:50:43 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id ay40so13429121wmb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 07:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2MzVRg5qsZeZ18MD/OVh4kRzP+Ug6N74PqvU/3Swas=;
        b=Y5922RWr1l5HBO0JbK7W3Yjs7ASUaSdffFGQQEtjLvvPIEIvPMl8831AoB0e4ATkTn
         6srnJDvyVx2vCYObMMJwu7Ok/5lBuhdxdlf2ucF18O2Xzt/jkCBiSyg/sMDbRM3ZBfIb
         PyTGmtPihb1Xvd8QhM2KhNK1UmojfHGha+kcLYu7xer8H0Y/PbrMCcLSXTiShyhl7zbs
         J+rOnMyw/ITsQE0l3Zg/HcmhcGwznCvl8bKx4UGEGl09jt46KxwrX59JRW5XM6a7FhIc
         arF5yHwcWHqKDF4d1ZCrAd+ZRF8i5Z55YG+IsQh3My0iQJ+JfXM/pzhPCCA+VN3psBr5
         IMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2MzVRg5qsZeZ18MD/OVh4kRzP+Ug6N74PqvU/3Swas=;
        b=DuRnB48Vv1RHi7FNxdA25Aq7w1LyOqPV20ahn8h+VaqzApG4GpguWLRuMMznlcFCLW
         P8k6Jr7tRocUYMzKIb0zsjtjZU2mmPiE2dV0VCZPFGUTcqCDT/CvMx7LKyWAvS4CV9rw
         qiuMN35w5QgG8MJN6WUgx244k0wCjRsOTPQM6vlBZyZwZeobA1baO2+769VAYRMsjr6e
         XoI2J/U7cCuvZtwkcp9vvXehCADJCSsKQpK9/NoSpM9QnSd5EbO5tYnzPJUeZm7RIr7+
         Ru2FIYleNCETARlma16WMNxX7UrWqoFXRNgZXsuhXTFgrFVx+n9AqUF5lTD4ZB6biKHV
         pKMg==
X-Gm-Message-State: AFqh2ko7H+5L4b7oM+YHDeowqeD5SCuma51rXp4W6ti3jh40I1CIDtz1
        lM2nwhvs3yG0VbamsCsXbS7/XA==
X-Google-Smtp-Source: AMrXdXtAkLnVo2ai/aPmHEOE8d9cd2QOOnUgDCzL++zMq+TxIIn/2285ryyO5APeXNQ7SkrNT1EWjg==
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id g8-20020a7bc4c8000000b003d35a4a9101mr23683301wmk.23.1672329041742;
        Thu, 29 Dec 2022 07:50:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8f7a:98d8:9d8d:ced8])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b003cfa81e2eb4sm25251647wmb.38.2022.12.29.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 07:50:41 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v6 08/14] tty: serial: qcom-geni-serial: remove unneeded tabs
Date:   Thu, 29 Dec 2022 16:50:24 +0100
Message-Id: <20221229155030.418800-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221229155030.418800-1-brgl@bgdev.pl>
References: <20221229155030.418800-1-brgl@bgdev.pl>
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

Remove redundant indentation in struct member assignment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 92aefd4f8527..e34fe56247d9 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -141,26 +141,26 @@ static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port *uport)
 static struct qcom_geni_serial_port qcom_geni_uart_ports[GENI_UART_PORTS] = {
 	[0] = {
 		.uport = {
-				.iotype = UPIO_MEM,
-				.ops = &qcom_geni_uart_pops,
-				.flags = UPF_BOOT_AUTOCONF,
-				.line = 0,
+			.iotype = UPIO_MEM,
+			.ops = &qcom_geni_uart_pops,
+			.flags = UPF_BOOT_AUTOCONF,
+			.line = 0,
 		},
 	},
 	[1] = {
 		.uport = {
-				.iotype = UPIO_MEM,
-				.ops = &qcom_geni_uart_pops,
-				.flags = UPF_BOOT_AUTOCONF,
-				.line = 1,
+			.iotype = UPIO_MEM,
+			.ops = &qcom_geni_uart_pops,
+			.flags = UPF_BOOT_AUTOCONF,
+			.line = 1,
 		},
 	},
 	[2] = {
 		.uport = {
-				.iotype = UPIO_MEM,
-				.ops = &qcom_geni_uart_pops,
-				.flags = UPF_BOOT_AUTOCONF,
-				.line = 2,
+			.iotype = UPIO_MEM,
+			.ops = &qcom_geni_uart_pops,
+			.flags = UPF_BOOT_AUTOCONF,
+			.line = 2,
 		},
 	},
 };
-- 
2.37.2

