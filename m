Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C651A0A52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 21:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfH1TSO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 15:18:14 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35239 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfH1TSE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 15:18:04 -0400
Received: by mail-pl1-f196.google.com with SMTP id gn20so420903plb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 12:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=peYkc8bpnDp6jFbXtkwKHOUEOwA9yyWEoa4Q9aEgSqo=;
        b=AFwFkCbwz63sJkbk32teOrITW/PxPxz4IF3E60WGCC6OIkYgPjzJSp1x7aiVGloV89
         A4uKhTR4+72TgIhhMk3aWziPHvzqP0HeYcmoHdfilhX66Y1mMr9h8pFru1N4BoVW+TI3
         0bTriWTQ9pTYyp4T40Ovwi8X0YboAI2w8vwO3wVWVR2ZmNP1uTjxRccGoZGnvCOI1tQN
         N184XnZqBtgT/eO0a37h7hSBchxRf+7/0PDYYjjmHqzqGjtfC8/8HN6mpqOE9jpA3smd
         5X1x8XQLUJXnd8RDqF7+6RztHUb74CDvTbltYi6eRQjdu2uciJ+H5xMQqgc26X9PQt2d
         79pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=peYkc8bpnDp6jFbXtkwKHOUEOwA9yyWEoa4Q9aEgSqo=;
        b=ZV4MjcUafIgJg7GnzdmvoedmEF7L2V767E7RBnBsd8qVasbci7tcCYblwpItJdH21R
         EN7F/+UkLdMJ4W2dsTTkdM3hMe/O0H3daqWpHI96jsf1pOiOKnfeno5Hkgjro4i1KysT
         03yqUk+pdzQED4qCPrNGlTiPDDXXpHu/VeHSeML0BC9WWT6FpWdAWEzVuN5jRYYYa0sP
         q+1/vY3MxtBjkEHNHCRuouE5RGljdZKEIfLObAipsuNc9HW/EW3g0jFdnqiDN0lFoUYo
         rRZer5xXoSAr+CaZZ5QKUbX3BQkNE1zODBCfT2PU6gHkBDVNlhIb5C2pwhuBbCpYLyCn
         Q6NA==
X-Gm-Message-State: APjAAAVzV9eyu2CIcLLHPTd9qbDc2Wnt5WqsBbkrscRj8MTdOHi6mSTv
        y7FA/H2Q6koAEwMZRXXH05+J8g==
X-Google-Smtp-Source: APXvYqybIMSlWnXZB7dwowyvH/Nncyh1fSLknh4G6/YETH495I0ZI/Wu7VCVHUtdSGq+TuI+zjgunA==
X-Received: by 2002:a17:902:96a:: with SMTP id 97mr5909479plm.264.1567019883819;
        Wed, 28 Aug 2019 12:18:03 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n128sm122717pfn.46.2019.08.28.12.18.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 12:18:03 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Andy Gross <agross@kernel.org>, Bean Huo <beanhuo@micron.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 2/3] scsi: ufs-qcom: Implement device_reset vops
Date:   Wed, 28 Aug 2019 12:17:55 -0700
Message-Id: <20190828191756.24312-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
through the GPIO framework. Acquire the device-reset GPIO and use this
to implement the device_reset vops, to allow resetting the attached
memory.

Based on downstream support implemented by Subhash Jadavani
<subhashj@codeaurora.org>.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Renamed device-reset-gpios to just reset-gpios.
- Explicitly bail on !host->device_reset, to not rely on passing NULL to
  gpiod_set_value_cansleep()

 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
 drivers/scsi/ufs/ufs-qcom.c                   | 36 +++++++++++++++++++
 drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
 3 files changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index a74720486ee2..d78ef63935f9 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -54,6 +54,8 @@ Optional properties:
 			  PHY reset from the UFS controller.
 - resets            : reset node register
 - reset-names       : describe reset node register, the "rst" corresponds to reset the whole UFS IP.
+- reset-gpios       : A phandle and gpio specifier denoting the GPIO connected
+		      to the RESET pin of the UFS memory device.
 
 Note: If above properties are not defined it can be assumed that the supply
 regulators or clocks are always on.
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 4473f339cbc0..2200c8434ef3 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/gpio/consumer.h>
 #include <linux/reset-controller.h>
 
 #include "ufshcd.h"
@@ -1140,6 +1141,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		}
 	}
 
+	host->device_reset = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(host->device_reset)) {
+		err = PTR_ERR(host->device_reset);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "failed to acquire reset gpio: %d\n", err);
+		goto out_variant_clear;
+	}
+
 	err = ufs_qcom_bus_register(host);
 	if (err)
 		goto out_variant_clear;
@@ -1545,6 +1555,31 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 	usleep_range(1000, 1100);
 }
 
+/**
+ * ufs_qcom_device_reset() - toggle the (optional) device reset line
+ * @hba: per-adapter instance
+ *
+ * Toggles the (optional) reset line to reset the attached device.
+ */
+static void ufs_qcom_device_reset(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	/* reset gpio is optional */
+	if (!host->device_reset)
+		return;
+
+	/*
+	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
+	 * be on the safe side.
+	 */
+	gpiod_set_value_cansleep(host->device_reset, 1);
+	usleep_range(10, 15);
+
+	gpiod_set_value_cansleep(host->device_reset, 0);
+	usleep_range(10, 15);
+}
+
 /**
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1565,6 +1600,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
+	.device_reset		= ufs_qcom_device_reset,
 };
 
 /**
diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
index 001915d1e0e4..d401f174bb70 100644
--- a/drivers/scsi/ufs/ufs-qcom.h
+++ b/drivers/scsi/ufs/ufs-qcom.h
@@ -195,6 +195,8 @@ struct ufs_qcom_testbus {
 	u8 select_minor;
 };
 
+struct gpio_desc;
+
 struct ufs_qcom_host {
 	/*
 	 * Set this capability if host controller supports the QUniPro mode
@@ -232,6 +234,8 @@ struct ufs_qcom_host {
 	struct ufs_qcom_testbus testbus;
 
 	struct reset_controller_dev rcdev;
+
+	struct gpio_desc *device_reset;
 };
 
 static inline u32
-- 
2.18.0

