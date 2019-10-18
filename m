Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF32DBCF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 07:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732895AbfJRFY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 01:24:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34927 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395262AbfJRFYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 01:24:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id p30so2705373pgl.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 22:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCHFSyaag0fV1b4EweLCBFXNBv8kfZEJeYucJn2bT6s=;
        b=hw4u9oULAXd4AgBXp/9AkA/ZPr6fbU5xbqz+K4prhY2sBWfo6tcRdGLwkUIANg0L0f
         P2yLfr36x3oE0QkslOhGU+UDIxrQjvWRODCZdl6Y28FDVIY9hR8ejkxbnY1kOsK5ZIpz
         ytvLYeIH4v35kAltNoItGw13qjJptaT1zPStmQ+vK9RrdlyrizLKUfQ3rbUOsOcjpbiG
         ZIcw3HIPXjrylIN94yNLpR3+MKld5fYz1/keO7Ap0ElxG3eQpMCiZjjjK9Vtn5Ck/PU6
         722cqOBCeyGm3LVzIepS8zG5qF+e65mB+X/fpp623lIqID98jPJt7WDR7quxYdizaOCr
         qzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCHFSyaag0fV1b4EweLCBFXNBv8kfZEJeYucJn2bT6s=;
        b=JOPw1Fq0c5yKKFmsUQOvlSTldXceRh0t/ttjhg/gw+uWLbqR9DnPsAt7bC7E/oeEz8
         zZoDYQy1E0F1dxnyZBgxjGzoFxpQNf/gmzDBKB9poFWwUvZoy4J/0zmzTJjkxnjcOxAL
         y18Z2MrzVUDgbwh4527LzPLY2h4WIwpdreQUf1rmlReNgHfFnGF7VQTw0/1nbSiCIPQ7
         W9XOpw0Pk744vOMk+V+NYCN3JEfRpFVhjqlmWtAFXBRUquMm75ND6Jvr+GWgzRZmBJUm
         pJEVsiwOLxQQEXfoIqc2CKaI0iefJXJDPIoe9IrG2FKs1tLEo7RBcUk3dHQYgvVKqHT4
         uP9g==
X-Gm-Message-State: APjAAAUAorR6c3dcXZgHqGdrjamobTfauH/RLwxPni81k8lcH49LW6aD
        FV5AUzOb/o0Fv4LHYV42mDLmbcutbYo=
X-Google-Smtp-Source: APXvYqxiYxLZewwp9KcTgIFmEdtCpwB0laxma0SN+SBePnLsJMhJ+CE7AhZMTyxGFreXWcaDl2FgFw==
X-Received: by 2002:a62:6842:: with SMTP id d63mr4426461pfc.166.1571376251002;
        Thu, 17 Oct 2019 22:24:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u11sm2178760pgc.61.2019.10.17.22.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 22:24:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/4] Bluetooth: hci_qca: Don't vote for specific voltage
Date:   Thu, 17 Oct 2019 22:24:02 -0700
Message-Id: <20191018052405.3693555-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Devices with specific voltage requirements should not request voltage
from the driver, but instead rely on the system configuration to define
appropriate voltages for each rail.

This ensures that PMIC and board variations are accounted for, something
that the 0.1V range in the hci_qca driver currently tries to address.
But on the Lenovo Yoga C630 (with wcn3990) vddch0 is 3.1V, which means
the driver will fail to set the voltage.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c07c529b0d81..54aafcc69d06 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -130,8 +130,6 @@ enum qca_speed_type {
  */
 struct qca_vreg {
 	const char *name;
-	unsigned int min_uV;
-	unsigned int max_uV;
 	unsigned int load_uA;
 };
 
@@ -1332,10 +1330,10 @@ static const struct hci_uart_proto qca_proto = {
 static const struct qca_vreg_data qca_soc_data_wcn3990 = {
 	.soc_type = QCA_WCN3990,
 	.vregs = (struct qca_vreg []) {
-		{ "vddio",   1800000, 1900000,  15000  },
-		{ "vddxo",   1800000, 1900000,  80000  },
-		{ "vddrf",   1300000, 1350000,  300000 },
-		{ "vddch0",  3300000, 3400000,  450000 },
+		{ "vddio", 15000  },
+		{ "vddxo", 80000  },
+		{ "vddrf", 300000 },
+		{ "vddch0", 450000 },
 	},
 	.num_vregs = 4,
 };
@@ -1343,10 +1341,10 @@ static const struct qca_vreg_data qca_soc_data_wcn3990 = {
 static const struct qca_vreg_data qca_soc_data_wcn3998 = {
 	.soc_type = QCA_WCN3998,
 	.vregs = (struct qca_vreg []) {
-		{ "vddio",   1800000, 1900000,  10000  },
-		{ "vddxo",   1800000, 1900000,  80000  },
-		{ "vddrf",   1300000, 1352000,  300000 },
-		{ "vddch0",  3300000, 3300000,  450000 },
+		{ "vddio", 10000  },
+		{ "vddxo", 80000  },
+		{ "vddrf", 300000 },
+		{ "vddch0", 450000 },
 	},
 	.num_vregs = 4,
 };
@@ -1386,13 +1384,6 @@ static int qca_power_off(struct hci_dev *hdev)
 static int qca_enable_regulator(struct qca_vreg vregs,
 				struct regulator *regulator)
 {
-	int ret;
-
-	ret = regulator_set_voltage(regulator, vregs.min_uV,
-				    vregs.max_uV);
-	if (ret)
-		return ret;
-
 	return regulator_enable(regulator);
 
 }
@@ -1401,7 +1392,6 @@ static void qca_disable_regulator(struct qca_vreg vregs,
 				  struct regulator *regulator)
 {
 	regulator_disable(regulator);
-	regulator_set_voltage(regulator, 0, vregs.max_uV);
 
 }
 
-- 
2.23.0

