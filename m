Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE7CA39B3B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 07:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfFHFE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jun 2019 01:04:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45688 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730353AbfFHFE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jun 2019 01:04:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id s11so2274977pfm.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OPc6kbODFlIcyYEoeSG+YAdIIHdp3uyhG/4PAINTxrk=;
        b=ycYqj/utDSDZvWqoen1KQCkERQbZq7Wr00tpnbsBfyP6prbsSZkHBefD9Y9t+aoDxm
         i5B9gAHqC5rcJEyawiczXqbik8FOdtyb5sYT5Wc8syNCVYfAM5dHuz4GpmMTYzlEwXU+
         7hm3iVDJv8D4pm2wh+7f0pzwalnP5TzHK+pwfDOVYMcfVh2GXZVfqLs3dulvFbUiakma
         yltmxVEW9O8LQo/Kt6QgpWIXIWWkq1ssgRa5IHVhN0ObyV5hdpye3D4op9chjrX0c7Ls
         G5vbZaeI9XX4FKhIVKPT1Rqfa9YWx5b9PuhNbKHXOYpaP6p6g9S7a5espFDIKu6ZeQf+
         NewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OPc6kbODFlIcyYEoeSG+YAdIIHdp3uyhG/4PAINTxrk=;
        b=D8R91MG9kvv3UGOVUnA475b/LqGM9okSFAhOGNWvCKdP5s5+ofj6V2PtP7BL+sdBCd
         b+KgtI3mFnO07K7Lm3S4C5KDYJNU68bdLqe4pg7/F8Xm3BGQOaabQGB6pPwYTwXPBdeW
         JAaeMypihQWa2lcaGaRiU8KHD5GHCZp/nADf2JnuRBU1y8qaQvOGvSJfCQAGC8XDu3NR
         DCT+mdud6LE3yKiuttwqw21j/Ys/uzSYK+EwIjXj7qkDjrw/KD+Nu61IOsNEqQJfhhjA
         ddEIcmjlvh4aywNSJTnTUTnM+Y+V8wd6XSIxrisMpIog7exa+rtnVOAx8SmGaFgV0tdN
         V58Q==
X-Gm-Message-State: APjAAAVMVgb5wqruN+Lj/BDAviXYTnA5XGYx9m5OMU16wVuGQ3UgBXYn
        3jWY88GgJ4beOsQiFO6AtZiavQ==
X-Google-Smtp-Source: APXvYqxn3ouT7PLyMXrOZfIA8iJJZNKJ66gVxyIxMKBKDm9FSBhUxHllnmKvWM5kgZTTMzVXa+HbXA==
X-Received: by 2002:aa7:8102:: with SMTP id b2mr36326194pfi.105.1559970295911;
        Fri, 07 Jun 2019 22:04:55 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b8sm4522482pff.20.2019.06.07.22.04.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 22:04:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
Date:   Fri,  7 Jun 2019 22:04:49 -0700
Message-Id: <20190608050450.12056-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190608050450.12056-1-bjorn.andersson@linaro.org>
References: <20190608050450.12056-1-bjorn.andersson@linaro.org>
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

Changes since v2:
- Moved implementation to Qualcomm driver

 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
 drivers/scsi/ufs/ufs-qcom.c                   | 32 +++++++++++++++++++
 drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index a74720486ee2..d562d8b4919c 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -54,6 +54,8 @@ Optional properties:
 			  PHY reset from the UFS controller.
 - resets            : reset node register
 - reset-names       : describe reset node register, the "rst" corresponds to reset the whole UFS IP.
+- device-reset-gpios	: A phandle and gpio specifier denoting the GPIO connected
+			  to the RESET pin of the UFS memory device.
 
 Note: If above properties are not defined it can be assumed that the supply
 regulators or clocks are always on.
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index ea7219407309..efaf57ba618a 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/gpio/consumer.h>
 #include <linux/reset-controller.h>
 
 #include "ufshcd.h"
@@ -1141,6 +1142,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		goto out_variant_clear;
 	}
 
+	host->device_reset = devm_gpiod_get_optional(dev, "device-reset",
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
@@ -1546,6 +1556,27 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
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
@@ -1566,6 +1597,7 @@ static struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
+	.device_reset		= ufs_qcom_device_reset,
 };
 
 /**
diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
index 68a880185752..b96ffb6804e4 100644
--- a/drivers/scsi/ufs/ufs-qcom.h
+++ b/drivers/scsi/ufs/ufs-qcom.h
@@ -204,6 +204,8 @@ struct ufs_qcom_testbus {
 	u8 select_minor;
 };
 
+struct gpio_desc;
+
 struct ufs_qcom_host {
 	/*
 	 * Set this capability if host controller supports the QUniPro mode
@@ -241,6 +243,8 @@ struct ufs_qcom_host {
 	struct ufs_qcom_testbus testbus;
 
 	struct reset_controller_dev rcdev;
+
+	struct gpio_desc *device_reset;
 };
 
 static inline u32
-- 
2.18.0

